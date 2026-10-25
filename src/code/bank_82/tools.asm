; Bank $82 module "tools" - starts at $828FB1
 
 
fToolUsedSound_PlayToolHit:
    SEP #$20                                                   ;828FB1|E220    |      ;
    LDA.B #$00                                                 ;828FB3|A900    |      ; A = 0
    XBA                                                        ;828FB5|EB      |      ; A <-> B
    LDA.W strcPlayerData.toolSound                             ;828FB6|AD2209  |000922;
    CMP.B #$02                                                 ;828FB9|C902    |      ;
    BEQ .return                                                ;828FBB|F035    |828FF2;
    REP #$20                                                   ;828FBD|C220    |      ;
    STA.B strcVariables.n16Temp2                               ;828FBF|8580    |000080; $80 = $0922
    SEP #$20                                                   ;828FC1|E220    |      ;
    LDA.B #$00                                                 ;828FC3|A900    |      ;
    XBA                                                        ;828FC5|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;828FC6|AD2109  |000921;
    REP #$20                                                   ;828FC9|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;828FCB|857E    |00007E;
    ASL A                                                      ;828FCD|0A      |      ;
    CLC                                                        ;828FCE|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;828FCF|657E    |00007E;
    TAX                                                        ;828FD1|AA      |      ;
    SEP #$20                                                   ;828FD2|E220    |      ;
    LDA.L nToolSoundData_829054,X                              ;828FD4|BF549082|829054; X = nToolEquipped * 3
    STA.W strcAudio.reg115                                     ;828FD8|8D1501  |000115;
    INX                                                        ;828FDB|E8      |      ; X++
    REP #$20                                                   ;828FDC|C220    |      ;
    TXA                                                        ;828FDE|8A      |      ;
    CLC                                                        ;828FDF|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;828FE0|6580    |000080;
    TAX                                                        ;828FE2|AA      |      ;
    SEP #$20                                                   ;828FE3|E220    |      ;
    LDA.L nToolSoundData_829054,X                              ;828FE5|BF549082|829054; X = nToolEquipped * 3 + $0922
    BEQ .return                                                ;828FE9|F007    |828FF2;
    STA.W strcAudio.reg114                                     ;828FEB|8D1401  |000114;
    JSL.L fAudioSetRegister2to0A                               ;828FEE|22328383|838332;
 
.return:
    RTL                                                        ;828FF2|6B      |      ;
 
 
fToolUsedSound_PlayOnToolChange:
    SEP #$20                                                   ;828FF3|E220    |      ;
    LDA.B #$00                                                 ;828FF5|A900    |      ;
    XBA                                                        ;828FF7|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;828FF8|AD2109  |000921;
    CMP.W strcAudio.toolId                                     ;828FFB|CD1901  |000119;
    BEQ .return                                                ;828FFE|F04B    |82904B;
    REP #$20                                                   ;829000|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;829002|857E    |00007E;
    ASL A                                                      ;829004|0A      |      ;
    CLC                                                        ;829005|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;829006|657E    |00007E;
    TAX                                                        ;829008|AA      |      ;
    SEP #$20                                                   ;829009|E220    |      ;
    LDA.L nToolSoundData_829054,X                              ;82900B|BF549082|829054;
    BEQ .return                                                ;82900F|F03A    |82904B;
    STA.W strcAudio.reg115                                     ;829011|8D1501  |000115;
    INX                                                        ;829014|E8      |      ;
    PHX                                                        ;829015|DA      |      ;
    LDA.L nToolSoundData_829054,X                              ;829016|BF549082|829054;
    BEQ +                                                      ;82901A|F01C    |829038;
    STA.W strcAudio.reg114                                     ;82901C|8D1401  |000114;
    SEP #$20                                                   ;82901F|E220    |      ;
    LDA.B #$00                                                 ;829021|A900    |      ;
    XBA                                                        ;829023|EB      |      ;
    LDA.W strcAudio.unk118                                     ;829024|AD1801  |000118;
    REP #$20                                                   ;829027|C220    |      ;
    TAX                                                        ;829029|AA      |      ;
    SEP #$20                                                   ;82902A|E220    |      ;
    LDA.L nToolSoundData_80B8CD,X                              ;82902C|BFCDB880|80B8CD;
    INC A                                                      ;829030|1A      |      ;
    STA.W strcAudio.index                                      ;829031|8D0301  |000103;
    JSL.L fAudio_PrepareSoundEffectSample                                 ;829034|223E8383|83833E;
 
  + SEP #$20                                                   ;829038|E220    |      ;
    REP #$10                                                   ;82903A|C210    |      ;
    PLX                                                        ;82903C|FA      |      ;
    INX                                                        ;82903D|E8      |      ;
    LDA.L nToolSoundData_829054,X                              ;82903E|BF549082|829054;
    BEQ .return                                                ;829042|F007    |82904B;
    STA.W strcAudio.reg114                                     ;829044|8D1401  |000114;
    JSL.L fAudio_PrepareSoundEffectSample                                 ;829047|223E8383|83833E;
 
.return:
    SEP #$20                                                   ;82904B|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;82904D|AD2109  |000921;
    STA.W strcAudio.toolId                                     ;829050|8D1901  |000119;
    RTL                                                        ;829053|6B      |      ;
 
 
nToolSoundData_829054:
    db $00,$00,$00,$06,$14,$12,$06,$11,$0F,$06,$17,$17         ;829054|        |      ; 0x1C * [n8 nIndex, n8 nVal1, n8 nVal2]
    db $06,$11,$15,$06,$1B,$1B,$06,$1B,$1B,$06,$1B,$1B         ;829060|        |      ;
    if !REGION_DE
    db $06,$1B,$1B,$06,$00,$00,$06,$00,$00,$06,$00,$00
    else
    db $06,$1B,$1B,$06,$00,$00,$06,$00,$00,$06,$00,$19         ;82906C|        |      ;
    endif
    db $06,$1B,$1B,$06,$00,$00,$06,$00,$00,$06,$00,$00         ;829078|        |      ;
    db $07,$28,$28,$06,$14,$13,$06,$11,$10,$06,$18,$18         ;829084|        |      ;
    db $06,$11,$16,$07,$28,$28,$00,$00,$00,$00,$00,$00         ;829090|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82909C|        |      ;
 
fToolUsedAnimationHandler:
    SEP #$20                                                   ;8290A8|E220    |      ;
    REP #$10                                                   ;8290AA|C210    |      ;
    %CheckPlayerFlags(!PFLAGS_OUTOFSTAMINA)
    BEQ +                                                      ;8290B3|F003    |8290B8;
    JMP.W .label1                                              ;8290B5|4CCD90  |8290CD;
 
 
  + JSR.W fToolUsed_StoreSoundForFrontTile                              ;8290B8|207D92  |82927D;
    SEP #$20                                                   ;8290BB|E220    |      ;
    STZ.W strcPlayerData.unkCounter91B                         ;8290BD|9C1B09  |00091B;
    LDA.B #$00                                                 ;8290C0|A900    |      ;
    XBA                                                        ;8290C2|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;8290C3|AD2109  |000921;
    ASL A                                                      ;8290C6|0A      |      ;
    TAX                                                        ;8290C7|AA      |      ;
    if !REGION_DE
    JSR.W (aToolUsedAnimationTable,X)                      ;829285|FC48A7  |      ;
    else
    JSR.W (aToolUsedAnimationTable,X)                          ;8290C8|FC8BA5  |82A58B;
    endif
    BRA .return                                                ;8290CB|800F    |8290DC;
 
 
.label1:
    REP #$20                                                   ;8290CD|C220    |      ;
    LDA.W #$004D                                               ;8290CF|A94D00  |      ;
    STA.W strcObjectData.spriteIdx                             ;8290D2|8D0109  |000901;
    %SetPlayerAction(!PACTION_TIRED)
 
.return:
    RTL                                                        ;8290DC|6B      |      ;
 
 
fToolUsedAnimation0x00_Empty:
    RTS                                                        ;8290DD|60      |      ;
 
 
fToolUsedAnimation0x01_Sickle:
    REP #$30                                                   ;8290DE|C230    |      ;
    REP #$30                                                   ;8290E0|C230    |      ;
    LDA.W #$0050                                               ;8290E2|A95000  |      ;
    CLC                                                        ;8290E5|18      |      ;
    ADC.B strcPlayer.direction                                 ;8290E6|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;8290E8|8D0109  |000901;
    RTS                                                        ;8290EB|60      |      ;
 
 
fToolUsedAnimation0x02_Plow:
    REP #$30                                                   ;8290EC|C230    |      ;
    REP #$30                                                   ;8290EE|C230    |      ;
    LDA.W #$0054                                               ;8290F0|A95400  |      ;
    CLC                                                        ;8290F3|18      |      ;
    ADC.B strcPlayer.direction                                 ;8290F4|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;8290F6|8D0109  |000901;
    RTS                                                        ;8290F9|60      |      ;
 
 
fToolUsedAnimation0x03_Hammer:
    REP #$30                                                   ;8290FA|C230    |      ;
    REP #$30                                                   ;8290FC|C230    |      ;
    LDA.W #$0058                                               ;8290FE|A95800  |      ;
    CLC                                                        ;829101|18      |      ;
    ADC.B strcPlayer.direction                                 ;829102|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;829104|8D0109  |000901;
    RTS                                                        ;829107|60      |      ;
 
 
fToolUsedAnimation0x04_Axe:
    REP #$30                                                   ;829108|C230    |      ;
    REP #$30                                                   ;82910A|C230    |      ;
    LDA.W #$005C                                               ;82910C|A95C00  |      ;
    CLC                                                        ;82910F|18      |      ;
    ADC.B strcPlayer.direction                                 ;829110|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;829112|8D0109  |000901;
    RTS                                                        ;829115|60      |      ;
 
 
fToolUsedAnimation0x05_CornSeedBag:
    REP #$30                                                   ;829116|C230    |      ;
    REP #$30                                                   ;829118|C230    |      ;
    LDA.W #$0046                                               ;82911A|A94600  |      ;
    STA.W strcObjectData.spriteIdx                             ;82911D|8D0109  |000901;
    RTS                                                        ;829120|60      |      ;
 
 
fToolUsedAnimation0x06_TomatoSeedBag:
    REP #$30                                                   ;829121|C230    |      ;
    REP #$30                                                   ;829123|C230    |      ;
    LDA.W #$0046                                               ;829125|A94600  |      ;
    STA.W strcObjectData.spriteIdx                             ;829128|8D0109  |000901;
    RTS                                                        ;82912B|60      |      ;
 
 
fToolUsedAnimation0x07_PotatoSeedBag:
    REP #$30                                                   ;82912C|C230    |      ;
    REP #$30                                                   ;82912E|C230    |      ;
    LDA.W #$0046                                               ;829130|A94600  |      ;
    STA.W strcObjectData.spriteIdx                             ;829133|8D0109  |000901;
    RTS                                                        ;829136|60      |      ;
 
 
fToolUsedAnimation0x08_TurnipSeedBag:
    REP #$30                                                   ;829137|C230    |      ;
    REP #$30                                                   ;829139|C230    |      ;
    LDA.W #$0046                                               ;82913B|A94600  |      ;
    STA.W strcObjectData.spriteIdx                             ;82913E|8D0109  |000901;
    RTS                                                        ;829141|60      |      ;
 
 
fToolUsedAnimation0x09_CowMedicine:
    REP #$30                                                   ;829142|C230    |      ;
    REP #$30                                                   ;829144|C230    |      ;
    LDA.W #$00AC                                               ;829146|A9AC00  |      ;
    CLC                                                        ;829149|18      |      ;
    ADC.B strcPlayer.direction                                 ;82914A|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;82914C|8D0109  |000901;
    RTS                                                        ;82914F|60      |      ;
 
 
fToolUsedAnimation0x0A_MiraclePotion:
    REP #$30                                                   ;829150|C230    |      ;
    REP #$30                                                   ;829152|C230    |      ;
    LDA.W #$00AC                                               ;829154|A9AC00  |      ;
    CLC                                                        ;829157|18      |      ;
    ADC.B strcPlayer.direction                                 ;829158|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;82915A|8D0109  |000901;
    RTS                                                        ;82915D|60      |      ;
 
 
fToolUsedAnimation0x0B_Bell:
    REP #$30                                                   ;82915E|C230    |      ;
    REP #$30                                                   ;829160|C230    |      ;
    LDA.W #$0060                                               ;829162|A96000  |      ;
    CLC                                                        ;829165|18      |      ;
    ADC.B strcPlayer.direction                                 ;829166|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;829168|8D0109  |000901;
    REP #$20                                                   ;82916B|C220    |      ;
    %SetFlag(daily1, $0010)
    RTS                                                        ;829178|60      |      ;
 
 
fToolUsedAnimation0x0C_GrassSeedBag:
    REP #$30                                                   ;829179|C230    |      ;
    REP #$30                                                   ;82917B|C230    |      ;
    LDA.W #$0046                                               ;82917D|A94600  |      ;
    STA.W strcObjectData.spriteIdx                             ;829180|8D0109  |000901;
    RTS                                                        ;829183|60      |      ;
 
 
fToolUsedAnimation0x0D_Paint:
    REP #$30                                                   ;829184|C230    |      ;
    LDA.W #$0044                                               ;829186|A94400  |      ;
    STA.W strcObjectData.spriteIdx                             ;829189|8D0109  |000901;
    RTS                                                        ;82918C|60      |      ;
 
 
fToolUsedAnimation0x0E_Milker:
    REP #$30                                                   ;82918D|C230    |      ;
    REP #$30                                                   ;82918F|C230    |      ;
    LDA.W #$0078                                               ;829191|A97800  |      ;
    CLC                                                        ;829194|18      |      ;
    ADC.B strcPlayer.direction                                 ;829195|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;829197|8D0109  |000901;
    RTS                                                        ;82919A|60      |      ;
 
 
fToolUsedAnimation0x0F_Brush:
    REP #$30                                                   ;82919B|C230    |      ;
    REP #$30                                                   ;82919D|C230    |      ;
    LDA.W #$0064                                               ;82919F|A96400  |      ;
    CLC                                                        ;8291A2|18      |      ;
    ADC.B strcPlayer.direction                                 ;8291A3|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;8291A5|8D0109  |000901;
    RTS                                                        ;8291A8|60      |      ;
 
 
fToolUsedAnimation0x10_WateringCan:
    SEP #$20                                                   ;8291A9|E220    |      ;
    REP #$10                                                   ;8291AB|C210    |      ;
    JSR.W fToolUsed_GetSoundForFrontTile                              ;8291AD|20A092  |8292A0;
    SEP #$20                                                   ;8291B0|E220    |      ;
    CMP.B #$02                                                 ;8291B2|C902    |      ;
    BEQ .label2                                                ;8291B4|F01F    |8291D5;
    LDA.W strcPlayerData.leftWater                             ;8291B6|AD2609  |000926;
    BEQ .haveWater                                             ;8291B9|F00D    |8291C8;
    REP #$30                                                   ;8291BB|C230    |      ;
    LDA.W #$0068                                               ;8291BD|A96800  |      ;
    CLC                                                        ;8291C0|18      |      ;
    ADC.B strcPlayer.direction                                 ;8291C1|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;8291C3|8D0109  |000901;
    BRA .return                                                ;8291C6|801F    |8291E7;
 
 
.haveWater:
    REP #$30                                                   ;8291C8|C230    |      ;
    LDA.W #$006C                                               ;8291CA|A96C00  |      ;
    CLC                                                        ;8291CD|18      |      ;
    ADC.B strcPlayer.direction                                 ;8291CE|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;8291D0|8D0109  |000901;
    BRA .return                                                ;8291D3|8012    |8291E7;
 
 
.label2:
    REP #$30                                                   ;8291D5|C230    |      ;
    LDA.W #$0070                                               ;8291D7|A97000  |      ;
    CLC                                                        ;8291DA|18      |      ;
    ADC.B strcPlayer.direction                                 ;8291DB|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;8291DD|8D0109  |000901;
    SEP #$20                                                   ;8291E0|E220    |      ;
    LDA.B #$14                                                 ;8291E2|A914    |      ;
    STA.W strcPlayerData.leftWater                             ;8291E4|8D2609  |000926;
 
.return:
    RTS                                                        ;8291E7|60      |      ;
 
 
fToolUsedAnimation0x11_GoldenSickle:
    REP #$30                                                   ;8291E8|C230    |      ;
    LDA.W #$0048                                               ;8291EA|A94800  |      ;
    STA.W strcObjectData.spriteIdx                             ;8291ED|8D0109  |000901;
    RTS                                                        ;8291F0|60      |      ;
 
 
fToolUsedAnimation0x12_GoldenPlow:
    REP #$30                                                   ;8291F1|C230    |      ;
    LDA.W #$007C                                               ;8291F3|A97C00  |      ;
    CLC                                                        ;8291F6|18      |      ;
    ADC.B strcPlayer.direction                                 ;8291F7|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;8291F9|8D0109  |000901;
    RTS                                                        ;8291FC|60      |      ;
 
 
fToolUsedAnimation0x13_GoldenHammer:
    REP #$30                                                   ;8291FD|C230    |      ;
    LDA.W #$0084                                               ;8291FF|A98400  |      ;
    CLC                                                        ;829202|18      |      ;
    ADC.B strcPlayer.direction                                 ;829203|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;829205|8D0109  |000901;
    RTS                                                        ;829208|60      |      ;
 
 
fToolUsedAnimation0x14_GoldenAxe:
    REP #$30                                                   ;829209|C230    |      ;
    LDA.W #$0080                                               ;82920B|A98000  |      ;
    CLC                                                        ;82920E|18      |      ;
    ADC.B strcPlayer.direction                                 ;82920F|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;829211|8D0109  |000901;
    RTS                                                        ;829214|60      |      ;
 
 
fToolUsedAnimation0x15_Sprinkler:
    REP #$30                                                   ;829215|C230    |      ;
    LDA.W #$0047                                               ;829217|A94700  |      ;
    STA.W strcObjectData.spriteIdx                             ;82921A|8D0109  |000901;
    RTS                                                        ;82921D|60      |      ;
 
 
fToolUsedAnimation0x16_BeanstalkSeed:
    REP #$30                                                   ;82921E|C230    |      ;
    LDA.W #$00AC                                               ;829220|A9AC00  |      ;
    CLC                                                        ;829223|18      |      ;
    ADC.B strcPlayer.direction                                 ;829224|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;829226|8D0109  |000901;
    RTS                                                        ;829229|60      |      ;
 
 
fToolUsedAnimation0x17_BlueDiamond:
    REP #$30                                                   ;82922A|C230    |      ;
    LDA.W #$00AC                                               ;82922C|A9AC00  |      ;
    CLC                                                        ;82922F|18      |      ;
    ADC.B strcPlayer.direction                                 ;829230|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;829232|8D0109  |000901;
    RTS                                                        ;829235|60      |      ;
 
 
fToolUsedAnimation0x18_BlueFeather:
    REP #$30                                                   ;829236|C230    |      ;
    LDA.W #$00A8                                               ;829238|A9A800  |      ;
    STA.W strcObjectData.spriteIdx                             ;82923B|8D0109  |000901;
    RTS                                                        ;82923E|60      |      ;
 
 
fToolUsedAnimation0x19_ChickenFood:
    REP #$30                                                   ;82923F|C230    |      ;
    LDA.W #$0074                                               ;829241|A97400  |      ;
    CLC                                                        ;829244|18      |      ;
    ADC.B strcPlayer.direction                                 ;829245|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;829247|8D0109  |000901;
    RTS                                                        ;82924A|60      |      ;
 
 
fToolUsedAnimation0x1A_CowFood:
    REP #$30                                                   ;82924B|C230    |      ;
    LDA.W #$0074                                               ;82924D|A97400  |      ;
    CLC                                                        ;829250|18      |      ;
    ADC.B strcPlayer.direction                                 ;829251|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;829253|8D0109  |000901;
    RTS                                                        ;829256|60      |      ;
 
 
fToolUsedAnimation0x1B_FishingPole:
    REP #$30                                                   ;829257|C230    |      ;
    LDA.W #$0088                                               ;829259|A98800  |      ;
    STA.W strcObjectData.spriteIdx                             ;82925C|8D0109  |000901;
    RTS                                                        ;82925F|60      |      ;
 
 
fToolUsedActionHandler:
    SEP #$20                                                   ;829260|E220    |      ;
    REP #$10                                                   ;829262|C210    |      ;
    LDA.B #$00                                                 ;829264|A900    |      ;
    XBA                                                        ;829266|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;829267|AD2109  |000921;
    ASL A                                                      ;82926A|0A      |      ;
    TAX                                                        ;82926B|AA      |      ;
    if !REGION_DE
    JSR.W ($A780,X)                                        ;829429|FC80A7  |      ;
    else
    JSR.W (aToolUsedActionTable,X)                             ;82926C|FCC3A5  |82A5C3;
    endif
    REP #$20                                                   ;82926F|C220    |      ;
    %SetFlag(daily1, $0040)
    RTL                                                        ;82927C|6B      |      ;
 
 
fToolUsed_StoreSoundForFrontTile:
    REP #$30                                                   ;82927D|C230    |      ;
    LDA.W #$0001                                               ;82927F|A90100  |      ;
    LDX.W #$0000                                               ;829282|A20000  |      ;
    LDY.W #$0000                                               ;829285|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;829288|224ED181|81D14E;
    REP #$20                                                   ;82928C|C220    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82928E|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829291|AC8709  |000987;
    JSL.L fSound_GetToolSound                                  ;829294|2271AA82|82AA71;
    SEP #$20                                                   ;829298|E220    |      ;
    REP #$10                                                   ;82929A|C210    |      ;
    STA.W strcPlayerData.toolSound                             ;82929C|8D2209  |000922;
    RTS                                                        ;82929F|60      |      ;
 
 
fToolUsed_GetSoundForFrontTile:
    REP #$30                                                   ;8292A0|C230    |      ;
    LDA.W #$0001                                               ;8292A2|A90100  |      ;
    LDX.W #$0000                                               ;8292A5|A20000  |      ;
    LDY.W #$0000                                               ;8292A8|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;8292AB|224ED181|81D14E;
    REP #$20                                                   ;8292AF|C220    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8292B1|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8292B4|AC8709  |000987;
    JSL.L fSound_GetToolSound                                  ;8292B7|2271AA82|82AA71;
    RTS                                                        ;8292BB|60      |      ;
 
 
fToolUsed_GetSoundForFrontTileMode:
    REP #$30                                                   ;8292BC|C230    |      ;
    INC A                                                      ;8292BE|1A      |      ;
    LDX.W #$0000                                               ;8292BF|A20000  |      ;
    LDY.W #$0000                                               ;8292C2|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;8292C5|224ED181|81D14E;
    REP #$20                                                   ;8292C9|C220    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8292CB|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8292CE|AC8709  |000987;
    JSL.L fSound_GetToolSound                                  ;8292D1|2271AA82|82AA71;
    RTS                                                        ;8292D5|60      |      ;
 
 
fToolUsed_GetSoundForTileOffset:
    REP #$30                                                   ;8292D6|C230    |      ; A: nArg
    ASL A                                                      ;8292D8|0A      |      ;
    ASL A                                                      ;8292D9|0A      |      ;
    TAX                                                        ;8292DA|AA      |      ;
    LDA.L nFindTileArgsTable_8292FA,X                          ;8292DB|BFFA9282|8292FA;
    PHA                                                        ;8292DF|48      |      ;
    INX                                                        ;8292E0|E8      |      ;
    INX                                                        ;8292E1|E8      |      ;
    LDA.L nFindTileArgsTable_8292FA,X                          ;8292E2|BFFA9282|8292FA;
    TAY                                                        ;8292E6|A8      |      ;
    PLA                                                        ;8292E7|68      |      ;
    TAX                                                        ;8292E8|AA      |      ;
    JSL.L fFindTileCoordsInFrontOfPLayer                       ;8292E9|22A4D181|81D1A4;
    REP #$20                                                   ;8292ED|C220    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8292EF|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8292F2|AC8709  |000987;
    JSL.L fSound_GetToolSound                                  ;8292F5|2271AA82|82AA71;
    RTS                                                        ;8292F9|60      |      ;
 
 
nFindTileArgsTable_8292FA:
    dw $0000,$0000,$0000,$0001,$0001,$0001                     ;8292FA|        |      ; 0x09 * [n16 nRegX, n16 nRegY]
    dw $0001,$0000,$0001,$FFFF,$0000,$FFFF                     ;829306|        |      ;
    dw $FFFF,$FFFF,$FFFF,$0000,$FFFF,$0001                     ;829312|        |      ;
 
fToolUsedAction0x00_Empty:
    REP #$30                                                   ;82931E|C230    |      ;
    %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;829327|60      |      ;
 
 
fToolUsedAction0x01_Sickle:
    REP #$30                                                   ;829328|C230    |      ;
    JSR.W fToolUsed_GetSoundForFrontTile                              ;82932A|20A092  |8292A0;
    BNE +                                                      ;82932D|D003    |829332;
    JMP.W .return                                              ;82932F|4C5094  |829450;
 
 
  + SEP #$20                                                   ;829332|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;829334|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;829338|C903    |      ;
    BNE +                                                      ;82933A|D003    |82933F;
    JMP.W .return                                              ;82933C|4C5094  |829450;
 
 
  + LDA.B strcMap.loadAreaId                                   ;82933F|A522    |000022;
    CMP.B #$04                                                 ;829341|C904    |      ;
    BCC .label1                                                ;829343|9015    |82935A;
    REP #$20                                                   ;829345|C220    |      ;
    CPX.W #$0035                                               ;829347|E03500  |      ;
    BEQ +                                                      ;82934A|F006    |829352;
    LDA.W #$00DD                                               ;82934C|A9DD00  |      ;
    JMP.W .label4                                              ;82934F|4CC893  |8293C8;
 
 
  + REP #$20                                                   ;829352|C220    |      ;
    LDA.W #$00DE                                               ;829354|A9DE00  |      ;
    JMP.W .label4                                              ;829357|4CC893  |8293C8;
 
 
.label1:
    REP #$20                                                   ;82935A|C220    |      ;
    CPX.W #$0003                                               ;82935C|E00300  |      ;
    BEQ .label2                                                ;82935F|F00B    |82936C;
    CPX.W #$0079                                               ;829361|E07900  |      ;
    BEQ .label3                                                ;829364|F00E    |829374;
    LDA.W #$0017                                               ;829366|A91700  |      ;
    JMP.W .label4                                              ;829369|4CC893  |8293C8;
 
 
.label2:
    REP #$20                                                   ;82936C|C220    |      ;
    LDA.W #$000E                                               ;82936E|A90E00  |      ;
    JMP.W .label4                                              ;829371|4CC893  |8293C8;
 
 
.label3:
    REP #$20                                                   ;829374|C220    |      ;
    LDA.W #$0001                                               ;829376|A90100  |      ;
    JSL.L fGameEngine_AddFeed                                  ;829379|2253B283|83B253;
    REP #$20                                                   ;82937D|C220    |      ;
    LDA.W strcPlayerData.leftGrassToCut                        ;82937F|AD2E09  |00092E;
    DEC A                                                      ;829382|3A      |      ;
    STA.W strcPlayerData.leftGrassToCut                        ;829383|8D2E09  |00092E;
    REP #$20                                                   ;829386|C220    |      ;
    LDA.W #$0052                                               ;829388|A95200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82938B|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82938E|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;829391|2288A681|81A688;
    REP #$20                                                   ;829395|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;829397|AD8509  |000985;
    STA.W nUnknownX                                            ;82939A|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;82939D|AD8709  |000987;
    STA.W nUnknownY                                            ;8293A0|8D8209  |000982;
    REP #$30                                                   ;8293A3|C230    |      ;
    LDA.W #$00C1                                               ;8293A5|A9C100  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;8293A8|8D7A09  |00097A;
    LDA.W #$0000                                               ;8293AB|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;8293AE|8D7E09  |00097E;
    SEP #$20                                                   ;8293B1|E220    |      ;
    LDA.B #$03                                                 ;8293B3|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;8293B5|8D7409  |000974;
    LDA.B #$00                                                 ;8293B8|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;8293BA|8D7509  |000975;
    LDA.B #$00                                                 ;8293BD|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;8293BF|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;8293C2|2200A581|81A500;
    BRA .label5                                                ;8293C6|803B    |829403;
 
 
.label4:
    LDX.W nTileInFrontOfPlayerX                                ;8293C8|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8293CB|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;8293CE|2288A681|81A688;
    REP #$20                                                   ;8293D2|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;8293D4|AD8509  |000985;
    STA.W nUnknownX                                            ;8293D7|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;8293DA|AD8709  |000987;
    STA.W nUnknownY                                            ;8293DD|8D8209  |000982;
    REP #$30                                                   ;8293E0|C230    |      ;
    LDA.W #$00B7                                               ;8293E2|A9B700  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;8293E5|8D7A09  |00097A;
    LDA.W #$0000                                               ;8293E8|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;8293EB|8D7E09  |00097E;
    SEP #$20                                                   ;8293EE|E220    |      ;
    LDA.B #$03                                                 ;8293F0|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;8293F2|8D7409  |000974;
    LDA.B #$00                                                 ;8293F5|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;8293F7|8D7509  |000975;
    LDA.B #$00                                                 ;8293FA|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;8293FC|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;8293FF|2200A581|81A500;
 
.label5:
    SEP #$20                                                   ;829403|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;829405|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;829409|C901    |      ;
    BNE .return                                                ;82940B|D043    |829450;
    REP #$20                                                   ;82940D|C220    |      ;
    %CheckFlag(daily4, $0008)
    BNE .return                                                ;829416|D038    |829450;
    %CheckFlag(daily1, $2000)
    BNE .return                                                ;82941F|D02F    |829450;
    SEP #$20                                                   ;829421|E220    |      ;
    LDA.B #$10                                                 ;829423|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;829425|22F98980|8089F9;
    BNE .return                                                ;829429|D025    |829450;
    REP #$30                                                   ;82942B|C230    |      ;
    LDA.W #$0012                                               ;82942D|A91200  |      ;
    LDX.W #$0000                                               ;829430|A20000  |      ;
    LDY.W #$0032                                               ;829433|A03200  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;829436|22F88084|8480F8;
    REP #$30                                                   ;82943A|C230    |      ;
    LDA.W #$0002                                               ;82943C|A90200  |      ;
    JSL.L fGameEngine_AddHappiness                             ;82943F|2282B283|83B282;
    REP #$20                                                   ;829443|C220    |      ;
    %SetFlag(daily1, $2000)
 
.return:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-2)
    RTS                                                        ;82945F|60      |      ;
 
 
fToolUsedAction0x02_Plow:
    REP #$30                                                   ;829460|C230    |      ;
    JSR.W fToolUsed_GetSoundForFrontTile                              ;829462|20A092  |8292A0;
    BNE +                                                      ;829465|D003    |82946A;
    JMP.W .return                                              ;829467|4CB095  |8295B0;
 
 
  + REP #$20                                                   ;82946A|C220    |      ;
    LDA.W #$0017                                               ;82946C|A91700  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82946F|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829472|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;829475|2288A681|81A688;
    SEP #$20                                                   ;829479|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82947B|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;82947F|C902    |      ;
    BCS .label1                                                ;829481|B042    |8294C5;
    REP #$20                                                   ;829483|C220    |      ;
    %CheckFlag(daily4, $0008)
    BNE .label1                                                ;82948C|D037    |8294C5;
    %CheckFlag(daily1, $1000)
    BNE .label1                                                ;829495|D02E    |8294C5;
    SEP #$20                                                   ;829497|E220    |      ;
    LDA.B #$20                                                 ;829499|A920    |      ;
    JSL.L fCore_GetRandomNumber                                ;82949B|22F98980|8089F9;
    BNE .label1                                                ;82949F|D024    |8294C5;
    REP #$30                                                   ;8294A1|C230    |      ;
    LDA.W #$0011                                               ;8294A3|A91100  |      ;
    LDX.W #$0000                                               ;8294A6|A20000  |      ;
    LDY.W #$0030                                               ;8294A9|A03000  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;8294AC|22F88084|8480F8;
    SEP #$20                                                   ;8294B0|E220    |      ;
    STZ.W strcStockData.unkMole                                ;8294B2|9C3A09  |00093A;
    REP #$20                                                   ;8294B5|C220    |      ;
    %SetFlag(daily1, $1000)
    JMP.W .return                                              ;8294C2|4CB095  |8295B0;
 
 
.label1:
    REP #$30                                                   ;8294C5|C230    |      ;
    %CheckFlag(daily4, $0008)
    BNE .normalDestroy                                         ;8294CE|D07A    |82954A;
    %CheckFlag(daily2, !DFLAGS2_DUGUPMONEY)
    BNE .normalDestroy                                         ;8294D7|D071    |82954A;
    SEP #$20                                                   ;8294D9|E220    |      ;
    LDA.B #$10                                                 ;8294DB|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;8294DD|22F98980|8089F9;
    BNE .luckCheck                                             ;8294E1|D02E    |829511;
    REP #$30                                                   ;8294E3|C230    |      ;
    %SetFlag(daily2, !DFLAGS2_DUGUPMONEY)
    LDA.W #$000F                                               ;8294F0|A90F00  |      ;
    LDX.W #$0000                                               ;8294F3|A20000  |      ;
    LDY.W #$003A                                               ;8294F6|A03A00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;8294F9|22F88084|8480F8; AI spawn coin
    REP #$20                                                   ;8294FD|C220    |      ;
    LDA.W #$0001                                               ;8294FF|A90100  |      ;
    STA.B ptrTemp0x72                                          ;829502|8572    |000072;
    SEP #$20                                                   ;829504|E220    |      ;
    LDA.B #$00                                                 ;829506|A900    |      ;
    STA.B ptrTemp0x72+2                                        ;829508|8574    |000074; 10G profit
    JSL.L fGameEngine_AddProfit                                ;82950A|22C9B183|83B1C9;
    JMP.W .return                                              ;82950E|4CB095  |8295B0;
 
 
.luckCheck:
    SEP #$20                                                   ;829511|E220    |      ;
    LDA.B #$10                                                 ;829513|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;829515|22F98980|8089F9; 1 in 10 chance to dig up money
    BNE .normalDestroy                                         ;829519|D02F    |82954A;
    REP #$30                                                   ;82951B|C230    |      ;
    %SetFlag(daily2, !DFLAGS2_DUGUPMONEY)
    REP #$30                                                   ;829528|C230    |      ;
    LDA.W #$000F                                               ;82952A|A90F00  |      ;
    LDX.W #$0000                                               ;82952D|A20000  |      ;
    LDY.W #$003B                                               ;829530|A03B00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;829533|22F88084|8480F8; AI for spawning money bag
    REP #$20                                                   ;829537|C220    |      ;
    LDA.W #$0005                                               ;829539|A90500  |      ;
    STA.B ptrTemp0x72                                          ;82953C|8572    |000072;
    SEP #$20                                                   ;82953E|E220    |      ;
    LDA.B #$00                                                 ;829540|A900    |      ;
    STA.B ptrTemp0x72+2                                        ;829542|8574    |000074; 50G profit
    JSL.L fGameEngine_AddProfit                                ;829544|22C9B183|83B1C9;
    BRA .return                                                ;829548|8066    |8295B0;
 
 
.normalDestroy:
    SEP #$20                                                   ;82954A|E220    |      ;
    LDA.B #$40                                                 ;82954C|A940    |      ;
    JSL.L fCore_GetRandomNumber                                ;82954E|22F98980|8089F9;
    BNE .return                                                ;829552|D05C    |8295B0;
    REP #$30                                                   ;829554|C230    |      ;
    %CheckFlag(daily4, $0008)
    BNE .return                                                ;82955D|D051    |8295B0;
    %CheckFlag(daily2, $0100)
    BNE .return                                                ;829566|D048    |8295B0;
    %SetFlag(daily2, $0100)
    %CheckFlag(event1, $0800)
    BNE .label2                                                ;82957A|D00D    |829589;
    %SetFlag(event1, $0800)
    BRA .label3                                                ;829587|8016    |82959F;
 
 
.label2:
    REP #$30                                                   ;829589|C230    |      ;
    %CheckFlag(event1, $1000)
    BNE .return                                                ;829592|D01C    |8295B0;
    %SetFlag(event1, $1000)
 
.label3:
    REP #$30                                                   ;82959F|C230    |      ;
    LDA.W #$0010                                               ;8295A1|A91000  |      ;
    LDX.W #$0000                                               ;8295A4|A20000  |      ;
    LDY.W #$001F                                               ;8295A7|A01F00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;8295AA|22F88084|8480F8;
    BRA .return                                                ;8295AE|8000    |8295B0;
 
 
.return:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-2)
    RTS                                                        ;8295BF|60      |      ;
 
 
fToolUsedAction0x03_Hammer:
    REP #$30                                                   ;8295C0|C230    |      ;
    JSR.W fToolUsed_GetSoundForFrontTile                              ;8295C2|20A092  |8292A0;
    BNE +                                                      ;8295C5|D003    |8295CA;
    JMP.W .chickenStatue                                       ;8295C7|4C3F97  |82973F;
 
 
  + CPX.W #$0006                                               ;8295CA|E00600  |      ;
    BEQ .label4                                                ;8295CD|F064    |829633;
    CPX.W #$0004                                               ;8295CF|E00400  |      ;
    BNE .label5                                                ;8295D2|D071    |829645;
    SEP #$20                                                   ;8295D4|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;8295D6|A522    |000022;
    CMP.B #!AREA_TOWNSPRING                                                 
    BCC .label2                                                ;8295DA|9014    |8295F0;
    LDA.B strcMap.loadAreaId                                   ;8295DC|A522    |000022;
    CMP.B #!AREA_WOODSCAVE                                                 
    BCS .label1                                                ;8295E0|B007    |8295E9;
    REP #$20                                                   ;8295E2|C220    |      ;
    LDA.W #$00DD                                               ;8295E4|A9DD00  |      ;
    BRA .label3                                                ;8295E7|800C    |8295F5;
 
 
.label1:
    REP #$20                                                   ;8295E9|C220    |      ;
    LDA.W #$00E3                                               ;8295EB|A9E300  |      ;
    BRA .label3                                                ;8295EE|8005    |8295F5;
 
 
.label2:
    REP #$20                                                   ;8295F0|C220    |      ;
    LDA.W #$000E                                               ;8295F2|A90E00  |      ;
 
.label3:
    LDX.W nTileInFrontOfPlayerX                                ;8295F5|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8295F8|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;8295FB|2288A681|81A688;
    REP #$20                                                   ;8295FF|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;829601|AD8509  |000985;
    STA.W nUnknownX                                            ;829604|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;829607|AD8709  |000987;
    STA.W nUnknownY                                            ;82960A|8D8209  |000982;
    REP #$30                                                   ;82960D|C230    |      ;
    LDA.W #$00C8                                               ;82960F|A9C800  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;829612|8D7A09  |00097A;
    LDA.W #$0000                                               ;829615|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;829618|8D7E09  |00097E;
    SEP #$20                                                   ;82961B|E220    |      ;
    LDA.B #$03                                                 ;82961D|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;82961F|8D7409  |000974;
    LDA.B #$00                                                 ;829622|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;829624|8D7509  |000975;
    LDA.B #$00                                                 ;829627|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;829629|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;82962C|2200A581|81A500;
    JMP.W .return                                              ;829630|4C2F97  |82972F;
 
 
.label4:
    REP #$20                                                   ;829633|C220    |      ;
    LDA.W #$000E                                               ;829635|A90E00  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;829638|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82963B|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;82963E|2288A681|81A688;
    JMP.W .return                                              ;829642|4C2F97  |82972F;
 
 
.label5:
    SEP #$20                                                   ;829645|E220    |      ;
    LDA.W nBreakHitCounter                                     ;829647|AD6D09  |00096D;
    INC A                                                      ;82964A|1A      |      ;
    STA.W nBreakHitCounter                                     ;82964B|8D6D09  |00096D;
    CMP.B #$06                                                 ;82964E|C906    |      ; 6 hits to break big stone
    BEQ .label6                                                ;829650|F003    |829655;
    JMP.W .label10                                             ;829652|4CFE96  |8296FE;
 
 
.label6:
    STZ.W nBreakHitCounter                                     ;829655|9C6D09  |00096D;
    REP #$20                                                   ;829658|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82965A|AD8509  |000985;
    SEC                                                        ;82965D|38      |      ;
    SBC.W #$0010                                               ;82965E|E91000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;829661|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;829664|AD8709  |000987;
    SEC                                                        ;829667|38      |      ;
    SBC.W #$0010                                               ;829668|E91000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;82966B|8D8709  |000987;
    CPX.W #$0010                                               ;82966E|E01000  |      ;
    BEQ .label7                                                ;829671|F032    |8296A5;
    LDA.W nTileInFrontOfPlayerX                                ;829673|AD8509  |000985;
    CLC                                                        ;829676|18      |      ;
    ADC.W #$0010                                               ;829677|691000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82967A|8D8509  |000985;
    CPX.W #$000F                                               ;82967D|E00F00  |      ;
    BEQ .label7                                                ;829680|F023    |8296A5;
    LDA.W nTileInFrontOfPlayerX                                ;829682|AD8509  |000985;
    SEC                                                        ;829685|38      |      ;
    SBC.W #$0010                                               ;829686|E91000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;829689|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;82968C|AD8709  |000987;
    CLC                                                        ;82968F|18      |      ;
    ADC.W #$0010                                               ;829690|691000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;829693|8D8709  |000987;
    CPX.W #$000E                                               ;829696|E00E00  |      ;
    BEQ .label7                                                ;829699|F00A    |8296A5;
    LDA.W nTileInFrontOfPlayerX                                ;82969B|AD8509  |000985;
    CLC                                                        ;82969E|18      |      ;
    ADC.W #$0010                                               ;82969F|691000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;8296A2|8D8509  |000985;
 
.label7:
    SEP #$20                                                   ;8296A5|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;8296A7|A522    |000022;
    CMP.B #$04                                                 ;8296A9|C904    |      ;
    BCC .label8                                                ;8296AB|9007    |8296B4;
    REP #$20                                                   ;8296AD|C220    |      ;
    LDA.W #$00DF                                               ;8296AF|A9DF00  |      ;
    BRA .label9                                                ;8296B2|8005    |8296B9;
 
 
.label8:
    REP #$20                                                   ;8296B4|C220    |      ;
    LDA.W #$000D                                               ;8296B6|A90D00  |      ;
 
.label9:
    LDX.W nTileInFrontOfPlayerX                                ;8296B9|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8296BC|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;8296BF|2288A681|81A688;
    REP #$20                                                   ;8296C3|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;8296C5|AD8509  |000985;
    CLC                                                        ;8296C8|18      |      ;
    ADC.W #$0008                                               ;8296C9|690800  |      ;
    STA.W nUnknownX                                            ;8296CC|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;8296CF|AD8709  |000987;
    CLC                                                        ;8296D2|18      |      ;
    ADC.W #$0008                                               ;8296D3|690800  |      ;
    STA.W nUnknownY                                            ;8296D6|8D8209  |000982;
    REP #$30                                                   ;8296D9|C230    |      ;
    LDA.W #$00C9                                               ;8296DB|A9C900  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;8296DE|8D7A09  |00097A;
    LDA.W #$0000                                               ;8296E1|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;8296E4|8D7E09  |00097E;
    SEP #$20                                                   ;8296E7|E220    |      ;
    LDA.B #$03                                                 ;8296E9|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;8296EB|8D7409  |000974;
    LDA.B #$00                                                 ;8296EE|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;8296F0|8D7509  |000975;
    LDA.B #$00                                                 ;8296F3|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;8296F5|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;8296F8|2200A581|81A500;
    BRA .return                                                ;8296FC|8031    |82972F;
 
 
.label10:
    REP #$20                                                   ;8296FE|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;829700|AD8509  |000985;
    STA.W nUnknownX                                            ;829703|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;829706|AD8709  |000987;
    STA.W nUnknownY                                            ;829709|8D8209  |000982;
    REP #$30                                                   ;82970C|C230    |      ;
    LDA.W #$00CB                                               ;82970E|A9CB00  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;829711|8D7A09  |00097A;
    LDA.W #$0000                                               ;829714|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;829717|8D7E09  |00097E;
    SEP #$20                                                   ;82971A|E220    |      ;
    LDA.B #$03                                                 ;82971C|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;82971E|8D7409  |000974;
    LDA.B #$00                                                 ;829721|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;829723|8D7509  |000975;
    LDA.B #$00                                                 ;829726|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;829728|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;82972B|2200A581|81A500;
 
.return:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-2)
    RTS                                                        ;82973E|60      |      ;
 
 
.chickenStatue:
    SEP #$20                                                   ;82973F|E220    |      ;
    REP #$10                                                   ;829741|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;829743|A522    |000022;
    CMP.B #!AREA_CROSSROADSPRING                                                 
    BCC .return                                                ;829747|90E6    |82972F;
    CMP.B #!AREA_WOODSSPRING                                                 
    BCS .return                                                ;82974B|B0E2    |82972F;
    CPX.W #$00F8                                               ;82974D|E0F800  |      ;
    BNE .return                                                ;829750|D0DD    |82972F;
    REP #$30                                                   ;829752|C230    |      ;
    %CheckFlag(daily2, !DFLAGS2_BROKECHICKENSTATUE)
    BNE .return                                                ;82975B|D0D2    |82972F;
    if !REGION_DE
    REP #$30                                               ;82991A|C230    |      ;
    LDA.L $7F1F5C                                          ;82991C|AF5C1F7F|      ;
    ORA.W #$0080                                           ;829920|098000  |      ;
    STA.L $7F1F5C                                          ;829923|8F5C1F7F|      ;
    REP #$20                                               ;829927|C220    |      ;
    else
    REP #$20                                                   ;82975D|C220    |      ;
    endif
    LDA.W #$0015                                               ;82975F|A91500  |      ;
    LDX.W #$0000                                               ;829762|A20000  |      ;
    LDY.W #$0016                                               ;829765|A01600  |      ;
    JSL.L fAI_SetSlotScript                                    ;829768|223F8084|84803F; AI spawn power berry
    SEP #$20                                                   ;82976C|E220    |      ;
    LDA.B #$04                                                 ;82976E|A904    |      ;
    JSL.L fCore_GetRandomNumber                                ;829770|22F98980|8089F9;
    BNE .return                                                ;829774|D0B9    |82972F;
    REP #$30                                                   ;829776|C230    |      ;
    %CheckFlag(event1, $0200)
    BNE .return                                                ;82977F|D0AE    |82972F;
    %SetFlag(event1, $0200)
    REP #$30                                                   ;82978C|C230    |      ;
    LDA.B strcPlayer.posX                                      ;82978E|A5D6    |0000D6;
    CLC                                                        ;829790|18      |      ;
    ADC.W #$0010                                               ;829791|691000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;829794|8D8509  |000985;
    LDA.B strcPlayer.posY                                      ;829797|A5D8    |0000D8;
    SEC                                                        ;829799|38      |      ;
    SBC.W #$0010                                               ;82979A|E91000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;82979D|8D8709  |000987;
    LDA.W #$0010                                               ;8297A0|A91000  |      ;
    LDX.W #$0000                                               ;8297A3|A20000  |      ;
    LDY.W #$001F                                               ;8297A6|A01F00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;8297A9|22F88084|8480F8;
    if !REGION_DE
    ; (nothing in DE)
    else
    REP #$30                                                   ;8297AD|C230    |      ;
    %SetFlag(daily2, !DFLAGS2_BROKECHICKENSTATUE)
    endif
    JMP.W .return                                              ;8297BA|4C2F97  |82972F;
 
 
fToolUsedAction0x04_Axe:
    REP #$30                                                   ;8297BD|C230    |      ;
    JSR.W fToolUsed_GetSoundForFrontTile                              ;8297BF|20A092  |8292A0;
    BNE +                                                      ;8297C2|D003    |8297C7;
    JMP.W .label7                                              ;8297C4|4C4B99  |82994B;
 
 
  + SEP #$20                                                   ;8297C7|E220    |      ;
    LDA.W nBreakHitCounter                                     ;8297C9|AD6D09  |00096D;
    INC A                                                      ;8297CC|1A      |      ;
    STA.W nBreakHitCounter                                     ;8297CD|8D6D09  |00096D;
    CMP.B #$06                                                 ;8297D0|C906    |      ;
    BEQ +                                                      ;8297D2|F003    |8297D7;
    JMP.W .label6                                              ;8297D4|4C1899  |829918;
 
 
  + STZ.W nBreakHitCounter                                     ;8297D7|9C6D09  |00096D;
    REP #$20                                                   ;8297DA|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;8297DC|AD8509  |000985;
    SEC                                                        ;8297DF|38      |      ;
    SBC.W #$0010                                               ;8297E0|E91000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;8297E3|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;8297E6|AD8709  |000987;
    SEC                                                        ;8297E9|38      |      ;
    SBC.W #$0010                                               ;8297EA|E91000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;8297ED|8D8709  |000987;
    CPX.W #$000C                                               ;8297F0|E00C00  |      ;
    BEQ .label1                                                ;8297F3|F054    |829849;
    CPX.W #$0014                                               ;8297F5|E01400  |      ;
    BNE +                                                      ;8297F8|D003    |8297FD;
    JMP.W .label3                                              ;8297FA|4CBC98  |8298BC;
 
 
  + LDA.W nTileInFrontOfPlayerX                                ;8297FD|AD8509  |000985;
    CLC                                                        ;829800|18      |      ;
    ADC.W #$0010                                               ;829801|691000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;829804|8D8509  |000985;
    CPX.W #$000B                                               ;829807|E00B00  |      ;
    BEQ .label1                                                ;82980A|F03D    |829849;
    CPX.W #$0013                                               ;82980C|E01300  |      ;
    BNE +                                                      ;82980F|D003    |829814;
    JMP.W .label3                                              ;829811|4CBC98  |8298BC;
 
 
  + LDA.W nTileInFrontOfPlayerX                                ;829814|AD8509  |000985;
    SEC                                                        ;829817|38      |      ;
    SBC.W #$0010                                               ;829818|E91000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82981B|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;82981E|AD8709  |000987;
    CLC                                                        ;829821|18      |      ;
    ADC.W #$0010                                               ;829822|691000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;829825|8D8709  |000987;
    CPX.W #$000A                                               ;829828|E00A00  |      ;
    BEQ .label1                                                ;82982B|F01C    |829849;
    CPX.W #$0012                                               ;82982D|E01200  |      ;
    BNE +                                                      ;829830|D003    |829835;
    JMP.W .label3                                              ;829832|4CBC98  |8298BC;
 
 
  + LDA.W nTileInFrontOfPlayerX                                ;829835|AD8509  |000985;
    CLC                                                        ;829838|18      |      ;
    ADC.W #$0010                                               ;829839|691000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82983C|8D8509  |000985;
    CPX.W #$0009                                               ;82983F|E00900  |      ;
    BEQ .label1                                                ;829842|F005    |829849;
    CPX.W #$0011                                               ;829844|E01100  |      ;
    BEQ .label3                                                ;829847|F073    |8298BC;
 
.label1:
    SEP #$20                                                   ;829849|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82984B|A522    |000022;
    CMP.B #$04                                                 ;82984D|C904    |      ;
    BCC .label4                                                ;82984F|9072    |8298C3;
    REP #$20                                                   ;829851|C220    |      ;
    %CheckFlag(daily4, $0008)
    BNE .label2                                                ;82985A|D059    |8298B5;
    SEP #$20                                                   ;82985C|E220    |      ;
    LDA.B #$10                                                 ;82985E|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;829860|22F98980|8089F9;
    BNE .label2                                                ;829864|D04F    |8298B5;
    REP #$30                                                   ;829866|C230    |      ;
    %CheckFlag(event1, $0400)
    BNE .label2                                                ;82986F|D044    |8298B5;
    %SetFlag(event1, $0400)
    REP #$30                                                   ;82987C|C230    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82987E|AD8509  |000985;
    CLC                                                        ;829881|18      |      ;
    ADC.W #$0008                                               ;829882|690800  |      ;
    STA.W nTileInFrontOfPlayerX                                ;829885|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;829888|AD8709  |000987;
    CLC                                                        ;82988B|18      |      ;
    ADC.W #$0008                                               ;82988C|690800  |      ;
    STA.W nTileInFrontOfPlayerY                                ;82988F|8D8709  |000987;
    LDA.W #$0010                                               ;829892|A91000  |      ;
    LDX.W #$0000                                               ;829895|A20000  |      ;
    LDY.W #$001F                                               ;829898|A01F00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;82989B|22F88084|8480F8;
    REP #$30                                                   ;82989F|C230    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;8298A1|AD8509  |000985;
    SEC                                                        ;8298A4|38      |      ;
    SBC.W #$0008                                               ;8298A5|E90800  |      ;
    STA.W nTileInFrontOfPlayerX                                ;8298A8|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;8298AB|AD8709  |000987;
    SEC                                                        ;8298AE|38      |      ;
    SBC.W #$0008                                               ;8298AF|E90800  |      ;
    STA.W nTileInFrontOfPlayerY                                ;8298B2|8D8709  |000987;
 
.label2:
    REP #$30                                                   ;8298B5|C230    |      ;
    LDA.W #$00DF                                               ;8298B7|A9DF00  |      ;
    BRA .label5                                                ;8298BA|800C    |8298C8;
 
 
.label3:
    REP #$30                                                   ;8298BC|C230    |      ;
    LDA.W #$00E0                                               ;8298BE|A9E000  |      ;
    BRA .label5                                                ;8298C1|8005    |8298C8;
 
 
.label4:
    REP #$30                                                   ;8298C3|C230    |      ;
    LDA.W #$000D                                               ;8298C5|A90D00  |      ;
 
.label5:
    REP #$30                                                   ;8298C8|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8298CA|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8298CD|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;8298D0|2288A681|81A688;
    REP #$20                                                   ;8298D4|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;8298D6|AD8509  |000985;
    CLC                                                        ;8298D9|18      |      ;
    ADC.W #$0008                                               ;8298DA|690800  |      ;
    STA.W nUnknownX                                            ;8298DD|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;8298E0|AD8709  |000987;
    CLC                                                        ;8298E3|18      |      ;
    ADC.W #$0008                                               ;8298E4|690800  |      ;
    STA.W nUnknownY                                            ;8298E7|8D8209  |000982;
    REP #$30                                                   ;8298EA|C230    |      ;
    LDA.W #$00B8                                               ;8298EC|A9B800  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;8298EF|8D7A09  |00097A;
    LDA.W #$0000                                               ;8298F2|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;8298F5|8D7E09  |00097E;
    SEP #$20                                                   ;8298F8|E220    |      ;
    LDA.B #$03                                                 ;8298FA|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;8298FC|8D7409  |000974;
    LDA.B #$00                                                 ;8298FF|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;829901|8D7509  |000975;
    LDA.B #$00                                                 ;829904|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;829906|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;829909|2200A581|81A500;
    REP #$20                                                   ;82990D|C220    |      ;
    LDA.W #$0006                                               ;82990F|A90600  |      ;
    JSL.L fGameEngine_AddWood                                  ;829912|2224B283|83B224;
    BRA .return                                                ;829916|8071    |829989;
 
 
.label6:
    REP #$20                                                   ;829918|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82991A|AD8509  |000985;
    STA.W nUnknownX                                            ;82991D|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;829920|AD8709  |000987;
    STA.W nUnknownY                                            ;829923|8D8209  |000982;
    REP #$30                                                   ;829926|C230    |      ;
    LDA.W #$00CB                                               ;829928|A9CB00  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;82992B|8D7A09  |00097A;
    LDA.W #$0000                                               ;82992E|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;829931|8D7E09  |00097E;
    SEP #$20                                                   ;829934|E220    |      ;
    LDA.B #$03                                                 ;829936|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;829938|8D7409  |000974;
    LDA.B #$00                                                 ;82993B|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;82993D|8D7509  |000975;
    LDA.B #$00                                                 ;829940|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;829942|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;829945|2200A581|81A500;
    BRA .return                                                ;829949|803E    |829989;
 
 
.label7:
    SEP #$20                                                   ;82994B|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82994D|A522    |000022;
    CMP.B #$10                                                 ;82994F|C910    |      ;
    BCC .return                                                ;829951|9036    |829989;
    CMP.B #$14                                                 ;829953|C914    |      ;
    BCS .return                                                ;829955|B032    |829989;
    CPX.W #$00F4                                               ;829957|E0F400  |      ;
    BNE .return                                                ;82995A|D02D    |829989;
    REP #$30                                                   ;82995C|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82995E|AD9601  |000196;
    AND.W #$001A                                               ;829961|291A00  |      ;
    BNE .return                                                ;829964|D023    |829989;
    %CheckFlag(event4, $0020)
    BNE .return                                                ;82996D|D01A    |829989;
    %SetFlag(event4, $0020)
    REP #$30                                                   ;82997A|C230    |      ;
    %AIExecute($0000, $0017, $0000)
 
.return:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-2)
    RTS                                                        ;829998|60      |      ;
 
 
fToolUsedAction0x05_CornSeedBag:
    SEP #$20                                                   ;829999|E220    |      ;
    REP #$10                                                   ;82999B|C210    |      ;
    LDA.B #$00                                                 ;82999D|A900    |      ;
    XBA                                                        ;82999F|EB      |      ;
    LDA.W strcStockData.unkAnyTool                             ;8299A0|AD6B09  |00096B;
    JSR.W fToolUsed_GetSoundForTileOffset                              ;8299A3|20D692  |8292D6;
    BNE +                                                      ;8299A6|D003    |8299AB;
    JMP.W .label1                                              ;8299A8|4CCA99  |8299CA;
 
 
  + REP #$30                                                   ;8299AB|C230    |      ;
    LDX.W #$0019                                               ;8299AD|A21900  |      ;
    SEP #$20                                                   ;8299B0|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;8299B2|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;8299B6|C901    |      ;
    BEQ +                                                      ;8299B8|F003    |8299BD;
    LDX.W #$00EB                                               ;8299BA|A2EB00  |      ;
 
  + REP #$20                                                   ;8299BD|C220    |      ;
    TXA                                                        ;8299BF|8A      |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8299C0|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8299C3|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;8299C6|2288A681|81A688;
 
.label1:
    SEP #$20                                                   ;8299CA|E220    |      ;
    LDA.W strcStockData.unkAnyTool                             ;8299CC|AD6B09  |00096B;
    INC A                                                      ;8299CF|1A      |      ;
    STA.W strcStockData.unkAnyTool                             ;8299D0|8D6B09  |00096B;
    CMP.B #$09                                                 ;8299D3|C909    |      ;
    BNE .return                                                ;8299D5|D020    |8299F7;
    STZ.W strcStockData.unkAnyTool                             ;8299D7|9C6B09  |00096B;
    %DecreaseStock(leftCornSeeds)
    BNE +                                                      ;8299E3|D003    |8299E8;
    STZ.W strcPlayerData.toolEquipped                          ;8299E5|9C2109  |000921;
 
  + %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-1)
 
.return:
    RTS                                                        ;8299F7|60      |      ;
 
 
fToolUsedAction0x06_TomatoSeedBag:
    SEP #$20                                                   ;8299F8|E220    |      ;
    REP #$10                                                   ;8299FA|C210    |      ;
    LDA.B #$00                                                 ;8299FC|A900    |      ;
    XBA                                                        ;8299FE|EB      |      ;
    LDA.W strcStockData.unkAnyTool                             ;8299FF|AD6B09  |00096B;
    JSR.W fToolUsed_GetSoundForTileOffset                              ;829A02|20D692  |8292D6;
    BNE +                                                      ;829A05|D003    |829A0A;
    JMP.W .label1                                              ;829A07|4C299A  |829A29;
 
 
  + REP #$30                                                   ;829A0A|C230    |      ;
    LDX.W #$001A                                               ;829A0C|A21A00  |      ;
    SEP #$20                                                   ;829A0F|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;829A11|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;829A15|C901    |      ;
    BEQ +                                                      ;829A17|F003    |829A1C;
    LDX.W #$00EB                                               ;829A19|A2EB00  |      ;
 
  + REP #$20                                                   ;829A1C|C220    |      ;
    TXA                                                        ;829A1E|8A      |      ;
    LDX.W nTileInFrontOfPlayerX                                ;829A1F|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829A22|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;829A25|2288A681|81A688;
 
.label1:
    SEP #$20                                                   ;829A29|E220    |      ;
    LDA.W strcStockData.unkAnyTool                             ;829A2B|AD6B09  |00096B;
    INC A                                                      ;829A2E|1A      |      ;
    STA.W strcStockData.unkAnyTool                             ;829A2F|8D6B09  |00096B;
    CMP.B #$09                                                 ;829A32|C909    |      ;
    BNE .return                                                ;829A34|D020    |829A56;
    STZ.W strcStockData.unkAnyTool                             ;829A36|9C6B09  |00096B;
    %DecreaseStock(leftTomatoSeeds)
    BNE +                                                      ;829A42|D003    |829A47;
    STZ.W strcPlayerData.toolEquipped                          ;829A44|9C2109  |000921;
 
  + %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-1)
 
.return:
    RTS                                                        ;829A56|60      |      ;
 
 
fToolUsedAction0x07_PotatoSeedBag:
    SEP #$20                                                   ;829A57|E220    |      ;
    REP #$10                                                   ;829A59|C210    |      ;
    LDA.B #$00                                                 ;829A5B|A900    |      ;
    XBA                                                        ;829A5D|EB      |      ;
    LDA.W strcStockData.unkAnyTool                             ;829A5E|AD6B09  |00096B;
    JSR.W fToolUsed_GetSoundForTileOffset                              ;829A61|20D692  |8292D6;
    BNE +                                                      ;829A64|D003    |829A69;
    JMP.W .label1                                              ;829A66|4C869A  |829A86;
 
 
  + REP #$30                                                   ;829A69|C230    |      ;
    LDX.W #$001B                                               ;829A6B|A21B00  |      ;
    SEP #$20                                                   ;829A6E|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;829A70|AF191F7F|7F1F19;
    BEQ +                                                      ;829A74|F003    |829A79;
    LDX.W #$00EB                                               ;829A76|A2EB00  |      ;
 
  + REP #$20                                                   ;829A79|C220    |      ;
    TXA                                                        ;829A7B|8A      |      ;
    LDX.W nTileInFrontOfPlayerX                                ;829A7C|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829A7F|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;829A82|2288A681|81A688;
 
.label1:
    SEP #$20                                                   ;829A86|E220    |      ;
    LDA.W strcStockData.unkAnyTool                             ;829A88|AD6B09  |00096B;
    INC A                                                      ;829A8B|1A      |      ;
    STA.W strcStockData.unkAnyTool                             ;829A8C|8D6B09  |00096B;
    CMP.B #$09                                                 ;829A8F|C909    |      ;
    BNE .return                                                ;829A91|D020    |829AB3;
    STZ.W strcStockData.unkAnyTool                             ;829A93|9C6B09  |00096B;
    %DecreaseStock(leftPotatoSeeds)
    BNE +                                                      ;829A9F|D003    |829AA4;
    STZ.W strcPlayerData.toolEquipped                          ;829AA1|9C2109  |000921;
 
  + %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-1)
 
.return:
    RTS                                                        ;829AB3|60      |      ;
 
 
fToolUsedAction0x08_TurnipSeedBag:
    SEP #$20                                                   ;829AB4|E220    |      ;
    REP #$10                                                   ;829AB6|C210    |      ;
    LDA.B #$00                                                 ;829AB8|A900    |      ;
    XBA                                                        ;829ABA|EB      |      ;
    LDA.W strcStockData.unkAnyTool                             ;829ABB|AD6B09  |00096B;
    JSR.W fToolUsed_GetSoundForTileOffset                              ;829ABE|20D692  |8292D6;
    BNE +                                                      ;829AC1|D003    |829AC6;
    JMP.W .label1                                              ;829AC3|4CE39A  |829AE3;
 
 
  + REP #$30                                                   ;829AC6|C230    |      ;
    LDX.W #$001C                                               ;829AC8|A21C00  |      ;
    SEP #$20                                                   ;829ACB|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;829ACD|AF191F7F|7F1F19;
    BEQ +                                                      ;829AD1|F003    |829AD6;
    LDX.W #$00EB                                               ;829AD3|A2EB00  |      ;
 
  + REP #$20                                                   ;829AD6|C220    |      ;
    TXA                                                        ;829AD8|8A      |      ;
    LDX.W nTileInFrontOfPlayerX                                ;829AD9|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829ADC|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;829ADF|2288A681|81A688;
 
.label1:
    SEP #$20                                                   ;829AE3|E220    |      ;
    LDA.W strcStockData.unkAnyTool                             ;829AE5|AD6B09  |00096B;
    INC A                                                      ;829AE8|1A      |      ;
    STA.W strcStockData.unkAnyTool                             ;829AE9|8D6B09  |00096B;
    CMP.B #$09                                                 ;829AEC|C909    |      ;
    BNE .return                                                ;829AEE|D020    |829B10;
    STZ.W strcStockData.unkAnyTool                             ;829AF0|9C6B09  |00096B;
    %DecreaseStock(leftTurnipSeeds)
    BNE +                                                      ;829AFC|D003    |829B01;
    STZ.W strcPlayerData.toolEquipped                          ;829AFE|9C2109  |000921;
 
  + %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-1)
 
.return:
    RTS                                                        ;829B10|60      |      ;
 
 
fToolUsedAction0x09_CowMedicine:
    %SetPlayerAction(!PACTION_NONE)
    SEP #$20                                                   ;829B18|E220    |      ;
    STZ.W strcPlayerData.toolEquipped                          ;829B1A|9C2109  |000921;
    LDA.B #$FF                                                 ;829B1D|A9FF    |      ;
    JSL.L fPlayerEnergyHandler                                 ;829B1F|2261D081|81D061;
    REP #$20                                                   ;829B23|C220    |      ;
    %SetFlag(daily1, $0080)
    RTS                                                        ;829B30|60      |      ;
 
 
fToolUsedAction0x0A_MiraclePotion:
    %SetPlayerAction(!PACTION_NONE)
    SEP #$20                                                   ;829B38|E220    |      ;
    STZ.W strcPlayerData.toolEquipped                          ;829B3A|9C2109  |000921;
    LDA.B #$FF                                                 ;829B3D|A9FF    |      ;
    JSL.L fPlayerEnergyHandler                                 ;829B3F|2261D081|81D061;
    REP #$20                                                   ;829B43|C220    |      ;
    %SetFlag(daily1, $0100)
    RTS                                                        ;829B50|60      |      ;
 
 
fToolUsedAction0x0B_Bell:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-1)
    RTS                                                        ;829B60|60      |      ;
 
 
fToolUsedAction0x0C_GrassSeedBag:
    SEP #$20                                                   ;829B61|E220    |      ;
    REP #$10                                                   ;829B63|C210    |      ;
    LDA.B #$00                                                 ;829B65|A900    |      ;
    XBA                                                        ;829B67|EB      |      ;
    LDA.W strcStockData.unkAnyTool                             ;829B68|AD6B09  |00096B;
    JSR.W fToolUsed_GetSoundForTileOffset                              ;829B6B|20D692  |8292D6;
    BNE +                                                      ;829B6E|D003    |829B73;
    JMP.W .label1                                              ;829B70|4C9D9B  |829B9D;
 
 
  + REP #$30                                                   ;829B73|C230    |      ;
    LDX.W #$00ED                                               ;829B75|A2ED00  |      ;
    SEP #$20                                                   ;829B78|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;829B7A|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;829B7E|C902    |      ;
    BCS +                                                      ;829B80|B00E    |829B90;
    REP #$20                                                   ;829B82|C220    |      ;
    LDA.L nPlantedGrassCount                                   ;829B84|AF291F7F|7F1F29;
    INC A                                                      ;829B88|1A      |      ;
    STA.L nPlantedGrassCount                                   ;829B89|8F291F7F|7F1F29;
    LDX.W #$001E                                               ;829B8D|A21E00  |      ;
 
  + REP #$20                                                   ;829B90|C220    |      ;
    TXA                                                        ;829B92|8A      |      ;
    LDX.W nTileInFrontOfPlayerX                                ;829B93|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829B96|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;829B99|2288A681|81A688;
 
.label1:
    SEP #$20                                                   ;829B9D|E220    |      ;
    LDA.W strcStockData.unkAnyTool                             ;829B9F|AD6B09  |00096B;
    INC A                                                      ;829BA2|1A      |      ;
    STA.W strcStockData.unkAnyTool                             ;829BA3|8D6B09  |00096B;
    CMP.B #$09                                                 ;829BA6|C909    |      ;
    BNE .return                                                ;829BA8|D020    |829BCA;
    STZ.W strcStockData.unkAnyTool                             ;829BAA|9C6B09  |00096B;
    %DecreaseStock(leftGrassSeeds)
    BNE +                                                      ;829BB6|D003    |829BBB;
    STZ.W strcPlayerData.toolEquipped                          ;829BB8|9C2109  |000921;
 
  + %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-1)
 
.return:
    RTS                                                        ;829BCA|60      |      ;
 
 
fToolUsedAction0x0D_Paint:
    REP #$30                                                   ;829BCB|C230    |      ;
    JSR.W fToolUsed_GetSoundForFrontTile                              ;829BCD|20A092  |8292A0;
    BNE +                                                      ;829BD0|D003    |829BD5;
    JMP.W .return                                              ;829BD2|4CB09C  |829CB0;
 
 
  + REP #$30                                                   ;829BD5|C230    |      ;
    CPX.W #$00E2                                               ;829BD7|E0E200  |      ;
    BEQ .caseE2                                                ;829BDA|F041    |829C1D;
    CPX.W #$00E3                                               ;829BDC|E0E300  |      ;
    BEQ .caseE3                                                ;829BDF|F06F    |829C50;
    CPX.W #$00E4                                               ;829BE1|E0E400  |      ;
    BNE +                                                      ;829BE4|D003    |829BE9;
    JMP.W .caseE4                                              ;829BE6|4C809C  |829C80;
 
 
  + REP #$30                                                   ;829BE9|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_PAINTEDHOUSEDOOR)
    BEQ +                                                      ;829BF2|F003    |829BF7;
    JMP.W .return                                              ;829BF4|4CB09C  |829CB0;
 
 
  + LDA.W #$000A                                               ;829BF7|A90A00  |      ;
    JSL.L fGameEngine_AddHappiness                             ;829BFA|2282B283|83B282;
    REP #$20                                                   ;829BFE|C220    |      ;
    LDA.W #$0059                                               ;829C00|A95900  |      ;
    LDX.W #$0080                                               ;829C03|A28000  |      ;
    LDY.W #$0130                                               ;829C06|A03001  |      ;
    JSL.L fSetTileAtCoords                                     ;829C09|2288A681|81A688;
    REP #$30                                                   ;829C0D|C230    |      ;
    %SetFlag(event2, !EFLAGS2_PAINTEDHOUSEDOOR)
    JMP.W .return                                              ;829C1A|4CB09C  |829CB0;
 
 
.caseE2:
    REP #$30                                                   ;829C1D|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_PAINTEDHOUSELEFT)
    BEQ +                                                      ;829C26|F003    |829C2B;
    JMP.W .return                                              ;829C28|4CB09C  |829CB0;
 
 
  + LDA.W #$000A                                               ;829C2B|A90A00  |      ;
    JSL.L fGameEngine_AddHappiness                             ;829C2E|2282B283|83B282;
    REP #$20                                                   ;829C32|C220    |      ;
    LDA.W #$0058                                               ;829C34|A95800  |      ;
    LDX.W #$0060                                               ;829C37|A26000  |      ;
    LDY.W #$0130                                               ;829C3A|A03001  |      ;
    JSL.L fSetTileAtCoords                                     ;829C3D|2288A681|81A688;
    REP #$30                                                   ;829C41|C230    |      ;
    %SetFlag(event2, !EFLAGS2_PAINTEDHOUSELEFT)
    BRA .return                                                ;829C4E|8060    |829CB0;
 
 
.caseE3:
    REP #$30                                                   ;829C50|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_PAINTEDHOUSECENTER)
    BNE .return                                                ;829C59|D055    |829CB0;
    LDA.W #$000A                                               ;829C5B|A90A00  |      ;
    JSL.L fGameEngine_AddHappiness                             ;829C5E|2282B283|83B282;
    REP #$20                                                   ;829C62|C220    |      ;
    LDA.W #$005A                                               ;829C64|A95A00  |      ;
    LDX.W #$0090                                               ;829C67|A29000  |      ;
    LDY.W #$0130                                               ;829C6A|A03001  |      ;
    JSL.L fSetTileAtCoords                                     ;829C6D|2288A681|81A688;
    REP #$30                                                   ;829C71|C230    |      ;
    %SetFlag(event2, !EFLAGS2_PAINTEDHOUSECENTER)
    BRA .return                                                ;829C7E|8030    |829CB0;
 
 
.caseE4:
    REP #$30                                                   ;829C80|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_PAINTEDHOUSERIGHT)
    BNE .return                                                ;829C89|D025    |829CB0;
    LDA.W #$000A                                               ;829C8B|A90A00  |      ;
    JSL.L fGameEngine_AddHappiness                             ;829C8E|2282B283|83B282;
    REP #$20                                                   ;829C92|C220    |      ;
    LDA.W #$005C                                               ;829C94|A95C00  |      ;
    LDX.W #$00B0                                               ;829C97|A2B000  |      ;
    LDY.W #$0130                                               ;829C9A|A03001  |      ;
    JSL.L fSetTileAtCoords                                     ;829C9D|2288A681|81A688;
    REP #$30                                                   ;829CA1|C230    |      ;
    %SetFlag(event2, !EFLAGS2_PAINTEDHOUSERIGHT)
    BRA .return                                                ;829CAE|8000    |829CB0;
 
 
.return:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-2)
    RTS                                                        ;829CBF|60      |      ;
 
 
fToolUsedAction0x0E_Milker:
    %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;829CC7|60      |      ;
 
 
fToolUsedAction0x0F_Brush:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-1)
    RTS                                                        ;829CD7|60      |      ;
 
 
fToolUsedAction0x10_WateringCan:
    SEP #$20                                                   ;829CD8|E220    |      ;
    REP #$10                                                   ;829CDA|C210    |      ;
    SEP #$20                                                   ;829CDC|E220    |      ;
    REP #$10                                                   ;829CDE|C210    |      ;
    LDA.B #$00                                                 ;829CE0|A900    |      ;
    STA.W strcAudio.reg114                                     ;829CE2|8D1401  |000114;
    LDA.B #$07                                                 ;829CE5|A907    |      ;
    STA.W strcAudio.reg115                                     ;829CE7|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;829CEA|22328383|838332;
    JSR.W fToolUsed_GetSoundForFrontTile                              ;829CEE|20A092  |8292A0;
    SEP #$20                                                   ;829CF1|E220    |      ;
    CMP.B #$02                                                 ;829CF3|C902    |      ;
    BEQ .return                                                ;829CF5|F03B    |829D32;
    LDA.W strcPlayerData.leftWater                             ;829CF7|AD2609  |000926;
    BEQ .return                                                ;829CFA|F036    |829D32;
    DEC A                                                      ;829CFC|3A      |      ;
    STA.W strcPlayerData.leftWater                             ;829CFD|8D2609  |000926;
    JSR.W fToolUsed_GetSoundForFrontTile                              ;829D00|20A092  |8292A0;
    BNE +                                                      ;829D03|D003    |829D08;
    JMP.W .return                                              ;829D05|4C329D  |829D32;
 
 
  + REP #$30                                                   ;829D08|C230    |      ;
    TXA                                                        ;829D0A|8A      |      ;
    INC A                                                      ;829D0B|1A      |      ;
    PHA                                                        ;829D0C|48      |      ;
    SEP #$20                                                   ;829D0D|E220    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;829D0F|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829D12|AC8709  |000987;
    JSL.L fMap_UpdateCurrentTilemap                            ;829D15|223AB082|82B03A;
    REP #$20                                                   ;829D19|C220    |      ;
    PLA                                                        ;829D1B|68      |      ;
    ASL A                                                      ;829D1C|0A      |      ;
    ASL A                                                      ;829D1D|0A      |      ;
    TAY                                                        ;829D1E|A8      |      ;
    SEP #$20                                                   ;829D1F|E220    |      ;
    LDA.B #$00                                                 ;829D21|A900    |      ;
    XBA                                                        ;829D23|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;829D24|B70D    |00000D;
    REP #$20                                                   ;829D26|C220    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;829D28|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829D2B|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;829D2E|2288A681|81A688;
 
.return:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-2)
    RTS                                                        ;829D41|60      |      ;
 
 
fToolUsedAction0x11_GoldenSickle:
    SEP #$20                                                   ;829D42|E220    |      ;
    REP #$10                                                   ;829D44|C210    |      ;
    LDA.B #$00                                                 ;829D46|A900    |      ;
    XBA                                                        ;829D48|EB      |      ;
    LDA.W strcStockData.unkAnyTool                             ;829D49|AD6B09  |00096B;
    JSR.W fToolUsed_GetSoundForTileOffset                              ;829D4C|20D692  |8292D6;
    BNE +                                                      ;829D4F|D003    |829D54;
    JMP.W .label6                                              ;829D51|4C6E9E  |829E6E;
 
 
  + SEP #$20                                                   ;829D54|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;829D56|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;829D5A|C903    |      ; no workie workie in winter
    BNE +                                                      ;829D5C|D003    |829D61;
    JMP.W .justReturn                                          ;829D5E|4C8D9E  |829E8D;
 
 
  + LDA.B strcMap.loadAreaId                                   ;829D61|A522    |000022;
    CMP.B #$04                                                 ;829D63|C904    |      ;
    BCC .label1                                                ;829D65|9013    |829D7A;
    REP #$20                                                   ;829D67|C220    |      ;
    CPX.W #$0035                                               ;829D69|E03500  |      ;
    BEQ +                                                      ;829D6C|F005    |829D73;
    LDA.W #$00DD                                               ;829D6E|A9DD00  |      ;
    BRA .label4                                                ;829D71|8073    |829DE6;
 
 
  + REP #$20                                                   ;829D73|C220    |      ;
    LDA.W #$00DE                                               ;829D75|A9DE00  |      ;
    BRA .label4                                                ;829D78|806C    |829DE6;
 
 
.label1:
    REP #$20                                                   ;829D7A|C220    |      ;
    CPX.W #$0003                                               ;829D7C|E00300  |      ;
    BEQ .label2                                                ;829D7F|F00A    |829D8B;
    CPX.W #$0079                                               ;829D81|E07900  |      ;
    BEQ .label3                                                ;829D84|F00C    |829D92;
    LDA.W #$0017                                               ;829D86|A91700  |      ;
    BRA .label4                                                ;829D89|805B    |829DE6;
 
 
.label2:
    REP #$20                                                   ;829D8B|C220    |      ;
    LDA.W #$000E                                               ;829D8D|A90E00  |      ;
    BRA .label4                                                ;829D90|8054    |829DE6;
 
 
.label3:
    REP #$20                                                   ;829D92|C220    |      ;
    LDA.W #$0001                                               ;829D94|A90100  |      ;
    JSL.L fGameEngine_AddFeed                                  ;829D97|2253B283|83B253;
    REP #$20                                                   ;829D9B|C220    |      ;
    LDA.W strcPlayerData.leftGrassToCut                        ;829D9D|AD2E09  |00092E;
    DEC A                                                      ;829DA0|3A      |      ;
    STA.W strcPlayerData.leftGrassToCut                        ;829DA1|8D2E09  |00092E;
    REP #$20                                                   ;829DA4|C220    |      ;
    LDA.W #$0052                                               ;829DA6|A95200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;829DA9|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829DAC|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;829DAF|2288A681|81A688;
    REP #$20                                                   ;829DB3|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;829DB5|AD8509  |000985;
    STA.W nUnknownX                                            ;829DB8|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;829DBB|AD8709  |000987;
    STA.W nUnknownY                                            ;829DBE|8D8209  |000982;
    REP #$30                                                   ;829DC1|C230    |      ;
    LDA.W #$00C1                                               ;829DC3|A9C100  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;829DC6|8D7A09  |00097A;
    LDA.W #$0000                                               ;829DC9|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;829DCC|8D7E09  |00097E;
    SEP #$20                                                   ;829DCF|E220    |      ;
    LDA.B #$03                                                 ;829DD1|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;829DD3|8D7409  |000974;
    LDA.B #$00                                                 ;829DD6|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;829DD8|8D7509  |000975;
    LDA.B #$00                                                 ;829DDB|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;829DDD|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;829DE0|2200A581|81A500;
    BRA .label5                                                ;829DE4|803B    |829E21;
 
 
.label4:
    LDX.W nTileInFrontOfPlayerX                                ;829DE6|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829DE9|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;829DEC|2288A681|81A688;
    REP #$20                                                   ;829DF0|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;829DF2|AD8509  |000985;
    STA.W nUnknownX                                            ;829DF5|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;829DF8|AD8709  |000987;
    STA.W nUnknownY                                            ;829DFB|8D8209  |000982;
    REP #$30                                                   ;829DFE|C230    |      ;
    LDA.W #$00B7                                               ;829E00|A9B700  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;829E03|8D7A09  |00097A;
    LDA.W #$0000                                               ;829E06|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;829E09|8D7E09  |00097E;
    SEP #$20                                                   ;829E0C|E220    |      ;
    LDA.B #$03                                                 ;829E0E|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;829E10|8D7409  |000974;
    LDA.B #$00                                                 ;829E13|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;829E15|8D7509  |000975;
    LDA.B #$00                                                 ;829E18|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;829E1A|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;829E1D|2200A581|81A500;
 
.label5:
    SEP #$20                                                   ;829E21|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;829E23|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;829E27|C901    |      ;
    BNE .label6                                                ;829E29|D043    |829E6E;
    REP #$20                                                   ;829E2B|C220    |      ;
    %CheckFlag(daily4, $0008)
    BNE .label6                                                ;829E34|D038    |829E6E;
    %CheckFlag(daily1, $2000)
    BNE .label6                                                ;829E3D|D02F    |829E6E;
    SEP #$20                                                   ;829E3F|E220    |      ;
    LDA.B #$10                                                 ;829E41|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;829E43|22F98980|8089F9;
    BNE .label6                                                ;829E47|D025    |829E6E;
    REP #$30                                                   ;829E49|C230    |      ;
    LDA.W #$0012                                               ;829E4B|A91200  |      ;
    LDX.W #$0000                                               ;829E4E|A20000  |      ;
    LDY.W #$0032                                               ;829E51|A03200  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;829E54|22F88084|8480F8;
    REP #$30                                                   ;829E58|C230    |      ;
    LDA.W #$0002                                               ;829E5A|A90200  |      ;
    JSL.L fGameEngine_AddHappiness                             ;829E5D|2282B283|83B282;
    REP #$20                                                   ;829E61|C220    |      ;
    %SetFlag(daily1, $2000)
 
.label6:
    SEP #$20                                                   ;829E6E|E220    |      ;
    LDA.W strcStockData.unkAnyTool                             ;829E70|AD6B09  |00096B;
    INC A                                                      ;829E73|1A      |      ;
    STA.W strcStockData.unkAnyTool                             ;829E74|8D6B09  |00096B;
    CMP.B #$09                                                 ;829E77|C909    |      ;
    BNE .justReturn                                            ;829E79|D012    |829E8D;
    STZ.W strcStockData.unkAnyTool                             ;829E7B|9C6B09  |00096B;
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-8)
 
.justReturn:
    RTS                                                        ;829E8D|60      |      ;
 
 
fToolUsedAction0x12_GoldenPlow:
    SEP #$20                                                   ;829E8E|E220    |      ;
    REP #$10                                                   ;829E90|C210    |      ;
    LDA.B #$00                                                 ;829E92|A900    |      ;
    XBA                                                        ;829E94|EB      |      ;
    LDA.W strcStockData.unkAnyTool                             ;829E95|AD6B09  |00096B;
    JSR.W fToolUsed_GetSoundForFrontTileMode                              ;829E98|20BC92  |8292BC;
    BNE +                                                      ;829E9B|D003    |829EA0;
    JMP.W .return                                              ;829E9D|4CF09F  |829FF0;
 
 
  + REP #$20                                                   ;829EA0|C220    |      ;
    LDA.W #$0017                                               ;829EA2|A91700  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;829EA5|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;829EA8|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;829EAB|2288A681|81A688;
    SEP #$20                                                   ;829EAF|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;829EB1|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;829EB5|C902    |      ;
    BCS .label1                                                ;829EB7|B03F    |829EF8;
    REP #$20                                                   ;829EB9|C220    |      ;
    REP #$20                                                   ;829EBB|C220    |      ;
    %CheckFlag(daily4, $0008)
    BNE .label1                                                ;829EC4|D032    |829EF8;
    %CheckFlag(daily1, $1000)
    BNE .label1                                                ;829ECD|D029    |829EF8;
    SEP #$20                                                   ;829ECF|E220    |      ;
    LDA.B #$20                                                 ;829ED1|A920    |      ;
    JSL.L fCore_GetRandomNumber                                ;829ED3|22F98980|8089F9;
    BNE .label1                                                ;829ED7|D01F    |829EF8;
    REP #$30                                                   ;829ED9|C230    |      ;
    LDA.W #$0011                                               ;829EDB|A91100  |      ;
    LDX.W #$0000                                               ;829EDE|A20000  |      ;
    LDY.W #$0030                                               ;829EE1|A03000  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;829EE4|22F88084|8480F8;
    REP #$20                                                   ;829EE8|C220    |      ;
    %SetFlag(daily1, $1000)
    JMP.W .label6                                              ;829EF5|4CE39F  |829FE3;
 
 
.label1:
    REP #$30                                                   ;829EF8|C230    |      ;
    %CheckFlag(daily4, $0008)
    BNE .label3                                                ;829F01|D07A    |829F7D;
    %CheckFlag(daily2, $0200)
    BNE .label3                                                ;829F0A|D071    |829F7D;
    SEP #$20                                                   ;829F0C|E220    |      ;
    LDA.B #$10                                                 ;829F0E|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;829F10|22F98980|8089F9;
    BNE .label2                                                ;829F14|D02E    |829F44;
    REP #$30                                                   ;829F16|C230    |      ;
    %SetFlag(daily2, $0200)
    LDA.W #$000F                                               ;829F23|A90F00  |      ;
    LDX.W #$0000                                               ;829F26|A20000  |      ;
    LDY.W #$003A                                               ;829F29|A03A00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;829F2C|22F88084|8480F8;
    REP #$20                                                   ;829F30|C220    |      ;
    LDA.W #$0001                                               ;829F32|A90100  |      ;
    STA.B ptrTemp0x72                                          ;829F35|8572    |000072;
    SEP #$20                                                   ;829F37|E220    |      ;
    LDA.B #$00                                                 ;829F39|A900    |      ;
    STA.B ptrTemp0x72+2                                        ;829F3B|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;829F3D|22C9B183|83B1C9;
    JMP.W .label6                                              ;829F41|4CE39F  |829FE3;
 
 
.label2:
    SEP #$20                                                   ;829F44|E220    |      ;
    LDA.B #$10                                                 ;829F46|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;829F48|22F98980|8089F9;
    BNE .label3                                                ;829F4C|D02F    |829F7D;
    REP #$30                                                   ;829F4E|C230    |      ;
    %SetFlag(daily2, $0200)
    REP #$30                                                   ;829F5B|C230    |      ;
    LDA.W #$000F                                               ;829F5D|A90F00  |      ;
    LDX.W #$0000                                               ;829F60|A20000  |      ;
    LDY.W #$003B                                               ;829F63|A03B00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;829F66|22F88084|8480F8;
    REP #$20                                                   ;829F6A|C220    |      ;
    LDA.W #$0005                                               ;829F6C|A90500  |      ;
    STA.B ptrTemp0x72                                          ;829F6F|8572    |000072;
    SEP #$20                                                   ;829F71|E220    |      ;
    LDA.B #$00                                                 ;829F73|A900    |      ;
    STA.B ptrTemp0x72+2                                        ;829F75|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;829F77|22C9B183|83B1C9;
    BRA .label6                                                ;829F7B|8066    |829FE3;
 
 
.label3:
    SEP #$20                                                   ;829F7D|E220    |      ;
    LDA.B #$40                                                 ;829F7F|A940    |      ;
    JSL.L fCore_GetRandomNumber                                ;829F81|22F98980|8089F9;
    BNE .label6                                                ;829F85|D05C    |829FE3;
    REP #$30                                                   ;829F87|C230    |      ;
    %CheckFlag(daily4, $0008)
    BNE .label6                                                ;829F90|D051    |829FE3;
    %CheckFlag(daily2, $0100)
    BNE .label6                                                ;829F99|D048    |829FE3;
    %SetFlag(daily2, $0100)
    %CheckFlag(event1, $0800)
    BNE .label4                                                ;829FAD|D00D    |829FBC;
    %SetFlag(event1, $0800)
    BRA .label5                                                ;829FBA|8016    |829FD2;
 
 
.label4:
    REP #$30                                                   ;829FBC|C230    |      ;
    %CheckFlag(event1, $1000)
    BNE .label6                                                ;829FC5|D01C    |829FE3;
    %SetFlag(event1, $1000)
 
.label5:
    REP #$30                                                   ;829FD2|C230    |      ;
    LDA.W #$0010                                               ;829FD4|A91000  |      ;
    LDX.W #$0000                                               ;829FD7|A20000  |      ;
    LDY.W #$001F                                               ;829FDA|A01F00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;829FDD|22F88084|8480F8;
    BRA .label6                                                ;829FE1|8000    |829FE3;
 
 
.label6:
    SEP #$20                                                   ;829FE3|E220    |      ;
    LDA.W strcStockData.unkAnyTool                             ;829FE5|AD6B09  |00096B;
    INC A                                                      ;829FE8|1A      |      ;
    STA.W strcStockData.unkAnyTool                             ;829FE9|8D6B09  |00096B;
    CMP.B #$06                                                 ;829FEC|C906    |      ;
    BNE .justReturn                                            ;829FEE|D014    |82A004;
 
.return:
    SEP #$20                                                   ;829FF0|E220    |      ;
    STZ.W strcStockData.unkAnyTool                             ;829FF2|9C6B09  |00096B;
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-8)
 
.justReturn:
    RTS                                                        ;82A004|60      |      ;
 
 
fToolUsedAction0x13_GolderHammer:
    REP #$30                                                   ;82A005|C230    |      ;
    JSR.W fToolUsed_GetSoundForFrontTile                              ;82A007|20A092  |8292A0;
    BNE +                                                      ;82A00A|D003    |82A00F;
    JMP.W .label9                                              ;82A00C|4C41A1  |82A141;
 
 
  + CPX.W #$0006                                               ;82A00F|E00600  |      ;
    BEQ .label4                                                ;82A012|F067    |82A07B;
    CPX.W #$0004                                               ;82A014|E00400  |      ;
    BEQ +                                                      ;82A017|F003    |82A01C;
    JMP.W .label5                                              ;82A019|4C8DA0  |82A08D;
 
 
  + SEP #$20                                                   ;82A01C|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82A01E|A522    |000022;
    CMP.B #$04                                                 ;82A020|C904    |      ;
    BCC .label2                                                ;82A022|9014    |82A038;
    LDA.B strcMap.loadAreaId                                   ;82A024|A522    |000022;
    CMP.B #$29                                                 ;82A026|C929    |      ;
    BCS .label1                                                ;82A028|B007    |82A031;
    REP #$20                                                   ;82A02A|C220    |      ;
    LDA.W #$00DD                                               ;82A02C|A9DD00  |      ;
    BRA .label3                                                ;82A02F|800C    |82A03D;
 
 
.label1:
    REP #$20                                                   ;82A031|C220    |      ;
    LDA.W #$00E3                                               ;82A033|A9E300  |      ;
    BRA .label3                                                ;82A036|8005    |82A03D;
 
 
.label2:
    REP #$20                                                   ;82A038|C220    |      ;
    LDA.W #$000E                                               ;82A03A|A90E00  |      ;
 
.label3:
    LDX.W nTileInFrontOfPlayerX                                ;82A03D|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A040|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;82A043|2288A681|81A688;
    REP #$20                                                   ;82A047|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82A049|AD8509  |000985;
    STA.W nUnknownX                                            ;82A04C|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;82A04F|AD8709  |000987;
    STA.W nUnknownY                                            ;82A052|8D8209  |000982;
    REP #$30                                                   ;82A055|C230    |      ;
    LDA.W #$00C8                                               ;82A057|A9C800  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;82A05A|8D7A09  |00097A;
    LDA.W #$0000                                               ;82A05D|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;82A060|8D7E09  |00097E;
    SEP #$20                                                   ;82A063|E220    |      ;
    LDA.B #$03                                                 ;82A065|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;82A067|8D7409  |000974;
    LDA.B #$00                                                 ;82A06A|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;82A06C|8D7509  |000975;
    LDA.B #$00                                                 ;82A06F|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;82A071|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;82A074|2200A581|81A500;
    JMP.W .loop                                                ;82A078|4C31A1  |82A131;
 
 
.label4:
    REP #$20                                                   ;82A07B|C220    |      ;
    LDA.W #$000E                                               ;82A07D|A90E00  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82A080|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A083|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;82A086|2288A681|81A688;
    JMP.W .loop                                                ;82A08A|4C31A1  |82A131;
 
 
.label5:
    REP #$20                                                   ;82A08D|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82A08F|AD8509  |000985;
    SEC                                                        ;82A092|38      |      ;
    SBC.W #$0010                                               ;82A093|E91000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A096|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;82A099|AD8709  |000987;
    SEC                                                        ;82A09C|38      |      ;
    SBC.W #$0010                                               ;82A09D|E91000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;82A0A0|8D8709  |000987;
    CPX.W #$0010                                               ;82A0A3|E01000  |      ;
    BEQ .label6                                                ;82A0A6|F032    |82A0DA;
    LDA.W nTileInFrontOfPlayerX                                ;82A0A8|AD8509  |000985;
    CLC                                                        ;82A0AB|18      |      ;
    ADC.W #$0010                                               ;82A0AC|691000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A0AF|8D8509  |000985;
    CPX.W #$000F                                               ;82A0B2|E00F00  |      ;
    BEQ .label6                                                ;82A0B5|F023    |82A0DA;
    LDA.W nTileInFrontOfPlayerX                                ;82A0B7|AD8509  |000985;
    SEC                                                        ;82A0BA|38      |      ;
    SBC.W #$0010                                               ;82A0BB|E91000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A0BE|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;82A0C1|AD8709  |000987;
    CLC                                                        ;82A0C4|18      |      ;
    ADC.W #$0010                                               ;82A0C5|691000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;82A0C8|8D8709  |000987;
    CPX.W #$000E                                               ;82A0CB|E00E00  |      ;
    BEQ .label6                                                ;82A0CE|F00A    |82A0DA;
    LDA.W nTileInFrontOfPlayerX                                ;82A0D0|AD8509  |000985;
    CLC                                                        ;82A0D3|18      |      ;
    ADC.W #$0010                                               ;82A0D4|691000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A0D7|8D8509  |000985;
 
.label6:
    SEP #$20                                                   ;82A0DA|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82A0DC|A522    |000022;
    CMP.B #$04                                                 ;82A0DE|C904    |      ;
    BCC .label7                                                ;82A0E0|9007    |82A0E9;
    REP #$20                                                   ;82A0E2|C220    |      ;
    LDA.W #$00DF                                               ;82A0E4|A9DF00  |      ;
    BRA .label8                                                ;82A0E7|8005    |82A0EE;
 
 
.label7:
    REP #$20                                                   ;82A0E9|C220    |      ;
    LDA.W #$000D                                               ;82A0EB|A90D00  |      ;
 
.label8:
    LDX.W nTileInFrontOfPlayerX                                ;82A0EE|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A0F1|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;82A0F4|2288A681|81A688;
    REP #$20                                                   ;82A0F8|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82A0FA|AD8509  |000985;
    CLC                                                        ;82A0FD|18      |      ;
    ADC.W #$0008                                               ;82A0FE|690800  |      ;
    STA.W nUnknownX                                            ;82A101|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;82A104|AD8709  |000987;
    CLC                                                        ;82A107|18      |      ;
    ADC.W #$0008                                               ;82A108|690800  |      ;
    STA.W nUnknownY                                            ;82A10B|8D8209  |000982;
    REP #$30                                                   ;82A10E|C230    |      ;
    LDA.W #$00C9                                               ;82A110|A9C900  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;82A113|8D7A09  |00097A;
    LDA.W #$0000                                               ;82A116|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;82A119|8D7E09  |00097E;
    SEP #$20                                                   ;82A11C|E220    |      ;
    LDA.B #$03                                                 ;82A11E|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;82A120|8D7409  |000974;
    LDA.B #$00                                                 ;82A123|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;82A125|8D7509  |000975;
    LDA.B #$00                                                 ;82A128|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;82A12A|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;82A12D|2200A581|81A500;
 
.loop:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-4)
    RTS                                                        ;82A140|60      |      ;
 
 
.label9:
    SEP #$20                                                   ;82A141|E220    |      ;
    REP #$10                                                   ;82A143|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;82A145|A522    |000022;
    CMP.B #$0C                                                 ;82A147|C90C    |      ;
    BCC .loop                                                  ;82A149|90E6    |82A131;
    CMP.B #$10                                                 ;82A14B|C910    |      ;
    BCS .loop                                                  ;82A14D|B0E2    |82A131;
    CPX.W #$00F8                                               ;82A14F|E0F800  |      ;
    BNE .loop                                                  ;82A152|D0DD    |82A131;
    REP #$30                                                   ;82A154|C230    |      ;
    %CheckFlag(daily2, $0080)
    BNE .loop                                                  ;82A15D|D0D2    |82A131;
    if !REGION_DE
    REP #$30                                               ;82A31C|C230    |      ;
    LDA.L $7F1F5C                                          ;82A31E|AF5C1F7F|      ;
    ORA.W #$0080                                           ;82A322|098000  |      ;
    STA.L $7F1F5C                                          ;82A325|8F5C1F7F|      ;
    REP #$20                                               ;82A329|C220    |      ;
    else
    REP #$20                                                   ;82A15F|C220    |      ;
    endif
    LDA.W #$0015                                               ;82A161|A91500  |      ;
    LDX.W #$0000                                               ;82A164|A20000  |      ;
    LDY.W #$0016                                               ;82A167|A01600  |      ;
    JSL.L fAI_SetSlotScript                                    ;82A16A|223F8084|84803F;
    SEP #$20                                                   ;82A16E|E220    |      ;
    LDA.B #$04                                                 ;82A170|A904    |      ;
    JSL.L fCore_GetRandomNumber                                ;82A172|22F98980|8089F9;
    BNE .loop                                                  ;82A176|D0B9    |82A131;
    REP #$30                                                   ;82A178|C230    |      ;
    %CheckFlag(event1, $0200)
    BNE .loop                                                  ;82A181|D0AE    |82A131;
    %SetFlag(event1, $0200)
    REP #$30                                                   ;82A18E|C230    |      ;
    LDA.B strcPlayer.posX                                      ;82A190|A5D6    |0000D6;
    CLC                                                        ;82A192|18      |      ;
    ADC.W #$0010                                               ;82A193|691000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A196|8D8509  |000985;
    LDA.B strcPlayer.posY                                      ;82A199|A5D8    |0000D8;
    SEC                                                        ;82A19B|38      |      ;
    SBC.W #$0010                                               ;82A19C|E91000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;82A19F|8D8709  |000987;
    LDA.W #$0010                                               ;82A1A2|A91000  |      ;
    LDX.W #$0000                                               ;82A1A5|A20000  |      ;
    LDY.W #$001F                                               ;82A1A8|A01F00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;82A1AB|22F88084|8480F8;
    if !REGION_DE
    ; (nothing in DE)
    else
    REP #$30                                                   ;82A1AF|C230    |      ;
    %SetFlag(daily2, $0080)
    endif
    JMP.W .loop                                                ;82A1BC|4C31A1  |82A131;
 
 
fToolUsedAction0x14_GoldenAxe:
    REP #$30                                                   ;82A1BF|C230    |      ;
    JSR.W fToolUsed_GetSoundForFrontTile                              ;82A1C1|20A092  |8292A0;
    BNE +                                                      ;82A1C4|D003    |82A1C9;
    JMP.W .return                                              ;82A1C6|4CF7A2  |82A2F7;
 
 
  + REP #$20                                                   ;82A1C9|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82A1CB|AD8509  |000985;
    SEC                                                        ;82A1CE|38      |      ;
    SBC.W #$0010                                               ;82A1CF|E91000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A1D2|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;82A1D5|AD8709  |000987;
    SEC                                                        ;82A1D8|38      |      ;
    SBC.W #$0010                                               ;82A1D9|E91000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;82A1DC|8D8709  |000987;
    CPX.W #$000C                                               ;82A1DF|E00C00  |      ;
    BEQ .label1                                                ;82A1E2|F051    |82A235;
    CPX.W #$0014                                               ;82A1E4|E01400  |      ;
    BNE +                                                      ;82A1E7|D003    |82A1EC;
    JMP.W .label2                                              ;82A1E9|4C9DA2  |82A29D;
 
 
  + LDA.W nTileInFrontOfPlayerX                                ;82A1EC|AD8509  |000985;
    CLC                                                        ;82A1EF|18      |      ;
    ADC.W #$0010                                               ;82A1F0|691000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A1F3|8D8509  |000985;
    CPX.W #$000B                                               ;82A1F6|E00B00  |      ;
    BEQ .label1                                                ;82A1F9|F03A    |82A235;
    CPX.W #$0013                                               ;82A1FB|E01300  |      ;
    BNE +                                                      ;82A1FE|D003    |82A203;
    JMP.W .label2                                              ;82A200|4C9DA2  |82A29D;
 
 
  + LDA.W nTileInFrontOfPlayerX                                ;82A203|AD8509  |000985;
    SEC                                                        ;82A206|38      |      ;
    SBC.W #$0010                                               ;82A207|E91000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A20A|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;82A20D|AD8709  |000987;
    CLC                                                        ;82A210|18      |      ;
    ADC.W #$0010                                               ;82A211|691000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;82A214|8D8709  |000987;
    CPX.W #$000A                                               ;82A217|E00A00  |      ;
    BEQ .label1                                                ;82A21A|F019    |82A235;
    CPX.W #$0012                                               ;82A21C|E01200  |      ;
    BEQ .label2                                                ;82A21F|F07C    |82A29D;
    LDA.W nTileInFrontOfPlayerX                                ;82A221|AD8509  |000985;
    CLC                                                        ;82A224|18      |      ;
    ADC.W #$0010                                               ;82A225|691000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A228|8D8509  |000985;
    CPX.W #$0009                                               ;82A22B|E00900  |      ;
    BEQ .label1                                                ;82A22E|F005    |82A235;
    CPX.W #$0011                                               ;82A230|E01100  |      ;
    BEQ .label2                                                ;82A233|F068    |82A29D;
 
.label1:
    SEP #$20                                                   ;82A235|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82A237|A522    |000022;
    CMP.B #$04                                                 ;82A239|C904    |      ;
    BCC .label3                                                ;82A23B|9067    |82A2A4;
    SEP #$20                                                   ;82A23D|E220    |      ;
    LDA.B #$10                                                 ;82A23F|A910    |      ;
    JSL.L fCore_GetRandomNumber                                ;82A241|22F98980|8089F9;
    BNE .label4                                                ;82A245|D04F    |82A296;
    REP #$30                                                   ;82A247|C230    |      ;
    %CheckFlag(event1, $0400)
    BNE .label4                                                ;82A250|D044    |82A296;
    %SetFlag(event1, $0400)
    REP #$30                                                   ;82A25D|C230    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82A25F|AD8509  |000985;
    CLC                                                        ;82A262|18      |      ;
    ADC.W #$0008                                               ;82A263|690800  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A266|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;82A269|AD8709  |000987;
    CLC                                                        ;82A26C|18      |      ;
    ADC.W #$0008                                               ;82A26D|690800  |      ;
    STA.W nTileInFrontOfPlayerY                                ;82A270|8D8709  |000987;
    LDA.W #$0010                                               ;82A273|A91000  |      ;
    LDX.W #$0000                                               ;82A276|A20000  |      ;
    LDY.W #$001F                                               ;82A279|A01F00  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;82A27C|22F88084|8480F8;
    REP #$30                                                   ;82A280|C230    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82A282|AD8509  |000985;
    SEC                                                        ;82A285|38      |      ;
    SBC.W #$0008                                               ;82A286|E90800  |      ;
    STA.W nTileInFrontOfPlayerX                                ;82A289|8D8509  |000985;
    LDA.W nTileInFrontOfPlayerY                                ;82A28C|AD8709  |000987;
    SEC                                                        ;82A28F|38      |      ;
    SBC.W #$0008                                               ;82A290|E90800  |      ;
    STA.W nTileInFrontOfPlayerY                                ;82A293|8D8709  |000987;
 
.label4:
    REP #$30                                                   ;82A296|C230    |      ;
    LDA.W #$00DF                                               ;82A298|A9DF00  |      ;
    BRA +                                                      ;82A29B|800C    |82A2A9;
 
 
.label2:
    REP #$30                                                   ;82A29D|C230    |      ;
    LDA.W #$00E0                                               ;82A29F|A9E000  |      ;
    BRA +                                                      ;82A2A2|8005    |82A2A9;
 
 
.label3:
    REP #$30                                                   ;82A2A4|C230    |      ;
    LDA.W #$000D                                               ;82A2A6|A90D00  |      ;
 
  + REP #$30                                                   ;82A2A9|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82A2AB|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A2AE|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;82A2B1|2288A681|81A688;
    REP #$20                                                   ;82A2B5|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82A2B7|AD8509  |000985;
    CLC                                                        ;82A2BA|18      |      ;
    ADC.W #$0008                                               ;82A2BB|690800  |      ;
    STA.W nUnknownX                                            ;82A2BE|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;82A2C1|AD8709  |000987;
    CLC                                                        ;82A2C4|18      |      ;
    ADC.W #$0008                                               ;82A2C5|690800  |      ;
    STA.W nUnknownY                                            ;82A2C8|8D8209  |000982;
    REP #$30                                                   ;82A2CB|C230    |      ;
    LDA.W #$00B8                                               ;82A2CD|A9B800  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;82A2D0|8D7A09  |00097A;
    LDA.W #$0000                                               ;82A2D3|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;82A2D6|8D7E09  |00097E;
    SEP #$20                                                   ;82A2D9|E220    |      ;
    LDA.B #$03                                                 ;82A2DB|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;82A2DD|8D7409  |000974;
    LDA.B #$00                                                 ;82A2E0|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;82A2E2|8D7509  |000975;
    LDA.B #$00                                                 ;82A2E5|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;82A2E7|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;82A2EA|2200A581|81A500;
    REP #$20                                                   ;82A2EE|C220    |      ;
    LDA.W #$0006                                               ;82A2F0|A90600  |      ;
    JSL.L fGameEngine_AddWood                                  ;82A2F3|2224B283|83B224;
 
.return:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-8)
    RTS                                                        ;82A306|60      |      ;
 
 
fToolUsedAction0x15_Sprinkler:
    SEP #$20                                                   ;82A307|E220    |      ;
    REP #$10                                                   ;82A309|C210    |      ;
    SEP #$20                                                   ;82A30B|E220    |      ;
    REP #$10                                                   ;82A30D|C210    |      ;
    LDA.B #$00                                                 ;82A30F|A900    |      ;
    STA.W strcAudio.reg114                                     ;82A311|8D1401  |000114;
    LDA.B #$07                                                 ;82A314|A907    |      ;
    STA.W strcAudio.reg115                                     ;82A316|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;82A319|22328383|838332;
    SEP #$20                                                   ;82A31D|E220    |      ;
    LDA.B #$00                                                 ;82A31F|A900    |      ;
    XBA                                                        ;82A321|EB      |      ;
    LDA.W strcStockData.unkAnyTool                             ;82A322|AD6B09  |00096B;
    JSR.W fToolUsed_GetSoundForTileOffset                              ;82A325|20D692  |8292D6;
    BNE +                                                      ;82A328|D003    |82A32D;
    JMP.W .return                                              ;82A32A|4C57A3  |82A357;
 
 
  + REP #$30                                                   ;82A32D|C230    |      ;
    TXA                                                        ;82A32F|8A      |      ;
    INC A                                                      ;82A330|1A      |      ;
    PHA                                                        ;82A331|48      |      ;
    SEP #$20                                                   ;82A332|E220    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82A334|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A337|AC8709  |000987;
    JSL.L fMap_UpdateCurrentTilemap                            ;82A33A|223AB082|82B03A;
    REP #$20                                                   ;82A33E|C220    |      ;
    PLA                                                        ;82A340|68      |      ;
    ASL A                                                      ;82A341|0A      |      ;
    ASL A                                                      ;82A342|0A      |      ;
    TAY                                                        ;82A343|A8      |      ;
    SEP #$20                                                   ;82A344|E220    |      ;
    LDA.B #$00                                                 ;82A346|A900    |      ;
    XBA                                                        ;82A348|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82A349|B70D    |00000D;
    REP #$20                                                   ;82A34B|C220    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82A34D|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A350|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;82A353|2288A681|81A688;
 
.return:
    SEP #$20                                                   ;82A357|E220    |      ;
    LDA.W strcStockData.unkAnyTool                             ;82A359|AD6B09  |00096B;
    INC A                                                      ;82A35C|1A      |      ;
    STA.W strcStockData.unkAnyTool                             ;82A35D|8D6B09  |00096B;
    CMP.B #$09                                                 ;82A360|C909    |      ;
    BNE .justReturn                                            ;82A362|D012    |82A376;
    STZ.W strcStockData.unkAnyTool                             ;82A364|9C6B09  |00096B;
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-8)
 
.justReturn:
    RTS                                                        ;82A376|60      |      ;
 
 
fToolUsedAction0x16_BeanstalkSeed:
    SEP #$20                                                   ;82A377|E220    |      ;
    REP #$10                                                   ;82A379|C210    |      ;
    LDA.L nCurrentTimeID                                       ;82A37B|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;82A37F|C911    |      ;
    BCS +                                                      ;82A381|B01F    |82A3A2;
    LDA.B strcMap.loadAreaId                                   ;82A383|A522    |000022;
    CMP.B #$31                                                 ;82A385|C931    |      ;
    BNE +                                                      ;82A387|D019    |82A3A2;
    REP #$30                                                   ;82A389|C230    |      ;
    %SetFlag(event3, $0200)
    LDA.W #$0042                                               ;82A396|A94200  |      ;
    JSL.L fTileScript_Start                                ;82A399|22E1A581|81A5E1;
    SEP #$20                                                   ;82A39D|E220    |      ;
    STZ.W strcPlayerData.toolEquipped                          ;82A39F|9C2109  |000921;
 
  + %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;82A3A9|60      |      ;
 
 
fToolUsedAction0x17_BlueDiamond:
    SEP #$20                                                   ;82A3AA|E220    |      ;
    REP #$10                                                   ;82A3AC|C210    |      ;
    LDA.L nCurrentTimeID                                       ;82A3AE|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;82A3B2|C911    |      ;
    BCS +                                                      ;82A3B4|B03F    |82A3F5;
    LDA.B strcMap.loadAreaId                                   ;82A3B6|A522    |000022;
    CMP.B #$34                                                 ;82A3B8|C934    |      ;
    BNE +                                                      ;82A3BA|D039    |82A3F5;
    REP #$30                                                   ;82A3BC|C230    |      ;
    LDA.W #$0001                                               ;82A3BE|A90100  |      ;
    LDX.W #$0000                                               ;82A3C1|A20000  |      ;
    LDY.W #$0000                                               ;82A3C4|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;82A3C7|224ED181|81D14E;
    REP #$30                                                   ;82A3CB|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82A3CD|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A3D0|AC8709  |000987;
    LDA.W #$0000                                               ;82A3D3|A90000  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82A3D6|2261AC82|82AC61;
    REP #$30                                                   ;82A3DA|C230    |      ;
    CPX.W #$00F6                                               ;82A3DC|E0F600  |      ;
    BNE +                                                      ;82A3DF|D014    |82A3F5;
    REP #$30                                                   ;82A3E1|C230    |      ;
    %AIExecute($0000, $0012, $0000)
    SEP #$20                                                   ;82A3F0|E220    |      ;
    STZ.W strcPlayerData.toolEquipped                          ;82A3F2|9C2109  |000921;
 
  + %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;82A3FC|60      |      ;
 
 
fToolUsedAction0x18_BlueFeather:
    REP #$30                                                   ;82A3FD|C230    |      ;
    %SetPlayerAction(!PACTION_NONE)
    REP #$20                                                   ;82A406|C220    |      ;
    %SetFlag(daily3, $0040)
    RTS                                                        ;82A413|60      |      ;
 
 
fToolUsedAction0x19_ChickenFeed:
    SEP #$20                                                   ;82A414|E220    |      ;
    REP #$10                                                   ;82A416|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;82A418|A522    |000022;
    CMP.B #$28                                                 ;82A41A|C928    |      ;
    BNE .label1                                                ;82A41C|D055    |82A473;
    REP #$20                                                   ;82A41E|C220    |      ;
    LDA.W #$0001                                               ;82A420|A90100  |      ;
    LDX.W #$0006                                               ;82A423|A20600  |      ;
    LDY.W #$0006                                               ;82A426|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;82A429|224ED181|81D14E;
    REP #$30                                                   ;82A42D|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82A42F|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A432|AC8709  |000987;
    LDA.W #$0000                                               ;82A435|A90000  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82A438|2261AC82|82AC61;
    CPX.W #$00E2                                               ;82A43C|E0E200  |      ;
    BCC .label1                                                ;82A43F|9032    |82A473;
    CPX.W #$00EF                                               ;82A441|E0EF00  |      ;
    BCS .label1                                                ;82A444|B02D    |82A473;
    REP #$20                                                   ;82A446|C220    |      ;
    TXA                                                        ;82A448|8A      |      ;
    SEC                                                        ;82A449|38      |      ;
    SBC.W #$00E2                                               ;82A44A|E9E200  |      ;
    ASL A                                                      ;82A44D|0A      |      ;
    TAX                                                        ;82A44E|AA      |      ;
    LDA.L nCowFeedFlagsTable,X                                 ;82A44F|BF71A582|82A571;
    ORA.W strcPlayerData.placedChickenFeedFlags                ;82A453|0D3409  |000934;
    STA.W strcPlayerData.placedChickenFeedFlags                ;82A456|8D3409  |000934;
    SEP #$20                                                   ;82A459|E220    |      ;
    LDA.W strcPlayerData.placedChcikenFeed                     ;82A45B|AD3109  |000931;
    INC A                                                      ;82A45E|1A      |      ;
    STA.W strcPlayerData.placedChcikenFeed                     ;82A45F|8D3109  |000931;
    REP #$20                                                   ;82A462|C220    |      ;
    LDA.W #$0099                                               ;82A464|A99900  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82A467|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A46A|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;82A46D|2288A681|81A688;
    BRA .label2                                                ;82A471|8031    |82A4A4;
 
 
.label1:
    REP #$20                                                   ;82A473|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82A475|AD8509  |000985;
    STA.W nUnknownX                                            ;82A478|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;82A47B|AD8709  |000987;
    STA.W nUnknownY                                            ;82A47E|8D8209  |000982;
    REP #$30                                                   ;82A481|C230    |      ;
    LDA.W #$00C4                                               ;82A483|A9C400  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;82A486|8D7A09  |00097A;
    LDA.W #$0000                                               ;82A489|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;82A48C|8D7E09  |00097E;
    SEP #$20                                                   ;82A48F|E220    |      ;
    LDA.B #$03                                                 ;82A491|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;82A493|8D7409  |000974;
    LDA.B #$00                                                 ;82A496|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;82A498|8D7509  |000975;
    LDA.B #$00                                                 ;82A49B|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;82A49D|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;82A4A0|2200A581|81A500;
 
.label2:
    %DecreaseStock(leftChickenFood)
    BNE +                                                      ;82A4AD|D003    |82A4B2;
    STZ.W strcPlayerData.toolEquipped                          ;82A4AF|9C2109  |000921;
 
  + %UpdateStamina(-2)
    %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;82A4C1|60      |      ;
 
 
fToolUsedAction0x1A_CowFeed:
    SEP #$20                                                   ;82A4C2|E220    |      ;
    REP #$10                                                   ;82A4C4|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;82A4C6|A522    |000022;
    CMP.B #$27                                                 ;82A4C8|C927    |      ;
    BNE .label1                                                ;82A4CA|D055    |82A521;
    REP #$20                                                   ;82A4CC|C220    |      ;
    LDA.W #$0001                                               ;82A4CE|A90100  |      ;
    LDX.W #$0006                                               ;82A4D1|A20600  |      ;
    LDY.W #$0006                                               ;82A4D4|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;82A4D7|224ED181|81D14E;
    REP #$30                                                   ;82A4DB|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82A4DD|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A4E0|AC8709  |000987;
    LDA.W #$0000                                               ;82A4E3|A90000  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;82A4E6|2261AC82|82AC61;
    CPX.W #$00E2                                               ;82A4EA|E0E200  |      ;
    BCC .label1                                                ;82A4ED|9032    |82A521;
    CPX.W #$00EF                                               ;82A4EF|E0EF00  |      ;
    BCS .label1                                                ;82A4F2|B02D    |82A521;
    REP #$20                                                   ;82A4F4|C220    |      ;
    TXA                                                        ;82A4F6|8A      |      ;
    SEC                                                        ;82A4F7|38      |      ;
    SBC.W #$00E2                                               ;82A4F8|E9E200  |      ;
    ASL A                                                      ;82A4FB|0A      |      ;
    TAX                                                        ;82A4FC|AA      |      ;
    LDA.L nCowFeedFlagsTable,X                                 ;82A4FD|BF71A582|82A571;
    ORA.W strcPlayerData.placedCowFeedFlags                    ;82A501|0D3209  |000932;
    STA.W strcPlayerData.placedCowFeedFlags                    ;82A504|8D3209  |000932;
    SEP #$20                                                   ;82A507|E220    |      ;
    LDA.W strcPlayerData.placedCowFeed                         ;82A509|AD3009  |000930;
    INC A                                                      ;82A50C|1A      |      ;
    STA.W strcPlayerData.placedCowFeed                         ;82A50D|8D3009  |000930;
    REP #$20                                                   ;82A510|C220    |      ;
    LDA.W #$0099                                               ;82A512|A99900  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;82A515|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;82A518|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;82A51B|2288A681|81A688;
    BRA .label2                                                ;82A51F|8031    |82A552;
 
 
.label1:
    REP #$20                                                   ;82A521|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;82A523|AD8509  |000985;
    STA.W nUnknownX                                            ;82A526|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;82A529|AD8709  |000987;
    STA.W nUnknownY                                            ;82A52C|8D8209  |000982;
    REP #$30                                                   ;82A52F|C230    |      ;
    LDA.W #$00C4                                               ;82A531|A9C400  |      ;
    STA.W $097A+!DE_RAM_SHIFT                              ;82A534|8D7A09  |00097A;
    LDA.W #$0000                                               ;82A537|A90000  |      ;
    STA.W $097E+!DE_RAM_SHIFT                              ;82A53A|8D7E09  |00097E;
    SEP #$20                                                   ;82A53D|E220    |      ;
    LDA.B #$03                                                 ;82A53F|A903    |      ;
    STA.W $0974+!DE_RAM_SHIFT                              ;82A541|8D7409  |000974;
    LDA.B #$00                                                 ;82A544|A900    |      ;
    STA.W $0975+!DE_RAM_SHIFT                              ;82A546|8D7509  |000975;
    LDA.B #$00                                                 ;82A549|A900    |      ;
    STA.W $0976+!DE_RAM_SHIFT                              ;82A54B|8D7609  |000976;
    JSL.L fObjectSlots_Allocate                                      ;82A54E|2200A581|81A500;
 
.label2:
    %DecreaseStock(leftCowFood)
    BNE +                                                      ;82A55B|D003    |82A560;
    STZ.W strcPlayerData.toolEquipped                          ;82A55D|9C2109  |000921;
 
  + %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-2)
    RTS                                                        ;82A56F|60      |      ;
 
 
fToolUsedAction0x1B_FishingPole:
    RTS                                                        ;82A570|60      |      ;
 
 
nCowFeedFlagsTable:
    dw $0001,$0002,$0004,$0008,$0010,$0020                     ;82A571|        |      ; 16b
    dw $0040,$0080,$0100,$0200,$0400,$0800                     ;82A57D|        |      ;
    dw $1000                                                   ;82A589|        |      ;
aToolUsedAnimationTable:
    if !REGION_DE
    dw fToolUsedAnimation0x00_Empty
    dw fToolUsedAnimation0x01_Sickle
    dw fToolUsedAnimation0x02_Plow
    dw fToolUsedAnimation0x03_Hammer
    dw fToolUsedAnimation0x04_Axe
    dw fToolUsedAnimation0x05_CornSeedBag
    dw fToolUsedAnimation0x06_TomatoSeedBag
    dw fToolUsedAnimation0x07_PotatoSeedBag
    dw fToolUsedAnimation0x08_TurnipSeedBag
    dw fToolUsedAnimation0x09_CowMedicine
    dw fToolUsedAnimation0x0A_MiraclePotion
    dw fToolUsedAnimation0x0B_Bell
    dw fToolUsedAnimation0x0C_GrassSeedBag
    dw fToolUsedAnimation0x0D_Paint
    dw fToolUsedAnimation0x0E_Milker
    dw fToolUsedAnimation0x0F_Brush
    dw fToolUsedAnimation0x10_WateringCan
    dw fToolUsedAnimation0x11_GoldenSickle
    dw fToolUsedAnimation0x12_GoldenPlow
    dw fToolUsedAnimation0x13_GoldenHammer
    dw fToolUsedAnimation0x14_GoldenAxe
    dw fToolUsedAnimation0x15_Sprinkler
    dw fToolUsedAnimation0x16_BeanstalkSeed
    dw fToolUsedAnimation0x17_BlueDiamond
    dw fToolUsedAnimation0x18_BlueFeather
    dw fToolUsedAnimation0x19_ChickenFood
    dw fToolUsedAnimation0x1A_CowFood
    dw fToolUsedAnimation0x1B_FishingPole
    dw fToolUsedAction0x00_Empty
    dw fToolUsedAction0x01_Sickle
    dw fToolUsedAction0x02_Plow
    dw fToolUsedAction0x03_Hammer
    dw fToolUsedAction0x04_Axe
    dw fToolUsedAction0x05_CornSeedBag
    dw fToolUsedAction0x06_TomatoSeedBag
    dw fToolUsedAction0x07_PotatoSeedBag
    dw fToolUsedAction0x08_TurnipSeedBag
    dw fToolUsedAction0x09_CowMedicine
    dw fToolUsedAction0x0A_MiraclePotion
    dw fToolUsedAction0x0B_Bell
    dw fToolUsedAction0x0C_GrassSeedBag
    dw fToolUsedAction0x0D_Paint
    dw fToolUsedAction0x0E_Milker
    dw fToolUsedAction0x0F_Brush
    dw fToolUsedAction0x10_WateringCan
    dw fToolUsedAction0x11_GoldenSickle
    dw fToolUsedAction0x12_GoldenPlow
    dw fToolUsedAction0x13_GolderHammer
    dw fToolUsedAction0x14_GoldenAxe
    dw fToolUsedAction0x15_Sprinkler
    dw fToolUsedAction0x16_BeanstalkSeed
    dw fToolUsedAction0x17_BlueDiamond
    dw fToolUsedAction0x18_BlueFeather
    dw fToolUsedAction0x19_ChickenFeed
    dw fToolUsedAction0x1A_CowFeed
    dw fToolUsedAction0x1B_FishingPole
    aToolUsedActionTable = $82A748
    else
    dw fToolUsedAnimation0x00_Empty                            ;82A58B|        |8290DD; 0x1C * [ptr16]
    dw fToolUsedAnimation0x01_Sickle                           ;82A58D|        |8290DE;
    dw fToolUsedAnimation0x02_Plow                             ;82A58F|        |8290EC;
    dw fToolUsedAnimation0x03_Hammer                           ;82A591|        |8290FA;
    dw fToolUsedAnimation0x04_Axe                              ;82A593|        |829108;
    dw fToolUsedAnimation0x05_CornSeedBag                      ;82A595|        |829116;
    dw fToolUsedAnimation0x06_TomatoSeedBag                    ;82A597|        |829121;
    dw fToolUsedAnimation0x07_PotatoSeedBag                    ;82A599|        |82912C;
    dw fToolUsedAnimation0x08_TurnipSeedBag                    ;82A59B|        |829137;
    dw fToolUsedAnimation0x09_CowMedicine                      ;82A59D|        |829142;
    dw fToolUsedAnimation0x0A_MiraclePotion                    ;82A59F|        |829150;
    dw fToolUsedAnimation0x0B_Bell                             ;82A5A1|        |82915E;
    dw fToolUsedAnimation0x0C_GrassSeedBag                     ;82A5A3|        |829179;
    dw fToolUsedAnimation0x0D_Paint                            ;82A5A5|        |829184;
    dw fToolUsedAnimation0x0E_Milker                           ;82A5A7|        |82918D;
    dw fToolUsedAnimation0x0F_Brush                            ;82A5A9|        |82919B;
    dw fToolUsedAnimation0x10_WateringCan                      ;82A5AB|        |8291A9;
    dw fToolUsedAnimation0x11_GoldenSickle                     ;82A5AD|        |8291E8;
    dw fToolUsedAnimation0x12_GoldenPlow                       ;82A5AF|        |8291F1;
    dw fToolUsedAnimation0x13_GoldenHammer                     ;82A5B1|        |8291FD;
    dw fToolUsedAnimation0x14_GoldenAxe                        ;82A5B3|        |829209;
    dw fToolUsedAnimation0x15_Sprinkler                        ;82A5B5|        |829215;
    dw fToolUsedAnimation0x16_BeanstalkSeed                    ;82A5B7|        |82921E;
    dw fToolUsedAnimation0x17_BlueDiamond                      ;82A5B9|        |82922A;
    dw fToolUsedAnimation0x18_BlueFeather                      ;82A5BB|        |829236;
    dw fToolUsedAnimation0x19_ChickenFood                      ;82A5BD|        |82923F;
    dw fToolUsedAnimation0x1A_CowFood                          ;82A5BF|        |82924B;
    dw fToolUsedAnimation0x1B_FishingPole                      ;82A5C1|        |829257;
aToolUsedActionTable:
    dw fToolUsedAction0x00_Empty                               ;82A5C3|        |82931E; 0x1C * [ptr16]
    dw fToolUsedAction0x01_Sickle                              ;82A5C5|        |829328;
    dw fToolUsedAction0x02_Plow                                ;82A5C7|        |829460;
    dw fToolUsedAction0x03_Hammer                              ;82A5C9|        |8295C0;
    dw fToolUsedAction0x04_Axe                                 ;82A5CB|        |8297BD;
    dw fToolUsedAction0x05_CornSeedBag                         ;82A5CD|        |829999;
    dw fToolUsedAction0x06_TomatoSeedBag                       ;82A5CF|        |8299F8;
    dw fToolUsedAction0x07_PotatoSeedBag                       ;82A5D1|        |829A57;
    dw fToolUsedAction0x08_TurnipSeedBag                       ;82A5D3|        |829AB4;
    dw fToolUsedAction0x09_CowMedicine                         ;82A5D5|        |829B11;
    dw fToolUsedAction0x0A_MiraclePotion                       ;82A5D7|        |829B31;
    dw fToolUsedAction0x0B_Bell                                ;82A5D9|        |829B51;
    dw fToolUsedAction0x0C_GrassSeedBag                        ;82A5DB|        |829B61;
    dw fToolUsedAction0x0D_Paint                               ;82A5DD|        |829BCB;
    dw fToolUsedAction0x0E_Milker                              ;82A5DF|        |829CC0;
    dw fToolUsedAction0x0F_Brush                               ;82A5E1|        |829CC8;
    dw fToolUsedAction0x10_WateringCan                         ;82A5E3|        |829CD8;
    dw fToolUsedAction0x11_GoldenSickle                        ;82A5E5|        |829D42;
    dw fToolUsedAction0x12_GoldenPlow                          ;82A5E7|        |829E8E;
    dw fToolUsedAction0x13_GolderHammer                        ;82A5E9|        |82A005;
    dw fToolUsedAction0x14_GoldenAxe                           ;82A5EB|        |82A1BF;
    dw fToolUsedAction0x15_Sprinkler                           ;82A5ED|        |82A307;
    dw fToolUsedAction0x16_BeanstalkSeed                       ;82A5EF|        |82A377;
    dw fToolUsedAction0x17_BlueDiamond                         ;82A5F1|        |82A3AA;
    dw fToolUsedAction0x18_BlueFeather                         ;82A5F3|        |82A3FD;
    dw fToolUsedAction0x19_ChickenFeed                         ;82A5F5|        |82A414;
    dw fToolUsedAction0x1A_CowFeed                             ;82A5F7|        |82A4C2;
    dw fToolUsedAction0x1B_FishingPole                         ;82A5F9|        |82A570;
    endif
