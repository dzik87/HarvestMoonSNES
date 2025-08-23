 
    ORG $818000
 
 
fUnknown_818000:
    SEP #$20                                                   ;818000|E220    |      ;
    REP #$10                                                   ;818002|C210    |      ;
    LDA.B #$01                                                 ;818004|A901    |      ;
    STA.W $0974                                                ;818006|8D7409  |000974;
    LDA.B #$01                                                 ;818009|A901    |      ;
    STA.W $0975                                                ;81800B|8D7509  |000975;
    LDA.B #$00                                                 ;81800E|A900    |      ;
    STA.W $0976                                                ;818010|8D7609  |000976;
    LDA.W strcPlayerData.carryItemId                           ;818013|AD1D09  |00091D;
    STA.W nCarriedItemId                                       ;818016|8D8409  |000984;
    REP #$20                                                   ;818019|C220    |      ;
    LDA.W #$0002                                               ;81801B|A90200  |      ;
    CLC                                                        ;81801E|18      |      ;
    ADC.B strcPlayer.direction                                 ;81801F|65DA    |0000DA;
    TAY                                                        ;818021|A8      |      ;
    JSL.L fUnknown_8180B7                                      ;818022|22B78081|8180B7;
    REP #$20                                                   ;818026|C220    |      ;
    LDA.B strcPlayer.posX                                      ;818028|A5D6    |0000D6;
    STA.W nUnknownX                                            ;81802A|8D8009  |000980;
    LDA.B strcPlayer.posY                                      ;81802D|A5D8    |0000D8;
    INC A                                                      ;81802F|1A      |      ;
    INC A                                                      ;818030|1A      |      ;
    STA.W nUnknownY                                            ;818031|8D8209  |000982;
    JSL.L fUnknown_81A500                                      ;818034|2200A581|81A500;
    REP #$30                                                   ;818038|C230    |      ;
    LDA.W #$0001                                               ;81803A|A90100  |      ;
    LDX.W #$0000                                               ;81803D|A20000  |      ;
    LDY.W #$0000                                               ;818040|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;818043|224ED181|81D14E;
    SEP #$20                                                   ;818047|E220    |      ;
    REP #$10                                                   ;818049|C210    |      ;
    LDA.B #$00                                                 ;81804B|A900    |      ;
    XBA                                                        ;81804D|EB      |      ;
    LDA.W nCarriedItemId                                       ;81804E|AD8409  |000984;
    REP #$20                                                   ;818051|C220    |      ;
    TAX                                                        ;818053|AA      |      ;
    SEP #$20                                                   ;818054|E220    |      ;
    LDA.L nItemCarriedIndexForTilemap,X                        ;818056|BFADA281|81A2AD;
    BEQ +                                                      ;81805A|F016    |818072;
    REP #$20                                                   ;81805C|C220    |      ;
    ASL A                                                      ;81805E|0A      |      ;
    ASL A                                                      ;81805F|0A      |      ;
    TAY                                                        ;818060|A8      |      ;
    SEP #$20                                                   ;818061|E220    |      ;
    LDA.B #$00                                                 ;818063|A900    |      ;
    XBA                                                        ;818065|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;818066|B70D    |00000D;
    LDX.W nTileInFrontOfPlayerX                                ;818068|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;81806B|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;81806E|2288A681|81A688;
 
  + SEP #$20                                                   ;818072|E220    |      ;
    REP #$10                                                   ;818074|C210    |      ;
    LDA.B #$00                                                 ;818076|A900    |      ;
    XBA                                                        ;818078|EB      |      ;
    LDA.W nCarriedItemId                                       ;818079|AD8409  |000984;
    REP #$20                                                   ;81807C|C220    |      ;
    TAX                                                        ;81807E|AA      |      ;
    SEP #$20                                                   ;81807F|E220    |      ;
    LDA.L nSoundItemCarriedTable_81A308,X                      ;818081|BF08A381|81A308;
    BEQ +                                                      ;818085|F012    |818099;
    SEP #$20                                                   ;818087|E220    |      ;
    REP #$10                                                   ;818089|C210    |      ;
    LDA.B #$08                                                 ;81808B|A908    |      ;
    STA.W strcAudio.reg114                                     ;81808D|8D1401  |000114;
    LDA.B #$06                                                 ;818090|A906    |      ;
    STA.W strcAudio.reg115                                     ;818092|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;818095|22328383|838332;
 
  + RTL                                                        ;818099|6B      |      ;
 
 
subUnknown81A58B_0x01:
    SEP #$20                                                   ;81809A|E220    |      ;
    REP #$10                                                   ;81809C|C210    |      ;
    LDA.B #$00                                                 ;81809E|A900    |      ;
    XBA                                                        ;8180A0|EB      |      ;
    LDA.W nCarriedItemId                                       ;8180A1|AD8409  |000984;
    ASL A                                                      ;8180A4|0A      |      ;
    TAX                                                        ;8180A5|AA      |      ;
    JSR.W (pItemCarriedSubrutines,X)                           ;8180A6|FCC097  |8197C0;
    REP #$30                                                   ;8180A9|C230    |      ;
    %UnsetFlag(daily3, $0001)
    RTS                                                        ;8180B6|60      |      ;
 
 
fUnknown_8180B7:
    SEP #$20                                                   ;8180B7|E220    |      ;
    REP #$10                                                   ;8180B9|C210    |      ;
    LDA.B #$00                                                 ;8180BB|A900    |      ;
    XBA                                                        ;8180BD|EB      |      ;
    LDA.W nCarriedItemId                                       ;8180BE|AD8409  |000984;
    REP #$20                                                   ;8180C1|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;8180C3|857E    |00007E;
    ASL A                                                      ;8180C5|0A      |      ;
    CLC                                                        ;8180C6|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8180C7|657E    |00007E;
    TAX                                                        ;8180C9|AA      |      ;
    LDA.L pItemCarriedTable_8196AF,X                           ;8180CA|BFAF9681|8196AF;
    STA.B ptrTemp0x72                                          ;8180CE|8572    |000072;
    INX                                                        ;8180D0|E8      |      ;
    INX                                                        ;8180D1|E8      |      ;
    SEP #$20                                                   ;8180D2|E220    |      ;
    LDA.L pItemCarriedTable_8196AF,X                           ;8180D4|BFAF9681|8196AF;
    STA.B ptrTemp0x72+2                                        ;8180D8|8574    |000074;
    REP #$30                                                   ;8180DA|C230    |      ;
    TYA                                                        ;8180DC|98      |      ;
    STA.B strcVariables.n16Temp1                               ;8180DD|857E    |00007E;
    ASL A                                                      ;8180DF|0A      |      ;
    CLC                                                        ;8180E0|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8180E1|657E    |00007E;
    TAY                                                        ;8180E3|A8      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;8180E4|B772    |000072;
    STA.W $097A                                                ;8180E6|8D7A09  |00097A;
    INY                                                        ;8180E9|C8      |      ;
    INY                                                        ;8180EA|C8      |      ;
    SEP #$20                                                   ;8180EB|E220    |      ;
    LDA.B #$00                                                 ;8180ED|A900    |      ;
    XBA                                                        ;8180EF|EB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;8180F0|B772    |000072;
    REP #$20                                                   ;8180F2|C220    |      ;
    ASL A                                                      ;8180F4|0A      |      ;
    ASL A                                                      ;8180F5|0A      |      ;
    ASL A                                                      ;8180F6|0A      |      ;
    ASL A                                                      ;8180F7|0A      |      ;
    ASL A                                                      ;8180F8|0A      |      ;
    ASL A                                                      ;8180F9|0A      |      ;
    STA.W $097E                                                ;8180FA|8D7E09  |00097E; A * 64
    RTL                                                        ;8180FD|6B      |      ;
 
 
subItemCarried_Mushroom:
    JSR.W fUnknown_818855                                      ;8180FE|205588  |818855;
    RTS                                                        ;818101|60      |      ;
 
 
subItemCarried_PoisonMushroom:
    JSR.W fUnknown_818855                                      ;818102|205588  |818855;
    RTS                                                        ;818105|60      |      ;
 
 
subItemCarried_WildGrape:
    JSR.W fUnknown_818855                                      ;818106|205588  |818855;
    RTS                                                        ;818109|60      |      ;
 
 
subItemCarried_BerryStrongSmell:
    JSR.W fUnknown_818855                                      ;81810A|205588  |818855;
    RTS                                                        ;81810D|60      |      ;
 
 
subItemCarried_MoonFlower:
    JSR.W fUnknown_818855                                      ;81810E|205588  |818855;
    RTS                                                        ;818111|60      |      ;
 
 
subItemCarried_Cake:
    JSR.W fUnknown_818855                                      ;818112|205588  |818855;
    RTS                                                        ;818115|60      |      ;
 
 
subItemCarried_Fish:
    JSR.W fUnknown_818855                                      ;818116|205588  |818855;
    RTS                                                        ;818119|60      |      ;
 
 
subItemCarried_PowerBerry:
    JSR.W fUnknown_818855                                      ;81811A|205588  |818855;
    RTS                                                        ;81811D|60      |      ;
 
 
subItemCarried_Bush:
    JSR.W fUnknown_8188E5                                      ;81811E|20E588  |8188E5;
    RTS                                                        ;818121|60      |      ;
 
 
subItemCarried_Bush2:
    JSR.W fUnknown_8188E5                                      ;818122|20E588  |8188E5;
    RTS                                                        ;818125|60      |      ;
 
 
subItemCarried_0x0D:
    JSR.W fUnknown_81889A                                      ;818126|209A88  |81889A;
    RTS                                                        ;818129|60      |      ;
 
 
subItemCarried_0x0E:
    JSR.W fUnknown_81889A                                      ;81812A|209A88  |81889A;
    RTS                                                        ;81812D|60      |      ;
 
 
subItemCarried_0x57:
    JSR.W fUnknown_81889A                                      ;81812E|209A88  |81889A;
    RTS                                                        ;818131|60      |      ;
 
 
subItemCarried_Corn:
    JSR.W fUnknown_8188E5                                      ;818132|20E588  |8188E5;
    REP #$30                                                   ;818135|C230    |      ;
    %CheckFlag(daily3, $0001)
    BEQ +                                                      ;81813E|F009    |818149;
    LDA.L nStatShippedCorns                                    ;818140|AF4A1F7F|7F1F4A;
    INC A                                                      ;818144|1A      |      ;
    STA.L nStatShippedCorns                                    ;818145|8F4A1F7F|7F1F4A;
 
  + RTS                                                        ;818149|60      |      ;
 
 
subItemCarried_Tomato:
    JSR.W fUnknown_8188E5                                      ;81814A|20E588  |8188E5;
    REP #$30                                                   ;81814D|C230    |      ;
    %CheckFlag(daily3, $0001)
    BEQ +                                                      ;818156|F009    |818161;
    LDA.L nStatShippedTomatoes                                 ;818158|AF4C1F7F|7F1F4C;
    INC A                                                      ;81815C|1A      |      ;
    STA.L nStatShippedTomatoes                                 ;81815D|8F4C1F7F|7F1F4C;
 
  + RTS                                                        ;818161|60      |      ;
 
 
subItemCarried_Potato:
    JSR.W fUnknown_8188E5                                      ;818162|20E588  |8188E5;
    REP #$30                                                   ;818165|C230    |      ;
    %CheckFlag(daily3, $0001)
    BEQ +                                                      ;81816E|F009    |818179;
    LDA.L nStatShippedPotatoes                                 ;818170|AF501F7F|7F1F50;
    INC A                                                      ;818174|1A      |      ;
    STA.L nStatShippedPotatoes                                 ;818175|8F501F7F|7F1F50;
 
  + RTS                                                        ;818179|60      |      ;
 
 
subItemCarried_Turnip:
    JSR.W fUnknown_8188E5                                      ;81817A|20E588  |8188E5; X = 26
    REP #$30                                                   ;81817D|C230    |      ;
    %CheckFlag(daily3, $0001)
    BEQ +                                                      ;818186|F009    |818191;
    LDA.L nStatShippedTurnips                                  ;818188|AF4E1F7F|7F1F4E;
    INC A                                                      ;81818C|1A      |      ;
    STA.L nStatShippedTurnips                                  ;81818D|8F4E1F7F|7F1F4E;
 
  + RTS                                                        ;818191|60      |      ;
 
 
subItemCarried_Egg:
    JSR.W fUnknown_8188E5                                      ;818192|20E588  |8188E5;
    RTS                                                        ;818195|60      |      ;
 
 
subItemCarried_SmallMilk:
    JSR.W fUnknown_8188E5                                      ;818196|20E588  |8188E5;
    RTS                                                        ;818199|60      |      ;
 
 
subItemCarried_MediumMilk:
    JSR.W fUnknown_8188E5                                      ;81819A|20E588  |8188E5;
    RTS                                                        ;81819D|60      |      ;
 
 
subItemCarried_LargeMilk:
    JSR.W fUnknown_8188E5                                      ;81819E|20E588  |8188E5;
    RTS                                                        ;8181A1|60      |      ;
 
 
subItemCarried_Herb:
    JSR.W fUnknown_8188E5                                      ;8181A2|20E588  |8188E5;
    RTS                                                        ;8181A5|60      |      ;
 
 
subItemCarried_Flower:
    JSR.W fUnknown_8188E5                                      ;8181A6|20E588  |8188E5;
    RTS                                                        ;8181A9|60      |      ;
 
 
subItemCarried_Feed:
    JSR.W fUnknown_8188BC                                      ;8181AA|20BC88  |8188BC;
    RTS                                                        ;8181AD|60      |      ;
 
 
subItemCarried_GreenPerfume:
    JSR.W fUnknown_818923                                      ;8181AE|202389  |818923;
    SEP #$20                                                   ;8181B1|E220    |      ;
    LDA.W $0976                                                ;8181B3|AD7609  |000976;
    CMP.B #$FF                                                 ;8181B6|C9FF    |      ;
    BNE +                                                      ;8181B8|D00D    |8181C7;
    SEP #$20                                                   ;8181BA|E220    |      ;
    STZ.W $0976                                                ;8181BC|9C7609  |000976;
    LDA.B #!EITEM_PERFUMEGREEN                                                 
    STA.W nCarriedItemId                                       ;8181C1|8D8409  |000984;
    STA.W strcPlayerData.carryItemId                           ;8181C4|8D1D09  |00091D;
 
  + RTS                                                        ;8181C7|60      |      ;
 
 
subItemCarried_RedPerfume:
    JSR.W fUnknown_818923                                      ;8181C8|202389  |818923;
    SEP #$20                                                   ;8181CB|E220    |      ;
    LDA.W $0976                                                ;8181CD|AD7609  |000976;
    CMP.B #$FF                                                 ;8181D0|C9FF    |      ;
    BNE +                                                      ;8181D2|D00D    |8181E1;
    SEP #$20                                                   ;8181D4|E220    |      ;
    STZ.W $0976                                                ;8181D6|9C7609  |000976;
    LDA.B #!EITEM_PERFUMERED                                                 
    STA.W nCarriedItemId                                       ;8181DB|8D8409  |000984;
    STA.W strcPlayerData.carryItemId                           ;8181DE|8D1D09  |00091D;
 
  + RTS                                                        ;8181E1|60      |      ;
 
 
subItemCarried_BluePerfume:
    JSR.W fUnknown_818923                                      ;8181E2|202389  |818923;
    SEP #$20                                                   ;8181E5|E220    |      ;
    LDA.W $0976                                                ;8181E7|AD7609  |000976;
    CMP.B #$FF                                                 ;8181EA|C9FF    |      ;
    BNE +                                                      ;8181EC|D00D    |8181FB;
    SEP #$20                                                   ;8181EE|E220    |      ;
    STZ.W $0976                                                ;8181F0|9C7609  |000976;
    LDA.B #!EITEM_PERFUMEBLUE                                                 
    STA.W nCarriedItemId                                       ;8181F5|8D8409  |000984;
    STA.W strcPlayerData.carryItemId                           ;8181F8|8D1D09  |00091D;
 
  + RTS                                                        ;8181FB|60      |      ;
 
 
subItemCarried_RedEgg:
    REP #$30                                                   ;8181FC|C230    |      ;
    %CheckFlag(unknown1, $0020)
    BEQ +                                                      ;818205|F003    |81820A;
    JMP.W fEggFestivalUnknown_818337                           ;818207|4C3783  |818337;
 
 
  + SEP #$20                                                   ;81820A|E220    |      ;
    REP #$10                                                   ;81820C|C210    |      ;
    LDA.W $0976                                                ;81820E|AD7609  |000976;
    BNE ++                                                     ;818211|D019    |81822C;
    LDA.W $09AC                                                ;818213|ADAC09  |0009AC;
    CMP.B #$01                                                 ;818216|C901    |      ;
    BEQ +                                                      ;818218|F003    |81821D;
    JMP.W fEggFestivalUnknown_WrongEgg                         ;81821A|4C6C83  |81836C;
 
 
  + REP #$30                                                   ;81821D|C230    |      ;
    LDA.W #$00A1                                               ;81821F|A9A100  |      ;
    LDX.W $09AD                                                ;818222|AEAD09  |0009AD;
    LDY.W $09AF                                                ;818225|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;818228|223AB082|82B03A;
 
 ++ JSR.W fUnknown_8188E5                                      ;81822C|20E588  |8188E5;
    SEP #$20                                                   ;81822F|E220    |      ;
    REP #$10                                                   ;818231|C210    |      ;
    LDA.W $0976                                                ;818233|AD7609  |000976;
    CMP.B #$03                                                 ;818236|C903    |      ;
    BNE +                                                      ;818238|D003    |81823D;
    JMP.W fEggFestivalUnknown_81835E                           ;81823A|4C5E83  |81835E;
 
 
  + RTS                                                        ;81823D|60      |      ;
 
 
subItemCarried_LightPurpleEgg:
    REP #$30                                                   ;81823E|C230    |      ;
    %CheckFlag(unknown1, $0020)
    BEQ +                                                      ;818247|F003    |81824C;
    JMP.W fEggFestivalUnknown_818337                           ;818249|4C3783  |818337;
 
 
  + SEP #$20                                                   ;81824C|E220    |      ;
    REP #$10                                                   ;81824E|C210    |      ;
    LDA.W $0976                                                ;818250|AD7609  |000976;
    BNE ++                                                     ;818253|D019    |81826E;
    LDA.W $09AC                                                ;818255|ADAC09  |0009AC;
    CMP.B #$02                                                 ;818258|C902    |      ;
    BEQ +                                                      ;81825A|F003    |81825F;
    JMP.W fEggFestivalUnknown_WrongEgg                         ;81825C|4C6C83  |81836C;
 
 
  + REP #$30                                                   ;81825F|C230    |      ;
    LDA.W #$00A1                                               ;818261|A9A100  |      ;
    LDX.W $09AD                                                ;818264|AEAD09  |0009AD;
    LDY.W $09AF                                                ;818267|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;81826A|223AB082|82B03A;
 
 ++ JSR.W fUnknown_8188E5                                      ;81826E|20E588  |8188E5;
    SEP #$20                                                   ;818271|E220    |      ;
    REP #$10                                                   ;818273|C210    |      ;
    LDA.W $0976                                                ;818275|AD7609  |000976;
    CMP.B #$03                                                 ;818278|C903    |      ;
    BNE .return                                                ;81827A|D003    |81827F;
    JMP.W fEggFestivalUnknown_81835E                           ;81827C|4C5E83  |81835E;
 
 
.return:
    RTS                                                        ;81827F|60      |      ;
 
 
subItemCarried_BlueEgg:
    REP #$30                                                   ;818280|C230    |      ;
    %CheckFlag(unknown1, $0020)
    BEQ +                                                      ;818289|F003    |81828E;
    JMP.W fEggFestivalUnknown_818337                           ;81828B|4C3783  |818337;
 
 
  + SEP #$20                                                   ;81828E|E220    |      ;
    REP #$10                                                   ;818290|C210    |      ;
    LDA.W $0976                                                ;818292|AD7609  |000976;
    BNE ++                                                     ;818295|D019    |8182B0;
    LDA.W $09AC                                                ;818297|ADAC09  |0009AC;
    CMP.B #$03                                                 ;81829A|C903    |      ;
    BEQ +                                                      ;81829C|F003    |8182A1;
    JMP.W fEggFestivalUnknown_WrongEgg                         ;81829E|4C6C83  |81836C;
 
 
  + REP #$30                                                   ;8182A1|C230    |      ;
    LDA.W #$00A1                                               ;8182A3|A9A100  |      ;
    LDX.W $09AD                                                ;8182A6|AEAD09  |0009AD;
    LDY.W $09AF                                                ;8182A9|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;8182AC|223AB082|82B03A;
 
 ++ JSR.W fUnknown_8188E5                                      ;8182B0|20E588  |8188E5;
    SEP #$20                                                   ;8182B3|E220    |      ;
    REP #$10                                                   ;8182B5|C210    |      ;
    LDA.W $0976                                                ;8182B7|AD7609  |000976;
    CMP.B #$03                                                 ;8182BA|C903    |      ;
    BNE +                                                      ;8182BC|D003    |8182C1;
    JMP.W fEggFestivalUnknown_81835E                           ;8182BE|4C5E83  |81835E;
 
 
  + RTS                                                        ;8182C1|60      |      ;
 
 
subItemCarried_PurpleEgg:
    REP #$30                                                   ;8182C2|C230    |      ;
    %CheckFlag(unknown1, $0020)
    BNE fEggFestivalUnknown_818337                             ;8182CB|D06A    |818337;
    SEP #$20                                                   ;8182CD|E220    |      ;
    REP #$10                                                   ;8182CF|C210    |      ;
    LDA.W $0976                                                ;8182D1|AD7609  |000976;
    BNE ++                                                     ;8182D4|D019    |8182EF;
    LDA.W $09AC                                                ;8182D6|ADAC09  |0009AC;
    CMP.B #$04                                                 ;8182D9|C904    |      ;
    BEQ +                                                      ;8182DB|F003    |8182E0;
    JMP.W fEggFestivalUnknown_WrongEgg                         ;8182DD|4C6C83  |81836C;
 
 
  + REP #$30                                                   ;8182E0|C230    |      ;
    LDA.W #$00A1                                               ;8182E2|A9A100  |      ;
    LDX.W $09AD                                                ;8182E5|AEAD09  |0009AD;
    LDY.W $09AF                                                ;8182E8|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;8182EB|223AB082|82B03A;
 
 ++ JSR.W fUnknown_8188E5                                      ;8182EF|20E588  |8188E5;
    SEP #$20                                                   ;8182F2|E220    |      ;
    REP #$10                                                   ;8182F4|C210    |      ;
    LDA.W $0976                                                ;8182F6|AD7609  |000976;
    CMP.B #$03                                                 ;8182F9|C903    |      ;
    BEQ fEggFestivalUnknown_81835E                             ;8182FB|F061    |81835E;
    RTS                                                        ;8182FD|60      |      ;
 
 
subItemCarried_GreenEgg:
    REP #$30                                                   ;8182FE|C230    |      ;
    %CheckFlag(unknown1, $0020)
    BNE fEggFestivalUnknown_818337                             ;818307|D02E    |818337;
    SEP #$20                                                   ;818309|E220    |      ;
    REP #$10                                                   ;81830B|C210    |      ;
    LDA.W $0976                                                ;81830D|AD7609  |000976;
    BNE +                                                      ;818310|D016    |818328;
    LDA.W $09AC                                                ;818312|ADAC09  |0009AC;
    CMP.B #$05                                                 ;818315|C905    |      ;
    BNE fEggFestivalUnknown_WrongEgg                           ;818317|D053    |81836C;
    REP #$30                                                   ;818319|C230    |      ;
    LDA.W #$00A1                                               ;81831B|A9A100  |      ;
    LDX.W $09AD                                                ;81831E|AEAD09  |0009AD;
    LDY.W $09AF                                                ;818321|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;818324|223AB082|82B03A;
 
  + JSR.W fUnknown_8188E5                                      ;818328|20E588  |8188E5;
    SEP #$20                                                   ;81832B|E220    |      ;
    REP #$10                                                   ;81832D|C210    |      ;
    LDA.W $0976                                                ;81832F|AD7609  |000976;
    CMP.B #$03                                                 ;818332|C903    |      ;
    BEQ fEggFestivalUnknown_81835E                             ;818334|F028    |81835E;
    RTS                                                        ;818336|60      |      ;
 
 
fEggFestivalUnknown_818337:
    REP #$30                                                   ;818337|C230    |      ;
    LDA.W nGameObjectIdx                                       ;818339|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;81833C|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;81833E|22A28185|8581A2;
    JSL.L fUnknown_81A4F1                                      ;818342|22F1A481|81A4F1;
    SEP #$20                                                   ;818346|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818348|9C1D09  |00091D;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
 
fEggFestivalUnknown_81835E:
    REP #$30                                                   ;81835E|C230    |      ;
    %SetFlag(unknown1, $0040)
    RTS                                                        ;81836B|60      |      ;
 
 
fEggFestivalUnknown_WrongEgg:
    REP #$30                                                   ;81836C|C230    |      ;
    LDA.W #$00FC                                               ;81836E|A9FC00  |      ;
    LDX.W $09AD                                                ;818371|AEAD09  |0009AD;
    LDY.W $09AF                                                ;818374|ACAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;818377|2288A681|81A688;
    REP #$30                                                   ;81837B|C230    |      ;
    LDA.W nGameObjectIdx                                       ;81837D|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818380|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;818382|22A28185|8581A2;
    JSL.L fUnknown_81A4F1                                      ;818386|22F1A481|81A4F1;
    SEP #$20                                                   ;81838A|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;81838C|9C1D09  |00091D;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;8183A2|E220    |      ;
    LDA.B #$02                                                 ;8183A4|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;8183A6|8D9A01  |00019A;
    LDX.W #$038D                                               ;8183A9|A28D03  |      ;
    LDA.B #$00                                                 ;8183AC|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;8183AE|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;8183B1|225F9383|83935F;
    RTS                                                        ;8183B5|60      |      ;
 
 
subItemCarried_YellowEgg:
    RTS                                                        ;8183B6|60      |      ;
 
 
subItemCarried_ChickenWindMeasured:
    JSR.W fUnknown_8188E5                                      ;8183B7|20E588  |8188E5;
    RTS                                                        ;8183BA|60      |      ;
 
 
subItemCarried_Chicken:
    JSR.W fUnknown_81883A                                      ;8183BB|203A88  |81883A;
    RTS                                                        ;8183BE|60      |      ;
 
 
subItemCarried_Chick:
    JSR.W fUnknown_81883A                                      ;8183BF|203A88  |81883A;
    RTS                                                        ;8183C2|60      |      ;
 
 
subItemCarried_0x27:
    RTS                                                        ;8183C3|60      |      ;
 
 
subItemCarried_0x28:
    RTS                                                        ;8183C4|60      |      ;
 
 
subItemCarried_Mole:
    JSR.W fUnknown_81883A                                      ;8183C5|203A88  |81883A;
    RTS                                                        ;8183C8|60      |      ;
 
 
subItemCarried_0x2A:
    JSL.L fUnknown_81A94A                                      ;8183C9|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;8183CD|20C387  |8187C3;
    RTS                                                        ;8183D0|60      |      ;
 
 
subItemCarried_0x2B:
    JSL.L fUnknown_81A94A                                      ;8183D1|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;8183D5|20C387  |8187C3;
    RTS                                                        ;8183D8|60      |      ;
 
 
subItemCarried_0x2C:
    JSL.L fUnknown_81A94A                                      ;8183D9|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;8183DD|20C387  |8187C3;
    RTS                                                        ;8183E0|60      |      ;
 
 
subItemCarried_0x2D:
    JSL.L fUnknown_81A94A                                      ;8183E1|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;8183E5|20C387  |8187C3;
    RTS                                                        ;8183E8|60      |      ;
 
 
subItemCarried_0x2E:
    JSL.L fUnknown_81A94A                                      ;8183E9|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;8183ED|20C387  |8187C3;
    RTS                                                        ;8183F0|60      |      ;
 
 
subItemCarried_0x2F:
    JSL.L fUnknown_81A94A                                      ;8183F1|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;8183F5|20C387  |8187C3;
    RTS                                                        ;8183F8|60      |      ;
 
 
subItemCarried_0x30:
    JSL.L fUnknown_81A94A                                      ;8183F9|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;8183FD|20C387  |8187C3;
    RTS                                                        ;818400|60      |      ;
 
 
subItemCarried_0x31:
    JSL.L fUnknown_81A94A                                      ;818401|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;818405|20C387  |8187C3;
    RTS                                                        ;818408|60      |      ;
 
 
subItemCarried_0x32:
    JSL.L fUnknown_81A94A                                      ;818409|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;81840D|20C387  |8187C3;
    RTS                                                        ;818410|60      |      ;
 
 
subItemCarried_0x33:
    JSL.L fUnknown_81A94A                                      ;818411|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;818415|20C387  |8187C3;
    RTS                                                        ;818418|60      |      ;
 
 
subItemCarried_0x34:
    JSL.L fUnknown_81A94A                                      ;818419|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;81841D|20C387  |8187C3;
    RTS                                                        ;818420|60      |      ;
 
 
subItemCarried_0x35:
    JSL.L fUnknown_81A94A                                      ;818421|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;818425|20C387  |8187C3;
    RTS                                                        ;818428|60      |      ;
 
 
subItemCarried_0x36:
    JSL.L fUnknown_81A94A                                      ;818429|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;81842D|20C387  |8187C3;
    RTS                                                        ;818430|60      |      ;
 
 
subItemCarried_0x37:
    JSL.L fUnknown_81A94A                                      ;818431|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;818435|20C387  |8187C3;
    RTS                                                        ;818438|60      |      ;
 
 
subItemCarried_0x38:
    JSL.L fUnknown_81A94A                                      ;818439|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;81843D|20C387  |8187C3;
    RTS                                                        ;818440|60      |      ;
 
 
subItemCarried_0x39:
    JSL.L fUnknown_81A94A                                      ;818441|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;818445|20C387  |8187C3;
    RTS                                                        ;818448|60      |      ;
 
 
subItemCarried_0x3A:
    JSL.L fUnknown_81A94A                                      ;818449|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;81844D|20C387  |8187C3;
    RTS                                                        ;818450|60      |      ;
 
 
subItemCarried_0x3B:
    JSL.L fUnknown_81A94A                                      ;818451|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;818455|20C387  |8187C3;
    RTS                                                        ;818458|60      |      ;
 
 
subItemCarried_0x3C:
    JSL.L fUnknown_81A94A                                      ;818459|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;81845D|20C387  |8187C3;
    RTS                                                        ;818460|60      |      ;
 
 
subItemCarried_0x3D:
    JSL.L fUnknown_81A94A                                      ;818461|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;818465|20C387  |8187C3;
    RTS                                                        ;818468|60      |      ;
 
 
subItemCarried_0x3E:
    JSL.L fUnknown_81A94A                                      ;818469|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;81846D|20C387  |8187C3;
    RTS                                                        ;818470|60      |      ;
 
 
subItemCarried_0x3F:
    JSL.L fUnknown_81A94A                                      ;818471|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;818475|20C387  |8187C3;
    RTS                                                        ;818478|60      |      ;
 
 
subItemCarried_0x40:
    JSL.L fUnknown_81A94A                                      ;818479|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;81847D|20C387  |8187C3;
    RTS                                                        ;818480|60      |      ;
 
 
subItemCarried_0x41:
    JSL.L fUnknown_81A94A                                      ;818481|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;818485|20C387  |8187C3;
    RTS                                                        ;818488|60      |      ;
 
 
subItemCarried_0x42:
    JSL.L fUnknown_81A94A                                      ;818489|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;81848D|20C387  |8187C3;
    RTS                                                        ;818490|60      |      ;
 
 
subItemCarried_0x43:
    JSL.L fUnknown_81A94A                                      ;818491|224AA981|81A94A;
    JSR.W fUnknown_8187C3                                      ;818495|20C387  |8187C3;
    RTS                                                        ;818498|60      |      ;
 
 
subItemCarried_0x44:
    JSR.W fUnknown_818923                                      ;818499|202389  |818923;
    SEP #$20                                                   ;81849C|E220    |      ;
    LDA.W $0976                                                ;81849E|AD7609  |000976;
    CMP.B #$FF                                                 ;8184A1|C9FF    |      ;
    BNE ++                                                     ;8184A3|D02F    |8184D4;
    LDA.L strcShedItems.row2                                   ;8184A5|AF011F7F|7F1F01;
    ORA.B #$08                                                 ;8184A9|0908    |      ;
    STA.L strcShedItems.row2                                   ;8184AB|8F011F7F|7F1F01;
    SEP #$20                                                   ;8184AF|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;8184B1|AD2109  |000921;
    CMP.B #$0C                                                 ;8184B4|C90C    |      ;
    BNE +                                                      ;8184B6|D003    |8184BB;
    STZ.W strcPlayerData.toolEquipped                          ;8184B8|9C2109  |000921;
 
  + SEP #$20                                                   ;8184BB|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;8184BD|AD2309  |000923;
    CMP.B #$0C                                                 ;8184C0|C90C    |      ;
    BNE +                                                      ;8184C2|D003    |8184C7;
    STZ.W strcPlayerData.toolSecond                            ;8184C4|9C2309  |000923;
 
  + SEP #$20                                                   ;8184C7|E220    |      ;
    LDA.W strcPlayerData.leftGrassSeeds                        ;8184C9|AD2709  |000927;
    CMP.B #$FF                                                 ;8184CC|C9FF    |      ;
    BEQ ++                                                     ;8184CE|F004    |8184D4;
    INC A                                                      ;8184D0|1A      |      ;
    STA.W strcPlayerData.leftGrassSeeds                        ;8184D1|8D2709  |000927;
 
 ++ RTS                                                        ;8184D4|60      |      ;
 
 
subItemCarried_0x45:
    JSR.W fUnknown_818923                                      ;8184D5|202389  |818923;
    SEP #$20                                                   ;8184D8|E220    |      ;
    LDA.W $0976                                                ;8184DA|AD7609  |000976;
    CMP.B #$FF                                                 ;8184DD|C9FF    |      ;
    BNE ++                                                     ;8184DF|D02F    |818510;
    LDA.L strcShedItems.row1                                   ;8184E1|AF001F7F|7F1F00;
    ORA.B #$10                                                 ;8184E5|0910    |      ;
    STA.L strcShedItems.row1                                   ;8184E7|8F001F7F|7F1F00;
    SEP #$20                                                   ;8184EB|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;8184ED|AD2109  |000921;
    CMP.B #$05                                                 ;8184F0|C905    |      ;
    BNE +                                                      ;8184F2|D003    |8184F7;
    STZ.W strcPlayerData.toolEquipped                          ;8184F4|9C2109  |000921;
 
  + SEP #$20                                                   ;8184F7|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;8184F9|AD2309  |000923;
    CMP.B #$05                                                 ;8184FC|C905    |      ;
    BNE +                                                      ;8184FE|D003    |818503;
    STZ.W strcPlayerData.toolSecond                            ;818500|9C2309  |000923;
 
  + SEP #$20                                                   ;818503|E220    |      ;
    LDA.W strcPlayerData.leftCornSeeds                         ;818505|AD2809  |000928;
    CMP.B #$FF                                                 ;818508|C9FF    |      ;
    BEQ ++                                                     ;81850A|F004    |818510;
    INC A                                                      ;81850C|1A      |      ;
    STA.W strcPlayerData.leftCornSeeds                         ;81850D|8D2809  |000928;
 
 ++ RTS                                                        ;818510|60      |      ;
 
 
subItemCarried_0x46:
    JSR.W fUnknown_818923                                      ;818511|202389  |818923;
    SEP #$20                                                   ;818514|E220    |      ;
    LDA.W $0976                                                ;818516|AD7609  |000976;
    CMP.B #$FF                                                 ;818519|C9FF    |      ;
    BNE ++                                                     ;81851B|D02F    |81854C;
    LDA.L strcShedItems.row1                                   ;81851D|AF001F7F|7F1F00;
    ORA.B #$20                                                 ;818521|0920    |      ;
    STA.L strcShedItems.row1                                   ;818523|8F001F7F|7F1F00;
    SEP #$20                                                   ;818527|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;818529|AD2109  |000921;
    CMP.B #$06                                                 ;81852C|C906    |      ;
    BNE +                                                      ;81852E|D003    |818533;
    STZ.W strcPlayerData.toolEquipped                          ;818530|9C2109  |000921;
 
  + SEP #$20                                                   ;818533|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;818535|AD2309  |000923;
    CMP.B #$06                                                 ;818538|C906    |      ;
    BNE +                                                      ;81853A|D003    |81853F;
    STZ.W strcPlayerData.toolSecond                            ;81853C|9C2309  |000923;
 
  + SEP #$20                                                   ;81853F|E220    |      ;
    LDA.W strcPlayerData.leftTomatoSeeds                       ;818541|AD2909  |000929;
    CMP.B #$FF                                                 ;818544|C9FF    |      ;
    BEQ ++                                                     ;818546|F004    |81854C;
    INC A                                                      ;818548|1A      |      ;
    STA.W strcPlayerData.leftTomatoSeeds                       ;818549|8D2909  |000929;
 
 ++ RTS                                                        ;81854C|60      |      ;
 
 
subItemCarried_0x47:
    JSR.W fUnknown_818923                                      ;81854D|202389  |818923;
    SEP #$20                                                   ;818550|E220    |      ;
    LDA.W $0976                                                ;818552|AD7609  |000976;
    CMP.B #$FF                                                 ;818555|C9FF    |      ;
    BNE ++                                                     ;818557|D02F    |818588;
    LDA.L strcShedItems.row1                                   ;818559|AF001F7F|7F1F00;
    ORA.B #$40                                                 ;81855D|0940    |      ;
    STA.L strcShedItems.row1                                   ;81855F|8F001F7F|7F1F00;
    SEP #$20                                                   ;818563|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;818565|AD2109  |000921;
    CMP.B #$07                                                 ;818568|C907    |      ;
    BNE +                                                      ;81856A|D003    |81856F;
    STZ.W strcPlayerData.toolEquipped                          ;81856C|9C2109  |000921;
 
  + SEP #$20                                                   ;81856F|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;818571|AD2309  |000923;
    CMP.B #$07                                                 ;818574|C907    |      ;
    BNE +                                                      ;818576|D003    |81857B;
    STZ.W strcPlayerData.toolSecond                            ;818578|9C2309  |000923;
 
  + SEP #$20                                                   ;81857B|E220    |      ;
    LDA.W strcPlayerData.leftPotatoSeeds                       ;81857D|AD2A09  |00092A;
    CMP.B #$FF                                                 ;818580|C9FF    |      ;
    BEQ ++                                                     ;818582|F004    |818588;
    INC A                                                      ;818584|1A      |      ;
    STA.W strcPlayerData.leftPotatoSeeds                       ;818585|8D2A09  |00092A;
 
 ++ RTS                                                        ;818588|60      |      ;
 
 
subItemCarried_0x48:
    JSR.W fUnknown_818923                                      ;818589|202389  |818923;
    SEP #$20                                                   ;81858C|E220    |      ;
    LDA.W $0976                                                ;81858E|AD7609  |000976;
    CMP.B #$FF                                                 ;818591|C9FF    |      ;
    BNE ++                                                     ;818593|D02F    |8185C4;
    LDA.L strcShedItems.row1                                   ;818595|AF001F7F|7F1F00;
    ORA.B #$80                                                 ;818599|0980    |      ;
    STA.L strcShedItems.row1                                   ;81859B|8F001F7F|7F1F00;
    SEP #$20                                                   ;81859F|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;8185A1|AD2109  |000921;
    CMP.B #$08                                                 ;8185A4|C908    |      ;
    BNE +                                                      ;8185A6|D003    |8185AB;
    STZ.W strcPlayerData.toolEquipped                          ;8185A8|9C2109  |000921;
 
  + SEP #$20                                                   ;8185AB|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;8185AD|AD2309  |000923;
    CMP.B #$08                                                 ;8185B0|C908    |      ;
    BNE +                                                      ;8185B2|D003    |8185B7;
    STZ.W strcPlayerData.toolSecond                            ;8185B4|9C2309  |000923;
 
  + SEP #$20                                                   ;8185B7|E220    |      ;
    LDA.W strcPlayerData.leftTurnipSeeds                       ;8185B9|AD2B09  |00092B;
    CMP.B #$FF                                                 ;8185BC|C9FF    |      ;
    BEQ ++                                                     ;8185BE|F004    |8185C4;
    INC A                                                      ;8185C0|1A      |      ;
    STA.W strcPlayerData.leftTurnipSeeds                       ;8185C1|8D2B09  |00092B;
 
 ++ RTS                                                        ;8185C4|60      |      ;
 
 
subItemCarried_0x49:
    JSR.W fUnknown_818923                                      ;8185C5|202389  |818923;
    SEP #$20                                                   ;8185C8|E220    |      ;
    LDA.W $0976                                                ;8185CA|AD7609  |000976;
    CMP.B #$FF                                                 ;8185CD|C9FF    |      ;
    BNE +                                                      ;8185CF|D00D    |8185DE;
    SEP #$20                                                   ;8185D1|E220    |      ;
    STZ.W $0976                                                ;8185D3|9C7609  |000976;
    LDA.B #!EITEM_CHICKENFEED                                                 
    STA.W nCarriedItemId                                       ;8185D8|8D8409  |000984;
    STA.W strcPlayerData.carryItemId                           ;8185DB|8D1D09  |00091D;
 
  + RTS                                                        ;8185DE|60      |      ;
 
 
subItemCarried_0x4A:
    JSR.W fUnknown_818923                                      ;8185DF|202389  |818923;
    SEP #$20                                                   ;8185E2|E220    |      ;
    LDA.W $0976                                                ;8185E4|AD7609  |000976;
    CMP.B #$FF                                                 ;8185E7|C9FF    |      ;
    BNE +                                                      ;8185E9|D00A    |8185F5;
    LDA.L strcShedItems.row2                                   ;8185EB|AF011F7F|7F1F01;
    ORA.B #$10                                                 ;8185EF|0910    |      ;
    STA.L strcShedItems.row2                                   ;8185F1|8F011F7F|7F1F01;
 
  + RTS                                                        ;8185F5|60      |      ;
 
 
subItemCarried_0x4B:
    JSR.W fUnknown_818923                                      ;8185F6|202389  |818923;
    SEP #$20                                                   ;8185F9|E220    |      ;
    LDA.W $0976                                                ;8185FB|AD7609  |000976;
    CMP.B #$FF                                                 ;8185FE|C9FF    |      ;
    BNE +                                                      ;818600|D00A    |81860C;
    LDA.L strcShedItems.row2                                   ;818602|AF011F7F|7F1F01;
    ORA.B #$20                                                 ;818606|0920    |      ;
    STA.L strcShedItems.row2                                   ;818608|8F011F7F|7F1F01;
 
  + RTS                                                        ;81860C|60      |      ;
 
 
subItemCarried_0x4C:
    JSR.W fUnknown_818923                                      ;81860D|202389  |818923;
    SEP #$20                                                   ;818610|E220    |      ;
    LDA.W $0976                                                ;818612|AD7609  |000976;
    CMP.B #$FF                                                 ;818615|C9FF    |      ;
    BNE +                                                      ;818617|D00A    |818623;
    LDA.L strcShedItems.row2                                   ;818619|AF011F7F|7F1F01;
    ORA.B #$40                                                 ;81861D|0940    |      ;
    STA.L strcShedItems.row2                                   ;81861F|8F011F7F|7F1F01;
 
  + RTS                                                        ;818623|60      |      ;
 
 
subItemCarried_0x4D:
    JSR.W fUnknown_818923                                      ;818624|202389  |818923;
    SEP #$20                                                   ;818627|E220    |      ;
    LDA.W $0976                                                ;818629|AD7609  |000976;
    CMP.B #$FF                                                 ;81862C|C9FF    |      ;
    BNE ++                                                     ;81862E|D02A    |81865A;
    LDA.L strcShedItems.row3                                   ;818630|AF021F7F|7F1F02;
    ORA.B #$01                                                 ;818634|0901    |      ;
    STA.L strcShedItems.row3                                   ;818636|8F021F7F|7F1F02;
    LDA.L strcShedItems.row1                                   ;81863A|AF001F7F|7F1F00;
    AND.B #$FE                                                 ;81863E|29FE    |      ;
    STA.L strcShedItems.row1                                   ;818640|8F001F7F|7F1F00;
    LDA.W strcPlayerData.toolEquipped                          ;818644|AD2109  |000921;
    CMP.B #$01                                                 ;818647|C901    |      ;
    BNE +                                                      ;818649|D003    |81864E;
    STZ.W strcPlayerData.toolEquipped                          ;81864B|9C2109  |000921;
 
  + SEP #$20                                                   ;81864E|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;818650|AD2309  |000923;
    CMP.B #$01                                                 ;818653|C901    |      ;
    BNE ++                                                     ;818655|D003    |81865A;
    STZ.W strcPlayerData.toolSecond                            ;818657|9C2309  |000923;
 
 ++ RTS                                                        ;81865A|60      |      ;
 
 
subItemCarried_0x4E:
    JSR.W fUnknown_818923                                      ;81865B|202389  |818923;
    SEP #$20                                                   ;81865E|E220    |      ;
    LDA.W $0976                                                ;818660|AD7609  |000976;
    CMP.B #$FF                                                 ;818663|C9FF    |      ;
    BNE ++                                                     ;818665|D02A    |818691;
    LDA.L strcShedItems.row3                                   ;818667|AF021F7F|7F1F02;
    ORA.B #$02                                                 ;81866B|0902    |      ;
    STA.L strcShedItems.row3                                   ;81866D|8F021F7F|7F1F02;
    LDA.L strcShedItems.row1                                   ;818671|AF001F7F|7F1F00;
    AND.B #$FD                                                 ;818675|29FD    |      ;
    STA.L strcShedItems.row1                                   ;818677|8F001F7F|7F1F00;
    LDA.W strcPlayerData.toolEquipped                          ;81867B|AD2109  |000921;
    CMP.B #$02                                                 ;81867E|C902    |      ;
    BNE +                                                      ;818680|D003    |818685;
    STZ.W strcPlayerData.toolEquipped                          ;818682|9C2109  |000921;
 
  + SEP #$20                                                   ;818685|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;818687|AD2309  |000923;
    CMP.B #$02                                                 ;81868A|C902    |      ;
    BNE ++                                                     ;81868C|D003    |818691;
    STZ.W strcPlayerData.toolSecond                            ;81868E|9C2309  |000923;
 
 ++ RTS                                                        ;818691|60      |      ;
 
 
subItemCarried_0x4F:
    JSR.W fUnknown_818923                                      ;818692|202389  |818923;
    SEP #$20                                                   ;818695|E220    |      ;
    LDA.W $0976                                                ;818697|AD7609  |000976;
    CMP.B #$FF                                                 ;81869A|C9FF    |      ;
    BNE ++                                                     ;81869C|D02A    |8186C8;
    LDA.L strcShedItems.row3                                   ;81869E|AF021F7F|7F1F02;
    ORA.B #$04                                                 ;8186A2|0904    |      ;
    STA.L strcShedItems.row3                                   ;8186A4|8F021F7F|7F1F02;
    LDA.L strcShedItems.row1                                   ;8186A8|AF001F7F|7F1F00;
    AND.B #$FB                                                 ;8186AC|29FB    |      ;
    STA.L strcShedItems.row1                                   ;8186AE|8F001F7F|7F1F00;
    LDA.W strcPlayerData.toolEquipped                          ;8186B2|AD2109  |000921;
    CMP.B #$03                                                 ;8186B5|C903    |      ;
    BNE +                                                      ;8186B7|D003    |8186BC;
    STZ.W strcPlayerData.toolEquipped                          ;8186B9|9C2109  |000921;
 
  + SEP #$20                                                   ;8186BC|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;8186BE|AD2309  |000923;
    CMP.B #$03                                                 ;8186C1|C903    |      ;
    BNE ++                                                     ;8186C3|D003    |8186C8;
    STZ.W strcPlayerData.toolSecond                            ;8186C5|9C2309  |000923;
 
 ++ RTS                                                        ;8186C8|60      |      ;
 
 
subItemCarried_0x50:
    JSR.W fUnknown_818923                                      ;8186C9|202389  |818923;
    SEP #$20                                                   ;8186CC|E220    |      ;
    LDA.W $0976                                                ;8186CE|AD7609  |000976;
    CMP.B #$FF                                                 ;8186D1|C9FF    |      ;
    BNE ++                                                     ;8186D3|D02A    |8186FF;
    LDA.L strcShedItems.row3                                   ;8186D5|AF021F7F|7F1F02;
    ORA.B #$08                                                 ;8186D9|0908    |      ;
    STA.L strcShedItems.row3                                   ;8186DB|8F021F7F|7F1F02;
    LDA.L strcShedItems.row1                                   ;8186DF|AF001F7F|7F1F00;
    AND.B #$F7                                                 ;8186E3|29F7    |      ;
    STA.L strcShedItems.row1                                   ;8186E5|8F001F7F|7F1F00;
    LDA.W strcPlayerData.toolEquipped                          ;8186E9|AD2109  |000921;
    CMP.B #$04                                                 ;8186EC|C904    |      ;
    BNE +                                                      ;8186EE|D003    |8186F3;
    STZ.W strcPlayerData.toolEquipped                          ;8186F0|9C2109  |000921;
 
  + SEP #$20                                                   ;8186F3|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;8186F5|AD2309  |000923;
    CMP.B #$04                                                 ;8186F8|C904    |      ;
    BNE ++                                                     ;8186FA|D003    |8186FF;
    STZ.W strcPlayerData.toolSecond                            ;8186FC|9C2309  |000923;
 
 ++ RTS                                                        ;8186FF|60      |      ;
 
 
subItemCarried_0x51:
    JSR.W fUnknown_818923                                      ;818700|202389  |818923;
    SEP #$20                                                   ;818703|E220    |      ;
    LDA.W $0976                                                ;818705|AD7609  |000976;
    CMP.B #$FF                                                 ;818708|C9FF    |      ;
    BNE ++                                                     ;81870A|D02A    |818736;
    LDA.L strcShedItems.row3                                   ;81870C|AF021F7F|7F1F02;
    ORA.B #$10                                                 ;818710|0910    |      ;
    STA.L strcShedItems.row3                                   ;818712|8F021F7F|7F1F02;
    LDA.L strcShedItems.row2                                   ;818716|AF011F7F|7F1F01;
    AND.B #$7F                                                 ;81871A|297F    |      ;
    STA.L strcShedItems.row2                                   ;81871C|8F011F7F|7F1F01;
    LDA.W strcPlayerData.toolEquipped                          ;818720|AD2109  |000921;
    CMP.B #$10                                                 ;818723|C910    |      ;
    BNE +                                                      ;818725|D003    |81872A;
    STZ.W strcPlayerData.toolEquipped                          ;818727|9C2109  |000921;
 
  + SEP #$20                                                   ;81872A|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;81872C|AD2309  |000923;
    CMP.B #$10                                                 ;81872F|C910    |      ;
    BNE ++                                                     ;818731|D003    |818736;
    STZ.W strcPlayerData.toolSecond                            ;818733|9C2309  |000923;
 
 ++ RTS                                                        ;818736|60      |      ;
 
 
subItemCarried_0x52:
    JSR.W fUnknown_818923                                      ;818737|202389  |818923;
    SEP #$20                                                   ;81873A|E220    |      ;
    LDA.W $0976                                                ;81873C|AD7609  |000976;
    CMP.B #$FF                                                 ;81873F|C9FF    |      ;
    BNE +                                                      ;818741|D00A    |81874D;
    LDA.L strcShedItems.row2                                   ;818743|AF011F7F|7F1F01;
    ORA.B #$01                                                 ;818747|0901    |      ;
    STA.L strcShedItems.row2                                   ;818749|8F011F7F|7F1F01;
 
  + RTS                                                        ;81874D|60      |      ;
 
 
subItemCarried_0x53:
    JSR.W fUnknown_818923                                      ;81874E|202389  |818923;
    SEP #$20                                                   ;818751|E220    |      ;
    LDA.W $0976                                                ;818753|AD7609  |000976;
    CMP.B #$FF                                                 ;818756|C9FF    |      ;
    BNE +                                                      ;818758|D00A    |818764;
    LDA.L strcShedItems.row2                                   ;81875A|AF011F7F|7F1F01;
    ORA.B #$02                                                 ;81875E|0902    |      ;
    STA.L strcShedItems.row2                                   ;818760|8F011F7F|7F1F01;
 
  + RTS                                                        ;818764|60      |      ;
 
 
subItemCarried_0x54:
    JSR.W fUnknown_818923                                      ;818765|202389  |818923;
    SEP #$20                                                   ;818768|E220    |      ;
    LDA.W $0976                                                ;81876A|AD7609  |000976;
    CMP.B #$FF                                                 ;81876D|C9FF    |      ;
    BNE +                                                      ;81876F|D00F    |818780;
    LDA.L strcShedItems.row4                                   ;818771|AF031F7F|7F1F03;
    ORA.B #$01                                                 ;818775|0901    |      ;
    STA.L strcShedItems.row4                                   ;818777|8F031F7F|7F1F03;
    LDA.B #$0C                                                 ;81877B|A90C    |      ;
    STA.W strcPlayerData.leftChickenFood                       ;81877D|8D2D09  |00092D;
 
  + RTS                                                        ;818780|60      |      ;
 
 
subItemCarried_0x55:
    JSR.W fUnknown_818923                                      ;818781|202389  |818923;
    SEP #$20                                                   ;818784|E220    |      ;
    LDA.W $0976                                                ;818786|AD7609  |000976;
    CMP.B #$FF                                                 ;818789|C9FF    |      ;
    BNE +                                                      ;81878B|D00F    |81879C;
    LDA.L strcShedItems.row4                                   ;81878D|AF031F7F|7F1F03;
    ORA.B #$02                                                 ;818791|0902    |      ;
    STA.L strcShedItems.row4                                   ;818793|8F031F7F|7F1F03;
    LDA.B #$0C                                                 ;818797|A90C    |      ;
    STA.W strcPlayerData.leftCowFood                           ;818799|8D2C09  |00092C;
 
  + RTS                                                        ;81879C|60      |      ;
 
 
subItemCarried_0x56:
    JSR.W fUnknown_818923                                      ;81879D|202389  |818923;
    SEP #$20                                                   ;8187A0|E220    |      ;
    LDA.W $0976                                                ;8187A2|AD7609  |000976;
    CMP.B #$FF                                                 ;8187A5|C9FF    |      ;
    BNE +                                                      ;8187A7|D00D    |8187B6;
    SEP #$20                                                   ;8187A9|E220    |      ;
    STZ.W $0976                                                ;8187AB|9C7609  |000976;
    LDA.B #!EITEM_TOMATOSEED                                                 
    STA.W nCarriedItemId                                       ;8187B0|8D8409  |000984;
    STA.W strcPlayerData.carryItemId                           ;8187B3|8D1D09  |00091D;
 
  + RTS                                                        ;8187B6|60      |      ;
 
 
subItemCarried_0x58:
    JSR.W fUnknown_8188E5                                      ;8187B7|20E588  |8188E5;
    RTS                                                        ;8187BA|60      |      ;
 
 
subItemCarried_0x59:
    JSR.W fUnknown_8188E5                                      ;8187BB|20E588  |8188E5;
    RTS                                                        ;8187BE|60      |      ;
 
 
subItemCarried_0x5A:
    JSR.W fUnknown_8188E5                                      ;8187BF|20E588  |8188E5;
    RTS                                                        ;8187C2|60      |      ;
 
 
fUnknown_8187C3:
    SEP #$20                                                   ;8187C3|E220    |      ;
    REP #$10                                                   ;8187C5|C210    |      ;
    LDA.W strcPlayerData.toolSecond                            ;8187C7|AD2309  |000923;
    BNE +                                                      ;8187CA|D006    |8187D2;
    LDA.W strcPlayerData.toolEquipped                          ;8187CC|AD2109  |000921;
    STA.W strcPlayerData.toolSecond                            ;8187CF|8D2309  |000923;
 
  + SEP #$20                                                   ;8187D2|E220    |      ;
    LDA.B #$00                                                 ;8187D4|A900    |      ;
    XBA                                                        ;8187D6|EB      |      ;
    LDA.W nCarriedItemId                                       ;8187D7|AD8409  |000984;
    SEC                                                        ;8187DA|38      |      ;
    SBC.B #$29                                                 ;8187DB|E929    |      ;
    STA.W strcPlayerData.toolEquipped                          ;8187DD|8D2109  |000921;
    REP #$20                                                   ;8187E0|C220    |      ;
    ASL A                                                      ;8187E2|0A      |      ;
    ASL A                                                      ;8187E3|0A      |      ;
    ASL A                                                      ;8187E4|0A      |      ;
    CLC                                                        ;8187E5|18      |      ;
    ADC.W #$0006                                               ;8187E6|690600  |      ;
    TAX                                                        ;8187E9|AA      |      ;
    SEP #$20                                                   ;8187EA|E220    |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;8187EC|BF0FBE81|81BE0F;
    PHA                                                        ;8187F0|48      |      ;
    INX                                                        ;8187F1|E8      |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;8187F2|BF0FBE81|81BE0F;
    EOR.B #$FF                                                 ;8187F6|49FF    |      ;
    STA.B strcVariables.n8Temp1                                ;8187F8|8592    |000092;
    PLA                                                        ;8187FA|68      |      ;
    XBA                                                        ;8187FB|EB      |      ;
    LDA.B #$00                                                 ;8187FC|A900    |      ;
    XBA                                                        ;8187FE|EB      |      ;
    REP #$20                                                   ;8187FF|C220    |      ;
    TAX                                                        ;818801|AA      |      ;
    SEP #$20                                                   ;818802|E220    |      ;
    LDA.L strcShedItems.row1,X                                 ;818804|BF001F7F|7F1F00;
    AND.B strcVariables.n8Temp1                                ;818808|2592    |000092;
    STA.L strcShedItems.row1,X                                 ;81880A|9F001F7F|7F1F00;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    REP #$20                                                   ;818821|C220    |      ;
    LDA.W nGameObjectIdx                                       ;818823|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818826|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;818828|22A28185|8581A2;
    JSL.L fUnknown_81A4F1                                      ;81882C|22F1A481|81A4F1;
    SEP #$20                                                   ;818830|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818832|9C1D09  |00091D;
    JSL.L fToolUsedSound_Unknown828FF3                         ;818835|22F38F82|828FF3;
    RTS                                                        ;818839|60      |      ;
 
 
fUnknown_81883A:
    SEP #$20                                                   ;81883A|E220    |      ;
    REP #$10                                                   ;81883C|C210    |      ;
    LDA.W $0976                                                ;81883E|AD7609  |000976;
    BNE +                                                      ;818841|D003    |818846;
    JMP.W fUnknown_819010                                      ;818843|4C1090  |819010;
 
 
  + CMP.B #$02                                                 ;818846|C902    |      ;
    BNE +                                                      ;818848|D003    |81884D;
    JMP.W fUnknown_819228                                      ;81884A|4C2892  |819228;
 
 
  + CMP.B #$03                                                 ;81884D|C903    |      ;
    BNE +                                                      ;81884F|D003    |818854;
    JMP.W fUnknown_818E1B                                      ;818851|4C1B8E  |818E1B;
 
 
  + RTS                                                        ;818854|60      |      ;
 
 
fUnknown_818855:
    SEP #$20                                                   ;818855|E220    |      ;
    REP #$10                                                   ;818857|C210    |      ;
    LDA.W $0976                                                ;818859|AD7609  |000976;
    BNE +                                                      ;81885C|D003    |818861;
    JMP.W fItemFound_Unknown818B6B                             ;81885E|4C6B8B  |818B6B;
 
 
  + CMP.B #$01                                                 ;818861|C901    |      ;
    BNE +                                                      ;818863|D003    |818868;
    JMP.W fItemFound_Consume                                   ;818865|4CA58B  |818BA5;
 
 
  + CMP.B #$02                                                 ;818868|C902    |      ;
    BNE +                                                      ;81886A|D003    |81886F;
    JMP.W fUnknown_819049                                      ;81886C|4C4990  |819049;
 
 
  + CMP.B #$03                                                 ;81886F|C903    |      ;
    BNE +                                                      ;818871|D003    |818876;
    JMP.W fUnknown_819379                                      ;818873|4C7993  |819379;
 
 
  + CMP.B #$04                                                 ;818876|C904    |      ;
    BNE +                                                      ;818878|D003    |81887D;
    JMP.W fUnknown_81968F                                      ;81887A|4C8F96  |81968F;
 
 
  + CMP.B #$05                                                 ;81887D|C905    |      ;
    BNE +                                                      ;81887F|D003    |818884;
    JMP.W fItemSell_Unknown818F2A                              ;818881|4C2A8F  |818F2A;
 
 
  + CMP.B #$06                                                 ;818884|C906    |      ;
    BNE +                                                      ;818886|D003    |81888B;
    JMP.W fItemSell_Unknown818F5A                              ;818888|4C5A8F  |818F5A;
 
 
  + CMP.B #$07                                                 ;81888B|C907    |      ;
    BNE +                                                      ;81888D|D003    |818892;
    JMP.W fUnknown_819695                                      ;81888F|4C9596  |819695;
 
 
  + CMP.B #$08                                                 ;818892|C908    |      ;
    BNE +                                                      ;818894|D003    |818899;
    JMP.W fUnknown_819021                                      ;818896|4C2190  |819021;
 
 
  + RTS                                                        ;818899|60      |      ;
 
 
fUnknown_81889A:
    SEP #$20                                                   ;81889A|E220    |      ;
    REP #$10                                                   ;81889C|C210    |      ;
    LDA.W $0976                                                ;81889E|AD7609  |000976;
    BNE +                                                      ;8188A1|D003    |8188A6;
    JMP.W fUnknown_819010                                      ;8188A3|4C1090  |819010;
 
 
  + CMP.B #$02                                                 ;8188A6|C902    |      ;
    BNE +                                                      ;8188A8|D003    |8188AD;
    JMP.W fUnknown_818C24                                      ;8188AA|4C248C  |818C24;
 
 
  + CMP.B #$03                                                 ;8188AD|C903    |      ;
    BNE +                                                      ;8188AF|D003    |8188B4;
    JMP.W fUnknown_818D38                                      ;8188B1|4C388D  |818D38;
 
 
  + CMP.B #$04                                                 ;8188B4|C904    |      ;
    BNE +                                                      ;8188B6|D003    |8188BB;
    JMP.W fUnknown_818E16                                      ;8188B8|4C168E  |818E16;
 
 
  + RTS                                                        ;8188BB|60      |      ;
 
 
fUnknown_8188BC:
    SEP #$20                                                   ;8188BC|E220    |      ;
    REP #$10                                                   ;8188BE|C210    |      ;
    LDA.W $0976                                                ;8188C0|AD7609  |000976;
    BNE +                                                      ;8188C3|D003    |8188C8;
    JMP.W fUnknown_819010                                      ;8188C5|4C1090  |819010;
 
 
  + CMP.B #$02                                                 ;8188C8|C902    |      ;
    BNE +                                                      ;8188CA|D003    |8188CF;
    JMP.W fUnknown_819049                                      ;8188CC|4C4990  |819049;
 
 
  + CMP.B #$03                                                 ;8188CF|C903    |      ;
    BNE +                                                      ;8188D1|D003    |8188D6;
    JMP.W fUnknown_818E98                                      ;8188D3|4C988E  |818E98;
 
 
  + CMP.B #$04                                                 ;8188D6|C904    |      ;
    BNE +                                                      ;8188D8|D003    |8188DD;
    JMP.W fUnknown_81968F                                      ;8188DA|4C8F96  |81968F;
 
 
  + CMP.B #$08                                                 ;8188DD|C908    |      ;
    BNE +                                                      ;8188DF|D003    |8188E4;
    JMP.W fUnknown_819021                                      ;8188E1|4C2190  |819021;
 
 
  + RTS                                                        ;8188E4|60      |      ;
 
 
fUnknown_8188E5:
    SEP #$20                                                   ;8188E5|E220    |      ;
    REP #$10                                                   ;8188E7|C210    |      ;
    LDA.W $0976                                                ;8188E9|AD7609  |000976;
    BNE +                                                      ;8188EC|D003    |8188F1;
    JMP.W fUnknown_819010                                      ;8188EE|4C1090  |819010;
 
 
  + CMP.B #$02                                                 ;8188F1|C902    |      ;
    BNE +                                                      ;8188F3|D003    |8188F8;
    JMP.W fUnknown_819049                                      ;8188F5|4C4990  |819049;
 
 
  + CMP.B #$03                                                 ;8188F8|C903    |      ;
    BNE +                                                      ;8188FA|D003    |8188FF;
    JMP.W fUnknown_819379                                      ;8188FC|4C7993  |819379;
 
 
  + CMP.B #$04                                                 ;8188FF|C904    |      ;
    BNE +                                                      ;818901|D003    |818906;
    JMP.W fUnknown_81968F                                      ;818903|4C8F96  |81968F;
 
 
  + CMP.B #$05                                                 ;818906|C905    |      ;
    BNE +                                                      ;818908|D003    |81890D;
    JMP.W fItemSell_Unknown818F2A                              ;81890A|4C2A8F  |818F2A;
 
 
  + CMP.B #$06                                                 ;81890D|C906    |      ;
    BNE +                                                      ;81890F|D003    |818914;
    JMP.W fItemSell_Unknown818F5A                              ;818911|4C5A8F  |818F5A;
 
 
  + CMP.B #$07                                                 ;818914|C907    |      ;
    BNE +                                                      ;818916|D003    |81891B;
    JMP.W fUnknown_819695                                      ;818918|4C9596  |819695;
 
 
  + CMP.B #$08                                                 ;81891B|C908    |      ;
    BNE +                                                      ;81891D|D003    |818922;
    JMP.W fUnknown_819021                                      ;81891F|4C2190  |819021;
 
 
  + RTS                                                        ;818922|60      |      ;
 
 
fUnknown_818923:
    SEP #$20                                                   ;818923|E220    |      ;
    REP #$10                                                   ;818925|C210    |      ;
    LDA.W $0976                                                ;818927|AD7609  |000976;
    BEQ fItemBuy_Unknown81893F                                 ;81892A|F013    |81893F;
    CMP.B #$01                                                 ;81892C|C901    |      ;
    BEQ fItemBuy_Unknown818989                                 ;81892E|F059    |818989;
    CMP.B #$02                                                 ;818930|C902    |      ;
    BNE +                                                      ;818932|D003    |818937;
    JMP.W fUnknown_818A94                                      ;818934|4C948A  |818A94;
 
 
  + CMP.B #$03                                                 ;818937|C903    |      ;
    BNE +                                                      ;818939|D003    |81893E;
    JMP.W fUnknown_818B19                                      ;81893B|4C198B  |818B19;
 
 
  + RTS                                                        ;81893E|60      |      ;
 
 
fItemBuy_Unknown81893F:
    SEP #$20                                                   ;81893F|E220    |      ;
    LDA.B #$02                                                 ;818941|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;818943|8D9A01  |00019A;
    SEP #$20                                                   ;818946|E220    |      ;
    LDA.W nCarriedItemId                                       ;818948|AD8409  |000984;
    CMP.B #$44                                                 ;81894B|C944    |      ;
    BCS .label1                                                ;81894D|B008    |818957;
    SEC                                                        ;81894F|38      |      ;
    SBC.B #$1B                                                 ;818950|E91B    |      ;
    CLC                                                        ;818952|18      |      ;
    ADC.B #$13                                                 ;818953|6913    |      ;
    BRA .label2                                                ;818955|800D    |818964;
 
 
.label1:
    SEP #$20                                                   ;818957|E220    |      ;
    REP #$10                                                   ;818959|C210    |      ;
    LDA.B #$00                                                 ;81895B|A900    |      ;
    XBA                                                        ;81895D|EB      |      ;
    LDA.W nCarriedItemId                                       ;81895E|AD8409  |000984;
    SEC                                                        ;818961|38      |      ;
    SBC.B #$44                                                 ;818962|E944    |      ;
 
.label2:
    REP #$20                                                   ;818964|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;818966|857E    |00007E;
    ASL A                                                      ;818968|0A      |      ;
    CLC                                                        ;818969|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81896A|657E    |00007E;
    ASL A                                                      ;81896C|0A      |      ;
    ASL A                                                      ;81896D|0A      |      ;
    TAX                                                        ;81896E|AA      |      ;
    LDA.L aDialogsData_BuyItems,X                              ;81896F|BFA5A181|81A1A5;
    TAX                                                        ;818973|AA      |      ;
    SEP #$20                                                   ;818974|E220    |      ;
    LDA.B #$00                                                 ;818976|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;818978|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81897B|225F9383|83935F;
    SEP #$20                                                   ;81897F|E220    |      ;
    LDA.B #$01                                                 ;818981|A901    |      ;
    STA.W $0976                                                ;818983|8D7609  |000976;
    JMP.W fReturn_818B6A                                       ;818986|4C6A8B  |818B6A;
 
 
fItemBuy_Unknown818989:
    SEP #$20                                                   ;818989|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81898B|AD9A01  |00019A;
    CMP.B #$02                                                 ;81898E|C902    |      ;
    BNE +                                                      ;818990|D003    |818995;
    JMP.W fReturn_818B6A                                       ;818992|4C6A8B  |818B6A;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;818995|AD8F01  |00018F;
    BEQ +                                                      ;818998|F003    |81899D;
    JMP.W fItemBuy_Unknown818A4E                               ;81899A|4C4E8A  |818A4E;
 
 
  + SEP #$20                                                   ;81899D|E220    |      ;
    LDA.W nCarriedItemId                                       ;81899F|AD8409  |000984;
    CMP.B #$44                                                 ;8189A2|C944    |      ;
    BCS .label1                                                ;8189A4|B008    |8189AE;
    SEC                                                        ;8189A6|38      |      ;
    SBC.B #$1B                                                 ;8189A7|E91B    |      ;
    CLC                                                        ;8189A9|18      |      ;
    ADC.B #$13                                                 ;8189AA|6913    |      ;
    BRA .label2                                                ;8189AC|800D    |8189BB;
 
 
.label1:
    SEP #$20                                                   ;8189AE|E220    |      ;
    REP #$10                                                   ;8189B0|C210    |      ;
    LDA.B #$00                                                 ;8189B2|A900    |      ;
    XBA                                                        ;8189B4|EB      |      ;
    LDA.W nCarriedItemId                                       ;8189B5|AD8409  |000984;
    SEC                                                        ;8189B8|38      |      ;
    SBC.B #$44                                                 ;8189B9|E944    |      ;
 
.label2:
    REP #$20                                                   ;8189BB|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;8189BD|857E    |00007E;
    ASL A                                                      ;8189BF|0A      |      ;
    CLC                                                        ;8189C0|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8189C1|657E    |00007E;
    ASL A                                                      ;8189C3|0A      |      ;
    ASL A                                                      ;8189C4|0A      |      ;
    CLC                                                        ;8189C5|18      |      ;
    ADC.W #$0009                                               ;8189C6|690900  |      ;
    TAX                                                        ;8189C9|AA      |      ;
    LDA.L aDialogsData_BuyItems,X                              ;8189CA|BFA5A181|81A1A5;
    STA.B ptrTemp0x72                                          ;8189CE|8572    |000072;
    INX                                                        ;8189D0|E8      |      ;
    INX                                                        ;8189D1|E8      |      ;
    SEP #$20                                                   ;8189D2|E220    |      ;
    LDA.L aDialogsData_BuyItems,X                              ;8189D4|BFA5A181|81A1A5;
    STA.B ptrTemp0x72+2                                        ;8189D8|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;8189DA|22C9B183|83B1C9;
    REP #$20                                                   ;8189DE|C220    |      ;
    BEQ .zero0x80                                              ;8189E0|F007    |8189E9;
    LDA.W #$0004                                               ;8189E2|A90400  |      ;
    STA.B strcVariables.n16Temp2                               ;8189E5|8580    |000080;
    BRA .label3                                                ;8189E7|8002    |8189EB;
 
 
.zero0x80:
    STZ.B strcVariables.n16Temp2                               ;8189E9|6480    |000080;
 
.label3:
    SEP #$20                                                   ;8189EB|E220    |      ;
    LDA.B #$02                                                 ;8189ED|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;8189EF|8D9A01  |00019A;
    SEP #$20                                                   ;8189F2|E220    |      ;
    LDA.W nCarriedItemId                                       ;8189F4|AD8409  |000984;
    CMP.B #$44                                                 ;8189F7|C944    |      ;
    BCS .label4                                                ;8189F9|B008    |818A03;
    SEC                                                        ;8189FB|38      |      ;
    SBC.B #$1B                                                 ;8189FC|E91B    |      ;
    CLC                                                        ;8189FE|18      |      ;
    ADC.B #$13                                                 ;8189FF|6913    |      ;
    BRA .label5                                                ;818A01|800D    |818A10;
 
 
.label4:
    SEP #$20                                                   ;818A03|E220    |      ;
    REP #$10                                                   ;818A05|C210    |      ;
    LDA.B #$00                                                 ;818A07|A900    |      ;
    XBA                                                        ;818A09|EB      |      ;
    LDA.W nCarriedItemId                                       ;818A0A|AD8409  |000984;
    SEC                                                        ;818A0D|38      |      ;
    SBC.B #$44                                                 ;818A0E|E944    |      ;
 
.label5:
    REP #$20                                                   ;818A10|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;818A12|857E    |00007E;
    ASL A                                                      ;818A14|0A      |      ;
    CLC                                                        ;818A15|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;818A16|657E    |00007E;
    ASL A                                                      ;818A18|0A      |      ;
    ASL A                                                      ;818A19|0A      |      ;
    CLC                                                        ;818A1A|18      |      ;
    ADC.W #$0002                                               ;818A1B|690200  |      ;
    ADC.B strcVariables.n16Temp2                               ;818A1E|6580    |000080;
    TAX                                                        ;818A20|AA      |      ;
    LDA.L aDialogsData_BuyItems,X                              ;818A21|BFA5A181|81A1A5;
    TAX                                                        ;818A25|AA      |      ;
    SEP #$20                                                   ;818A26|E220    |      ;
    LDA.B #$00                                                 ;818A28|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;818A2A|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;818A2D|225F9383|83935F;
    REP #$20                                                   ;818A31|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;818A33|A580    |000080;
    BEQ +                                                      ;818A35|F003    |818A3A;
    JMP.W fUnknown_818A44                                      ;818A37|4C448A  |818A44;
 
 
  + SEP #$20                                                   ;818A3A|E220    |      ;
    LDA.B #$03                                                 ;818A3C|A903    |      ;
    STA.W $0976                                                ;818A3E|8D7609  |000976;
    JMP.W fReturn_818B6A                                       ;818A41|4C6A8B  |818B6A;
 
 
fUnknown_818A44:
    SEP #$20                                                   ;818A44|E220    |      ;
    LDA.B #$02                                                 ;818A46|A902    |      ;
    STA.W $0976                                                ;818A48|8D7609  |000976;
    JMP.W fReturn_818B6A                                       ;818A4B|4C6A8B  |818B6A;
 
 
fItemBuy_Unknown818A4E:
    SEP #$20                                                   ;818A4E|E220    |      ;
    LDA.B #$02                                                 ;818A50|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;818A52|8D9A01  |00019A;
    SEP #$20                                                   ;818A55|E220    |      ;
    LDA.W nCarriedItemId                                       ;818A57|AD8409  |000984;
    CMP.B #$44                                                 ;818A5A|C944    |      ;
    BCS .label1                                                ;818A5C|B008    |818A66;
    SEC                                                        ;818A5E|38      |      ;
    SBC.B #$1B                                                 ;818A5F|E91B    |      ;
    CLC                                                        ;818A61|18      |      ;
    ADC.B #$13                                                 ;818A62|6913    |      ;
    BRA .label2                                                ;818A64|800D    |818A73;
 
 
.label1:
    SEP #$20                                                   ;818A66|E220    |      ;
    REP #$10                                                   ;818A68|C210    |      ;
    LDA.B #$00                                                 ;818A6A|A900    |      ;
    XBA                                                        ;818A6C|EB      |      ;
    LDA.W nCarriedItemId                                       ;818A6D|AD8409  |000984;
    SEC                                                        ;818A70|38      |      ;
    SBC.B #$44                                                 ;818A71|E944    |      ;
 
.label2:
    REP #$20                                                   ;818A73|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;818A75|857E    |00007E;
    ASL A                                                      ;818A77|0A      |      ;
    CLC                                                        ;818A78|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;818A79|657E    |00007E;
    ASL A                                                      ;818A7B|0A      |      ;
    ASL A                                                      ;818A7C|0A      |      ;
    CLC                                                        ;818A7D|18      |      ;
    ADC.W #$0004                                               ;818A7E|690400  |      ;
    TAX                                                        ;818A81|AA      |      ;
    LDA.L aDialogsData_BuyItems,X                              ;818A82|BFA5A181|81A1A5;
    TAX                                                        ;818A86|AA      |      ;
    SEP #$20                                                   ;818A87|E220    |      ;
    LDA.B #$00                                                 ;818A89|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;818A8B|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;818A8E|225F9383|83935F;
    BRA fItemBuy_Unknown818AA0                                 ;818A92|800C    |818AA0;
 
 
fUnknown_818A94:
    SEP #$20                                                   ;818A94|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;818A96|AD9A01  |00019A;
    CMP.B #$02                                                 ;818A99|C902    |      ;
    BNE fItemBuy_Unknown818AA0                                 ;818A9B|D003    |818AA0;
    JMP.W fReturn_818B6A                                       ;818A9D|4C6A8B  |818B6A;
 
 
fItemBuy_Unknown818AA0:
    REP #$20                                                   ;818AA0|C220    |      ;
    LDA.W nGameObjectIdx                                       ;818AA2|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818AA5|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;818AA7|22A28185|8581A2;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    JSL.L fUnknown_81A4F1                                      ;818ABE|22F1A481|81A4F1;
    SEP #$20                                                   ;818AC2|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818AC4|9C1D09  |00091D;
    REP #$20                                                   ;818AC7|C220    |      ;
    LDA.W #$0001                                               ;818AC9|A90100  |      ;
    LDX.W #$0006                                               ;818ACC|A20600  |      ;
    LDY.W #$0006                                               ;818ACF|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;818AD2|224ED181|81D14E;
    SEP #$20                                                   ;818AD6|E220    |      ;
    LDA.W nCarriedItemId                                       ;818AD8|AD8409  |000984;
    CMP.B #$44                                                 ;818ADB|C944    |      ;
    BCS .label2                                                ;818ADD|B008    |818AE7;
    SEC                                                        ;818ADF|38      |      ;
    SBC.B #$1B                                                 ;818AE0|E91B    |      ;
    CLC                                                        ;818AE2|18      |      ;
    ADC.B #$13                                                 ;818AE3|6913    |      ;
    BRA .label3                                                ;818AE5|800D    |818AF4;
 
 
.label2:
    SEP #$20                                                   ;818AE7|E220    |      ;
    REP #$10                                                   ;818AE9|C210    |      ;
    LDA.B #$00                                                 ;818AEB|A900    |      ;
    XBA                                                        ;818AED|EB      |      ;
    LDA.W nCarriedItemId                                       ;818AEE|AD8409  |000984;
    SEC                                                        ;818AF1|38      |      ;
    SBC.B #$44                                                 ;818AF2|E944    |      ;
 
.label3:
    REP #$20                                                   ;818AF4|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;818AF6|857E    |00007E;
    ASL A                                                      ;818AF8|0A      |      ;
    CLC                                                        ;818AF9|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;818AFA|657E    |00007E;
    ASL A                                                      ;818AFC|0A      |      ;
    ASL A                                                      ;818AFD|0A      |      ;
    CLC                                                        ;818AFE|18      |      ;
    ADC.W #$0008                                               ;818AFF|690800  |      ;
    TAX                                                        ;818B02|AA      |      ;
    SEP #$20                                                   ;818B03|E220    |      ;
    LDA.L aDialogsData_BuyItems,X                              ;818B05|BFA5A181|81A1A5;
    XBA                                                        ;818B09|EB      |      ;
    LDA.B #$00                                                 ;818B0A|A900    |      ;
    XBA                                                        ;818B0C|EB      |      ;
    LDX.W nTileInFrontOfPlayerX                                ;818B0D|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;818B10|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;818B13|2288A681|81A688;
    BRA fReturn_818B6A                                         ;818B17|8051    |818B6A;
 
 
fUnknown_818B19:
    SEP #$20                                                   ;818B19|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;818B1B|AD9A01  |00019A;
    CMP.B #$02                                                 ;818B1E|C902    |      ;
    BNE +                                                      ;818B20|D003    |818B25;
    JMP.W fReturn_818B6A                                       ;818B22|4C6A8B  |818B6A;
 
 
  + LDA.W nCarriedItemId                                       ;818B25|AD8409  |000984;
    CMP.B #$49                                                 ;818B28|C949    |      ;
    BEQ +                                                      ;818B2A|F037    |818B63;
    CMP.B #$56                                                 ;818B2C|C956    |      ;
    BEQ +                                                      ;818B2E|F033    |818B63;
    CMP.B #$1B                                                 ;818B30|C91B    |      ;
    BEQ +                                                      ;818B32|F02F    |818B63;
    CMP.B #$1C                                                 ;818B34|C91C    |      ;
    BEQ +                                                      ;818B36|F02B    |818B63;
    CMP.B #$1D                                                 ;818B38|C91D    |      ;
    BEQ +                                                      ;818B3A|F027    |818B63;
    REP #$20                                                   ;818B3C|C220    |      ;
    LDA.W nGameObjectIdx                                       ;818B3E|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818B41|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;818B43|22A28185|8581A2;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    JSL.L fUnknown_81A4F1                                      ;818B5A|22F1A481|81A4F1;
    SEP #$20                                                   ;818B5E|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818B60|9C1D09  |00091D;
 
  + SEP #$20                                                   ;818B63|E220    |      ;
    LDA.B #$FF                                                 ;818B65|A9FF    |      ;
    STA.W $0976                                                ;818B67|8D7609  |000976;
 
fReturn_818B6A:
    RTS                                                        ;818B6A|60      |      ;
 
 
fItemFound_Unknown818B6B:
    REP #$30                                                   ;818B6B|C230    |      ;
    LDY.W #$0001                                               ;818B6D|A00100  |      ;
    JSL.L fUnknown_8180B7                                      ;818B70|22B78081|8180B7;
    SEP #$20                                                   ;818B74|E220    |      ;
    LDA.B #$00                                                 ;818B76|A900    |      ;
    XBA                                                        ;818B78|EB      |      ;
    LDA.W nCarriedItemId                                       ;818B79|AD8409  |000984;
    DEC A                                                      ;818B7C|3A      |      ;
    REP #$20                                                   ;818B7D|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;818B7F|857E    |00007E;
    ASL A                                                      ;818B81|0A      |      ;
    CLC                                                        ;818B82|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;818B83|657E    |00007E;
    TAX                                                        ;818B85|AA      |      ; X = (nCarriedItem - 1) * 3
    LDA.L aFoundItemData,X                                     ;818B86|BFC69F81|819FC6;
    TAX                                                        ;818B8A|AA      |      ;
    SEP #$20                                                   ;818B8B|E220    |      ;
    LDA.B #$02                                                 ;818B8D|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;818B8F|8D9A01  |00019A;
    LDA.B #$00                                                 ;818B92|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;818B94|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;818B97|225F9383|83935F;
    SEP #$20                                                   ;818B9B|E220    |      ;
    LDA.B #$01                                                 ;818B9D|A901    |      ;
    STA.W $0976                                                ;818B9F|8D7609  |000976;
    JMP.W fReturn_818C23                                       ;818BA2|4C238C  |818C23;
 
 
fItemFound_Consume:
    SEP #$20                                                   ;818BA5|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;818BA7|AD9A01  |00019A;
    CMP.B #$02                                                 ;818BAA|C902    |      ;
    BNE +                                                      ;818BAC|D003    |818BB1;
    JMP.W fReturn_818C23                                       ;818BAE|4C238C  |818C23;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;818BB1|AD8F01  |00018F;
    BEQ +                                                      ;818BB4|F003    |818BB9;
    JMP.W fUnknown_818C0C                                      ;818BB6|4C0C8C  |818C0C;
 
 
  + %SetPlayerAction(!PACTION_CONSUMEITEM)
    %UnsetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$20                                                   ;818BCC|C220    |      ;
    LDA.W nGameObjectIdx                                       ;818BCE|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818BD1|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;818BD3|22A28185|8581A2;
    JSL.L fUnknown_81A4F1                                      ;818BD7|22F1A481|81A4F1;
    SEP #$20                                                   ;818BDB|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818BDD|9C1D09  |00091D;
    SEP #$20                                                   ;818BE0|E220    |      ;
    LDA.B #$00                                                 ;818BE2|A900    |      ;
    XBA                                                        ;818BE4|EB      |      ;
    LDA.W nCarriedItemId                                       ;818BE5|AD8409  |000984;
    DEC A                                                      ;818BE8|3A      |      ;
    REP #$20                                                   ;818BE9|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;818BEB|857E    |00007E;
    ASL A                                                      ;818BED|0A      |      ;
    CLC                                                        ;818BEE|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;818BEF|657E    |00007E;
    TAX                                                        ;818BF1|AA      |      ;
    INX                                                        ;818BF2|E8      |      ;
    INX                                                        ;818BF3|E8      |      ;
    SEP #$20                                                   ;818BF4|E220    |      ;
    LDA.L aFoundItemData,X                                     ;818BF6|BFC69F81|819FC6;
    JSL.L fPlayerEnergyHandler                                 ;818BFA|2261D081|81D061;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    BRA fReturn_818C23                                         ;818C0A|8017    |818C23;
 
 
fUnknown_818C0C:
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;818C1C|E220    |      ;
    LDA.B #$02                                                 ;818C1E|A902    |      ;
    STA.W $0976                                                ;818C20|8D7609  |000976;
 
fReturn_818C23:
    RTS                                                        ;818C23|60      |      ;
 
 
fUnknown_818C24:
    REP #$20                                                   ;818C24|C220    |      ;
    LDA.B strcPlayer.posX                                      ;818C26|A5D6    |0000D6;
    STA.W nUnknownX                                            ;818C28|8D8009  |000980;
    LDA.B strcPlayer.posY                                      ;818C2B|A5D8    |0000D8;
    INC A                                                      ;818C2D|1A      |      ;
    INC A                                                      ;818C2E|1A      |      ;
    STA.W nUnknownY                                            ;818C2F|8D8209  |000982;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE .label1                                                ;818C39|D003    |818C3E;
    JMP.W .label2                                              ;818C3B|4C538C  |818C53;
 
 
.label1:
    REP #$30                                                   ;818C3E|C230    |      ;
    LDY.W #$0001                                               ;818C40|A00100  |      ;
    JSL.L fUnknown_8180B7                                      ;818C43|22B78081|8180B7;
    SEP #$20                                                   ;818C47|E220    |      ;
    LDA.W $0974                                                ;818C49|AD7409  |000974;
    AND.B #$FB                                                 ;818C4C|29FB    |      ;
    STA.W $0974                                                ;818C4E|8D7409  |000974;
    BRA .label3                                                ;818C51|8032    |818C85;
 
 
.label2:
    SEP #$20                                                   ;818C53|E220    |      ;
    REP #$10                                                   ;818C55|C210    |      ;
    LDA.W $0974                                                ;818C57|AD7409  |000974;
    AND.B #$04                                                 ;818C5A|2904    |      ;
    BNE .label4                                                ;818C5C|D013    |818C71;
    LDY.W #$000B                                               ;818C5E|A00B00  |      ;
    JSL.L fUnknown_8180B7                                      ;818C61|22B78081|8180B7;
    SEP #$20                                                   ;818C65|E220    |      ;
    LDA.W $0974                                                ;818C67|AD7409  |000974;
    ORA.B #$04                                                 ;818C6A|0904    |      ;
    STA.W $0974                                                ;818C6C|8D7409  |000974;
    BRA .label3                                                ;818C6F|8014    |818C85;
 
 
.label4:
    REP #$20                                                   ;818C71|C220    |      ;
    LDA.W nGameObjectIdx                                       ;818C73|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818C76|85A5    |0000A5;
    JSL.L fObject_GetSingleObjectData                          ;818C78|22CB8185|8581CB;
    REP #$20                                                   ;818C7C|C220    |      ;
    LDA.B strcObject.exists                                    ;818C7E|A5A7    |0000A7;
    CMP.W #$FFFF                                               ;818C80|C9FFFF  |      ;
    BEQ .label1                                                ;818C83|F0B9    |818C3E;
 
.label3:
    %CheckPlayerAction(!PACTION_DROPITEM)
    BEQ .lable5                                                ;818C8C|F003    |818C91;
    JMP.W fReturn_818E1A                                       ;818C8E|4C1A8E  |818E1A;
 
 
.lable5:
    REP #$20                                                   ;818C91|C220    |      ;
    LDA.W #$0001                                               ;818C93|A90100  |      ;
    LDX.W #$0006                                               ;818C96|A20600  |      ;
    LDY.W #$0006                                               ;818C99|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;818C9C|224ED181|81D14E;
    REP #$30                                                   ;818CA0|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;818CA2|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;818CA5|AC8709  |000987;
    LDA.W #$0002                                               ;818CA8|A90200  |      ;
    JSL.L fUnknown_82AC61                                      ;818CAB|2261AC82|82AC61;
    REP #$30                                                   ;818CAF|C230    |      ;
    CPX.W #$0001                                               ;818CB1|E00100  |      ;
    BEQ .label6                                                ;818CB4|F043    |818CF9;
    CPX.W #$0002                                               ;818CB6|E00200  |      ;
    BEQ .label6                                                ;818CB9|F03E    |818CF9;
    CPX.W #$0007                                               ;818CBB|E00700  |      ;
    BEQ .label6                                                ;818CBE|F039    |818CF9;
    CPX.W #$0008                                               ;818CC0|E00800  |      ;
    BEQ .label6                                                ;818CC3|F034    |818CF9;
    REP #$20                                                   ;818CC5|C220    |      ;
    LDA.W #$0000                                               ;818CC7|A90000  |      ;
    CPX.W #$00F0                                               ;818CCA|E0F000  |      ;
    BEQ .label6                                                ;818CCD|F02A    |818CF9;
    LDA.W #$0001                                               ;818CCF|A90100  |      ;
    CPX.W #$00F9                                               ;818CD2|E0F900  |      ;
    BEQ .label6                                                ;818CD5|F022    |818CF9;
    LDA.W #$0002                                               ;818CD7|A90200  |      ;
    CPX.W #$00FA                                               ;818CDA|E0FA00  |      ;
    BEQ .label6                                                ;818CDD|F01A    |818CF9;
    LDA.W #$0003                                               ;818CDF|A90300  |      ;
    CPX.W #$00FB                                               ;818CE2|E0FB00  |      ;
    BEQ .label6                                                ;818CE5|F012    |818CF9;
    LDA.W #$0004                                               ;818CE7|A90400  |      ;
    CPX.W #$00FC                                               ;818CEA|E0FC00  |      ;
    BEQ .label6                                                ;818CED|F00A    |818CF9;
    LDA.W #$0005                                               ;818CEF|A90500  |      ;
    CPX.W #$00FD                                               ;818CF2|E0FD00  |      ;
    BEQ .label6                                                ;818CF5|F002    |818CF9;
    BRA .label7                                                ;818CF7|8035    |818D2E;
 
 
.label6:
    REP #$30                                                   ;818CF9|C230    |      ;
    LDA.B strcPlayer.posX                                      ;818CFB|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;818CFD|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;818CFF|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;818D01|85E1    |0000E1;
    STZ.B strcPlayer.newX                                      ;818D03|64E5    |0000E5;
    STZ.B strcPlayer.newY                                      ;818D05|64E7    |0000E7;
    LDA.W #$0010                                               ;818D07|A91000  |      ;
    STA.B strcPlayer.unkE3                                     ;818D0A|85E3    |0000E3;
    LDA.B strcPlayer.direction                                 ;818D0C|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;818D0E|2291AD83|83AD91;
    CMP.W #$0000                                               ;818D12|C90000  |      ;
    BNE .label7                                                ;818D15|D017    |818D2E;
    REP #$30                                                   ;818D17|C230    |      ;
    LDA.W #$0006                                               ;818D19|A90600  |      ;
    CLC                                                        ;818D1C|18      |      ;
    ADC.B strcPlayer.direction                                 ;818D1D|65DA    |0000DA;
    TAY                                                        ;818D1F|A8      |      ;
    JSL.L fUnknown_8180B7                                      ;818D20|22B78081|8180B7;
    SEP #$20                                                   ;818D24|E220    |      ;
    LDA.B #$03                                                 ;818D26|A903    |      ;
    STA.W $0976                                                ;818D28|8D7609  |000976;
    JMP.W fReturn_818E1A                                       ;818D2B|4C1A8E  |818E1A;
 
 
.label7:
    %SetPlayerAction(!PACTION_NONE)
    JMP.W fReturn_818E1A                                       ;818D35|4C1A8E  |818E1A;
 
 
fUnknown_818D38:
    REP #$20                                                   ;818D38|C220    |      ;
    LDA.W #$0001                                               ;818D3A|A90100  |      ;
    LDX.W #$0006                                               ;818D3D|A20600  |      ;
    LDY.W #$0006                                               ;818D40|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;818D43|224ED181|81D14E;
    REP #$30                                                   ;818D47|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;818D49|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;818D4C|AC8709  |000987;
    LDA.W #$0002                                               ;818D4F|A90200  |      ;
    JSL.L fUnknown_82AC61                                      ;818D52|2261AC82|82AC61;
    REP #$30                                                   ;818D56|C230    |      ;
    CPX.W #$0001                                               ;818D58|E00100  |      ;
    BEQ fItemShipped_Unknown818DAB                             ;818D5B|F04E    |818DAB;
    CPX.W #$0002                                               ;818D5D|E00200  |      ;
    BEQ fItemShipped_Unknown818DAB                             ;818D60|F049    |818DAB;
    CPX.W #$0007                                               ;818D62|E00700  |      ;
    BEQ fItemShipped_Unknown818DAB                             ;818D65|F044    |818DAB;
    CPX.W #$0008                                               ;818D67|E00800  |      ;
    BEQ fItemShipped_Unknown818DAB                             ;818D6A|F03F    |818DAB;
    REP #$20                                                   ;818D6C|C220    |      ;
    LDA.W #$0000                                               ;818D6E|A90000  |      ;
    CPX.W #$00F0                                               ;818D71|E0F000  |      ;
    BNE +                                                      ;818D74|D003    |818D79;
    JMP.W fUnknown_818DEC                                      ;818D76|4CEC8D  |818DEC;
 
 
  + LDA.W #$0001                                               ;818D79|A90100  |      ;
    CPX.W #$00F9                                               ;818D7C|E0F900  |      ;
    BEQ fUnknown_818DEC                                        ;818D7F|F06B    |818DEC;
    LDA.W #$0002                                               ;818D81|A90200  |      ;
    CPX.W #$00FA                                               ;818D84|E0FA00  |      ;
    BEQ fUnknown_818DEC                                        ;818D87|F063    |818DEC;
    LDA.W #$0003                                               ;818D89|A90300  |      ;
    CPX.W #$00FB                                               ;818D8C|E0FB00  |      ;
    BEQ fUnknown_818DEC                                        ;818D8F|F05B    |818DEC;
    LDA.W #$0004                                               ;818D91|A90400  |      ;
    CPX.W #$00FC                                               ;818D94|E0FC00  |      ;
    BEQ fUnknown_818DEC                                        ;818D97|F053    |818DEC;
    LDA.W #$0005                                               ;818D99|A90500  |      ;
    CPX.W #$00FD                                               ;818D9C|E0FD00  |      ;
    BEQ fUnknown_818DEC                                        ;818D9F|F04B    |818DEC;
    %SetPlayerAction(!PACTION_NONE)
    JMP.W fReturn_818E1A                                       ;818DA8|4C1A8E  |818E1A;
 
 
fItemShipped_Unknown818DAB:
    REP #$20                                                   ;818DAB|C220    |      ;
    LDA.W #$0001                                               ;818DAD|A90100  |      ;
    LDX.W #$0006                                               ;818DB0|A20600  |      ;
    LDY.W #$0006                                               ;818DB3|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;818DB6|224ED181|81D14E;
    SEP #$20                                                   ;818DBA|E220    |      ;
    LDA.B #$00                                                 ;818DBC|A900    |      ;
    XBA                                                        ;818DBE|EB      |      ;
    LDA.W nCarriedItemId                                       ;818DBF|AD8409  |000984;
    REP #$20                                                   ;818DC2|C220    |      ;
    ASL A                                                      ;818DC4|0A      |      ;
    TAX                                                        ;818DC5|AA      |      ;
    SEP #$20                                                   ;818DC6|E220    |      ;
    LDA.L aDialogData_ShippingProfit,X                         ;818DC8|BFDE9F81|819FDE;
    LDX.W nTileInFrontOfPlayerX                                ;818DCC|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;818DCF|AC8709  |000987;
    JSL.L fSetTileAtCoords                                     ;818DD2|2288A681|81A688;
    REP #$20                                                   ;818DD6|C220    |      ;
    LDA.W nGameObjectIdx                                       ;818DD8|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818DDB|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;818DDD|22A28185|8581A2;
    JSL.L fUnknown_81A4F1                                      ;818DE1|22F1A481|81A4F1;
    SEP #$20                                                   ;818DE5|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818DE7|9C1D09  |00091D;
    BRA fReturn_818E1A                                         ;818DEA|802E    |818E1A;
 
 
fUnknown_818DEC:
    REP #$20                                                   ;818DEC|C220    |      ;
    ASL A                                                      ;818DEE|0A      |      ;
    ASL A                                                      ;818DEF|0A      |      ;
    TAX                                                        ;818DF0|AA      |      ;
    LDA.L nUnknownXYTable,X                                    ;818DF1|BF63A381|81A363;
    STA.W nUnknownX                                            ;818DF5|8D8009  |000980;
    INX                                                        ;818DF8|E8      |      ;
    INX                                                        ;818DF9|E8      |      ;
    LDA.L nUnknownXYTable,X                                    ;818DFA|BF63A381|81A363;
    STA.W nUnknownY                                            ;818DFE|8D8209  |000982;
    LDA.W #$00CA                                               ;818E01|A9CA00  |      ;
    STA.W $097A                                                ;818E04|8D7A09  |00097A;
    SEP #$20                                                   ;818E07|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818E09|9C1D09  |00091D;
    SEP #$20                                                   ;818E0C|E220    |      ;
    LDA.B #$04                                                 ;818E0E|A904    |      ;
    STA.W $0976                                                ;818E10|8D7609  |000976;
    JMP.W fReturn_818E1A                                       ;818E13|4C1A8E  |818E1A;
 
 
fUnknown_818E16:
    JSL.L fUnknown_81A4F1                                      ;818E16|22F1A481|81A4F1;
 
fReturn_818E1A:
    RTS                                                        ;818E1A|60      |      ;
 
 
fUnknown_818E1B:
    SEP #$20                                                   ;818E1B|E220    |      ;
    LDA.W strcPlayerData.carryItemId                           ;818E1D|AD1D09  |00091D;
    CMP.B #$29                                                 ;818E20|C929    |      ;
    BEQ +                                                      ;818E22|F033    |818E57;
    SEP #$20                                                   ;818E24|E220    |      ;
    LDA.B #$00                                                 ;818E26|A900    |      ;
    XBA                                                        ;818E28|EB      |      ;
    LDA.W strcPlayerData.nAiArg                                ;818E29|AD2009  |000920;
    SEC                                                        ;818E2C|38      |      ;
    SBC.B #$24                                                 ;818E2D|E924    |      ;
    JSL.L fGameEngine_GetChickenData                           ;818E2F|2295C983|83C995;
    SEP #$20                                                   ;818E33|E220    |      ;
    LDY.W #$0001                                               ;818E35|A00100  |      ;
    LDA.B strcMap.loadAreaId                                   ;818E38|A522    |000022;
    STA.B [ptrTemp0x72],Y                                      ;818E3A|9772    |000072;
    LDY.W #$0000                                               ;818E3C|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;818E3F|B772    |000072;
    AND.B #$DF                                                 ;818E41|29DF    |      ;
    STA.B [ptrTemp0x72],Y                                      ;818E43|9772    |000072;
    REP #$20                                                   ;818E45|C220    |      ;
    LDY.W #$0004                                               ;818E47|A00400  |      ;
    LDA.W nTileInFrontOfPlayerX                                ;818E4A|AD8509  |000985;
    STA.B [ptrTemp0x72],Y                                      ;818E4D|9772    |000072;
    LDY.W #$0006                                               ;818E4F|A00600  |      ;
    LDA.W nTileInFrontOfPlayerY                                ;818E52|AD8709  |000987;
    STA.B [ptrTemp0x72],Y                                      ;818E55|9772    |000072;
 
  + REP #$30                                                   ;818E57|C230    |      ;
    LDY.W #$0001                                               ;818E59|A00100  |      ;
    SEP #$20                                                   ;818E5C|E220    |      ;
    LDA.W strcPlayerData.carryItemId                           ;818E5E|AD1D09  |00091D;
    CMP.B #$26                                                 ;818E61|C926    |      ;
    BEQ +                                                      ;818E63|F00D    |818E72;
    LDY.W #$0002                                               ;818E65|A00200  |      ;
    LDA.W strcPlayerData.carryItemId                           ;818E68|AD1D09  |00091D;
    CMP.B #$25                                                 ;818E6B|C925    |      ;
    BEQ +                                                      ;818E6D|F003    |818E72;
    LDY.W #$0031                                               ;818E6F|A03100  |      ;
 
  + SEP #$20                                                   ;818E72|E220    |      ;
    LDA.B #$00                                                 ;818E74|A900    |      ;
    XBA                                                        ;818E76|EB      |      ;
    LDA.W strcPlayerData.nAiArg                                ;818E77|AD2009  |000920;
    LDX.W #$0000                                               ;818E7A|A20000  |      ;
    JSL.L fAI_Unknown8480F8                                    ;818E7D|22F88084|8480F8;
    REP #$30                                                   ;818E81|C230    |      ;
    LDA.W nGameObjectIdx                                       ;818E83|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818E86|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;818E88|22A28185|8581A2;
    JSL.L fUnknown_81A4F1                                      ;818E8C|22F1A481|81A4F1;
    SEP #$20                                                   ;818E90|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818E92|9C1D09  |00091D;
    JMP.W fReturn_8196AE                                       ;818E95|4CAE96  |8196AE;
 
 
fUnknown_818E98:
    SEP #$20                                                   ;818E98|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818E9A|9C1D09  |00091D;
    REP #$20                                                   ;818E9D|C220    |      ;
    LDA.W #$0001                                               ;818E9F|A90100  |      ;
    LDX.W #$0006                                               ;818EA2|A20600  |      ;
    LDY.W #$0006                                               ;818EA5|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;818EA8|224ED181|81D14E;
    REP #$30                                                   ;818EAC|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;818EAE|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;818EB1|AC8709  |000987;
    LDA.W #$0000                                               ;818EB4|A90000  |      ;
    JSL.L fUnknown_82AC61                                      ;818EB7|2261AC82|82AC61;
    SEP #$20                                                   ;818EBB|E220    |      ;
    REP #$10                                                   ;818EBD|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;818EBF|A522    |000022;
    CMP.B #$27                                                 ;818EC1|C927    |      ;
    BEQ +                                                      ;818EC3|F007    |818ECC;
    CMP.B #$28                                                 ;818EC5|C928    |      ;
    BEQ .skip                                                  ;818EC7|F032    |818EFB;
    JMP.W fUnknown_819379                                      ;818EC9|4C7993  |819379;
 
 
  + CPX.W #$00E2                                               ;818ECC|E0E200  |      ;
    BCS +                                                      ;818ECF|B003    |818ED4;
    JMP.W fUnknown_819379                                      ;818ED1|4C7993  |819379;
 
 
  + CPX.W #$00EF                                               ;818ED4|E0EF00  |      ;
    BCC +                                                      ;818ED7|9003    |818EDC;
    JMP.W fUnknown_819379                                      ;818ED9|4C7993  |819379;
 
 
  + REP #$20                                                   ;818EDC|C220    |      ;
    TXA                                                        ;818EDE|8A      |      ;
    SEC                                                        ;818EDF|38      |      ;
    SBC.W #$00E2                                               ;818EE0|E9E200  |      ;
    ASL A                                                      ;818EE3|0A      |      ;
    TAX                                                        ;818EE4|AA      |      ;
    LDA.L nCowFeedFlagsTable,X                                 ;818EE5|BF71A582|82A571;
    ORA.W strcPlayerData.placedCowFeedFlags                    ;818EE9|0D3209  |000932;
    STA.W strcPlayerData.placedCowFeedFlags                    ;818EEC|8D3209  |000932;
    SEP #$20                                                   ;818EEF|E220    |      ;
    LDA.W strcPlayerData.placedCowFeed                         ;818EF1|AD3009  |000930;
    INC A                                                      ;818EF4|1A      |      ;
    STA.W strcPlayerData.placedCowFeed                         ;818EF5|8D3009  |000930;
    JMP.W fItemShipped_Unknown818DAB                           ;818EF8|4CAB8D  |818DAB;
 
 
.skip:
    CPX.W #$00E2                                               ;818EFB|E0E200  |      ;
    BCS +                                                      ;818EFE|B003    |818F03;
    JMP.W fUnknown_819379                                      ;818F00|4C7993  |819379;
 
 
  + CPX.W #$00EF                                               ;818F03|E0EF00  |      ;
    BCC +                                                      ;818F06|9003    |818F0B;
    JMP.W fUnknown_819379                                      ;818F08|4C7993  |819379;
 
 
  + REP #$20                                                   ;818F0B|C220    |      ;
    TXA                                                        ;818F0D|8A      |      ;
    SEC                                                        ;818F0E|38      |      ;
    SBC.W #$00E2                                               ;818F0F|E9E200  |      ;
    ASL A                                                      ;818F12|0A      |      ;
    TAX                                                        ;818F13|AA      |      ;
    LDA.L nCowFeedFlagsTable,X                                 ;818F14|BF71A582|82A571;
    ORA.W strcPlayerData.placedChickenFeedFlags                ;818F18|0D3409  |000934;
    STA.W strcPlayerData.placedChickenFeedFlags                ;818F1B|8D3409  |000934;
    SEP #$20                                                   ;818F1E|E220    |      ;
    LDA.W strcPlayerData.placedChcikenFeed                     ;818F20|AD3109  |000931;
    INC A                                                      ;818F23|1A      |      ;
    STA.W strcPlayerData.placedChcikenFeed                     ;818F24|8D3109  |000931;
    JMP.W fItemShipped_Unknown818DAB                           ;818F27|4CAB8D  |818DAB;
 
 
fItemSell_Unknown818F2A:
    SEP #$20                                                   ;818F2A|E220    |      ;
    LDA.B #$02                                                 ;818F2C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;818F2E|8D9A01  |00019A;
    LDA.B #$00                                                 ;818F31|A900    |      ;
    XBA                                                        ;818F33|EB      |      ;
    LDA.W nCarriedItemId                                       ;818F34|AD8409  |000984;
    REP #$20                                                   ;818F37|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;818F39|857E    |00007E;
    ASL A                                                      ;818F3B|0A      |      ;
    CLC                                                        ;818F3C|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;818F3D|657E    |00007E;
    TAX                                                        ;818F3F|AA      |      ;
    LDA.L aDialogData_SellItems,X                              ;818F40|BF94A081|81A094;
    TAX                                                        ;818F44|AA      |      ;
    SEP #$20                                                   ;818F45|E220    |      ;
    LDA.B #$00                                                 ;818F47|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;818F49|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;818F4C|225F9383|83935F;
    SEP #$20                                                   ;818F50|E220    |      ;
    LDA.B #$06                                                 ;818F52|A906    |      ;
    STA.W $0976                                                ;818F54|8D7609  |000976;
    JMP.W fReturn_81900F                                       ;818F57|4C0F90  |81900F;
 
 
fItemSell_Unknown818F5A:
    SEP #$20                                                   ;818F5A|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;818F5C|AD9A01  |00019A;
    CMP.B #$02                                                 ;818F5F|C902    |      ;
    BNE +                                                      ;818F61|D003    |818F66;
    JMP.W fReturn_81900F                                       ;818F63|4C0F90  |81900F;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;818F66|AD8F01  |00018F;
    BEQ +                                                      ;818F69|F003    |818F6E;
    JMP.W fUnknown_818FD7                                      ;818F6B|4CD78F  |818FD7;
 
 
  + LDA.B #$00                                                 ;818F6E|A900    |      ;
    XBA                                                        ;818F70|EB      |      ;
    LDA.W nCarriedItemId                                       ;818F71|AD8409  |000984;
    REP #$20                                                   ;818F74|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;818F76|857E    |00007E;
    ASL A                                                      ;818F78|0A      |      ;
    CLC                                                        ;818F79|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;818F7A|657E    |00007E;
    TAX                                                        ;818F7C|AA      |      ;
    LDA.L aDialogData_SellItems,X                              ;818F7D|BF94A081|81A094;
    CMP.W #$0313                                               ;818F81|C91303  |      ; Sorry but we can't accept that
    BEQ fUnknown_818FEA                                        ;818F84|F064    |818FEA;
    SEP #$20                                                   ;818F86|E220    |      ;
    LDA.B #$02                                                 ;818F88|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;818F8A|8D9A01  |00019A;
    LDX.W #$02FA                                               ;818F8D|A2FA02  |      ;
    LDA.B #$00                                                 ;818F90|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;818F92|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;818F95|225F9383|83935F;
    REP #$20                                                   ;818F99|C220    |      ;
    LDA.W nGameObjectIdx                                       ;818F9B|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818F9E|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;818FA0|22A28185|8581A2;
    JSL.L fUnknown_81A4F1                                      ;818FA4|22F1A481|81A4F1;
    SEP #$20                                                   ;818FA8|E220    |      ;
    LDA.B #$00                                                 ;818FAA|A900    |      ;
    XBA                                                        ;818FAC|EB      |      ;
    LDA.W nCarriedItemId                                       ;818FAD|AD8409  |000984;
    REP #$20                                                   ;818FB0|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;818FB2|857E    |00007E;
    ASL A                                                      ;818FB4|0A      |      ;
    CLC                                                        ;818FB5|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;818FB6|657E    |00007E;
    TAX                                                        ;818FB8|AA      |      ;
    INX                                                        ;818FB9|E8      |      ;
    INX                                                        ;818FBA|E8      |      ;
    SEP #$20                                                   ;818FBB|E220    |      ;
    LDA.B #$00                                                 ;818FBD|A900    |      ;
    XBA                                                        ;818FBF|EB      |      ;
    LDA.L aDialogData_SellItems,X                              ;818FC0|BF94A081|81A094;
    REP #$20                                                   ;818FC4|C220    |      ;
    STA.B ptrTemp0x72                                          ;818FC6|8572    |000072;
    SEP #$20                                                   ;818FC8|E220    |      ;
    STZ.B ptrTemp0x72+2                                        ;818FCA|6474    |000074;
    JSL.L fGameEngine_AddProfit                                ;818FCC|22C9B183|83B1C9;
    SEP #$20                                                   ;818FD0|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818FD2|9C1D09  |00091D;
    BRA fReturn_81900F                                         ;818FD5|8038    |81900F;
 
 
fUnknown_818FD7:
    SEP #$20                                                   ;818FD7|E220    |      ;
    LDA.B #$02                                                 ;818FD9|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;818FDB|8D9A01  |00019A;
    LDX.W #$0303                                               ;818FDE|A20303  |      ;
    LDA.B #$00                                                 ;818FE1|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;818FE3|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;818FE6|225F9383|83935F;
 
fUnknown_818FEA:
    REP #$20                                                   ;818FEA|C220    |      ;
    LDY.W #$0001                                               ;818FEC|A00100  |      ;
    JSL.L fUnknown_8180B7                                      ;818FEF|22B78081|8180B7;
    LDA.W strcObjectData.camX                                  ;818FF3|AD0B09  |00090B;
    STA.W nUnknownX                                            ;818FF6|8D8009  |000980;
    LDA.W strcObjectData.camY                                  ;818FF9|AD0D09  |00090D;
    STA.W nUnknownY                                            ;818FFC|8D8209  |000982;
    SEP #$20                                                   ;818FFF|E220    |      ;
    LDA.B #$02                                                 ;819001|A902    |      ;
    STA.W $0976                                                ;819003|8D7609  |000976;
    %SetPlayerFlag(!PFLAGS_HOLDINGITEM)
 
fReturn_81900F:
    RTS                                                        ;81900F|60      |      ;
 
 
fUnknown_819010:
    REP #$30                                                   ;819010|C230    |      ;
    LDY.W #$0001                                               ;819012|A00100  |      ;
    JSL.L fUnknown_8180B7                                      ;819015|22B78081|8180B7;
    SEP #$20                                                   ;819019|E220    |      ;
    LDA.B #$02                                                 ;81901B|A902    |      ;
    STA.W $0976                                                ;81901D|8D7609  |000976;
    RTS                                                        ;819020|60      |      ;
 
 
fUnknown_819021:
    REP #$30                                                   ;819021|C230    |      ;
    LDA.W nGameObjectIdx                                       ;819023|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;819026|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;819028|22A28185|8581A2;
    JSL.L fUnknown_81A4F1                                      ;81902C|22F1A481|81A4F1;
    SEP #$20                                                   ;819030|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;819032|9C1D09  |00091D;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    RTS                                                        ;819048|60      |      ;
 
 
fUnknown_819049:
    REP #$20                                                   ;819049|C220    |      ;
    LDA.B strcPlayer.posX                                      ;81904B|A5D6    |0000D6;
    STA.W nUnknownX                                            ;81904D|8D8009  |000980;
    LDA.B strcPlayer.posY                                      ;819050|A5D8    |0000D8;
    INC A                                                      ;819052|1A      |      ;
    INC A                                                      ;819053|1A      |      ;
    STA.W nUnknownY                                            ;819054|8D8209  |000982;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE fUnknown_819063                                        ;81905E|D003    |819063;
    JMP.W fUnknown_819078                                      ;819060|4C7890  |819078;
 
 
fUnknown_819063:
    REP #$30                                                   ;819063|C230    |      ;
    LDY.W #$0001                                               ;819065|A00100  |      ;
    JSL.L fUnknown_8180B7                                      ;819068|22B78081|8180B7;
    SEP #$20                                                   ;81906C|E220    |      ;
    LDA.W $0974                                                ;81906E|AD7409  |000974;
    AND.B #$FB                                                 ;819071|29FB    |      ;
    STA.W $0974                                                ;819073|8D7409  |000974;
    BRA fItemSell_Unknown8190AA                                ;819076|8032    |8190AA;
 
 
fUnknown_819078:
    SEP #$20                                                   ;819078|E220    |      ;
    REP #$10                                                   ;81907A|C210    |      ;
    LDA.W $0974                                                ;81907C|AD7409  |000974;
    AND.B #$04                                                 ;81907F|2904    |      ;
    BNE +                                                      ;819081|D013    |819096;
    LDY.W #$000B                                               ;819083|A00B00  |      ;
    JSL.L fUnknown_8180B7                                      ;819086|22B78081|8180B7;
    SEP #$20                                                   ;81908A|E220    |      ;
    LDA.W $0974                                                ;81908C|AD7409  |000974;
    ORA.B #$04                                                 ;81908F|0904    |      ;
    STA.W $0974                                                ;819091|8D7409  |000974;
    BRA fItemSell_Unknown8190AA                                ;819094|8014    |8190AA;
 
 
  + REP #$20                                                   ;819096|C220    |      ;
    LDA.W nGameObjectIdx                                       ;819098|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;81909B|85A5    |0000A5;
    JSL.L fObject_GetSingleObjectData                          ;81909D|22CB8185|8581CB;
    REP #$20                                                   ;8190A1|C220    |      ;
    LDA.B strcObject.exists                                    ;8190A3|A5A7    |0000A7;
    CMP.W #$FFFF                                               ;8190A5|C9FFFF  |      ;
    BEQ fUnknown_819063                                        ;8190A8|F0B9    |819063;
 
fItemSell_Unknown8190AA:
    %CheckPlayerAction(!PACTION_DROPITEM)
    BEQ +                                                      ;8190B1|F003    |8190B6;
    JMP.W fReturn_819227                                       ;8190B3|4C2792  |819227;
 
 
  + REP #$30                                                   ;8190B6|C230    |      ;
    LDA.B strcPlayer.posX                                      ;8190B8|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;8190BA|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;8190BC|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;8190BE|85E1    |0000E1;
    STZ.B strcPlayer.newX                                      ;8190C0|64E5    |0000E5;
    STZ.B strcPlayer.newY                                      ;8190C2|64E7    |0000E7;
    LDA.W #$0010                                               ;8190C4|A91000  |      ;
    STA.B strcPlayer.unkE3                                     ;8190C7|85E3    |0000E3;
    LDA.B strcPlayer.direction                                 ;8190C9|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;8190CB|2291AD83|83AD91;
    REP #$30                                                   ;8190CF|C230    |      ;
    CMP.W #$0000                                               ;8190D1|C90000  |      ;
    BEQ +                                                      ;8190D4|F003    |8190D9;
    JMP.W fItemShipped_Unknown819195                           ;8190D6|4C9591  |819195;
 
 
  + SEP #$20                                                   ;8190D9|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;8190DB|A522    |000022;
    CMP.B #$04                                                 ;8190DD|C904    |      ;
    BCS +                                                      ;8190DF|B003    |8190E4;
    JMP.W fUnknown_81917E                                      ;8190E1|4C7E91  |81917E;
 
 
  + CMP.B #$08                                                 ;8190E4|C908    |      ;
    BCC +                                                      ;8190E6|9003    |8190EB;
    JMP.W fUnknown_81917E                                      ;8190E8|4C7E91  |81917E;
 
 
  + LDA.L nCurrentWeekdayID                                    ;8190EB|AF1A1F7F|7F1F1A;
    BEQ +                                                      ;8190EF|F003    |8190F4;
    JMP.W fUnknown_81917E                                      ;8190F1|4C7E91  |81917E;
 
 
  + LDA.L nCurrentTimeID                                       ;8190F4|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;8190F8|C911    |      ;
    BCC +                                                      ;8190FA|9003    |8190FF;
    JMP.W fUnknown_81917E                                      ;8190FC|4C7E91  |81917E;
 
 
  + REP #$20                                                   ;8190FF|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;819101|AD9601  |000196;
    AND.W #$0002                                               ;819104|290200  |      ;
    BEQ +                                                      ;819107|F003    |81910C;
    JMP.W fUnknown_81917E                                      ;819109|4C7E91  |81917E;
 
 
  + REP #$20                                                   ;81910C|C220    |      ;
    LDA.W #$0001                                               ;81910E|A90100  |      ;
    LDX.W #$0000                                               ;819111|A20000  |      ;
    LDY.W #$0000                                               ;819114|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;819117|224ED181|81D14E;
    REP #$20                                                   ;81911B|C220    |      ;
    LDA.W #$0000                                               ;81911D|A90000  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;819120|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;819123|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;819126|2261AC82|82AC61;
    CPX.W #$00F0                                               ;81912A|E0F000  |      ;
    BEQ +                                                      ;81912D|F003    |819132;
    JMP.W fUnknown_81917E                                      ;81912F|4C7E91  |81917E;
 
 
  + SEP #$20                                                   ;819132|E220    |      ;
    LDA.B #$00                                                 ;819134|A900    |      ;
    XBA                                                        ;819136|EB      |      ;
    LDA.W nCarriedItemId                                       ;819137|AD8409  |000984;
    REP #$20                                                   ;81913A|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;81913C|857E    |00007E;
    ASL A                                                      ;81913E|0A      |      ;
    CLC                                                        ;81913F|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;819140|657E    |00007E;
    TAX                                                        ;819142|AA      |      ;
    LDA.L aDialogData_SellItems,X                              ;819143|BF94A081|81A094;
    BNE +                                                      ;819147|D003    |81914C;
    JMP.W fUnknown_81917E                                      ;819149|4C7E91  |81917E;
 
 
  + REP #$20                                                   ;81914C|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;81914E|AD8509  |000985;
    STA.W nUnknownX                                            ;819151|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;819154|AD8709  |000987;
    STA.W nUnknownY                                            ;819157|8D8209  |000982;
    LDY.W #$0000                                               ;81915A|A00000  |      ;
    JSL.L fUnknown_8180B7                                      ;81915D|22B78081|8180B7;
    SEP #$20                                                   ;819161|E220    |      ;
    LDA.B #$05                                                 ;819163|A905    |      ;
    STA.W $0976                                                ;819165|8D7609  |000976;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    JMP.W fReturn_819227                                       ;81917B|4C2792  |819227;
 
 
fUnknown_81917E:
    REP #$30                                                   ;81917E|C230    |      ;
    LDA.W #$0006                                               ;819180|A90600  |      ;
    CLC                                                        ;819183|18      |      ;
    ADC.B strcPlayer.direction                                 ;819184|65DA    |0000DA;
    TAY                                                        ;819186|A8      |      ;
    JSL.L fUnknown_8180B7                                      ;819187|22B78081|8180B7;
    SEP #$20                                                   ;81918B|E220    |      ;
    LDA.B #$03                                                 ;81918D|A903    |      ;
    STA.W $0976                                                ;81918F|8D7609  |000976;
    JMP.W fReturn_819227                                       ;819192|4C2792  |819227;
 
 
fItemShipped_Unknown819195:
    REP #$20                                                   ;819195|C220    |      ;
    LDA.W #$0001                                               ;819197|A90100  |      ;
    LDX.W #$0000                                               ;81919A|A20000  |      ;
    LDY.W #$0000                                               ;81919D|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;8191A0|224ED181|81D14E;
    REP #$20                                                   ;8191A4|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;8191A6|AD8509  |000985;
    STA.W nUnknownX                                            ;8191A9|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;8191AC|AD8709  |000987;
    STA.W nUnknownY                                            ;8191AF|8D8209  |000982;
    LDY.W #$0000                                               ;8191B2|A00000  |      ;
    JSL.L fUnknown_8180B7                                      ;8191B5|22B78081|8180B7;
    REP #$30                                                   ;8191B9|C230    |      ;
    %CheckFlag(daily2, $0010)
    BEQ fUnknown_819220                                        ;8191C2|F05C    |819220;
    SEP #$20                                                   ;8191C4|E220    |      ;
    REP #$10                                                   ;8191C6|C210    |      ;
    LDA.B #$00                                                 ;8191C8|A900    |      ;
    XBA                                                        ;8191CA|EB      |      ;
    LDA.W nCarriedItemId                                       ;8191CB|AD8409  |000984;
    REP #$20                                                   ;8191CE|C220    |      ;
    ASL A                                                      ;8191D0|0A      |      ;
    TAX                                                        ;8191D1|AA      |      ;
    INX                                                        ;8191D2|E8      |      ;
    SEP #$20                                                   ;8191D3|E220    |      ;
    LDA.L aDialogData_ShippingProfit,X                         ;8191D5|BFDE9F81|819FDE;
    BNE fItemShipped_AddProfit                                 ;8191D9|D003    |8191DE;
    JMP.W fUnknown_819220                                      ;8191DB|4C2092  |819220;
 
 
fItemShipped_AddProfit:
    LDA.L nCurrentTimeID                                       ;8191DE|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;8191E2|C911    |      ;
    BCS fUnknown_819220                                        ;8191E4|B03A    |819220;
    SEP #$20                                                   ;8191E6|E220    |      ;
    LDA.B #$00                                                 ;8191E8|A900    |      ;
    XBA                                                        ;8191EA|EB      |      ;
    LDA.L aDialogData_ShippingProfit,X                         ;8191EB|BFDE9F81|819FDE;
    REP #$20                                                   ;8191EF|C220    |      ;
    CLC                                                        ;8191F1|18      |      ;
    ADC.L nShippingProfit                                      ;8191F2|6F071F7F|7F1F07;
    STA.L nShippingProfit                                      ;8191F6|8F071F7F|7F1F07;
    SEP #$20                                                   ;8191FA|E220    |      ;
    LDA.L nShippingProfit+2                                    ;8191FC|AF091F7F|7F1F09;
    ADC.B #$00                                                 ;819200|6900    |      ;
    STA.L nShippingProfit+2                                    ;819202|8F091F7F|7F1F09;
    REP #$30                                                   ;819206|C230    |      ;
    %SetFlag(daily3, $0001)
    REP #$20                                                   ;819213|C220    |      ;
    %SetFlag(daily2, $0040)
 
fUnknown_819220:
    SEP #$20                                                   ;819220|E220    |      ;
    LDA.B #$08                                                 ;819222|A908    |      ;
    STA.W $0976                                                ;819224|8D7609  |000976;
 
fReturn_819227:
    RTS                                                        ;819227|60      |      ;
 
 
fUnknown_819228:
    REP #$20                                                   ;819228|C220    |      ;
    LDA.B strcPlayer.posX                                      ;81922A|A5D6    |0000D6;
    STA.W nUnknownX                                            ;81922C|8D8009  |000980;
    LDA.B strcPlayer.posY                                      ;81922F|A5D8    |0000D8;
    INC A                                                      ;819231|1A      |      ;
    INC A                                                      ;819232|1A      |      ;
    STA.W nUnknownY                                            ;819233|8D8209  |000982;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE .notjump                                               ;81923D|D003    |819242;
    JMP.W .jump                                                ;81923F|4C5792  |819257;
 
 
.notjump:
    REP #$30                                                   ;819242|C230    |      ;
    LDY.W #$0001                                               ;819244|A00100  |      ;
    JSL.L fUnknown_8180B7                                      ;819247|22B78081|8180B7;
    SEP #$20                                                   ;81924B|E220    |      ;
    LDA.W $0974                                                ;81924D|AD7409  |000974;
    AND.B #$FB                                                 ;819250|29FB    |      ;
    STA.W $0974                                                ;819252|8D7409  |000974;
    BRA .label2                                                ;819255|8032    |819289;
 
 
.jump:
    SEP #$20                                                   ;819257|E220    |      ;
    REP #$10                                                   ;819259|C210    |      ;
    LDA.W $0974                                                ;81925B|AD7409  |000974;
    AND.B #$04                                                 ;81925E|2904    |      ;
    BNE .label1                                                ;819260|D013    |819275;
    LDY.W #$000B                                               ;819262|A00B00  |      ;
    JSL.L fUnknown_8180B7                                      ;819265|22B78081|8180B7;
    SEP #$20                                                   ;819269|E220    |      ;
    LDA.W $0974                                                ;81926B|AD7409  |000974;
    ORA.B #$04                                                 ;81926E|0904    |      ;
    STA.W $0974                                                ;819270|8D7409  |000974;
    BRA .label2                                                ;819273|8014    |819289;
 
 
.label1:
    REP #$20                                                   ;819275|C220    |      ;
    LDA.W nGameObjectIdx                                       ;819277|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;81927A|85A5    |0000A5;
    JSL.L fObject_GetSingleObjectData                          ;81927C|22CB8185|8581CB;
    REP #$20                                                   ;819280|C220    |      ;
    LDA.B strcObject.exists                                    ;819282|A5A7    |0000A7;
    CMP.W #$FFFF                                               ;819284|C9FFFF  |      ;
    BEQ .notjump                                               ;819287|F0B9    |819242;
 
.label2:
    %CheckPlayerAction(!PACTION_DROPITEM)
    BEQ +                                                      ;819290|F003    |819295;
    JMP.W .justReturn                                          ;819292|4C7893  |819378;
 
 
  + REP #$30                                                   ;819295|C230    |      ;
    LDA.B strcPlayer.posX                                      ;819297|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;819299|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;81929B|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;81929D|85E1    |0000E1;
    STZ.B strcPlayer.newX                                      ;81929F|64E5    |0000E5;
    STZ.B strcPlayer.newY                                      ;8192A1|64E7    |0000E7;
    LDA.W #$0010                                               ;8192A3|A91000  |      ;
    STA.B strcPlayer.unkE3                                     ;8192A6|85E3    |0000E3;
    LDA.B strcPlayer.direction                                 ;8192A8|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;8192AA|2291AD83|83AD91;
    REP #$30                                                   ;8192AE|C230    |      ;
    CMP.W #$0000                                               ;8192B0|C90000  |      ;
    BEQ +                                                      ;8192B3|F003    |8192B8;
    JMP.W .label3                                              ;8192B5|4C6F93  |81936F;
 
 
  + REP #$20                                                   ;8192B8|C220    |      ;
    LDA.W #$0000                                               ;8192BA|A90000  |      ;
    LDX.W #$0007                                               ;8192BD|A20700  |      ;
    LDY.W #$0007                                               ;8192C0|A00700  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;8192C3|224ED181|81D14E;
    REP #$20                                                   ;8192C7|C220    |      ;
    LDA.W #$0002                                               ;8192C9|A90200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8192CC|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8192CF|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;8192D2|2261AC82|82AC61;
    SEP #$20                                                   ;8192D6|E220    |      ;
    AND.B #$1F                                                 ;8192D8|291F    |      ;
    BEQ +                                                      ;8192DA|F003    |8192DF;
    JMP.W .label3                                              ;8192DC|4C6F93  |81936F;
 
 
  + CPX.W #$00FF                                               ;8192DF|E0FF00  |      ;
    BNE +                                                      ;8192E2|D003    |8192E7;
    JMP.W .label3                                              ;8192E4|4C6F93  |81936F;
 
 
  + REP #$20                                                   ;8192E7|C220    |      ;
    LDA.W #$0001                                               ;8192E9|A90100  |      ;
    LDX.W #$000A                                               ;8192EC|A20A00  |      ;
    LDY.W #$000A                                               ;8192EF|A00A00  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;8192F2|224ED181|81D14E;
    REP #$20                                                   ;8192F6|C220    |      ;
    LDA.W #$0002                                               ;8192F8|A90200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8192FB|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8192FE|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;819301|2261AC82|82AC61;
    SEP #$20                                                   ;819305|E220    |      ;
    AND.B #$1F                                                 ;819307|291F    |      ;
    BEQ +                                                      ;819309|F003    |81930E;
    JMP.W .label3                                              ;81930B|4C6F93  |81936F;
 
 
  + CPX.W #$00FF                                               ;81930E|E0FF00  |      ;
    BNE +                                                      ;819311|D003    |819316;
    JMP.W .label3                                              ;819313|4C6F93  |81936F;
 
 
  + REP #$20                                                   ;819316|C220    |      ;
    LDA.W #$0001                                               ;819318|A90100  |      ;
    LDX.W #$0000                                               ;81931B|A20000  |      ;
    LDY.W #$0000                                               ;81931E|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;819321|224ED181|81D14E;
    REP #$20                                                   ;819325|C220    |      ;
    LDA.W #$0002                                               ;819327|A90200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;81932A|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;81932D|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;819330|2261AC82|82AC61;
    SEP #$20                                                   ;819334|E220    |      ;
    AND.B #$1F                                                 ;819336|291F    |      ;
    BEQ +                                                      ;819338|F003    |81933D;
    JMP.W .label3                                              ;81933A|4C6F93  |81936F;
 
 
  + CPX.W #$00FF                                               ;81933D|E0FF00  |      ;
    BNE +                                                      ;819340|D003    |819345;
    JMP.W .label3                                              ;819342|4C6F93  |81936F;
 
 
  + CPX.W #$00E1                                               ;819345|E0E100  |      ;
    BNE +                                                      ;819348|D003    |81934D;
    JMP.W .label3                                              ;81934A|4C6F93  |81936F;
 
 
  + CPX.W #$00C0                                               ;81934D|E0C000  |      ;
    BCC +                                                      ;819350|9007    |819359;
    CPX.W #$00D0                                               ;819352|E0D000  |      ;
    BCS +                                                      ;819355|B002    |819359;
    BRA .label3                                                ;819357|8016    |81936F;
 
 
  + REP #$30                                                   ;819359|C230    |      ;
    LDA.W #$0006                                               ;81935B|A90600  |      ;
    CLC                                                        ;81935E|18      |      ;
    ADC.B strcPlayer.direction                                 ;81935F|65DA    |0000DA;
    TAY                                                        ;819361|A8      |      ;
    JSL.L fUnknown_8180B7                                      ;819362|22B78081|8180B7;
    SEP #$20                                                   ;819366|E220    |      ;
    LDA.B #$03                                                 ;819368|A903    |      ;
    STA.W $0976                                                ;81936A|8D7609  |000976;
    BRA .justReturn                                            ;81936D|8009    |819378;
 
 
.label3:
    %SetPlayerAction(!PACTION_NONE)
    BRA .justReturn                                            ;819376|8000    |819378;
 
 
.justReturn:
    RTS                                                        ;819378|60      |      ;
 
 
fUnknown_819379:
    SEP #$20                                                   ;819379|E220    |      ;
    REP #$10                                                   ;81937B|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;81937D|A522    |000022;
    CMP.B #!AREA_TOWNSPRING                                                 
    BCS +                                                      ;819381|B003    |819386;
    JMP.W fItemShipped_InFarmCoopOrBarn                        ;819383|4C9793  |819397;
 
 
  + CMP.B #!AREA_COWBARN                                                 
    BNE +                                                      ;819388|D003    |81938D;
    JMP.W fItemShipped_InFarmCoopOrBarn                        ;81938A|4C9793  |819397;
 
 
  + CMP.B #!AREA_COOP                                                 
    BNE +                                                      ;81938F|D003    |819394;
    JMP.W fItemShipped_InFarmCoopOrBarn                        ;819391|4C9793  |819397;
 
 
  + JMP.W fUnknown_819497                                      ;819394|4C9794  |819497;
 
 
fItemShipped_InFarmCoopOrBarn:
    REP #$20                                                   ;819397|C220    |      ;
    LDA.W #$0002                                               ;819399|A90200  |      ;
    LDX.W #$0000                                               ;81939C|A20000  |      ;
    LDY.W #$0000                                               ;81939F|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;8193A2|224ED181|81D14E;
    REP #$20                                                   ;8193A6|C220    |      ;
    LDA.W #$0000                                               ;8193A8|A90000  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8193AB|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8193AE|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;8193B1|2261AC82|82AC61;
    CPX.W #$00F2                                               ;8193B5|E0F200  |      ;
    BEQ +                                                      ;8193B8|F003    |8193BD;
    JMP.W fUnknown_819497                                      ;8193BA|4C9794  |819497;
 
 
  + BRA +                                                      ;8193BD|8000    |8193BF;
 
 
  + SEP #$20                                                   ;8193BF|E220    |      ;
    REP #$10                                                   ;8193C1|C210    |      ;
    LDA.B #$00                                                 ;8193C3|A900    |      ;
    XBA                                                        ;8193C5|EB      |      ;
    LDA.W nCarriedItemId                                       ;8193C6|AD8409  |000984;
    REP #$20                                                   ;8193C9|C220    |      ;
    ASL A                                                      ;8193CB|0A      |      ;
    TAX                                                        ;8193CC|AA      |      ;
    INX                                                        ;8193CD|E8      |      ;
    SEP #$20                                                   ;8193CE|E220    |      ;
    LDA.L aDialogData_ShippingProfit,X                         ;8193D0|BFDE9F81|819FDE;
    BNE +                                                      ;8193D4|D003    |8193D9;
    JMP.W fUnknown_819497                                      ;8193D6|4C9794  |819497;
 
 
  + LDA.L nCurrentTimeID                                       ;8193D9|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;8193DD|C911    |      ;
    BCS +                                                      ;8193DF|B02D    |81940E;
    SEP #$20                                                   ;8193E1|E220    |      ;
    LDA.B #$00                                                 ;8193E3|A900    |      ;
    XBA                                                        ;8193E5|EB      |      ;
    LDA.L aDialogData_ShippingProfit,X                         ;8193E6|BFDE9F81|819FDE;
    REP #$20                                                   ;8193EA|C220    |      ;
    CLC                                                        ;8193EC|18      |      ;
    ADC.L nShippingProfit                                      ;8193ED|6F071F7F|7F1F07;
    STA.L nShippingProfit                                      ;8193F1|8F071F7F|7F1F07;
    SEP #$20                                                   ;8193F5|E220    |      ;
    LDA.L nShippingProfit+2                                    ;8193F7|AF091F7F|7F1F09;
    ADC.B #$00                                                 ;8193FB|6900    |      ;
    STA.L nShippingProfit+2                                    ;8193FD|8F091F7F|7F1F09;
    REP #$30                                                   ;819401|C230    |      ;
    %SetFlag(daily3, $0001)
 
  + REP #$20                                                   ;81940E|C220    |      ;
    LDA.W nGameObjectIdx                                       ;819410|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;819413|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;819415|22A28185|8581A2;
    SEP #$20                                                   ;819419|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;81941B|A522    |000022;
    CMP.B #$27                                                 ;81941D|C927    |      ;
    BNE +                                                      ;81941F|D003    |819424;
    JMP.W fUnknown_81944F                                      ;819421|4C4F94  |81944F;
 
 
  + CMP.B #$28                                                 ;819424|C928    |      ;
    BNE +                                                      ;819426|D003    |81942B;
    JMP.W fUnknown_819473                                      ;819428|4C7394  |819473;
 
 
  + REP #$20                                                   ;81942B|C220    |      ;
    LDA.W #$0024                                               ;81942D|A92400  |      ;
    JSL.L fUnknownCF_SetPointer                                ;819430|22E1A581|81A5E1;
    SEP #$20                                                   ;819434|E220    |      ;
    LDA.B #$07                                                 ;819436|A907    |      ;
    STA.W $0976                                                ;819438|8D7609  |000976;
    %UnsetPlayerFlag(!PFLAGS_ACTIVE)
    SEP #$20                                                   ;819447|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;819449|9C1D09  |00091D;
    JMP.W fReturn_8196AE                                       ;81944C|4CAE96  |8196AE;
 
 
fUnknown_81944F:
    REP #$20                                                   ;81944F|C220    |      ;
    LDA.W #$0025                                               ;819451|A92500  |      ;
    JSL.L fUnknownCF_SetPointer                                ;819454|22E1A581|81A5E1;
    SEP #$20                                                   ;819458|E220    |      ;
    LDA.B #$07                                                 ;81945A|A907    |      ;
    STA.W $0976                                                ;81945C|8D7609  |000976;
    %UnsetPlayerFlag(!PFLAGS_ACTIVE)
    SEP #$20                                                   ;81946B|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;81946D|9C1D09  |00091D;
    JMP.W fReturn_8196AE                                       ;819470|4CAE96  |8196AE;
 
 
fUnknown_819473:
    REP #$20                                                   ;819473|C220    |      ;
    LDA.W #$0026                                               ;819475|A92600  |      ;
    JSL.L fUnknownCF_SetPointer                                ;819478|22E1A581|81A5E1;
    SEP #$20                                                   ;81947C|E220    |      ;
    LDA.B #$07                                                 ;81947E|A907    |      ;
    STA.W $0976                                                ;819480|8D7609  |000976;
    %UnsetPlayerFlag(!PFLAGS_ACTIVE)
    SEP #$20                                                   ;81948F|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;819491|9C1D09  |00091D;
    JMP.W fReturn_8196AE                                       ;819494|4CAE96  |8196AE;
 
 
fUnknown_819497:
    SEP #$20                                                   ;819497|E220    |      ;
    REP #$10                                                   ;819499|C210    |      ;
    LDA.W strcPlayerData.carryItemId                           ;81949B|AD1D09  |00091D;
    CMP.B #!EITEM_GOLDAXE                                                 
    BEQ +                                                      ;8194A0|F003    |8194A5;
    JMP.W fUnknown_81953F                                      ;8194A2|4C3F95  |81953F;
 
 
  + LDA.B strcMap.loadAreaId                                   ;8194A5|A522    |000022;
    CMP.B #!AREA_COOP                                                 
    BEQ +                                                      ;8194A9|F003    |8194AE;
    JMP.W fUnknown_81953F                                      ;8194AB|4C3F95  |81953F;
 
 
  + REP #$20                                                   ;8194AE|C220    |      ;
    LDA.W #$0001                                               ;8194B0|A90100  |      ;
    LDX.W #$0000                                               ;8194B3|A20000  |      ;
    LDY.W #$0000                                               ;8194B6|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;8194B9|224ED181|81D14E;
    REP #$20                                                   ;8194BD|C220    |      ;
    LDA.W #$0000                                               ;8194BF|A90000  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8194C2|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8194C5|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;8194C8|2261AC82|82AC61;
    CPX.W #$00F7                                               ;8194CC|E0F700  |      ;
    BEQ +                                                      ;8194CF|F003    |8194D4;
    JMP.W fUnknown_81953F                                      ;8194D1|4C3F95  |81953F;
 
 
  + REP #$30                                                   ;8194D4|C230    |      ;
    %CheckFlag(event6, $2000)
    BEQ +                                                      ;8194DD|F003    |8194E2;
    JMP.W fUnknown_81953F                                      ;8194DF|4C3F95  |81953F;
 
 
  + REP #$30                                                   ;8194E2|C230    |      ;
    LDA.W #$0014                                               ;8194E4|A91400  |      ;
    LDX.W #$0000                                               ;8194E7|A20000  |      ;
    LDY.W #$0000                                               ;8194EA|A00000  |      ;
    JSL.L fAI_Unknown8480F8                                    ;8194ED|22F88084|8480F8;
    SEP #$20                                                   ;8194F1|E220    |      ;
    REP #$10                                                   ;8194F3|C210    |      ;
    LDY.W #$0000                                               ;8194F5|A00000  |      ;
    LDA.B #$03                                                 ;8194F8|A903    |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;8194FA|97CC    |0000CC;
    REP #$20                                                   ;8194FC|C220    |      ;
    LDA.W #$0000                                               ;8194FE|A90000  |      ;
    JSL.L fGameEngine_AddChicken                               ;819501|2207C883|83C807;
    REP #$30                                                   ;819505|C230    |      ;
    %SetFlag(event6, $2000)
    LDA.W #$00A1                                               ;819512|A9A100  |      ;
    LDX.W #$00E0                                               ;819515|A2E000  |      ;
    LDY.W #$00B0                                               ;819518|A0B000  |      ;
    JSL.L fMap_UpdateCurrentTilemap                            ;81951B|223AB082|82B03A;
    REP #$30                                                   ;81951F|C230    |      ;
    LDA.W nGameObjectIdx                                       ;819521|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;819524|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;819526|22A28185|8581A2;
    JSL.L fUnknown_81A4F1                                      ;81952A|22F1A481|81A4F1;
    SEP #$20                                                   ;81952E|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;819530|9C1D09  |00091D;
    REP #$30                                                   ;819533|C230    |      ;
    LDA.W #$0005                                               ;819535|A90500  |      ;
    JSL.L fGameEngine_AddHappiness                             ;819538|2282B283|83B282;
    JMP.W fReturn_8196AE                                       ;81953C|4CAE96  |8196AE;
 
 
fUnknown_81953F:
    SEP #$20                                                   ;81953F|E220    |      ;
    REP #$10                                                   ;819541|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;819543|A522    |000022;
    CMP.B #!AREA_TOWNSPRING                                                 
    BCC fUnknown_819590                                        ;819547|9047    |819590;
    CMP.B #$10                                                 ;819549|C910    |      ;
    BCS +                                                      ;81954B|B003    |819550;
    JMP.W fUnknown_81965B                                      ;81954D|4C5B96  |81965B;
 
 
  + CMP.B #$15                                                 ;819550|C915    |      ;
    BCC +                                                      ;819552|9003    |819557;
    JMP.W fUnknown_81965B                                      ;819554|4C5B96  |81965B;
 
 
  + REP #$20                                                   ;819557|C220    |      ;
    LDA.W #$0001                                               ;819559|A90100  |      ;
    LDX.W #$0006                                               ;81955C|A20600  |      ;
    LDY.W #$0006                                               ;81955F|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;819562|224ED181|81D14E;
    REP #$30                                                   ;819566|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;819568|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;81956B|AC8709  |000987;
    LDA.W #$0002                                               ;81956E|A90200  |      ;
    JSL.L fUnknown_82AC61                                      ;819571|2261AC82|82AC61;
    REP #$30                                                   ;819575|C230    |      ;
    LDA.W #$0006                                               ;819577|A90600  |      ;
    CPX.W #$00F0                                               ;81957A|E0F000  |      ;
    BNE +                                                      ;81957D|D003    |819582;
    JMP.W fEvent_FreedImpFish                                  ;81957F|4CF495  |8195F4;
 
 
  + LDA.W #$0007                                               ;819582|A90700  |      ;
    CPX.W #$00F4                                               ;819585|E0F400  |      ;
    BNE +                                                      ;819588|D003    |81958D;
    JMP.W fUnknown_819631                                      ;81958A|4C3196  |819631;
 
 
  + JMP.W fUnknown_81965B                                      ;81958D|4C5B96  |81965B;
 
 
fUnknown_819590:
    REP #$20                                                   ;819590|C220    |      ;
    LDA.W #$0001                                               ;819592|A90100  |      ;
    LDX.W #$0006                                               ;819595|A20600  |      ;
    LDY.W #$0006                                               ;819598|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;81959B|224ED181|81D14E;
    REP #$30                                                   ;81959F|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8195A1|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8195A4|AC8709  |000987;
    LDA.W #$0002                                               ;8195A7|A90200  |      ;
    JSL.L fUnknown_82AC61                                      ;8195AA|2261AC82|82AC61;
    REP #$30                                                   ;8195AE|C230    |      ;
    LDA.W #$0000                                               ;8195B0|A90000  |      ;
    CPX.W #$00F0                                               ;8195B3|E0F000  |      ;
    BNE +                                                      ;8195B6|D003    |8195BB;
    JMP.W fUnknown_819631                                      ;8195B8|4C3196  |819631;
 
 
  + LDA.W #$0001                                               ;8195BB|A90100  |      ;
    CPX.W #$00F9                                               ;8195BE|E0F900  |      ;
    BNE +                                                      ;8195C1|D003    |8195C6;
    JMP.W fUnknown_819631                                      ;8195C3|4C3196  |819631;
 
 
  + LDA.W #$0002                                               ;8195C6|A90200  |      ;
    CPX.W #$00FA                                               ;8195C9|E0FA00  |      ;
    BNE +                                                      ;8195CC|D003    |8195D1;
    JMP.W fUnknown_819631                                      ;8195CE|4C3196  |819631;
 
 
  + LDA.W #$0003                                               ;8195D1|A90300  |      ;
    CPX.W #$00FB                                               ;8195D4|E0FB00  |      ;
    BNE +                                                      ;8195D7|D003    |8195DC;
    JMP.W fUnknown_819631                                      ;8195D9|4C3196  |819631;
 
 
  + LDA.W #$0004                                               ;8195DC|A90400  |      ;
    CPX.W #$00FC                                               ;8195DF|E0FC00  |      ;
    BNE +                                                      ;8195E2|D003    |8195E7;
    JMP.W fUnknown_819631                                      ;8195E4|4C3196  |819631;
 
 
  + LDA.W #$0005                                               ;8195E7|A90500  |      ;
    CPX.W #$00FD                                               ;8195EA|E0FD00  |      ;
    BNE +                                                      ;8195ED|D003    |8195F2;
    JMP.W fUnknown_819631                                      ;8195EF|4C3196  |819631;
 
 
  + BRA fUnknown_81965B                                        ;8195F2|8067    |81965B;
 
 
fEvent_FreedImpFish:
    SEP #$20                                                   ;8195F4|E220    |      ;
    LDA.W strcPlayerData.carryItemId                           ;8195F6|AD1D09  |00091D;
    CMP.B #!CITEM_FISH                                                 
    BNE +                                                      ;8195FB|D02F    |81962C;
    LDA.L nCurrentTimeID                                       ;8195FD|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;819601|C911    |      ;
    BCS +                                                      ;819603|B027    |81962C;
    REP #$30                                                   ;819605|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_FREEDIMPFISH)
    BNE +                                                      ;81960E|D01C    |81962C;
    REP #$30                                                   ;819610|C230    |      ;
    %AIExecute($0000, $0010, $0000)
    REP #$30                                                   ;81961F|C230    |      ;
    %SetFlag(event2, !EFLAGS2_FREEDIMPFISH)
 
  + REP #$30                                                   ;81962C|C230    |      ;
    LDA.W #$0006                                               ;81962E|A90600  |      ;
 
fUnknown_819631:
    REP #$20                                                   ;819631|C220    |      ;
    ASL A                                                      ;819633|0A      |      ;
    ASL A                                                      ;819634|0A      |      ;
    TAX                                                        ;819635|AA      |      ;
    LDA.L nUnknownXYTable,X                                    ;819636|BF63A381|81A363;
    STA.W nUnknownX                                            ;81963A|8D8009  |000980;
    INX                                                        ;81963D|E8      |      ;
    INX                                                        ;81963E|E8      |      ;
    LDA.L nUnknownXYTable,X                                    ;81963F|BF63A381|81A363;
    STA.W nUnknownY                                            ;819643|8D8209  |000982;
    LDA.W #$00CA                                               ;819646|A9CA00  |      ;
    STA.W $097A                                                ;819649|8D7A09  |00097A;
    SEP #$20                                                   ;81964C|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;81964E|9C1D09  |00091D;
    SEP #$20                                                   ;819651|E220    |      ;
    LDA.B #$04                                                 ;819653|A904    |      ;
    STA.W $0976                                                ;819655|8D7609  |000976;
    JMP.W fReturn_8196AE                                       ;819658|4CAE96  |8196AE;
 
 
fUnknown_81965B:
    SEP #$20                                                   ;81965B|E220    |      ;
    REP #$10                                                   ;81965D|C210    |      ;
    STZ.W strcPlayerData.carryItemId                           ;81965F|9C1D09  |00091D;
    REP #$20                                                   ;819662|C220    |      ;
    LDY.W #$000A                                               ;819664|A00A00  |      ;
    JSL.L fUnknown_8180B7                                      ;819667|22B78081|8180B7;
    REP #$20                                                   ;81966B|C220    |      ;
    LDA.W #$0002                                               ;81966D|A90200  |      ;
    LDX.W #$0000                                               ;819670|A20000  |      ;
    LDY.W #$0000                                               ;819673|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;819676|224ED181|81D14E;
    LDA.W nTileInFrontOfPlayerX                                ;81967A|AD8509  |000985;
    STA.W nUnknownX                                            ;81967D|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;819680|AD8709  |000987;
    STA.W nUnknownY                                            ;819683|8D8209  |000982;
    SEP #$20                                                   ;819686|E220    |      ;
    LDA.B #$04                                                 ;819688|A904    |      ;
    STA.W $0976                                                ;81968A|8D7609  |000976;
    BRA fReturn_8196AE                                         ;81968D|801F    |8196AE;
 
 
fUnknown_81968F:
    JSL.L fUnknown_81A4F1                                      ;81968F|22F1A481|81A4F1;
    BRA fReturn_8196AE                                         ;819693|8019    |8196AE;
 
 
fUnknown_819695:
    REP #$30                                                   ;819695|C230    |      ;
    LDA.B ptrUnknown0xCF                                       ;819697|A5CF    |0000CF;
    BNE fReturn_8196AE                                         ;819699|D013    |8196AE;
    SEP #$20                                                   ;81969B|E220    |      ;
    LDA.B ptrUnknown0xCF+2                                     ;81969D|A5D1    |0000D1;
    BNE fReturn_8196AE                                         ;81969F|D00D    |8196AE;
    JSL.L fUnknown_81A4F1                                      ;8196A1|22F1A481|81A4F1;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
 
fReturn_8196AE:
    RTS                                                        ;8196AE|60      |      ;
 
pItemCarriedTable_8196AF:
    dl EMPTY_FFFFFF                                            ;8196AF|        |FFFFFF; 0x5B * [ptr24]
    dl DATA24_819876                                           ;8196B2|        |819876;
    dl DATA24_81989A                                           ;8196B5|        |81989A;
    dl DATA24_8198BE                                           ;8196B8|        |8198BE;
    dl DATA24_8198E2                                           ;8196BB|        |8198E2;
    dl DATA24_819906                                           ;8196BE|        |819906;
    dl DATA24_81992A                                           ;8196C1|        |81992A;
    dl DATA24_81994E                                           ;8196C4|        |81994E;
    dl DATA24_819972                                           ;8196C7|        |819972;
    dl DATA24_819996                                           ;8196CA|        |819996;
    dl DATA24_8199BA                                           ;8196CD|        |8199BA;
    dl DATA24_819996                                           ;8196D0|        |819996;
    dl DATA24_819996                                           ;8196D3|        |819996;
    dl DATA24_8199DE                                           ;8196D6|        |8199DE;
    dl DATA24_819A02                                           ;8196D9|        |819A02;
    dl DATA24_819A26                                           ;8196DC|        |819A26;
    dl DATA24_819A4A                                           ;8196DF|        |819A4A;
    dl DATA24_819A6E                                           ;8196E2|        |819A6E;
    dl DATA24_819A92                                           ;8196E5|        |819A92;
    dl DATA24_819AB6                                           ;8196E8|        |819AB6;
    dl DATA24_819ADA                                           ;8196EB|        |819ADA;
    dl DATA24_819AFE                                           ;8196EE|        |819AFE;
    dl DATA24_819B22                                           ;8196F1|        |819B22;
    dl DATA24_819B46                                           ;8196F4|        |819B46;
    dl DATA24_819B6A                                           ;8196F7|        |819B6A;
    dl DATA24_819FA2                                           ;8196FA|        |819FA2;
    dl DATA24_819B8E                                           ;8196FD|        |819B8E;
    dl DATA24_819BB2                                           ;819700|        |819BB2;
    dl DATA24_819BD6                                           ;819703|        |819BD6;
    dl DATA24_819BFA                                           ;819706|        |819BFA;
    dl DATA24_819C1E                                           ;819709|        |819C1E;
    dl DATA24_819C42                                           ;81970C|        |819C42;
    dl DATA24_819C66                                           ;81970F|        |819C66;
    dl DATA24_819C8A                                           ;819712|        |819C8A;
    dl DATA24_819CAE                                           ;819715|        |819CAE;
    dl DATA24_819CD2                                           ;819718|        |819CD2;
    dl DATA24_819CF6                                           ;81971B|        |819CF6;
    dl DATA24_819D1A                                           ;81971E|        |819D1A;
    dl DATA24_819D3E                                           ;819721|        |819D3E;
    dl DATA24_819D62                                           ;819724|        |819D62;
    dl DATA24_819D86                                           ;819727|        |819D86;
    dl DATA24_819DAA                                           ;81972A|        |819DAA;
    dl DATA24_819DCE                                           ;81972D|        |819DCE;
    dl DATA24_819DE0                                           ;819730|        |819DE0;
    dl DATA24_819DF2                                           ;819733|        |819DF2;
    dl DATA24_819E04                                           ;819736|        |819E04;
    dl DATA24_819E16                                           ;819739|        |819E16;
    dl DATA24_819E28                                           ;81973C|        |819E28;
    dl DATA24_819E3A                                           ;81973F|        |819E3A;
    dl DATA24_819E4C                                           ;819742|        |819E4C;
    dl DATA24_819E5E                                           ;819745|        |819E5E;
    dl DATA24_819E70                                           ;819748|        |819E70;
    dl DATA24_819E82                                           ;81974B|        |819E82;
    dl DATA24_819E94                                           ;81974E|        |819E94;
    dl DATA24_819EA6                                           ;819751|        |819EA6;
    dl DATA24_819EB8                                           ;819754|        |819EB8;
    dl DATA24_819ECA                                           ;819757|        |819ECA;
    dl DATA24_819EDC                                           ;81975A|        |819EDC;
    dl DATA24_819EEE                                           ;81975D|        |819EEE;
    dl DATA24_819F00                                           ;819760|        |819F00;
    dl DATA24_819F12                                           ;819763|        |819F12;
    dl DATA24_819F24                                           ;819766|        |819F24;
    dl DATA24_819F36                                           ;819769|        |819F36;
    dl DATA24_819F48                                           ;81976C|        |819F48;
    dl DATA24_819F5A                                           ;81976F|        |819F5A;
    dl DATA24_819F6C                                           ;819772|        |819F6C;
    dl DATA24_819F7E                                           ;819775|        |819F7E;
    dl DATA24_819F90                                           ;819778|        |819F90;
    dl DATA24_819E94                                           ;81977B|        |819E94;
    dl DATA24_819E16                                           ;81977E|        |819E16;
    dl DATA24_819E28                                           ;819781|        |819E28;
    dl DATA24_819E3A                                           ;819784|        |819E3A;
    dl DATA24_819E4C                                           ;819787|        |819E4C;
    dl DATA24_819FA2                                           ;81978A|        |819FA2;
    dl DATA24_819EA6                                           ;81978D|        |819EA6;
    dl DATA24_819EB8                                           ;819790|        |819EB8;
    dl DATA24_819ECA                                           ;819793|        |819ECA;
    dl DATA24_819EEE                                           ;819796|        |819EEE;
    dl DATA24_819F00                                           ;819799|        |819F00;
    dl DATA24_819F12                                           ;81979C|        |819F12;
    dl DATA24_819F24                                           ;81979F|        |819F24;
    dl DATA24_819F36                                           ;8197A2|        |819F36;
    dl DATA24_819E5E                                           ;8197A5|        |819E5E;
    dl DATA24_819E70                                           ;8197A8|        |819E70;
    dl DATA24_819F7E                                           ;8197AB|        |819F7E;
    dl DATA24_819F90                                           ;8197AE|        |819F90;
    dl DATA24_81992A                                           ;8197B1|        |81992A;
    dl DATA24_819A26                                           ;8197B4|        |819A26;
    dl DATA24_819BB2                                           ;8197B7|        |819BB2;
    dl DATA24_819BD6                                           ;8197BA|        |819BD6;
    dl DATA24_819BFA                                           ;8197BD|        |819BFA;
 
pItemCarriedSubrutines:
    dw $FFFF                                                   ;8197C0|        |      ; 0x5B * [ptr16]
    dw subItemCarried_Mushroom                                 ;8197C2|        |8180FE; 01
    dw subItemCarried_PoisonMushroom                           ;8197C4|        |818102; 02
    dw subItemCarried_WildGrape                                ;8197C6|        |818106; 03
    dw subItemCarried_BerryStrongSmell                         ;8197C8|        |81810A; 04
    dw subItemCarried_MoonFlower                               ;8197CA|        |81810E; 05
    dw subItemCarried_Cake                                     ;8197CC|        |818112; 06
    dw subItemCarried_Fish                                     ;8197CE|        |818116; 07
    dw subItemCarried_PowerBerry                               ;8197D0|        |81811A; 08
    dw subItemCarried_Bush                                     ;8197D2|        |81811E; 09
    dw subItemCarried_Bush2                                    ;8197D4|        |818122; 0A
    dw subItemCarried_Bush                                     ;8197D6|        |81811E; 0B
    dw subItemCarried_Bush                                     ;8197D8|        |81811E; 0C
    dw subItemCarried_0x0D                                     ;8197DA|        |818126; 0D
    dw subItemCarried_0x0E                                     ;8197DC|        |81812A; 0E
    dw subItemCarried_0x57                                     ;8197DE|        |81812E; 0F
    dw subItemCarried_Corn                                     ;8197E0|        |818132; 10
    dw subItemCarried_Tomato                                   ;8197E2|        |81814A; 11
    dw subItemCarried_Potato                                   ;8197E4|        |818162; 12
    dw subItemCarried_Turnip                                   ;8197E6|        |81817A; 13
    dw subItemCarried_Egg                                      ;8197E8|        |818192; 14
    dw subItemCarried_SmallMilk                                ;8197EA|        |818196; 15
    dw subItemCarried_MediumMilk                               ;8197EC|        |81819A; 16
    dw subItemCarried_LargeMilk                                ;8197EE|        |81819E; 17
    dw subItemCarried_Herb                                     ;8197F0|        |8181A2; 18
    dw subItemCarried_Flower                                   ;8197F2|        |8181A6; 19
    dw subItemCarried_Feed                                     ;8197F4|        |8181AA; 1A
    dw subItemCarried_GreenPerfume                             ;8197F6|        |8181AE; 1B
    dw subItemCarried_RedPerfume                               ;8197F8|        |8181C8; 1C
    dw subItemCarried_BluePerfume                              ;8197FA|        |8181E2; 1D
    dw subItemCarried_RedEgg                                   ;8197FC|        |8181FC; 1E
    dw subItemCarried_LightPurpleEgg                           ;8197FE|        |81823E; 1F
    dw subItemCarried_BlueEgg                                  ;819800|        |818280; 20
    dw subItemCarried_PurpleEgg                                ;819802|        |8182C2; 21
    dw subItemCarried_GreenEgg                                 ;819804|        |8182FE; 22
    dw subItemCarried_YellowEgg                                ;819806|        |8183B6; 23
    dw subItemCarried_ChickenWindMeasured                      ;819808|        |8183B7; 24
    dw subItemCarried_Chicken                                  ;81980A|        |8183BB; 25
    dw subItemCarried_Chick                                    ;81980C|        |8183BF; 26
    dw subItemCarried_0x27                                     ;81980E|        |8183C3; 27
    dw subItemCarried_0x28                                     ;819810|        |8183C4; 28
    dw subItemCarried_Mole                                     ;819812|        |8183C5; 29
    dw subItemCarried_0x2A                                     ;819814|        |8183C9; 2A
    dw subItemCarried_0x2B                                     ;819816|        |8183D1; 2B
    dw subItemCarried_0x2C                                     ;819818|        |8183D9; 2C
    dw subItemCarried_0x2D                                     ;81981A|        |8183E1; 2D
    dw subItemCarried_0x2E                                     ;81981C|        |8183E9; 2E
    dw subItemCarried_0x2F                                     ;81981E|        |8183F1; 2F
    dw subItemCarried_0x30                                     ;819820|        |8183F9; 30
    dw subItemCarried_0x31                                     ;819822|        |818401; 31
    dw subItemCarried_0x32                                     ;819824|        |818409; 32
    dw subItemCarried_0x33                                     ;819826|        |818411; 33
    dw subItemCarried_0x34                                     ;819828|        |818419; 34
    dw subItemCarried_0x35                                     ;81982A|        |818421; 35
    dw subItemCarried_0x36                                     ;81982C|        |818429; 36
    dw subItemCarried_0x37                                     ;81982E|        |818431; 37
    dw subItemCarried_0x38                                     ;819830|        |818439; 38
    dw subItemCarried_0x39                                     ;819832|        |818441; 39
    dw subItemCarried_0x3A                                     ;819834|        |818449; 3A
    dw subItemCarried_0x3B                                     ;819836|        |818451; 3B
    dw subItemCarried_0x3C                                     ;819838|        |818459; 3C
    dw subItemCarried_0x3D                                     ;81983A|        |818461; 3D
    dw subItemCarried_0x3E                                     ;81983C|        |818469; 3E
    dw subItemCarried_0x3F                                     ;81983E|        |818471; 3F
    dw subItemCarried_0x40                                     ;819840|        |818479; 40
    dw subItemCarried_0x41                                     ;819842|        |818481; 41
    dw subItemCarried_0x42                                     ;819844|        |818489; 42
    dw subItemCarried_0x43                                     ;819846|        |818491; 43
    dw subItemCarried_0x44                                     ;819848|        |818499; 44
    dw subItemCarried_0x45                                     ;81984A|        |8184D5; 45
    dw subItemCarried_0x46                                     ;81984C|        |818511; 46
    dw subItemCarried_0x47                                     ;81984E|        |81854D; 47
    dw subItemCarried_0x48                                     ;819850|        |818589; 48
    dw subItemCarried_0x49                                     ;819852|        |8185C5; 49
    dw subItemCarried_0x4A                                     ;819854|        |8185DF; 4A
    dw subItemCarried_0x4B                                     ;819856|        |8185F6; 4B
    dw subItemCarried_0x4C                                     ;819858|        |81860D; 4C
    dw subItemCarried_0x4D                                     ;81985A|        |818624; 4D
    dw subItemCarried_0x4E                                     ;81985C|        |81865B; 4E
    dw subItemCarried_0x4F                                     ;81985E|        |818692; 4F
    dw subItemCarried_0x50                                     ;819860|        |8186C9; 50
    dw subItemCarried_0x51                                     ;819862|        |818700; 51
    dw subItemCarried_0x52                                     ;819864|        |818737; 52
    dw subItemCarried_0x53                                     ;819866|        |81874E; 53
    dw subItemCarried_0x54                                     ;819868|        |818765; 54
    dw subItemCarried_0x55                                     ;81986A|        |818781; 55
    dw subItemCarried_0x56                                     ;81986C|        |81879D; 56
    dw subItemCarried_0x57                                     ;81986E|        |81812E; 57
    dw subItemCarried_0x58                                     ;819870|        |8187B7; 58
    dw subItemCarried_0x59                                     ;819872|        |8187BB; 59
    dw subItemCarried_0x5A                                     ;819874|        |8187BF; 5A
 
DATA24_819876:
    dl $0000F6                                                 ;819876|        |      ;
    db $A2,$03,$00,$9C,$03,$00,$9D,$03,$00,$9E,$03,$01         ;819879|        |      ;
    db $9E,$03,$00,$9F,$03,$00,$A0,$03,$00,$A1,$03,$01         ;819885|        |      ;
    db $A1,$03,$00,$06,$01,$00,$A3,$03,$00                     ;819891|        |      ;
 
DATA24_81989A:
    dl $0000F7                                                 ;81989A|        |      ;
    db $AA,$03,$00,$A4,$03,$00,$A5,$03,$00,$A6,$03,$01         ;81989D|        |      ;
    db $A6,$03,$00,$A7,$03,$00,$A8,$03,$00,$A9,$03,$01         ;8198A9|        |      ;
    db $A9,$03,$00,$07,$01,$00,$AB,$03,$00                     ;8198B5|        |      ;
 
DATA24_8198BE:
    dl $0000F4                                                 ;8198BE|        |      ;
    db $92,$03,$00,$8C,$03,$00,$8D,$03,$00,$8E,$03,$01         ;8198C1|        |      ;
    db $8E,$03,$00,$8F,$03,$00,$90,$03,$00,$91,$03,$01         ;8198CD|        |      ;
    db $91,$03,$00,$04,$01,$00,$93,$03,$00                     ;8198D9|        |      ;
 
DATA24_8198E2:
    dl $0000F5                                                 ;8198E2|        |      ;
    db $9A,$03,$00,$94,$03,$00,$95,$03,$00,$96,$03,$01         ;8198E5|        |      ;
    db $96,$03,$00,$97,$03,$00,$98,$03,$00,$99,$03,$01         ;8198F1|        |      ;
    db $99,$03,$00,$05,$01,$00,$9B,$03,$00                     ;8198FD|        |      ;
 
DATA24_819906:
    dl $0000F8                                                 ;819906|        |      ;
    db $B2,$03,$00,$AC,$03,$00,$AD,$03,$00,$AE,$03,$01         ;819909|        |      ;
    db $AE,$03,$00,$AF,$03,$00,$B0,$03,$00,$B1,$03,$01         ;819915|        |      ;
    db $B1,$03,$00,$08,$01,$00,$B3,$03,$00                     ;819921|        |      ;
 
DATA24_81992A:
    dl $0000F9                                                 ;81992A|        |      ;
    db $BA,$03,$00,$B4,$03,$00,$B5,$03,$00,$B6,$03,$01         ;81992D|        |      ;
    db $B6,$03,$00,$B7,$03,$00,$B8,$03,$00,$B9,$03,$01         ;819939|        |      ;
    db $B9,$03,$00,$09,$01,$00,$BB,$03,$00                     ;819945|        |      ;
 
DATA24_81994E:
    dl $0000BB                                                 ;81994E|        |      ;
    db $2C,$04,$00,$26,$04,$00,$27,$04,$00,$28,$04,$01         ;819951|        |      ;
    db $28,$04,$00,$29,$04,$00,$2A,$04,$00,$2B,$04,$01         ;81995D|        |      ;
    db $2B,$04,$00,$BA,$00,$00,$2D,$04,$00                     ;819969|        |      ;
 
DATA24_819972:
    dl $000000                                                 ;819972|        |      ;
    db $0C,$04,$00,$09,$04,$00,$0A,$04,$00,$0B,$04,$01         ;819975|        |      ;
    db $0B,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01         ;819981|        |      ;
    db $00,$00,$00,$0D,$04,$00,$00,$00,$00                     ;81998D|        |      ;
 
DATA24_819996:
    dl $0000E8                                                 ;819996|        |      ;
    db $29,$01,$00,$23,$01,$00,$24,$01,$00,$25,$01,$01         ;819999|        |      ;
    db $25,$01,$00,$26,$01,$00,$27,$01,$00,$28,$01,$01         ;8199A5|        |      ;
    db $28,$01,$00,$B7,$00,$00,$2A,$01,$00                     ;8199B1|        |      ;
 
DATA24_8199BA:
    dl $0000E9                                                 ;8199BA|        |      ;
    db $31,$01,$00,$2B,$01,$00,$2C,$01,$00,$2D,$01,$01         ;8199BD|        |      ;
    db $2D,$01,$00,$2E,$01,$00,$2F,$01,$00,$30,$01,$01         ;8199C9|        |      ;
    db $30,$01,$00,$B7,$00,$00,$32,$01,$00                     ;8199D5|        |      ;
 
DATA24_8199DE:
    dl $0000EA                                                 ;8199DE|        |      ;
    db $21,$01,$00,$1B,$01,$00,$1C,$01,$00,$1D,$01,$01         ;8199E1|        |      ;
    db $1D,$01,$00,$1E,$01,$00,$1F,$01,$00,$20,$01,$01         ;8199ED|        |      ;
    db $20,$01,$00,$C8,$00,$00,$22,$01,$00                     ;8199F9|        |      ;
 
DATA24_819A02:
    dl $0000EB                                                 ;819A02|        |      ;
    db $39,$01,$00,$33,$01,$00,$34,$01,$00,$35,$01,$01         ;819A05|        |      ;
    db $35,$01,$00,$36,$01,$00,$37,$01,$00,$38,$01,$01         ;819A11|        |      ;
    db $38,$01,$00,$C8,$00,$00,$3A,$01,$00                     ;819A1D|        |      ;
 
DATA24_819A26:
    dl $0000E7                                                 ;819A26|        |      ;
    db $41,$01,$00,$3B,$01,$00,$3C,$01,$00,$3D,$01,$01         ;819A29|        |      ;
    db $3D,$01,$00,$3E,$01,$00,$3F,$01,$00,$40,$01,$01         ;819A35|        |      ;
    db $40,$01,$00,$00,$00,$00,$42,$01,$00                     ;819A41|        |      ;
 
DATA24_819A4A:
    dl $0000EC                                                 ;819A4A|        |      ;
    db $58,$03,$00,$52,$03,$00,$53,$03,$00,$54,$03,$01         ;819A4D|        |      ;
    db $54,$03,$00,$55,$03,$00,$56,$03,$00,$57,$03,$01         ;819A59|        |      ;
    db $57,$03,$00,$FC,$00,$00,$59,$03,$00                     ;819A65|        |      ;
 
DATA24_819A6E:
    dl $0000ED                                                 ;819A6E|        |      ;
    db $60,$03,$00,$5A,$03,$00,$5B,$03,$00,$5C,$03,$01         ;819A71|        |      ;
    db $5C,$03,$00,$5D,$03,$00,$5E,$03,$00,$5F,$03,$01         ;819A7D|        |      ;
    db $5F,$03,$00,$FD,$00,$00,$61,$03,$00                     ;819A89|        |      ;
 
DATA24_819A92:
    dl $0000EF                                                 ;819A92|        |      ;
    db $70,$03,$00,$6A,$03,$00,$6B,$03,$00,$6C,$03,$01         ;819A95|        |      ;
    db $6C,$03,$00,$6D,$03,$00,$6E,$03,$00,$6F,$03,$01         ;819AA1|        |      ;
    db $6F,$03,$00,$FF,$00,$00,$71,$03,$00                     ;819AAD|        |      ;
 
DATA24_819AB6:
    dl $0000EE                                                 ;819AB6|        |      ;
    db $68,$03,$00,$62,$03,$00,$63,$03,$00,$64,$03,$01         ;819AB9|        |      ;
    db $64,$03,$00,$65,$03,$00,$66,$03,$00,$67,$03,$01         ;819AC5|        |      ;
    db $67,$03,$00,$FE,$00,$00,$69,$03,$00                     ;819AD1|        |      ;
 
DATA24_819ADA:
    dl $0000F3                                                 ;819ADA|        |      ;
    db $8A,$03,$00,$84,$03,$00,$85,$03,$00,$86,$03,$01         ;819ADD|        |      ;
    db $86,$03,$00,$87,$03,$00,$88,$03,$00,$89,$03,$01         ;819AE9|        |      ;
    db $89,$03,$00,$03,$01,$00,$8B,$03,$00                     ;819AF5|        |      ;
 
DATA24_819AFE:
    dl $0000F2                                                 ;819AFE|        |      ;
    db $82,$03,$00,$7E,$03,$00,$7E,$03,$00,$7E,$03,$01         ;819B01|        |      ;
    db $7E,$03,$00,$7F,$03,$00,$80,$03,$00,$81,$03,$01         ;819B0D|        |      ;
    db $81,$03,$00,$02,$01,$00,$83,$03,$00                     ;819B19|        |      ;
 
DATA24_819B22:
    dl $0000F1                                                 ;819B22|        |      ;
    db $7C,$03,$00,$78,$03,$00,$78,$03,$00,$78,$03,$01         ;819B25|        |      ;
    db $78,$03,$00,$79,$03,$00,$7A,$03,$00,$7B,$03,$01         ;819B31|        |      ;
    db $7B,$03,$00,$01,$01,$00,$7D,$03,$00                     ;819B3D|        |      ;
 
DATA24_819B46:
    dl $0000F0                                                 ;819B46|        |      ;
    db $76,$03,$00,$72,$03,$00,$72,$03,$00,$72,$03,$01         ;819B49|        |      ;
    db $72,$03,$00,$73,$03,$00,$74,$03,$00,$75,$03,$01         ;819B55|        |      ;
    db $75,$03,$00,$00,$01,$00,$77,$03,$00                     ;819B61|        |      ;
 
DATA24_819B6A:
    dl $0000FA                                                 ;819B6A|        |      ;
    db $C2,$03,$00,$BC,$03,$00,$BD,$03,$00,$BE,$03,$01         ;819B6D|        |      ;
    db $BE,$03,$00,$BF,$03,$00,$C0,$03,$00,$C1,$03,$01         ;819B79|        |      ;
    db $C1,$03,$00,$0A,$01,$00,$C3,$03,$00                     ;819B85|        |      ;
 
DATA24_819B8E:
    dl $0000C3                                                 ;819B8E|        |      ;
    db $34,$04,$00,$2E,$04,$00,$2F,$04,$00,$30,$04,$01         ;819B91|        |      ;
    db $30,$04,$00,$31,$04,$00,$32,$04,$00,$33,$04,$01         ;819B9D|        |      ;
    db $33,$04,$00,$C4,$00,$00,$35,$04,$00                     ;819BA9|        |      ;
 
DATA24_819BB2:
    dl $00010B                                                 ;819BB2|        |      ;
    db $D0,$03,$00,$CC,$03,$00,$CC,$03,$00,$CC,$03,$01         ;819BB5|        |      ;
    db $CC,$03,$00,$CD,$03,$00,$CE,$03,$00,$CF,$03,$01         ;819BC1|        |      ;
    db $CF,$03,$00,$13,$01,$00,$00,$00,$00                     ;819BCD|        |      ;
 
DATA24_819BD6:
    dl $00010C                                                 ;819BD6|        |      ;
    db $D8,$03,$00,$D4,$03,$00,$D4,$03,$00,$D4,$03,$01         ;819BD9|        |      ;
    db $D4,$03,$00,$D5,$03,$00,$D6,$03,$00,$D7,$03,$01         ;819BE5|        |      ;
    db $D7,$03,$00,$14,$01,$00,$00,$00,$00                     ;819BF1|        |      ;
 
DATA24_819BFA:
    dl $00010D                                                 ;819BFA|        |      ;
    db $E0,$03,$00,$DC,$03,$00,$DC,$03,$00,$DC,$03,$01         ;819BFD|        |      ;
    db $DC,$03,$00,$DD,$03,$00,$DE,$03,$00,$DF,$03,$01         ;819C09|        |      ;
    db $DF,$03,$00,$15,$01,$00,$00,$00,$00                     ;819C15|        |      ;
 
DATA24_819C1E:
    dl $00010E                                                 ;819C1E|        |      ;
    db $E7,$03,$00,$E1,$03,$00,$E2,$03,$00,$E3,$03,$01         ;819C21|        |      ;
    db $E3,$03,$00,$E4,$03,$00,$E5,$03,$00,$E6,$03,$01         ;819C2D|        |      ;
    db $E6,$03,$00,$03,$01,$00,$E8,$03,$00                     ;819C39|        |      ;
 
DATA24_819C42:
    dl $00010F                                                 ;819C42|        |      ;
    db $EF,$03,$00,$E9,$03,$00,$EA,$03,$00,$EB,$03,$01         ;819C45|        |      ;
    db $EB,$03,$00,$EC,$03,$00,$ED,$03,$00,$EE,$03,$01         ;819C51|        |      ;
    db $EE,$03,$00,$03,$01,$00,$F0,$03,$00                     ;819C5D|        |      ;
 
DATA24_819C66:
    dl $000110                                                 ;819C66|        |      ;
    db $F7,$03,$00,$F1,$03,$00,$F2,$03,$00,$F3,$03,$01         ;819C69|        |      ;
    db $F3,$03,$00,$F4,$03,$00,$F5,$03,$00,$F6,$03,$01         ;819C75|        |      ;
    db $F6,$03,$00,$03,$01,$00,$F8,$03,$00                     ;819C81|        |      ;
 
DATA24_819C8A:
    dl $000111                                                 ;819C8A|        |      ;
    db $FF,$03,$00,$F9,$03,$00,$FA,$03,$00,$FB,$03,$01         ;819C8D|        |      ;
    db $FB,$03,$00,$FC,$03,$00,$FD,$03,$00,$FE,$03,$01         ;819C99|        |      ;
    db $FE,$03,$00,$03,$01,$00,$00,$04,$00                     ;819CA5|        |      ;
 
DATA24_819CAE:
    dl $000112                                                 ;819CAE|        |      ;
    db $07,$04,$00,$01,$04,$00,$02,$04,$00,$03,$04,$01         ;819CB1|        |      ;
    db $03,$04,$00,$04,$04,$00,$05,$04,$00,$06,$04,$01         ;819CBD|        |      ;
    db $06,$04,$00,$03,$01,$00,$08,$04,$00                     ;819CC9|        |      ;
 
DATA24_819CD2:
    dl $0003D3                                                 ;819CD2|        |      ;
    db $D2,$03,$00,$D1,$03,$00,$D1,$03,$00,$D1,$03,$01         ;819CD5|        |      ;
    db $D1,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01         ;819CE1|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00                     ;819CED|        |      ;
 
DATA24_819CF6:
    dl $000117                                                 ;819CF6|        |      ;
    db $BD,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01         ;819CF9|        |      ;
    db $00,$00,$00,$00,$00,$00,$BC,$00,$00,$00,$00,$01         ;819D05|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00                     ;819D11|        |      ;
 
DATA24_819D1A:
    dl $000212                                                 ;819D1A|        |      ;
    db $14,$04,$00,$0E,$04,$00,$0F,$04,$00,$10,$04,$01         ;819D1D|        |      ;
    db $10,$04,$00,$11,$04,$00,$12,$04,$00,$13,$04,$01         ;819D29|        |      ;
    db $13,$04,$00,$00,$00,$00,$15,$04,$00                     ;819D35|        |      ;
 
DATA24_819D3E:
    dl $000217                                                 ;819D3E|        |      ;
    db $1C,$04,$00,$16,$04,$00,$17,$04,$00,$18,$04,$01         ;819D41|        |      ;
    db $18,$04,$00,$19,$04,$00,$1A,$04,$00,$1B,$04,$01         ;819D4D|        |      ;
    db $1B,$04,$00,$00,$00,$00,$1D,$04,$00                     ;819D59|        |      ;
 
DATA24_819D62:
    dl $0001D9                                                 ;819D62|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01         ;819D65|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01         ;819D71|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00                     ;819D7D|        |      ;
 
DATA24_819D86:
    dl $0000E5                                                 ;819D86|        |      ;
    db $26,$01,$00,$20,$01,$00,$21,$01,$00,$22,$01,$01         ;819D89|        |      ;
    db $22,$01,$00,$23,$01,$00,$24,$01,$00,$25,$01,$01         ;819D95|        |      ;
    db $25,$01,$00,$B4,$00,$00,$27,$01,$00                     ;819DA1|        |      ;
 
DATA24_819DAA:
    dl $000326                                                 ;819DAA|        |      ;
    db $24,$04,$00,$1E,$04,$00,$1F,$04,$00,$20,$04,$01         ;819DAD|        |      ;
    db $20,$04,$00,$21,$04,$00,$22,$04,$00,$23,$04,$01         ;819DB9|        |      ;
    db $23,$04,$00,$00,$00,$00,$25,$04,$00                     ;819DC5|        |      ;
 
DATA24_819DCE:
    dl $0000D8                                                 ;819DCE|        |      ;
    db $D8,$00,$00,$67,$01,$00,$68,$01,$00,$69,$01,$01         ;819DD1|        |      ;
    db $69,$01,$00                                             ;819DDD|        |      ;
 
DATA24_819DE0:
    dl $0000D9                                                 ;819DE0|        |      ;
    db $D9,$00,$00,$6A,$01,$00,$6B,$01,$00,$6C,$01,$01         ;819DE3|        |      ;
    db $6C,$01,$00                                             ;819DEF|        |      ;
 
DATA24_819DF2:
    dl $0000DA                                                 ;819DF2|        |      ;
    db $DA,$00,$00,$6D,$01,$00,$6E,$01,$00,$6F,$01,$01         ;819DF5|        |      ;
    db $6F,$01,$00                                             ;819E01|        |      ;
 
DATA24_819E04:
    dl $0000DB                                                 ;819E04|        |      ;
    db $DB,$00,$00,$70,$01,$00,$71,$01,$00,$72,$01,$01         ;819E07|        |      ;
    db $72,$01,$00                                             ;819E13|        |      ;
 
DATA24_819E16:
    dl $0000D0                                                 ;819E16|        |      ;
    db $D0,$00,$00,$4F,$01,$00,$50,$01,$00,$51,$01,$01         ;819E19|        |      ;
    db $51,$01,$00                                             ;819E25|        |      ;
 
DATA24_819E28:
    dl $0000D1                                                 ;819E28|        |      ;
    db $D1,$00,$00,$52,$01,$00,$53,$01,$00,$54,$01,$01         ;819E2B|        |      ;
    db $54,$01,$00                                             ;819E37|        |      ;
 
DATA24_819E3A:
    dl $0000D2                                                 ;819E3A|        |      ;
    db $D2,$00,$00,$55,$01,$00,$56,$01,$00,$57,$01,$01         ;819E3D|        |      ;
    db $57,$01,$00                                             ;819E49|        |      ;
 
DATA24_819E4C:
    dl $0000D3                                                 ;819E4C|        |      ;
    db $D3,$00,$00,$58,$01,$00,$59,$01,$00,$5A,$01,$01         ;819E4F|        |      ;
    db $5A,$01,$00                                             ;819E5B|        |      ;
 
DATA24_819E5E:
    dl $0000CC                                                 ;819E5E|        |      ;
    db $CC,$00,$00,$43,$01,$00,$44,$01,$00,$45,$01,$01         ;819E61|        |      ;
    db $45,$01,$00                                             ;819E6D|        |      ;
 
DATA24_819E70:
    dl $0000CD                                                 ;819E70|        |      ;
    db $CD,$00,$00,$46,$01,$00,$47,$01,$00,$48,$01,$01         ;819E73|        |      ;
    db $48,$01,$00                                             ;819E7F|        |      ;
 
DATA24_819E82:
    dl $0000CE                                                 ;819E82|        |      ;
    db $CE,$00,$00,$49,$01,$00,$4A,$01,$00,$4B,$01,$01         ;819E85|        |      ;
    db $4B,$01,$00                                             ;819E91|        |      ;
 
DATA24_819E94:
    dl $0000CF                                                 ;819E94|        |      ;
    db $CF,$00,$00,$4C,$01,$00,$4D,$01,$00,$4E,$01,$01         ;819E97|        |      ;
    db $4E,$01,$00                                             ;819EA3|        |      ;
 
DATA24_819EA6:
    dl $0000D4                                                 ;819EA6|        |      ;
    db $D4,$00,$00,$5B,$01,$00,$5C,$01,$00,$5D,$01,$01         ;819EA9|        |      ;
    db $5D,$01,$00                                             ;819EB5|        |      ;
 
DATA24_819EB8:
    dl $0000D5                                                 ;819EB8|        |      ;
    db $D5,$00,$00,$5E,$01,$00,$5F,$01,$00,$60,$01,$01         ;819EBB|        |      ;
    db $60,$01,$00                                             ;819EC7|        |      ;
 
DATA24_819ECA:
    dl $0000D6                                                 ;819ECA|        |      ;
    db $D6,$00,$00,$61,$01,$00,$62,$01,$00,$63,$01,$01         ;819ECD|        |      ;
    db $63,$01,$00                                             ;819ED9|        |      ;
 
DATA24_819EDC:
    dl $0000D7                                                 ;819EDC|        |      ;
    db $D7,$00,$00,$64,$01,$00,$65,$01,$00,$66,$01,$01         ;819EDF|        |      ;
    db $66,$01,$00                                             ;819EEB|        |      ;
 
DATA24_819EEE:
    dl $0000E0                                                 ;819EEE|        |      ;
    db $E0,$00,$00,$7C,$01,$00,$7D,$01,$00,$7E,$01,$01         ;819EF1|        |      ;
    db $7E,$01,$00                                             ;819EFD|        |      ;
 
DATA24_819F00:
    dl $0000E1                                                 ;819F00|        |      ;
    db $E1,$00,$00,$7F,$01,$00,$80,$01,$00,$81,$01,$01         ;819F03|        |      ;
    db $81,$01,$00                                             ;819F0F|        |      ;
 
DATA24_819F12:
    dl $0000E3                                                 ;819F12|        |      ;
    db $E3,$00,$00,$85,$01,$00,$86,$01,$00,$87,$01,$01         ;819F15|        |      ;
    db $87,$01,$00                                             ;819F21|        |      ;
 
DATA24_819F24:
    dl $0000E2                                                 ;819F24|        |      ;
    db $E2,$00,$00,$82,$01,$00,$83,$01,$00,$84,$01,$01         ;819F27|        |      ;
    db $84,$01,$00                                             ;819F33|        |      ;
 
DATA24_819F36:
    dl $0000DF                                                 ;819F36|        |      ;
    db $DF,$00,$00,$79,$01,$00,$7A,$01,$00,$7B,$01,$01         ;819F39|        |      ;
    db $7B,$01,$00                                             ;819F45|        |      ;
 
DATA24_819F48:
    dl $0000E4                                                 ;819F48|        |      ;
    db $E4,$00,$00,$89,$01,$00,$89,$01,$00,$89,$01,$01         ;819F4B|        |      ;
    db $89,$01,$00                                             ;819F57|        |      ;
 
DATA24_819F5A:
    dl $0000E5                                                 ;819F5A|        |      ;
    db $E5,$00,$00,$8A,$01,$00,$8A,$01,$00,$8A,$01,$01         ;819F5D|        |      ;
    db $8A,$01,$00                                             ;819F69|        |      ;
 
DATA24_819F6C:
    dl $0000DC                                                 ;819F6C|        |      ;
    db $DC,$00,$00,$88,$01,$00,$88,$01,$00,$88,$01,$01         ;819F6F|        |      ;
    db $88,$01,$00                                             ;819F7B|        |      ;
 
DATA24_819F7E:
    dl $0000DE                                                 ;819F7E|        |      ;
    db $DE,$00,$00,$76,$01,$00,$77,$01,$00,$78,$01,$01         ;819F81|        |      ;
    db $78,$01,$00                                             ;819F8D|        |      ;
 
DATA24_819F90:
    dl $0000DD                                                 ;819F90|        |      ;
    db $DD,$00,$00,$73,$01,$00,$74,$01,$00,$75,$01,$01         ;819F93|        |      ;
    db $75,$01,$00                                             ;819F9F|        |      ;
 
DATA24_819FA2:
    dl $0000FB                                                 ;819FA2|        |      ;
    db $CA,$03,$00,$C4,$03,$00,$C5,$03,$00,$C6,$03,$01         ;819FA5|        |      ;
    db $C6,$03,$00,$C7,$03,$00,$C8,$03,$00,$C9,$03,$01         ;819FB1|        |      ;
    db $C9,$03,$00,$0A,$01,$00,$CB,$03,$00                     ;819FBD|        |      ;
 
aFoundItemData:
    dw $0366                                                   ;819FC6|        |      ; 0x08 * [n16 nDialogId, n8 nEnergyIncrease] ; Mushroom
    db $0A                                                     ;819FC8|        |      ;
    dw $0367                                                   ;819FC9|        |      ; Poisonous mushroom
    db $F6                                                     ;819FCB|        |      ;
    dw $0368                                                   ;819FCC|        |      ; Berry of wild grape
    db $0A                                                     ;819FCE|        |      ;
    dw $0369                                                   ;819FCF|        |      ; Tropical fruit
    db $0A                                                     ;819FD1|        |      ;
    dw $036A                                                   ;819FD2|        |      ; Berry of Fullmoon Plant
    db $32                                                     ;819FD4|        |      ;
    dw $036B                                                   ;819FD5|        |      ; Cake
    db $32                                                     ;819FD7|        |      ;
    dw $036C                                                   ;819FD8|        |      ; Fish
    db $0A                                                     ;819FDA|        |      ;
    dw $036D                                                   ;819FDB|        |      ; Power berry
    db $0A                                                     ;819FDD|        |      ;
 
aDialogData_ShippingProfit:
    db $00,$00,$00,$0F,$00,$14,$00,$0F,$00,$14,$00,$3C         ;819FDE|        |      ; 0x5B * [n8 nUnk, n8 nProfit]
    db $00,$00,$00,$1E,$00,$00,$00,$00,$00,$00,$00,$00         ;819FEA|        |      ;
    db $00,$00,$10,$00,$10,$00,$14,$00,$00,$0C,$00,$0A         ;819FF6|        |      ;
    db $00,$08,$00,$06,$00,$05,$00,$0F,$00,$19,$00,$23         ;81A002|        |      ;
    db $00,$14,$00,$00,$99,$00,$00,$00,$00,$00,$00,$00         ;81A00E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A01A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A026|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A032|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A03E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A04A|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A056|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A062|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A06E|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A07A|        |      ;
    db $00,$00,$00,$00,$00,$00,$14,$00,$00,$00,$00,$00         ;81A086|        |      ;
    db $00,$00                                                 ;81A092|        |      ;
 
aDialogData_SellItems:
    dw $0000                                                   ;81A094|        |      ; 0x5B * [n16 nDialogId, n8 nProfit]
    db $00                                                     ;81A096|        |      ;
    dw $0358                                                   ;81A097|        |      ; Mushroom
    db $14                                                     ;81A099|        |      ;
    dw $0359                                                   ;81A09A|        |      ; Poisonous mushroom
    db $1E                                                     ;81A09C|        |      ;
    dw $035B                                                   ;81A09D|        |      ; Berry of wild grape
    db $14                                                     ;81A09F|        |      ;
    dw $035C                                                   ;81A0A0|        |      ; Tropical fruit
    db $1E                                                     ;81A0A2|        |      ;
    dw $035D                                                   ;81A0A3|        |      ; Berry of Fullmoon Plant
    db $3C                                                     ;81A0A5|        |      ;
    dw $0313                                                   ;81A0A6|        |      ; Cake
    db $00                                                     ;81A0A8|        |      ;
    dw $035E                                                   ;81A0A9|        |      ; Fish
    db $1E                                                     ;81A0AB|        |      ;
    dw $0000                                                   ;81A0AC|        |      ; Power berry
    db $00                                                     ;81A0AE|        |      ;
    dw $0000                                                   ;81A0AF|        |      ;
    db $00                                                     ;81A0B1|        |      ;
    dw $0000                                                   ;81A0B2|        |      ;
    db $00                                                     ;81A0B4|        |      ;
    dw $0000                                                   ;81A0B5|        |      ;
    db $00                                                     ;81A0B7|        |      ;
    dw $0000                                                   ;81A0B8|        |      ;
    db $00                                                     ;81A0BA|        |      ;
    dw $0000                                                   ;81A0BB|        |      ;
    db $00                                                     ;81A0BD|        |      ;
    dw $0000                                                   ;81A0BE|        |      ;
    db $00                                                     ;81A0C0|        |      ;
    dw $0000                                                   ;81A0C1|        |      ;
    db $00                                                     ;81A0C3|        |      ;
    dw $0353                                                   ;81A0C4|        |      ; Corn
    db $18                                                     ;81A0C6|        |      ;
    dw $0354                                                   ;81A0C7|        |      ; Tomato
    db $14                                                     ;81A0C9|        |      ;
    dw $0355                                                   ;81A0CA|        |      ; Potato
    db $10                                                     ;81A0CC|        |      ;
    dw $0356                                                   ;81A0CD|        |      ; Turnip
    db $0C                                                     ;81A0CF|        |      ;
    dw $0357                                                   ;81A0D0|        |      ; Egg
    db $0A                                                     ;81A0D2|        |      ;
    dw $0350                                                   ;81A0D3|        |      ; Small milk
    db $14                                                     ;81A0D5|        |      ;
    dw $0351                                                   ;81A0D6|        |      ; Medium milk
    db $1E                                                     ;81A0D8|        |      ;
    dw $0352                                                   ;81A0D9|        |      ; Large milk
    db $28                                                     ;81A0DB|        |      ;
    dw $035A                                                   ;81A0DC|        |      ; Herb
    db $14                                                     ;81A0DE|        |      ;
    dw $0313                                                   ;81A0DF|        |      ; Flower
    db $00                                                     ;81A0E1|        |      ;
    dw $0000                                                   ;81A0E2|        |      ;
    db $00                                                     ;81A0E4|        |      ;
    dw $0000                                                   ;81A0E5|        |      ;
    db $00                                                     ;81A0E7|        |      ;
    dw $0000                                                   ;81A0E8|        |      ;
    db $00                                                     ;81A0EA|        |      ;
    dw $0000                                                   ;81A0EB|        |      ;
    db $00                                                     ;81A0ED|        |      ;
    dw $0000                                                   ;81A0EE|        |      ;
    db $00                                                     ;81A0F0|        |      ;
    dw $0000                                                   ;81A0F1|        |      ;
    db $00                                                     ;81A0F3|        |      ;
    dw $0000                                                   ;81A0F4|        |      ;
    db $00                                                     ;81A0F6|        |      ;
    dw $0000                                                   ;81A0F7|        |      ;
    db $00                                                     ;81A0F9|        |      ;
    dw $0000                                                   ;81A0FA|        |      ;
    db $00                                                     ;81A0FC|        |      ;
    dw $0000                                                   ;81A0FD|        |      ;
    db $00                                                     ;81A0FF|        |      ;
    dw $0000                                                   ;81A100|        |      ;
    db $00                                                     ;81A102|        |      ;
    dw $0313                                                   ;81A103|        |      ;
    db $00                                                     ;81A105|        |      ;
    dw $0313                                                   ;81A106|        |      ;
    db $00                                                     ;81A108|        |      ;
    dw $0000                                                   ;81A109|        |      ;
    db $00                                                     ;81A10B|        |      ;
    dw $0000                                                   ;81A10C|        |      ;
    db $00                                                     ;81A10E|        |      ;
    dw $0000                                                   ;81A10F|        |      ;
    db $00                                                     ;81A111|        |      ;
    dw $0000                                                   ;81A112|        |      ;
    db $00                                                     ;81A114|        |      ;
    dw $0000                                                   ;81A115|        |      ;
    db $00                                                     ;81A117|        |      ;
    dw $0000                                                   ;81A118|        |      ;
    db $00                                                     ;81A11A|        |      ;
    dw $0000                                                   ;81A11B|        |      ;
    db $00                                                     ;81A11D|        |      ;
    dw $0000                                                   ;81A11E|        |      ;
    db $00                                                     ;81A120|        |      ;
    dw $0000                                                   ;81A121|        |      ;
    db $00                                                     ;81A123|        |      ;
    dw $0000                                                   ;81A124|        |      ;
    db $00                                                     ;81A126|        |      ;
    dw $0000                                                   ;81A127|        |      ;
    db $00                                                     ;81A129|        |      ;
    dw $0000                                                   ;81A12A|        |      ;
    db $00                                                     ;81A12C|        |      ;
    dw $0000                                                   ;81A12D|        |      ;
    db $00                                                     ;81A12F|        |      ;
    dw $0000                                                   ;81A130|        |      ;
    db $00                                                     ;81A132|        |      ;
    dw $0000                                                   ;81A133|        |      ;
    db $00                                                     ;81A135|        |      ;
    dw $0000                                                   ;81A136|        |      ;
    db $00                                                     ;81A138|        |      ;
    dw $0000                                                   ;81A139|        |      ;
    db $00                                                     ;81A13B|        |      ;
    dw $0000                                                   ;81A13C|        |      ;
    db $00                                                     ;81A13E|        |      ;
    dw $0000                                                   ;81A13F|        |      ;
    db $00                                                     ;81A141|        |      ;
    dw $0000                                                   ;81A142|        |      ;
    db $00                                                     ;81A144|        |      ;
    dw $0000                                                   ;81A145|        |      ;
    db $00                                                     ;81A147|        |      ;
    dw $0000                                                   ;81A148|        |      ;
    db $00                                                     ;81A14A|        |      ;
    dw $0000                                                   ;81A14B|        |      ;
    db $00                                                     ;81A14D|        |      ;
    dw $0000                                                   ;81A14E|        |      ;
    db $00                                                     ;81A150|        |      ;
    dw $0000                                                   ;81A151|        |      ;
    db $00                                                     ;81A153|        |      ;
    dw $0000                                                   ;81A154|        |      ;
    db $00                                                     ;81A156|        |      ;
    dw $0000                                                   ;81A157|        |      ;
    db $00                                                     ;81A159|        |      ;
    dw $0000                                                   ;81A15A|        |      ;
    db $00                                                     ;81A15C|        |      ;
    dw $0000                                                   ;81A15D|        |      ;
    db $00                                                     ;81A15F|        |      ;
    dw $0000                                                   ;81A160|        |      ;
    db $00                                                     ;81A162|        |      ;
    dw $0000                                                   ;81A163|        |      ;
    db $00                                                     ;81A165|        |      ;
    dw $0000                                                   ;81A166|        |      ;
    db $00                                                     ;81A168|        |      ;
    dw $0000                                                   ;81A169|        |      ;
    db $00                                                     ;81A16B|        |      ;
    dw $0000                                                   ;81A16C|        |      ;
    db $00                                                     ;81A16E|        |      ;
    dw $0000                                                   ;81A16F|        |      ;
    db $00                                                     ;81A171|        |      ;
    dw $0000                                                   ;81A172|        |      ;
    db $00                                                     ;81A174|        |      ;
    dw $0000                                                   ;81A175|        |      ;
    db $00                                                     ;81A177|        |      ;
    dw $0000                                                   ;81A178|        |      ;
    db $00                                                     ;81A17A|        |      ;
    dw $0000                                                   ;81A17B|        |      ;
    db $00                                                     ;81A17D|        |      ;
    dw $0000                                                   ;81A17E|        |      ;
    db $00                                                     ;81A180|        |      ;
    dw $0000                                                   ;81A181|        |      ;
    db $00                                                     ;81A183|        |      ;
    dw $0000                                                   ;81A184|        |      ;
    db $00                                                     ;81A186|        |      ;
    dw $0000                                                   ;81A187|        |      ;
    db $00                                                     ;81A189|        |      ;
    dw $0000                                                   ;81A18A|        |      ;
    db $00                                                     ;81A18C|        |      ;
    dw $0000                                                   ;81A18D|        |      ;
    db $00                                                     ;81A18F|        |      ;
    dw $0000                                                   ;81A190|        |      ;
    db $00                                                     ;81A192|        |      ;
    dw $0000                                                   ;81A193|        |      ;
    db $00                                                     ;81A195|        |      ;
    dw $0000                                                   ;81A196|        |      ;
    db $00                                                     ;81A198|        |      ;
    dw $0000                                                   ;81A199|        |      ;
    db $00                                                     ;81A19B|        |      ;
    dw $0000                                                   ;81A19C|        |      ;
    db $00                                                     ;81A19E|        |      ;
    dw $0000                                                   ;81A19F|        |      ;
    db $00                                                     ;81A1A1|        |      ;
    dw $0000                                                   ;81A1A2|        |      ;
    db $00                                                     ;81A1A4|        |      ;
 
aDialogsData_BuyItems:
    dw $02F6,$02F7,$0211,$02F9                                 ;81A1A5|        |      ; 0x16 *[n16 nDescriptionDialogId, n16 nAnswer1DialogId (yes), n16 nAnswer2DialogId (no), n16 nTooPoorDialogId, n8 nUnknown, n24 nCost]; Grass seeds
    db $BB                                                     ;81A1AD|        |      ;
    dl $FFFFCE                                                 ;81A1AE|        |      ;
    dw $033F,$02F7,$0211,$02F9                                 ;81A1B1|        |      ; Corn seeds
    db $B7                                                     ;81A1B9|        |      ;
    dl $FFFFE2                                                 ;81A1BA|        |      ;
    dw $033C,$02F7,$0211,$02F9                                 ;81A1BD|        |      ; Tomato seeds
    db $B8                                                     ;81A1C5|        |      ;
    dl $FFFFE2                                                 ;81A1C6|        |      ;
    dw $033D,$02F7,$0211,$02F9                                 ;81A1C9|        |      ; Potato seeds
    db $B9                                                     ;81A1D1|        |      ;
    dl $FFFFEC                                                 ;81A1D2|        |      ;
    dw $033E,$02F7,$0211,$02F9                                 ;81A1D5|        |      ; Turnip seeds
    db $BA                                                     ;81A1DD|        |      ;
    dl $FFFFEC                                                 ;81A1DE|        |      ;
    dw $0340,$02F8,$0211,$02F9                                 ;81A1E1|        |      ; Flower
    db $BC                                                     ;81A1E9|        |      ;
    dl $FFFFE2                                                 ;81A1EA|        |      ;
    dw $02FC,$02FD,$02FE,$02FF                                 ;81A1ED|        |      ; Paint
    db $D1                                                     ;81A1F5|        |      ;
    dl $FFFF6A                                                 ;81A1F6|        |      ;
    dw $0312,$02FD,$02FE,$02FF                                 ;81A1F9|        |      ; Milker
    db $D0                                                     ;81A201|        |      ;
    dl $FFFF4C                                                 ;81A202|        |      ;
    dw $0314,$02FD,$02FE,$02FF                                 ;81A205|        |      ; Brush
    db $CF                                                     ;81A20D|        |      ;
    dl $FFFFB0                                                 ;81A20E|        |      ;
    dw $0344,$02FD,$02FE,$02FF                                 ;81A211|        |      ; Super sickle
    db $CA                                                     ;81A219|        |      ;
    dl $FFFF38                                                 ;81A21A|        |      ;
    dw $0345,$02FD,$02FE,$02FF                                 ;81A21D|        |      ; Super hoe
    db $CB                                                     ;81A225|        |      ;
    dl $FFFF38                                                 ;81A226|        |      ;
    dw $0346,$02FD,$02FE,$02FF                                 ;81A229|        |      ; Super hammer
    db $CC                                                     ;81A231|        |      ;
    dl $FFFF38                                                 ;81A232|        |      ;
    dw $0347,$02FD,$02FE,$02FF                                 ;81A235|        |      ; Super axe
    db $CD                                                     ;81A23D|        |      ;
    dl $FFFF38                                                 ;81A23E|        |      ;
    dw $0343,$02FD,$02FE,$02FF                                 ;81A241|        |      ; Sprinkler
    db $CE                                                     ;81A249|        |      ;
    dl $FFFF38                                                 ;81A24A|        |      ;
    dw $0301,$0302,$0303,$0304                                 ;81A24D|        |      ; Cow medicine
    db $D7                                                     ;81A255|        |      ;
    dl $FFFF9C                                                 ;81A256|        |      ;
    dw $033B,$0302,$0303,$0304                                 ;81A259|        |      ; Miracle potion
    db $D6                                                     ;81A261|        |      ;
    dl $FFFE70                                                 ;81A262|        |      ;
    dw $0342,$0308,$0303,$0304                                 ;81A265|        |      ; Chicken feed
    db $D9                                                     ;81A26D|        |      ;
    dl $FFFFE2                                                 ;81A26E|        |      ;
    dw $0341,$0308,$0303,$0304                                 ;81A271|        |      ; Cow feed
    db $D8                                                     ;81A279|        |      ;
    dl $FFFFC4                                                 ;81A27A|        |      ;
    dw $0348,$0349,$034A,$02FF                                 ;81A27D|        |      ; Cake
    db $C5                                                     ;81A285|        |      ;
    dl $FFFFCE                                                 ;81A286|        |      ;
    dw $020E,$0210,$0211,$02F9                                 ;81A289|        |      ; Lilac fragrance
    db $F8                                                     ;81A291|        |      ;
    dl $FFFF9C                                                 ;81A292|        |      ;
    dw $020D,$0210,$0211,$02F9                                 ;81A295|        |      ; Rose fragrance
    db $F7                                                     ;81A29D|        |      ;
    dl $FFFF9C                                                 ;81A29E|        |      ;
    dw $020F,$0210,$0211,$02F9                                 ;81A2A1|        |      ; Violet fragrance
    db $F9                                                     ;81A2A9|        |      ;
    dl $FFFF9C                                                 ;81A2AA|        |      ;
 
nItemCarriedIndexForTilemap:
    db $00,$01,$01,$01,$01,$03,$00,$00,$00,$02,$02,$02         ;81A2AD|        |      ; 0x5B * [n8]
    db $01,$02,$02,$02,$4C,$32,$07,$07,$2E,$00,$00,$00         ;81A2B9|        |      ;
    db $20,$01,$00,$12,$12,$12,$00,$00,$00,$00,$00,$00         ;81A2C5|        |      ;
    db $00,$00,$00,$00,$00,$00,$2A,$2B,$2B,$2D,$2A,$2B         ;81A2D1|        |      ;
    db $2B,$2D,$2A,$2B,$2B,$2C,$2A,$2B,$2B,$2C,$2A,$2B         ;81A2DD|        |      ;
    db $2B,$2D,$2C,$2B,$2A,$2B,$2E,$2E,$00,$00,$00,$00         ;81A2E9|        |      ;
    db $00,$21,$21,$21,$21,$20,$20,$20,$20,$20,$22,$22         ;81A2F5|        |      ;
    db $22,$22,$22,$00,$12,$12,$12                             ;81A301|        |      ;
 
nSoundItemCarriedTable_81A308:
    db $00,$01,$01,$01,$01,$01,$00,$00,$01,$01,$01,$01         ;81A308|        |      ; 0x5B * [n8]
    db $01,$01,$01,$01,$01,$01,$01,$01,$00,$00,$00,$00         ;81A314|        |      ;
    db $01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A320|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A32C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A338|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A344|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;81A350|        |      ;
    db $00,$00,$00,$01,$00,$00,$00                             ;81A35C|        |      ;
 
nUnknownXYTable:
    dw $0218,$0208,$01A8,$00D2,$02E8,$00F2                     ;81A363|        |      ; n16 x, n16 y
    dw $0318,$0252,$00E8,$0322,$0298,$0372                     ;81A36F|        |      ;
    dw $02B0,$0170,$0068,$0250                                 ;81A37B|        |      ;
 
fUnknown_81A383:
    REP #$30                                                   ;81A383|C230    |      ;
    LDA.W #$B4E6                                               ;81A385|A9E6B4  |      ;
    STA.B ptrUnknown0x07                                       ;81A388|8507    |000007;
    SEP #$20                                                   ;81A38A|E220    |      ;
    LDA.B #$7E                                                 ;81A38C|A97E    |      ;
    STA.B ptrUnknown0x07+2                                     ;81A38E|8509    |000009; $72 = 0x7EB4E6
    LDX.W #$0000                                               ;81A390|A20000  |      ;
 
.loop:
    PHX                                                        ;81A393|DA      |      ;
    SEP #$20                                                   ;81A394|E220    |      ;
    LDA.B [ptrUnknown0x07]                                     ;81A396|A707    |000007;
    AND.B #$01                                                 ;81A398|2901    |      ;
    BNE +                                                      ;81A39A|D003    |81A39F;
    JMP.W .caseFFFD                                            ;81A39C|4CB2A4  |81A4B2;
 
 
  + SEP #$20                                                   ;81A39F|E220    |      ;
    LDY.W #$0000                                               ;81A3A1|A00000  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3A4|B707    |000007;
    STA.W $0974                                                ;81A3A6|8D7409  |000974;
    LDY.W #$0001                                               ;81A3A9|A00100  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3AC|B707    |000007;
    STA.W $0975                                                ;81A3AE|8D7509  |000975;
    LDY.W #$0002                                               ;81A3B1|A00200  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3B4|B707    |000007;
    STA.W $0976                                                ;81A3B6|8D7609  |000976;
    LDY.W #$0003                                               ;81A3B9|A00300  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3BC|B707    |000007;
    STA.W nCarriedItemId                                       ;81A3BE|8D8409  |000984;
    REP #$20                                                   ;81A3C1|C220    |      ;
    LDY.W #$0004                                               ;81A3C3|A00400  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3C6|B707    |000007;
    STA.W nGameObjectIdx                                       ;81A3C8|8D7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;81A3CB|85A5    |0000A5;
    LDY.W #$0006                                               ;81A3CD|A00600  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3D0|B707    |000007;
    STA.W $097A                                                ;81A3D2|8D7A09  |00097A;
    LDY.W #$0008                                               ;81A3D5|A00800  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3D8|B707    |000007;
    STA.W $097C                                                ;81A3DA|8D7C09  |00097C;
    LDY.W #$000A                                               ;81A3DD|A00A00  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3E0|B707    |000007;
    STA.W $097E                                                ;81A3E2|8D7E09  |00097E;
    LDY.W #$000C                                               ;81A3E5|A00C00  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3E8|B707    |000007;
    STA.W nUnknownX                                            ;81A3EA|8D8009  |000980;
    LDY.W #$000E                                               ;81A3ED|A00E00  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A3F0|B707    |000007;
    STA.W nUnknownY                                            ;81A3F2|8D8209  |000982;
    JSL.L fObject_GetSingleObjectData                          ;81A3F5|22CB8185|8581CB;
    REP #$20                                                   ;81A3F9|C220    |      ;
    LDA.B strcObject.exists                                    ;81A3FB|A5A7    |0000A7;
    CMP.W #$FFFD                                               ;81A3FD|C9FDFF  |      ;
    BNE +                                                      ;81A400|D003    |81A405;
    JMP.W .allOther                                            ;81A402|4C19A4  |81A419;
 
 
  + CMP.W #$FFFF                                               ;81A405|C9FFFF  |      ;
    BEQ .caseFFFF                                              ;81A408|F027    |81A431;
    SEP #$20                                                   ;81A40A|E220    |      ;
    LDA.W $0974                                                ;81A40C|AD7409  |000974;
    AND.B #$04                                                 ;81A40F|2904    |      ;
    BNE +                                                      ;81A411|D004    |81A417;
    JML.L .caseFFFD                                            ;81A413|5CB2A481|81A4B2;
 
 
  + BRA .caseFFFF                                              ;81A417|8018    |81A431;
 
 
.allOther:
    REP #$20                                                   ;81A419|C220    |      ;
    LDA.W nGameObjectIdx                                       ;81A41B|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;81A41E|85A5    |0000A5;
    JSL.L fObject_Unknown8581A2                                ;81A420|22A28185|8581A2;
    SEP #$20                                                   ;81A424|E220    |      ;
    LDA.W $0974                                                ;81A426|AD7409  |000974;
    AND.B #$02                                                 ;81A429|2902    |      ;
    BEQ .caseFFFF                                              ;81A42B|F004    |81A431;
    JSL.L fUnknown_81A4F1                                      ;81A42D|22F1A481|81A4F1;
 
.caseFFFF:
    SEP #$20                                                   ;81A431|E220    |      ;
    LDA.B #$00                                                 ;81A433|A900    |      ;
    XBA                                                        ;81A435|EB      |      ;
    LDY.W #$0001                                               ;81A436|A00100  |      ;
    LDA.B [ptrUnknown0x07],Y                                   ;81A439|B707    |000007;
    REP #$20                                                   ;81A43B|C220    |      ;
    ASL A                                                      ;81A43D|0A      |      ;
    TAX                                                        ;81A43E|AA      |      ;
    CPX.W #$0000                                               ;81A43F|E00000  |      ;
    BEQ .caseFFFD                                              ;81A442|F06E    |81A4B2;
    JSR.W (pSubrutineTable_81A58B,X)                           ;81A444|FC8BA5  |81A58B;
    SEP #$20                                                   ;81A447|E220    |      ;
    LDY.W #$0000                                               ;81A449|A00000  |      ;
    LDA.W $0974                                                ;81A44C|AD7409  |000974;
    STA.B [ptrUnknown0x07],Y                                   ;81A44F|9707    |000007;
    LDY.W #$0002                                               ;81A451|A00200  |      ;
    LDA.W $0976                                                ;81A454|AD7609  |000976;
    STA.B [ptrUnknown0x07],Y                                   ;81A457|9707    |000007;
    LDY.W #$0003                                               ;81A459|A00300  |      ;
    LDA.W nCarriedItemId                                       ;81A45C|AD8409  |000984;
    STA.B [ptrUnknown0x07],Y                                   ;81A45F|9707    |000007;
    REP #$20                                                   ;81A461|C220    |      ;
    LDY.W #$0004                                               ;81A463|A00400  |      ;
    LDA.W nGameObjectIdx                                       ;81A466|AD7809  |000978;
    STA.B [ptrUnknown0x07],Y                                   ;81A469|9707    |000007;
    STA.B strcObject.gameObjectIdx                             ;81A46B|85A5    |0000A5;
    LDY.W #$0006                                               ;81A46D|A00600  |      ;
    LDA.W $097A                                                ;81A470|AD7A09  |00097A;
    STA.B [ptrUnknown0x07],Y                                   ;81A473|9707    |000007;
    LDY.W #$0008                                               ;81A475|A00800  |      ;
    LDA.W $097C                                                ;81A478|AD7C09  |00097C;
    STA.B [ptrUnknown0x07],Y                                   ;81A47B|9707    |000007;
    LDY.W #$000A                                               ;81A47D|A00A00  |      ;
    LDA.W $097E                                                ;81A480|AD7E09  |00097E;
    STA.B [ptrUnknown0x07],Y                                   ;81A483|9707    |000007;
    STA.B strcObject.flip                                      ;81A485|859F    |00009F;
    LDY.W #$000C                                               ;81A487|A00C00  |      ;
    LDA.W nUnknownX                                            ;81A48A|AD8009  |000980;
    STA.B [ptrUnknown0x07],Y                                   ;81A48D|9707    |000007;
    STA.B strcObject.posX                                      ;81A48F|859B    |00009B;
    LDY.W #$000E                                               ;81A491|A00E00  |      ;
    LDA.W nUnknownY                                            ;81A494|AD8209  |000982;
    STA.B [ptrUnknown0x07],Y                                   ;81A497|9707    |000007;
    STA.B strcObject.posY                                      ;81A499|859D    |00009D;
    JSL.L fObject_Unknown8580B9                                ;81A49B|22B98085|8580B9;
    LDA.W $097A                                                ;81A49F|AD7A09  |00097A;
    CMP.W $097C                                                ;81A4A2|CD7C09  |00097C;
    BEQ .caseFFFD                                              ;81A4A5|F00B    |81A4B2;
    STA.B strcObject.spriteTableIdx                            ;81A4A7|85A1    |0000A1;
    LDY.W #$0008                                               ;81A4A9|A00800  |      ;
    STA.B [ptrUnknown0x07],Y                                   ;81A4AC|9707    |000007;
    JSL.L fObject_Unknown858100                                ;81A4AE|22008185|858100;
 
.caseFFFD:
    REP #$30                                                   ;81A4B2|C230    |      ;
    PLX                                                        ;81A4B4|FA      |      ;
    LDA.B ptrUnknown0x07                                       ;81A4B5|A507    |000007;
    CLC                                                        ;81A4B7|18      |      ;
    ADC.W #$0010                                               ;81A4B8|691000  |      ;
    STA.B ptrUnknown0x07                                       ;81A4BB|8507    |000007;
    INX                                                        ;81A4BD|E8      |      ;
    CPX.W #$000A                                               ;81A4BE|E00A00  |      ;
    BEQ +                                                      ;81A4C1|F003    |81A4C6;
    JMP.W .loop                                                ;81A4C3|4C93A3  |81A393;
 
 
  + RTL                                                        ;81A4C6|6B      |      ;
 
 
fUnknown_Zero07Ptr:
    REP #$30                                                   ;81A4C7|C230    |      ;
    LDA.W #$B4E6                                               ;81A4C9|A9E6B4  |      ;
    STA.B ptrUnknown0x07                                       ;81A4CC|8507    |000007;
    SEP #$20                                                   ;81A4CE|E220    |      ;
    LDA.B #$7E                                                 ;81A4D0|A97E    |      ;
    STA.B ptrUnknown0x07+2                                     ;81A4D2|8509    |000009;
    LDX.W #$0000                                               ;81A4D4|A20000  |      ;
 
  - SEP #$20                                                   ;81A4D7|E220    |      ;
    LDY.W #$0000                                               ;81A4D9|A00000  |      ;
    LDA.B #$00                                                 ;81A4DC|A900    |      ;
    STA.B [ptrUnknown0x07],Y                                   ;81A4DE|9707    |000007;
    REP #$20                                                   ;81A4E0|C220    |      ;
    LDA.B ptrUnknown0x07                                       ;81A4E2|A507    |000007;
    CLC                                                        ;81A4E4|18      |      ;
    ADC.W #$0010                                               ;81A4E5|691000  |      ;
    STA.B ptrUnknown0x07                                       ;81A4E8|8507    |000007;
    INX                                                        ;81A4EA|E8      |      ;
    CPX.W #$000A                                               ;81A4EB|E00A00  |      ;
    BNE -                                                      ;81A4EE|D0E7    |81A4D7;
    RTL                                                        ;81A4F0|6B      |      ;
 
 
fUnknown_81A4F1:
    SEP #$20                                                   ;81A4F1|E220    |      ;
    REP #$10                                                   ;81A4F3|C210    |      ;
    LDY.W #$0000                                               ;81A4F5|A00000  |      ;
    LDA.B #$00                                                 ;81A4F8|A900    |      ;
    STA.B [ptrUnknown0x07],Y                                   ;81A4FA|9707    |000007;
    STZ.W $0974                                                ;81A4FC|9C7409  |000974;
    RTL                                                        ;81A4FF|6B      |      ;
 
 
fUnknown_81A500:
    REP #$30                                                   ;81A500|C230    |      ;
    LDA.W #$B4E6                                               ;81A502|A9E6B4  |      ;
    STA.B ptrUnknown0x07                                       ;81A505|8507    |000007;
    SEP #$20                                                   ;81A507|E220    |      ;
    LDA.B #$7E                                                 ;81A509|A97E    |      ;
    STA.B ptrUnknown0x07+2                                     ;81A50B|8509    |000009;
    LDX.W #$0000                                               ;81A50D|A20000  |      ;
 
  - SEP #$20                                                   ;81A510|E220    |      ;
    LDA.B [ptrUnknown0x07]                                     ;81A512|A707    |000007;
    AND.B #$01                                                 ;81A514|2901    |      ;
    BEQ +                                                      ;81A516|F012    |81A52A;
    REP #$20                                                   ;81A518|C220    |      ;
    LDA.B ptrUnknown0x07                                       ;81A51A|A507    |000007;
    CLC                                                        ;81A51C|18      |      ;
    ADC.W #$0010                                               ;81A51D|691000  |      ;
    STA.B ptrUnknown0x07                                       ;81A520|8507    |000007;
    INX                                                        ;81A522|E8      |      ;
    CPX.W #$000A                                               ;81A523|E00A00  |      ;
    BNE -                                                      ;81A526|D0E8    |81A510;
 
.deadEnd:
    BRA .deadEnd                                               ;81A528|80FE    |81A528; infinite loop ? why ?
 
 
  + SEP #$20                                                   ;81A52A|E220    |      ;
    LDY.W #$0000                                               ;81A52C|A00000  |      ;
    LDA.W $0974                                                ;81A52F|AD7409  |000974;
    STA.B [ptrUnknown0x07],Y                                   ;81A532|9707    |000007;
    LDY.W #$0001                                               ;81A534|A00100  |      ;
    LDA.W $0975                                                ;81A537|AD7509  |000975;
    STA.B [ptrUnknown0x07],Y                                   ;81A53A|9707    |000007;
    LDY.W #$0002                                               ;81A53C|A00200  |      ;
    LDA.W $0976                                                ;81A53F|AD7609  |000976;
    STA.B [ptrUnknown0x07],Y                                   ;81A542|9707    |000007;
    LDY.W #$0003                                               ;81A544|A00300  |      ;
    LDA.W nCarriedItemId                                       ;81A547|AD8409  |000984;
    STA.B [ptrUnknown0x07],Y                                   ;81A54A|9707    |000007;
    REP #$20                                                   ;81A54C|C220    |      ;
    LDY.W #$0006                                               ;81A54E|A00600  |      ;
    LDA.W $097A                                                ;81A551|AD7A09  |00097A;
    STA.B [ptrUnknown0x07],Y                                   ;81A554|9707    |000007;
    LDY.W #$0008                                               ;81A556|A00800  |      ;
    STA.B [ptrUnknown0x07],Y                                   ;81A559|9707    |000007;
    STA.B strcObject.spriteTableIdx                            ;81A55B|85A1    |0000A1;
    LDY.W #$000A                                               ;81A55D|A00A00  |      ;
    LDA.W $097E                                                ;81A560|AD7E09  |00097E;
    STA.B [ptrUnknown0x07],Y                                   ;81A563|9707    |000007;
    STA.B strcObject.flip                                      ;81A565|859F    |00009F;
    LDY.W #$000C                                               ;81A567|A00C00  |      ;
    LDA.W nUnknownX                                            ;81A56A|AD8009  |000980;
    STA.B [ptrUnknown0x07],Y                                   ;81A56D|9707    |000007;
    STA.B strcObject.posX                                      ;81A56F|859B    |00009B;
    LDY.W #$000E                                               ;81A571|A00E00  |      ;
    LDA.W nUnknownY                                            ;81A574|AD8209  |000982;
    STA.B [ptrUnknown0x07],Y                                   ;81A577|9707    |000007;
    STA.B strcObject.posY                                      ;81A579|859D    |00009D;
    STZ.B strcObject.unkA3                                     ;81A57B|64A3    |0000A3;
    JSL.L fUnknown_858000                                      ;81A57D|22008085|858000;
    REP #$30                                                   ;81A581|C230    |      ;
    LDY.W #$0004                                               ;81A583|A00400  |      ;
    LDA.B strcObject.gameObjectIdx                             ;81A586|A5A5    |0000A5;
    STA.B [ptrUnknown0x07],Y                                   ;81A588|9707    |000007;
    RTL                                                        ;81A58A|6B      |      ;
 
 
pSubrutineTable_81A58B:
    dw $FFFF                                                   ;81A58B|        |      ;
    dw subUnknown81A58B_0x01                                   ;81A58D|        |81809A;
 
fUnknownCF_81A58F:
    SEP #$20                                                   ;81A58F|E220    |      ;
    REP #$10                                                   ;81A591|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;81A593|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;81A597|C903    |      ;
    BNE .return                                                ;81A599|D045    |81A5E0;
    LDA.B strcMap.loadAreaId                                   ;81A59B|A522    |000022;
    CMP.B #$04                                                 ;81A59D|C904    |      ;
    BCC +                                                      ;81A59F|9008    |81A5A9;
    CMP.B #$10                                                 ;81A5A1|C910    |      ;
    BCC .return                                                ;81A5A3|903B    |81A5E0;
    CMP.B #$15                                                 ;81A5A5|C915    |      ;
    BCS .return                                                ;81A5A7|B037    |81A5E0;
 
  + REP #$30                                                   ;81A5A9|C230    |      ;
    LDA.W #$0000                                               ;81A5AB|A90000  |      ;
    LDX.W strcObjectData.playerX                               ;81A5AE|AE0709  |000907;
    LDY.W strcObjectData.playerY                               ;81A5B1|AC0909  |000909;
    JSL.L fUnknown_82AC61                                      ;81A5B4|2261AC82|82AC61;
    REP #$30                                                   ;81A5B8|C230    |      ;
    TXA                                                        ;81A5BA|8A      |      ;
    CMP.W #$0001                                               ;81A5BB|C90100  |      ;
    BEQ +                                                      ;81A5BE|F011    |81A5D1;
    CMP.W #$0002                                               ;81A5C0|C90200  |      ;
    BEQ +                                                      ;81A5C3|F00C    |81A5D1;
    CMP.W #$00A8                                               ;81A5C5|C9A800  |      ;
    BEQ +                                                      ;81A5C8|F007    |81A5D1;
    CMP.W #$00F6                                               ;81A5CA|C9F600  |      ;
    BEQ +                                                      ;81A5CD|F002    |81A5D1;
    BRA .return                                                ;81A5CF|800F    |81A5E0;
 
 
  + REP #$30                                                   ;81A5D1|C230    |      ;
    LDA.W #$0011                                               ;81A5D3|A91100  |      ;
    LDX.W strcObjectData.playerX                               ;81A5D6|AE0709  |000907;
    LDY.W strcObjectData.playerY                               ;81A5D9|AC0909  |000909;
    JSL.L fUnknown_81A6C1                                      ;81A5DC|22C1A681|81A6C1;
 
.return:
    RTL                                                        ;81A5E0|6B      |      ;
 
 
fUnknownCF_SetPointer:
    REP #$30                                                   ;81A5E1|C230    |      ; A: nIndex
    STA.B strcVariables.n16Temp1                               ;81A5E3|857E    |00007E;
    ASL A                                                      ;81A5E5|0A      |      ;
    CLC                                                        ;81A5E6|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81A5E7|657E    |00007E;
    TAX                                                        ;81A5E9|AA      |      ;
    LDA.L pTable_81B963,X                                      ;81A5EA|BF63B981|81B963;
    STA.B ptrUnknown0xCF                                       ;81A5EE|85CF    |0000CF;
    INX                                                        ;81A5F0|E8      |      ;
    INX                                                        ;81A5F1|E8      |      ;
    SEP #$20                                                   ;81A5F2|E220    |      ;
    LDA.L pTable_81B963,X                                      ;81A5F4|BF63B981|81B963;
    STA.B ptrUnknown0xCF+2                                     ;81A5F8|85D1    |0000D1;
    SEP #$20                                                   ;81A5FA|E220    |      ;
    STZ.W $0989                                                ;81A5FC|9C8909  |000989;
    RTL                                                        ;81A5FF|6B      |      ;
 
 
fUnknownCF_81A600:
    REP #$30                                                   ;81A600|C230    |      ;
    LDA.B ptrUnknown0xCF                                       ;81A602|A5CF    |0000CF;
    BNE +                                                      ;81A604|D008    |81A60E;
    SEP #$20                                                   ;81A606|E220    |      ;
    LDA.B ptrUnknown0xCF+2                                     ;81A608|A5D1    |0000D1;
    BNE +                                                      ;81A60A|D002    |81A60E;
    BRA .return                                                ;81A60C|804E    |81A65C;
 
 
  + SEP #$20                                                   ;81A60E|E220    |      ;
    LDA.W $0989                                                ;81A610|AD8909  |000989;
    BNE .dec                                                   ;81A613|D044    |81A659;
    REP #$20                                                   ;81A615|C220    |      ;
    LDA.B [ptrUnknown0xCF]                                     ;81A617|A7CF    |0000CF;
    CMP.W #$FFFF                                               ;81A619|C9FFFF  |      ;
    BNE +                                                      ;81A61C|D003    |81A621;
    JMP.W .dataEnd                                             ;81A61E|4C5DA6  |81A65D;
 
 
  + CMP.W #$FFFE                                               ;81A621|C9FEFF  |      ;
    BNE .loop                                                  ;81A624|D003    |81A629;
    JMP.W .readFFFEPointer                                     ;81A626|4C67A6  |81A667;
 
 
.loop:
    REP #$20                                                   ;81A629|C220    |      ;
    LDY.W #$0000                                               ;81A62B|A00000  |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A62E|B7CF    |0000CF;
    PHA                                                        ;81A630|48      |      ;
    INY                                                        ;81A631|C8      |      ;
    INY                                                        ;81A632|C8      |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A633|B7CF    |0000CF;
    PHA                                                        ;81A635|48      |      ;
    INY                                                        ;81A636|C8      |      ;
    INY                                                        ;81A637|C8      |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A638|B7CF    |0000CF;
    PHA                                                        ;81A63A|48      |      ;
    SEP #$20                                                   ;81A63B|E220    |      ;
    INY                                                        ;81A63D|C8      |      ;
    INY                                                        ;81A63E|C8      |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A63F|B7CF    |0000CF;
    STA.W $0989                                                ;81A641|8D8909  |000989;
    REP #$20                                                   ;81A644|C220    |      ;
    PLY                                                        ;81A646|7A      |      ;
    PLX                                                        ;81A647|FA      |      ;
    PLA                                                        ;81A648|68      |      ;
    JSL.L fSetTileAtCoords                                     ;81A649|2288A681|81A688;
    REP #$30                                                   ;81A64D|C230    |      ;
    LDA.B ptrUnknown0xCF                                       ;81A64F|A5CF    |0000CF;
    CLC                                                        ;81A651|18      |      ;
    ADC.W #$0007                                               ;81A652|690700  |      ;
    STA.B ptrUnknown0xCF                                       ;81A655|85CF    |0000CF;
    BRA .return                                                ;81A657|8003    |81A65C;
 
 
.dec:
    DEC.W $0989                                                ;81A659|CE8909  |000989;
 
.return:
    RTL                                                        ;81A65C|6B      |      ;
 
 
.dataEnd:
    REP #$30                                                   ;81A65D|C230    |      ;
    STZ.B ptrUnknown0xCF                                       ;81A65F|64CF    |0000CF;
    SEP #$20                                                   ;81A661|E220    |      ;
    STZ.B ptrUnknown0xCF+2                                     ;81A663|64D1    |0000D1;
    BRA .return                                                ;81A665|80F5    |81A65C;
 
 
.readFFFEPointer:
    REP #$30                                                   ;81A667|C230    |      ;
    LDY.W #$0000                                               ;81A669|A00000  |      ;
    INY                                                        ;81A66C|C8      |      ;
    INY                                                        ;81A66D|C8      |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A66E|B7CF    |0000CF;
    STA.B ptrTemp0x72                                          ;81A670|8572    |000072;
    INY                                                        ;81A672|C8      |      ;
    INY                                                        ;81A673|C8      |      ;
    SEP #$20                                                   ;81A674|E220    |      ;
    LDA.B [ptrUnknown0xCF],Y                                   ;81A676|B7CF    |0000CF;
    STA.B ptrTemp0x72+2                                        ;81A678|8574    |000074;
    REP #$20                                                   ;81A67A|C220    |      ;
    LDA.B ptrTemp0x72                                          ;81A67C|A572    |000072;
    STA.B ptrUnknown0xCF                                       ;81A67E|85CF    |0000CF;
    SEP #$20                                                   ;81A680|E220    |      ;
    LDA.B ptrTemp0x72+2                                        ;81A682|A574    |000074;
    STA.B ptrUnknown0xCF+2                                     ;81A684|85D1    |0000D1;
    BRA .loop                                                  ;81A686|80A1    |81A629;
 
 
fSetTileAtCoords:
    REP #$30                                                   ;81A688|C230    |      ; A: nArg1, X: nTileX, Y: nTileY
    CMP.W #$0000                                               ;81A68A|C90000  |      ;
    BNE +                                                      ;81A68D|D003    |81A692;
    JMP.W .return                                              ;81A68F|4CC0A6  |81A6C0;
 
 
  + PHY                                                        ;81A692|5A      |      ;
    PHX                                                        ;81A693|DA      |      ;
    PHA                                                        ;81A694|48      |      ;
    JSL.L fUnknown_81A6C1                                      ;81A695|22C1A681|81A6C1;
    REP #$30                                                   ;81A699|C230    |      ;
    PLA                                                        ;81A69B|68      |      ;
    PLX                                                        ;81A69C|FA      |      ;
    PLY                                                        ;81A69D|7A      |      ;
    PHY                                                        ;81A69E|5A      |      ;
    PHX                                                        ;81A69F|DA      |      ;
    PHA                                                        ;81A6A0|48      |      ;
    JSL.L fUnknown_81A83A                                      ;81A6A1|223AA881|81A83A;
    REP #$30                                                   ;81A6A5|C230    |      ;
    PLA                                                        ;81A6A7|68      |      ;
    JSL.L fUnknown_81A801                                      ;81A6A8|2201A881|81A801;
    REP #$30                                                   ;81A6AC|C230    |      ;
    PLX                                                        ;81A6AE|FA      |      ;
    PLY                                                        ;81A6AF|7A      |      ;
    LDA.B strcVariables.n16Temp2                               ;81A6B0|A580    |000080;
    STA.B strcVariables.n16Unk86                               ;81A6B2|8586    |000086;
    LDA.B strcVariables.n16Temp3                               ;81A6B4|A582    |000082;
    STA.B strcVariables.n16Unk88                               ;81A6B6|8588    |000088;
    LDA.B strcVariables.n16Temp4                               ;81A6B8|A584    |000084;
    BEQ .return                                                ;81A6BA|F004    |81A6C0;
    JSL.L fUnknown_82B060                                      ;81A6BC|2260B082|82B060;
 
.return:
    RTL                                                        ;81A6C0|6B      |      ;
 
 
fUnknown_81A6C1:
    REP #$30                                                   ;81A6C1|C230    |      ; A: nArg, X: nPosX, Y: nPosY
    PHA                                                        ;81A6C3|48      |      ;
    TXA                                                        ;81A6C4|8A      |      ;
    LSR A                                                      ;81A6C5|4A      |      ;
    LSR A                                                      ;81A6C6|4A      |      ;
    LSR A                                                      ;81A6C7|4A      |      ;
    LSR A                                                      ;81A6C8|4A      |      ;
    STA.B strcVariables.n16Temp1                               ;81A6C9|857E    |00007E;
    TYA                                                        ;81A6CB|98      |      ;
    LSR A                                                      ;81A6CC|4A      |      ;
    LSR A                                                      ;81A6CD|4A      |      ;
    LSR A                                                      ;81A6CE|4A      |      ;
    LSR A                                                      ;81A6CF|4A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A6D0|8580    |000080;
    LDA.W #$6000                                               ;81A6D2|A90060  |      ;
    STA.B strcVariables.n16Unk86                               ;81A6D5|8586    |000086;
    LDA.B strcVariables.n16Temp1                               ;81A6D7|A57E    |00007E;
    CMP.W #$0020                                               ;81A6D9|C92000  |      ;
    BCC +                                                      ;81A6DC|9004    |81A6E2;
    SEC                                                        ;81A6DE|38      |      ;
    SBC.W #$0020                                               ;81A6DF|E92000  |      ;
 
  + ASL A                                                      ;81A6E2|0A      |      ;
    CLC                                                        ;81A6E3|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;81A6E4|6586    |000086;
    STA.B strcVariables.n16Unk86                               ;81A6E6|8586    |000086;
    LDA.B strcVariables.n16Temp1                               ;81A6E8|A57E    |00007E;
    CMP.W #$0010                                               ;81A6EA|C91000  |      ;
    BCC .label2                                                ;81A6ED|9012    |81A701;
    CMP.W #$0020                                               ;81A6EF|C92000  |      ;
    BCC .label1                                                ;81A6F2|9005    |81A6F9;
    CMP.W #$0030                                               ;81A6F4|C93000  |      ;
    BCC .label2                                                ;81A6F7|9008    |81A701;
 
.label1:
    LDA.B strcVariables.n16Unk86                               ;81A6F9|A586    |000086;
    CLC                                                        ;81A6FB|18      |      ;
    ADC.W #$03E0                                               ;81A6FC|69E003  |      ;
    STA.B strcVariables.n16Unk86                               ;81A6FF|8586    |000086;
 
.label2:
    LDA.B strcVariables.n16Temp2                               ;81A701|A580    |000080;
    CMP.W #$0020                                               ;81A703|C92000  |      ;
    BCC .label3                                                ;81A706|9004    |81A70C;
    SEC                                                        ;81A708|38      |      ;
    SBC.W #$0020                                               ;81A709|E92000  |      ;
 
.label3:
    ASL A                                                      ;81A70C|0A      |      ;
    ASL A                                                      ;81A70D|0A      |      ;
    ASL A                                                      ;81A70E|0A      |      ;
    ASL A                                                      ;81A70F|0A      |      ;
    ASL A                                                      ;81A710|0A      |      ;
    ASL A                                                      ;81A711|0A      |      ;
    CLC                                                        ;81A712|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;81A713|6586    |000086;
    STA.B strcVariables.n16Unk86                               ;81A715|8586    |000086;
    LDA.B strcVariables.n16Temp2                               ;81A717|A580    |000080;
    CMP.W #$0010                                               ;81A719|C91000  |      ;
    BCC .label5                                                ;81A71C|9012    |81A730;
    CMP.W #$0020                                               ;81A71E|C92000  |      ;
    BCC .label4                                                ;81A721|9005    |81A728;
    CMP.W #$0030                                               ;81A723|C93000  |      ;
    BCC .label5                                                ;81A726|9008    |81A730;
 
.label4:
    LDA.B strcVariables.n16Unk86                               ;81A728|A586    |000086;
    CLC                                                        ;81A72A|18      |      ;
    ADC.W #$0400                                               ;81A72B|690004  |      ;
    STA.B strcVariables.n16Unk86                               ;81A72E|8586    |000086;
 
.label5:
    REP #$20                                                   ;81A730|C220    |      ;
    LDA.W #$A096                                               ;81A732|A996A0  |      ;
    STA.B ptrTemp0x72                                          ;81A735|8572    |000072;
    STA.B ptrUnknown0x75                                       ;81A737|8575    |000075;
    SEP #$20                                                   ;81A739|E220    |      ;
    LDA.B #$A6                                                 ;81A73B|A9A6    |      ;
    STA.B ptrTemp0x72+2                                        ;81A73D|8574    |000074;
    STA.B ptrUnknown0x75+2                                     ;81A73F|8577    |000077;
    REP #$20                                                   ;81A741|C220    |      ;
    PLA                                                        ;81A743|68      |      ;
    JSL.L fUnknown_81A801                                      ;81A744|2201A881|81A801;
    REP #$20                                                   ;81A748|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;81A74A|A580    |000080;
    ASL A                                                      ;81A74C|0A      |      ;
    ASL A                                                      ;81A74D|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A74E|8580    |000080;
    LDA.B strcVariables.n16Temp3                               ;81A750|A582    |000082;
    ASL A                                                      ;81A752|0A      |      ;
    STA.B strcVariables.n16Temp3                               ;81A753|8582    |000082;
    LDA.B ptrTemp0x72                                          ;81A755|A572    |000072;
    CLC                                                        ;81A757|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81A758|657E    |00007E;
    STA.B ptrTemp0x72                                          ;81A75A|8572    |000072;
    STA.B ptrUnknown0x75                                       ;81A75C|8575    |000075;
    SEP #$20                                                   ;81A75E|E220    |      ;
    LDA.B #$02                                                 ;81A760|A902    |      ;
    STA.B strcVariables.n8Temp1                                ;81A762|8592    |000092;
    LDX.W #$0000                                               ;81A764|A20000  |      ;
 
.loop:
    PHX                                                        ;81A767|DA      |      ;
    SEP #$20                                                   ;81A768|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;81A76A|A592    |000092;
    STA.B strcSystem.arrayIndex                                ;81A76C|8527    |000027;
    LDA.B #$18                                                 ;81A76E|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;81A770|8529    |000029;
    REP #$20                                                   ;81A772|C220    |      ;
    LDY.B strcVariables.n16Temp2                               ;81A774|A480    |000080;
    TXA                                                        ;81A776|8A      |      ;
    ASL A                                                      ;81A777|0A      |      ;
    ASL A                                                      ;81A778|0A      |      ;
    ASL A                                                      ;81A779|0A      |      ;
    ASL A                                                      ;81A77A|0A      |      ;
    ASL A                                                      ;81A77B|0A      |      ;
    CLC                                                        ;81A77C|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;81A77D|6586    |000086;
    TAX                                                        ;81A77F|AA      |      ;
    REP #$20                                                   ;81A780|C220    |      ;
    LDA.W #$0080                                               ;81A782|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;81A785|22338A80|808A33;
    REP #$20                                                   ;81A789|C220    |      ;
    LDA.B ptrTemp0x72                                          ;81A78B|A572    |000072;
    CLC                                                        ;81A78D|18      |      ;
    ADC.W #$0040                                               ;81A78E|694000  |      ;
    STA.B ptrTemp0x72                                          ;81A791|8572    |000072;
    PLX                                                        ;81A793|FA      |      ;
    INX                                                        ;81A794|E8      |      ;
    PHX                                                        ;81A795|DA      |      ;
    SEP #$20                                                   ;81A796|E220    |      ;
    LDA.B strcVariables.n8Temp1                                ;81A798|A592    |000092;
    INC A                                                      ;81A79A|1A      |      ;
    STA.B strcSystem.arrayIndex                                ;81A79B|8527    |000027;
    LDA.B #$18                                                 ;81A79D|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;81A79F|8529    |000029;
    REP #$20                                                   ;81A7A1|C220    |      ;
    LDY.B strcVariables.n16Temp2                               ;81A7A3|A480    |000080;
    TXA                                                        ;81A7A5|8A      |      ;
    ASL A                                                      ;81A7A6|0A      |      ;
    ASL A                                                      ;81A7A7|0A      |      ;
    ASL A                                                      ;81A7A8|0A      |      ;
    ASL A                                                      ;81A7A9|0A      |      ;
    ASL A                                                      ;81A7AA|0A      |      ;
    CLC                                                        ;81A7AB|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;81A7AC|6586    |000086;
    TAX                                                        ;81A7AE|AA      |      ;
    REP #$20                                                   ;81A7AF|C220    |      ;
    LDA.W #$0080                                               ;81A7B1|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;81A7B4|22338A80|808A33;
    REP #$20                                                   ;81A7B8|C220    |      ;
    LDA.B ptrUnknown0x75                                       ;81A7BA|A575    |000075;
    CLC                                                        ;81A7BC|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;81A7BD|6580    |000080;
    STA.B ptrUnknown0x75                                       ;81A7BF|8575    |000075;
    STA.B ptrTemp0x72                                          ;81A7C1|8572    |000072;
    SEP #$20                                                   ;81A7C3|E220    |      ;
    STZ.B strcVariables.n8Temp1                                ;81A7C5|6492    |000092;
    PLX                                                        ;81A7C7|FA      |      ;
    INX                                                        ;81A7C8|E8      |      ;
    CPX.B strcVariables.n16Temp3                               ;81A7C9|E482    |000082;
    BNE .loop                                                  ;81A7CB|D09A    |81A767;
    RTL                                                        ;81A7CD|6B      |      ;
 
 
fUnknown_81A7CE:
    REP #$30                                                   ;81A7CE|C230    |      ; A: nArg1, X: nArg2, Y: nArg3
    PHY                                                        ;81A7D0|5A      |      ;
    PHX                                                        ;81A7D1|DA      |      ;
    PHA                                                        ;81A7D2|48      |      ;
    JSL.L fUnknown_81A801                                      ;81A7D3|2201A881|81A801;
    REP #$30                                                   ;81A7D7|C230    |      ;
    PLA                                                        ;81A7D9|68      |      ;
    PLX                                                        ;81A7DA|FA      |      ;
    PLY                                                        ;81A7DB|7A      |      ;
    PHY                                                        ;81A7DC|5A      |      ;
    PHX                                                        ;81A7DD|DA      |      ;
    PHA                                                        ;81A7DE|48      |      ;
    JSL.L fUnknown_81A83A                                      ;81A7DF|223AA881|81A83A;
    REP #$30                                                   ;81A7E3|C230    |      ;
    PLA                                                        ;81A7E5|68      |      ;
    JSL.L fUnknown_81A801                                      ;81A7E6|2201A881|81A801;
    REP #$30                                                   ;81A7EA|C230    |      ;
    PLX                                                        ;81A7EC|FA      |      ;
    PLY                                                        ;81A7ED|7A      |      ;
    LDA.B strcVariables.n16Temp2                               ;81A7EE|A580    |000080;
    STA.B strcVariables.n16Unk86                               ;81A7F0|8586    |000086;
    LDA.B strcVariables.n16Temp3                               ;81A7F2|A582    |000082;
    STA.B strcVariables.n16Unk88                               ;81A7F4|8588    |000088;
    LDA.B strcVariables.n16Temp4                               ;81A7F6|A584    |000084;
    BEQ +                                                      ;81A7F8|F006    |81A800;
    SEP #$20                                                   ;81A7FA|E220    |      ;
    JSL.L fUnknown_82B060                                      ;81A7FC|2260B082|82B060;
 
  + RTL                                                        ;81A800|6B      |      ;
 
 
fUnknown_81A801:
    REP #$30                                                   ;81A801|C230    |      ; A: nIndex, return $7E, $82, $80, $84
    STA.B strcVariables.n16Temp1                               ;81A803|857E    |00007E;
    ASL A                                                      ;81A805|0A      |      ;
    ASL A                                                      ;81A806|0A      |      ;
    CLC                                                        ;81A807|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81A808|657E    |00007E;
    ADC.B strcVariables.n16Temp1                               ;81A80A|657E    |00007E;
    TAX                                                        ;81A80C|AA      |      ;
    LDA.L Table_81B363,X                                       ;81A80D|BF63B381|81B363; index = A * 6 + 0
    STA.B strcVariables.n16Temp1                               ;81A811|857E    |00007E;
    INX                                                        ;81A813|E8      |      ;
    INX                                                        ;81A814|E8      |      ;
    SEP #$20                                                   ;81A815|E220    |      ;
    LDA.L Table_81B363,X                                       ;81A817|BF63B381|81B363; index = A * 6 + 2
    XBA                                                        ;81A81B|EB      |      ;
    LDA.B #$00                                                 ;81A81C|A900    |      ;
    XBA                                                        ;81A81E|EB      |      ;
    REP #$20                                                   ;81A81F|C220    |      ;
    STA.B strcVariables.n16Temp3                               ;81A821|8582    |000082;
    INX                                                        ;81A823|E8      |      ;
    SEP #$20                                                   ;81A824|E220    |      ;
    LDA.L Table_81B363,X                                       ;81A826|BF63B381|81B363; index = A * 6 + 3
    XBA                                                        ;81A82A|EB      |      ;
    LDA.B #$00                                                 ;81A82B|A900    |      ;
    XBA                                                        ;81A82D|EB      |      ;
    REP #$20                                                   ;81A82E|C220    |      ;
    STA.B strcVariables.n16Temp2                               ;81A830|8580    |000080;
    INX                                                        ;81A832|E8      |      ;
    LDA.L Table_81B363,X                                       ;81A833|BF63B381|81B363; index = A * 6 + 4
    STA.B strcVariables.n16Temp4                               ;81A837|8584    |000084;
    RTL                                                        ;81A839|6B      |      ;
 
 
fUnknown_81A83A:
    REP #$30                                                   ;81A83A|C230    |      ; A: nIndex
    PHA                                                        ;81A83C|48      |      ;
    TXA                                                        ;81A83D|8A      |      ;
    LSR A                                                      ;81A83E|4A      |      ;
    LSR A                                                      ;81A83F|4A      |      ;
    LSR A                                                      ;81A840|4A      |      ;
    LSR A                                                      ;81A841|4A      |      ;
    ASL A                                                      ;81A842|0A      |      ;
    ASL A                                                      ;81A843|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81A844|857E    |00007E;
    TYA                                                        ;81A846|98      |      ;
    LSR A                                                      ;81A847|4A      |      ;
    LSR A                                                      ;81A848|4A      |      ;
    LSR A                                                      ;81A849|4A      |      ;
    LSR A                                                      ;81A84A|4A      |      ;
    ASL A                                                      ;81A84B|0A      |      ;
    ASL A                                                      ;81A84C|0A      |      ;
    ASL A                                                      ;81A84D|0A      |      ;
    ASL A                                                      ;81A84E|0A      |      ;
    ASL A                                                      ;81A84F|0A      |      ;
    ASL A                                                      ;81A850|0A      |      ;
    ASL A                                                      ;81A851|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A852|8580    |000080;
    LDA.W #$0040                                               ;81A854|A94000  |      ;
    STA.B strcVariables.n16Unk88                               ;81A857|8588    |000088;
    SEP #$20                                                   ;81A859|E220    |      ;
    LDA.W strcDialogDisplay.mapMultiWidth                      ;81A85B|AD8101  |000181;
    CMP.B #$01                                                 ;81A85E|C901    |      ;
    BEQ +                                                      ;81A860|F01B    |81A87D;
    REP #$20                                                   ;81A862|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;81A864|A580    |000080;
    ASL A                                                      ;81A866|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A867|8580    |000080;
    ASL.B strcVariables.n16Unk88                               ;81A869|0688    |000088;
    SEP #$20                                                   ;81A86B|E220    |      ;
    LDA.W strcDialogDisplay.mapMultiWidth                      ;81A86D|AD8101  |000181;
    CMP.B #$02                                                 ;81A870|C902    |      ;
    BEQ +                                                      ;81A872|F009    |81A87D;
    REP #$20                                                   ;81A874|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;81A876|A580    |000080;
    ASL A                                                      ;81A878|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A879|8580    |000080;
    ASL.B strcVariables.n16Unk88                               ;81A87B|0688    |000088;
 
  + REP #$30                                                   ;81A87D|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;81A87F|A57E    |00007E;
    CLC                                                        ;81A881|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;81A882|6580    |000080;
    STA.B strcVariables.n16Unk86                               ;81A884|8586    |000086;
    PLA                                                        ;81A886|68      |      ;
    JSL.L fUnknown_81A801                                      ;81A887|2201A881|81A801;
    REP #$20                                                   ;81A88B|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;81A88D|A580    |000080;
    ASL A                                                      ;81A88F|0A      |      ;
    ASL A                                                      ;81A890|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81A891|8580    |000080;
    REP #$20                                                   ;81A893|C220    |      ;
    LDA.W #$A096                                               ;81A895|A996A0  |      ;
    CLC                                                        ;81A898|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81A899|657E    |00007E;
    STA.B ptrTemp0x72                                          ;81A89B|8572    |000072;
    STA.B ptrObjectData                                        ;81A89D|8578    |000078;
    SEP #$20                                                   ;81A89F|E220    |      ;
    LDA.B #$A6                                                 ;81A8A1|A9A6    |      ;
    STA.B ptrTemp0x72+2                                        ;81A8A3|8574    |000074;
    STA.B ptrObjectData+2                                      ;81A8A5|857A    |00007A;
    REP #$20                                                   ;81A8A7|C220    |      ;
    LDA.W #$2000                                               ;81A8A9|A90020  |      ;
    CLC                                                        ;81A8AC|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;81A8AD|6586    |000086;
    STA.B ptrUnknown0x75                                       ;81A8AF|8575    |000075;
    SEP #$20                                                   ;81A8B1|E220    |      ;
    LDA.B #$7E                                                 ;81A8B3|A97E    |      ;
    STA.B ptrUnknown0x75+2                                     ;81A8B5|8577    |000077;
    REP #$30                                                   ;81A8B7|C230    |      ;
    STZ.B strcVariables.n16Unk8E                               ;81A8B9|648E    |00008E;
    STZ.B strcVariables.n16Unk90                               ;81A8BB|6490    |000090;
    LDY.W #$0000                                               ;81A8BD|A00000  |      ;
 
--- PHY                                                        ;81A8C0|5A      |      ; outer loop
    LDA.W #$0000                                               ;81A8C1|A90000  |      ;
 
 -- PHA                                                        ;81A8C4|48      |      ; inner loop
    LDY.W #$0000                                               ;81A8C5|A00000  |      ;
    LDX.W #$0000                                               ;81A8C8|A20000  |      ;
    STZ.B strcVariables.n16Unk90                               ;81A8CB|6490    |000090;
 
  - LDA.B [ptrTemp0x72],Y                                      ;81A8CD|B772    |000072;
    PHY                                                        ;81A8CF|5A      |      ;
    TXY                                                        ;81A8D0|9B      |      ;
    STA.B [ptrUnknown0x75],Y                                   ;81A8D1|9775    |000075;
    PLY                                                        ;81A8D3|7A      |      ;
    INY                                                        ;81A8D4|C8      |      ;
    INY                                                        ;81A8D5|C8      |      ;
    INX                                                        ;81A8D6|E8      |      ;
    INX                                                        ;81A8D7|E8      |      ;
    PLA                                                        ;81A8D8|68      |      ;
    PHA                                                        ;81A8D9|48      |      ;
    CMP.W #$0000                                               ;81A8DA|C90000  |      ;
    BNE .label1                                                ;81A8DD|D010    |81A8EF;
    INC.B strcVariables.n16Unk90                               ;81A8DF|E690    |000090;
    INC.B strcVariables.n16Unk90                               ;81A8E1|E690    |000090;
    LDA.B strcVariables.n16Temp1                               ;81A8E3|A57E    |00007E;
    CLC                                                        ;81A8E5|18      |      ;
    ADC.B strcVariables.n16Unk90                               ;81A8E6|6590    |000090;
    AND.W #$0040                                               ;81A8E8|294000  |      ;
    BEQ .label3                                                ;81A8EB|F023    |81A910;
    BRA .label2                                                ;81A8ED|800E    |81A8FD;
 
 
.label1:
    INC.B strcVariables.n16Unk90                               ;81A8EF|E690    |000090;
    INC.B strcVariables.n16Unk90                               ;81A8F1|E690    |000090;
    LDA.B strcVariables.n16Temp1                               ;81A8F3|A57E    |00007E;
    CLC                                                        ;81A8F5|18      |      ;
    ADC.B strcVariables.n16Unk90                               ;81A8F6|6590    |000090;
    AND.W #$0040                                               ;81A8F8|294000  |      ;
    BEQ .label3                                                ;81A8FB|F013    |81A910;
 
.label2:
    LDA.W #$0040                                               ;81A8FD|A94000  |      ;
    STA.B strcVariables.n16Unk8E                               ;81A900|858E    |00008E;
    LDA.B strcVariables.n16Unk90                               ;81A902|A590    |000090;
    CLC                                                        ;81A904|18      |      ;
    ADC.W #$0040                                               ;81A905|694000  |      ;
    STA.B strcVariables.n16Unk90                               ;81A908|8590    |000090;
    TYA                                                        ;81A90A|98      |      ;
    CLC                                                        ;81A90B|18      |      ;
    ADC.W #$0040                                               ;81A90C|694000  |      ;
    TAY                                                        ;81A90F|A8      |      ;
 
.label3:
    CPX.B strcVariables.n16Temp2                               ;81A910|E480    |000080;
    BNE -                                                      ;81A912|D0B9    |81A8CD;
    LDA.B ptrTemp0x72                                          ;81A914|A572    |000072;
    CLC                                                        ;81A916|18      |      ;
    ADC.W #$0040                                               ;81A917|694000  |      ;
    STA.B ptrTemp0x72                                          ;81A91A|8572    |000072;
    LDA.B ptrUnknown0x75                                       ;81A91C|A575    |000075;
    CLC                                                        ;81A91E|18      |      ;
    ADC.B strcVariables.n16Unk88                               ;81A91F|6588    |000088;
    STA.B ptrUnknown0x75                                       ;81A921|8575    |000075;
    PLA                                                        ;81A923|68      |      ;
    INC A                                                      ;81A924|1A      |      ;
    CMP.W #$0002                                               ;81A925|C90200  |      ;
    BNE --                                                     ;81A928|D09A    |81A8C4;
    REP #$20                                                   ;81A92A|C220    |      ;
    LDA.B ptrObjectData                                        ;81A92C|A578    |000078;
    CLC                                                        ;81A92E|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;81A92F|6580    |000080;
    ADC.B strcVariables.n16Unk8E                               ;81A931|658E    |00008E;
    STA.B ptrObjectData                                        ;81A933|8578    |000078;
    STA.B ptrTemp0x72                                          ;81A935|8572    |000072;
    STZ.B strcVariables.n16Unk8E                               ;81A937|648E    |00008E;
    LDA.B strcVariables.n16Temp1                               ;81A939|A57E    |00007E;
    CLC                                                        ;81A93B|18      |      ;
    ADC.B strcVariables.n16Unk90                               ;81A93C|6590    |000090;
    STA.B strcVariables.n16Temp1                               ;81A93E|857E    |00007E;
    PLY                                                        ;81A940|7A      |      ;
    INY                                                        ;81A941|C8      |      ;
    CPY.B strcVariables.n16Temp3                               ;81A942|C482    |000082;
    BEQ +                                                      ;81A944|F003    |81A949;
    JMP.W $A8C0                                                ;81A946|4CC0A8  |81A8C0;
 
 
  + RTL                                                        ;81A949|6B      |      ;
 
 
fUnknown_81A94A:
    SEP #$20                                                   ;81A94A|E220    |      ;
    REP #$10                                                   ;81A94C|C210    |      ;
    LDA.W strcPlayerData.toolSecond                            ;81A94E|AD2309  |000923;
    BNE +                                                      ;81A951|D003    |81A956;
    JMP.W .return                                              ;81A953|4CE4A9  |81A9E4;
 
 
  + LDA.W strcPlayerData.toolEquipped                          ;81A956|AD2109  |000921;
    BEQ .label5                                                ;81A959|F053    |81A9AE;
    CMP.B #$19                                                 ;81A95B|C919    |      ;
    BCC .label3                                                ;81A95D|901A    |81A979;
    CMP.B #$19                                                 ;81A95F|C919    |      ;
    BEQ .label2                                                ;81A961|F00B    |81A96E;
    SEP #$20                                                   ;81A963|E220    |      ;
    LDA.W strcMap.loadAreaId                                   ;81A965|AD2200  |000022;
    CMP.B #$27                                                 ;81A968|C927    |      ;
    BNE .label5                                                ;81A96A|D042    |81A9AE;
    BRA .label4                                                ;81A96C|8014    |81A982;
 
 
.label2:
    SEP #$20                                                   ;81A96E|E220    |      ;
    LDA.W strcMap.loadAreaId                                   ;81A970|AD2200  |000022;
    CMP.B #$28                                                 ;81A973|C928    |      ;
    BNE .label5                                                ;81A975|D037    |81A9AE;
    BRA .label4                                                ;81A977|8009    |81A982;
 
 
.label3:
    SEP #$20                                                   ;81A979|E220    |      ;
    LDA.W strcMap.loadAreaId                                   ;81A97B|AD2200  |000022;
    CMP.B #$26                                                 ;81A97E|C926    |      ;
    BNE .label5                                                ;81A980|D02C    |81A9AE;
 
.label4:
    SEP #$20                                                   ;81A982|E220    |      ;
    REP #$10                                                   ;81A984|C210    |      ;
    LDA.B #$00                                                 ;81A986|A900    |      ;
    XBA                                                        ;81A988|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81A989|AD2109  |000921;
    REP #$20                                                   ;81A98C|C220    |      ;
    ASL A                                                      ;81A98E|0A      |      ;
    ASL A                                                      ;81A98F|0A      |      ;
    ASL A                                                      ;81A990|0A      |      ;
    TAX                                                        ;81A991|AA      |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;81A992|BF0FBE81|81BE0F;
    PHA                                                        ;81A996|48      |      ;
    INX                                                        ;81A997|E8      |      ;
    INX                                                        ;81A998|E8      |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;81A999|BF0FBE81|81BE0F;
    PHA                                                        ;81A99D|48      |      ;
    INX                                                        ;81A99E|E8      |      ;
    INX                                                        ;81A99F|E8      |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;81A9A0|BF0FBE81|81BE0F;
    PLY                                                        ;81A9A4|7A      |      ;
    PLX                                                        ;81A9A5|FA      |      ;
    JSL.L fSetTileAtCoords                                     ;81A9A6|2288A681|81A688;
    JSL.L fCore_StartTransfer                                  ;81A9AA|22F08A80|808AF0;
 
.label5:
    SEP #$20                                                   ;81A9AE|E220    |      ;
    REP #$10                                                   ;81A9B0|C210    |      ;
    LDA.B #$00                                                 ;81A9B2|A900    |      ;
    XBA                                                        ;81A9B4|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81A9B5|AD2109  |000921;
    REP #$20                                                   ;81A9B8|C220    |      ;
    ASL A                                                      ;81A9BA|0A      |      ;
    ASL A                                                      ;81A9BB|0A      |      ;
    ASL A                                                      ;81A9BC|0A      |      ;
    TAX                                                        ;81A9BD|AA      |      ;
    INX                                                        ;81A9BE|E8      |      ;
    INX                                                        ;81A9BF|E8      |      ;
    INX                                                        ;81A9C0|E8      |      ;
    INX                                                        ;81A9C1|E8      |      ;
    INX                                                        ;81A9C2|E8      |      ;
    INX                                                        ;81A9C3|E8      |      ;
    SEP #$20                                                   ;81A9C4|E220    |      ;
    LDA.B #$00                                                 ;81A9C6|A900    |      ;
    XBA                                                        ;81A9C8|EB      |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;81A9C9|BF0FBE81|81BE0F;
    REP #$20                                                   ;81A9CD|C220    |      ;
    TAY                                                        ;81A9CF|A8      |      ; A -> Y
    INX                                                        ;81A9D0|E8      |      ;
    SEP #$20                                                   ;81A9D1|E220    |      ;
    LDA.L nCarriedItemTable_81BE0F,X                           ;81A9D3|BF0FBE81|81BE0F;
    STA.B strcVariables.n8Temp1                                ;81A9D7|8592    |000092; A -> $92
    TYX                                                        ;81A9D9|BB      |      ;
    LDA.L strcShedItems.row1,X                                 ;81A9DA|BF001F7F|7F1F00;
    ORA.B strcVariables.n8Temp1                                ;81A9DE|0592    |000092;
    STA.L strcShedItems.row1,X                                 ;81A9E0|9F001F7F|7F1F00;
 
.return:
    RTL                                                        ;81A9E4|6B      |      ;
 
 
fItemSubrutineHandler_81A9E5:
    SEP #$20                                                   ;81A9E5|E220    |      ; $22: nItemId
    REP #$10                                                   ;81A9E7|C210    |      ;
    LDA.B #$00                                                 ;81A9E9|A900    |      ;
    XBA                                                        ;81A9EB|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;81A9EC|A522    |000022;
    REP #$20                                                   ;81A9EE|C220    |      ;
    ASL A                                                      ;81A9F0|0A      |      ;
    TAX                                                        ;81A9F1|AA      |      ;
    JSR.W (pItemSubrutines_81A9F6,X)                           ;81A9F2|FCF6A9  |81A9F6;
    RTL                                                        ;81A9F5|6B      |      ;
 
pItemSubrutines_81A9F6:
    dw fItemSub81A9F6_0x00to0x03                               ;81A9F6|        |81AAB6; 5F * ptr24
    dw fItemSub81A9F6_0x00to0x03                               ;81A9F8|        |81AAB6;
    dw fItemSub81A9F6_0x00to0x03                               ;81A9FA|        |81AAB6;
    dw fItemSub81A9F6_0x00to0x03                               ;81A9FC|        |81AAB6;
    dw fItemSub81A9F6_0x04to0x07                               ;81A9FE|        |81AC71;
    dw fItemSub81A9F6_0x04to0x07                               ;81AA00|        |81AC71;
    dw fItemSub81A9F6_0x04to0x07                               ;81AA02|        |81AC71;
    dw fItemSub81A9F6_0x04to0x07                               ;81AA04|        |81AC71;
    dw fItemSub81A9F6_0x08                                     ;81AA06|        |81AC78;
    dw fItemSub81A9F6_0x09                                     ;81AA08|        |81AC79;
    dw fItemSub81A9F6_0x0A                                     ;81AA0A|        |81AC7A;
    dw fItemSub81A9F6_0x0B                                     ;81AA0C|        |81AC7B;
    dw fItemSub81A9F6_0x0C                                     ;81AA0E|        |81AC7C;
    dw fItemSub81A9F6_0x0D                                     ;81AA10|        |81AC7D;
    dw fItemSub81A9F6_0x0E                                     ;81AA12|        |81AC7E;
    dw fItemSub81A9F6_0x0F                                     ;81AA14|        |81AC7F;
    dw fItemSub81A9F6_0x10to0x13                               ;81AA16|        |81AC80;
    dw fItemSub81A9F6_0x10to0x13                               ;81AA18|        |81AC80;
    dw fItemSub81A9F6_0x10to0x13                               ;81AA1A|        |81AC80;
    dw fItemSub81A9F6_0x10to0x13                               ;81AA1C|        |81AC80;
    dw fItemSub81A9F6_0x14                                     ;81AA1E|        |81ACCB;
    dw fItemSub81A9F6_0x15                                     ;81AA20|        |81ACCC;
    dw fItemSub81A9F6_0x16                                     ;81AA22|        |81AD23;
    dw fItemSub81A9F6_0x17                                     ;81AA24|        |81AD7A;
    dw fItemSub81A9F6_0x18                                     ;81AA26|        |81ADD1;
    dw fItemSub81A9F6_0x19                                     ;81AA28|        |81ADD2;
    dw fItemSub81A9F6_0x1A                                     ;81AA2A|        |81ADD3;
    dw fItemSub81A9F6_0x1B                                     ;81AA2C|        |81ADD4;
    dw fItemSub81A9F6_0x1C                                     ;81AA2E|        |81ADD5;
    dw fItemSub81A9F6_0x1D                                     ;81AA30|        |81AE6A;
    dw fItemSub81A9F6_0x1E                                     ;81AA32|        |81AE6B;
    dw fItemSub81A9F6_0x1F                                     ;81AA34|        |81AE6C;
    dw fItemSub81A9F6_0x20                                     ;81AA36|        |81AE6D;
    dw fItemSub81A9F6_0x21                                     ;81AA38|        |81AE6E;
    dw fItemSub81A9F6_0x22                                     ;81AA3A|        |81AE6F;
    dw fItemSub81A9F6_0x23                                     ;81AA3C|        |81AFBF;
    dw fItemSub81A9F6_0x24                                     ;81AA3E|        |81AFC0;
    dw fItemSub81A9F6_0x25                                     ;81AA40|        |81B063;
    dw fItemSub81A9F6_0x26                                     ;81AA42|        |81B064;
    dw fItemSub81A9F6_0x27                                     ;81AA44|        |81B0A8;
    dw fItemSub81A9F6_0x28                                     ;81AA46|        |81B121;
    dw fItemSub81A9F6_0x29                                     ;81AA48|        |81B1CF;
    dw fItemSub81A9F6_0x2A                                     ;81AA4A|        |81B21E;
    dw fItemSub81A9F6_0x2B                                     ;81AA4C|        |81B261;
    dw fItemSub81A9F6_0x2C                                     ;81AA4E|        |81B262;
    dw fItemSub81A9F6_0x2D                                     ;81AA50|        |81B263;
    dw fItemSub81A9F6_0x2E                                     ;81AA52|        |81B264;
    dw fItemSub81A9F6_0x2F                                     ;81AA54|        |81B265;
    dw fItemSub81A9F6_0x30                                     ;81AA56|        |81B266;
    dw fItemSub81A9F6_0x31                                     ;81AA58|        |81B267;
    dw fItemSub81A9F6_0x32                                     ;81AA5A|        |81B268;
    dw fItemSub81A9F6_0x33                                     ;81AA5C|        |81B269;
    dw fItemSub81A9F6_0x34                                     ;81AA5E|        |81B26A;
    dw fItemSub81A9F6_0x35                                     ;81AA60|        |81B26B;
    dw fItemSub81A9F6_0x36                                     ;81AA62|        |81B26C;
    dw fItemSub81A9F6_0x37                                     ;81AA64|        |81B26D;
    dw fItemSub81A9F6_0x38                                     ;81AA66|        |81B293;
    dw fItemSub81A9F6_0x39                                     ;81AA68|        |81B294;
    dw fItemSub81A9F6_0x3A                                     ;81AA6A|        |81B295;
    dw fItemSub81A9F6_0x3B                                     ;81AA6C|        |81B296;
    dw fItemSub81A9F6_0x3C                                     ;81AA6E|        |81B297;
    dw fItemSub81A9F6_0x3D                                     ;81AA70|        |81B298;
    dw fItemSub81A9F6_0x3E                                     ;81AA72|        |81B299;
    dw fItemSub81A9F6_0x3F                                     ;81AA74|        |81B29A;
    dw fItemSub81A9F6_0x40                                     ;81AA76|        |81B29B;
    dw fItemSub81A9F6_0x41                                     ;81AA78|        |81B29C;
    dw fItemSub81A9F6_0x42                                     ;81AA7A|        |81B29D;
    dw fItemSub81A9F6_0x43                                     ;81AA7C|        |81B29E;
    dw fItemSub81A9F6_0x44                                     ;81AA7E|        |81B29F;
    dw fItemSub81A9F6_0x45                                     ;81AA80|        |81B2A0;
    dw fItemSub81A9F6_0x46                                     ;81AA82|        |81B2A1;
    dw fItemSub81A9F6_0x47                                     ;81AA84|        |81B2A2;
    dw fItemSub81A9F6_0x48                                     ;81AA86|        |81B2A3;
    dw fItemSub81A9F6_0x49                                     ;81AA88|        |81B2A4;
    dw fItemSub81A9F6_0x4A                                     ;81AA8A|        |81B2A5;
    dw fItemSub81A9F6_0x4B                                     ;81AA8C|        |81B2A6;
    dw fItemSub81A9F6_0x4C                                     ;81AA8E|        |81B2A7;
    dw fItemSub81A9F6_0x4D                                     ;81AA90|        |81B2A8;
    dw fItemSub81A9F6_0x4E                                     ;81AA92|        |81B2A9;
    dw fItemSub81A9F6_0x4F                                     ;81AA94|        |81B2AA;
    dw fItemSub81A9F6_0x50                                     ;81AA96|        |81B2AB;
    dw fItemSub81A9F6_0x51                                     ;81AA98|        |81B2AC;
    dw fItemSub81A9F6_0x52                                     ;81AA9A|        |81B2AD;
    dw fItemSub81A9F6_0x53                                     ;81AA9C|        |81B2AE;
    dw fItemSub81A9F6_0x54                                     ;81AA9E|        |81B2AF;
    dw fItemSub81A9F6_0x55                                     ;81AAA0|        |81B2B0;
    dw fItemSub81A9F6_0x56                                     ;81AAA2|        |81B2B1;
    dw fItemSub81A9F6_0x57                                     ;81AAA4|        |81B2B2;
    dw fItemSub81A9F6_0x58                                     ;81AAA6|        |81B2B3;
    dw fItemSub81A9F6_0x59                                     ;81AAA8|        |81B2B4;
    dw fItemSub81A9F6_0x5A                                     ;81AAAA|        |81B2B5;
    dw fItemSub81A9F6_0x5B                                     ;81AAAC|        |81B2B6;
    dw fItemSub81A9F6_0x5C                                     ;81AAAE|        |81B2B7;
    dw fItemSub81A9F6_0x5D                                     ;81AAB0|        |81B2B8;
    dw fItemSub81A9F6_0x5E                                     ;81AAB2|        |81B2B9;
    dw fItemSub81A9F6_0x5F                                     ;81AAB4|        |81B2BA;
 
fItemSub81A9F6_0x00to0x03:
    REP #$30                                                   ;81AAB6|C230    |      ;
    %CheckFlag(event1, $0002)
    BEQ .label1                                                ;81AABF|F019    |81AADA;
    LDA.W #$0060                                               ;81AAC1|A96000  |      ;
    LDX.W #$0310                                               ;81AAC4|A21003  |      ;
    LDY.W #$0360                                               ;81AAC7|A06003  |      ;
    PHA                                                        ;81AACA|48      |      ;
    PHX                                                        ;81AACB|DA      |      ;
    PHY                                                        ;81AACC|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81AACD|22CEA781|81A7CE;
    REP #$30                                                   ;81AAD1|C230    |      ;
    PLY                                                        ;81AAD3|7A      |      ;
    PLX                                                        ;81AAD4|FA      |      ;
    PLA                                                        ;81AAD5|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81AAD6|22A7B082|82B0A7;
 
.label1:
    REP #$30                                                   ;81AADA|C230    |      ;
    %CheckFlag(event1, $0001)
    BEQ .label2                                                ;81AAE3|F019    |81AAFE;
    LDA.W #$005F                                               ;81AAE5|A95F00  |      ;
    LDX.W #$0240                                               ;81AAE8|A24002  |      ;
    LDY.W #$02F0                                               ;81AAEB|A0F002  |      ;
    PHA                                                        ;81AAEE|48      |      ;
    PHX                                                        ;81AAEF|DA      |      ;
    PHY                                                        ;81AAF0|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81AAF1|22CEA781|81A7CE;
    REP #$30                                                   ;81AAF5|C230    |      ;
    PLY                                                        ;81AAF7|7A      |      ;
    PLX                                                        ;81AAF8|FA      |      ;
    PLA                                                        ;81AAF9|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81AAFA|22A7B082|82B0A7;
 
.label2:
    REP #$30                                                   ;81AAFE|C230    |      ;
    %CheckFlag(event1, $0080)
    BEQ .label3                                                ;81AB07|F01D    |81AB26;
    REP #$30                                                   ;81AB09|C230    |      ;
    LDA.W #$0054                                               ;81AB0B|A95400  |      ;
    LDX.W #$0060                                               ;81AB0E|A26000  |      ;
    LDY.W #$0100                                               ;81AB11|A00001  |      ;
    PHA                                                        ;81AB14|48      |      ;
    PHX                                                        ;81AB15|DA      |      ;
    PHY                                                        ;81AB16|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81AB17|22CEA781|81A7CE;
    REP #$30                                                   ;81AB1B|C230    |      ;
    PLY                                                        ;81AB1D|7A      |      ;
    PLX                                                        ;81AB1E|FA      |      ;
    PLA                                                        ;81AB1F|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81AB20|22A7B082|82B0A7;
    BRA .label4                                                ;81AB24|8026    |81AB4C;
 
 
.label3:
    REP #$30                                                   ;81AB26|C230    |      ;
    %CheckFlag(event1, $0040)
    BEQ .label4                                                ;81AB2F|F01B    |81AB4C;
    REP #$30                                                   ;81AB31|C230    |      ;
    LDA.W #$0053                                               ;81AB33|A95300  |      ;
    LDX.W #$0060                                               ;81AB36|A26000  |      ;
    LDY.W #$0100                                               ;81AB39|A00001  |      ;
    PHA                                                        ;81AB3C|48      |      ;
    PHX                                                        ;81AB3D|DA      |      ;
    PHY                                                        ;81AB3E|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81AB3F|22CEA781|81A7CE;
    REP #$30                                                   ;81AB43|C230    |      ;
    PLY                                                        ;81AB45|7A      |      ;
    PLX                                                        ;81AB46|FA      |      ;
    PLA                                                        ;81AB47|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81AB48|22A7B082|82B0A7;
 
.label4:
    SEP #$20                                                   ;81AB4C|E220    |      ;
    REP #$10                                                   ;81AB4E|C210    |      ;
    LDA.L nPowerBerryEaten                                     ;81AB50|AF361F7F|7F1F36;
    BEQ .label5                                                ;81AB54|F03E    |81AB94;
    LDA.B #$00                                                 ;81AB56|A900    |      ;
 
.powerberry:
    SEP #$20                                                   ;81AB58|E220    |      ;
    REP #$10                                                   ;81AB5A|C210    |      ;
    PHA                                                        ;81AB5C|48      |      ;
    XBA                                                        ;81AB5D|EB      |      ;
    LDA.B #$00                                                 ;81AB5E|A900    |      ;
    XBA                                                        ;81AB60|EB      |      ;
    REP #$20                                                   ;81AB61|C220    |      ;
    ASL A                                                      ;81AB63|0A      |      ;
    ASL A                                                      ;81AB64|0A      |      ;
    TAX                                                        ;81AB65|AA      |      ;
    LDA.L nPowerBerryTable,X                                   ;81AB66|BF49AC81|81AC49;
    PHA                                                        ;81AB6A|48      |      ;
    INX                                                        ;81AB6B|E8      |      ;
    INX                                                        ;81AB6C|E8      |      ;
    LDA.L nPowerBerryTable,X                                   ;81AB6D|BF49AC81|81AC49;
    TAY                                                        ;81AB71|A8      |      ;
    PLX                                                        ;81AB72|FA      |      ;
    LDA.W #$0016                                               ;81AB73|A91600  |      ;
    PHA                                                        ;81AB76|48      |      ;
    PHX                                                        ;81AB77|DA      |      ;
    PHY                                                        ;81AB78|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81AB79|22CEA781|81A7CE;
    REP #$30                                                   ;81AB7D|C230    |      ;
    PLY                                                        ;81AB7F|7A      |      ;
    PLX                                                        ;81AB80|FA      |      ;
    PLA                                                        ;81AB81|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81AB82|22A7B082|82B0A7;
    SEP #$20                                                   ;81AB86|E220    |      ;
    REP #$10                                                   ;81AB88|C210    |      ;
    PLA                                                        ;81AB8A|68      |      ;
    CLC                                                        ;81AB8B|18      |      ;
    ADC.B #$01                                                 ;81AB8C|6901    |      ;
    CMP.L nPowerBerryEaten                                     ;81AB8E|CF361F7F|7F1F36;
    BNE .powerberry                                            ;81AB92|D0C4    |81AB58;
 
.label5:
    REP #$30                                                   ;81AB94|C230    |      ;
    %CheckFlag(event2, $0200)
    BEQ .label6                                                ;81AB9D|F019    |81ABB8;
    LDA.W #$0059                                               ;81AB9F|A95900  |      ;
    LDX.W #$0080                                               ;81ABA2|A28000  |      ;
    LDY.W #$0130                                               ;81ABA5|A03001  |      ;
    PHA                                                        ;81ABA8|48      |      ;
    PHX                                                        ;81ABA9|DA      |      ;
    PHY                                                        ;81ABAA|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81ABAB|22CEA781|81A7CE;
    REP #$30                                                   ;81ABAF|C230    |      ;
    PLY                                                        ;81ABB1|7A      |      ;
    PLX                                                        ;81ABB2|FA      |      ;
    PLA                                                        ;81ABB3|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81ABB4|22A7B082|82B0A7;
 
.label6:
    REP #$30                                                   ;81ABB8|C230    |      ;
    %CheckFlag(event2, $0400)
    BEQ .label7                                                ;81ABC1|F019    |81ABDC;
    LDA.W #$0058                                               ;81ABC3|A95800  |      ;
    LDX.W #$0060                                               ;81ABC6|A26000  |      ;
    LDY.W #$0130                                               ;81ABC9|A03001  |      ;
    PHA                                                        ;81ABCC|48      |      ;
    PHX                                                        ;81ABCD|DA      |      ;
    PHY                                                        ;81ABCE|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81ABCF|22CEA781|81A7CE;
    REP #$30                                                   ;81ABD3|C230    |      ;
    PLY                                                        ;81ABD5|7A      |      ;
    PLX                                                        ;81ABD6|FA      |      ;
    PLA                                                        ;81ABD7|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81ABD8|22A7B082|82B0A7;
 
.label7:
    REP #$30                                                   ;81ABDC|C230    |      ;
    %CheckFlag(event2, $0800)
    BEQ .label8                                                ;81ABE5|F019    |81AC00;
    LDA.W #$005A                                               ;81ABE7|A95A00  |      ;
    LDX.W #$0090                                               ;81ABEA|A29000  |      ;
    LDY.W #$0130                                               ;81ABED|A03001  |      ;
    PHA                                                        ;81ABF0|48      |      ;
    PHX                                                        ;81ABF1|DA      |      ;
    PHY                                                        ;81ABF2|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81ABF3|22CEA781|81A7CE;
    REP #$30                                                   ;81ABF7|C230    |      ;
    PLY                                                        ;81ABF9|7A      |      ;
    PLX                                                        ;81ABFA|FA      |      ;
    PLA                                                        ;81ABFB|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81ABFC|22A7B082|82B0A7;
 
.label8:
    REP #$30                                                   ;81AC00|C230    |      ;
    %CheckFlag(event2, $1000)
    BEQ .label10                                               ;81AC09|F019    |81AC24;
    LDA.W #$005C                                               ;81AC0B|A95C00  |      ;
    LDX.W #$00B0                                               ;81AC0E|A2B000  |      ;
    LDY.W #$0130                                               ;81AC11|A03001  |      ;
    PHA                                                        ;81AC14|48      |      ;
    PHX                                                        ;81AC15|DA      |      ;
    PHY                                                        ;81AC16|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81AC17|22CEA781|81A7CE;
    REP #$30                                                   ;81AC1B|C230    |      ;
    PLY                                                        ;81AC1D|7A      |      ;
    PLX                                                        ;81AC1E|FA      |      ;
    PLA                                                        ;81AC1F|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81AC20|22A7B082|82B0A7;
 
.label10:
    REP #$30                                                   ;81AC24|C230    |      ;
    %CheckFlag(event3, $1000)
    BEQ .return                                                ;81AC2D|F019    |81AC48;
    LDA.W #$00F5                                               ;81AC2F|A9F500  |      ;
    LDX.W #$0120                                               ;81AC32|A22001  |      ;
    LDY.W #$0140                                               ;81AC35|A04001  |      ;
    PHA                                                        ;81AC38|48      |      ;
    PHX                                                        ;81AC39|DA      |      ;
    PHY                                                        ;81AC3A|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81AC3B|22CEA781|81A7CE;
    REP #$30                                                   ;81AC3F|C230    |      ;
    PLY                                                        ;81AC41|7A      |      ;
    PLX                                                        ;81AC42|FA      |      ;
    PLA                                                        ;81AC43|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81AC44|22A7B082|82B0A7;
 
.return:
    RTS                                                        ;81AC48|60      |      ;
 
 
nPowerBerryTable:
    dw $0180,$0050,$0190,$0050,$01A0,$0050                     ;81AC49|        |      ; 16b, 16b / 32b (not sure about this size) * 0A
    dw $01B0,$0050,$01C0,$0050,$0180,$0060                     ;81AC55|        |      ;
    dw $0190,$0060,$01A0,$0060,$01B0,$0060                     ;81AC61|        |      ;
    dw $01C0,$0060                                             ;81AC6D|        |      ;
 
fItemSub81A9F6_0x04to0x07:
    RTS                                                        ;81AC71|60      |      ;
 
    RTS                                                        ;81AC72|60      |      ;
 
    RTS                                                        ;81AC73|60      |      ;
 
    RTS                                                        ;81AC74|60      |      ;
 
    RTS                                                        ;81AC75|60      |      ;
 
    RTS                                                        ;81AC76|60      |      ;
 
    RTS                                                        ;81AC77|60      |      ;
 
 
fItemSub81A9F6_0x08:
    RTS                                                        ;81AC78|60      |      ;
 
 
fItemSub81A9F6_0x09:
    RTS                                                        ;81AC79|60      |      ;
 
 
fItemSub81A9F6_0x0A:
    RTS                                                        ;81AC7A|60      |      ;
 
 
fItemSub81A9F6_0x0B:
    RTS                                                        ;81AC7B|60      |      ;
 
 
fItemSub81A9F6_0x0C:
    RTS                                                        ;81AC7C|60      |      ;
 
 
fItemSub81A9F6_0x0D:
    RTS                                                        ;81AC7D|60      |      ;
 
 
fItemSub81A9F6_0x0E:
    RTS                                                        ;81AC7E|60      |      ;
 
 
fItemSub81A9F6_0x0F:
    RTS                                                        ;81AC7F|60      |      ;
 
 
fItemSub81A9F6_0x10to0x13:
    REP #$30                                                   ;81AC80|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81AC82|AD9601  |000196;
    AND.W #$0002                                               ;81AC85|290200  |      ;
    BNE +                                                      ;81AC88|D02D    |81ACB7;
    LDA.W strcDialogDisplay.mapFlags                           ;81AC8A|AD9601  |000196;
    AND.W #$0008                                               ;81AC8D|290800  |      ;
    BNE +                                                      ;81AC90|D025    |81ACB7;
 
.loop:
    REP #$30                                                   ;81AC92|C230    |      ;
    %CheckFlag(event1, $0002)
    BEQ .return                                                ;81AC9B|F019    |81ACB6;
    LDA.W #$00E1                                               ;81AC9D|A9E100  |      ;
    LDX.W #$0170                                               ;81ACA0|A27001  |      ;
    LDY.W #$0270                                               ;81ACA3|A07002  |      ;
    PHA                                                        ;81ACA6|48      |      ;
    PHX                                                        ;81ACA7|DA      |      ;
    PHY                                                        ;81ACA8|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81ACA9|22CEA781|81A7CE;
    REP #$30                                                   ;81ACAD|C230    |      ;
    PLY                                                        ;81ACAF|7A      |      ;
    PLX                                                        ;81ACB0|FA      |      ;
    PLA                                                        ;81ACB1|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81ACB2|22A7B082|82B0A7;
 
.return:
    RTS                                                        ;81ACB6|60      |      ;
 
 
  + REP #$30                                                   ;81ACB7|C230    |      ;
    LDA.W #$00E2                                               ;81ACB9|A9E200  |      ;
    LDX.W #$0180                                               ;81ACBC|A28001  |      ;
    LDY.W #$0020                                               ;81ACBF|A02000  |      ;
    JSL.L fUnknown_81A7CE                                      ;81ACC2|22CEA781|81A7CE;
    BRA .loop                                                  ;81ACC6|80CA    |81AC92;
 
    RTS                                                        ;81ACC8|60      |      ;
 
    RTS                                                        ;81ACC9|60      |      ;
 
    RTS                                                        ;81ACCA|60      |      ;
 
 
fItemSub81A9F6_0x14:
    RTS                                                        ;81ACCB|60      |      ;
 
 
fItemSub81A9F6_0x15:
    REP #$30                                                   ;81ACCC|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81ACCE|AD9601  |000196;
    AND.W #$0010                                               ;81ACD1|291000  |      ;
    BEQ +                                                      ;81ACD4|F00D    |81ACE3;
    LDA.W #$00EE                                               ;81ACD6|A9EE00  |      ;
    LDX.W #$0070                                               ;81ACD9|A27000  |      ;
    LDY.W #$00C0                                               ;81ACDC|A0C000  |      ;
    JSL.L fUnknown_81A7CE                                      ;81ACDF|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81ACE3|C230    |      ;
    %CheckFlag(event5, $1000)
    BEQ +                                                      ;81ACEC|F01C    |81AD0A;
    LDA.W #$00FD                                               ;81ACEE|A9FD00  |      ;
    LDX.W #$0090                                               ;81ACF1|A29000  |      ;
    LDY.W #$0040                                               ;81ACF4|A04000  |      ;
    JSL.L fUnknown_81A7CE                                      ;81ACF7|22CEA781|81A7CE;
    REP #$30                                                   ;81ACFB|C230    |      ;
    LDA.W #$00D7                                               ;81ACFD|A9D700  |      ;
    LDX.W #$0090                                               ;81AD00|A29000  |      ;
    LDY.W #$0050                                               ;81AD03|A05000  |      ;
    JSL.L fMap_UpdateCurrentTilemap                            ;81AD06|223AB082|82B03A;
 
  + REP #$30                                                   ;81AD0A|C230    |      ;
    %CheckFlag(event6, $4000)
    BEQ +                                                      ;81AD13|F00D    |81AD22;
    LDA.W #$00FE                                               ;81AD15|A9FE00  |      ;
    LDX.W #$00A0                                               ;81AD18|A2A000  |      ;
    LDY.W #$0030                                               ;81AD1B|A03000  |      ;
    JSL.L fUnknown_81A7CE                                      ;81AD1E|22CEA781|81A7CE;
 
  + RTS                                                        ;81AD22|60      |      ;
 
 
fItemSub81A9F6_0x16:
    REP #$30                                                   ;81AD23|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81AD25|AD9601  |000196;
    AND.W #$0010                                               ;81AD28|291000  |      ;
    BEQ +                                                      ;81AD2B|F00D    |81AD3A;
    LDA.W #$00EE                                               ;81AD2D|A9EE00  |      ;
    LDX.W #$0070                                               ;81AD30|A27000  |      ;
    LDY.W #$00C0                                               ;81AD33|A0C000  |      ;
    JSL.L fUnknown_81A7CE                                      ;81AD36|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81AD3A|C230    |      ;
    %CheckFlag(event5, $1000)
    BEQ +                                                      ;81AD43|F01C    |81AD61;
    LDA.W #$00FD                                               ;81AD45|A9FD00  |      ;
    LDX.W #$0090                                               ;81AD48|A29000  |      ;
    LDY.W #$0040                                               ;81AD4B|A04000  |      ;
    JSL.L fUnknown_81A7CE                                      ;81AD4E|22CEA781|81A7CE;
    REP #$30                                                   ;81AD52|C230    |      ;
    LDA.W #$00D7                                               ;81AD54|A9D700  |      ;
    LDX.W #$0090                                               ;81AD57|A29000  |      ;
    LDY.W #$0050                                               ;81AD5A|A05000  |      ;
    JSL.L fMap_UpdateCurrentTilemap                            ;81AD5D|223AB082|82B03A;
 
  + REP #$30                                                   ;81AD61|C230    |      ;
    %CheckFlag(event6, $4000)
    BEQ +                                                      ;81AD6A|F00D    |81AD79;
    LDA.W #$00FE                                               ;81AD6C|A9FE00  |      ;
    LDX.W #$00A0                                               ;81AD6F|A2A000  |      ;
    LDY.W #$0030                                               ;81AD72|A03000  |      ;
    JSL.L fUnknown_81A7CE                                      ;81AD75|22CEA781|81A7CE;
 
  + RTS                                                        ;81AD79|60      |      ;
 
 
fItemSub81A9F6_0x17:
    REP #$30                                                   ;81AD7A|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81AD7C|AD9601  |000196;
    AND.W #$0010                                               ;81AD7F|291000  |      ;
    BEQ +                                                      ;81AD82|F00D    |81AD91;
    LDA.W #$00EE                                               ;81AD84|A9EE00  |      ;
    LDX.W #$0070                                               ;81AD87|A27000  |      ;
    LDY.W #$00C0                                               ;81AD8A|A0C000  |      ;
    JSL.L fUnknown_81A7CE                                      ;81AD8D|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81AD91|C230    |      ;
    %CheckFlag(event5, $1000)
    BEQ +                                                      ;81AD9A|F01C    |81ADB8;
    LDA.W #$00FD                                               ;81AD9C|A9FD00  |      ;
    LDX.W #$0140                                               ;81AD9F|A24001  |      ;
    LDY.W #$0050                                               ;81ADA2|A05000  |      ;
    JSL.L fUnknown_81A7CE                                      ;81ADA5|22CEA781|81A7CE;
    REP #$30                                                   ;81ADA9|C230    |      ;
    LDA.W #$00D7                                               ;81ADAB|A9D700  |      ;
    LDX.W #$0140                                               ;81ADAE|A24001  |      ;
    LDY.W #$0060                                               ;81ADB1|A06000  |      ;
    JSL.L fMap_UpdateCurrentTilemap                            ;81ADB4|223AB082|82B03A;
 
  + REP #$30                                                   ;81ADB8|C230    |      ;
    %CheckFlag(event6, $4000)
    BEQ +                                                      ;81ADC1|F00D    |81ADD0;
    LDA.W #$00FE                                               ;81ADC3|A9FE00  |      ;
    LDX.W #$0150                                               ;81ADC6|A25001  |      ;
    LDY.W #$0040                                               ;81ADC9|A04000  |      ;
    JSL.L fUnknown_81A7CE                                      ;81ADCC|22CEA781|81A7CE;
 
  + RTS                                                        ;81ADD0|60      |      ;
 
 
fItemSub81A9F6_0x18:
    RTS                                                        ;81ADD1|60      |      ;
 
 
fItemSub81A9F6_0x19:
    RTS                                                        ;81ADD2|60      |      ;
 
 
fItemSub81A9F6_0x1A:
    RTS                                                        ;81ADD3|60      |      ;
 
 
fItemSub81A9F6_0x1B:
    RTS                                                        ;81ADD4|60      |      ;
 
 
fItemSub81A9F6_0x1C:
    REP #$30                                                   ;81ADD5|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;81ADDE|D003    |81ADE3;
    JMP.W .return                                              ;81ADE0|4C69AE  |81AE69;
 
 
  + SEP #$20                                                   ;81ADE3|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;81ADE5|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;81ADE9|C901    |      ;
    BNE .label2                                                ;81ADEB|D01F    |81AE0C;
    LDY.W #$0000                                               ;81ADED|A00000  |      ;
 
.label1:
    PHY                                                        ;81ADF0|5A      |      ;
    REP #$20                                                   ;81ADF1|C220    |      ;
    TYA                                                        ;81ADF3|98      |      ;
    CLC                                                        ;81ADF4|18      |      ;
    ADC.W #$0005                                               ;81ADF5|690500  |      ;
    TYA                                                        ;81ADF8|98      |      ;
    INC A                                                      ;81ADF9|1A      |      ;
    LDX.W #$0001                                               ;81ADFA|A20100  |      ;
    LDY.W #$0002                                               ;81ADFD|A00200  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AE00|20BBB2  |81B2BB;
    REP #$30                                                   ;81AE03|C230    |      ;
    PLY                                                        ;81AE05|7A      |      ;
    INY                                                        ;81AE06|C8      |      ;
    CPY.W #$0002                                               ;81AE07|C00200  |      ;
    BNE .label1                                                ;81AE0A|D0E4    |81ADF0;
 
.label2:
    SEP #$20                                                   ;81AE0C|E220    |      ;
    REP #$10                                                   ;81AE0E|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;81AE10|AF191F7F|7F1F19;
    BNE +                                                      ;81AE14|D01F    |81AE35;
    LDY.W #$0002                                               ;81AE16|A00200  |      ;
 
.loop:
    PHY                                                        ;81AE19|5A      |      ;
    REP #$20                                                   ;81AE1A|C220    |      ;
    TYA                                                        ;81AE1C|98      |      ;
    CLC                                                        ;81AE1D|18      |      ;
    ADC.W #$0005                                               ;81AE1E|690500  |      ;
    TYA                                                        ;81AE21|98      |      ;
    INC A                                                      ;81AE22|1A      |      ;
    LDX.W #$0001                                               ;81AE23|A20100  |      ;
    LDY.W #$0002                                               ;81AE26|A00200  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AE29|20BBB2  |81B2BB;
    REP #$30                                                   ;81AE2C|C230    |      ;
    PLY                                                        ;81AE2E|7A      |      ;
    INY                                                        ;81AE2F|C8      |      ;
    CPY.W #$0004                                               ;81AE30|C00400  |      ;
    BNE .loop                                                  ;81AE33|D0E4    |81AE19;
 
  + SEP #$20                                                   ;81AE35|E220    |      ;
    REP #$10                                                   ;81AE37|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;81AE39|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;81AE3D|C902    |      ;
    BCS .exit                                                  ;81AE3F|B00E    |81AE4F;
    REP #$20                                                   ;81AE41|C220    |      ;
    LDA.W #$0005                                               ;81AE43|A90500  |      ;
    LDX.W #$0001                                               ;81AE46|A20100  |      ;
    LDY.W #$0002                                               ;81AE49|A00200  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AE4C|20BBB2  |81B2BB;
 
.exit:
    SEP #$20                                                   ;81AE4F|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;81AE51|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;81AE55|C902    |      ;
    BCC +                                                      ;81AE57|9002    |81AE5B;
    BRA .return                                                ;81AE59|800E    |81AE69;
 
 
  + REP #$30                                                   ;81AE5B|C230    |      ;
    LDA.W #$0006                                               ;81AE5D|A90600  |      ;
    LDX.W #$0001                                               ;81AE60|A20100  |      ;
    LDY.W #$0000                                               ;81AE63|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AE66|20BBB2  |81B2BB;
 
.return:
    RTS                                                        ;81AE69|60      |      ;
 
 
fItemSub81A9F6_0x1D:
    RTS                                                        ;81AE6A|60      |      ;
 
 
fItemSub81A9F6_0x1E:
    RTS                                                        ;81AE6B|60      |      ;
 
 
fItemSub81A9F6_0x1F:
    RTS                                                        ;81AE6C|60      |      ;
 
 
fItemSub81A9F6_0x20:
    RTS                                                        ;81AE6D|60      |      ;
 
 
fItemSub81A9F6_0x21:
    RTS                                                        ;81AE6E|60      |      ;
 
 
fItemSub81A9F6_0x22:
    REP #$30                                                   ;81AE6F|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE .paint                                                 ;81AE78|D003    |81AE7D;
    JMP.W .return                                              ;81AE7A|4CBEAF  |81AFBE;
 
 
.paint:
    SEP #$20                                                   ;81AE7D|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AE7F|AD2109  |000921;
    CMP.B #$0D                                                 ;81AE82|C90D    |      ;
    BEQ .milker                                                ;81AE84|F020    |81AEA6;
    LDA.W strcPlayerData.toolSecond                            ;81AE86|AD2309  |000923;
    CMP.B #$0D                                                 ;81AE89|C90D    |      ;
    BEQ .milker                                                ;81AE8B|F019    |81AEA6;
    REP #$30                                                   ;81AE8D|C230    |      ;
    %CheckFlag(event1, $0080)
    BEQ .milker                                                ;81AE96|F00E    |81AEA6;
    REP #$20                                                   ;81AE98|C220    |      ;
    LDA.W #$0001                                               ;81AE9A|A90100  |      ;
    LDX.W #$0002                                               ;81AE9D|A20200  |      ;
    LDY.W #$0000                                               ;81AEA0|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AEA3|20BBB2  |81B2BB;
 
.milker:
    SEP #$20                                                   ;81AEA6|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AEA8|AD2109  |000921;
    CMP.B #$0E                                                 ;81AEAB|C90E    |      ;
    BEQ .brush                                                 ;81AEAD|F015    |81AEC4;
    LDA.W strcPlayerData.toolSecond                            ;81AEAF|AD2309  |000923;
    CMP.B #$0E                                                 ;81AEB2|C90E    |      ;
    BEQ .brush                                                 ;81AEB4|F00E    |81AEC4;
    REP #$20                                                   ;81AEB6|C220    |      ;
    LDA.W #$0002                                               ;81AEB8|A90200  |      ;
    LDX.W #$0002                                               ;81AEBB|A20200  |      ;
    LDY.W #$0000                                               ;81AEBE|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AEC1|20BBB2  |81B2BB;
 
.brush:
    SEP #$20                                                   ;81AEC4|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AEC6|AD2109  |000921;
    CMP.B #$0F                                                 ;81AEC9|C90F    |      ;
    BEQ .goldSickle                                            ;81AECB|F015    |81AEE2;
    LDA.W strcPlayerData.toolSecond                            ;81AECD|AD2309  |000923;
    CMP.B #$0F                                                 ;81AED0|C90F    |      ;
    BEQ .goldSickle                                            ;81AED2|F00E    |81AEE2;
    REP #$20                                                   ;81AED4|C220    |      ;
    LDA.W #$0003                                               ;81AED6|A90300  |      ;
    LDX.W #$0002                                               ;81AED9|A20200  |      ;
    LDY.W #$0000                                               ;81AEDC|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AEDF|20BBB2  |81B2BB;
 
.goldSickle:
    SEP #$20                                                   ;81AEE2|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AEE4|AD2109  |000921;
    CMP.B #$11                                                 ;81AEE7|C911    |      ;
    BEQ .goldPlow                                              ;81AEE9|F020    |81AF0B;
    LDA.W strcPlayerData.toolSecond                            ;81AEEB|AD2309  |000923;
    CMP.B #$11                                                 ;81AEEE|C911    |      ;
    BEQ .goldPlow                                              ;81AEF0|F019    |81AF0B;
    REP #$30                                                   ;81AEF2|C230    |      ;
    %CheckFlag(event4, $0001)
    BEQ .goldPlow                                              ;81AEFB|F00E    |81AF0B;
    REP #$20                                                   ;81AEFD|C220    |      ;
    LDA.W #$0004                                               ;81AEFF|A90400  |      ;
    LDX.W #$0002                                               ;81AF02|A20200  |      ;
    LDY.W #$0000                                               ;81AF05|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AF08|20BBB2  |81B2BB;
 
.goldPlow:
    SEP #$20                                                   ;81AF0B|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AF0D|AD2109  |000921;
    CMP.B #$12                                                 ;81AF10|C912    |      ;
    BEQ .goldHammer                                            ;81AF12|F020    |81AF34;
    LDA.W strcPlayerData.toolSecond                            ;81AF14|AD2309  |000923;
    CMP.B #$12                                                 ;81AF17|C912    |      ;
    BEQ .goldHammer                                            ;81AF19|F019    |81AF34;
    REP #$30                                                   ;81AF1B|C230    |      ;
    %CheckFlag(event4, $0002)
    BEQ .goldHammer                                            ;81AF24|F00E    |81AF34;
    REP #$20                                                   ;81AF26|C220    |      ;
    LDA.W #$0005                                               ;81AF28|A90500  |      ;
    LDX.W #$0002                                               ;81AF2B|A20200  |      ;
    LDY.W #$0000                                               ;81AF2E|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AF31|20BBB2  |81B2BB;
 
.goldHammer:
    SEP #$20                                                   ;81AF34|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AF36|AD2109  |000921;
    CMP.B #$13                                                 ;81AF39|C913    |      ;
    BEQ .goldAxe                                               ;81AF3B|F020    |81AF5D;
    LDA.W strcPlayerData.toolSecond                            ;81AF3D|AD2309  |000923;
    CMP.B #$13                                                 ;81AF40|C913    |      ;
    BEQ .goldAxe                                               ;81AF42|F019    |81AF5D;
    REP #$30                                                   ;81AF44|C230    |      ;
    %CheckFlag(event4, $0004)
    BEQ .goldAxe                                               ;81AF4D|F00E    |81AF5D;
    REP #$20                                                   ;81AF4F|C220    |      ;
    LDA.W #$0006                                               ;81AF51|A90600  |      ;
    LDX.W #$0002                                               ;81AF54|A20200  |      ;
    LDY.W #$0000                                               ;81AF57|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AF5A|20BBB2  |81B2BB;
 
.goldAxe:
    SEP #$20                                                   ;81AF5D|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AF5F|AD2109  |000921;
    CMP.B #$14                                                 ;81AF62|C914    |      ;
    BEQ .sprinkler                                             ;81AF64|F020    |81AF86;
    LDA.W strcPlayerData.toolSecond                            ;81AF66|AD2309  |000923;
    CMP.B #$14                                                 ;81AF69|C914    |      ;
    BEQ .sprinkler                                             ;81AF6B|F019    |81AF86;
    REP #$30                                                   ;81AF6D|C230    |      ;
    %CheckFlag(event4, $0008)
    BEQ .sprinkler                                             ;81AF76|F00E    |81AF86;
    REP #$20                                                   ;81AF78|C220    |      ;
    LDA.W #$0007                                               ;81AF7A|A90700  |      ;
    LDX.W #$0002                                               ;81AF7D|A20200  |      ;
    LDY.W #$0000                                               ;81AF80|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AF83|20BBB2  |81B2BB;
 
.sprinkler:
    SEP #$20                                                   ;81AF86|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81AF88|AD2109  |000921;
    CMP.B #$15                                                 ;81AF8B|C915    |      ;
    BEQ .return                                                ;81AF8D|F02F    |81AFBE;
    LDA.W strcPlayerData.toolSecond                            ;81AF8F|AD2309  |000923;
    CMP.B #$15                                                 ;81AF92|C915    |      ;
    BEQ .return                                                ;81AF94|F028    |81AFBE;
    LDA.L nCurrentYearID                                       ;81AF96|AF181F7F|7F1F18;
    CMP.B #$01                                                 ;81AF9A|C901    |      ;
    BCS .continue                                              ;81AF9C|B012    |81AFB0;
    LDA.L nCurrentSeasonID                                     ;81AF9E|AF191F7F|7F1F19;
    BEQ .return                                                ;81AFA2|F01A    |81AFBE;
    CMP.B #$02                                                 ;81AFA4|C902    |      ;
    BCS .continue                                              ;81AFA6|B008    |81AFB0;
    LDA.L nCurrentDay                                          ;81AFA8|AF1B1F7F|7F1F1B;
    CMP.B #$14                                                 ;81AFAC|C914    |      ;
    BCC .return                                                ;81AFAE|900E    |81AFBE;
 
.continue:
    REP #$20                                                   ;81AFB0|C220    |      ;
    LDA.W #$0008                                               ;81AFB2|A90800  |      ;
    LDX.W #$0002                                               ;81AFB5|A20200  |      ;
    LDY.W #$0000                                               ;81AFB8|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81AFBB|20BBB2  |81B2BB;
 
.return:
    RTS                                                        ;81AFBE|60      |      ;
 
 
fItemSub81A9F6_0x23:
    RTS                                                        ;81AFBF|60      |      ;
 
 
fItemSub81A9F6_0x24:
    REP #$30                                                   ;81AFC0|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;81AFC9|D003    |81AFCE;
    JMP.W .return                                              ;81AFCB|4C62B0  |81B062;
 
 
  + REP #$20                                                   ;81AFCE|C220    |      ;
    %CheckFlag(event1, $0004)
    BNE .cowMedicine                                           ;81AFD7|D02F    |81B008;
    %CheckFlag(event6, $1000)
    BEQ .cowMedicine                                           ;81AFE0|F026    |81B008;
 
.miraclePotion:
    SEP #$20                                                   ;81AFE2|E220    |      ;
    LDA.L nOwnedCows                                           ;81AFE4|AF0A1F7F|7F1F0A;
    CMP.B #$0C                                                 ;81AFE8|C90C    |      ;
    BEQ .cowMedicine                                           ;81AFEA|F01C    |81B008;
    LDA.W strcPlayerData.toolEquipped                          ;81AFEC|AD2109  |000921;
    CMP.B #$0A                                                 ;81AFEF|C90A    |      ; Miracle Potion
    BEQ .cowMedicine                                           ;81AFF1|F015    |81B008;
    LDA.W strcPlayerData.toolSecond                            ;81AFF3|AD2309  |000923;
    CMP.B #$0A                                                 ;81AFF6|C90A    |      ;
    BEQ .cowMedicine                                           ;81AFF8|F00E    |81B008;
    REP #$30                                                   ;81AFFA|C230    |      ;
    LDA.W #$0001                                               ;81AFFC|A90100  |      ;
    LDX.W #$0003                                               ;81AFFF|A20300  |      ;
    LDY.W #$0000                                               ;81B002|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81B005|20BBB2  |81B2BB;
 
.cowMedicine:
    SEP #$20                                                   ;81B008|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81B00A|AD2109  |000921;
    CMP.B #$09                                                 ;81B00D|C909    |      ;
    BEQ .chickenFeed                                           ;81B00F|F015    |81B026;
    LDA.W strcPlayerData.toolSecond                            ;81B011|AD2309  |000923;
    CMP.B #$09                                                 ;81B014|C909    |      ;
    BEQ .chickenFeed                                           ;81B016|F00E    |81B026;
    REP #$30                                                   ;81B018|C230    |      ;
    LDA.W #$0002                                               ;81B01A|A90200  |      ;
    LDX.W #$0003                                               ;81B01D|A20300  |      ;
    LDY.W #$0000                                               ;81B020|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81B023|20BBB2  |81B2BB;
 
.chickenFeed:
    SEP #$20                                                   ;81B026|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81B028|AD2109  |000921;
    CMP.B #$19                                                 ;81B02B|C919    |      ;
    BEQ .cowFeed                                               ;81B02D|F015    |81B044;
    LDA.W strcPlayerData.toolSecond                            ;81B02F|AD2309  |000923;
    CMP.B #$19                                                 ;81B032|C919    |      ;
    BEQ .cowFeed                                               ;81B034|F00E    |81B044;
    REP #$30                                                   ;81B036|C230    |      ;
    LDA.W #$0003                                               ;81B038|A90300  |      ;
    LDX.W #$0003                                               ;81B03B|A20300  |      ;
    LDY.W #$0000                                               ;81B03E|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81B041|20BBB2  |81B2BB;
 
.cowFeed:
    SEP #$20                                                   ;81B044|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81B046|AD2109  |000921;
    CMP.B #$1A                                                 ;81B049|C91A    |      ;
    BEQ .return                                                ;81B04B|F015    |81B062;
    LDA.W strcPlayerData.toolSecond                            ;81B04D|AD2309  |000923;
    CMP.B #$1A                                                 ;81B050|C91A    |      ;
    BEQ .return                                                ;81B052|F00E    |81B062;
    REP #$30                                                   ;81B054|C230    |      ;
    LDA.W #$0004                                               ;81B056|A90400  |      ;
    LDX.W #$0003                                               ;81B059|A20300  |      ;
    LDY.W #$0000                                               ;81B05C|A00000  |      ;
    JSR.W fUnknown_81B2BB                                      ;81B05F|20BBB2  |81B2BB;
 
.return:
    RTS                                                        ;81B062|60      |      ;
 
 
fItemSub81A9F6_0x25:
    RTS                                                        ;81B063|60      |      ;
 
 
fItemSub81A9F6_0x26:
    REP #$30                                                   ;81B064|C230    |      ;
    LDY.W #$0000                                               ;81B066|A00000  |      ;
 
.loop:
    REP #$30                                                   ;81B069|C230    |      ;
    PHY                                                        ;81B06B|5A      |      ;
    TYA                                                        ;81B06C|98      |      ;
    INC A                                                      ;81B06D|1A      |      ;
    LDX.W #$0000                                               ;81B06E|A20000  |      ;
    LDY.W #$0001                                               ;81B071|A00100  |      ;
    JSR.W fUnknown_81B2BB                                      ;81B074|20BBB2  |81B2BB;
    REP #$30                                                   ;81B077|C230    |      ;
    PLY                                                        ;81B079|7A      |      ;
    INY                                                        ;81B07A|C8      |      ;
    CPY.W #$0018                                               ;81B07B|C01800  |      ;
    BNE .loop                                                  ;81B07E|D0E9    |81B069;
    REP #$30                                                   ;81B080|C230    |      ;
    %CheckFlag(event3, $2000)
    BNE +                                                      ;81B089|D003    |81B08E;
    JMP.W .return                                              ;81B08B|4CA7B0  |81B0A7;
 
 
  + LDA.W #$00F0                                               ;81B08E|A9F000  |      ;
    LDX.W #$0070                                               ;81B091|A27000  |      ;
    LDY.W #$0020                                               ;81B094|A02000  |      ;
    PHA                                                        ;81B097|48      |      ;
    PHX                                                        ;81B098|DA      |      ;
    PHY                                                        ;81B099|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81B09A|22CEA781|81A7CE;
    REP #$30                                                   ;81B09E|C230    |      ;
    PLY                                                        ;81B0A0|7A      |      ;
    PLX                                                        ;81B0A1|FA      |      ;
    PLA                                                        ;81B0A2|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81B0A3|22A7B082|82B0A7;
 
.return:
    RTS                                                        ;81B0A7|60      |      ;
 
 
fItemSub81A9F6_0x27:
    REP #$30                                                   ;81B0A8|C230    |      ;
    LDA.W #$001A                                               ;81B0AA|A91A00  |      ;
    LDX.W #$0000                                               ;81B0AD|A20000  |      ;
    LDY.W #$0001                                               ;81B0B0|A00100  |      ;
    JSR.W fUnknown_81B2BB                                      ;81B0B3|20BBB2  |81B2BB;
    REP #$30                                                   ;81B0B6|C230    |      ;
    LDY.W #$0000                                               ;81B0B8|A00000  |      ;
 
.loop:
    REP #$30                                                   ;81B0BB|C230    |      ;
    PHY                                                        ;81B0BD|5A      |      ;
    TYA                                                        ;81B0BE|98      |      ;
    ASL A                                                      ;81B0BF|0A      |      ;
    TAX                                                        ;81B0C0|AA      |      ;
    LDA.L nCowFeedFlagsTable,X                                 ;81B0C1|BF71A582|82A571;
    AND.W strcPlayerData.placedCowFeedFlags                    ;81B0C5|2D3209  |000932;
    BEQ +                                                      ;81B0C8|F019    |81B0E3;
    TYA                                                        ;81B0CA|98      |      ;
    ASL A                                                      ;81B0CB|0A      |      ;
    ASL A                                                      ;81B0CC|0A      |      ;
    TAX                                                        ;81B0CD|AA      |      ;
    LDA.L DATA32_81B0ED,X                                      ;81B0CE|BFEDB081|81B0ED;
    PHA                                                        ;81B0D2|48      |      ;
    INX                                                        ;81B0D3|E8      |      ;
    INX                                                        ;81B0D4|E8      |      ;
    LDA.L DATA32_81B0ED,X                                      ;81B0D5|BFEDB081|81B0ED;
    PHA                                                        ;81B0D9|48      |      ;
    LDA.W #$0099                                               ;81B0DA|A99900  |      ;
    PLY                                                        ;81B0DD|7A      |      ;
    PLX                                                        ;81B0DE|FA      |      ;
    JSL.L fUnknown_81A7CE                                      ;81B0DF|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81B0E3|C230    |      ;
    PLY                                                        ;81B0E5|7A      |      ;
    INY                                                        ;81B0E6|C8      |      ;
    CPY.W #$000D                                               ;81B0E7|C00D00  |      ;
    BNE .loop                                                  ;81B0EA|D0CF    |81B0BB;
    RTS                                                        ;81B0EC|60      |      ;
 
 
DATA32_81B0ED:
    dd $01180088,$00F80088,$00D80088                           ;81B0ED|        |      ;
    dd $00980088,$00780088,$00580088                           ;81B0F9|        |      ;
    dd $01180058,$00F80058,$00D80058                           ;81B105|        |      ;
    dd $00980058,$00780058,$00580058                           ;81B111|        |      ;
    dd $016800C8                                               ;81B11D|        |      ;
 
fItemSub81A9F6_0x28:
    REP #$30                                                   ;81B121|C230    |      ;
    LDA.W #$0019                                               ;81B123|A91900  |      ;
    LDX.W #$0000                                               ;81B126|A20000  |      ;
    LDY.W #$0001                                               ;81B129|A00100  |      ;
    JSR.W fUnknown_81B2BB                                      ;81B12C|20BBB2  |81B2BB;
    REP #$30                                                   ;81B12F|C230    |      ;
    REP #$30                                                   ;81B131|C230    |      ;
    LDY.W #$0000                                               ;81B133|A00000  |      ;
 
  - REP #$30                                                   ;81B136|C230    |      ;
    PHY                                                        ;81B138|5A      |      ;
    TYA                                                        ;81B139|98      |      ;
    ASL A                                                      ;81B13A|0A      |      ;
    TAX                                                        ;81B13B|AA      |      ;
    LDA.L nCowFeedFlagsTable,X                                 ;81B13C|BF71A582|82A571;
    AND.W strcPlayerData.placedChickenFeedFlags                ;81B140|2D3409  |000934;
    BEQ +                                                      ;81B143|F019    |81B15E;
    TYA                                                        ;81B145|98      |      ;
    ASL A                                                      ;81B146|0A      |      ;
    ASL A                                                      ;81B147|0A      |      ;
    TAX                                                        ;81B148|AA      |      ;
    LDA.L DATA32_81B19F,X                                      ;81B149|BF9FB181|81B19F;
    PHA                                                        ;81B14D|48      |      ;
    INX                                                        ;81B14E|E8      |      ;
    INX                                                        ;81B14F|E8      |      ;
    LDA.L DATA32_81B19F,X                                      ;81B150|BF9FB181|81B19F;
    PHA                                                        ;81B154|48      |      ;
    LDA.W #$0099                                               ;81B155|A99900  |      ;
    PLY                                                        ;81B158|7A      |      ;
    PLX                                                        ;81B159|FA      |      ;
    JSL.L fUnknown_81A7CE                                      ;81B15A|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81B15E|C230    |      ;
    PLY                                                        ;81B160|7A      |      ;
    INY                                                        ;81B161|C8      |      ;
    CPY.W #$000C                                               ;81B162|C00C00  |      ;
    BNE -                                                      ;81B165|D0CF    |81B136;
    REP #$30                                                   ;81B167|C230    |      ;
    LDY.W #$0000                                               ;81B169|A00000  |      ;
 
  - REP #$30                                                   ;81B16C|C230    |      ;
    PHY                                                        ;81B16E|5A      |      ;
    TYA                                                        ;81B16F|98      |      ;
    ASL A                                                      ;81B170|0A      |      ;
    TAX                                                        ;81B171|AA      |      ;
    LDA.L nMaskUnknown_81BF97,X                                ;81B172|BF97BF81|81BF97;
    AND.L nEggInCoopFlags                                      ;81B176|2F451F7F|7F1F45;
    BEQ +                                                      ;81B17A|F019    |81B195;
    TYA                                                        ;81B17C|98      |      ;
    ASL A                                                      ;81B17D|0A      |      ;
    ASL A                                                      ;81B17E|0A      |      ;
    TAX                                                        ;81B17F|AA      |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;81B180|BF10CA83|83CA10;
    PHA                                                        ;81B184|48      |      ;
    INX                                                        ;81B185|E8      |      ;
    INX                                                        ;81B186|E8      |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;81B187|BF10CA83|83CA10;
    PHA                                                        ;81B18B|48      |      ;
    LDA.W #$00F1                                               ;81B18C|A9F100  |      ;
    PLY                                                        ;81B18F|7A      |      ;
    PLX                                                        ;81B190|FA      |      ;
    JSL.L fUnknown_81A7CE                                      ;81B191|22CEA781|81A7CE;
 
  + REP #$30                                                   ;81B195|C230    |      ;
    PLY                                                        ;81B197|7A      |      ;
    INY                                                        ;81B198|C8      |      ;
    CPY.W #$000D                                               ;81B199|C00D00  |      ;
    BNE -                                                      ;81B19C|D0CE    |81B16C;
    RTS                                                        ;81B19E|60      |      ;
 
 
DATA32_81B19F:
    dd $00200020,$00200030,$00200040                           ;81B19F|        |      ;
    dd $00200050,$00200060,$00200070                           ;81B1AB|        |      ;
    dd $00200080,$00200090,$002000A0                           ;81B1B7|        |      ;
    dd $002000B0,$002000C0,$002000D0                           ;81B1C3|        |      ;
 
fItemSub81A9F6_0x29:
    REP #$30                                                   ;81B1CF|C230    |      ;
    %CheckFlag(event5, $0011)
    BEQ .return                                                ;81B1D8|F043    |81B21D;
    LDA.W #$00E4                                               ;81B1DA|A9E400  |      ;
    LDX.W #$0070                                               ;81B1DD|A27000  |      ;
    LDY.W #$0160                                               ;81B1E0|A06001  |      ;
    PHA                                                        ;81B1E3|48      |      ;
    PHX                                                        ;81B1E4|DA      |      ;
    PHY                                                        ;81B1E5|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81B1E6|22CEA781|81A7CE;
    REP #$30                                                   ;81B1EA|C230    |      ;
    PLY                                                        ;81B1EC|7A      |      ;
    PLX                                                        ;81B1ED|FA      |      ;
    PLA                                                        ;81B1EE|68      |      ;
    REP #$30                                                   ;81B1EF|C230    |      ;
    LDA.W #$00E4                                               ;81B1F1|A9E400  |      ;
    LDX.W #$0070                                               ;81B1F4|A27000  |      ;
    LDY.W #$0130                                               ;81B1F7|A03001  |      ;
    PHA                                                        ;81B1FA|48      |      ;
    PHX                                                        ;81B1FB|DA      |      ;
    PHY                                                        ;81B1FC|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81B1FD|22CEA781|81A7CE;
    REP #$30                                                   ;81B201|C230    |      ;
    PLY                                                        ;81B203|7A      |      ;
    PLX                                                        ;81B204|FA      |      ;
    PLA                                                        ;81B205|68      |      ;
    REP #$30                                                   ;81B206|C230    |      ;
    LDA.W #$00E4                                               ;81B208|A9E400  |      ;
    LDX.W #$0060                                               ;81B20B|A26000  |      ;
    LDY.W #$0170                                               ;81B20E|A07001  |      ;
    PHA                                                        ;81B211|48      |      ;
    PHX                                                        ;81B212|DA      |      ;
    PHY                                                        ;81B213|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81B214|22CEA781|81A7CE;
    REP #$30                                                   ;81B218|C230    |      ;
    PLY                                                        ;81B21A|7A      |      ;
    PLX                                                        ;81B21B|FA      |      ;
    PLA                                                        ;81B21C|68      |      ;
 
.return:
    RTS                                                        ;81B21D|60      |      ;
 
 
fItemSub81A9F6_0x2A:
    REP #$30                                                   ;81B21E|C230    |      ;
    %CheckFlag(event1, $0002)
    BNE +                                                      ;81B227|D003    |81B22C;
    JMP.W .return                                              ;81B229|4C60B2  |81B260;
 
 
  + LDA.W #$00EF                                               ;81B22C|A9EF00  |      ;
    LDX.W #$0030                                               ;81B22F|A23000  |      ;
    LDY.W #$0180                                               ;81B232|A08001  |      ;
    PHA                                                        ;81B235|48      |      ;
    PHX                                                        ;81B236|DA      |      ;
    PHY                                                        ;81B237|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81B238|22CEA781|81A7CE;
    REP #$30                                                   ;81B23C|C230    |      ;
    PLY                                                        ;81B23E|7A      |      ;
    PLX                                                        ;81B23F|FA      |      ;
    PLA                                                        ;81B240|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81B241|22A7B082|82B0A7;
    REP #$30                                                   ;81B245|C230    |      ;
    LDA.W #$00EF                                               ;81B247|A9EF00  |      ;
    LDX.W #$0020                                               ;81B24A|A22000  |      ;
    LDY.W #$01B0                                               ;81B24D|A0B001  |      ;
    PHA                                                        ;81B250|48      |      ;
    PHX                                                        ;81B251|DA      |      ;
    PHY                                                        ;81B252|5A      |      ;
    JSL.L fUnknown_81A7CE                                      ;81B253|22CEA781|81A7CE;
    REP #$30                                                   ;81B257|C230    |      ;
    PLY                                                        ;81B259|7A      |      ;
    PLX                                                        ;81B25A|FA      |      ;
    PLA                                                        ;81B25B|68      |      ;
    JSL.L fUnknown_82B0A7                                      ;81B25C|22A7B082|82B0A7;
 
.return:
    RTS                                                        ;81B260|60      |      ;
 
 
fItemSub81A9F6_0x2B:
    RTS                                                        ;81B261|60      |      ;
 
 
fItemSub81A9F6_0x2C:
    RTS                                                        ;81B262|60      |      ;
 
 
fItemSub81A9F6_0x2D:
    RTS                                                        ;81B263|60      |      ;
 
 
fItemSub81A9F6_0x2E:
    RTS                                                        ;81B264|60      |      ;
 
 
fItemSub81A9F6_0x2F:
    RTS                                                        ;81B265|60      |      ;
 
 
fItemSub81A9F6_0x30:
    RTS                                                        ;81B266|60      |      ;
 
 
fItemSub81A9F6_0x31:
    RTS                                                        ;81B267|60      |      ;
 
 
fItemSub81A9F6_0x32:
    RTS                                                        ;81B268|60      |      ;
 
 
fItemSub81A9F6_0x33:
    RTS                                                        ;81B269|60      |      ;
 
 
fItemSub81A9F6_0x34:
    RTS                                                        ;81B26A|60      |      ;
 
 
fItemSub81A9F6_0x35:
    RTS                                                        ;81B26B|60      |      ;
 
 
fItemSub81A9F6_0x36:
    RTS                                                        ;81B26C|60      |      ;
 
 
fItemSub81A9F6_0x37:
    REP #$30                                                   ;81B26D|C230    |      ;
    %CheckFlag(daily1, $0001)
    BNE .return                                                ;81B276|D01A    |81B292;
    %SetFlag(daily1, $0001)
    REP #$20                                                   ;81B283|C220    |      ;
    LDA.W #$009B                                               ;81B285|A99B00  |      ;
    LDX.W #$0080                                               ;81B288|A28000  |      ;
    LDY.W #$0110                                               ;81B28B|A01001  |      ;
    JSL.L fUnknown_81A7CE                                      ;81B28E|22CEA781|81A7CE;
 
.return:
    RTS                                                        ;81B292|60      |      ;
 
 
fItemSub81A9F6_0x38:
    RTS                                                        ;81B293|60      |      ;
 
 
fItemSub81A9F6_0x39:
    RTS                                                        ;81B294|60      |      ;
 
 
fItemSub81A9F6_0x3A:
    RTS                                                        ;81B295|60      |      ;
 
 
fItemSub81A9F6_0x3B:
    RTS                                                        ;81B296|60      |      ;
 
 
fItemSub81A9F6_0x3C:
    RTS                                                        ;81B297|60      |      ;
 
 
fItemSub81A9F6_0x3D:
    RTS                                                        ;81B298|60      |      ;
 
 
fItemSub81A9F6_0x3E:
    RTS                                                        ;81B299|60      |      ;
 
 
fItemSub81A9F6_0x3F:
    RTS                                                        ;81B29A|60      |      ;
 
 
fItemSub81A9F6_0x40:
    RTS                                                        ;81B29B|60      |      ;
 
 
fItemSub81A9F6_0x41:
    RTS                                                        ;81B29C|60      |      ;
 
 
fItemSub81A9F6_0x42:
    RTS                                                        ;81B29D|60      |      ;
 
 
fItemSub81A9F6_0x43:
    RTS                                                        ;81B29E|60      |      ;
 
 
fItemSub81A9F6_0x44:
    RTS                                                        ;81B29F|60      |      ;
 
 
fItemSub81A9F6_0x45:
    RTS                                                        ;81B2A0|60      |      ;
 
 
fItemSub81A9F6_0x46:
    RTS                                                        ;81B2A1|60      |      ;
 
 
fItemSub81A9F6_0x47:
    RTS                                                        ;81B2A2|60      |      ;
 
 
fItemSub81A9F6_0x48:
    RTS                                                        ;81B2A3|60      |      ;
 
 
fItemSub81A9F6_0x49:
    RTS                                                        ;81B2A4|60      |      ;
 
 
fItemSub81A9F6_0x4A:
    RTS                                                        ;81B2A5|60      |      ;
 
 
fItemSub81A9F6_0x4B:
    RTS                                                        ;81B2A6|60      |      ;
 
 
fItemSub81A9F6_0x4C:
    RTS                                                        ;81B2A7|60      |      ;
 
 
fItemSub81A9F6_0x4D:
    RTS                                                        ;81B2A8|60      |      ;
 
 
fItemSub81A9F6_0x4E:
    RTS                                                        ;81B2A9|60      |      ;
 
 
fItemSub81A9F6_0x4F:
    RTS                                                        ;81B2AA|60      |      ;
 
 
fItemSub81A9F6_0x50:
    RTS                                                        ;81B2AB|60      |      ;
 
 
fItemSub81A9F6_0x51:
    RTS                                                        ;81B2AC|60      |      ;
 
 
fItemSub81A9F6_0x52:
    RTS                                                        ;81B2AD|60      |      ;
 
 
fItemSub81A9F6_0x53:
    RTS                                                        ;81B2AE|60      |      ;
 
 
fItemSub81A9F6_0x54:
    RTS                                                        ;81B2AF|60      |      ;
 
 
fItemSub81A9F6_0x55:
    RTS                                                        ;81B2B0|60      |      ;
 
 
fItemSub81A9F6_0x56:
    RTS                                                        ;81B2B1|60      |      ;
 
 
fItemSub81A9F6_0x57:
    RTS                                                        ;81B2B2|60      |      ;
 
 
fItemSub81A9F6_0x58:
    RTS                                                        ;81B2B3|60      |      ;
 
 
fItemSub81A9F6_0x59:
    RTS                                                        ;81B2B4|60      |      ;
 
 
fItemSub81A9F6_0x5A:
    RTS                                                        ;81B2B5|60      |      ;
 
 
fItemSub81A9F6_0x5B:
    RTS                                                        ;81B2B6|60      |      ;
 
 
fItemSub81A9F6_0x5C:
    RTS                                                        ;81B2B7|60      |      ;
 
 
fItemSub81A9F6_0x5D:
    RTS                                                        ;81B2B8|60      |      ;
 
 
fItemSub81A9F6_0x5E:
    RTS                                                        ;81B2B9|60      |      ;
 
 
fItemSub81A9F6_0x5F:
    RTS                                                        ;81B2BA|60      |      ;
 
 
fUnknown_81B2BB:
    REP #$30                                                   ;81B2BB|C230    |      ; A: nArg, X: nArg, Y: nArg
    PHY                                                        ;81B2BD|5A      |      ;
    PHA                                                        ;81B2BE|48      |      ;
    CPX.W #$0000                                               ;81B2BF|E00000  |      ;
    BEQ .case0                                                 ;81B2C2|F00F    |81B2D3;
    CPX.W #$0001                                               ;81B2C4|E00100  |      ;
    BEQ .case1                                                 ;81B2C7|F019    |81B2E2;
    CPX.W #$0002                                               ;81B2C9|E00200  |      ;
    BEQ .case2                                                 ;81B2CC|F023    |81B2F1;
    CPX.W #$0003                                               ;81B2CE|E00300  |      ;
    BEQ .case4                                                 ;81B2D1|F02D    |81B300;
 
.case0:
    REP #$20                                                   ;81B2D3|C220    |      ;
    LDA.W #$BE0F                                               ;81B2D5|A90FBE  |      ;
    STA.B ptrTemp0x72                                          ;81B2D8|8572    |000072;
    SEP #$20                                                   ;81B2DA|E220    |      ;
    LDA.B #$81                                                 ;81B2DC|A981    |      ;
    STA.B ptrTemp0x72+2                                        ;81B2DE|8574    |000074;
    BRA .continue                                              ;81B2E0|802D    |81B30F;
 
 
.case1:
    REP #$20                                                   ;81B2E2|C220    |      ;
    LDA.W #$BEEF                                               ;81B2E4|A9EFBE  |      ;
    STA.B ptrTemp0x72                                          ;81B2E7|8572    |000072;
    SEP #$20                                                   ;81B2E9|E220    |      ;
    LDA.B #$81                                                 ;81B2EB|A981    |      ;
    STA.B ptrTemp0x72+2                                        ;81B2ED|8574    |000074;
    BRA .continue                                              ;81B2EF|801E    |81B30F;
 
 
.case2:
    REP #$20                                                   ;81B2F1|C220    |      ;
    LDA.W #$BF27                                               ;81B2F3|A927BF  |      ;
    STA.B ptrTemp0x72                                          ;81B2F6|8572    |000072;
    SEP #$20                                                   ;81B2F8|E220    |      ;
    LDA.B #$81                                                 ;81B2FA|A981    |      ;
    STA.B ptrTemp0x72+2                                        ;81B2FC|8574    |000074;
    BRA .continue                                              ;81B2FE|800F    |81B30F;
 
 
.case4:
    REP #$20                                                   ;81B300|C220    |      ;
    LDA.W #$BF6F                                               ;81B302|A96FBF  |      ;
    STA.B ptrTemp0x72                                          ;81B305|8572    |000072;
    SEP #$20                                                   ;81B307|E220    |      ;
    LDA.B #$81                                                 ;81B309|A981    |      ;
    STA.B ptrTemp0x72+2                                        ;81B30B|8574    |000074;
    BRA .continue                                              ;81B30D|8000    |81B30F;
 
 
.continue:
    REP #$20                                                   ;81B30F|C220    |      ;
    PLA                                                        ;81B311|68      |      ;
    ASL A                                                      ;81B312|0A      |      ;
    ASL A                                                      ;81B313|0A      |      ;
    ASL A                                                      ;81B314|0A      |      ;
    TAY                                                        ;81B315|A8      |      ;
    PHY                                                        ;81B316|5A      |      ;
    INY                                                        ;81B317|C8      |      ;
    INY                                                        ;81B318|C8      |      ;
    INY                                                        ;81B319|C8      |      ;
    INY                                                        ;81B31A|C8      |      ;
    INY                                                        ;81B31B|C8      |      ;
    INY                                                        ;81B31C|C8      |      ;
    SEP #$20                                                   ;81B31D|E220    |      ;
    LDA.B #$00                                                 ;81B31F|A900    |      ;
    XBA                                                        ;81B321|EB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81B322|B772    |000072;
    TAX                                                        ;81B324|AA      |      ;
    INY                                                        ;81B325|C8      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81B326|B772    |000072;
    STA.B strcVariables.n8Temp1                                ;81B328|8592    |000092;
    PLY                                                        ;81B32A|7A      |      ;
    REP #$20                                                   ;81B32B|C220    |      ;
    PLA                                                        ;81B32D|68      |      ;
    CMP.W #$0002                                               ;81B32E|C90200  |      ;
    BEQ .label7                                                ;81B331|F01B    |81B34E;
    CMP.W #$0001                                               ;81B333|C90100  |      ;
    BEQ .label6                                                ;81B336|F00C    |81B344;
    SEP #$20                                                   ;81B338|E220    |      ;
    LDA.L strcShedItems.row1,X                                 ;81B33A|BF001F7F|7F1F00;
    AND.B strcVariables.n8Temp1                                ;81B33E|2592    |000092;
    BNE .return                                                ;81B340|D020    |81B362;
    BRA .label7                                                ;81B342|800A    |81B34E;
 
 
.label6:
    SEP #$20                                                   ;81B344|E220    |      ;
    LDA.L strcShedItems.row1,X                                 ;81B346|BF001F7F|7F1F00;
    AND.B strcVariables.n8Temp1                                ;81B34A|2592    |000092;
    BEQ .return                                                ;81B34C|F014    |81B362;
 
.label7:
    REP #$20                                                   ;81B34E|C220    |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81B350|B772    |000072;
    PHA                                                        ;81B352|48      |      ;
    INY                                                        ;81B353|C8      |      ;
    INY                                                        ;81B354|C8      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81B355|B772    |000072;
    PHA                                                        ;81B357|48      |      ;
    INY                                                        ;81B358|C8      |      ;
    INY                                                        ;81B359|C8      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81B35A|B772    |000072;
    PLY                                                        ;81B35C|7A      |      ;
    PLX                                                        ;81B35D|FA      |      ;
    JSL.L fUnknown_81A7CE                                      ;81B35E|22CEA781|81A7CE;
 
.return:
    RTS                                                        ;81B362|60      |      ;
 
 
Table_81B363:
    dw $0000                                                   ;81B363|        |      ; 0x55 * [n16, n8, n8, n16]
    db $00,$00                                                 ;81B365|        |      ;
    dw $0000,$0000                                             ;81B367|        |      ;
    db $02,$01                                                 ;81B36B|        |      ;
    dw $0000,$0008                                             ;81B36D|        |      ;
    db $02,$01                                                 ;81B371|        |      ;
    dw $0000,$0010                                             ;81B373|        |      ;
    db $02,$01                                                 ;81B377|        |      ;
    dw $0000,$0018                                             ;81B379|        |      ;
    db $02,$01                                                 ;81B37D|        |      ;
    dw $0000,$0020                                             ;81B37F|        |      ;
    db $02,$01                                                 ;81B383|        |      ;
    dw $0000,$0028                                             ;81B385|        |      ;
    db $02,$01                                                 ;81B389|        |      ;
    dw $0000,$0030                                             ;81B38B|        |      ;
    db $02,$01                                                 ;81B38F|        |      ;
    dw $0000,$0038                                             ;81B391|        |      ;
    db $02,$01                                                 ;81B395|        |      ;
    dw $0000,$0080                                             ;81B397|        |      ;
    db $01,$02                                                 ;81B39B|        |      ;
    dw $0000,$0088                                             ;81B39D|        |      ;
    db $01,$02                                                 ;81B3A1|        |      ;
    dw $0000,$0090                                             ;81B3A3|        |      ;
    db $02,$02                                                 ;81B3A7|        |      ;
    dw $0000,$00A0                                             ;81B3A9|        |      ;
    db $02,$02                                                 ;81B3AD|        |      ;
    dw $0000,$00B0                                             ;81B3AF|        |      ;
    db $02,$02                                                 ;81B3B3|        |      ;
    dw $0002,$0100                                             ;81B3B5|        |      ;
    db $01,$01                                                 ;81B3B9|        |      ;
    dw $0002,$0104                                             ;81B3BB|        |      ;
    db $01,$01                                                 ;81B3BF|        |      ;
    dw $0003,$0108                                             ;81B3C1|        |      ;
    db $01,$01                                                 ;81B3C5|        |      ;
    dw $0004,$010C                                             ;81B3C7|        |      ;
    db $01,$01                                                 ;81B3CB|        |      ;
    dw $0000,$0110                                             ;81B3CD|        |      ;
    db $01,$01                                                 ;81B3D1|        |      ;
    dw $0000,$0114                                             ;81B3D3|        |      ;
    db $01,$01                                                 ;81B3D7|        |      ;
    dw $0000,$0118                                             ;81B3D9|        |      ;
    db $01,$01                                                 ;81B3DD|        |      ;
    dw $0005,$011C                                             ;81B3DF|        |      ;
    db $01,$01                                                 ;81B3E3|        |      ;
    dw $0006,$0120                                             ;81B3E5|        |      ;
    db $01,$01                                                 ;81B3E9|        |      ;
    dw $0000,$0124                                             ;81B3EB|        |      ;
    db $01,$01                                                 ;81B3EF|        |      ;
    dw $0007,$0128                                             ;81B3F1|        |      ;
    db $01,$01                                                 ;81B3F5|        |      ;
    dw $0008,$012C                                             ;81B3F7|        |      ;
    db $01,$01                                                 ;81B3FB|        |      ;
    dw $003A,$012C                                             ;81B3FD|        |      ;
    db $01,$01                                                 ;81B401|        |      ;
    dw $0026,$012C                                             ;81B403|        |      ;
    db $01,$01                                                 ;81B407|        |      ;
    dw $0054,$012C                                             ;81B409|        |      ;
    db $01,$01                                                 ;81B40D|        |      ;
    dw $0066,$0130                                             ;81B40F|        |      ;
    db $01,$01                                                 ;81B413|        |      ;
    dw $0000,$0134                                             ;81B415|        |      ;
    db $01,$01                                                 ;81B419|        |      ;
    dw $0070,$0138                                             ;81B41B|        |      ;
    db $01,$01                                                 ;81B41F|        |      ;
    dw $0000,$013C                                             ;81B421|        |      ;
    db $01,$01                                                 ;81B425|        |      ;
    dw $0000,$0180                                             ;81B427|        |      ;
    db $01,$01                                                 ;81B42B|        |      ;
    dw $0000,$0184                                             ;81B42D|        |      ;
    db $01,$01                                                 ;81B431|        |      ;
    dw $0000,$0188                                             ;81B433|        |      ;
    db $01,$01                                                 ;81B437|        |      ;
    dw $0032,$018C                                             ;81B439|        |      ;
    db $01,$01                                                 ;81B43D|        |      ;
    dw $0000,$0190                                             ;81B43F|        |      ;
    db $01,$01                                                 ;81B443|        |      ;
    dw $0000,$0194                                             ;81B445|        |      ;
    db $01,$01                                                 ;81B449|        |      ;
    dw $0000,$0198                                             ;81B44B|        |      ;
    db $01,$01                                                 ;81B44F|        |      ;
    dw $0000,$019C                                             ;81B451|        |      ;
    db $01,$01                                                 ;81B455|        |      ;
    dw $0000,$01A0                                             ;81B457|        |      ;
    db $01,$01                                                 ;81B45B|        |      ;
    dw $0000,$01A4                                             ;81B45D|        |      ;
    db $01,$01                                                 ;81B461|        |      ;
    dw $0000,$01A8                                             ;81B463|        |      ;
    db $01,$01                                                 ;81B467|        |      ;
    dw $004C,$01AC                                             ;81B469|        |      ;
    db $01,$01                                                 ;81B46D|        |      ;
    dw $0000,$01B0                                             ;81B46F|        |      ;
    db $01,$01                                                 ;81B473|        |      ;
    dw $0000,$01B4                                             ;81B475|        |      ;
    db $01,$01                                                 ;81B479|        |      ;
    dw $0000,$01B8                                             ;81B47B|        |      ;
    db $01,$01                                                 ;81B47F|        |      ;
    dw $0000,$01BC                                             ;81B481|        |      ;
    db $01,$01                                                 ;81B485|        |      ;
    dw $0000,$0200                                             ;81B487|        |      ;
    db $01,$01                                                 ;81B48B|        |      ;
    dw $0000,$0204                                             ;81B48D|        |      ;
    db $01,$01                                                 ;81B491|        |      ;
    dw $0000,$0208                                             ;81B493|        |      ;
    db $01,$01                                                 ;81B497|        |      ;
    dw $0000,$020C                                             ;81B499|        |      ;
    db $01,$01                                                 ;81B49D|        |      ;
    dw $0000,$0210                                             ;81B49F|        |      ;
    db $01,$01                                                 ;81B4A3|        |      ;
    dw $0000,$0214                                             ;81B4A5|        |      ;
    db $01,$01                                                 ;81B4A9|        |      ;
    dw $0000,$0218                                             ;81B4AB|        |      ;
    db $01,$01                                                 ;81B4AF|        |      ;
    dw $0000,$021C                                             ;81B4B1|        |      ;
    db $01,$01                                                 ;81B4B5|        |      ;
    dw $0000,$0220                                             ;81B4B7|        |      ;
    db $01,$01                                                 ;81B4BB|        |      ;
    dw $0000,$0224                                             ;81B4BD|        |      ;
    db $01,$01                                                 ;81B4C1|        |      ;
    dw $0000,$0228                                             ;81B4C3|        |      ;
    db $01,$01                                                 ;81B4C7|        |      ;
    dw $0000,$022C                                             ;81B4C9|        |      ;
    db $01,$01                                                 ;81B4CD|        |      ;
    dw $0000,$0230                                             ;81B4CF|        |      ;
    db $01,$01                                                 ;81B4D3|        |      ;
    dw $0000,$0234                                             ;81B4D5|        |      ;
    db $01,$01                                                 ;81B4D9|        |      ;
    dw $0000,$0238                                             ;81B4DB|        |      ;
    db $01,$01                                                 ;81B4DF|        |      ;
    dw $0000,$023C                                             ;81B4E1|        |      ;
    db $01,$01                                                 ;81B4E5|        |      ;
    dw $0000,$0280                                             ;81B4E7|        |      ;
    db $01,$01                                                 ;81B4EB|        |      ;
    dw $0000,$0284                                             ;81B4ED|        |      ;
    db $01,$01                                                 ;81B4F1|        |      ;
    dw $0000,$0288                                             ;81B4F3|        |      ;
    db $01,$01                                                 ;81B4F7|        |      ;
    dw $0000,$028C                                             ;81B4F9|        |      ;
    db $01,$01                                                 ;81B4FD|        |      ;
    dw $0000,$0290                                             ;81B4FF|        |      ;
    db $01,$01                                                 ;81B503|        |      ;
    dw $0000,$0294                                             ;81B505|        |      ;
    db $01,$01                                                 ;81B509|        |      ;
    dw $0000,$0298                                             ;81B50B|        |      ;
    db $01,$01                                                 ;81B50F|        |      ;
    dw $0000,$029C                                             ;81B511|        |      ;
    db $01,$01                                                 ;81B515|        |      ;
    dw $0000,$02A0                                             ;81B517|        |      ;
    db $01,$01                                                 ;81B51B|        |      ;
    dw $0000,$02A4                                             ;81B51D|        |      ;
    db $01,$01                                                 ;81B521|        |      ;
    dw $0000,$02A8                                             ;81B523|        |      ;
    db $01,$01                                                 ;81B527|        |      ;
    dw $0000,$02AC                                             ;81B529|        |      ;
    db $01,$01                                                 ;81B52D|        |      ;
    dw $0000,$02B0                                             ;81B52F|        |      ;
    db $01,$01                                                 ;81B533|        |      ;
    dw $0000,$02B4                                             ;81B535|        |      ;
    db $01,$01                                                 ;81B539|        |      ;
    dw $0000,$02B8                                             ;81B53B|        |      ;
    db $01,$01                                                 ;81B53F|        |      ;
    dw $0000,$02BC                                             ;81B541|        |      ;
    db $01,$01                                                 ;81B545|        |      ;
    dw $0000,$0300                                             ;81B547|        |      ;
    db $01,$01                                                 ;81B54B|        |      ;
    dw $0000,$0304                                             ;81B54D|        |      ;
    db $01,$01                                                 ;81B551|        |      ;
    dw $007A,$0308                                             ;81B553|        |      ;
    db $07,$07                                                 ;81B557|        |      ;
    dw $0000,$048C                                             ;81B559|        |      ;
    db $07,$07                                                 ;81B55D|        |      ;
    dw $0000,$0610                                             ;81B55F|        |      ;
    db $02,$02                                                 ;81B563|        |      ;
    dw $0000,$0620                                             ;81B565|        |      ;
    db $02,$02                                                 ;81B569|        |      ;
    dw $0000,$0630                                             ;81B56B|        |      ;
    db $02,$02                                                 ;81B56F|        |      ;
    dw $0000,$0680                                             ;81B571|        |      ;
    db $02,$02                                                 ;81B575|        |      ;
    dw $0000,$0690                                             ;81B577|        |      ;
    db $02,$01                                                 ;81B57B|        |      ;
    dw $0000,$0698                                             ;81B57D|        |      ;
    db $02,$02                                                 ;81B581|        |      ;
    dw $0000,$06A0                                             ;81B583|        |      ;
    db $03,$01                                                 ;81B587|        |      ;
    dw $0000,$06AC                                             ;81B589|        |      ;
    db $02,$02                                                 ;81B58D|        |      ;
    dw $0000,$06B4                                             ;81B58F|        |      ;
    db $02,$01                                                 ;81B593|        |      ;
    dw $0000,$06BC                                             ;81B595|        |      ;
    db $02,$01                                                 ;81B599|        |      ;
    dw $0000,$0728                                             ;81B59B|        |      ;
    db $02,$03                                                 ;81B59F|        |      ;
    dw $0000,$0780                                             ;81B5A1|        |      ;
    db $03,$03                                                 ;81B5A5|        |      ;
    dw $0000,$07A4                                             ;81B5A7|        |      ;
    db $01,$02                                                 ;81B5AB|        |      ;
    dw $0000,$07AC                                             ;81B5AD|        |      ;
    db $01,$02                                                 ;81B5B1|        |      ;
    dw $0000,$07B4                                             ;81B5B3|        |      ;
    db $01,$02                                                 ;81B5B7|        |      ;
    dw $0000,$0800                                             ;81B5B9|        |      ;
    db $01,$02                                                 ;81B5BD|        |      ;
    dw $0000,$0808                                             ;81B5BF|        |      ;
    db $01,$02                                                 ;81B5C3|        |      ;
    dw $0000,$0810                                             ;81B5C5|        |      ;
    db $01,$02                                                 ;81B5C9|        |      ;
    dw $0000,$0818                                             ;81B5CB|        |      ;
    db $01,$02                                                 ;81B5CF|        |      ;
    dw $0000,$0820                                             ;81B5D1|        |      ;
    db $01,$02                                                 ;81B5D5|        |      ;
    dw $0000,$0828                                             ;81B5D7|        |      ;
    db $01,$02                                                 ;81B5DB|        |      ;
    dw $0000,$0830                                             ;81B5DD|        |      ;
    db $01,$02                                                 ;81B5E1|        |      ;
    dw $0000,$0838                                             ;81B5E3|        |      ;
    db $01,$02                                                 ;81B5E7|        |      ;
    dw $0000,$0880                                             ;81B5E9|        |      ;
    db $01,$02                                                 ;81B5ED|        |      ;
    dw $0000,$0888                                             ;81B5EF|        |      ;
    db $01,$02                                                 ;81B5F3|        |      ;
    dw $0000,$0890                                             ;81B5F5|        |      ;
    db $01,$02                                                 ;81B5F9|        |      ;
    dw $0000,$0898                                             ;81B5FB|        |      ;
    db $01,$02                                                 ;81B5FF|        |      ;
    dw $0000,$08A0                                             ;81B601|        |      ;
    db $01,$02                                                 ;81B605|        |      ;
    dw $0000,$08A8                                             ;81B607|        |      ;
    db $01,$02                                                 ;81B60B|        |      ;
    dw $0000,$08B0                                             ;81B60D|        |      ;
    db $01,$02                                                 ;81B611|        |      ;
    dw $0000,$08B8                                             ;81B613|        |      ;
    db $01,$02                                                 ;81B617|        |      ;
    dw $0000,$0900                                             ;81B619|        |      ;
    db $01,$02                                                 ;81B61D|        |      ;
    dw $0000,$0EB0                                             ;81B61F|        |      ;
    db $01,$02                                                 ;81B623|        |      ;
    dw $0000,$090C                                             ;81B625|        |      ;
    db $02,$01                                                 ;81B629|        |      ;
    dw $0000,$0914                                             ;81B62B|        |      ;
    db $02,$01                                                 ;81B62F|        |      ;
    dw $0000,$091C                                             ;81B631|        |      ;
    db $01,$01                                                 ;81B635|        |      ;
    dw $0010,$0920                                             ;81B637|        |      ;
    db $01,$01                                                 ;81B63B|        |      ;
    dw $0011,$0924                                             ;81B63D|        |      ;
    db $01,$01                                                 ;81B641|        |      ;
    dw $0012,$0928                                             ;81B643|        |      ;
    db $01,$01                                                 ;81B647|        |      ;
    dw $0013,$092C                                             ;81B649|        |      ;
    db $01,$01                                                 ;81B64D|        |      ;
    dw $0014,$0930                                             ;81B64F|        |      ;
    db $01,$01                                                 ;81B653|        |      ;
    dw $0015,$0934                                             ;81B655|        |      ;
    db $01,$01                                                 ;81B659|        |      ;
    dw $0016,$0938                                             ;81B65B|        |      ;
    db $01,$01                                                 ;81B65F|        |      ;
    dw $0017,$093C                                             ;81B661|        |      ;
    db $01,$01                                                 ;81B665|        |      ;
    dw $0018,$0980                                             ;81B667|        |      ;
    db $01,$01                                                 ;81B66B|        |      ;
    dw $0019,$0984                                             ;81B66D|        |      ;
    db $01,$01                                                 ;81B671|        |      ;
    dw $001A,$0988                                             ;81B673|        |      ;
    db $01,$01                                                 ;81B677|        |      ;
    dw $001B,$098C                                             ;81B679|        |      ;
    db $01,$01                                                 ;81B67D|        |      ;
    dw $001C,$0990                                             ;81B67F|        |      ;
    db $01,$01                                                 ;81B683|        |      ;
    dw $001D,$0994                                             ;81B685|        |      ;
    db $01,$01                                                 ;81B689|        |      ;
    dw $001E,$0998                                             ;81B68B|        |      ;
    db $01,$01                                                 ;81B68F|        |      ;
    dw $001F,$099C                                             ;81B691|        |      ;
    db $01,$01                                                 ;81B695|        |      ;
    dw $0020,$09A0                                             ;81B697|        |      ;
    db $01,$01                                                 ;81B69B|        |      ;
    dw $0021,$09A4                                             ;81B69D|        |      ;
    db $01,$01                                                 ;81B6A1|        |      ;
    dw $0022,$09A8                                             ;81B6A3|        |      ;
    db $01,$01                                                 ;81B6A7|        |      ;
    dw $0023,$09AC                                             ;81B6A9|        |      ;
    db $01,$01                                                 ;81B6AD|        |      ;
    dw $0024,$09B0                                             ;81B6AF|        |      ;
    db $01,$01                                                 ;81B6B3|        |      ;
    dw $0025,$09B4                                             ;81B6B5|        |      ;
    db $01,$01                                                 ;81B6B9|        |      ;
    dw $0026,$09B8                                             ;81B6BB|        |      ;
    db $01,$01                                                 ;81B6BF|        |      ;
    dw $0027,$09BC                                             ;81B6C1|        |      ;
    db $01,$01                                                 ;81B6C5|        |      ;
    dw $002A,$0A00                                             ;81B6C7|        |      ;
    db $01,$01                                                 ;81B6CB|        |      ;
    dw $002B,$0A04                                             ;81B6CD|        |      ;
    db $01,$01                                                 ;81B6D1|        |      ;
    dw $002C,$0A08                                             ;81B6D3|        |      ;
    db $01,$01                                                 ;81B6D7|        |      ;
    dw $002D,$0A0C                                             ;81B6D9|        |      ;
    db $01,$01                                                 ;81B6DD|        |      ;
    dw $0029,$0A10                                             ;81B6DF|        |      ;
    db $01,$01                                                 ;81B6E3|        |      ;
    dw $0000,$0A14                                             ;81B6E5|        |      ;
    db $01,$01                                                 ;81B6E9|        |      ;
    dw $0000,$0A18                                             ;81B6EB|        |      ;
    db $01,$01                                                 ;81B6EF|        |      ;
    dw $0000,$0A1C                                             ;81B6F1|        |      ;
    db $01,$01                                                 ;81B6F5|        |      ;
    dw $0000,$0A20                                             ;81B6F7|        |      ;
    db $01,$01                                                 ;81B6FB|        |      ;
    dw $002F,$0A24                                             ;81B6FD|        |      ;
    db $01,$01                                                 ;81B701|        |      ;
    dw $0000,$0A28                                             ;81B703|        |      ;
    db $01,$01                                                 ;81B707|        |      ;
    dw $0037,$0A2C                                             ;81B709|        |      ;
    db $01,$01                                                 ;81B70D|        |      ;
    dw $0003,$0A30                                             ;81B70F|        |      ;
    db $01,$01                                                 ;81B713|        |      ;
    dw $0028,$0A34                                             ;81B715|        |      ;
    db $01,$01                                                 ;81B719|        |      ;
    dw $0000,$0A38                                             ;81B71B|        |      ;
    db $01,$01                                                 ;81B71F|        |      ;
    dw $0000,$0A3C                                             ;81B721|        |      ;
    db $01,$01                                                 ;81B725|        |      ;
    dw $0000,$0A80                                             ;81B727|        |      ;
    db $02,$02                                                 ;81B72B|        |      ;
    dw $0000,$0A90                                             ;81B72D|        |      ;
    db $02,$02                                                 ;81B731|        |      ;
    dw $0000,$0AA0                                             ;81B733|        |      ;
    db $02,$01                                                 ;81B737|        |      ;
    dw $0000,$0AA8                                             ;81B739|        |      ;
    db $02,$01                                                 ;81B73D|        |      ;
    dw $0000,$0AB0                                             ;81B73F|        |      ;
    db $02,$01                                                 ;81B743|        |      ;
    dw $0000,$0AB8                                             ;81B745|        |      ;
    db $02,$01                                                 ;81B749|        |      ;
    dw $0000,$0B00                                             ;81B74B|        |      ;
    db $02,$01                                                 ;81B74F|        |      ;
    dw $0000,$0B08                                             ;81B751|        |      ;
    db $02,$01                                                 ;81B755|        |      ;
    dw $0000,$0B10                                             ;81B757|        |      ;
    db $02,$01                                                 ;81B75B|        |      ;
    dw $0000,$0B18                                             ;81B75D|        |      ;
    db $02,$01                                                 ;81B761|        |      ;
    dw $0000,$0B20                                             ;81B763|        |      ;
    db $02,$02                                                 ;81B767|        |      ;
    dw $0000,$0B30                                             ;81B769|        |      ;
    db $02,$02                                                 ;81B76D|        |      ;
    dw $0000,$0B80                                             ;81B76F|        |      ;
    db $02,$02                                                 ;81B773|        |      ;
    dw $0000,$0B90                                             ;81B775|        |      ;
    db $02,$01                                                 ;81B779|        |      ;
    dw $0000,$0B98                                             ;81B77B|        |      ;
    db $02,$01                                                 ;81B77F|        |      ;
    dw $0000,$0BA0                                             ;81B781|        |      ;
    db $02,$01                                                 ;81B785|        |      ;
    dw $0000,$0BA8                                             ;81B787|        |      ;
    db $02,$01                                                 ;81B78B|        |      ;
    dw $0000,$0BB0                                             ;81B78D|        |      ;
    db $02,$01                                                 ;81B791|        |      ;
    dw $0000,$0BB8                                             ;81B793|        |      ;
    db $02,$01                                                 ;81B797|        |      ;
    dw $0000,$0C00                                             ;81B799|        |      ;
    db $02,$01                                                 ;81B79D|        |      ;
    dw $0000,$0C08                                             ;81B79F|        |      ;
    db $02,$01                                                 ;81B7A3|        |      ;
    dw $0000,$0C10                                             ;81B7A5|        |      ;
    db $02,$01                                                 ;81B7A9|        |      ;
    dw $0000,$0C18                                             ;81B7AB|        |      ;
    db $01,$01                                                 ;81B7AF|        |      ;
    dw $00F2,$0C1C                                             ;81B7B1|        |      ;
    db $01,$01                                                 ;81B7B5|        |      ;
    dw $00F3,$0C20                                             ;81B7B7|        |      ;
    db $01,$01                                                 ;81B7BB|        |      ;
    dw $00F4,$0C24                                             ;81B7BD|        |      ;
    db $01,$01                                                 ;81B7C1|        |      ;
    dw $00F5,$0C28                                             ;81B7C3|        |      ;
    db $01,$01                                                 ;81B7C7|        |      ;
    dw $00F1,$0C2C                                             ;81B7C9|        |      ;
    db $01,$01                                                 ;81B7CD|        |      ;
    dw $00F6,$0C30                                             ;81B7CF|        |      ;
    db $01,$01                                                 ;81B7D3|        |      ;
    dw $0020,$0C34                                             ;81B7D5|        |      ;
    db $01,$01                                                 ;81B7D9|        |      ;
    dw $0000,$0C38                                             ;81B7DB|        |      ;
    db $01,$01                                                 ;81B7DF|        |      ;
    dw $0021,$0C3C                                             ;81B7E1|        |      ;
    db $01,$01                                                 ;81B7E5|        |      ;
    dw $0000,$0C80                                             ;81B7E7|        |      ;
    db $02,$01                                                 ;81B7EB|        |      ;
    dw $0000,$0C88                                             ;81B7ED|        |      ;
    db $02,$01                                                 ;81B7F1|        |      ;
    dw $0000,$0C90                                             ;81B7F3|        |      ;
    db $02,$01                                                 ;81B7F7|        |      ;
    dw $0000,$0C98                                             ;81B7F9|        |      ;
    db $02,$01                                                 ;81B7FD|        |      ;
    dw $0000,$0CA0                                             ;81B7FF|        |      ;
    db $01,$01                                                 ;81B803|        |      ;
    dw $00F1,$0CA4                                             ;81B805|        |      ;
    db $01,$01                                                 ;81B809|        |      ;
    dw $0022,$0CA8                                             ;81B80B|        |      ;
    db $01,$01                                                 ;81B80F|        |      ;
    dw $0000,$0CAC                                             ;81B811|        |      ;
    db $02,$01                                                 ;81B815|        |      ;
    dw $0000,$0CB4                                             ;81B817|        |      ;
    db $02,$01                                                 ;81B81B|        |      ;
    dw $0000,$0CBC                                             ;81B81D|        |      ;
    db $01,$01                                                 ;81B821|        |      ;
    dw $00F8,$0D00                                             ;81B823|        |      ;
    db $01,$01                                                 ;81B827|        |      ;
    dw $00F9,$0D04                                             ;81B829|        |      ;
    db $01,$01                                                 ;81B82D|        |      ;
    dw $00FA,$0D08                                             ;81B82F|        |      ;
    db $01,$01                                                 ;81B833|        |      ;
    dw $00FB,$0D0C                                             ;81B835|        |      ;
    db $01,$01                                                 ;81B839|        |      ;
    dw $00F7,$0D10                                             ;81B83B|        |      ;
    db $01,$01                                                 ;81B83F|        |      ;
    dw $00F6,$0D14                                             ;81B841|        |      ;
    db $01,$01                                                 ;81B845|        |      ;
    dw $00F4,$0D18                                             ;81B847|        |      ;
    db $01,$01                                                 ;81B84B|        |      ;
    dw $00F5,$0D1C                                             ;81B84D|        |      ;
    db $01,$01                                                 ;81B851|        |      ;
    dw $0020,$0D20                                             ;81B853|        |      ;
    db $01,$01                                                 ;81B857|        |      ;
    dw $0021,$0D24                                             ;81B859|        |      ;
    db $02,$01                                                 ;81B85D|        |      ;
    dw $0000,$0D2C                                             ;81B85F|        |      ;
    db $02,$01                                                 ;81B863|        |      ;
    dw $0000,$0D34                                             ;81B865|        |      ;
    db $01,$01                                                 ;81B869|        |      ;
    dw $00FA,$0D38                                             ;81B86B|        |      ;
    db $01,$01                                                 ;81B86F|        |      ;
    dw $00F9,$0D3C                                             ;81B871|        |      ;
    db $01,$01                                                 ;81B875|        |      ;
    dw $00FC,$0D80                                             ;81B877|        |      ;
    db $01,$01                                                 ;81B87B|        |      ;
    dw $00FB,$0D84                                             ;81B87D|        |      ;
    db $01,$01                                                 ;81B881|        |      ;
    dw $0022,$0D88                                             ;81B883|        |      ;
    db $02,$01                                                 ;81B887|        |      ;
    dw $0000,$0D90                                             ;81B889|        |      ;
    db $02,$01                                                 ;81B88D|        |      ;
    dw $0000,$0D98                                             ;81B88F|        |      ;
    db $01,$01                                                 ;81B893|        |      ;
    dw $0002,$0D9C                                             ;81B895|        |      ;
    db $01,$01                                                 ;81B899|        |      ;
    dw $0001,$0DA0                                             ;81B89B|        |      ;
    db $02,$02                                                 ;81B89F|        |      ;
    dw $0002,$0DB0                                             ;81B8A1|        |      ;
    db $02,$02                                                 ;81B8A5|        |      ;
    dw $00C3,$0E00                                             ;81B8A7|        |      ;
    db $05,$02                                                 ;81B8AB|        |      ;
    dw $0000,$0E28                                             ;81B8AD|        |      ;
    db $01,$01                                                 ;81B8B1|        |      ;
    dw $00D5,$0E2C                                             ;81B8B3|        |      ;
    db $01,$01                                                 ;81B8B7|        |      ;
    dw $0020,$0E30                                             ;81B8B9|        |      ;
    db $01,$01                                                 ;81B8BD|        |      ;
    dw $0004,$0E88                                             ;81B8BF|        |      ;
    db $02,$03                                                 ;81B8C3|        |      ;
    dw $0000,$0EA0                                             ;81B8C5|        |      ;
    db $01,$01                                                 ;81B8C9|        |      ;
    dw $0000,$0EA4                                             ;81B8CB|        |      ;
    db $01,$01                                                 ;81B8CF|        |      ;
    dw $0000,$0EA8                                             ;81B8D1|        |      ;
    db $01,$01                                                 ;81B8D5|        |      ;
    dw $0000,$0EAC                                             ;81B8D7|        |      ;
    db $01,$01                                                 ;81B8DB|        |      ;
    dw $0000,$0EB8                                             ;81B8DD|        |      ;
    db $01,$01                                                 ;81B8E1|        |      ;
    dw $002E,$012C                                             ;81B8E3|        |      ;
    db $01,$01                                                 ;81B8E7|        |      ;
    dw $001E,$0130                                             ;81B8E9|        |      ;
    db $01,$01                                                 ;81B8ED|        |      ;
    dw $0000,$0134                                             ;81B8EF|        |      ;
    db $01,$01                                                 ;81B8F3|        |      ;
    dw $001D,$0E80                                             ;81B8F5|        |      ;
    db $02,$02                                                 ;81B8F9|        |      ;
    dw $0000,$0E90                                             ;81B8FB|        |      ;
    db $02,$02                                                 ;81B8FF|        |      ;
    dw $0000,$0F00                                             ;81B901|        |      ;
    db $02,$01                                                 ;81B905|        |      ;
    dw $0000,$0F0C                                             ;81B907|        |      ;
    db $01,$01                                                 ;81B90B|        |      ;
    dw $00F9,$0F10                                             ;81B90D|        |      ;
    db $01,$01                                                 ;81B911|        |      ;
    dw $0000,$0F08                                             ;81B913|        |      ;
    db $01,$01                                                 ;81B917|        |      ;
    dw $0000,$0F18                                             ;81B919|        |      ;
    db $02,$01                                                 ;81B91D|        |      ;
    dw $00C3,$0F20                                             ;81B91F|        |      ;
    db $03,$02                                                 ;81B923|        |      ;
    dw $0000,$0EBC                                             ;81B925|        |      ;
    db $01,$01                                                 ;81B929|        |      ;
    dw $0012,$0F38                                             ;81B92B|        |      ;
    db $01,$01                                                 ;81B92F|        |      ;
    dw $0062,$0F3C                                             ;81B931|        |      ;
    db $01,$01                                                 ;81B935|        |      ;
    dw $0063,$0F80                                             ;81B937|        |      ;
    db $01,$01                                                 ;81B93B|        |      ;
    dw $0064,$0F84                                             ;81B93D|        |      ;
    db $01,$01                                                 ;81B941|        |      ;
    dw $00A1,$0F88                                             ;81B943|        |      ;
    db $01,$01                                                 ;81B947|        |      ;
    dw $0000,$0F8C                                             ;81B949|        |      ;
    db $01,$01                                                 ;81B94D|        |      ;
    dw $0000,$0F90                                             ;81B94F|        |      ;
    db $01,$01                                                 ;81B953|        |      ;
    dw $0000,$0F94                                             ;81B955|        |      ;
    db $01,$01                                                 ;81B959|        |      ;
    dw $0000,$0000                                             ;81B95B|        |      ;
    db $00,$00                                                 ;81B95F|        |      ;
    dw $0000                                                   ;81B961|        |      ;
pTable_81B963:
    dl DATA8_81BA3E                                            ;81B963|        |81BA3E; 0x49 * [ptr24]
    dl DATA8_81BA5C                                            ;81B966|        |81BA5C;
    dl DATA8_81BA6F                                            ;81B969|        |81BA6F;
    dl DATA8_81BA82                                            ;81B96C|        |81BA82;
    dl DATA8_81BA8B                                            ;81B96F|        |81BA8B;
    dl DATA8_81BA9E                                            ;81B972|        |81BA9E;
    dl DATA8_81BAB1                                            ;81B975|        |81BAB1;
    dl DATA8_81BABA                                            ;81B978|        |81BABA;
    dl DATA8_81BAC3                                            ;81B97B|        |81BAC3;
    dl DATA8_81BACC                                            ;81B97E|        |81BACC;
    dl DATA8_81BADF                                            ;81B981|        |81BADF;
    dl DATA8_81BAE8                                            ;81B984|        |81BAE8;
    dl DATA8_81BAF1                                            ;81B987|        |81BAF1;
    dl DATA8_81BB04                                            ;81B98A|        |81BB04;
    dl DATA8_81BB0D                                            ;81B98D|        |81BB0D;
    dl DATA8_81BB16                                            ;81B990|        |81BB16;
    dl DATA8_81BB1F                                            ;81B993|        |81BB1F;
    dl DATA8_81BB28                                            ;81B996|        |81BB28;
    dl DATA8_81BB31                                            ;81B999|        |81BB31;
    dl DATA8_81BB3A                                            ;81B99C|        |81BB3A;
    dl DATA8_81BB43                                            ;81B99F|        |81BB43;
    dl DATA8_81BB4C                                            ;81B9A2|        |81BB4C;
    dl DATA8_81BB63                                            ;81B9A5|        |81BB63;
    dl DATA8_81BB6C                                            ;81B9A8|        |81BB6C;
    dl DATA8_81BB75                                            ;81B9AB|        |81BB75;
    dl DATA8_81BB7E                                            ;81B9AE|        |81BB7E;
    dl DATA8_81BB87                                            ;81B9B1|        |81BB87;
    dl DATA8_81BB90                                            ;81B9B4|        |81BB90;
    dl DATA8_81BB99                                            ;81B9B7|        |81BB99;
    dl DATA8_81BBA2                                            ;81B9BA|        |81BBA2;
    dl DATA8_81BBAB                                            ;81B9BD|        |81BBAB;
    dl DATA8_81BBB4                                            ;81B9C0|        |81BBB4;
    dl DATA8_81BBBD                                            ;81B9C3|        |81BBBD;
    dl DATA8_81BBC6                                            ;81B9C6|        |81BBC6;
    dl DATA8_81BBCF                                            ;81B9C9|        |81BBCF;
    dl DATA8_81BBD8                                            ;81B9CC|        |81BBD8;
    dl DATA8_81BBE1                                            ;81B9CF|        |81BBE1;
    dl DATA8_81BBF1                                            ;81B9D2|        |81BBF1;
    dl DATA8_81BC01                                            ;81B9D5|        |81BC01;
    dl DATA8_81BC11                                            ;81B9D8|        |81BC11;
    dl DATA8_81BC2F                                            ;81B9DB|        |81BC2F;
    dl DATA8_81BC42                                            ;81B9DE|        |81BC42;
    dl DATA8_81BC55                                            ;81B9E1|        |81BC55;
    dl DATA8_81BC5E                                            ;81B9E4|        |81BC5E;
    dl DATA8_81BC71                                            ;81B9E7|        |81BC71;
    dl DATA8_81BC84                                            ;81B9EA|        |81BC84;
    dl DATA8_81BC8D                                            ;81B9ED|        |81BC8D;
    dl DATA8_81BC96                                            ;81B9F0|        |81BC96;
    dl DATA8_81BC9F                                            ;81B9F3|        |81BC9F;
    dl DATA8_81BCB2                                            ;81B9F6|        |81BCB2;
    dl DATA8_81BCBB                                            ;81B9F9|        |81BCBB;
    dl DATA8_81BCC4                                            ;81B9FC|        |81BCC4;
    dl DATA8_81BCD7                                            ;81B9FF|        |81BCD7;
    dl DATA8_81BCF5                                            ;81BA02|        |81BCF5;
    dl DATA8_81BD08                                            ;81BA05|        |81BD08;
    dl DATA8_81BD1B                                            ;81BA08|        |81BD1B;
    dl DATA8_81BD24                                            ;81BA0B|        |81BD24;
    dl DATA8_81BD37                                            ;81BA0E|        |81BD37;
    dl DATA8_81BD4A                                            ;81BA11|        |81BD4A;
    dl DATA8_81BD53                                            ;81BA14|        |81BD53;
    dl DATA8_81BD5C                                            ;81BA17|        |81BD5C;
    dl DATA8_81BD65                                            ;81BA1A|        |81BD65;
    dl DATA8_81BD78                                            ;81BA1D|        |81BD78;
    dl DATA8_81BD81                                            ;81BA20|        |81BD81;
    dl DATA8_81BD8A                                            ;81BA23|        |81BD8A;
    dl DATA8_81BD9D                                            ;81BA26|        |81BD9D;
    dl DATA8_81BDBB                                            ;81BA29|        |81BDBB;
    dl DATA8_81BDC4                                            ;81BA2C|        |81BDC4;
    dl DATA8_81BDCD                                            ;81BA2F|        |81BDCD;
    dl DATA8_81BDEB                                            ;81BA32|        |81BDEB;
    dl DATA8_81BDF4                                            ;81BA35|        |81BDF4;
    dl DATA8_81BDFD                                            ;81BA38|        |81BDFD;
    dl DATA8_81BE06                                            ;81BA3B|        |81BE06;
 
DATA8_81BA3E:
    db $61,$00,$B0,$00,$40,$00,$20,$62,$00,$B0,$00,$40         ;81BA3E|        |      ; FFFF ends, FFFE followed by ptr24 (loops)
    db $00,$10,$61,$00,$B0,$00,$40,$00,$20,$63,$00,$B0         ;81BA4A|        |      ;
    db $00,$40,$00,$30                                         ;81BA56|        |      ;
    dw $FFFF                                                   ;81BA5A|        |      ;
 
DATA8_81BA5C:
    db $64,$00,$B0,$00,$40,$00,$06,$65,$00,$B0,$00,$40         ;81BA5C|        |      ;
    db $00,$06,$FE,$FF                                         ;81BA68|        |      ;
    dl DATA8_81BA5C                                            ;81BA6C|        |81BA5C;
 
DATA8_81BA6F:
    db $66,$00,$B0,$00,$40,$00,$06,$67,$00,$B0,$00,$40         ;81BA6F|        |      ;
    db $00,$06                                                 ;81BA7B|        |      ;
    dw $FFFE                                                   ;81BA7D|        |      ;
    dl DATA8_81BA6F                                            ;81BA7F|        |81BA6F;
 
DATA8_81BA82:
    db $68,$00,$B0,$00,$40,$00,$04                             ;81BA82|        |      ;
    dw $FFFF                                                   ;81BA89|        |      ;
 
DATA8_81BA8B:
    db $69,$00,$B0,$00,$40,$00,$06,$6A,$00,$B0,$00,$40         ;81BA8B|        |      ;
    db $00,$06                                                 ;81BA97|        |      ;
    dw $FFFE                                                   ;81BA99|        |      ;
    dl DATA8_81BA8B                                            ;81BA9B|        |81BA8B;
 
DATA8_81BA9E:
    db $6B,$00,$B0,$00,$40,$00,$06,$6C,$00,$B0,$00,$40         ;81BA9E|        |      ;
    db $00,$06                                                 ;81BAAA|        |      ;
    dw $FFFE                                                   ;81BAAC|        |      ;
    dl DATA8_81BA9E                                            ;81BAAE|        |81BA9E;
 
DATA8_81BAB1:
    db $6D,$00,$B0,$00,$40,$00,$04                             ;81BAB1|        |      ;
    dw $FFFF                                                   ;81BAB8|        |      ;
 
DATA8_81BABA:
    db $6E,$00,$B0,$00,$40,$00,$04                             ;81BABA|        |      ;
    dw $FFFF                                                   ;81BAC1|        |      ;
 
DATA8_81BAC3:
    db $6F,$00,$B0,$00,$40,$00,$04                             ;81BAC3|        |      ;
    dw $FFFF                                                   ;81BACA|        |      ;
 
DATA8_81BACC:
    db $70,$00,$B0,$00,$40,$00,$06,$71,$00,$B0,$00,$40         ;81BACC|        |      ;
    db $00,$06                                                 ;81BAD8|        |      ;
    dw $FFFE                                                   ;81BADA|        |      ;
    dl DATA8_81BACC                                            ;81BADC|        |81BACC;
 
DATA8_81BADF:
    db $72,$00,$B0,$00,$40,$00,$04                             ;81BADF|        |      ;
    dw $FFFF                                                   ;81BAE6|        |      ;
 
DATA8_81BAE8:
    db $6E,$00,$B0,$00,$40,$00,$04                             ;81BAE8|        |      ;
    dw $FFFF                                                   ;81BAEF|        |      ;
 
DATA8_81BAF1:
    db $73,$00,$B0,$00,$40,$00,$06,$74,$00,$B0,$00,$40         ;81BAF1|        |      ;
    db $00,$06                                                 ;81BAFD|        |      ;
    dw $FFFE                                                   ;81BAFF|        |      ;
    dl DATA8_81BAF1                                            ;81BB01|        |81BAF1;
 
DATA8_81BB04:
    db $02,$00,$80,$00,$30,$01,$00                             ;81BB04|        |      ;
    dw $FFFF                                                   ;81BB0B|        |      ;
 
DATA8_81BB0D:
    db $04,$00,$40,$01,$40,$01,$00                             ;81BB0D|        |      ;
    dw $FFFF                                                   ;81BB14|        |      ;
 
DATA8_81BB16:
    db $06,$00,$C0,$01,$40,$01,$00                             ;81BB16|        |      ;
    dw $FFFF                                                   ;81BB1D|        |      ;
 
DATA8_81BB1F:
    db $08,$00,$A0,$01,$C0,$01,$00                             ;81BB1F|        |      ;
    dw $FFFF                                                   ;81BB26|        |      ;
 
DATA8_81BB28:
    db $0A,$00,$70,$00,$90,$01,$00                             ;81BB28|        |      ;
    dw $FFFF                                                   ;81BB2F|        |      ;
 
DATA8_81BB31:
    db $09,$00,$70,$00,$90,$01,$00                             ;81BB31|        |      ;
    dw $FFFF                                                   ;81BB38|        |      ;
 
DATA8_81BB3A:
    db $DC,$00,$00,$02,$00,$02,$00                             ;81BB3A|        |      ;
    dw $FFFF                                                   ;81BB41|        |      ;
 
DATA8_81BB43:
    db $A4,$00,$90,$00,$70,$00,$00                             ;81BB43|        |      ;
    dw $FFFF                                                   ;81BB4A|        |      ;
 
DATA8_81BB4C:
    db $AB,$00,$60,$01,$70,$00,$08,$AC,$00,$60,$01,$70         ;81BB4C|        |      ;
    db $00,$08,$AD,$00,$60,$01,$70,$00,$08                     ;81BB58|        |      ;
    dw $FFFF                                                   ;81BB61|        |      ;
 
DATA8_81BB63:
    db $A6,$00,$50,$02,$C0,$00,$00                             ;81BB63|        |      ;
    dw $FFFF                                                   ;81BB6A|        |      ;
 
DATA8_81BB6C:
    db $A6,$00,$90,$00,$40,$03,$00                             ;81BB6C|        |      ;
    dw $FFFF                                                   ;81BB73|        |      ;
 
DATA8_81BB75:
    db $A6,$00,$10,$01,$40,$03,$00                             ;81BB75|        |      ;
    dw $FFFF                                                   ;81BB7C|        |      ;
 
DATA8_81BB7E:
    db $A6,$00,$90,$01,$40,$03,$00                             ;81BB7E|        |      ;
    dw $FFFF                                                   ;81BB85|        |      ;
 
DATA8_81BB87:
    db $AF,$00,$50,$02,$50,$03,$00                             ;81BB87|        |      ;
    dw $FFFF                                                   ;81BB8E|        |      ;
 
DATA8_81BB90:
    db $B1,$00,$40,$02,$40,$02,$00                             ;81BB90|        |      ;
    dw $FFFF                                                   ;81BB97|        |      ;
 
DATA8_81BB99:
    db $B3,$00,$90,$00,$20,$00,$00                             ;81BB99|        |      ;
    dw $FFFF                                                   ;81BBA0|        |      ;
 
DATA8_81BBA2:
    db $B4,$00,$90,$00,$30,$01,$00                             ;81BBA2|        |      ;
    dw $FFFF                                                   ;81BBA9|        |      ;
 
DATA8_81BBAB:
    db $B6,$00,$60,$00,$20,$01,$00                             ;81BBAB|        |      ;
    dw $FFFF                                                   ;81BBB2|        |      ;
 
DATA8_81BBB4:
    db $D5,$00,$50,$00,$20,$00,$00                             ;81BBB4|        |      ;
    dw $FFFF                                                   ;81BBBB|        |      ;
 
DATA8_81BBBD:
    db $C4,$00,$60,$00,$20,$01,$00                             ;81BBBD|        |      ;
    dw $FFFF                                                   ;81BBC4|        |      ;
 
DATA8_81BBC6:
    db $C9,$00,$60,$00,$20,$01,$00                             ;81BBC6|        |      ;
    dw $FFFF                                                   ;81BBCD|        |      ;
 
DATA8_81BBCF:
    db $C2,$00,$80,$00,$20,$01,$00                             ;81BBCF|        |      ;
    dw $FFFF                                                   ;81BBD6|        |      ;
 
DATA8_81BBD8:
    db $77,$00,$70,$00,$20,$00,$00                             ;81BBD8|        |      ;
    dw $FFFF                                                   ;81BBDF|        |      ;
 
DATA8_81BBE1:
    db $0B,$00,$80,$00,$D0,$01,$08,$0C,$00,$80,$00,$D0         ;81BBE1|        |      ;
    db $01,$08                                                 ;81BBED|        |      ;
    dw $FFFF                                                   ;81BBEF|        |      ;
 
DATA8_81BBF1:
    db $A1,$00,$00,$00,$50,$01,$08,$A2,$00,$00,$00,$50         ;81BBF1|        |      ;
    db $01,$08                                                 ;81BBFD|        |      ;
    dw $FFFF                                                   ;81BBFF|        |      ;
 
DATA8_81BC01:
    db $A1,$00,$00,$00,$B0,$00,$08,$A2,$00,$00,$00,$B0         ;81BC01|        |      ;
    db $00,$08                                                 ;81BC0D|        |      ;
    dw $FFFF                                                   ;81BC0F|        |      ;
 
DATA8_81BC11:
    db $61,$00,$B0,$00,$40,$00,$20,$62,$00,$B0,$00,$40         ;81BC11|        |      ;
    db $00,$10,$61,$00,$B0,$00,$40,$00,$20,$63,$00,$B0         ;81BC1D|        |      ;
    db $00,$40,$00,$30                                         ;81BC29|        |      ;
    dw $FFFF                                                   ;81BC2D|        |      ;
 
DATA8_81BC2F:
    db $64,$00,$B0,$00,$40,$00,$06,$65,$00,$B0,$00,$40         ;81BC2F|        |      ;
    db $00,$06                                                 ;81BC3B|        |      ;
    dw $FFFE                                                   ;81BC3D|        |      ;
    dl DATA8_81BC2F                                            ;81BC3F|        |81BC2F;
 
DATA8_81BC42:
    db $66,$00,$B0,$00,$40,$00,$06,$67,$00,$B0,$00,$40         ;81BC42|        |      ;
    db $00,$06                                                 ;81BC4E|        |      ;
    dw $FFFE                                                   ;81BC50|        |      ;
    dl DATA8_81BC42                                            ;81BC52|        |81BC42;
 
DATA8_81BC55:
    db $68,$00,$B0,$00,$40,$00,$04                             ;81BC55|        |      ;
    dw $FFFF                                                   ;81BC5C|        |      ;
 
DATA8_81BC5E:
    db $69,$00,$B0,$00,$40,$00,$06,$6A,$00,$B0,$00,$40         ;81BC5E|        |      ;
    db $00,$06                                                 ;81BC6A|        |      ;
    dw $FFFE                                                   ;81BC6C|        |      ;
    dl DATA8_81BC5E                                            ;81BC6E|        |81BC5E;
 
DATA8_81BC71:
    db $6B,$00,$B0,$00,$40,$00,$06,$6C,$00,$B0,$00,$40         ;81BC71|        |      ;
    db $00,$06                                                 ;81BC7D|        |      ;
    dw $FFFE                                                   ;81BC7F|        |      ;
    dl DATA8_81BC71                                            ;81BC81|        |81BC71;
 
DATA8_81BC84:
    db $6D,$00,$B0,$00,$40,$00,$04                             ;81BC84|        |      ;
    dw $FFFF                                                   ;81BC8B|        |      ;
 
DATA8_81BC8D:
    db $6E,$00,$B0,$00,$40,$00,$04                             ;81BC8D|        |      ;
    dw $FFFF                                                   ;81BC94|        |      ;
 
DATA8_81BC96:
    db $6F,$00,$B0,$00,$40,$00,$04                             ;81BC96|        |      ;
    dw $FFFF                                                   ;81BC9D|        |      ;
 
DATA8_81BC9F:
    db $70,$00,$B0,$00,$40,$00,$06,$71,$00,$B0,$00,$40         ;81BC9F|        |      ;
    db $00,$06                                                 ;81BCAB|        |      ;
    dw $FFFE                                                   ;81BCAD|        |      ;
    dl DATA8_81BC9F                                            ;81BCAF|        |81BC9F;
 
DATA8_81BCB2:
    db $72,$00,$B0,$00,$40,$00,$04                             ;81BCB2|        |      ;
    dw $FFFF                                                   ;81BCB9|        |      ;
 
DATA8_81BCBB:
    db $6E,$00,$B0,$00,$40,$00,$04                             ;81BCBB|        |      ;
    dw $FFFF                                                   ;81BCC2|        |      ;
 
DATA8_81BCC4:
    db $73,$00,$B0,$00,$40,$00,$06,$74,$00,$B0,$00,$40         ;81BCC4|        |      ;
    db $00,$06                                                 ;81BCD0|        |      ;
    dw $FFFE                                                   ;81BCD2|        |      ;
    dl DATA8_81BCC4                                            ;81BCD4|        |81BCC4;
 
DATA8_81BCD7:
    db $61,$00,$C0,$00,$40,$00,$20,$62,$00,$C0,$00,$40         ;81BCD7|        |      ;
    db $00,$10,$61,$00,$C0,$00,$40,$00,$20,$63,$00,$C0         ;81BCE3|        |      ;
    db $00,$40,$00,$30                                         ;81BCEF|        |      ;
    dw $FFFF                                                   ;81BCF3|        |      ;
 
DATA8_81BCF5:
    db $64,$00,$C0,$00,$40,$00,$06,$65,$00,$C0,$00,$40         ;81BCF5|        |      ;
    db $00,$06                                                 ;81BD01|        |      ;
    dw $FFFE                                                   ;81BD03|        |      ;
    dl DATA8_81BCF5                                            ;81BD05|        |81BCF5;
 
DATA8_81BD08:
    db $66,$00,$C0,$00,$40,$00,$06,$67,$00,$C0,$00,$40         ;81BD08|        |      ;
    db $00,$06                                                 ;81BD14|        |      ;
    dw $FFFE                                                   ;81BD16|        |      ;
    dl DATA8_81BD08                                            ;81BD18|        |81BD08;
 
DATA8_81BD1B:
    db $68,$00,$C0,$00,$40,$00,$04                             ;81BD1B|        |      ;
    dw $FFFF                                                   ;81BD22|        |      ;
 
DATA8_81BD24:
    db $69,$00,$C0,$00,$40,$00,$06,$6A,$00,$C0,$00,$40         ;81BD24|        |      ;
    db $00,$06                                                 ;81BD30|        |      ;
    dw $FFFE                                                   ;81BD32|        |      ;
    dl DATA8_81BD24                                            ;81BD34|        |81BD24;
 
DATA8_81BD37:
    db $6B,$00,$C0,$00,$40,$00,$06,$6C,$00,$C0,$00,$40         ;81BD37|        |      ;
    db $00,$06                                                 ;81BD43|        |      ;
    dw $FFFE                                                   ;81BD45|        |      ;
    dl DATA8_81BD37                                            ;81BD47|        |81BD37;
 
DATA8_81BD4A:
    db $6D,$00,$C0,$00,$40,$00,$04                             ;81BD4A|        |      ;
    dw $FFFF                                                   ;81BD51|        |      ;
 
DATA8_81BD53:
    db $6E,$00,$C0,$00,$40,$00,$04                             ;81BD53|        |      ;
    dw $FFFF                                                   ;81BD5A|        |      ;
 
DATA8_81BD5C:
    db $6F,$00,$C0,$00,$40,$00,$04                             ;81BD5C|        |      ;
    dw $FFFF                                                   ;81BD63|        |      ;
 
DATA8_81BD65:
    db $70,$00,$C0,$00,$40,$00,$06,$71,$00,$C0,$00,$40         ;81BD65|        |      ;
    db $00,$06                                                 ;81BD71|        |      ;
    dw $FFFE                                                   ;81BD73|        |      ;
    dl DATA8_81BD65                                            ;81BD75|        |81BD65;
 
DATA8_81BD78:
    db $72,$00,$C0,$00,$40,$00,$04                             ;81BD78|        |      ;
    dw $FFFF                                                   ;81BD7F|        |      ;
 
DATA8_81BD81:
    db $6E,$00,$C0,$00,$40,$00,$04                             ;81BD81|        |      ;
    dw $FFFF                                                   ;81BD88|        |      ;
 
DATA8_81BD8A:
    db $73,$00,$C0,$00,$40,$00,$06,$74,$00,$C0,$00,$40         ;81BD8A|        |      ;
    db $00,$06                                                 ;81BD96|        |      ;
    dw $FFFE                                                   ;81BD98|        |      ;
    dl DATA8_81BD8A                                            ;81BD9A|        |81BD8A;
 
DATA8_81BD9D:
    db $E6,$00,$80,$00,$10,$01,$06,$E7,$00,$80,$00,$10         ;81BD9D|        |      ;
    db $01,$06,$E8,$00,$80,$00,$10,$01,$06,$E9,$00,$80         ;81BDA9|        |      ;
    db $00,$10,$01,$06                                         ;81BDB5|        |      ;
    dw $FFFF                                                   ;81BDB9|        |      ;
 
DATA8_81BDBB:
    db $F3,$00,$80,$00,$10,$01,$06                             ;81BDBB|        |      ;
    dw $FFFF                                                   ;81BDC2|        |      ;
 
DATA8_81BDC4:
    db $F4,$00,$40,$00,$70,$00,$00                             ;81BDC4|        |      ;
    dw $FFFF                                                   ;81BDCB|        |      ;
 
DATA8_81BDCD:
    db $56,$00,$20,$01,$40,$01,$08,$55,$00,$20,$01,$40         ;81BDCD|        |      ;
    db $01,$08,$57,$00,$20,$01,$40,$01,$08,$55,$00,$20         ;81BDD9|        |      ;
    db $01,$40,$01,$08                                         ;81BDE5|        |      ;
    dw $FFFF                                                   ;81BDE9|        |      ;
 
DATA8_81BDEB:
    db $FA,$00,$10,$01,$F0,$00,$08                             ;81BDEB|        |      ;
    dw $FFFF                                                   ;81BDF2|        |      ;
 
DATA8_81BDF4:
    db $75,$00,$B0,$00,$40,$00,$04                             ;81BDF4|        |      ;
    dw $FFFF                                                   ;81BDFB|        |      ;
 
DATA8_81BDFD:
    db $75,$00,$B0,$00,$40,$00,$04                             ;81BDFD|        |      ;
    dw $FFFF                                                   ;81BE04|        |      ;
 
DATA8_81BE06:
    db $75,$00,$C0,$00,$40,$00,$04                             ;81BE06|        |      ;
    dw $FFFF                                                   ;81BE0D|        |      ;
 
nCarriedItemTable_81BE0F:
    dw $0000,$0000,$0000                                       ;81BE0F|        |      ; 0x31 * [n16, n16, n16, n8 nSheedRowId, n8 nTileIdMaybe]
    db $00,$00                                                 ;81BE15|        |      ;
    dw $0090,$0090,$0078                                       ;81BE17|        |      ;
    db $00,$01                                                 ;81BE1D|        |      ;
    dw $00A0,$0090,$0079                                       ;81BE1F|        |      ;
    db $00,$02                                                 ;81BE25|        |      ;
    dw $00B0,$0090,$007A                                       ;81BE27|        |      ;
    db $00,$04                                                 ;81BE2D|        |      ;
    dw $00C0,$0090,$007B                                       ;81BE2F|        |      ;
    db $00,$08                                                 ;81BE35|        |      ;
    dw $0090,$0060,$007C                                       ;81BE37|        |      ;
    db $00,$10                                                 ;81BE3D|        |      ;
    dw $00A0,$0060,$007D                                       ;81BE3F|        |      ;
    db $00,$20                                                 ;81BE45|        |      ;
    dw $00B0,$0060,$007E                                       ;81BE47|        |      ;
    db $00,$40                                                 ;81BE4D|        |      ;
    dw $00C0,$0060,$007F                                       ;81BE4F|        |      ;
    db $00,$80                                                 ;81BE55|        |      ;
    dw $0030,$0060,$0080                                       ;81BE57|        |      ;
    db $01,$01                                                 ;81BE5D|        |      ;
    dw $0040,$0060,$0081                                       ;81BE5F|        |      ;
    db $01,$02                                                 ;81BE65|        |      ;
    dw $0050,$0060,$0082                                       ;81BE67|        |      ;
    db $01,$04                                                 ;81BE6D|        |      ;
    dw $0060,$0060,$0083                                       ;81BE6F|        |      ;
    db $01,$08                                                 ;81BE75|        |      ;
    dw $0030,$0090,$0084                                       ;81BE77|        |      ;
    db $01,$10                                                 ;81BE7D|        |      ;
    dw $0040,$0090,$0085                                       ;81BE7F|        |      ;
    db $01,$20                                                 ;81BE85|        |      ;
    dw $0050,$0090,$0086                                       ;81BE87|        |      ;
    db $01,$40                                                 ;81BE8D|        |      ;
    dw $0060,$0090,$0087                                       ;81BE8F|        |      ;
    db $01,$80                                                 ;81BE95|        |      ;
    dw $0090,$0090,$0088                                       ;81BE97|        |      ;
    db $02,$01                                                 ;81BE9D|        |      ;
    dw $00A0,$0090,$0089                                       ;81BE9F|        |      ;
    db $02,$02                                                 ;81BEA5|        |      ;
    dw $00B0,$0090,$008A                                       ;81BEA7|        |      ;
    db $02,$04                                                 ;81BEAD|        |      ;
    dw $00C0,$0090,$008B                                       ;81BEAF|        |      ;
    db $02,$08                                                 ;81BEB5|        |      ;
    dw $0060,$0090,$008C                                       ;81BEB7|        |      ;
    db $02,$10                                                 ;81BEBD|        |      ;
    dw $0040,$00C0,$008D                                       ;81BEBF|        |      ;
    db $02,$20                                                 ;81BEC5|        |      ;
    dw $0030,$00C0,$008E                                       ;81BEC7|        |      ;
    db $02,$40                                                 ;81BECD|        |      ;
    dw $00B0,$00C0,$008F                                       ;81BECF|        |      ;
    db $02,$80                                                 ;81BED5|        |      ;
    dw $0040,$00C0,$009D                                       ;81BED7|        |      ;
    db $03,$01                                                 ;81BEDD|        |      ;
    dw $0040,$0160,$0094                                       ;81BEDF|        |      ;
    db $03,$02                                                 ;81BEE5|        |      ;
    dw $0000,$0000,$0000                                       ;81BEE7|        |      ;
    db $03,$04                                                 ;81BEED|        |      ;
    dw $0000,$0000,$0000                                       ;81BEEF|        |      ;
    db $00,$00                                                 ;81BEF5|        |      ;
    dw $0090,$0140,$00B7                                       ;81BEF7|        |      ;
    db $00,$10                                                 ;81BEFD|        |      ;
    dw $00A0,$0140,$00B8                                       ;81BEFF|        |      ;
    db $00,$20                                                 ;81BF05|        |      ;
    dw $00B0,$0140,$00B9                                       ;81BF07|        |      ;
    db $00,$40                                                 ;81BF0D|        |      ;
    dw $00C0,$0140,$00BA                                       ;81BF0F|        |      ;
    db $00,$80                                                 ;81BF15|        |      ;
    dw $00D0,$0140,$00BB                                       ;81BF17|        |      ;
    db $01,$08                                                 ;81BF1D|        |      ;
    dw $00E0,$0150,$00BC                                       ;81BF1F|        |      ;
    db $00,$00                                                 ;81BF25|        |      ;
    dw $0000,$0000,$0000                                       ;81BF27|        |      ;
    db $00,$00                                                 ;81BF2D|        |      ;
    dw $00E0,$0170,$00D1                                       ;81BF2F|        |      ;
    db $01,$10                                                 ;81BF35|        |      ;
    dw $00E0,$0150,$00D0                                       ;81BF37|        |      ;
    db $01,$20                                                 ;81BF3D|        |      ;
    dw $00E0,$0160,$00CF                                       ;81BF3F|        |      ;
    db $01,$40                                                 ;81BF45|        |      ;
    dw $0090,$0140,$00CA                                       ;81BF47|        |      ;
    db $02,$01                                                 ;81BF4D|        |      ;
    dw $00A0,$0140,$00CB                                       ;81BF4F|        |      ;
    db $02,$02                                                 ;81BF55|        |      ;
    dw $00B0,$0140,$00CC                                       ;81BF57|        |      ;
    db $02,$04                                                 ;81BF5D|        |      ;
    dw $00C0,$0140,$00CD                                       ;81BF5F|        |      ;
    db $02,$08                                                 ;81BF65|        |      ;
    dw $00D0,$0140,$00CE                                       ;81BF67|        |      ;
    db $02,$10                                                 ;81BF6D|        |      ;
    dw $0000,$0000,$0000                                       ;81BF6F|        |      ;
    db $00,$00                                                 ;81BF75|        |      ;
    dw $0020,$0070,$00D6                                       ;81BF77|        |      ;
    db $01,$02                                                 ;81BF7D|        |      ;
    dw $0030,$0070,$00D7                                       ;81BF7F|        |      ;
    db $01,$01                                                 ;81BF85|        |      ;
    dw $0030,$00A0,$00D9                                       ;81BF87|        |      ;
    db $03,$01                                                 ;81BF8D|        |      ;
    dw $0020,$00A0,$00D8                                       ;81BF8F|        |      ;
    db $03,$02                                                 ;81BF95|        |      ;
 
nMaskUnknown_81BF97:
    dw $0001,$0002,$0004,$0008,$0010,$0020                     ;81BF97|        |      ; 16 * [n16]
    dw $0040,$0080,$0100,$0200,$0400,$0800                     ;81BFA3|        |      ;
    dw $1000,$2000,$4000,$8000                                 ;81BFAF|        |      ;
 
fUnknownSubrutineHandler_81BFB7:
    SEP #$20                                                   ;81BFB7|E220    |      ;
    REP #$10                                                   ;81BFB9|C210    |      ;
    %CheckPlayerFlags(!PFLAGS_ACTIVE)
    BNE +                                                      ;81BFC2|D003    |81BFC7;
    JMP.W fUnknown_81C002                                      ;81BFC4|4C02C0  |81C002;
 
 
  + %CheckPlayerFlags(!PFLAGS_INTERACTING)
    BEQ fPlayerAction_Handler                                  ;81BFCE|F003    |81BFD3;
    JMP.W fPlayerInteraction_Handler                           ;81BFD0|4C70D5  |81D570;
 
 
fPlayerAction_Handler:
    REP #$30                                                   ;81BFD3|C230    |      ;
    LDA.B strcPlayer.action                                    ;81BFD5|A5D4    |0000D4;
    ASL A                                                      ;81BFD7|0A      |      ;
    TAX                                                        ;81BFD8|AA      |      ;
    JMP.W (aPlayerAction_JumpTable,X)                          ;81BFD9|7C27C0  |81C027;
 
 
fPlayerAction0x00:
    %CheckPlayerFlags(!PFLAGS_EATINGMEAL)
    BEQ +                                                      ;81BFE3|F003    |81BFE8;
    JMP.W fPlayerAction_EatMeal                                ;81BFE5|4C14CB  |81CB14;
 
 
  + LDA.B strcPlayer.action                                    ;81BFE8|A5D4    |0000D4;
    CMP.W #!PACTION_RUN                                               
    BNE +                                                      ;81BFED|D003    |81BFF2;
    JMP.W fPlayerAction_Run                                    ;81BFEF|4C36C7  |81C736;
 
 
  + CMP.W #!PACTION_WALK                                               
    BNE +                                                      ;81BFF5|D003    |81BFFA;
    JMP.W fPlayerAction_Walk                                   ;81BFF7|4C6EC6  |81C66E;
 
 
  + CMP.W #$000E                                               ;81BFFA|C90E00  |      ;
    BNE fUnknown_81C002                                        ;81BFFD|D003    |81C002;
    JMP.W fUnknown_81C83B                                      ;81BFFF|4C3BC8  |81C83B;
 
 
fUnknown_81C002:
    %CheckPlayerAction(!PACTION_NONE)
    BNE fPlayerAction0x19                                      ;81C009|D003    |81C00E;
    JMP.W fUnknown_81C556                                      ;81C00B|4C56C5  |81C556;
 
 
fPlayerAction0x19:
    SEP #$20                                                   ;81C00E|E220    |      ;
    STZ.W strcPlayerData.lastExcercise                         ;81C010|9C2509  |000925;
 
fUnknown_81C013:
    JSL.L fUnknown_809F61                                      ;81C013|22619F80|809F61;
    REP #$20                                                   ;81C017|C220    |      ;
    LDA.W #$0000                                               ;81C019|A90000  |      ;
    STA.B strcMap.unk1E                                        ;81C01C|851E    |00001E;
    LDA.W strcObjectData.direction                             ;81C01E|AD1109  |000911;
    STA.B strcPlayer.direction                                 ;81C021|85DA    |0000DA;
    STA.W strcObjectData.directionNew                          ;81C023|8D1309  |000913;
    RTL                                                        ;81C026|6B      |      ;
 
aPlayerAction_JumpTable:
    dw fPlayerAction0x00                                       ;81C027|        |81BFDC; 0x1D * [ptr16]
    dw fPlayerAction0x00                                       ;81C029|        |81BFDC;
    dw fPlayerAction0x00                                       ;81C02B|        |81BFDC;
    dw fPlayerAction0x03                                       ;81C02D|        |81C86B;
    dw fPlayerAction0x04                                       ;81C02F|        |81C991;
    dw fPlayerAction0x05                                       ;81C031|        |81C9DF;
    dw fPlayerAction0x00                                       ;81C033|        |81BFDC;
    dw fPlayerAction0x00                                       ;81C035|        |81BFDC;
    dw fPlayerAction0x08                                       ;81C037|        |81CA36;
    dw fPlayerAction0x09                                       ;81C039|        |81CB5E;
    dw fPlayerAction0x0A                                       ;81C03B|        |81C51A;
    dw fPlayerAction0x0B                                       ;81C03D|        |81C4EC;
    dw fPlayerAction0x0C_SelectDialog                          ;81C03F|        |81C395;
    dw fPlayerAction0x0D                                       ;81C041|        |81C364;
    dw fPlayerAction0x00                                       ;81C043|        |81BFDC;
    dw fPlayerAction0x0F                                       ;81C045|        |81C232;
    dw fPlayerAction0x10                                       ;81C047|        |81C242;
    dw fPlayerAction0x11_Fishing                               ;81C049|        |81C263;
    dw fPlayerAction0x12_FishingBite                           ;81C04B|        |81C28E;
    dw fPlayerAction0x13                                       ;81C04D|        |81C2AF;
    dw fPlayerAction0x14                                       ;81C04F|        |81C211;
    dw fPlayerAction0x15                                       ;81C051|        |81C1F0;
    dw fPlayerAction0x16                                       ;81C053|        |81C1A1;
    dw fPlayerAction0x17                                       ;81C055|        |81C111;
    dw fPlayerAction0x18                                       ;81C057|        |81C153;
    dw fPlayerAction0x19                                       ;81C059|        |81C00E;
    dw fPlayerAction0x1A                                       ;81C05B|        |81C0B5;
    dw fPlayerAction0x1B                                       ;81C05D|        |81C333;
    dw fPlayerAction0x1C                                       ;81C05F|        |81C061;
 
fPlayerAction0x1C:
    REP #$30                                                   ;81C061|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C06A|F003    |81C06F;
    JMP.W .label2                                              ;81C06C|4C8AC0  |81C08A;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    SEP #$20                                                   ;81C078|E220    |      ;
    REP #$10                                                   ;81C07A|C210    |      ;
    LDA.B #$00                                                 ;81C07C|A900    |      ;
    XBA                                                        ;81C07E|EB      |      ;
    LDA.W strcPlayerData.toolSecond                            ;81C07F|AD2309  |000923;
    CLC                                                        ;81C082|18      |      ;
    ADC.B #$90                                                 ;81C083|6990    |      ;
    REP #$20                                                   ;81C085|C220    |      ;
    STA.W strcObjectData.spriteIdx                             ;81C087|8D0109  |000901;
 
.label2:
    JSR.W fUnknown_81CFE6                                      ;81C08A|20E6CF  |81CFE6;
    REP #$30                                                   ;81C08D|C230    |      ;
    LDA.W strcObjectData.exist                                 ;81C08F|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C092|C9FFFF  |      ;
    BNE .exit                                                  ;81C095|D01B    |81C0B2;
    %SetPlayerAction(!PACTION_NONE)
    SEP #$20                                                   ;81C09E|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81C0A0|AD2109  |000921;
    PHA                                                        ;81C0A3|48      |      ;
    LDA.W strcPlayerData.toolSecond                            ;81C0A4|AD2309  |000923;
    STA.W strcPlayerData.toolEquipped                          ;81C0A7|8D2109  |000921;
    PLA                                                        ;81C0AA|68      |      ;
    STA.W strcPlayerData.toolSecond                            ;81C0AB|8D2309  |000923;
    JSL.L fToolUsedSound_Unknown828FF3                         ;81C0AE|22F38F82|828FF3;
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C0B2|4C02C0  |81C002;
 
 
fPlayerAction0x1A:
    REP #$30                                                   ;81C0B5|C230    |      ;
    REP #$30                                                   ;81C0B7|C230    |      ;
    LDA.W #$00F2                                               ;81C0B9|A9F200  |      ;
    CLC                                                        ;81C0BC|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C0BD|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C0BF|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81C0C2|20E6CF  |81CFE6;
    REP #$20                                                   ;81C0C5|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C0C7|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C0CA|C9FFFF  |      ;
    BNE .exit                                                  ;81C0CD|D03F    |81C10E;
    %SetPlayerAction(!PACTION_NONE)
    REP #$30                                                   ;81C0D6|C230    |      ;
    %CheckFlag(daily4, $0004)
    BNE .label1                                                ;81C0DF|D011    |81C0F2;
    REP #$30                                                   ;81C0E1|C230    |      ;
    %AIExecute($0014, $0045, $0000)
    BRA .label2                                                ;81C0F0|800F    |81C101;
 
 
.label1:
    REP #$30                                                   ;81C0F2|C230    |      ;
    %AIExecute($0015, $0045, $0003)
 
.label2:
    REP #$30                                                   ;81C101|C230    |      ;
    %UnsetFlag(daily4, $0006)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C10E|4C02C0  |81C002;
 
 
fPlayerAction0x17:
    REP #$30                                                   ;81C111|C230    |      ;
    LDA.W strcObjectData.directionNew                          ;81C113|AD1309  |000913;
    STA.B strcPlayer.direction                                 ;81C116|85DA    |0000DA;
    STA.W strcObjectData.direction                             ;81C118|8D1109  |000911;
    REP #$30                                                   ;81C11B|C230    |      ;
    LDA.W #$00DC                                               ;81C11D|A9DC00  |      ;
    CLC                                                        ;81C120|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C121|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C123|8D0109  |000901;
    SEP #$20                                                   ;81C126|E220    |      ;
    LDA.B #$01                                                 ;81C128|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C12A|851E    |00001E;
    JSR.W fUnknown_81CB77                                      ;81C12C|2077CB  |81CB77;
    JSR.W fUnknown_81CFE6                                      ;81C12F|20E6CF  |81CFE6;
    REP #$20                                                   ;81C132|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C134|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C137|C9FFFF  |      ;
    BNE .exit                                                  ;81C13A|D014    |81C150;
    %SetPlayerAction(!PACTION_NONE)
    REP #$20                                                   ;81C143|C220    |      ;
    %SetFlag(daily2, $0020)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C150|4C02C0  |81C002;
 
 
fPlayerAction0x18:
    REP #$30                                                   ;81C153|C230    |      ;
    REP #$30                                                   ;81C155|C230    |      ;
    LDA.W #$00E0                                               ;81C157|A9E000  |      ;
    CLC                                                        ;81C15A|18      |      ;
    ADC.W strcObjectData.direction                             ;81C15B|6D1109  |000911;
    STA.W strcObjectData.spriteIdx                             ;81C15E|8D0109  |000901;
    REP #$20                                                   ;81C161|C220    |      ;
    LDA.W strcObjectData.direction                             ;81C163|AD1109  |000911;
    STA.B strcPlayer.direction                                 ;81C166|85DA    |0000DA;
    SEP #$20                                                   ;81C168|E220    |      ;
    LDA.B #$01                                                 ;81C16A|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C16C|851E    |00001E;
    JSR.W fUnknown_81CB77                                      ;81C16E|2077CB  |81CB77;
    JSR.W fUnknown_81CFE6                                      ;81C171|20E6CF  |81CFE6;
    REP #$20                                                   ;81C174|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C176|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C179|C9FFFF  |      ;
    BNE .exit                                                  ;81C17C|D020    |81C19E;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_RIDINGHORSE)
    REP #$20                                                   ;81C191|C220    |      ;
    %SetFlag(daily2, $0800)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C19E|4C02C0  |81C002;
 
 
fPlayerAction0x16:
    REP #$30                                                   ;81C1A1|C230    |      ;
    REP #$30                                                   ;81C1A3|C230    |      ;
    LDA.W #$00D8                                               ;81C1A5|A9D800  |      ;
    CLC                                                        ;81C1A8|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C1A9|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C1AB|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81C1AE|20E6CF  |81CFE6;
    REP #$20                                                   ;81C1B1|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C1B3|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C1B6|C9FFFF  |      ;
    BNE .exit                                                  ;81C1B9|D032    |81C1ED;
    %SetPlayerAction(!PACTION_NONE)
    REP #$30                                                   ;81C1C2|C230    |      ;
    LDA.L nDogX                                                ;81C1C4|AF2C1F7F|7F1F2C;
    STA.W nTileInFrontOfPlayerX                                ;81C1C8|8D8509  |000985;
    LDA.L nDogY                                                ;81C1CB|AF2E1F7F|7F1F2E;
    STA.W nTileInFrontOfPlayerY                                ;81C1CF|8D8709  |000987;
    LDA.W #$0016                                               ;81C1D2|A91600  |      ;
    LDX.W #$0000                                               ;81C1D5|A20000  |      ;
    LDY.W #$0012                                               ;81C1D8|A01200  |      ;
    JSL.L fAI_Unknown8480F8                                    ;81C1DB|22F88084|8480F8;
    REP #$20                                                   ;81C1DF|C220    |      ;
    LDA.W #$0001                                               ;81C1E1|A90100  |      ;
    STA.L $7F1F58                                              ;81C1E4|8F581F7F|7F1F58;
    SEP #$20                                                   ;81C1E8|E220    |      ;
    STZ.W strcStockData.unkDog                                 ;81C1EA|9C3809  |000938;
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C1ED|4C02C0  |81C002;
 
 
fPlayerAction0x15:
    REP #$30                                                   ;81C1F0|C230    |      ;
    REP #$30                                                   ;81C1F2|C230    |      ;
    LDA.W #$00CC                                               ;81C1F4|A9CC00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C1F7|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81C1FA|20E6CF  |81CFE6;
    REP #$20                                                   ;81C1FD|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C1FF|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C202|C9FFFF  |      ;
    BNE .exit                                                  ;81C205|D007    |81C20E;
    %SetPlayerAction(!PACTION_DRUNK)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C20E|4C02C0  |81C002;
 
 
fPlayerAction0x14:
    REP #$30                                                   ;81C211|C230    |      ;
    REP #$30                                                   ;81C213|C230    |      ;
    LDA.W #$008F                                               ;81C215|A98F00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C218|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81C21B|20E6CF  |81CFE6;
    REP #$20                                                   ;81C21E|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C220|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C223|C9FFFF  |      ;
    BNE .exit                                                  ;81C226|D007    |81C22F;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C22F|4C02C0  |81C002;
 
 
fPlayerAction0x0F:
    REP #$30                                                   ;81C232|C230    |      ;
    REP #$30                                                   ;81C234|C230    |      ;
    LDA.W #$0088                                               ;81C236|A98800  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C239|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81C23C|20E6CF  |81CFE6;
    JMP.W fUnknown_81C002                                      ;81C23F|4C02C0  |81C002;
 
 
fPlayerAction0x10:
    REP #$30                                                   ;81C242|C230    |      ;
    REP #$30                                                   ;81C244|C230    |      ;
    LDA.W #$0089                                               ;81C246|A98900  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C249|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81C24C|20E6CF  |81CFE6;
    REP #$20                                                   ;81C24F|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C251|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C254|C9FFFF  |      ;
    BNE .exit                                                  ;81C257|D007    |81C260;
    %SetPlayerAction(!PACTION_FISHING)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C260|4C02C0  |81C002;
 
 
fPlayerAction0x11_Fishing:
    REP #$30                                                   ;81C263|C230    |      ;
    SEP #$20                                                   ;81C265|E220    |      ;
    LDA.B #$FF                                                 ;81C267|A9FF    |      ;
    JSL.L fCore_GetRandomNumber                                ;81C269|22F98980|8089F9;
    BNE +                                                      ;81C26D|D011    |81C280;
    SEP #$20                                                   ;81C26F|E220    |      ;
    LDA.B #$04                                                 ;81C271|A904    |      ;
    JSL.L fCore_GetRandomNumber                                ;81C273|22F98980|8089F9;
    BNE +                                                      ;81C277|D007    |81C280;
    %SetPlayerAction(!PACTION_FISHINGBITE)
 
  + REP #$30                                                   ;81C280|C230    |      ;
    LDA.W #$008E                                               ;81C282|A98E00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C285|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81C288|20E6CF  |81CFE6;
    JMP.W fUnknown_81C002                                      ;81C28B|4C02C0  |81C002;
 
 
fPlayerAction0x12_FishingBite:
    REP #$30                                                   ;81C28E|C230    |      ;
    REP #$30                                                   ;81C290|C230    |      ;
    LDA.W #$008A                                               ;81C292|A98A00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C295|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81C298|20E6CF  |81CFE6;
    REP #$20                                                   ;81C29B|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C29D|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C2A0|C9FFFF  |      ;
    BNE .exit                                                  ;81C2A3|D007    |81C2AC;
    %SetPlayerAction(!PACTION_FISHING)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C2AC|4C02C0  |81C002;
 
 
fPlayerAction0x13:
    REP #$30                                                   ;81C2AF|C230    |      ;
    JSR.W fUnknown_81CFE6                                      ;81C2B1|20E6CF  |81CFE6;
    REP #$20                                                   ;81C2B4|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C2B6|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C2B9|C9FFFF  |      ;
    BNE .exit                                                  ;81C2BC|D072    |81C330;
    %SetPlayerAction(!PACTION_0F)
    REP #$20                                                   ;81C2C5|C220    |      ;
    LDA.W #$0014                                               ;81C2C7|A91400  |      ;
    JSL.L fAI_SetCCPointer                                     ;81C2CA|227C8884|84887C;
    SEP #$20                                                   ;81C2CE|E220    |      ;
    REP #$10                                                   ;81C2D0|C210    |      ;
    LDY.W #$0000                                               ;81C2D2|A00000  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;81C2D5|B7CC    |0000CC;
    BEQ .label1                                                ;81C2D7|F009    |81C2E2;
    REP #$30                                                   ;81C2D9|C230    |      ;
    LDA.W #$0014                                               ;81C2DB|A91400  |      ;
    JSL.L fAI_Unknown848020                                    ;81C2DE|22208084|848020;
 
.label1:
    REP #$30                                                   ;81C2E2|C230    |      ;
    LDA.W strcObjectData.spriteIdx                             ;81C2E4|AD0109  |000901;
    CMP.W #$008B                                               ;81C2E7|C98B00  |      ;
    BEQ .label2                                                ;81C2EA|F017    |81C303;
    CMP.W #$008C                                               ;81C2EC|C98C00  |      ;
    BEQ .label3                                                ;81C2EF|F02D    |81C31E;
    REP #$30                                                   ;81C2F1|C230    |      ;
    %AIExecute($0014, $0000, $0033)
    JMP.W .exit                                                ;81C300|4C30C3  |81C330;
 
 
.label2:
    REP #$30                                                   ;81C303|C230    |      ;
    %AIExecute($0014, $0000, $0035)
    REP #$20                                                   ;81C312|C220    |      ;
    LDA.W #$0002                                               ;81C314|A90200  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81C317|2282B283|83B282;
    JMP.W .exit                                                ;81C31B|4C30C3  |81C330;
 
 
.label3:
    REP #$30                                                   ;81C31E|C230    |      ;
    %AIExecute($0014, $0000, $0034)
    JMP.W .exit                                                ;81C32D|4C30C3  |81C330;
 
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C330|4C02C0  |81C002;
 
 
fPlayerAction0x1B:
    REP #$30                                                   ;81C333|C230    |      ;
    %SetFlag(daily4, $0010)
    REP #$30                                                   ;81C340|C230    |      ;
    REP #$30                                                   ;81C342|C230    |      ;
    LDA.W #$00BC                                               ;81C344|A9BC00  |      ;
    CLC                                                        ;81C347|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C348|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C34A|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81C34D|20E6CF  |81CFE6;
    REP #$20                                                   ;81C350|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C352|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C355|C9FFFF  |      ;
    BNE .exit                                                  ;81C358|D007    |81C361;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C361|4C02C0  |81C002;
 
 
fPlayerAction0x0D:
    REP #$30                                                   ;81C364|C230    |      ;
    %SetFlag(daily2, $0400)
    REP #$30                                                   ;81C371|C230    |      ;
    REP #$30                                                   ;81C373|C230    |      ;
    LDA.W #$00BC                                               ;81C375|A9BC00  |      ;
    CLC                                                        ;81C378|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C379|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C37B|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81C37E|20E6CF  |81CFE6;
    REP #$20                                                   ;81C381|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C383|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C386|C9FFFF  |      ;
    BNE .exit                                                  ;81C389|D007    |81C392;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C392|4C02C0  |81C002;
 
 
fPlayerAction0x0C_SelectDialog:
    REP #$30                                                   ;81C395|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C39E|F003    |81C3A3;
    JMP.W .continue                                            ;81C3A0|4CCAC4  |81C4CA;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    SEP #$20                                                   ;81C3AC|E220    |      ;
    REP #$10                                                   ;81C3AE|C210    |      ;
    LDA.B #$00                                                 ;81C3B0|A900    |      ;
    XBA                                                        ;81C3B2|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;81C3B3|AD2109  |000921;
    CLC                                                        ;81C3B6|18      |      ;
    ADC.B #$90                                                 ;81C3B7|6990    |      ;
    REP #$20                                                   ;81C3B9|C220    |      ;
    STA.W strcObjectData.spriteIdx                             ;81C3BB|8D0109  |000901;
    REP #$30                                                   ;81C3BE|C230    |      ;
    %CheckFlag(event6, $4000)
    BNE +                                                      ;81C3C7|D003    |81C3CC;
    JMP.W .skip                                                ;81C3C9|4CB2C4  |81C4B2;
 
 
  + %CheckFlag(daily4, $0200)
    BEQ +                                                      ;81C3D3|F003    |81C3D8;
    JMP.W .skip                                                ;81C3D5|4CB2C4  |81C4B2;
 
 
  + SEP #$20                                                   ;81C3D8|E220    |      ;
    LDA.L nCurrentTimeID                                       ;81C3DA|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;81C3DE|C906    |      ;
    BEQ .06am                                                  ;81C3E0|F033    |81C415;
    CMP.B #$07                                                 ;81C3E2|C907    |      ;
    BEQ .07am                                                  ;81C3E4|F037    |81C41D;
    CMP.B #$08                                                 ;81C3E6|C908    |      ;
    BEQ .08am                                                  ;81C3E8|F03B    |81C425;
    CMP.B #$09                                                 ;81C3EA|C909    |      ;
    BEQ .09am                                                  ;81C3EC|F03F    |81C42D;
    CMP.B #$0A                                                 ;81C3EE|C90A    |      ;
    BEQ .10am                                                  ;81C3F0|F043    |81C435;
    CMP.B #$0B                                                 ;81C3F2|C90B    |      ;
    BEQ .11am                                                  ;81C3F4|F047    |81C43D;
    CMP.B #$0C                                                 ;81C3F6|C90C    |      ;
    BEQ .12am                                                  ;81C3F8|F04B    |81C445;
    CMP.B #$0D                                                 ;81C3FA|C90D    |      ;
    BEQ .01pm                                                  ;81C3FC|F04F    |81C44D;
    CMP.B #$0E                                                 ;81C3FE|C90E    |      ;
    BEQ .02pm                                                  ;81C400|F053    |81C455;
    CMP.B #$0F                                                 ;81C402|C90F    |      ;
    BEQ .03pm                                                  ;81C404|F057    |81C45D;
    CMP.B #$10                                                 ;81C406|C910    |      ;
    BEQ .04pm                                                  ;81C408|F05B    |81C465;
    CMP.B #$11                                                 ;81C40A|C911    |      ;
    BEQ .05pm                                                  ;81C40C|F05F    |81C46D;
    CMP.B #$12                                                 ;81C40E|C912    |      ;
    BNE .06am                                                  ;81C410|D003    |81C415;
    JMP.W .12pm                                                ;81C412|4CAAC4  |81C4AA;
 
 
.06am:
    REP #$30                                                   ;81C415|C230    |      ;
    LDX.W #$046B                                               ;81C417|A26B04  |      ;
    JMP.W .timeHandler                                         ;81C41A|4CBAC4  |81C4BA;
 
 
.07am:
    REP #$30                                                   ;81C41D|C230    |      ;
    LDX.W #$046C                                               ;81C41F|A26C04  |      ;
    JMP.W .timeHandler                                         ;81C422|4CBAC4  |81C4BA;
 
 
.08am:
    REP #$30                                                   ;81C425|C230    |      ;
    LDX.W #$046D                                               ;81C427|A26D04  |      ;
    JMP.W .timeHandler                                         ;81C42A|4CBAC4  |81C4BA;
 
 
.09am:
    REP #$30                                                   ;81C42D|C230    |      ;
    LDX.W #$046E                                               ;81C42F|A26E04  |      ;
    JMP.W .timeHandler                                         ;81C432|4CBAC4  |81C4BA;
 
 
.10am:
    REP #$30                                                   ;81C435|C230    |      ;
    LDX.W #$046F                                               ;81C437|A26F04  |      ;
    JMP.W .timeHandler                                         ;81C43A|4CBAC4  |81C4BA;
 
 
.11am:
    REP #$30                                                   ;81C43D|C230    |      ;
    LDX.W #$0470                                               ;81C43F|A27004  |      ;
    JMP.W .timeHandler                                         ;81C442|4CBAC4  |81C4BA;
 
 
.12am:
    REP #$30                                                   ;81C445|C230    |      ;
    LDX.W #$0471                                               ;81C447|A27104  |      ;
    JMP.W .timeHandler                                         ;81C44A|4CBAC4  |81C4BA;
 
 
.01pm:
    REP #$30                                                   ;81C44D|C230    |      ;
    LDX.W #$0472                                               ;81C44F|A27204  |      ;
    JMP.W .timeHandler                                         ;81C452|4CBAC4  |81C4BA;
 
 
.02pm:
    REP #$30                                                   ;81C455|C230    |      ;
    LDX.W #$0473                                               ;81C457|A27304  |      ;
    JMP.W .timeHandler                                         ;81C45A|4CBAC4  |81C4BA;
 
 
.03pm:
    REP #$30                                                   ;81C45D|C230    |      ;
    LDX.W #$0474                                               ;81C45F|A27404  |      ;
    JMP.W .timeHandler                                         ;81C462|4CBAC4  |81C4BA;
 
 
.04pm:
    REP #$30                                                   ;81C465|C230    |      ;
    LDX.W #$0475                                               ;81C467|A27504  |      ;
    JMP.W .timeHandler                                         ;81C46A|4CBAC4  |81C4BA;
 
 
.05pm:
    REP #$30                                                   ;81C46D|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .marriedCheck                                          ;81C476|D02A    |81C4A2;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .marriedCheck                                          ;81C47F|D021    |81C4A2;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .marriedCheck                                          ;81C488|D018    |81C4A2;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .marriedCheck                                          ;81C491|D00F    |81C4A2;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .marriedCheck                                          ;81C49A|D006    |81C4A2;
    LDX.W #$0476                                               ;81C49C|A27604  |      ;
    JMP.W .timeHandler                                         ;81C49F|4CBAC4  |81C4BA;
 
 
.marriedCheck:
    REP #$30                                                   ;81C4A2|C230    |      ;
    LDX.W #$0478                                               ;81C4A4|A27804  |      ;
    JMP.W .timeHandler                                         ;81C4A7|4CBAC4  |81C4BA;
 
 
.12pm:
    REP #$30                                                   ;81C4AA|C230    |      ;
    LDX.W #$0477                                               ;81C4AC|A27704  |      ;
    JMP.W .timeHandler                                         ;81C4AF|4CBAC4  |81C4BA;
 
 
.skip:
    REP #$30                                                   ;81C4B2|C230    |      ;
    LDX.W #$046A                                               ;81C4B4|A26A04  |      ;
    JMP.W .timeHandler                                         ;81C4B7|4CBAC4  |81C4BA;
 
 
.timeHandler:
    SEP #$20                                                   ;81C4BA|E220    |      ;
    LDA.B #$02                                                 ;81C4BC|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81C4BE|8D9A01  |00019A;
    LDA.B #$00                                                 ;81C4C1|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81C4C3|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81C4C6|225F9383|83935F;
 
.continue:
    JSR.W fUnknown_81CFE6                                      ;81C4CA|20E6CF  |81CFE6;
    REP #$30                                                   ;81C4CD|C230    |      ;
    LDA.W strcObjectData.exist                                 ;81C4CF|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C4D2|C9FFFF  |      ;
    BNE .exit                                                  ;81C4D5|D012    |81C4E9;
    REP #$20                                                   ;81C4D7|C220    |      ;
    %CheckFlag(daily1, $4000)
    BNE .exit                                                  ;81C4E0|D007    |81C4E9;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C4E9|4C02C0  |81C002;
 
 
fPlayerAction0x0B:
    REP #$30                                                   ;81C4EC|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C4F5|F003    |81C4FA;
    JMP.W .label1                                              ;81C4F7|4C03C5  |81C503;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
 
.label1:
    JSR.W fUnknown_81CFE6                                      ;81C503|20E6CF  |81CFE6;
    REP #$20                                                   ;81C506|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C508|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C50B|C9FFFF  |      ;
    BNE .exit                                                  ;81C50E|D007    |81C517;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C517|4C02C0  |81C002;
 
 
fPlayerAction0x0A:
    REP #$30                                                   ;81C51A|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C523|F003    |81C528;
    JMP.W .label1                                              ;81C525|4C31C5  |81C531;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
 
.label1:
    JSR.W fUnknown_81CFE6                                      ;81C531|20E6CF  |81CFE6;
    REP #$20                                                   ;81C534|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C536|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C539|C9FFFF  |      ;
    BNE +                                                      ;81C53C|D004    |81C542;
    JSL.L fToolUsedActionHandler                               ;81C53E|22609282|829260;
 
  + SEP #$20                                                   ;81C542|E220    |      ;
    LDA.W strcPlayerData.unkCounter91B                         ;81C544|AD1B09  |00091B;
    INC A                                                      ;81C547|1A      |      ;
    STA.W strcPlayerData.unkCounter91B                         ;81C548|8D1B09  |00091B;
    CMP.B #$18                                                 ;81C54B|C918    |      ;
    BNE .exit                                                  ;81C54D|D004    |81C553;
    JSL.L fToolUsedSound_Unknown828FB1                         ;81C54F|22B18F82|828FB1;
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C553|4C02C0  |81C002;
 
 
fUnknown_81C556:
    REP #$30                                                   ;81C556|C230    |      ;
    %UnsetPlayerFlag(!PFLAGS_ANIMATING)
    %CheckPlayerFlags(!PFLAGS_KNEEING)
    BEQ +                                                      ;81C56B|F003    |81C570;
    JMP.W .exit3                                               ;81C56D|4C68C6  |81C668;
 
 
  + %CheckPlayerFlags(!PFLAGS_USERCONTROL)
    BNE +                                                      ;81C577|D003    |81C57C;
    JMP.W .label2                                              ;81C579|4CBDC5  |81C5BD;
 
 
  + SEP #$20                                                   ;81C57C|E220    |      ;
    LDA.W strcPlayerData.lastExcercise                         ;81C57E|AD2509  |000925;
    CMP.B #$F0                                                 ;81C581|C9F0    |      ;
    BNE .label1                                                ;81C583|D030    |81C5B5;
    LDA.B #$78                                                 ;81C585|A978    |      ;
    STA.W strcPlayerData.lastExcercise                         ;81C587|8D2509  |000925;
    %SetPlayerAction(!PACTION_EXCERCISE)
    LDA.B strcPlayer.direction                                 ;81C591|A5DA    |0000DA;
    ASL A                                                      ;81C593|0A      |      ;
    CLC                                                        ;81C594|18      |      ;
    ADC.W #$003C                                               ;81C595|693C00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C598|8D0109  |000901;
    SEP #$20                                                   ;81C59B|E220    |      ;
    LDA.B #$02                                                 ;81C59D|A902    |      ;
    JSL.L fCore_GetRandomNumber                                ;81C59F|22F98980|8089F9;
    SEP #$20                                                   ;81C5A3|E220    |      ;
    XBA                                                        ;81C5A5|EB      |      ;
    LDA.B #$00                                                 ;81C5A6|A900    |      ;
    XBA                                                        ;81C5A8|EB      |      ;
    REP #$20                                                   ;81C5A9|C220    |      ;
    CLC                                                        ;81C5AB|18      |      ;
    ADC.W strcObjectData.spriteIdx                             ;81C5AC|6D0109  |000901;
    STA.W strcObjectData.spriteIdx                             ;81C5AF|8D0109  |000901;
    JMP.W fPlayerAction0x09                                    ;81C5B2|4C5ECB  |81CB5E;
 
 
.label1:
    SEP #$20                                                   ;81C5B5|E220    |      ;
    REP #$10                                                   ;81C5B7|C210    |      ;
    INC A                                                      ;81C5B9|1A      |      ;
    STA.W strcPlayerData.lastExcercise                         ;81C5BA|8D2509  |000925;
 
.label2:
    %CheckPlayerFlags(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;81C5C4|F003    |81C5C9;
    JMP.W .label3                                              ;81C5C6|4C11C6  |81C611;
 
 
  + %CheckPlayerFlags(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;81C5D0|F003    |81C5D5;
    JMP.W .label4                                              ;81C5D2|4C1EC6  |81C61E;
 
 
  + %CheckPlayerFlags(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;81C5DC|F003    |81C5E1;
    JMP.W .label5                                              ;81C5DE|4C2BC6  |81C62B;
 
 
  + %CheckPlayerFlags(!PFLAGS_SITTING)
    BEQ +                                                      ;81C5E8|F003    |81C5ED;
    JMP.W .label6                                              ;81C5EA|4C38C6  |81C638;
 
 
  + %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;81C5F4|F003    |81C5F9;
    JMP.W .label7                                              ;81C5F6|4C42C6  |81C642;
 
 
  + REP #$20                                                   ;81C5F9|C220    |      ;
    %CheckFlag(daily4, $0006)
    BNE .label8                                                ;81C602|D04B    |81C64F;
    REP #$30                                                   ;81C604|C230    |      ;
    LDA.W #$0000                                               ;81C606|A90000  |      ;
    CLC                                                        ;81C609|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C60A|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C60C|8D0109  |000901;
    BRA .exit1                                                 ;81C60F|804B    |81C65C;
 
 
.label3:
    REP #$30                                                   ;81C611|C230    |      ;
    LDA.W #$0014                                               ;81C613|A91400  |      ;
    CLC                                                        ;81C616|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C617|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C619|8D0109  |000901;
    BRA .exit2                                                 ;81C61C|8044    |81C662;
 
 
.label4:
    REP #$30                                                   ;81C61E|C230    |      ;
    LDA.W #$00B0                                               ;81C620|A9B000  |      ;
    CLC                                                        ;81C623|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C624|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C626|8D0109  |000901;
    BRA .exit2                                                 ;81C629|8037    |81C662;
 
 
.label5:
    REP #$30                                                   ;81C62B|C230    |      ;
    LDA.W #$00C0                                               ;81C62D|A9C000  |      ;
    CLC                                                        ;81C630|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C631|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C633|8D0109  |000901;
    BRA .exit2                                                 ;81C636|802A    |81C662;
 
 
.label6:
    REP #$30                                                   ;81C638|C230    |      ;
    LDA.W #$004F                                               ;81C63A|A94F00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C63D|8D0109  |000901;
    BRA .exit2                                                 ;81C640|8020    |81C662;
 
 
.label7:
    REP #$30                                                   ;81C642|C230    |      ;
    LDA.W #$00D0                                               ;81C644|A9D000  |      ;
    CLC                                                        ;81C647|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C648|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C64A|8D0109  |000901;
    BRA .exit2                                                 ;81C64D|8013    |81C662;
 
 
.label8:
    REP #$30                                                   ;81C64F|C230    |      ;
    LDA.W #$00EA                                               ;81C651|A9EA00  |      ;
    CLC                                                        ;81C654|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C655|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C657|8D0109  |000901;
    BRA .exit2                                                 ;81C65A|8006    |81C662;
 
 
.exit1:
    JSR.W fUnknown_81CFE6                                      ;81C65C|20E6CF  |81CFE6;
    JMP.W fUnknown_81C013                                      ;81C65F|4C13C0  |81C013;
 
 
.exit2:
    JSR.W fUnknown_81CFE6                                      ;81C662|20E6CF  |81CFE6;
    JMP.W fPlayerAction0x19                                    ;81C665|4C0EC0  |81C00E;
 
 
.exit3:
    JSR.W fUnknown_81CFE6                                      ;81C668|20E6CF  |81CFE6;
    JMP.W fPlayerAction0x19                                    ;81C66B|4C0EC0  |81C00E;
 
 
fPlayerAction_Walk:
    REP #$30                                                   ;81C66E|C230    |      ;
    %UnsetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$20                                                   ;81C67C|C220    |      ;
    %CheckPlayerFlagsNoReg(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;81C683|F003    |81C688;
    JMP.W .label1                                              ;81C685|4CC2C6  |81C6C2;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;81C68D|F003    |81C692;
    JMP.W .label2                                              ;81C68F|4CD5C6  |81C6D5;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;81C697|F003    |81C69C;
    JMP.W .label3                                              ;81C699|4CE9C6  |81C6E9;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;81C6A1|F003    |81C6A6;
    JMP.W .label4                                              ;81C6A3|4CFCC6  |81C6FC;
 
 
  + %CheckFlag(daily4, $0006)
    BNE .label5                                                ;81C6AD|D060    |81C70F;
    REP #$30                                                   ;81C6AF|C230    |      ;
    LDA.W #$0004                                               ;81C6B1|A90400  |      ;
    CLC                                                        ;81C6B4|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C6B5|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C6B7|8D0109  |000901;
    SEP #$20                                                   ;81C6BA|E220    |      ;
    LDA.B #$01                                                 ;81C6BC|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C6BE|851E    |00001E;
    BRA .exit                                                  ;81C6C0|8060    |81C722;
 
 
.label1:
    REP #$30                                                   ;81C6C2|C230    |      ;
    LDA.W #$0028                                               ;81C6C4|A92800  |      ;
    CLC                                                        ;81C6C7|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C6C8|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C6CA|8D0109  |000901;
    SEP #$20                                                   ;81C6CD|E220    |      ;
    LDA.B #$01                                                 ;81C6CF|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C6D1|851E    |00001E;
    BRA .exit                                                  ;81C6D3|804D    |81C722;
 
 
.label2:
    REP #$30                                                   ;81C6D5|C230    |      ;
    LDA.W #$00B4                                               ;81C6D7|A9B400  |      ;
    CLC                                                        ;81C6DA|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C6DB|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C6DD|8D0109  |000901;
    SEP #$20                                                   ;81C6E0|E220    |      ;
    LDA.B #$03                                                 ;81C6E2|A903    |      ;
    STA.B strcMap.unk1E                                        ;81C6E4|851E    |00001E;
    JMP.W fUnknown_81C806                                      ;81C6E6|4C06C8  |81C806;
 
 
.label3:
    REP #$30                                                   ;81C6E9|C230    |      ;
    LDA.W #$00C4                                               ;81C6EB|A9C400  |      ;
    CLC                                                        ;81C6EE|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C6EF|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C6F1|8D0109  |000901;
    SEP #$20                                                   ;81C6F4|E220    |      ;
    LDA.B #$01                                                 ;81C6F6|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C6F8|851E    |00001E;
    BRA .exit                                                  ;81C6FA|8026    |81C722;
 
 
.label4:
    REP #$30                                                   ;81C6FC|C230    |      ;
    LDA.W #$00D4                                               ;81C6FE|A9D400  |      ;
    CLC                                                        ;81C701|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C702|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C704|8D0109  |000901;
    SEP #$20                                                   ;81C707|E220    |      ;
    LDA.B #$01                                                 ;81C709|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C70B|851E    |00001E;
    BRA .exit                                                  ;81C70D|8013    |81C722;
 
 
.label5:
    REP #$30                                                   ;81C70F|C230    |      ;
    LDA.W #$00EE                                               ;81C711|A9EE00  |      ;
    CLC                                                        ;81C714|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C715|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C717|8D0109  |000901;
    SEP #$20                                                   ;81C71A|E220    |      ;
    LDA.B #$01                                                 ;81C71C|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C71E|851E    |00001E;
    BRA .exit                                                  ;81C720|8000    |81C722;
 
 
.exit:
    JSR.W fUnknown_81CB77                                      ;81C722|2077CB  |81CB77;
    %SetPlayerAction(!PACTION_NONE)
    SEP #$20                                                   ;81C72C|E220    |      ;
    REP #$10                                                   ;81C72E|C210    |      ;
    STZ.W nBreakHitCounter                                     ;81C730|9C6D09  |00096D;
    JMP.W fPlayerAction0x19                                    ;81C733|4C0EC0  |81C00E;
 
 
fPlayerAction_Run:
    REP #$30                                                   ;81C736|C230    |      ;
    %UnsetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$20                                                   ;81C744|C220    |      ;
    %CheckPlayerFlagsNoReg(!PFLAGS_AISTEERING)
    BNE .skip                                                  ;81C74B|D014    |81C761;
    %CheckPlayerFlagsNoReg(!PFLAGS_KNEEING)
    BEQ +                                                      ;81C752|F003    |81C757;
    JMP.W fHelper_81C82A                                       ;81C754|4C2AC8  |81C82A;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_USERCONTROL)
    BNE .skip                                                  ;81C75C|D003    |81C761;
    JMP.W fHelper_81C82A                                       ;81C75E|4C2AC8  |81C82A;
 
 
.skip:
    REP #$20                                                   ;81C761|C220    |      ;
    %CheckPlayerFlagsNoReg(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;81C768|F003    |81C76D;
    JMP.W .label1                                              ;81C76A|4CA7C7  |81C7A7;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;81C772|F003    |81C777;
    JMP.W .label2                                              ;81C774|4CBAC7  |81C7BA;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;81C77C|F003    |81C781;
    JMP.W .label3                                              ;81C77E|4CCDC7  |81C7CD;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;81C786|F003    |81C78B;
    JMP.W .label4                                              ;81C788|4CE0C7  |81C7E0;
 
 
  + %CheckFlag(daily4, $0006)
    BNE .label5                                                ;81C792|D05F    |81C7F3;
    REP #$30                                                   ;81C794|C230    |      ;
    LDA.W #$0008                                               ;81C796|A90800  |      ;
    CLC                                                        ;81C799|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C79A|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C79C|8D0109  |000901;
    SEP #$20                                                   ;81C79F|E220    |      ;
    LDA.B #$02                                                 ;81C7A1|A902    |      ;
    STA.B strcMap.unk1E                                        ;81C7A3|851E    |00001E;
    BRA fUnknown_81C806                                        ;81C7A5|805F    |81C806;
 
 
.label1:
    REP #$30                                                   ;81C7A7|C230    |      ;
    LDA.W #$002C                                               ;81C7A9|A92C00  |      ;
    CLC                                                        ;81C7AC|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C7AD|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C7AF|8D0109  |000901;
    SEP #$20                                                   ;81C7B2|E220    |      ;
    LDA.B #$02                                                 ;81C7B4|A902    |      ;
    STA.B strcMap.unk1E                                        ;81C7B6|851E    |00001E;
    BRA fUnknown_81C806                                        ;81C7B8|804C    |81C806;
 
 
.label2:
    REP #$30                                                   ;81C7BA|C230    |      ;
    LDA.W #$00B4                                               ;81C7BC|A9B400  |      ;
    CLC                                                        ;81C7BF|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C7C0|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C7C2|8D0109  |000901;
    SEP #$20                                                   ;81C7C5|E220    |      ;
    LDA.B #$03                                                 ;81C7C7|A903    |      ;
    STA.B strcMap.unk1E                                        ;81C7C9|851E    |00001E;
    BRA fUnknown_81C806                                        ;81C7CB|8039    |81C806;
 
 
.label3:
    REP #$30                                                   ;81C7CD|C230    |      ;
    LDA.W #$00C4                                               ;81C7CF|A9C400  |      ;
    CLC                                                        ;81C7D2|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C7D3|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C7D5|8D0109  |000901;
    SEP #$20                                                   ;81C7D8|E220    |      ;
    LDA.B #$01                                                 ;81C7DA|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C7DC|851E    |00001E;
    BRA fHelper_81C827                                         ;81C7DE|8047    |81C827;
 
 
.label4:
    REP #$30                                                   ;81C7E0|C230    |      ;
    LDA.W #$00D4                                               ;81C7E2|A9D400  |      ;
    CLC                                                        ;81C7E5|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C7E6|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C7E8|8D0109  |000901;
    SEP #$20                                                   ;81C7EB|E220    |      ;
    LDA.B #$01                                                 ;81C7ED|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C7EF|851E    |00001E;
    BRA fHelper_81C827                                         ;81C7F1|8034    |81C827;
 
 
.label5:
    REP #$30                                                   ;81C7F3|C230    |      ;
    LDA.W #$00EE                                               ;81C7F5|A9EE00  |      ;
    CLC                                                        ;81C7F8|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C7F9|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C7FB|8D0109  |000901;
    SEP #$20                                                   ;81C7FE|E220    |      ;
    LDA.B #$01                                                 ;81C800|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C802|851E    |00001E;
    BRA fHelper_81C827                                         ;81C804|8021    |81C827;
 
 
fUnknown_81C806:
    SEP #$20                                                   ;81C806|E220    |      ;
    REP #$10                                                   ;81C808|C210    |      ;
    LDA.W strcPlayerData.unkCounter91A                         ;81C80A|AD1A09  |00091A;
    INC A                                                      ;81C80D|1A      |      ;
    AND.B #$0F                                                 ;81C80E|290F    |      ;
    STA.W strcPlayerData.unkCounter91A                         ;81C810|8D1A09  |00091A;
    BNE fHelper_81C827                                         ;81C813|D012    |81C827;
    SEP #$20                                                   ;81C815|E220    |      ;
    REP #$10                                                   ;81C817|C210    |      ;
    LDA.B #$05                                                 ;81C819|A905    |      ;
    STA.W strcAudio.reg114                                     ;81C81B|8D1401  |000114;
    LDA.B #$06                                                 ;81C81E|A906    |      ;
    STA.W strcAudio.reg115                                     ;81C820|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81C823|22328383|838332;
 
fHelper_81C827:
    JSR.W fUnknown_81CB77                                      ;81C827|2077CB  |81CB77;
 
fHelper_81C82A:
    %SetPlayerAction(!PACTION_NONE)
    SEP #$20                                                   ;81C831|E220    |      ;
    REP #$10                                                   ;81C833|C210    |      ;
    STZ.W nBreakHitCounter                                     ;81C835|9C6D09  |00096D;
    JMP.W fPlayerAction0x19                                    ;81C838|4C0EC0  |81C00E;
 
 
fUnknown_81C83B:
    REP #$30                                                   ;81C83B|C230    |      ;
    %UnsetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$30                                                   ;81C849|C230    |      ;
    LDA.W #$0045                                               ;81C84B|A94500  |      ;
    STA.W strcObjectData.spriteIdx                             ;81C84E|8D0109  |000901;
    SEP #$20                                                   ;81C851|E220    |      ;
    LDA.B #$01                                                 ;81C853|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C855|851E    |00001E;
    JSR.W fUnknown_81CB77                                      ;81C857|2077CB  |81CB77;
    %SetPlayerAction(!PACTION_NONE)
    SEP #$20                                                   ;81C861|E220    |      ;
    REP #$10                                                   ;81C863|C210    |      ;
    STZ.W nBreakHitCounter                                     ;81C865|9C6D09  |00096D;
    JMP.W fPlayerAction0x19                                    ;81C868|4C0EC0  |81C00E;
 
 
fPlayerAction0x03:
    REP #$30                                                   ;81C86B|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C874|F003    |81C879;
    JMP.W .label4                                              ;81C876|4C23C9  |81C923;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$20                                                   ;81C882|C220    |      ;
    %CheckPlayerFlagsNoReg(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;81C889|F003    |81C88E;
    JMP.W .label1                                              ;81C88B|4CC6C8  |81C8C6;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;81C893|F003    |81C898;
    JMP.W .label2                                              ;81C895|4CE5C8  |81C8E5;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;81C89D|F003    |81C8A2;
    JMP.W .label3                                              ;81C89F|4C04C9  |81C904;
 
 
  + REP #$30                                                   ;81C8A2|C230    |      ;
    LDA.W #$000C                                               ;81C8A4|A90C00  |      ;
    CLC                                                        ;81C8A7|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C8A8|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C8AA|8D0109  |000901;
    SEP #$20                                                   ;81C8AD|E220    |      ;
    REP #$10                                                   ;81C8AF|C210    |      ;
    LDA.B #$06                                                 ;81C8B1|A906    |      ;
    STA.W strcAudio.reg114                                     ;81C8B3|8D1401  |000114;
    LDA.B #$06                                                 ;81C8B6|A906    |      ;
    STA.W strcAudio.reg115                                     ;81C8B8|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81C8BB|22328383|838332;
    SEP #$20                                                   ;81C8BF|E220    |      ;
    STZ.W $0971                                                ;81C8C1|9C7109  |000971;
    BRA .label4                                                ;81C8C4|805D    |81C923;
 
 
.label1:
    REP #$30                                                   ;81C8C6|C230    |      ;
    LDA.W #$0020                                               ;81C8C8|A92000  |      ;
    CLC                                                        ;81C8CB|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C8CC|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C8CE|8D0109  |000901;
    SEP #$20                                                   ;81C8D1|E220    |      ;
    REP #$10                                                   ;81C8D3|C210    |      ;
    LDA.B #$06                                                 ;81C8D5|A906    |      ;
    STA.W strcAudio.reg114                                     ;81C8D7|8D1401  |000114;
    LDA.B #$06                                                 ;81C8DA|A906    |      ;
    STA.W strcAudio.reg115                                     ;81C8DC|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81C8DF|22328383|838332;
    BRA .label4                                                ;81C8E3|803E    |81C923;
 
 
.label2:
    REP #$30                                                   ;81C8E5|C230    |      ;
    LDA.W #$00B8                                               ;81C8E7|A9B800  |      ;
    CLC                                                        ;81C8EA|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C8EB|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C8ED|8D0109  |000901;
    SEP #$20                                                   ;81C8F0|E220    |      ;
    REP #$10                                                   ;81C8F2|C210    |      ;
    LDA.B #$06                                                 ;81C8F4|A906    |      ;
    STA.W strcAudio.reg114                                     ;81C8F6|8D1401  |000114;
    LDA.B #$06                                                 ;81C8F9|A906    |      ;
    STA.W strcAudio.reg115                                     ;81C8FB|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81C8FE|22328383|838332;
    BRA .label4                                                ;81C902|801F    |81C923;
 
 
.label3:
    REP #$30                                                   ;81C904|C230    |      ;
    LDA.W #$00C8                                               ;81C906|A9C800  |      ;
    CLC                                                        ;81C909|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C90A|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C90C|8D0109  |000901;
    SEP #$20                                                   ;81C90F|E220    |      ;
    REP #$10                                                   ;81C911|C210    |      ;
    LDA.B #$06                                                 ;81C913|A906    |      ;
    STA.W strcAudio.reg114                                     ;81C915|8D1401  |000114;
    LDA.B #$06                                                 ;81C918|A906    |      ;
    STA.W strcAudio.reg115                                     ;81C91A|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81C91D|22328383|838332;
    BRA .label6                                                ;81C921|8026    |81C949;
 
 
.label4:
    SEP #$20                                                   ;81C923|E220    |      ;
    REP #$10                                                   ;81C925|C210    |      ;
    LDA.B #$01                                                 ;81C927|A901    |      ;
    STA.B strcMap.unk1E                                        ;81C929|851E    |00001E;
    %CheckPlayerFlags($0200)
    BNE .label5                                                ;81C932|D003    |81C937;
    JMP.W .label7                                              ;81C934|4C51C9  |81C951;
 
 
.label5:
    SEP #$20                                                   ;81C937|E220    |      ;
    LDA.W $0971                                                ;81C939|AD7109  |000971;
    EOR.B #$01                                                 ;81C93C|4901    |      ;
    STA.W $0971                                                ;81C93E|8D7109  |000971;
    BEQ .label7                                                ;81C941|F00E    |81C951;
    LDA.B #$02                                                 ;81C943|A902    |      ;
    STA.B strcMap.unk1E                                        ;81C945|851E    |00001E;
    BRA .label7                                                ;81C947|8008    |81C951;
 
 
.label6:
    SEP #$20                                                   ;81C949|E220    |      ;
    REP #$10                                                   ;81C94B|C210    |      ;
    LDA.B #$02                                                 ;81C94D|A902    |      ;
    STA.B strcMap.unk1E                                        ;81C94F|851E    |00001E;
 
.label7:
    JSR.W fUnknown_81CB77                                      ;81C951|2077CB  |81CB77;
    JSR.W fUnknown_81CFE6                                      ;81C954|20E6CF  |81CFE6;
    REP #$30                                                   ;81C957|C230    |      ;
    LDA.W strcObjectData.exist                                 ;81C959|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C95C|C9FFFF  |      ;
    BNE .exit2                                                 ;81C95F|D02D    |81C98E;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_FALLING)
    REP #$30                                                   ;81C974|C230    |      ;
    LDA.B strcPlayer.direction                                 ;81C976|A5DA    |0000DA;
    CMP.W #!PDIR_RIGHT                                               
    BNE +                                                      ;81C97B|D003    |81C980;
    JMP.W .exit1                                               ;81C97D|4C82C9  |81C982;
 
 
  + BRA .exit2                                                 ;81C980|800C    |81C98E;
 
 
.exit1:
    %UnsetPlayerFlag(!PFLAGS_INSPRINGS)
 
.exit2:
    JMP.W fUnknown_81C002                                      ;81C98E|4C02C0  |81C002;
 
 
fPlayerAction0x04:
    REP #$30                                                   ;81C991|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C99A|F003    |81C99F;
    JMP.W .label1                                              ;81C99C|4CB7C9  |81C9B7;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$30                                                   ;81C9A8|C230    |      ;
    LDA.W #$0010                                               ;81C9AA|A91000  |      ;
    CLC                                                        ;81C9AD|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C9AE|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C9B0|8D0109  |000901;
    JSL.L fUnknown_818000                                      ;81C9B3|22008081|818000;
 
.label1:
    JSR.W fUnknown_81CFE6                                      ;81C9B7|20E6CF  |81CFE6;
    REP #$20                                                   ;81C9BA|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81C9BC|AD1509  |000915;
    CMP.W #$FFFF                                               ;81C9BF|C9FFFF  |      ;
    BNE .exit                                                  ;81C9C2|D018    |81C9DC;
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;81C9D4|E220    |      ;
    LDA.W strcPlayerData.carryItemId                           ;81C9D6|AD1D09  |00091D;
    STA.W strcPlayerData.carryItemIdPrev                       ;81C9D9|8D1E09  |00091E;
 
.exit:
    JMP.W fUnknown_81C002                                      ;81C9DC|4C02C0  |81C002;
 
 
fPlayerAction0x05:
    REP #$30                                                   ;81C9DF|C230    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81C9E8|F003    |81C9ED;
    JMP.W .label1                                              ;81C9EA|4C13CA  |81CA13;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$30                                                   ;81C9F6|C230    |      ;
    LDA.W #$001C                                               ;81C9F8|A91C00  |      ;
    CLC                                                        ;81C9FB|18      |      ;
    ADC.B strcPlayer.direction                                 ;81C9FC|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;81C9FE|8D0109  |000901;
    SEP #$20                                                   ;81CA01|E220    |      ;
    REP #$10                                                   ;81CA03|C210    |      ;
    LDA.B #$07                                                 ;81CA05|A907    |      ;
    STA.W strcAudio.reg114                                     ;81CA07|8D1401  |000114;
    LDA.B #$06                                                 ;81CA0A|A906    |      ;
    STA.W strcAudio.reg115                                     ;81CA0C|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;81CA0F|22328383|838332;
 
.label1:
    JSR.W fUnknown_81CFE6                                      ;81CA13|20E6CF  |81CFE6;
    REP #$20                                                   ;81CA16|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81CA18|AD1509  |000915;
    CMP.W #$FFFF                                               ;81CA1B|C9FFFF  |      ;
    BNE .exit                                                  ;81CA1E|D013    |81CA33;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
 
.exit:
    JMP.W fUnknown_81C002                                      ;81CA33|4C02C0  |81C002;
 
 
fPlayerAction0x08:
    SEP #$20                                                   ;81CA36|E220    |      ;
    REP #$10                                                   ;81CA38|C210    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81CA41|F003    |81CA46;
    JMP.W .skip                                                ;81CA43|4C60CA  |81CA60;
 
 
  + %SetPlayerFlag(!PFLAGS_ANIMATING)
    SEP #$20                                                   ;81CA4F|E220    |      ;
    LDA.B #$00                                                 ;81CA51|A900    |      ;
    XBA                                                        ;81CA53|EB      |      ;
    LDA.W nCarriedItemId                                       ;81CA54|AD8409  |000984;
    REP #$20                                                   ;81CA57|C220    |      ;
    CLC                                                        ;81CA59|18      |      ;
    ADC.W #$0033                                               ;81CA5A|693300  |      ;
    STA.W strcObjectData.spriteIdx                             ;81CA5D|8D0109  |000901;
 
.skip:
    JSR.W fUnknown_81CFE6                                      ;81CA60|20E6CF  |81CFE6;
    REP #$20                                                   ;81CA63|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81CA65|AD1509  |000915;
    CMP.W #$FFFF                                               ;81CA68|C9FFFF  |      ;
    BEQ +                                                      ;81CA6B|F003    |81CA70;
    JMP.W .exit                                                ;81CA6D|4C11CB  |81CB11;
 
 
  + SEP #$20                                                   ;81CA70|E220    |      ;
    LDA.W nCarriedItemId                                       ;81CA72|AD8409  |000984;
    CMP.B #$02                                                 ;81CA75|C902    |      ;
    BEQ .poisonMushroom                                        ;81CA77|F01D    |81CA96;
    LDA.W nCarriedItemId                                       ;81CA79|AD8409  |000984;
    CMP.B #$08                                                 ;81CA7C|C908    |      ;
    BEQ .powerBerry                                            ;81CA7E|F02B    |81CAAB;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    JMP.W .exit                                                ;81CA93|4C11CB  |81CB11;
 
 
.poisonMushroom:
    %SetPlayerAction(!PACTION_DRUNK)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    BRA .exit                                                  ;81CAA9|8066    |81CB11;
 
 
.powerBerry:
    SEP #$20                                                   ;81CAAB|E220    |      ;
    LDA.L nPowerBerryEaten                                     ;81CAAD|AF361F7F|7F1F36;
    INC A                                                      ;81CAB1|1A      |      ;
    STA.L nPowerBerryEaten                                     ;81CAB2|8F361F7F|7F1F36;
    REP #$20                                                   ;81CAB6|C220    |      ;
    LDA.W #$000A                                               ;81CAB8|A90A00  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81CABB|2282B283|83B282;
    SEP #$20                                                   ;81CABF|E220    |      ;
    LDA.W strcPlayerData.stamina                               ;81CAC1|AD1709  |000917;
    CLC                                                        ;81CAC4|18      |      ;
    ADC.B #$0A                                                 ;81CAC5|690A    |      ;
    STA.W strcPlayerData.stamina                               ;81CAC7|8D1709  |000917;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;81CADD|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;81CADF|A522    |000022;
    CMP.B #!AREA_HOUSE1                                                 
    BEQ .goHome                                                ;81CAE3|F01D    |81CB02;
    CMP.B #!AREA_HOUSE2                                                 
    BEQ .goHome                                                ;81CAE7|F019    |81CB02;
    CMP.B #!AREA_HOUSE3                                                 
    BEQ .goHome                                                ;81CAEB|F015    |81CB02;
    LDA.B strcMap.loadAreaId                                   ;81CAED|A522    |000022;
    CMP.B #!AREA_WOODSCAVE                                                 
    BNE .exit                                                  ;81CAF1|D01E    |81CB11;
    REP #$30                                                   ;81CAF3|C230    |      ;
    %SetFlag(event4, $0040)
    BRA .exit                                                  ;81CB00|800F    |81CB11;
 
 
.goHome:
    REP #$30                                                   ;81CB02|C230    |      ;
    %SetFlag(event5, $4000)
    BRA .exit                                                  ;81CB0F|8000    |81CB11;
 
 
.exit:
    JMP.W fUnknown_81C002                                      ;81CB11|4C02C0  |81C002;
 
 
fPlayerAction_EatMeal:
    SEP #$20                                                   ;81CB14|E220    |      ;
    REP #$10                                                   ;81CB16|C210    |      ;
    %CheckPlayerFlags(!PFLAGS_ANIMATING)
    BEQ +                                                      ;81CB1F|F003    |81CB24;
    JMP.W .skip                                                ;81CB21|4C38CB  |81CB38;
 
 
  + %SetPlayerFlag($8000)
    SEP #$20                                                   ;81CB2D|E220    |      ;
    LDA.W strcPlayerData.eatFood                               ;81CB2F|AD2409  |000924;
    CLC                                                        ;81CB32|18      |      ;
    ADC.B #$30                                                 ;81CB33|6930    |      ;
    STA.W strcObjectData.spriteIdx                             ;81CB35|8D0109  |000901;
 
.skip:
    JSR.W fUnknown_81CFE6                                      ;81CB38|20E6CF  |81CFE6;
    REP #$20                                                   ;81CB3B|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81CB3D|AD1509  |000915;
    CMP.W #$FFFF                                               ;81CB40|C9FFFF  |      ;
    BNE .exit                                                  ;81CB43|D016    |81CB5B;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_EATINGMEAL)
    JMP.W fUnknown_81C002                                      ;81CB58|4C02C0  |81C002;
 
 
.exit:
    JMP.W fPlayerAction0x19                                    ;81CB5B|4C0EC0  |81C00E;
 
 
fPlayerAction0x09:
    REP #$30                                                   ;81CB5E|C230    |      ;
    JSR.W fUnknown_81CFE6                                      ;81CB60|20E6CF  |81CFE6;
    REP #$20                                                   ;81CB63|C220    |      ;
    LDA.W strcObjectData.exist                                 ;81CB65|AD1509  |000915;
    CMP.W #$FFFF                                               ;81CB68|C9FFFF  |      ;
    BNE .exit                                                  ;81CB6B|D007    |81CB74;
    %SetPlayerAction(!PACTION_NONE)
 
.exit:
    JMP.W fUnknown_81C013                                      ;81CB74|4C13C0  |81C013;
 
 
fUnknown_81CB77:
    JSR.W fUnknown_81CFE6                                      ;81CB77|20E6CF  |81CFE6;
    REP #$20                                                   ;81CB7A|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CB7C|A5DA    |0000DA;
    CMP.W #!PDIR_DOWN                                               
    BNE +                                                      ;81CB81|D003    |81CB86;
    JMP.W .down                                                ;81CB83|4C9ECB  |81CB9E;
 
 
  + CMP.W #!PDIR_UP                                               
    BNE +                                                      ;81CB89|D003    |81CB8E;
    JMP.W .up                                                  ;81CB8B|4C42CC  |81CC42;
 
 
  + CMP.W #!PDIR_LEFT                                               
    BNE +                                                      ;81CB91|D003    |81CB96;
    JMP.W .left                                                ;81CB93|4CE6CC  |81CCE6;
 
 
  + CMP.W #!PDIR_RIGHT                                               
    BNE .down                                                  ;81CB99|D003    |81CB9E;
    JMP.W .right                                               ;81CB9B|4C8ACD  |81CD8A;
 
 
.down:
    REP #$30                                                   ;81CB9E|C230    |      ;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE +                                                      ;81CBA7|D003    |81CBAC;
    JMP.W .addY                                                ;81CBA9|4C30CC  |81CC30;
 
 
  + %CheckPlayerAction(!PACTION_17)
    BNE +                                                      ;81CBB3|D003    |81CBB8;
    JMP.W .addY                                                ;81CBB5|4C30CC  |81CC30;
 
 
  + %CheckPlayerAction(!PACTION_18)
    BNE +                                                      ;81CBBF|D003    |81CBC4;
    JMP.W .addY                                                ;81CBC1|4C30CC  |81CC30;
 
 
  + %CheckPlayerFlags(!PFLAGS_INTRANSITION)
    BEQ +                                                      ;81CBCB|F003    |81CBD0;
    JMP.W .addY                                                ;81CBCD|4C30CC  |81CC30;
 
 
  + LDA.B strcPlayer.posX                                      ;81CBD0|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;81CBD2|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;81CBD4|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;81CBD6|85E1    |0000E1;
    LDA.W #$0000                                               ;81CBD8|A90000  |      ;
    STA.B strcPlayer.newX                                      ;81CBDB|85E5    |0000E5;
    LDA.B strcMap.unk1E                                        ;81CBDD|A51E    |00001E;
    STA.B strcPlayer.newY                                      ;81CBDF|85E7    |0000E7;
    STZ.B strcPlayer.unkE3                                     ;81CBE1|64E3    |0000E3;
    REP #$20                                                   ;81CBE3|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CBE5|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;81CBE7|2291AD83|83AD91;
    CMP.W #$0000                                               ;81CBEB|C90000  |      ;
    BEQ +                                                      ;81CBEE|F003    |81CBF3;
    JMP.W .return1                                             ;81CBF0|4C53CE  |81CE53;
 
 
  + REP #$20                                                   ;81CBF3|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CBF5|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AF37                   ;81CBF7|2237AF83|83AF37;
    REP #$30                                                   ;81CBFB|C230    |      ;
    STY.B strcVariables.n16Temp1                               ;81CBFD|847E    |00007E;
    CMP.W #$0001                                               ;81CBFF|C90100  |      ;
    BNE +                                                      ;81CC02|D003    |81CC07;
    JMP.W .sub1                                                ;81CC04|4C58CE  |81CE58;
 
 
  + CMP.W #$0002                                               ;81CC07|C90200  |      ;
    BNE .jump0                                                 ;81CC0A|D003    |81CC0F;
    JMP.W .sub2                                                ;81CC0C|4C81CE  |81CE81;
 
 
.jump0:
    REP #$20                                                   ;81CC0F|C220    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CC11|A5EB    |0000EB;
    STA.W $087A                                                ;81CC13|8D7A08  |00087A;
    LDA.B strcPlayer.unkPosX                                   ;81CC16|A5E9    |0000E9;
    STA.W $0878                                                ;81CC18|8D7808  |000878;
    SEC                                                        ;81CC1B|38      |      ;
    SBC.W #$00C0                                               ;81CC1C|E9C000  |      ;
    CMP.W #$0010                                               ;81CC1F|C91000  |      ;
    BCS +                                                      ;81CC22|B003    |81CC27;
    JMP.W .return1                                             ;81CC24|4C53CE  |81CE53;
 
 
  + STY.B strcVariables.n16Temp1                               ;81CC27|847E    |00007E;
    LDA.B strcMap.unk1E                                        ;81CC29|A51E    |00001E;
    SEC                                                        ;81CC2B|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81CC2C|E57E    |00007E;
    STA.B strcMap.unk1E                                        ;81CC2E|851E    |00001E;
 
.addY:
    LDA.B strcPlayer.posY                                      ;81CC30|A5D8    |0000D8;
    CLC                                                        ;81CC32|18      |      ;
    ADC.B strcMap.unk1E                                        ;81CC33|651E    |00001E;
    STA.B strcPlayer.posY                                      ;81CC35|85D8    |0000D8;
    JSL.L fUnknown_809EBC                                      ;81CC37|22BC9E80|809EBC;
    JSL.L fUnknown_80A0AB                                      ;81CC3B|22ABA080|80A0AB;
    JMP.W .exit                                                ;81CC3F|4C2BCE  |81CE2B;
 
 
.up:
    REP #$30                                                   ;81CC42|C230    |      ;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE +                                                      ;81CC4B|D003    |81CC50;
    JMP.W .subY                                                ;81CC4D|4CD4CC  |81CCD4;
 
 
  + %CheckPlayerAction(!PACTION_17)
    BNE +                                                      ;81CC57|D003    |81CC5C;
    JMP.W .subY                                                ;81CC59|4CD4CC  |81CCD4;
 
 
  + %CheckPlayerAction(!PACTION_18)
    BNE +                                                      ;81CC63|D003    |81CC68;
    JMP.W .subY                                                ;81CC65|4CD4CC  |81CCD4;
 
 
  + %CheckPlayerFlags(!PFLAGS_INTRANSITION)
    BEQ +                                                      ;81CC6F|F003    |81CC74;
    JMP.W .subY                                                ;81CC71|4CD4CC  |81CCD4;
 
 
  + LDA.B strcPlayer.posX                                      ;81CC74|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;81CC76|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;81CC78|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;81CC7A|85E1    |0000E1;
    LDA.W #$0000                                               ;81CC7C|A90000  |      ;
    STA.B strcPlayer.newX                                      ;81CC7F|85E5    |0000E5;
    LDA.B strcMap.unk1E                                        ;81CC81|A51E    |00001E;
    STA.B strcPlayer.newY                                      ;81CC83|85E7    |0000E7;
    STZ.B strcPlayer.unkE3                                     ;81CC85|64E3    |0000E3;
    REP #$20                                                   ;81CC87|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CC89|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;81CC8B|2291AD83|83AD91;
    CMP.W #$0000                                               ;81CC8F|C90000  |      ;
    BEQ +                                                      ;81CC92|F003    |81CC97;
    JMP.W .return1                                             ;81CC94|4C53CE  |81CE53;
 
 
  + REP #$20                                                   ;81CC97|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CC99|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AF37                   ;81CC9B|2237AF83|83AF37;
    REP #$30                                                   ;81CC9F|C230    |      ;
    STY.B strcVariables.n16Temp1                               ;81CCA1|847E    |00007E;
    CMP.W #$0001                                               ;81CCA3|C90100  |      ;
    BNE +                                                      ;81CCA6|D003    |81CCAB;
    JMP.W .sub3                                                ;81CCA8|4CAACE  |81CEAA;
 
 
  + CMP.W #$0002                                               ;81CCAB|C90200  |      ;
    BNE .jump1                                                 ;81CCAE|D003    |81CCB3;
    JMP.W .sub4                                                ;81CCB0|4CD3CE  |81CED3;
 
 
.jump1:
    REP #$20                                                   ;81CCB3|C220    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CCB5|A5EB    |0000EB;
    STA.W $087A                                                ;81CCB7|8D7A08  |00087A;
    LDA.B strcPlayer.unkPosX                                   ;81CCBA|A5E9    |0000E9;
    STA.W $0878                                                ;81CCBC|8D7808  |000878;
    SEC                                                        ;81CCBF|38      |      ;
    SBC.W #$00C0                                               ;81CCC0|E9C000  |      ;
    CMP.W #$0010                                               ;81CCC3|C91000  |      ;
    BCS +                                                      ;81CCC6|B003    |81CCCB;
    JMP.W .return1                                             ;81CCC8|4C53CE  |81CE53;
 
 
  + STY.B strcVariables.n16Temp1                               ;81CCCB|847E    |00007E;
    LDA.B strcMap.unk1E                                        ;81CCCD|A51E    |00001E;
    SEC                                                        ;81CCCF|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81CCD0|E57E    |00007E;
    STA.B strcMap.unk1E                                        ;81CCD2|851E    |00001E;
 
.subY:
    LDA.B strcPlayer.posY                                      ;81CCD4|A5D8    |0000D8;
    SEC                                                        ;81CCD6|38      |      ;
    SBC.B strcMap.unk1E                                        ;81CCD7|E51E    |00001E;
    STA.B strcPlayer.posY                                      ;81CCD9|85D8    |0000D8;
    JSL.L fUnknown_809EBC                                      ;81CCDB|22BC9E80|809EBC;
    JSL.L fUnknown_80A0E1                                      ;81CCDF|22E1A080|80A0E1;
    JMP.W .exit                                                ;81CCE3|4C2BCE  |81CE2B;
 
 
.left:
    REP #$30                                                   ;81CCE6|C230    |      ;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE +                                                      ;81CCEF|D003    |81CCF4;
    JMP.W .addX                                                ;81CCF1|4C78CD  |81CD78;
 
 
  + %CheckPlayerAction(!PACTION_17)
    BNE +                                                      ;81CCFB|D003    |81CD00;
    JMP.W .addX                                                ;81CCFD|4C78CD  |81CD78;
 
 
  + %CheckPlayerAction(!PACTION_18)
    BNE +                                                      ;81CD07|D003    |81CD0C;
    JMP.W .addX                                                ;81CD09|4C78CD  |81CD78;
 
 
  + %CheckPlayerFlags(!PFLAGS_INTRANSITION)
    BEQ +                                                      ;81CD13|F003    |81CD18;
    JMP.W .addX                                                ;81CD15|4C78CD  |81CD78;
 
 
  + LDA.B strcPlayer.posX                                      ;81CD18|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;81CD1A|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;81CD1C|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;81CD1E|85E1    |0000E1;
    LDA.B strcMap.unk1E                                        ;81CD20|A51E    |00001E;
    STA.B strcPlayer.newX                                      ;81CD22|85E5    |0000E5;
    LDA.W #$0000                                               ;81CD24|A90000  |      ;
    STA.B strcPlayer.newY                                      ;81CD27|85E7    |0000E7;
    STZ.B strcPlayer.unkE3                                     ;81CD29|64E3    |0000E3;
    REP #$20                                                   ;81CD2B|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CD2D|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;81CD2F|2291AD83|83AD91;
    CMP.W #$0000                                               ;81CD33|C90000  |      ;
    BEQ +                                                      ;81CD36|F003    |81CD3B;
    JMP.W .return1                                             ;81CD38|4C53CE  |81CE53;
 
 
  + REP #$20                                                   ;81CD3B|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CD3D|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AF37                   ;81CD3F|2237AF83|83AF37;
    REP #$30                                                   ;81CD43|C230    |      ;
    STX.B strcVariables.n16Temp1                               ;81CD45|867E    |00007E;
    CMP.W #$0001                                               ;81CD47|C90100  |      ;
    BNE +                                                      ;81CD4A|D003    |81CD4F;
    JMP.W .sub5                                                ;81CD4C|4CFCCE  |81CEFC;
 
 
  + CMP.W #$0002                                               ;81CD4F|C90200  |      ;
    BNE .jump2                                                 ;81CD52|D003    |81CD57;
    JMP.W .sub6                                                ;81CD54|4C25CF  |81CF25;
 
 
.jump2:
    REP #$20                                                   ;81CD57|C220    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CD59|A5EB    |0000EB;
    STA.W $087A                                                ;81CD5B|8D7A08  |00087A;
    LDA.B strcPlayer.unkPosX                                   ;81CD5E|A5E9    |0000E9;
    STA.W $0878                                                ;81CD60|8D7808  |000878;
    SEC                                                        ;81CD63|38      |      ;
    SBC.W #$00C0                                               ;81CD64|E9C000  |      ;
    CMP.W #$0010                                               ;81CD67|C91000  |      ;
    BCS +                                                      ;81CD6A|B003    |81CD6F;
    JMP.W .return1                                             ;81CD6C|4C53CE  |81CE53;
 
 
  + STX.B strcVariables.n16Temp1                               ;81CD6F|867E    |00007E;
    LDA.B strcMap.unk1E                                        ;81CD71|A51E    |00001E;
    SEC                                                        ;81CD73|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81CD74|E57E    |00007E;
    STA.B strcMap.unk1E                                        ;81CD76|851E    |00001E;
 
.addX:
    LDA.B strcPlayer.posX                                      ;81CD78|A5D6    |0000D6;
    CLC                                                        ;81CD7A|18      |      ;
    ADC.B strcMap.unk1E                                        ;81CD7B|651E    |00001E;
    STA.B strcPlayer.posX                                      ;81CD7D|85D6    |0000D6;
    JSL.L fUnknown_809EBC                                      ;81CD7F|22BC9E80|809EBC;
    JSL.L fUnknown_80A11C                                      ;81CD83|221CA180|80A11C;
    JMP.W .exit                                                ;81CD87|4C2BCE  |81CE2B;
 
 
.right:
    REP #$30                                                   ;81CD8A|C230    |      ;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE +                                                      ;81CD93|D003    |81CD98;
    JMP.W .subX                                                ;81CD95|4C1CCE  |81CE1C;
 
 
  + %CheckPlayerAction(!PACTION_17)
    BNE +                                                      ;81CD9F|D003    |81CDA4;
    JMP.W .subX                                                ;81CDA1|4C1CCE  |81CE1C;
 
 
  + %CheckPlayerAction(!PACTION_18)
    BNE +                                                      ;81CDAB|D003    |81CDB0;
    JMP.W .subX                                                ;81CDAD|4C1CCE  |81CE1C;
 
 
  + %CheckPlayerFlags($0080)
    BEQ +                                                      ;81CDB7|F003    |81CDBC;
    JMP.W .subX                                                ;81CDB9|4C1CCE  |81CE1C;
 
 
  + LDA.B strcPlayer.posX                                      ;81CDBC|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;81CDBE|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;81CDC0|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;81CDC2|85E1    |0000E1;
    LDA.B strcMap.unk1E                                        ;81CDC4|A51E    |00001E;
    STA.B strcPlayer.newX                                      ;81CDC6|85E5    |0000E5;
    LDA.W #$0000                                               ;81CDC8|A90000  |      ;
    STA.B strcPlayer.newY                                      ;81CDCB|85E7    |0000E7;
    STZ.B strcPlayer.unkE3                                     ;81CDCD|64E3    |0000E3;
    REP #$20                                                   ;81CDCF|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CDD1|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;81CDD3|2291AD83|83AD91;
    CMP.W #$0000                                               ;81CDD7|C90000  |      ;
    BEQ +                                                      ;81CDDA|F003    |81CDDF;
    JMP.W .return1                                             ;81CDDC|4C53CE  |81CE53;
 
 
  + REP #$20                                                   ;81CDDF|C220    |      ;
    LDA.B strcPlayer.direction                                 ;81CDE1|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AF37                   ;81CDE3|2237AF83|83AF37;
    REP #$30                                                   ;81CDE7|C230    |      ;
    STX.B strcVariables.n16Temp1                               ;81CDE9|867E    |00007E;
    CMP.W #$0001                                               ;81CDEB|C90100  |      ;
    BNE +                                                      ;81CDEE|D003    |81CDF3;
    JMP.W .sub7                                                ;81CDF0|4C4ECF  |81CF4E;
 
 
  + CMP.W #$0002                                               ;81CDF3|C90200  |      ;
    BNE .jump3                                                 ;81CDF6|D003    |81CDFB;
    JMP.W .sub8                                                ;81CDF8|4C77CF  |81CF77;
 
 
.jump3:
    REP #$20                                                   ;81CDFB|C220    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CDFD|A5EB    |0000EB;
    STA.W $087A                                                ;81CDFF|8D7A08  |00087A;
    LDA.B strcPlayer.unkPosX                                   ;81CE02|A5E9    |0000E9;
    STA.W $0878                                                ;81CE04|8D7808  |000878;
    SEC                                                        ;81CE07|38      |      ;
    SBC.W #$00C0                                               ;81CE08|E9C000  |      ;
    CMP.W #$0010                                               ;81CE0B|C91000  |      ;
    BCS +                                                      ;81CE0E|B003    |81CE13;
    JMP.W .return1                                             ;81CE10|4C53CE  |81CE53;
 
 
  + STX.B strcVariables.n16Temp1                               ;81CE13|867E    |00007E;
    LDA.B strcMap.unk1E                                        ;81CE15|A51E    |00001E;
    SEC                                                        ;81CE17|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81CE18|E57E    |00007E;
    STA.B strcMap.unk1E                                        ;81CE1A|851E    |00001E;
 
.subX:
    LDA.B strcPlayer.posX                                      ;81CE1C|A5D6    |0000D6;
    SEC                                                        ;81CE1E|38      |      ;
    SBC.B strcMap.unk1E                                        ;81CE1F|E51E    |00001E;
    STA.B strcPlayer.posX                                      ;81CE21|85D6    |0000D6;
    JSL.L fUnknown_809EBC                                      ;81CE23|22BC9E80|809EBC;
    JSL.L fUnknown_80A152                                      ;81CE27|2252A180|80A152;
 
.exit:
    SEP #$20                                                   ;81CE2B|E220    |      ;
    REP #$10                                                   ;81CE2D|C210    |      ;
    LDA.W strcPlayerData.unkCounter919                         ;81CE2F|AD1909  |000919;
    INC A                                                      ;81CE32|1A      |      ;
    STA.W strcPlayerData.unkCounter919                         ;81CE33|8D1909  |000919;
    LDA.W strcPlayerData.unkCounter919                         ;81CE36|AD1909  |000919;
    CMP.B #$08                                                 ;81CE39|C908    |      ;
    BNE .return                                                ;81CE3B|D015    |81CE52;
    JSL.L fUnknownCF_81A58F                                    ;81CE3D|228FA581|81A58F;
    REP #$20                                                   ;81CE41|C220    |      ;
    LDA.B strcPlayer.posX                                      ;81CE43|A5D6    |0000D6;
    STA.W strcObjectData.playerX                               ;81CE45|8D0709  |000907;
    LDA.B strcPlayer.posY                                      ;81CE48|A5D8    |0000D8;
    STA.W strcObjectData.playerY                               ;81CE4A|8D0909  |000909;
    SEP #$20                                                   ;81CE4D|E220    |      ;
    STZ.W strcPlayerData.unkCounter919                         ;81CE4F|9C1909  |000919;
 
.return:
    RTS                                                        ;81CE52|60      |      ;
 
 
.return1:
    REP #$20                                                   ;81CE53|C220    |      ;
    STZ.B strcMap.unk1E                                        ;81CE55|641E    |00001E;
    RTS                                                        ;81CE57|60      |      ;
 
 
.sub1:
    REP #$30                                                   ;81CE58|C230    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CE5A|A5EB    |0000EB;
    BEQ ++                                                     ;81CE5C|F014    |81CE72;
    CMP.W #$00A0                                               ;81CE5E|C9A000  |      ;
    BCC +                                                      ;81CE61|9005    |81CE68;
    CMP.W #$00B0                                               ;81CE63|C9B000  |      ;
    BCC ++                                                     ;81CE66|900A    |81CE72;
 
  + LDA.B strcPlayer.posX                                      ;81CE68|A5D6    |0000D6;
    AND.W #$0008                                               ;81CE6A|290800  |      ;
    BNE ++                                                     ;81CE6D|D003    |81CE72;
    JMP.W .jump0                                               ;81CE6F|4C0FCC  |81CC0F;
 
 
 ++ LDA.W #$0001                                               ;81CE72|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CE75|851E    |00001E;
    %SetPlayerDirection(!PDIR_RIGHT)
    JMP.W .right                                               ;81CE7E|4C8ACD  |81CD8A;
 
 
.sub2:
    REP #$30                                                   ;81CE81|C230    |      ;
    LDA.B strcPlayer.unkPosX                                   ;81CE83|A5E9    |0000E9;
    BEQ ++                                                     ;81CE85|F014    |81CE9B;
    CMP.W #$00A0                                               ;81CE87|C9A000  |      ;
    BCC +                                                      ;81CE8A|9005    |81CE91;
    CMP.W #$00B0                                               ;81CE8C|C9B000  |      ;
    BCC ++                                                     ;81CE8F|900A    |81CE9B;
 
  + LDA.B strcPlayer.posX                                      ;81CE91|A5D6    |0000D6;
    AND.W #$0008                                               ;81CE93|290800  |      ;
    BEQ ++                                                     ;81CE96|F003    |81CE9B;
    JMP.W .jump0                                               ;81CE98|4C0FCC  |81CC0F;
 
 
 ++ LDA.W #$0001                                               ;81CE9B|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CE9E|851E    |00001E;
    %SetPlayerDirection(!PDIR_LEFT)
    JMP.W .left                                                ;81CEA7|4CE6CC  |81CCE6;
 
 
.sub3:
    REP #$30                                                   ;81CEAA|C230    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CEAC|A5EB    |0000EB;
    BEQ ++                                                     ;81CEAE|F014    |81CEC4;
    CMP.W #$00A0                                               ;81CEB0|C9A000  |      ;
    BCC +                                                      ;81CEB3|9005    |81CEBA;
    CMP.W #$00B0                                               ;81CEB5|C9B000  |      ;
    BCC ++                                                     ;81CEB8|900A    |81CEC4;
 
  + LDA.B strcPlayer.posX                                      ;81CEBA|A5D6    |0000D6;
    AND.W #$0008                                               ;81CEBC|290800  |      ;
    BNE ++                                                     ;81CEBF|D003    |81CEC4;
    JMP.W .jump1                                               ;81CEC1|4CB3CC  |81CCB3;
 
 
 ++ LDA.W #$0001                                               ;81CEC4|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CEC7|851E    |00001E;
    %SetPlayerDirection(!PDIR_RIGHT)
    JMP.W .right                                               ;81CED0|4C8ACD  |81CD8A;
 
 
.sub4:
    REP #$30                                                   ;81CED3|C230    |      ;
    LDA.B strcPlayer.unkPosX                                   ;81CED5|A5E9    |0000E9;
    BEQ ++                                                     ;81CED7|F014    |81CEED;
    CMP.W #$00A0                                               ;81CED9|C9A000  |      ;
    BCC +                                                      ;81CEDC|9005    |81CEE3;
    CMP.W #$00B0                                               ;81CEDE|C9B000  |      ;
    BCC ++                                                     ;81CEE1|900A    |81CEED;
 
  + LDA.B strcPlayer.posX                                      ;81CEE3|A5D6    |0000D6;
    AND.W #$0008                                               ;81CEE5|290800  |      ;
    BEQ ++                                                     ;81CEE8|F003    |81CEED;
    JMP.W .jump1                                               ;81CEEA|4CB3CC  |81CCB3;
 
 
 ++ LDA.W #$0001                                               ;81CEED|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CEF0|851E    |00001E;
    %SetPlayerDirection(!PDIR_LEFT)
    JMP.W .left                                                ;81CEF9|4CE6CC  |81CCE6;
 
 
.sub5:
    REP #$30                                                   ;81CEFC|C230    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CEFE|A5EB    |0000EB;
    BEQ ++                                                     ;81CF00|F014    |81CF16;
    CMP.W #$00A0                                               ;81CF02|C9A000  |      ;
    BCC +                                                      ;81CF05|9005    |81CF0C;
    CMP.W #$00B0                                               ;81CF07|C9B000  |      ;
    BCC ++                                                     ;81CF0A|900A    |81CF16;
 
  + LDA.B strcPlayer.posY                                      ;81CF0C|A5D8    |0000D8;
    AND.W #$0008                                               ;81CF0E|290800  |      ;
    BNE ++                                                     ;81CF11|D003    |81CF16;
    JMP.W .jump2                                               ;81CF13|4C57CD  |81CD57;
 
 
 ++ LDA.W #$0001                                               ;81CF16|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CF19|851E    |00001E;
    %SetPlayerDirection(!PDIR_UP)
    JMP.W .up                                                  ;81CF22|4C42CC  |81CC42;
 
 
.sub6:
    REP #$30                                                   ;81CF25|C230    |      ;
    LDA.B strcPlayer.unkPosX                                   ;81CF27|A5E9    |0000E9;
    BEQ ++                                                     ;81CF29|F014    |81CF3F;
    CMP.W #$00A0                                               ;81CF2B|C9A000  |      ;
    BCC +                                                      ;81CF2E|9005    |81CF35;
    CMP.W #$00B0                                               ;81CF30|C9B000  |      ;
    BCC ++                                                     ;81CF33|900A    |81CF3F;
 
  + LDA.B strcPlayer.posY                                      ;81CF35|A5D8    |0000D8;
    AND.W #$0008                                               ;81CF37|290800  |      ;
    BEQ ++                                                     ;81CF3A|F003    |81CF3F;
    JMP.W .jump2                                               ;81CF3C|4C57CD  |81CD57;
 
 
 ++ LDA.W #$0001                                               ;81CF3F|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CF42|851E    |00001E;
    %SetPlayerDirection(!PDIR_DOWN)
    JMP.W .down                                                ;81CF4B|4C9ECB  |81CB9E;
 
 
.sub7:
    REP #$30                                                   ;81CF4E|C230    |      ;
    LDA.B strcPlayer.unkPosY                                   ;81CF50|A5EB    |0000EB;
    BEQ ++                                                     ;81CF52|F014    |81CF68;
    CMP.W #$00A0                                               ;81CF54|C9A000  |      ;
    BCC +                                                      ;81CF57|9005    |81CF5E;
    CMP.W #$00B0                                               ;81CF59|C9B000  |      ;
    BCC ++                                                     ;81CF5C|900A    |81CF68;
 
  + LDA.B strcPlayer.posY                                      ;81CF5E|A5D8    |0000D8;
    AND.W #$0008                                               ;81CF60|290800  |      ;
    BNE ++                                                     ;81CF63|D003    |81CF68;
    JMP.W .jump3                                               ;81CF65|4CFBCD  |81CDFB;
 
 
 ++ LDA.W #$0001                                               ;81CF68|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CF6B|851E    |00001E;
    %SetPlayerDirection(!PDIR_UP)
    JMP.W .up                                                  ;81CF74|4C42CC  |81CC42;
 
 
.sub8:
    REP #$30                                                   ;81CF77|C230    |      ;
    LDA.B strcPlayer.unkPosX                                   ;81CF79|A5E9    |0000E9;
    BEQ ++                                                     ;81CF7B|F014    |81CF91;
    CMP.W #$00A0                                               ;81CF7D|C9A000  |      ;
    BCC +                                                      ;81CF80|9005    |81CF87;
    CMP.W #$00B0                                               ;81CF82|C9B000  |      ;
    BCC ++                                                     ;81CF85|900A    |81CF91;
 
  + LDA.B strcPlayer.posY                                      ;81CF87|A5D8    |0000D8;
    AND.W #$0008                                               ;81CF89|290800  |      ;
    BEQ ++                                                     ;81CF8C|F003    |81CF91;
    JMP.W .jump3                                               ;81CF8E|4CFBCD  |81CDFB;
 
 
 ++ LDA.W #$0001                                               ;81CF91|A90100  |      ;
    STA.B strcMap.unk1E                                        ;81CF94|851E    |00001E;
    %SetPlayerDirection(!PDIR_DOWN)
    JMP.W .down                                                ;81CF9D|4C9ECB  |81CB9E;
 
 
fUnknown_81CFA0:
    REP #$30                                                   ;81CFA0|C230    |      ;
    LDA.W strcObjectData.spriteIdx                             ;81CFA2|AD0109  |000901;
    STA.W strcObjectData.spriteIdxOld                          ;81CFA5|8D0309  |000903;
    STA.B strcVariables.n16Temp1                               ;81CFA8|857E    |00007E;
    ASL A                                                      ;81CFAA|0A      |      ;
    CLC                                                        ;81CFAB|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81CFAC|657E    |00007E;
    TAX                                                        ;81CFAE|AA      |      ;
    LDA.L sSmallSpriteData,X                                   ;81CFAF|BF10D281|81D210;
    STA.B strcObject.spriteTableIdx                            ;81CFB3|85A1    |0000A1;
    INX                                                        ;81CFB5|E8      |      ;
    INX                                                        ;81CFB6|E8      |      ;
    SEP #$20                                                   ;81CFB7|E220    |      ;
    LDA.B #$00                                                 ;81CFB9|A900    |      ;
    XBA                                                        ;81CFBB|EB      |      ;
    LDA.L sSmallSpriteData,X                                   ;81CFBC|BF10D281|81D210;
    REP #$20                                                   ;81CFC0|C220    |      ;
    ASL A                                                      ;81CFC2|0A      |      ;
    ASL A                                                      ;81CFC3|0A      |      ;
    ASL A                                                      ;81CFC4|0A      |      ;
    ASL A                                                      ;81CFC5|0A      |      ;
    ASL A                                                      ;81CFC6|0A      |      ;
    ASL A                                                      ;81CFC7|0A      |      ;
    STA.W strcObjectData.flip                                  ;81CFC8|8D0F09  |00090F;
    STA.B strcObject.flip                                      ;81CFCB|859F    |00009F;
    LDA.W #$0000                                               ;81CFCD|A90000  |      ;
    STA.B strcObject.unkA3                                     ;81CFD0|85A3    |0000A3;
    LDA.B strcPlayer.posX                                      ;81CFD2|A5D6    |0000D6;
    STA.B strcObject.posX                                      ;81CFD4|859B    |00009B;
    LDA.B strcPlayer.posY                                      ;81CFD6|A5D8    |0000D8;
    STA.B strcObject.posY                                      ;81CFD8|859D    |00009D;
    JSL.L fUnknown_858000                                      ;81CFDA|22008085|858000;
    REP #$20                                                   ;81CFDE|C220    |      ;
    LDA.B strcObject.gameObjectIdx                             ;81CFE0|A5A5    |0000A5;
    STA.W strcObjectData.gameObjectIdx                         ;81CFE2|8D0509  |000905;
    RTL                                                        ;81CFE5|6B      |      ;
 
 
fUnknown_81CFE6:
    REP #$30                                                   ;81CFE6|C230    |      ;
    LDA.W strcObjectData.gameObjectIdx                         ;81CFE8|AD0509  |000905;
    STA.B strcObject.gameObjectIdx                             ;81CFEB|85A5    |0000A5;
    LDA.B strcPlayer.posX                                      ;81CFED|A5D6    |0000D6;
    STA.B strcObject.posX                                      ;81CFEF|859B    |00009B;
    LDA.B strcPlayer.posY                                      ;81CFF1|A5D8    |0000D8;
    STA.B strcObject.posY                                      ;81CFF3|859D    |00009D;
    LDA.W strcObjectData.flip                                  ;81CFF5|AD0F09  |00090F;
    STA.B strcObject.flip                                      ;81CFF8|859F    |00009F;
    JSL.L fObject_Unknown8580B9                                ;81CFFA|22B98085|8580B9;
    REP #$20                                                   ;81CFFE|C220    |      ;
    LDA.W strcObjectData.spriteIdx                             ;81D000|AD0109  |000901;
    CMP.W strcObjectData.spriteIdxOld                          ;81D003|CD0309  |000903;
    BEQ .exit                                                  ;81D006|F031    |81D039;
    STA.W strcObjectData.spriteIdxOld                          ;81D008|8D0309  |000903;
    STA.B strcVariables.n16Temp1                               ;81D00B|857E    |00007E;
    ASL A                                                      ;81D00D|0A      |      ;
    CLC                                                        ;81D00E|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81D00F|657E    |00007E;
    TAX                                                        ;81D011|AA      |      ;
    LDA.L sSmallSpriteData,X                                   ;81D012|BF10D281|81D210;
    STA.B strcObject.spriteTableIdx                            ;81D016|85A1    |0000A1;
    INX                                                        ;81D018|E8      |      ;
    INX                                                        ;81D019|E8      |      ;
    SEP #$20                                                   ;81D01A|E220    |      ;
    LDA.B #$00                                                 ;81D01C|A900    |      ;
    XBA                                                        ;81D01E|EB      |      ;
    LDA.L sSmallSpriteData,X                                   ;81D01F|BF10D281|81D210;
    REP #$20                                                   ;81D023|C220    |      ;
    ASL A                                                      ;81D025|0A      |      ;
    ASL A                                                      ;81D026|0A      |      ;
    ASL A                                                      ;81D027|0A      |      ;
    ASL A                                                      ;81D028|0A      |      ;
    ASL A                                                      ;81D029|0A      |      ;
    ASL A                                                      ;81D02A|0A      |      ;
    STA.W strcObjectData.flip                                  ;81D02B|8D0F09  |00090F;
    STA.B strcObject.flip                                      ;81D02E|859F    |00009F;
    LDA.W strcObjectData.gameObjectIdx                         ;81D030|AD0509  |000905;
    STA.B strcObject.gameObjectIdx                             ;81D033|85A5    |0000A5;
    JSL.L fObject_Unknown858100                                ;81D035|22008185|858100;
 
.exit:
    JSR.W fUnknown_81D03D                                      ;81D039|203DD0  |81D03D;
    RTS                                                        ;81D03C|60      |      ;
 
 
fUnknown_81D03D:
    REP #$30                                                   ;81D03D|C230    |      ;
    LDA.W strcObjectData.gameObjectIdx                         ;81D03F|AD0509  |000905;
    STA.B strcObject.gameObjectIdx                             ;81D042|85A5    |0000A5;
    JSL.L fObject_GetSingleObjectData                          ;81D044|22CB8185|8581CB;
    REP #$20                                                   ;81D048|C220    |      ;
    LDA.B strcObject.exists                                    ;81D04A|A5A7    |0000A7;
    STA.W strcObjectData.exist                                 ;81D04C|8D1509  |000915;
    CMP.W #$FFFF                                               ;81D04F|C9FFFF  |      ;
    BNE .return                                                ;81D052|D00C    |81D060;
    %UnsetPlayerFlag(!PFLAGS_KNEEING)
 
.return:
    RTS                                                        ;81D060|60      |      ;
 
 
fPlayerEnergyHandler:
    SEP #$20                                                   ;81D061|E220    |      ; A: nArg
    REP #$10                                                   ;81D063|C210    |      ;
    STA.B strcVariables.n8Temp1                                ;81D065|8592    |000092;
    STA.B strcVariables.n16Temp3                               ;81D067|8582    |000082;
    STZ.B $83                                                  ;81D069|6483    |000083;
    BMI .label1                                                ;81D06B|3002    |81D06F;
    BRA .recoveredStamina                                      ;81D06D|8006    |81D075;
 
 
.label1:
    SEP #$20                                                   ;81D06F|E220    |      ;
    LDA.B #$FF                                                 ;81D071|A9FF    |      ;
    STA.B $83                                                  ;81D073|8583    |000083;
 
.recoveredStamina:
    REP #$20                                                   ;81D075|C220    |      ;
    %CheckFlag(daily4, $0008)
    BEQ +                                                      ;81D07E|F003    |81D083;
    JMP.W .return                                              ;81D080|4C4BD1  |81D14B;
 
 
  + SEP #$20                                                   ;81D083|E220    |      ;
    LDA.B #$00                                                 ;81D085|A900    |      ;
    XBA                                                        ;81D087|EB      |      ;
    LDA.W strcPlayerData.stamina                               ;81D088|AD1709  |000917;
    REP #$20                                                   ;81D08B|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;81D08D|857E    |00007E;
    SEP #$20                                                   ;81D08F|E220    |      ;
    LDA.W strcPlayerData.energy                                ;81D091|AD1809  |000918;
    REP #$20                                                   ;81D094|C220    |      ;
    CLC                                                        ;81D096|18      |      ;
    ADC.B strcVariables.n16Temp3                               ;81D097|6582    |000082;
    STA.B strcVariables.n16Temp2                               ;81D099|8580    |000080;
    LDA.B strcVariables.n16Temp2                               ;81D09B|A580    |000080;
    BEQ .outOfStamina                                          ;81D09D|F014    |81D0B3;
    BMI .outOfStamina                                          ;81D09F|3012    |81D0B3;
    CMP.B strcVariables.n16Temp1                               ;81D0A1|C57E    |00007E;
    BCS .label4                                                ;81D0A3|B02D    |81D0D2;
    %UnsetPlayerFlag(!PFLAGS_OUTOFSTAMINA)
    BRA .label5                                                ;81D0B1|8035    |81D0E8;
 
 
.outOfStamina:
    SEP #$20                                                   ;81D0B3|E220    |      ;
    STZ.W strcPlayerData.energy                                ;81D0B5|9C1809  |000918;
    %SetPlayerFlag(!PFLAGS_OUTOFSTAMINA)
    REP #$20                                                   ;81D0C1|C220    |      ;
    LDA.W #$004D                                               ;81D0C3|A94D00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81D0C6|8D0109  |000901;
    %SetPlayerAction(!PACTION_TIRED)
    BRA .label6                                                ;81D0D0|8021    |81D0F3;
 
 
.label4:
    SEP #$20                                                   ;81D0D2|E220    |      ;
    LDA.W strcPlayerData.stamina                               ;81D0D4|AD1709  |000917;
    STA.W strcPlayerData.energy                                ;81D0D7|8D1809  |000918;
    %UnsetPlayerFlag(!PFLAGS_OUTOFSTAMINA)
    BRA .label6                                                ;81D0E6|800B    |81D0F3;
 
 
.label5:
    SEP #$20                                                   ;81D0E8|E220    |      ;
    LDA.W strcPlayerData.energy                                ;81D0EA|AD1809  |000918;
    CLC                                                        ;81D0ED|18      |      ;
    ADC.B strcVariables.n8Temp1                                ;81D0EE|6592    |000092;
    STA.W strcPlayerData.energy                                ;81D0F0|8D1809  |000918;
 
.label6:
    SEP #$30                                                   ;81D0F3|E230    |      ;
    LDA.B strcVariables.n8Temp1                                ;81D0F5|A592    |000092;
    BMI .label8                                                ;81D0F7|3016    |81D10F;
    LDY.B #$00                                                 ;81D0F9|A000    |      ;
    LDA.W strcPlayerData.stamina                               ;81D0FB|AD1709  |000917;
 
.loop1:
    LSR A                                                      ;81D0FE|4A      |      ;
    CMP.W strcPlayerData.energy                                ;81D0FF|CD1809  |000918;
    BEQ .label7                                                ;81D102|F005    |81D109;
    BCC .label7                                                ;81D104|9003    |81D109;
    INY                                                        ;81D106|C8      |      ;
    BRA .loop1                                                 ;81D107|80F5    |81D0FE;
 
 
.label7:
    TYA                                                        ;81D109|98      |      ;
    STA.W $096C                                                ;81D10A|8D6C09  |00096C;
    BRA .return                                                ;81D10D|803C    |81D14B;
 
 
.label8:
    SEP #$30                                                   ;81D10F|E230    |      ;
    LDA.W $096C                                                ;81D111|AD6C09  |00096C;
    CMP.B #$03                                                 ;81D114|C903    |      ;
    BEQ .return                                                ;81D116|F033    |81D14B;
    LDY.B #$00                                                 ;81D118|A000    |      ;
    LDA.W strcPlayerData.stamina                               ;81D11A|AD1709  |000917;
 
.loop2:
    LSR A                                                      ;81D11D|4A      |      ;
    CPY.W $096C                                                ;81D11E|CC6C09  |00096C;
    BEQ .label9                                                ;81D121|F003    |81D126;
    INY                                                        ;81D123|C8      |      ;
    BRA .loop2                                                 ;81D124|80F7    |81D11D;
 
 
.label9:
    CMP.W strcPlayerData.energy                                ;81D126|CD1809  |000918;
    BCS .label10                                               ;81D129|B002    |81D12D;
    BRA .return                                                ;81D12B|801E    |81D14B;
 
 
.label10:
    LDA.B #$00                                                 ;81D12D|A900    |      ;
    XBA                                                        ;81D12F|EB      |      ;
    LDA.W $096C                                                ;81D130|AD6C09  |00096C;
    CLC                                                        ;81D133|18      |      ;
    ADC.B #$4A                                                 ;81D134|694A    |      ;
    REP #$20                                                   ;81D136|C220    |      ;
    STA.W strcObjectData.spriteIdx                             ;81D138|8D0109  |000901;
    SEP #$20                                                   ;81D13B|E220    |      ;
    LDA.W $096C                                                ;81D13D|AD6C09  |00096C;
    INC A                                                      ;81D140|1A      |      ;
    STA.W $096C                                                ;81D141|8D6C09  |00096C;
    %SetPlayerAction(!PACTION_TIRED)
 
.return:
    REP #$30                                                   ;81D14B|C230    |      ;
    RTL                                                        ;81D14D|6B      |      ;
 
 
fStoreTileOnFrontOfPlayerAtDistance:
    REP #$30                                                   ;81D14E|C230    |      ; A: nArg1, X: nArg2, Y: nArg3
    ASL A                                                      ;81D150|0A      |      ;
    ASL A                                                      ;81D151|0A      |      ;
    ASL A                                                      ;81D152|0A      |      ;
    ASL A                                                      ;81D153|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81D154|857E    |00007E; A * 16
    STX.B strcVariables.n16Temp2                               ;81D156|8680    |000080; X
    STY.B strcVariables.n16Temp3                               ;81D158|8482    |000082; Y
    LDA.B strcPlayer.posX                                      ;81D15A|A5D6    |0000D6;
    STA.W nTileInFrontOfPlayerX                                ;81D15C|8D8509  |000985;
    LDA.B strcPlayer.posY                                      ;81D15F|A5D8    |0000D8;
    STA.W nTileInFrontOfPlayerY                                ;81D161|8D8709  |000987;
    LDA.B strcPlayer.direction                                 ;81D164|A5DA    |0000DA;
    CMP.W #!PDIR_DOWN                                               
    BNE +                                                      ;81D169|D00C    |81D177;
    LDA.B strcPlayer.posY                                      ;81D16B|A5D8    |0000D8;
    CLC                                                        ;81D16D|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81D16E|657E    |00007E;
    ADC.B strcVariables.n16Temp3                               ;81D170|6582    |000082;
    STA.W nTileInFrontOfPlayerY                                ;81D172|8D8709  |000987;
    BRA .justReturn                                            ;81D175|802C    |81D1A3;
 
 
  + CMP.W #!PDIR_UP                                               
    BNE +                                                      ;81D17A|D00C    |81D188;
    LDA.B strcPlayer.posY                                      ;81D17C|A5D8    |0000D8;
    SEC                                                        ;81D17E|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81D17F|E57E    |00007E;
    SBC.B strcVariables.n16Temp3                               ;81D181|E582    |000082;
    STA.W nTileInFrontOfPlayerY                                ;81D183|8D8709  |000987;
    BRA .justReturn                                            ;81D186|801B    |81D1A3;
 
 
  + CMP.W #!PDIR_LEFT                                               
    BNE +                                                      ;81D18B|D00C    |81D199;
    LDA.B strcPlayer.posX                                      ;81D18D|A5D6    |0000D6;
    CLC                                                        ;81D18F|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81D190|657E    |00007E;
    ADC.B strcVariables.n16Temp2                               ;81D192|6580    |000080;
    STA.W nTileInFrontOfPlayerX                                ;81D194|8D8509  |000985;
    BRA .justReturn                                            ;81D197|800A    |81D1A3;
 
 
  + LDA.B strcPlayer.posX                                      ;81D199|A5D6    |0000D6;
    SEC                                                        ;81D19B|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;81D19C|E57E    |00007E;
    SBC.B strcVariables.n16Temp2                               ;81D19E|E580    |000080;
    STA.W nTileInFrontOfPlayerX                                ;81D1A0|8D8509  |000985;
 
.justReturn:
    RTL                                                        ;81D1A3|6B      |      ;
 
 
fFindTileCoordsInFrontOfPLayer:
    REP #$30                                                   ;81D1A4|C230    |      ; X: nArg1, Y: nArg2
    TXA                                                        ;81D1A6|8A      |      ;
    ASL A                                                      ;81D1A7|0A      |      ;
    ASL A                                                      ;81D1A8|0A      |      ;
    ASL A                                                      ;81D1A9|0A      |      ;
    ASL A                                                      ;81D1AA|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81D1AB|857E    |00007E; X * 16 -> $7E
    TYA                                                        ;81D1AD|98      |      ;
    ASL A                                                      ;81D1AE|0A      |      ;
    ASL A                                                      ;81D1AF|0A      |      ;
    ASL A                                                      ;81D1B0|0A      |      ;
    ASL A                                                      ;81D1B1|0A      |      ; Y * 16 -> $80
    STA.B strcVariables.n16Temp2                               ;81D1B2|8580    |000080;
    LDA.B strcPlayer.posX                                      ;81D1B4|A5D6    |0000D6;
    CLC                                                        ;81D1B6|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81D1B7|657E    |00007E;
    STA.W nTileInFrontOfPlayerX                                ;81D1B9|8D8509  |000985;
    LDA.B strcPlayer.posY                                      ;81D1BC|A5D8    |0000D8;
    CLC                                                        ;81D1BE|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;81D1BF|6580    |000080;
    STA.W nTileInFrontOfPlayerY                                ;81D1C1|8D8709  |000987;
    RTL                                                        ;81D1C4|6B      |      ;
 
 
fLove_ScaleToHearts:
    REP #$30                                                   ;81D1C5|C230    |      ; A: nArg1
    STA.B strcVariables.n16Temp1                               ;81D1C7|857E    |00007E;
    LDY.W #$0000                                               ;81D1C9|A00000  |      ; i = 0
 
.loop:
    TYA                                                        ;81D1CC|98      |      ; A = i
    ASL A                                                      ;81D1CD|0A      |      ;
    ASL A                                                      ;81D1CE|0A      |      ;
    INC A                                                      ;81D1CF|1A      |      ;
    INC A                                                      ;81D1D0|1A      |      ;
    TAX                                                        ;81D1D1|AA      |      ; X = i * 4 + 2
    LDA.L .loveRange0,X                                        ;81D1D2|BFE8D181|81D1E8;
    CMP.B strcVariables.n16Temp1                               ;81D1D6|C57E    |00007E;
    BCC +                                                      ;81D1D8|9002    |81D1DC;
    BRA .return                                                ;81D1DA|8008    |81D1E4;
 
 
  + REP #$30                                                   ;81D1DC|C230    |      ;
    INY                                                        ;81D1DE|C8      |      ;
    CPY.W #$000A                                               ;81D1DF|C00A00  |      ;
    BNE .loop                                                  ;81D1E2|D0E8    |81D1CC;
 
.return:
    REP #$30                                                   ;81D1E4|C230    |      ;
    TYA                                                        ;81D1E6|98      |      ;
    RTS                                                        ;81D1E7|60      |      ;
 
 
.loveRange0:
    dw $0000,$0031                                             ;81D1E8|        |      ; 0x0A * [n16, n16]
 
.loveRange1:
    dw $0032,$0077                                             ;81D1EC|        |      ;
 
.loveRange2:
    dw $0078,$00C7                                             ;81D1F0|        |      ;
 
.loveRange3:
    dw $00C8,$00F9                                             ;81D1F4|        |      ;
 
.loveRange4:
    dw $00FA,$012B                                             ;81D1F8|        |      ;
 
.loveRange5:
    dw $012C,$018F                                             ;81D1FC|        |      ;
 
.loveRange6:
    dw $0190,$01F3                                             ;81D200|        |      ;
 
.loveRange7:
    dw $01F4,$0257                                             ;81D204|        |      ;
 
.loveRange8:
    dw $0258,$031F                                             ;81D208|        |      ;
 
.loveRange9:
    dw $0320,$03E7                                             ;81D20C|        |      ;
 
sSmallSpriteData:
    dw $0005                                                   ;81D210|        |      ; 0x0100 * [n16, n8]
    db $00                                                     ;81D212|        |      ;
    dw $0006                                                   ;81D213|        |      ;
    db $00                                                     ;81D215|        |      ;
    dw $0007                                                   ;81D216|        |      ;
    db $01                                                     ;81D218|        |      ;
    dw $0007                                                   ;81D219|        |      ;
    db $00                                                     ;81D21B|        |      ;
    dw $0000                                                   ;81D21C|        |      ;
    db $00                                                     ;81D21E|        |      ;
    dw $0001                                                   ;81D21F|        |      ;
    db $00                                                     ;81D221|        |      ;
    dw $0002                                                   ;81D222|        |      ;
    db $01                                                     ;81D224|        |      ;
    dw $0002                                                   ;81D225|        |      ;
    db $00                                                     ;81D227|        |      ;
    dw $0003                                                   ;81D228|        |      ;
    db $00                                                     ;81D22A|        |      ;
    dw $0004                                                   ;81D22B|        |      ;
    db $00                                                     ;81D22D|        |      ;
    dw $000E                                                   ;81D22E|        |      ;
    db $01                                                     ;81D230|        |      ;
    dw $000E                                                   ;81D231|        |      ;
    db $00                                                     ;81D233|        |      ;
    dw $0015                                                   ;81D234|        |      ;
    db $00                                                     ;81D236|        |      ;
    dw $001B                                                   ;81D237|        |      ;
    db $00                                                     ;81D239|        |      ;
    dw $0021                                                   ;81D23A|        |      ;
    db $01                                                     ;81D23C|        |      ;
    dw $0021                                                   ;81D23D|        |      ;
    db $00                                                     ;81D23F|        |      ;
    dw $0008                                                   ;81D240|        |      ;
    db $00                                                     ;81D242|        |      ;
    dw $000A                                                   ;81D243|        |      ;
    db $00                                                     ;81D245|        |      ;
    dw $000C                                                   ;81D246|        |      ;
    db $01                                                     ;81D248|        |      ;
    dw $000C                                                   ;81D249|        |      ;
    db $00                                                     ;81D24B|        |      ;
    dw $0012                                                   ;81D24C|        |      ;
    db $00                                                     ;81D24E|        |      ;
    dw $0013                                                   ;81D24F|        |      ;
    db $00                                                     ;81D251|        |      ;
    dw $0014                                                   ;81D252|        |      ;
    db $01                                                     ;81D254|        |      ;
    dw $0014                                                   ;81D255|        |      ;
    db $00                                                     ;81D257|        |      ;
    dw $0009                                                   ;81D258|        |      ;
    db $00                                                     ;81D25A|        |      ;
    dw $000B                                                   ;81D25B|        |      ;
    db $00                                                     ;81D25D|        |      ;
    dw $000D                                                   ;81D25E|        |      ;
    db $01                                                     ;81D260|        |      ;
    dw $000D                                                   ;81D261|        |      ;
    db $00                                                     ;81D263|        |      ;
    dw $000F                                                   ;81D264|        |      ;
    db $00                                                     ;81D266|        |      ;
    dw $0010                                                   ;81D267|        |      ;
    db $00                                                     ;81D269|        |      ;
    dw $0011                                                   ;81D26A|        |      ;
    db $01                                                     ;81D26C|        |      ;
    dw $0011                                                   ;81D26D|        |      ;
    db $00                                                     ;81D26F|        |      ;
    dw $0016                                                   ;81D270|        |      ;
    db $00                                                     ;81D272|        |      ;
    dw $001C                                                   ;81D273|        |      ;
    db $00                                                     ;81D275|        |      ;
    dw $0022                                                   ;81D276|        |      ;
    db $01                                                     ;81D278|        |      ;
    dw $0022                                                   ;81D279|        |      ;
    db $00                                                     ;81D27B|        |      ;
    dw $0017                                                   ;81D27C|        |      ;
    db $00                                                     ;81D27E|        |      ;
    dw $001D                                                   ;81D27F|        |      ;
    db $00                                                     ;81D281|        |      ;
    dw $0023                                                   ;81D282|        |      ;
    db $01                                                     ;81D284|        |      ;
    dw $0023                                                   ;81D285|        |      ;
    db $00                                                     ;81D287|        |      ;
    dw $0034                                                   ;81D288|        |      ;
    db $00                                                     ;81D28A|        |      ;
    dw $0035                                                   ;81D28B|        |      ;
    db $00                                                     ;81D28D|        |      ;
    dw $0036                                                   ;81D28E|        |      ;
    db $01                                                     ;81D290|        |      ;
    dw $0036                                                   ;81D291|        |      ;
    db $00                                                     ;81D293|        |      ;
    dw $0037                                                   ;81D294|        |      ;
    db $00                                                     ;81D296|        |      ;
    dw $003F                                                   ;81D297|        |      ;
    db $00                                                     ;81D299|        |      ;
    dw $0038                                                   ;81D29A|        |      ;
    db $01                                                     ;81D29C|        |      ;
    dw $0038                                                   ;81D29D|        |      ;
    db $00                                                     ;81D29F|        |      ;
    dw $0027                                                   ;81D2A0|        |      ;
    db $00                                                     ;81D2A2|        |      ;
    dw $0028                                                   ;81D2A3|        |      ;
    db $00                                                     ;81D2A5|        |      ;
    dw $0032                                                   ;81D2A6|        |      ;
    db $00                                                     ;81D2A8|        |      ;
    dw $0031                                                   ;81D2A9|        |      ;
    db $00                                                     ;81D2AB|        |      ;
    dw $002B                                                   ;81D2AC|        |      ;
    db $00                                                     ;81D2AE|        |      ;
    dw $002C                                                   ;81D2AF|        |      ;
    db $00                                                     ;81D2B1|        |      ;
    dw $0029                                                   ;81D2B2|        |      ;
    db $00                                                     ;81D2B4|        |      ;
    dw $002A                                                   ;81D2B5|        |      ;
    db $00                                                     ;81D2B7|        |      ;
    dw $002D                                                   ;81D2B8|        |      ;
    db $00                                                     ;81D2BA|        |      ;
    dw $002E                                                   ;81D2BB|        |      ;
    db $00                                                     ;81D2BD|        |      ;
    dw $002F                                                   ;81D2BE|        |      ;
    db $00                                                     ;81D2C0|        |      ;
    dw $0030                                                   ;81D2C1|        |      ;
    db $00                                                     ;81D2C3|        |      ;
    dw $0087                                                   ;81D2C4|        |      ;
    db $00                                                     ;81D2C6|        |      ;
    dw $0088                                                   ;81D2C7|        |      ;
    db $00                                                     ;81D2C9|        |      ;
    dw $0089                                                   ;81D2CA|        |      ;
    db $00                                                     ;81D2CC|        |      ;
    dw $008A                                                   ;81D2CD|        |      ;
    db $00                                                     ;81D2CF|        |      ;
    dw $008D                                                   ;81D2D0|        |      ;
    db $00                                                     ;81D2D2|        |      ;
    dw $008E                                                   ;81D2D3|        |      ;
    db $00                                                     ;81D2D5|        |      ;
    dw $008B                                                   ;81D2D6|        |      ;
    db $00                                                     ;81D2D8|        |      ;
    dw $008C                                                   ;81D2D9|        |      ;
    db $00                                                     ;81D2DB|        |      ;
    dw $0056                                                   ;81D2DC|        |      ;
    db $00                                                     ;81D2DE|        |      ;
    dw $0063                                                   ;81D2DF|        |      ;
    db $00                                                     ;81D2E1|        |      ;
    dw $0067                                                   ;81D2E2|        |      ;
    db $00                                                     ;81D2E4|        |      ;
    dw $00B6                                                   ;81D2E5|        |      ;
    db $00                                                     ;81D2E7|        |      ;
    dw $0071                                                   ;81D2E8|        |      ;
    db $00                                                     ;81D2EA|        |      ;
    dw $0000                                                   ;81D2EB|        |      ;
    db $00                                                     ;81D2ED|        |      ;
    dw $0079                                                   ;81D2EE|        |      ;
    db $00                                                     ;81D2F0|        |      ;
    dw $007A                                                   ;81D2F1|        |      ;
    db $00                                                     ;81D2F3|        |      ;
    dw $007B                                                   ;81D2F4|        |      ;
    db $00                                                     ;81D2F6|        |      ;
    dw $007C                                                   ;81D2F7|        |      ;
    db $00                                                     ;81D2F9|        |      ;
    dw $0040                                                   ;81D2FA|        |      ;
    db $00                                                     ;81D2FC|        |      ;
    dw $001A                                                   ;81D2FD|        |      ;
    db $00                                                     ;81D2FF|        |      ;
    dw $0044                                                   ;81D300|        |      ;
    db $00                                                     ;81D302|        |      ;
    dw $0045                                                   ;81D303|        |      ;
    db $00                                                     ;81D305|        |      ;
    dw $0046                                                   ;81D306|        |      ;
    db $01                                                     ;81D308|        |      ;
    dw $0046                                                   ;81D309|        |      ;
    db $00                                                     ;81D30B|        |      ;
    dw $0047                                                   ;81D30C|        |      ;
    db $00                                                     ;81D30E|        |      ;
    dw $0048                                                   ;81D30F|        |      ;
    db $00                                                     ;81D311|        |      ;
    dw $0049                                                   ;81D312|        |      ;
    db $01                                                     ;81D314|        |      ;
    dw $0049                                                   ;81D315|        |      ;
    db $00                                                     ;81D317|        |      ;
    dw $004A                                                   ;81D318|        |      ;
    db $00                                                     ;81D31A|        |      ;
    dw $004B                                                   ;81D31B|        |      ;
    db $00                                                     ;81D31D|        |      ;
    dw $004C                                                   ;81D31E|        |      ;
    db $01                                                     ;81D320|        |      ;
    dw $004C                                                   ;81D321|        |      ;
    db $00                                                     ;81D323|        |      ;
    dw $004D                                                   ;81D324|        |      ;
    db $00                                                     ;81D326|        |      ;
    dw $004E                                                   ;81D327|        |      ;
    db $00                                                     ;81D329|        |      ;
    dw $004F                                                   ;81D32A|        |      ;
    db $01                                                     ;81D32C|        |      ;
    dw $004F                                                   ;81D32D|        |      ;
    db $00                                                     ;81D32F|        |      ;
    dw $0050                                                   ;81D330|        |      ;
    db $00                                                     ;81D332|        |      ;
    dw $0051                                                   ;81D333|        |      ;
    db $00                                                     ;81D335|        |      ;
    dw $0052                                                   ;81D336|        |      ;
    db $01                                                     ;81D338|        |      ;
    dw $0052                                                   ;81D339|        |      ;
    db $00                                                     ;81D33B|        |      ;
    dw $0053                                                   ;81D33C|        |      ;
    db $00                                                     ;81D33E|        |      ;
    dw $0054                                                   ;81D33F|        |      ;
    db $00                                                     ;81D341|        |      ;
    dw $0055                                                   ;81D342|        |      ;
    db $01                                                     ;81D344|        |      ;
    dw $0055                                                   ;81D345|        |      ;
    db $00                                                     ;81D347|        |      ;
    dw $0057                                                   ;81D348|        |      ;
    db $00                                                     ;81D34A|        |      ;
    dw $005A                                                   ;81D34B|        |      ;
    db $00                                                     ;81D34D|        |      ;
    dw $005B                                                   ;81D34E|        |      ;
    db $01                                                     ;81D350|        |      ;
    dw $005B                                                   ;81D351|        |      ;
    db $00                                                     ;81D353|        |      ;
    dw $0058                                                   ;81D354|        |      ;
    db $00                                                     ;81D356|        |      ;
    dw $005C                                                   ;81D357|        |      ;
    db $00                                                     ;81D359|        |      ;
    dw $005D                                                   ;81D35A|        |      ;
    db $01                                                     ;81D35C|        |      ;
    dw $005D                                                   ;81D35D|        |      ;
    db $00                                                     ;81D35F|        |      ;
    dw $0059                                                   ;81D360|        |      ;
    db $00                                                     ;81D362|        |      ;
    dw $005E                                                   ;81D363|        |      ;
    db $00                                                     ;81D365|        |      ;
    dw $005F                                                   ;81D366|        |      ;
    db $01                                                     ;81D368|        |      ;
    dw $005F                                                   ;81D369|        |      ;
    db $00                                                     ;81D36B|        |      ;
    dw $0060                                                   ;81D36C|        |      ;
    db $00                                                     ;81D36E|        |      ;
    dw $0061                                                   ;81D36F|        |      ;
    db $00                                                     ;81D371|        |      ;
    dw $0062                                                   ;81D372|        |      ;
    db $01                                                     ;81D374|        |      ;
    dw $0062                                                   ;81D375|        |      ;
    db $00                                                     ;81D377|        |      ;
    dw $0064                                                   ;81D378|        |      ;
    db $00                                                     ;81D37A|        |      ;
    dw $0065                                                   ;81D37B|        |      ;
    db $00                                                     ;81D37D|        |      ;
    dw $0066                                                   ;81D37E|        |      ;
    db $01                                                     ;81D380|        |      ;
    dw $0066                                                   ;81D381|        |      ;
    db $00                                                     ;81D383|        |      ;
    dw $0068                                                   ;81D384|        |      ;
    db $00                                                     ;81D386|        |      ;
    dw $0069                                                   ;81D387|        |      ;
    db $00                                                     ;81D389|        |      ;
    dw $006A                                                   ;81D38A|        |      ;
    db $01                                                     ;81D38C|        |      ;
    dw $006A                                                   ;81D38D|        |      ;
    db $00                                                     ;81D38F|        |      ;
    dw $006B                                                   ;81D390|        |      ;
    db $00                                                     ;81D392|        |      ;
    dw $006C                                                   ;81D393|        |      ;
    db $00                                                     ;81D395|        |      ;
    dw $006D                                                   ;81D396|        |      ;
    db $01                                                     ;81D398|        |      ;
    dw $006D                                                   ;81D399|        |      ;
    db $00                                                     ;81D39B|        |      ;
    dw $006E                                                   ;81D39C|        |      ;
    db $00                                                     ;81D39E|        |      ;
    dw $006F                                                   ;81D39F|        |      ;
    db $00                                                     ;81D3A1|        |      ;
    dw $0070                                                   ;81D3A2|        |      ;
    db $01                                                     ;81D3A4|        |      ;
    dw $0070                                                   ;81D3A5|        |      ;
    db $00                                                     ;81D3A7|        |      ;
    dw $0072                                                   ;81D3A8|        |      ;
    db $00                                                     ;81D3AA|        |      ;
    dw $0073                                                   ;81D3AB|        |      ;
    db $00                                                     ;81D3AD|        |      ;
    dw $0074                                                   ;81D3AE|        |      ;
    db $00                                                     ;81D3B0|        |      ;
    dw $0075                                                   ;81D3B1|        |      ;
    db $00                                                     ;81D3B3|        |      ;
    dw $0076                                                   ;81D3B4|        |      ;
    db $00                                                     ;81D3B6|        |      ;
    dw $0077                                                   ;81D3B7|        |      ;
    db $00                                                     ;81D3B9|        |      ;
    dw $0078                                                   ;81D3BA|        |      ;
    db $00                                                     ;81D3BC|        |      ;
    dw $007E                                                   ;81D3BD|        |      ;
    db $00                                                     ;81D3BF|        |      ;
    dw $009A                                                   ;81D3C0|        |      ;
    db $00                                                     ;81D3C2|        |      ;
    dw $00A6                                                   ;81D3C3|        |      ;
    db $00                                                     ;81D3C5|        |      ;
    dw $00A5                                                   ;81D3C6|        |      ;
    db $00                                                     ;81D3C8|        |      ;
    dw $00A4                                                   ;81D3C9|        |      ;
    db $00                                                     ;81D3CB|        |      ;
    dw $00A3                                                   ;81D3CC|        |      ;
    db $00                                                     ;81D3CE|        |      ;
    dw $009F                                                   ;81D3CF|        |      ;
    db $00                                                     ;81D3D1|        |      ;
    dw $00A0                                                   ;81D3D2|        |      ;
    db $00                                                     ;81D3D4|        |      ;
    dw $00A1                                                   ;81D3D5|        |      ;
    db $00                                                     ;81D3D7|        |      ;
    dw $00A2                                                   ;81D3D8|        |      ;
    db $00                                                     ;81D3DA|        |      ;
    dw $009B                                                   ;81D3DB|        |      ;
    db $00                                                     ;81D3DD|        |      ;
    dw $009C                                                   ;81D3DE|        |      ;
    db $00                                                     ;81D3E0|        |      ;
    dw $009D                                                   ;81D3E1|        |      ;
    db $00                                                     ;81D3E3|        |      ;
    dw $009E                                                   ;81D3E4|        |      ;
    db $00                                                     ;81D3E6|        |      ;
    dw $00AA                                                   ;81D3E7|        |      ;
    db $00                                                     ;81D3E9|        |      ;
    dw $00A9                                                   ;81D3EA|        |      ;
    db $00                                                     ;81D3EC|        |      ;
    dw $00A8                                                   ;81D3ED|        |      ;
    db $00                                                     ;81D3EF|        |      ;
    dw $00A7                                                   ;81D3F0|        |      ;
    db $00                                                     ;81D3F2|        |      ;
    dw $00AF                                                   ;81D3F3|        |      ;
    db $00                                                     ;81D3F5|        |      ;
    dw $00B0                                                   ;81D3F6|        |      ;
    db $00                                                     ;81D3F8|        |      ;
    dw $00B2                                                   ;81D3F9|        |      ;
    db $00                                                     ;81D3FB|        |      ;
    dw $00B1                                                   ;81D3FC|        |      ;
    db $00                                                     ;81D3FE|        |      ;
    dw $00AE                                                   ;81D3FF|        |      ;
    db $00                                                     ;81D401|        |      ;
    dw $00B3                                                   ;81D402|        |      ;
    db $00                                                     ;81D404|        |      ;
    dw $00B4                                                   ;81D405|        |      ;
    db $00                                                     ;81D407|        |      ;
    dw $00AB                                                   ;81D408|        |      ;
    db $00                                                     ;81D40A|        |      ;
    dw $00AD                                                   ;81D40B|        |      ;
    db $00                                                     ;81D40D|        |      ;
    dw $00AC                                                   ;81D40E|        |      ;
    db $00                                                     ;81D410|        |      ;
    dw $0000                                                   ;81D411|        |      ;
    db $00                                                     ;81D413|        |      ;
    dw $00B5                                                   ;81D414|        |      ;
    db $00                                                     ;81D416|        |      ;
    dw $0020                                                   ;81D417|        |      ;
    db $00                                                     ;81D419|        |      ;
    dw $0026                                                   ;81D41A|        |      ;
    db $01                                                     ;81D41C|        |      ;
    dw $0026                                                   ;81D41D|        |      ;
    db $00                                                     ;81D41F|        |      ;
    dw $0093                                                   ;81D420|        |      ;
    db $00                                                     ;81D422|        |      ;
    dw $0094                                                   ;81D423|        |      ;
    db $00                                                     ;81D425|        |      ;
    dw $0097                                                   ;81D426|        |      ;
    db $01                                                     ;81D428|        |      ;
    dw $0097                                                   ;81D429|        |      ;
    db $00                                                     ;81D42B|        |      ;
    dw $008F                                                   ;81D42C|        |      ;
    db $00                                                     ;81D42E|        |      ;
    dw $0090                                                   ;81D42F|        |      ;
    db $00                                                     ;81D431|        |      ;
    dw $0095                                                   ;81D432|        |      ;
    db $01                                                     ;81D434|        |      ;
    dw $0095                                                   ;81D435|        |      ;
    db $00                                                     ;81D437|        |      ;
    dw $0091                                                   ;81D438|        |      ;
    db $00                                                     ;81D43A|        |      ;
    dw $0092                                                   ;81D43B|        |      ;
    db $00                                                     ;81D43D|        |      ;
    dw $0096                                                   ;81D43E|        |      ;
    db $01                                                     ;81D440|        |      ;
    dw $0096                                                   ;81D441|        |      ;
    db $00                                                     ;81D443|        |      ;
    dw $0099                                                   ;81D444|        |      ;
    db $00                                                     ;81D446|        |      ;
    dw $0099                                                   ;81D447|        |      ;
    db $00                                                     ;81D449|        |      ;
    dw $0098                                                   ;81D44A|        |      ;
    db $01                                                     ;81D44C|        |      ;
    dw $0098                                                   ;81D44D|        |      ;
    db $00                                                     ;81D44F|        |      ;
    dw $0082                                                   ;81D450|        |      ;
    db $00                                                     ;81D452|        |      ;
    dw $0083                                                   ;81D453|        |      ;
    db $00                                                     ;81D455|        |      ;
    dw $0085                                                   ;81D456|        |      ;
    db $01                                                     ;81D458|        |      ;
    dw $0085                                                   ;81D459|        |      ;
    db $00                                                     ;81D45B|        |      ;
    dw $007F                                                   ;81D45C|        |      ;
    db $00                                                     ;81D45E|        |      ;
    dw $0080                                                   ;81D45F|        |      ;
    db $00                                                     ;81D461|        |      ;
    dw $0081                                                   ;81D462|        |      ;
    db $01                                                     ;81D464|        |      ;
    dw $0081                                                   ;81D465|        |      ;
    db $00                                                     ;81D467|        |      ;
    dw $0000                                                   ;81D468|        |      ;
    db $00                                                     ;81D46A|        |      ;
    dw $0000                                                   ;81D46B|        |      ;
    db $00                                                     ;81D46D|        |      ;
    dw $0084                                                   ;81D46E|        |      ;
    db $00                                                     ;81D470|        |      ;
    dw $0086                                                   ;81D471|        |      ;
    db $00                                                     ;81D473|        |      ;
    dw $007D                                                   ;81D474|        |      ;
    db $00                                                     ;81D476|        |      ;
    dw $0000                                                   ;81D477|        |      ;
    db $00                                                     ;81D479|        |      ;
    dw $0000                                                   ;81D47A|        |      ;
    db $00                                                     ;81D47C|        |      ;
    dw $0000                                                   ;81D47D|        |      ;
    db $00                                                     ;81D47F|        |      ;
    dw $0041                                                   ;81D480|        |      ;
    db $00                                                     ;81D482|        |      ;
    dw $0042                                                   ;81D483|        |      ;
    db $00                                                     ;81D485|        |      ;
    dw $0043                                                   ;81D486|        |      ;
    db $01                                                     ;81D488|        |      ;
    dw $0043                                                   ;81D489|        |      ;
    db $00                                                     ;81D48B|        |      ;
    dw $0039                                                   ;81D48C|        |      ;
    db $00                                                     ;81D48E|        |      ;
    dw $003A                                                   ;81D48F|        |      ;
    db $00                                                     ;81D491|        |      ;
    dw $003B                                                   ;81D492|        |      ;
    db $01                                                     ;81D494|        |      ;
    dw $003B                                                   ;81D495|        |      ;
    db $00                                                     ;81D497|        |      ;
    dw $003C                                                   ;81D498|        |      ;
    db $00                                                     ;81D49A|        |      ;
    dw $003D                                                   ;81D49B|        |      ;
    db $00                                                     ;81D49D|        |      ;
    dw $003E                                                   ;81D49E|        |      ;
    db $01                                                     ;81D4A0|        |      ;
    dw $003E                                                   ;81D4A1|        |      ;
    db $00                                                     ;81D4A3|        |      ;
    dw $0018                                                   ;81D4A4|        |      ;
    db $00                                                     ;81D4A6|        |      ;
    dw $001E                                                   ;81D4A7|        |      ;
    db $00                                                     ;81D4A9|        |      ;
    dw $0024                                                   ;81D4AA|        |      ;
    db $01                                                     ;81D4AC|        |      ;
    dw $0024                                                   ;81D4AD|        |      ;
    db $00                                                     ;81D4AF|        |      ;
    dw $0019                                                   ;81D4B0|        |      ;
    db $00                                                     ;81D4B2|        |      ;
    dw $001F                                                   ;81D4B3|        |      ;
    db $00                                                     ;81D4B5|        |      ;
    dw $0025                                                   ;81D4B6|        |      ;
    db $01                                                     ;81D4B8|        |      ;
    dw $0025                                                   ;81D4B9|        |      ;
    db $00                                                     ;81D4BB|        |      ;
    dw $032C                                                   ;81D4BC|        |      ;
    db $00                                                     ;81D4BE|        |      ;
    dw $032D                                                   ;81D4BF|        |      ;
    db $00                                                     ;81D4C1|        |      ;
    dw $032E                                                   ;81D4C2|        |      ;
    db $00                                                     ;81D4C4|        |      ;
    dw $032F                                                   ;81D4C5|        |      ;
    db $00                                                     ;81D4C7|        |      ;
    dw $00BC                                                   ;81D4C8|        |      ;
    db $00                                                     ;81D4CA|        |      ;
    dw $0344                                                   ;81D4CB|        |      ;
    db $00                                                     ;81D4CD|        |      ;
    dw $0439                                                   ;81D4CE|        |      ;
    db $00                                                     ;81D4D0|        |      ;
    dw $043A                                                   ;81D4D1|        |      ;
    db $00                                                     ;81D4D3|        |      ;
    dw $043B                                                   ;81D4D4|        |      ;
    db $01                                                     ;81D4D6|        |      ;
    dw $043B                                                   ;81D4D7|        |      ;
    db $00                                                     ;81D4D9|        |      ;
    dw $0436                                                   ;81D4DA|        |      ;
    db $00                                                     ;81D4DC|        |      ;
    dw $0437                                                   ;81D4DD|        |      ;
    db $00                                                     ;81D4DF|        |      ;
    dw $0438                                                   ;81D4E0|        |      ;
    db $01                                                     ;81D4E2|        |      ;
    dw $0438                                                   ;81D4E3|        |      ;
    db $00                                                     ;81D4E5|        |      ;
    dw $043D                                                   ;81D4E6|        |      ;
    db $00                                                     ;81D4E8|        |      ;
    dw $043E                                                   ;81D4E9|        |      ;
    db $00                                                     ;81D4EB|        |      ;
    dw $043F                                                   ;81D4EC|        |      ;
    db $01                                                     ;81D4EE|        |      ;
    dw $043F                                                   ;81D4EF|        |      ;
    db $00                                                     ;81D4F1|        |      ;
    dw $0440                                                   ;81D4F2|        |      ;
    db $00                                                     ;81D4F4|        |      ;
    dw $0441                                                   ;81D4F5|        |      ;
    db $00                                                     ;81D4F7|        |      ;
    dw $0442                                                   ;81D4F8|        |      ;
    db $00                                                     ;81D4FA|        |      ;
    dw $0443                                                   ;81D4FB|        |      ;
    db $00                                                     ;81D4FD|        |      ;
    dw $0444                                                   ;81D4FE|        |      ;
    db $00                                                     ;81D500|        |      ;
    dw $0445                                                   ;81D501|        |      ;
    db $00                                                     ;81D503|        |      ;
    dw $0446                                                   ;81D504|        |      ;
    db $00                                                     ;81D506|        |      ;
    dw $0447                                                   ;81D507|        |      ;
    db $00                                                     ;81D509|        |      ;
    dw $0000                                                   ;81D50A|        |      ;
    db $00                                                     ;81D50C|        |      ;
    dw $0000                                                   ;81D50D|        |      ;
    db $00                                                     ;81D50F|        |      ;
 
aWeatherDialogId:
    dw $0000,$0001,$0002,$0003,$0004,$0005                     ;81D510|        |      ; 0x0C * [n16 nSpring, n16 nSummer, n16 nFall, n16 nWinter]
    dw $0006,$FFFF,$FFFF,$FFFF,$FFFF,$0007                     ;81D51C|        |      ;
    dw $FFFF,$0008,$FFFF,$FFFF,$FFFF,$FFFF                     ;81D528|        |      ;
    dw $FFFF,$0167,$0201,$FFFF,$FFFF,$FFFF                     ;81D534|        |      ;
    dw $FFFF,$FFFF,$0237,$FFFF,$FFFF,$FFFF                     ;81D540|        |      ;
    dw $FFFF,$028D,$FFFF,$FFFF,$FFFF,$02AC                     ;81D54C|        |      ;
    dw $FFFF,$FFFF,$FFFF,$00FF,$FFFF,$FFFF                     ;81D558|        |      ;
    dw $0273,$FFFF,$FFFF,$0049,$FFFF,$FFFF                     ;81D564|        |      ;
 
fPlayerInteraction_Handler:
    SEP #$20                                                   ;81D570|E220    |      ;
    REP #$10                                                   ;81D572|C210    |      ;
    LDA.B #$00                                                 ;81D574|A900    |      ;
    XBA                                                        ;81D576|EB      |      ;
    LDA.W nPlayerInteractionIndex                              ;81D577|AD6E09  |00096E;
    ASL A                                                      ;81D57A|0A      |      ;
    REP #$20                                                   ;81D57B|C220    |      ;
    TAX                                                        ;81D57D|AA      |      ;
    JSR.W (.aJumpTable,X)                                      ;81D57E|FC93D5  |81D593;
    SEP #$20                                                   ;81D581|E220    |      ;
    STZ.W strcPlayerData.lastExcercise                         ;81D583|9C2509  |000925;
    LDA.W nTimeState                                           ;81D586|AD7309  |000973;
    AND.B #$02                                                 ;81D589|2902    |      ;
    BEQ .skipToNextDay                                         ;81D58B|F003    |81D590;
    JMP.W fPlayerAction0x19                                    ;81D58D|4C0EC0  |81C00E;
 
 
.skipToNextDay:
    JMP.W fPlayerAction_Handler                                ;81D590|4CD3BF  |81BFD3;
 
.aJumpTable:
    dw fPlayerInteraction0x00                                  ;81D593|        |81D643; 0x58 * [ptr16]
    dw fPlayerInteraction0x01_WoodStorage                      ;81D595|        |81D644;
    dw fPlayerInteraction0x02                                  ;81D597|        |81D66F;
    dw fPlayerInteraction0x03                                  ;81D599|        |81D670;
    dw fPlayerInteraction0x04                                  ;81D59B|        |81D6E1;
    dw fPlayerInteraction0x05                                  ;81D59D|        |81D6E2;
    dw fPlayerInteraction0x06                                  ;81D59F|        |81D6F8;
    dw fPlayerInteraction0x07                                  ;81D5A1|        |81D70E;
    dw fPlayerInteraction0x08                                  ;81D5A3|        |81D70F;
    dw fPlayerInteraction0x09                                  ;81D5A5|        |81D710;
    dw fPlayerInteraction0x0A                                  ;81D5A7|        |81D711;
    dw fPlayerInteraction0x0B                                  ;81D5A9|        |81D712;
    dw fPlayerInteraction0x0C                                  ;81D5AB|        |81D713;
    dw fPlayerInteraction0x0D                                  ;81D5AD|        |81D714;
    dw fPlayerInteraction0x0E                                  ;81D5AF|        |81D715;
    dw fPlayerInteraction0x0F                                  ;81D5B1|        |81D716;
    dw fPlayerInteraction0x10_PlayerDiary                      ;81D5B3|        |81D7C5;
    dw fPlayerInteraction0x11                                  ;81D5B5|        |81D979;
    dw fPlayerInteraction0x12                                  ;81D5B7|        |81D9CC;
    dw fPlayerInteraction0x13                                  ;81D5B9|        |81DA82;
    dw fPlayerInteraction0x14                                  ;81D5BB|        |81DB38;
    dw fPlayerInteraction0x15_FeedStorage                      ;81D5BD|        |81DBA1;
    dw fPlayerInteraction0x16                                  ;81D5BF|        |81DBCC;
    dw fPlayerInteraction0x17                                  ;81D5C1|        |81DBCD;
    dw fPlayerInteraction0x18                                  ;81D5C3|        |81DBCE;
    dw fPlayerInteraction0x19                                  ;81D5C5|        |81DBCF;
    dw fPlayerInteraction0x1A                                  ;81D5C7|        |81DBD0;
    dw fPlayerInteraction0x1B                                  ;81D5C9|        |81DBD1;
    dw fPlayerInteraction0x1C                                  ;81D5CB|        |81DBD2;
    dw fPlayerInteraction0x1D                                  ;81D5CD|        |81DBD3;
    dw fPlayerInteraction0x1E                                  ;81D5CF|        |81DBF0;
    dw fPlayerInteraction0x1F                                  ;81D5D1|        |81DC57;
    dw fPlayerInteraction0x20                                  ;81D5D3|        |81DC58;
    dw fPlayerInteraction0x21                                  ;81D5D5|        |81DC59;
    dw fPlayerInteraction0x22                                  ;81D5D7|        |81DC5A;
    dw fPlayerInteraction0x23                                  ;81D5D9|        |81DC5B;
    dw fPlayerInteraction0x24                                  ;81D5DB|        |81DC5C;
    dw fPlayerInteraction0x25                                  ;81D5DD|        |81DC5D;
    dw fPlayerInteraction0x26_MariaDiary                       ;81D5DF|        |81DC5E;
    dw fPlayerInteraction0x27                                  ;81D5E1|        |81DCCE;
    dw fPlayerInteraction0x28                                  ;81D5E3|        |81DCF3;
    dw fPlayerInteraction0x29                                  ;81D5E5|        |81DD18;
    dw fPlayerInteraction0x2A                                  ;81D5E7|        |81DD3D;
    dw fPlayerInteraction0x2B                                  ;81D5E9|        |81DD62;
    dw fPlayerInteraction0x2C                                  ;81D5EB|        |81DD87;
    dw fPlayerInteraction0x2D_NinaDiary                        ;81D5ED|        |81DDAC;
    dw fPlayerInteraction0x2E_AnimalNPC                        ;81D5EF|        |81DE1C;
    dw fPlayerInteraction0x2F                                  ;81D5F1|        |81E245;
    dw fPlayerInteraction0x30                                  ;81D5F3|        |81E26A;
    dw fPlayerInteraction0x31                                  ;81D5F5|        |81E28F;
    dw fPlayerInteraction0x32                                  ;81D5F7|        |81E2B4;
    dw fPlayerInteraction0x33_EllenDiary                       ;81D5F9|        |81E2D9;
    dw fPlayerInteraction0x34                                  ;81D5FB|        |81E349;
    dw fPlayerInteraction0x35                                  ;81D5FD|        |81E36E;
    dw fPlayerInteraction0x36_AnnDiary                         ;81D5FF|        |81E394;
    dw fPlayerInteraction0x37                                  ;81D601|        |81E404;
    dw fPlayerInteraction0x38                                  ;81D603|        |81E429;
    dw fPlayerInteraction0x39                                  ;81D605|        |81E44E;
    dw fPlayerInteraction0x3A                                  ;81D607|        |81E473;
    dw fPlayerInteraction0x3B                                  ;81D609|        |81E498;
    dw fPlayerInteraction0x3C                                  ;81D60B|        |81E4BD;
    dw fPlayerInteraction0x3D                                  ;81D60D|        |81E4E2;
    dw fPlayerInteraction0x3E                                  ;81D60F|        |81E507;
    dw fPlayerInteraction0x3F_EveDiary                         ;81D611|        |81E52C;
    dw fPlayerInteraction0x40_LessonsOfLove                    ;81D613|        |81E59C;
    dw fPlayerInteraction0x41_HotSprings                       ;81D615|        |81E6C3;
    dw fPlayerInteraction0x42                                  ;81D617|        |81E6EA;
    dw fPlayerInteraction0x43                                  ;81D619|        |81E79E;
    dw fPlayerInteraction0x44                                  ;81D61B|        |81EBD5;
    dw fPlayerInteraction0x45                                  ;81D61D|        |81EFAD;
    dw fPlayerInteraction0x46                                  ;81D61F|        |81F061;
    dw fPlayerInteraction0x47                                  ;81D621|        |81F121;
    dw fPlayerInteraction0x48                                  ;81D623|        |81F2DA;
    dw fPlayerInteraction0x49                                  ;81D625|        |81F40E;
    dw fPlayerInteraction0x4A                                  ;81D627|        |81F490;
    dw fPlayerInteraction0x4B                                  ;81D629|        |81F4AD;
    dw fPlayerInteraction0x4C                                  ;81D62B|        |81F4CA;
    dw fPlayerInteraction0x4D                                  ;81D62D|        |81F4E6;
    dw fPlayerInteraction0x4E                                  ;81D62F|        |81F502;
    dw fPlayerInteraction0x4F                                  ;81D631|        |81F51E;
    dw fPlayerInteraction0x50                                  ;81D633|        |81F53A;
    dw fPlayerInteraction0x51                                  ;81D635|        |81F5B0;
    dw fPlayerInteraction0x52                                  ;81D637|        |81F6D7;
    dw fPlayerInteraction0x53                                  ;81D639|        |81F7FF;
    dw fPlayerInteraction0x54_FloristNotebook                  ;81D63B|        |81F86A;
    dw fPlayerInteraction0x55_AnimalNotebook                   ;81D63D|        |81F942;
    dw fPlayerInteraction0x56                                  ;81D63F|        |81FA69;
    dw fPlayerInteraction0x57                                  ;81D641|        |81FA84;
 
fPlayerInteraction0x00:
    RTS                                                        ;81D643|60      |      ;
 
 
fPlayerInteraction0x01_WoodStorage:
    REP #$20                                                   ;81D644|C220    |      ;
    LDA.W #$FFFE                                               ;81D646|A9FEFF  |      ;
    JSL.L fGameEngine_AddWood                                  ;81D649|2224B283|83B224;
    REP #$20                                                   ;81D64D|C220    |      ;
    CMP.W #$0001                                               ;81D64F|C90100  |      ;
    BEQ +                                                      ;81D652|F00E    |81D662;
    %SetCurrentCarriedItemDirect(!EITEM_WOODFENCE)
    %SetPlayerAction(!PACTION_ITEMONHAND)
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81D66E|60      |      ;
 
 
fPlayerInteraction0x02:
    RTS                                                        ;81D66F|60      |      ;
 
 
fPlayerInteraction0x03:
    SEP #$20                                                   ;81D670|E220    |      ;
    REP #$10                                                   ;81D672|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81D674|AD6F09  |00096F;
    CMP.B #$01                                                 ;81D677|C901    |      ;
    BEQ +                                                      ;81D679|F044    |81D6BF;
    SEP #$20                                                   ;81D67B|E220    |      ;
    LDA.B #$19                                                 ;81D67D|A919    |      ;
    STA.W strcAudio.reg114                                     ;81D67F|8D1401  |000114;
    LDA.B #$06                                                 ;81D682|A906    |      ;
    STA.W strcAudio.reg115                                     ;81D684|8D1501  |000115;
    LDA.B #$00                                                 ;81D687|A900    |      ;
    XBA                                                        ;81D689|EB      |      ;
    LDA.W strcAudio.unk118                                     ;81D68A|AD1801  |000118;
    REP #$20                                                   ;81D68D|C220    |      ;
    TAX                                                        ;81D68F|AA      |      ;
    SEP #$20                                                   ;81D690|E220    |      ;
    LDA.L nToolSoundData_80B8CD,X                              ;81D692|BFCDB880|80B8CD;
    INC A                                                      ;81D696|1A      |      ;
    STA.W strcAudio.index                                      ;81D697|8D0301  |000103;
    JSL.L fAudioUnknown_83833E                                 ;81D69A|223E8383|83833E;
    JSL.L fAudioSetRegister2to0A                               ;81D69E|22328383|838332;
    REP #$20                                                   ;81D6A2|C220    |      ;
    %SetFlag(daily1, $0010)
    REP #$20                                                   ;81D6AF|C220    |      ;
    LDA.W #$0044                                               ;81D6B1|A94400  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81D6B4|22E1A581|81A5E1;
    SEP #$20                                                   ;81D6B8|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D6BA|EE6F09  |00096F;
    BRA .return                                                ;81D6BD|8021    |81D6E0;
 
 
  + SEP #$20                                                   ;81D6BF|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81D6C1|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81D6C4|AD7009  |000970;
    CMP.B #$20                                                 ;81D6C7|C920    |      ;
    BNE .return                                                ;81D6C9|D015    |81D6E0;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    SEP #$20                                                   ;81D6D7|E220    |      ;
    STZ.W strcAudio.toolId                                     ;81D6D9|9C1901  |000119;
    JSL.L fToolUsedSound_Unknown828FF3                         ;81D6DC|22F38F82|828FF3;
 
.return:
    RTS                                                        ;81D6E0|60      |      ;
 
 
fPlayerInteraction0x04:
    RTS                                                        ;81D6E1|60      |      ;
 
 
fPlayerInteraction0x05:
    REP #$20                                                   ;81D6E2|C220    |      ;
    LDA.W #$0011                                               ;81D6E4|A91100  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81D6E7|22E1A581|81A5E1;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81D6F7|60      |      ;
 
 
fPlayerInteraction0x06:
    REP #$20                                                   ;81D6F8|C220    |      ;
    LDA.W #$0012                                               ;81D6FA|A91200  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81D6FD|22E1A581|81A5E1;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81D70D|60      |      ;
 
 
fPlayerInteraction0x07:
    RTS                                                        ;81D70E|60      |      ;
 
 
fPlayerInteraction0x08:
    RTS                                                        ;81D70F|60      |      ;
 
 
fPlayerInteraction0x09:
    RTS                                                        ;81D710|60      |      ;
 
 
fPlayerInteraction0x0A:
    RTS                                                        ;81D711|60      |      ;
 
 
fPlayerInteraction0x0B:
    RTS                                                        ;81D712|60      |      ;
 
 
fPlayerInteraction0x0C:
    RTS                                                        ;81D713|60      |      ;
 
 
fPlayerInteraction0x0D:
    RTS                                                        ;81D714|60      |      ;
 
 
fPlayerInteraction0x0E:
    RTS                                                        ;81D715|60      |      ;
 
 
fPlayerInteraction0x0F:
    SEP #$20                                                   ;81D716|E220    |      ;
    REP #$10                                                   ;81D718|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81D71A|AD6F09  |00096F;
    CMP.B #$01                                                 ;81D71D|C901    |      ;
    BEQ .case1                                                 ;81D71F|F026    |81D747;
    CMP.B #$02                                                 ;81D721|C902    |      ;
    BEQ .case2                                                 ;81D723|F075    |81D79A;
    %SetPlayerFlag(!PFLAGS_SITTING)
    REP #$20                                                   ;81D72E|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81D730|AD9601  |000196;
    AND.W #$0010                                               ;81D733|291000  |      ;
    BNE +                                                      ;81D736|D007    |81D73F;
    LDA.W #$0000                                               ;81D738|A90000  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81D73B|22E1A581|81A5E1;
 
  + SEP #$20                                                   ;81D73F|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D741|EE6F09  |00096F;
    JMP.W .return                                              ;81D744|4CC4D7  |81D7C4;
 
 
.case1:
    REP #$20                                                   ;81D747|C220    |      ;
    LDA.W ptrUnknown0xCF                                       ;81D749|ADCF00  |0000CF;
    BNE .return                                                ;81D74C|D076    |81D7C4;
    JSL.L fWeatherUnknown_8281C0                               ;81D74E|22C08182|8281C0;
    SEP #$20                                                   ;81D752|E220    |      ;
    LDA.B #$00                                                 ;81D754|A900    |      ;
    XBA                                                        ;81D756|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81D757|AD9009  |000990;
    ASL A                                                      ;81D75A|0A      |      ;
    ASL A                                                      ;81D75B|0A      |      ;
    ASL A                                                      ;81D75C|0A      |      ;
    STA.B strcVariables.n8Temp1                                ;81D75D|8592    |000092;
    LDA.L nCurrentSeasonID                                     ;81D75F|AF191F7F|7F1F19;
    ASL A                                                      ;81D763|0A      |      ;
    CLC                                                        ;81D764|18      |      ;
    ADC.B strcVariables.n8Temp1                                ;81D765|6592    |000092;
    REP #$20                                                   ;81D767|C220    |      ;
    TAX                                                        ;81D769|AA      |      ;
    LDA.L aWeatherDialogId,X                                   ;81D76A|BF10D581|81D510;
    CMP.W #$FFFF                                               ;81D76E|C9FFFF  |      ;
    BEQ +                                                      ;81D771|F011    |81D784;
    TAX                                                        ;81D773|AA      |      ;
    SEP #$20                                                   ;81D774|E220    |      ;
    LDA.B #$02                                                 ;81D776|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81D778|8D9A01  |00019A;
    LDA.B #$00                                                 ;81D77B|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81D77D|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81D780|225F9383|83935F;
 
  + SEP #$20                                                   ;81D784|E220    |      ;
    LDA.B #$00                                                 ;81D786|A900    |      ;
    XBA                                                        ;81D788|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81D789|AD9009  |000990;
    INC A                                                      ;81D78C|1A      |      ;
    REP #$20                                                   ;81D78D|C220    |      ;
    JSL.L fUnknownCF_SetPointer                                ;81D78F|22E1A581|81A5E1;
    SEP #$20                                                   ;81D793|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D795|EE6F09  |00096F;
    BRA .return                                                ;81D798|802A    |81D7C4;
 
 
.case2:
    SEP #$20                                                   ;81D79A|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81D79C|AD9A01  |00019A;
    CMP.B #$02                                                 ;81D79F|C902    |      ;
    BEQ .return                                                ;81D7A1|F021    |81D7C4;
    REP #$20                                                   ;81D7A3|C220    |      ;
    LDA.W #$0046                                               ;81D7A5|A94600  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81D7A8|22E1A581|81A5E1;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %UnsetPlayerFlag(!PFLAGS_SITTING)
 
.return:
    RTS                                                        ;81D7C4|60      |      ;
 
 
fPlayerInteraction0x10_PlayerDiary:
    REP #$30                                                   ;81D7C5|C230    |      ;
    %CheckFlag(event6, $0010)
    BEQ +                                                      ;81D7CE|F003    |81D7D3;
    JMP.W .return                                              ;81D7D0|4C6CD9  |81D96C;
 
 
  + SEP #$20                                                   ;81D7D3|E220    |      ;
    REP #$10                                                   ;81D7D5|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81D7D7|AD6F09  |00096F;
    CMP.B #$01                                                 ;81D7DA|C901    |      ;
    BEQ .case1                                                 ;81D7DC|F03C    |81D81A;
    CMP.B #$02                                                 ;81D7DE|C902    |      ;
    BEQ .case2                                                 ;81D7E0|F077    |81D859;
    CMP.B #$03                                                 ;81D7E2|C903    |      ;
    BNE .caseCheck                                             ;81D7E4|D003    |81D7E9;
    JMP.W .case3                                               ;81D7E6|4C7FD8  |81D87F;
 
 
.caseCheck:
    CMP.B #$04                                                 ;81D7E9|C904    |      ;
    BNE .case0                                                 ;81D7EB|D003    |81D7F0;
    JMP.W .case4                                               ;81D7ED|4C54D9  |81D954;
 
 
.case0:
    REP #$20                                                   ;81D7F0|C220    |      ;
    LDA.W $0878                                                ;81D7F2|AD7808  |000878;
    CMP.W $087A                                                ;81D7F5|CD7A08  |00087A;
    BEQ +                                                      ;81D7F8|F003    |81D7FD;
    JMP.W .return                                              ;81D7FA|4C6CD9  |81D96C;
 
 
  + SEP #$20                                                   ;81D7FD|E220    |      ;
    LDA.B #$02                                                 ;81D7FF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81D801|8D9A01  |00019A;
    LDX.W #$000A                                               ;81D804|A20A00  |      ;
    SEP #$20                                                   ;81D807|E220    |      ;
    LDA.B #$00                                                 ;81D809|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81D80B|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81D80E|225F9383|83935F;
    SEP #$20                                                   ;81D812|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D814|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81D817|4C6BD9  |81D96B;
 
 
.case1:
    LDA.W strcDialogDisplay.mapUnk19A                          ;81D81A|AD9A01  |00019A;
    CMP.B #$02                                                 ;81D81D|C902    |      ;
    BNE +                                                      ;81D81F|D003    |81D824;
    JMP.W .justReturn                                          ;81D821|4C6BD9  |81D96B;
 
 
  + SEP #$20                                                   ;81D824|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81D826|AD8F01  |00018F;
    BNE .no                                                    ;81D829|D013    |81D83E;
    INC.W nPlayerInteractionArg1                               ;81D82B|EE6F09  |00096F;
    INC.W nPlayerInteractionArg1                               ;81D82E|EE6F09  |00096F;
    SEP #$20                                                   ;81D831|E220    |      ;
    LDA.W nTimeState                                           ;81D833|AD7309  |000973;
    ORA.B #$04                                                 ;81D836|0904    |      ;
    STA.W nTimeState                                           ;81D838|8D7309  |000973;
    JMP.W .justReturn                                          ;81D83B|4C6BD9  |81D96B;
 
 
.no:
    LDA.B #$02                                                 ;81D83E|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81D840|8D9A01  |00019A;
    LDX.W #$000C                                               ;81D843|A20C00  |      ;
    SEP #$20                                                   ;81D846|E220    |      ;
    LDA.B #$00                                                 ;81D848|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81D84A|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81D84D|225F9383|83935F;
    SEP #$20                                                   ;81D851|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D853|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81D856|4C6BD9  |81D96B;
 
 
.case2:
    LDA.W strcDialogDisplay.mapUnk19A                          ;81D859|AD9A01  |00019A;
    CMP.B #$02                                                 ;81D85C|C902    |      ;
    BNE +                                                      ;81D85E|D003    |81D863;
    JMP.W .justReturn                                          ;81D860|4C6BD9  |81D96B;
 
 
  + SEP #$20                                                   ;81D863|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81D865|AD8F01  |00018F;
    BNE .stillSomethingToDo                                    ;81D868|D006    |81D870;
    INC.W nPlayerInteractionArg1                               ;81D86A|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81D86D|4C6BD9  |81D96B;
 
 
.stillSomethingToDo:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81D87C|4C6BD9  |81D96B;
 
 
.case3:
    REP #$30                                                   ;81D87F|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .marriedCheck                                          ;81D888|D073    |81D8FD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .marriedCheck                                          ;81D891|D06A    |81D8FD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .marriedCheck                                          ;81D89A|D061    |81D8FD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .marriedCheck                                          ;81D8A3|D058    |81D8FD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .marriedCheck                                          ;81D8AC|D04F    |81D8FD;
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_RIGHT)
    %SetObjectDirection(!PDIR_RIGHT)
    SEP #$20                                                   ;81D8CD|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81D8CF|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81D8D2|AD7009  |000970;
    CMP.B #$16                                                 ;81D8D5|C916    |      ;
    BEQ +                                                      ;81D8D7|F003    |81D8DC;
    JMP.W .justReturn                                          ;81D8D9|4C6BD9  |81D96B;
 
 
  + REP #$20                                                   ;81D8DC|C220    |      ;
    %SetPlayerAction(!PACTION_AUTOPILOT)
    REP #$30                                                   ;81D8E5|C230    |      ;
    LDA.W #$004E                                               ;81D8E7|A94E00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81D8EA|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81D8ED|20E6CF  |81CFE6;
    SEP #$20                                                   ;81D8F0|E220    |      ;
    LDA.W nTimeState                                           ;81D8F2|AD7309  |000973;
    ORA.B #$02                                                 ;81D8F5|0902    |      ;
    STA.W nTimeState                                           ;81D8F7|8D7309  |000973;
    JMP.W .justReturn                                          ;81D8FA|4C6BD9  |81D96B;
 
 
.marriedCheck:
    REP #$30                                                   ;81D8FD|C230    |      ;
    %SetFlag(daily3, $0800)
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_RIGHT)
    %SetObjectDirection(!PDIR_RIGHT)
    SEP #$20                                                   ;81D929|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81D92B|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81D92E|AD7009  |000970;
    CMP.B #$1E                                                 ;81D931|C91E    |      ;
    BEQ +                                                      ;81D933|F003    |81D938;
    JMP.W .justReturn                                          ;81D935|4C6BD9  |81D96B;
 
 
  + SEP #$20                                                   ;81D938|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D93A|EE6F09  |00096F;
    REP #$20                                                   ;81D93D|C220    |      ;
    %SetPlayerAction(!PACTION_AUTOPILOT)
    REP #$30                                                   ;81D946|C230    |      ;
    LDA.W #$004E                                               ;81D948|A94E00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81D94B|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81D94E|20E6CF  |81CFE6;
    JMP.W .justReturn                                          ;81D951|4C6BD9  |81D96B;
 
 
.case4:
    REP #$30                                                   ;81D954|C230    |      ;
    %CheckFlag(daily3, $1000)
    BEQ .justReturn                                            ;81D95D|F00C    |81D96B;
    SEP #$20                                                   ;81D95F|E220    |      ;
    LDA.W nTimeState                                           ;81D961|AD7309  |000973;
    ORA.B #$02                                                 ;81D964|0902    |      ;
    STA.W nTimeState                                           ;81D966|8D7309  |000973;
    BRA .justReturn                                            ;81D969|8000    |81D96B;
 
 
.justReturn:
    RTS                                                        ;81D96B|60      |      ;
 
 
.return:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81D978|60      |      ;
 
 
fPlayerInteraction0x11:
    SEP #$20                                                   ;81D979|E220    |      ;
    REP #$10                                                   ;81D97B|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81D97D|AD6F09  |00096F;
    CMP.B #$01                                                 ;81D980|C901    |      ;
    BEQ +                                                      ;81D982|F030    |81D9B4;
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    %SetPlayerAction(!PACTION_0E)
    %SetPlayerDirection(!PDIR_UP)
    %SetObjectDirection(!PDIR_UP)
    SEP #$20                                                   ;81D9A3|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81D9A5|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81D9A8|AD7009  |000970;
    CMP.B #$20                                                 ;81D9AB|C920    |      ;
    BNE .return                                                ;81D9AD|D01C    |81D9CB;
    INC.W nPlayerInteractionArg1                               ;81D9AF|EE6F09  |00096F;
    BRA .return                                                ;81D9B2|8017    |81D9CB;
 
 
  + REP #$20                                                   ;81D9B4|C220    |      ;
    LDA.W #$00C2                                               ;81D9B6|A9C200  |      ;
    STA.W $0878                                                ;81D9B9|8D7808  |000878;
    STA.W $087A                                                ;81D9BC|8D7A08  |00087A;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81D9CB|60      |      ;
 
 
fPlayerInteraction0x12:
    SEP #$20                                                   ;81D9CC|E220    |      ;
    REP #$10                                                   ;81D9CE|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81D9D0|AD6F09  |00096F;
    CMP.B #$01                                                 ;81D9D3|C901    |      ;
    BEQ .case1                                                 ;81D9D5|F026    |81D9FD;
    CMP.B #$02                                                 ;81D9D7|C902    |      ;
    BEQ .case2                                                 ;81D9D9|F07C    |81DA57;
    %SetPlayerFlag(!PFLAGS_SITTING)
    REP #$20                                                   ;81D9E4|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81D9E6|AD9601  |000196;
    AND.W #$0010                                               ;81D9E9|291000  |      ;
    BNE +                                                      ;81D9EC|D007    |81D9F5;
    LDA.W #$0027                                               ;81D9EE|A92700  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81D9F1|22E1A581|81A5E1;
 
  + SEP #$20                                                   ;81D9F5|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81D9F7|EE6F09  |00096F;
    JMP.W .return                                              ;81D9FA|4C81DA  |81DA81;
 
 
.case1:
    REP #$20                                                   ;81D9FD|C220    |      ;
    LDA.W ptrUnknown0xCF                                       ;81D9FF|ADCF00  |0000CF;
    BEQ +                                                      ;81DA02|F003    |81DA07;
    JMP.W .return                                              ;81DA04|4C81DA  |81DA81;
 
 
  + JSL.L fWeatherUnknown_8281C0                               ;81DA07|22C08182|8281C0;
    SEP #$20                                                   ;81DA0B|E220    |      ;
    LDA.B #$00                                                 ;81DA0D|A900    |      ;
    XBA                                                        ;81DA0F|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81DA10|AD9009  |000990;
    ASL A                                                      ;81DA13|0A      |      ;
    ASL A                                                      ;81DA14|0A      |      ;
    ASL A                                                      ;81DA15|0A      |      ;
    STA.B strcVariables.n8Temp1                                ;81DA16|8592    |000092;
    LDA.L nCurrentSeasonID                                     ;81DA18|AF191F7F|7F1F19;
    ASL A                                                      ;81DA1C|0A      |      ;
    CLC                                                        ;81DA1D|18      |      ;
    ADC.B strcVariables.n8Temp1                                ;81DA1E|6592    |000092;
    REP #$20                                                   ;81DA20|C220    |      ;
    TAX                                                        ;81DA22|AA      |      ;
    LDA.L aWeatherDialogId,X                                   ;81DA23|BF10D581|81D510;
    CMP.W #$FFFF                                               ;81DA27|C9FFFF  |      ;
    BEQ +                                                      ;81DA2A|F011    |81DA3D;
    TAX                                                        ;81DA2C|AA      |      ;
    SEP #$20                                                   ;81DA2D|E220    |      ;
    LDA.B #$02                                                 ;81DA2F|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DA31|8D9A01  |00019A;
    LDA.B #$00                                                 ;81DA34|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DA36|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DA39|225F9383|83935F;
 
  + SEP #$20                                                   ;81DA3D|E220    |      ;
    LDA.B #$00                                                 ;81DA3F|A900    |      ;
    XBA                                                        ;81DA41|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81DA42|AD9009  |000990;
    INC A                                                      ;81DA45|1A      |      ;
    REP #$20                                                   ;81DA46|C220    |      ;
    CLC                                                        ;81DA48|18      |      ;
    ADC.W #$0027                                               ;81DA49|692700  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81DA4C|22E1A581|81A5E1;
    SEP #$20                                                   ;81DA50|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DA52|EE6F09  |00096F;
    BRA .return                                                ;81DA55|802A    |81DA81;
 
 
.case2:
    SEP #$20                                                   ;81DA57|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DA59|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DA5C|C902    |      ;
    BEQ .return                                                ;81DA5E|F021    |81DA81;
    REP #$20                                                   ;81DA60|C220    |      ;
    LDA.W #$0047                                               ;81DA62|A94700  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81DA65|22E1A581|81A5E1;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %UnsetPlayerFlag(!PFLAGS_SITTING)
 
.return:
    RTS                                                        ;81DA81|60      |      ;
 
 
fPlayerInteraction0x13:
    SEP #$20                                                   ;81DA82|E220    |      ;
    REP #$10                                                   ;81DA84|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DA86|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DA89|C901    |      ;
    BEQ .case1                                                 ;81DA8B|F026    |81DAB3;
    CMP.B #$02                                                 ;81DA8D|C902    |      ;
    BEQ .case2                                                 ;81DA8F|F07C    |81DB0D;
    %SetPlayerFlag(!PFLAGS_SITTING)
    REP #$20                                                   ;81DA9A|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81DA9C|AD9601  |000196;
    AND.W #$0010                                               ;81DA9F|291000  |      ;
    BNE +                                                      ;81DAA2|D007    |81DAAB;
    LDA.W #$0034                                               ;81DAA4|A93400  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81DAA7|22E1A581|81A5E1;
 
  + SEP #$20                                                   ;81DAAB|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DAAD|EE6F09  |00096F;
    JMP.W .return                                              ;81DAB0|4C37DB  |81DB37;
 
 
.case1:
    REP #$20                                                   ;81DAB3|C220    |      ;
    LDA.W ptrUnknown0xCF                                       ;81DAB5|ADCF00  |0000CF;
    BEQ +                                                      ;81DAB8|F003    |81DABD;
    JMP.W .return                                              ;81DABA|4C37DB  |81DB37;
 
 
  + JSL.L fWeatherUnknown_8281C0                               ;81DABD|22C08182|8281C0;
    SEP #$20                                                   ;81DAC1|E220    |      ;
    LDA.B #$00                                                 ;81DAC3|A900    |      ;
    XBA                                                        ;81DAC5|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81DAC6|AD9009  |000990;
    ASL A                                                      ;81DAC9|0A      |      ;
    ASL A                                                      ;81DACA|0A      |      ;
    ASL A                                                      ;81DACB|0A      |      ;
    STA.B strcVariables.n8Temp1                                ;81DACC|8592    |000092;
    LDA.L nCurrentSeasonID                                     ;81DACE|AF191F7F|7F1F19;
    ASL A                                                      ;81DAD2|0A      |      ;
    CLC                                                        ;81DAD3|18      |      ;
    ADC.B strcVariables.n8Temp1                                ;81DAD4|6592    |000092;
    REP #$20                                                   ;81DAD6|C220    |      ;
    TAX                                                        ;81DAD8|AA      |      ;
    LDA.L aWeatherDialogId,X                                   ;81DAD9|BF10D581|81D510;
    CMP.W #$FFFF                                               ;81DADD|C9FFFF  |      ;
    BEQ +                                                      ;81DAE0|F011    |81DAF3;
    TAX                                                        ;81DAE2|AA      |      ;
    SEP #$20                                                   ;81DAE3|E220    |      ;
    LDA.B #$02                                                 ;81DAE5|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DAE7|8D9A01  |00019A;
    LDA.B #$00                                                 ;81DAEA|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DAEC|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DAEF|225F9383|83935F;
 
  + SEP #$20                                                   ;81DAF3|E220    |      ;
    LDA.B #$00                                                 ;81DAF5|A900    |      ;
    XBA                                                        ;81DAF7|EB      |      ;
    LDA.W nWeatherDialogIdIndex                                ;81DAF8|AD9009  |000990;
    INC A                                                      ;81DAFB|1A      |      ;
    REP #$20                                                   ;81DAFC|C220    |      ;
    CLC                                                        ;81DAFE|18      |      ;
    ADC.W #$0034                                               ;81DAFF|693400  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81DB02|22E1A581|81A5E1;
    SEP #$20                                                   ;81DB06|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DB08|EE6F09  |00096F;
    BRA .return                                                ;81DB0B|802A    |81DB37;
 
 
.case2:
    SEP #$20                                                   ;81DB0D|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DB0F|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DB12|C902    |      ;
    BEQ .return                                                ;81DB14|F021    |81DB37;
    REP #$20                                                   ;81DB16|C220    |      ;
    LDA.W #$0048                                               ;81DB18|A94800  |      ;
    JSL.L fUnknownCF_SetPointer                                ;81DB1B|22E1A581|81A5E1;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %UnsetPlayerFlag(!PFLAGS_SITTING)
 
.return:
    RTS                                                        ;81DB37|60      |      ;
 
 
fPlayerInteraction0x14:
    SEP #$20                                                   ;81DB38|E220    |      ;
    REP #$10                                                   ;81DB3A|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DB3C|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DB3F|C901    |      ;
    BEQ .case1                                                 ;81DB41|F010    |81DB53;
    CMP.B #$02                                                 ;81DB43|C902    |      ;
    BEQ .case2                                                 ;81DB45|F028    |81DB6F;
    CMP.B #$03                                                 ;81DB47|C903    |      ;
    BEQ .case3                                                 ;81DB49|F047    |81DB92;
    SEP #$20                                                   ;81DB4B|E220    |      ;
    STZ.W strcDialogDisplay.dialoUnk18A                        ;81DB4D|9C8A01  |00018A;
    INC.W nPlayerInteractionArg1                               ;81DB50|EE6F09  |00096F;
 
.case1:
    REP #$20                                                   ;81DB53|C220    |      ;
    STZ.W strcBGScrool.BG2VerOffs                              ;81DB55|9C4201  |000142;
    SEP #$20                                                   ;81DB58|E220    |      ;
    LDA.B #$03                                                 ;81DB5A|A903    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DB5C|8D9A01  |00019A;
    LDA.W strcDialogDisplay.dialogFlags                        ;81DB5F|AD9B01  |00019B;
    ORA.B #!DFLAGS_UNK20                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;81DB64|8D9B01  |00019B;
    INC.W nPlayerInteractionArg1                               ;81DB67|EE6F09  |00096F;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;81DB6A|9C8B01  |00018B;
    BRA .return                                                ;81DB6D|8031    |81DBA0;
 
 
.case2:
    SEP #$20                                                   ;81DB6F|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DB71|AD9A01  |00019A;
    CMP.B #$03                                                 ;81DB74|C903    |      ;
    BEQ .return                                                ;81DB76|F028    |81DBA0;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DB78|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DB7B|C902    |      ;
    BNE +                                                      ;81DB7D|D005    |81DB84;
    INC.W nPlayerInteractionArg1                               ;81DB7F|EE6F09  |00096F;
    BRA .return                                                ;81DB82|801C    |81DBA0;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA .return                                                ;81DB90|800E    |81DBA0;
 
 
.case3:
    SEP #$20                                                   ;81DB92|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DB94|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DB97|C902    |      ;
    BEQ .return                                                ;81DB99|F005    |81DBA0;
    LDA.B #$01                                                 ;81DB9B|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81DB9D|8D6F09  |00096F;
 
.return:
    RTS                                                        ;81DBA0|60      |      ;
 
 
fPlayerInteraction0x15_FeedStorage:
    REP #$20                                                   ;81DBA1|C220    |      ;
    LDA.W #$FFFF                                               ;81DBA3|A9FFFF  |      ;
    JSL.L fGameEngine_AddFeed                                  ;81DBA6|2253B283|83B253;
    REP #$20                                                   ;81DBAA|C220    |      ;
    CMP.W #$0001                                               ;81DBAC|C90100  |      ;
    BEQ +                                                      ;81DBAF|F00E    |81DBBF;
    %SetCurrentCarriedItemDirect(!EITEM_COWFEED)
    %SetPlayerAction(!PACTION_ITEMONHAND)
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DBCB|60      |      ;
 
 
fPlayerInteraction0x16:
    RTS                                                        ;81DBCC|60      |      ;
 
 
fPlayerInteraction0x17:
    RTS                                                        ;81DBCD|60      |      ;
 
 
fPlayerInteraction0x18:
    RTS                                                        ;81DBCE|60      |      ;
 
 
fPlayerInteraction0x19:
    RTS                                                        ;81DBCF|60      |      ;
 
 
fPlayerInteraction0x1A:
    RTS                                                        ;81DBD0|60      |      ;
 
 
fPlayerInteraction0x1B:
    RTS                                                        ;81DBD1|60      |      ;
 
 
fPlayerInteraction0x1C:
    RTS                                                        ;81DBD2|60      |      ;
 
 
fPlayerInteraction0x1D:
    REP #$30                                                   ;81DBD3|C230    |      ;
    LDA.W #$00FB                                               ;81DBD5|A9FB00  |      ;
    LDX.W #$02E0                                               ;81DBD8|A2E002  |      ;
    STX.W $09AD                                                ;81DBDB|8EAD09  |0009AD;
    LDY.W #$01A0                                               ;81DBDE|A0A001  |      ;
    STY.W $09AF                                                ;81DBE1|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81DBE4|2288A681|81A688;
    REP #$30                                                   ;81DBE8|C230    |      ;
    LDA.W #$0000                                               ;81DBEA|A90000  |      ;
    JMP.W fPlayerInteraction_Return                            ;81DBED|4C56F5  |81F556;
 
 
fPlayerInteraction0x1E:
    SEP #$20                                                   ;81DBF0|E220    |      ;
    REP #$10                                                   ;81DBF2|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DBF4|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DBF7|C901    |      ;
    BEQ .case1                                                 ;81DBF9|F01B    |81DC16;
    SEP #$20                                                   ;81DBFB|E220    |      ;
    LDA.B #$02                                                 ;81DBFD|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DBFF|8D9A01  |00019A;
    LDX.W #$0371                                               ;81DC02|A27103  |      ;
    LDA.B #$00                                                 ;81DC05|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DC07|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DC0A|225F9383|83935F;
    SEP #$20                                                   ;81DC0E|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DC10|EE6F09  |00096F;
    JMP.W .return                                              ;81DC13|4C56DC  |81DC56;
 
 
.case1:
    SEP #$20                                                   ;81DC16|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DC18|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DC1B|C902    |      ;
    BNE +                                                      ;81DC1D|D003    |81DC22;
    JMP.W .return                                              ;81DC1F|4C56DC  |81DC56;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81DC22|AD8F01  |00018F;
    BEQ +                                                      ;81DC25|F003    |81DC2A;
    JMP.W .exit                                                ;81DC27|4C4ADC  |81DC4A;
 
 
  + SEP #$20                                                   ;81DC2A|E220    |      ;
    LDA.B #$00                                                 ;81DC2C|A900    |      ;
    XBA                                                        ;81DC2E|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;81DC2F|AF191F7F|7F1F19;
    REP #$20                                                   ;81DC33|C220    |      ;
    CLC                                                        ;81DC35|18      |      ;
    ADC.W #$0372                                               ;81DC36|697203  |      ;
    TAX                                                        ;81DC39|AA      |      ;
    SEP #$20                                                   ;81DC3A|E220    |      ;
    LDA.B #$02                                                 ;81DC3C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DC3E|8D9A01  |00019A;
    LDA.B #$00                                                 ;81DC41|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DC43|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DC46|225F9383|83935F;
 
.exit:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81DC56|60      |      ;
 
 
fPlayerInteraction0x1F:
    RTS                                                        ;81DC57|60      |      ;
 
 
fPlayerInteraction0x20:
    RTS                                                        ;81DC58|60      |      ;
 
 
fPlayerInteraction0x21:
    RTS                                                        ;81DC59|60      |      ;
 
 
fPlayerInteraction0x22:
    RTS                                                        ;81DC5A|60      |      ;
 
 
fPlayerInteraction0x23:
    RTS                                                        ;81DC5B|60      |      ;
 
 
fPlayerInteraction0x24:
    RTS                                                        ;81DC5C|60      |      ;
 
 
fPlayerInteraction0x25:
    RTS                                                        ;81DC5D|60      |      ;
 
 
fPlayerInteraction0x26_MariaDiary:
    SEP #$20                                                   ;81DC5E|E220    |      ;
    REP #$10                                                   ;81DC60|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DC62|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DC65|C901    |      ;
    BEQ .case1                                                 ;81DC67|F01B    |81DC84;
    SEP #$20                                                   ;81DC69|E220    |      ;
    LDA.B #$02                                                 ;81DC6B|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DC6D|8D9A01  |00019A;
    LDX.W #$0023                                               ;81DC70|A22300  |      ;
    LDA.B #$00                                                 ;81DC73|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DC75|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DC78|225F9383|83935F;
    SEP #$20                                                   ;81DC7C|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DC7E|EE6F09  |00096F;
    JMP.W .return                                              ;81DC81|4CCDDC  |81DCCD;
 
 
.case1:
    SEP #$20                                                   ;81DC84|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DC86|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DC89|C902    |      ;
    BNE +                                                      ;81DC8B|D003    |81DC90;
    JMP.W .return                                              ;81DC8D|4CCDDC  |81DCCD;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81DC90|AD8F01  |00018F;
    BEQ +                                                      ;81DC93|F003    |81DC98;
    JMP.W .exit                                                ;81DC95|4CC1DC  |81DCC1;
 
 
  + REP #$20                                                   ;81DC98|C220    |      ;
    LDA.L nLove_Maria                                          ;81DC9A|AF1F1F7F|7F1F1F;
    JSR.W fLove_ScaleToHearts                                  ;81DC9E|20C5D1  |81D1C5;
    REP #$30                                                   ;81DCA1|C230    |      ;
    CLC                                                        ;81DCA3|18      |      ;
    ADC.W #$03A6                                               ;81DCA4|69A603  |      ; 0x03A6 + nLoveScale = nDiaryLoveDialog
    TAX                                                        ;81DCA7|AA      |      ;
    SEP #$20                                                   ;81DCA8|E220    |      ;
    LDA.B #$02                                                 ;81DCAA|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DCAC|8D9A01  |00019A;
    LDA.B #$00                                                 ;81DCAF|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DCB1|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DCB4|225F9383|83935F;
    REP #$20                                                   ;81DCB8|C220    |      ;
    LDA.W #$FFFF                                               ;81DCBA|A9FFFF  |      ; -1
    JSL.L fGameEngine_AddHappiness                             ;81DCBD|2282B283|83B282; Reading girls diary decrease happiness
 
.exit:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81DCCD|60      |      ;
 
 
fPlayerInteraction0x27:
    %SetCurrentCarriedItemIndex($0070)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DCF2|60      |      ;
 
 
fPlayerInteraction0x28:
    %SetCurrentCarriedItemIndex($0071)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DD17|60      |      ;
 
 
fPlayerInteraction0x29:
    %SetCurrentCarriedItemIndex($0072)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DD3C|60      |      ;
 
 
fPlayerInteraction0x2A:
    %SetCurrentCarriedItemIndex($0073)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DD61|60      |      ;
 
 
fPlayerInteraction0x2B:
    %SetCurrentCarriedItemIndex($0074)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DD86|60      |      ;
 
 
fPlayerInteraction0x2C:
    %SetCurrentCarriedItemIndex($0075)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81DDAB|60      |      ;
 
 
fPlayerInteraction0x2D_NinaDiary:
    SEP #$20                                                   ;81DDAC|E220    |      ;
    REP #$10                                                   ;81DDAE|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DDB0|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DDB3|C901    |      ;
    BEQ .case1                                                 ;81DDB5|F01B    |81DDD2;
    SEP #$20                                                   ;81DDB7|E220    |      ;
    LDA.B #$02                                                 ;81DDB9|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DDBB|8D9A01  |00019A;
    LDX.W #$0023                                               ;81DDBE|A22300  |      ;
    LDA.B #$00                                                 ;81DDC1|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DDC3|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DDC6|225F9383|83935F;
    SEP #$20                                                   ;81DDCA|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DDCC|EE6F09  |00096F;
    JMP.W .return                                              ;81DDCF|4C1BDE  |81DE1B;
 
 
.case1:
    SEP #$20                                                   ;81DDD2|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DDD4|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DDD7|C902    |      ;
    BNE +                                                      ;81DDD9|D003    |81DDDE;
    JMP.W .return                                              ;81DDDB|4C1BDE  |81DE1B;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81DDDE|AD8F01  |00018F;
    BEQ +                                                      ;81DDE1|F003    |81DDE6;
    JMP.W .exit                                                ;81DDE3|4C0FDE  |81DE0F;
 
 
  + REP #$20                                                   ;81DDE6|C220    |      ;
    LDA.L nLove_Nina                                           ;81DDE8|AF231F7F|7F1F23;
    JSR.W fLove_ScaleToHearts                                  ;81DDEC|20C5D1  |81D1C5;
    REP #$30                                                   ;81DDEF|C230    |      ;
    CLC                                                        ;81DDF1|18      |      ;
    ADC.W #$03A6                                               ;81DDF2|69A603  |      ;
    TAX                                                        ;81DDF5|AA      |      ;
    SEP #$20                                                   ;81DDF6|E220    |      ;
    LDA.B #$02                                                 ;81DDF8|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DDFA|8D9A01  |00019A;
    LDA.B #$00                                                 ;81DDFD|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DDFF|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DE02|225F9383|83935F;
    REP #$20                                                   ;81DE06|C220    |      ;
    LDA.W #$FFFF                                               ;81DE08|A9FFFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81DE0B|2282B283|83B282;
 
.exit:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81DE1B|60      |      ;
 
 
fPlayerInteraction0x2E_AnimalNPC:
    SEP #$20                                                   ;81DE1C|E220    |      ;
    REP #$10                                                   ;81DE1E|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81DE20|AD6F09  |00096F;
    CMP.B #$01                                                 ;81DE23|C901    |      ;
    BEQ .case1                                                 ;81DE25|F063    |81DE8A;
    CMP.B #$02                                                 ;81DE27|C902    |      ;
    BNE .checks                                                ;81DE29|D003    |81DE2E;
    JMP.W .case2                                               ;81DE2B|4CC8DF  |81DFC8;
 
 
.checks:
    CMP.B #$03                                                 ;81DE2E|C903    |      ;
    BNE +                                                      ;81DE30|D003    |81DE35;
    JMP.W .case3                                               ;81DE32|4CEFE0  |81E0EF;
 
 
  + REP #$30                                                   ;81DE35|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;81DE3E|D003    |81DE43;
    JMP.W .break                                               ;81DE40|4C13E2  |81E213;
 
 
  + REP #$20                                                   ;81DE43|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81DE45|AD9601  |000196;
    AND.W #$000A                                               ;81DE48|290A00  |      ;
    BNE .cantSellAnimal                                        ;81DE4B|D01B    |81DE68;
    SEP #$20                                                   ;81DE4D|E220    |      ;
    LDA.B #$02                                                 ;81DE4F|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DE51|8D9A01  |00019A;
    LDX.W #$0305                                               ;81DE54|A20503  |      ;
    LDA.B #$00                                                 ;81DE57|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DE59|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DE5C|225F9383|83935F;
    SEP #$20                                                   ;81DE60|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81DE62|EE6F09  |00096F;
    JMP.W .return                                              ;81DE65|4C21E2  |81E221;
 
 
.cantSellAnimal:
    SEP #$20                                                   ;81DE68|E220    |      ;
    LDA.B #$02                                                 ;81DE6A|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DE6C|8D9A01  |00019A;
    LDX.W #$03D0                                               ;81DE6F|A2D003  |      ;
    LDA.B #$00                                                 ;81DE72|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DE74|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DE77|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81DE87|4C21E2  |81E221;
 
 
.case1:
    REP #$30                                                   ;81DE8A|C230    |      ;
    LDA.W strcJoypad1.current                                  ;81DE8C|AD2401  |000124;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;81DE92|F003    |81DE97;
    JMP.W .return2                                             ;81DE94|4C22E2  |81E222;
 
 
  + SEP #$20                                                   ;81DE97|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DE99|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DE9C|C902    |      ;
    BNE +                                                      ;81DE9E|D003    |81DEA3;
    JMP.W .return                                              ;81DEA0|4C21E2  |81E221;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81DEA3|AD8F01  |00018F;
    CMP.B #$00                                                 ;81DEA6|C900    |      ;
    BEQ .cowCheck                                              ;81DEA8|F012    |81DEBC;
    CMP.B #$01                                                 ;81DEAA|C901    |      ;
    BEQ .chickenCheck                                          ;81DEAC|F065    |81DF13;
    CMP.B #$02                                                 ;81DEAE|C902    |      ;
    BNE +                                                      ;81DEB0|D003    |81DEB5;
    JMP.W .label02                                             ;81DEB2|4C6ADF  |81DF6A;
 
 
  + CMP.B #$03                                                 ;81DEB5|C903    |      ;
    BNE .cowCheck                                              ;81DEB7|D003    |81DEBC;
    JMP.W .label04                                             ;81DEB9|4C99DF  |81DF99;
 
 
.cowCheck:
    REP #$20                                                   ;81DEBC|C220    |      ;
    %CheckFlag(daily1, $0020)
    BNE ++                                                     ;81DEC5|D02A    |81DEF1;
    SEP #$20                                                   ;81DEC7|E220    |      ;
    LDA.L nOwnedCows                                           ;81DEC9|AF0A1F7F|7F1F0A;
    CMP.B #$0C                                                 ;81DECD|C90C    |      ;
    BNE .askBuyCow                                             ;81DECF|D003    |81DED4;
    JMP.W .haveMaxCows                                         ;81DED1|4C2EE0  |81E02E;
 
 
.askBuyCow:
    SEP #$20                                                   ;81DED4|E220    |      ;
    LDA.B #$02                                                 ;81DED6|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DED8|8D9A01  |00019A;
    LDX.W #$0307                                               ;81DEDB|A20703  |      ;
    LDA.B #$00                                                 ;81DEDE|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DEE0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DEE3|225F9383|83935F;
    SEP #$20                                                   ;81DEE7|E220    |      ;
    LDA.B #$02                                                 ;81DEE9|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81DEEB|8D6F09  |00096F;
    JMP.W .return                                              ;81DEEE|4C21E2  |81E221;
 
 
 ++ SEP #$20                                                   ;81DEF1|E220    |      ;
    LDA.B #$02                                                 ;81DEF3|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DEF5|8D9A01  |00019A;
    LDX.W #$03B6                                               ;81DEF8|A2B603  |      ;
    LDA.B #$00                                                 ;81DEFB|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DEFD|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DF00|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81DF10|4C21E2  |81E221;
 
 
.chickenCheck:
    REP #$20                                                   ;81DF13|C220    |      ;
    %CheckFlag(daily1, $0020)
    BNE ++                                                     ;81DF1C|D02A    |81DF48;
    SEP #$20                                                   ;81DF1E|E220    |      ;
    LDA.L nOwnedChickens                                       ;81DF20|AF0B1F7F|7F1F0B;
    CMP.B #$0C                                                 ;81DF24|C90C    |      ;
    BNE +                                                      ;81DF26|D003    |81DF2B;
    JMP.W .haveMaxChickens                                     ;81DF28|4C5AE1  |81E15A;
 
 
  + SEP #$20                                                   ;81DF2B|E220    |      ;
    LDA.B #$02                                                 ;81DF2D|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DF2F|8D9A01  |00019A;
    LDX.W #$030A                                               ;81DF32|A20A03  |      ;
    LDA.B #$00                                                 ;81DF35|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DF37|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DF3A|225F9383|83935F;
    SEP #$20                                                   ;81DF3E|E220    |      ;
    LDA.B #$03                                                 ;81DF40|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81DF42|8D6F09  |00096F;
    JMP.W .return                                              ;81DF45|4C21E2  |81E221;
 
 
 ++ SEP #$20                                                   ;81DF48|E220    |      ;
    LDA.B #$02                                                 ;81DF4A|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DF4C|8D9A01  |00019A;
    LDX.W #$03B6                                               ;81DF4F|A2B603  |      ;
    LDA.B #$00                                                 ;81DF52|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DF54|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DF57|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81DF67|4C21E2  |81E221;
 
 
.label02:
    SEP #$20                                                   ;81DF6A|E220    |      ;
    LDA.B #$02                                                 ;81DF6C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DF6E|8D9A01  |00019A;
    LDX.W #$030B                                               ;81DF71|A20B03  |      ;
    LDA.B #$00                                                 ;81DF74|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DF76|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DF79|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81DF89|C220    |      ;
    %SetFlag(daily1, $0008)
    JMP.W .return                                              ;81DF96|4C21E2  |81E221;
 
 
.label04:
    SEP #$20                                                   ;81DF99|E220    |      ;
    LDA.B #$02                                                 ;81DF9B|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81DF9D|8D9A01  |00019A;
    LDX.W #$030B                                               ;81DFA0|A20B03  |      ;
    LDA.B #$00                                                 ;81DFA3|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81DFA5|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81DFA8|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81DFB8|C220    |      ;
    %SetFlag(daily1, $0004)
    JMP.W .return                                              ;81DFC5|4C21E2  |81E221;
 
 
.case2:
    SEP #$20                                                   ;81DFC8|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81DFCA|AD9A01  |00019A;
    CMP.B #$02                                                 ;81DFCD|C902    |      ;
    BNE +                                                      ;81DFCF|D003    |81DFD4;
    JMP.W .return                                              ;81DFD1|4C21E2  |81E221;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81DFD4|AD8F01  |00018F;
    BEQ +                                                      ;81DFD7|F003    |81DFDC;
    JMP.W .label23                                             ;81DFD9|4CCDE0  |81E0CD;
 
 
  + SEP #$20                                                   ;81DFDC|E220    |      ;
    LDA.B #$00                                                 ;81DFDE|A900    |      ;
    XBA                                                        ;81DFE0|EB      |      ;
    LDA.L nOwnedChickens                                       ;81DFE1|AF0B1F7F|7F1F0B;
    REP #$20                                                   ;81DFE5|C220    |      ;
    ASL A                                                      ;81DFE7|0A      |      ;
    ASL A                                                      ;81DFE8|0A      |      ;
    ASL A                                                      ;81DFE9|0A      |      ;
    ASL A                                                      ;81DFEA|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81DFEB|857E    |00007E;
    SEP #$20                                                   ;81DFED|E220    |      ;
    LDA.B #$00                                                 ;81DFEF|A900    |      ;
    XBA                                                        ;81DFF1|EB      |      ;
    LDA.L nOwnedCows                                           ;81DFF2|AF0A1F7F|7F1F0A;
    REP #$20                                                   ;81DFF6|C220    |      ;
    INC A                                                      ;81DFF8|1A      |      ;
    ASL A                                                      ;81DFF9|0A      |      ;
    ASL A                                                      ;81DFFA|0A      |      ;
    ASL A                                                      ;81DFFB|0A      |      ;
    ASL A                                                      ;81DFFC|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81DFFD|8580    |000080;
    CLC                                                        ;81DFFF|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81E000|657E    |00007E;
    STA.B strcVariables.n16Temp1                               ;81E002|857E    |00007E;
    LDA.L nPlantedGrassCount                                   ;81E004|AF291F7F|7F1F29;
    CMP.B strcVariables.n16Temp1                               ;81E008|C57E    |00007E; Checks do we have enough grass to purchase animal
    BCS .label21                                               ;81E00A|B044    |81E050;
    SEP #$20                                                   ;81E00C|E220    |      ;
    LDA.B #$02                                                 ;81E00E|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E010|8D9A01  |00019A;
    LDX.W #$0306                                               ;81E013|A20603  |      ;
    LDA.B #$00                                                 ;81E016|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E018|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E01B|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E02B|4C21E2  |81E221;
 
 
.haveMaxCows:
    SEP #$20                                                   ;81E02E|E220    |      ;
    LDA.B #$02                                                 ;81E030|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E032|8D9A01  |00019A;
    LDX.W #$03B7                                               ;81E035|A2B703  |      ;
    LDA.B #$00                                                 ;81E038|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E03A|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E03D|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E04D|4C21E2  |81E221;
 
 
.label21:
    REP #$20                                                   ;81E050|C220    |      ;
    LDA.W #$FE0C                                               ;81E052|A90CFE  |      ;
    STA.B ptrTemp0x72                                          ;81E055|8572    |000072;
    SEP #$20                                                   ;81E057|E220    |      ;
    LDA.B #$FF                                                 ;81E059|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81E05B|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81E05D|22C9B183|83B1C9;
    REP #$20                                                   ;81E061|C220    |      ;
    CMP.W #$0000                                               ;81E063|C90000  |      ;
    BEQ +                                                      ;81E066|F022    |81E08A;
    SEP #$20                                                   ;81E068|E220    |      ;
    LDA.B #$02                                                 ;81E06A|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E06C|8D9A01  |00019A;
    LDX.W #$0304                                               ;81E06F|A20403  |      ;
    LDA.B #$00                                                 ;81E072|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E074|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E077|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E087|4C21E2  |81E221;
 
 
  + SEP #$20                                                   ;81E08A|E220    |      ;
    LDA.B #$02                                                 ;81E08C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E08E|8D9A01  |00019A;
    LDX.W #$0308                                               ;81E091|A20803  |      ;
    LDA.B #$00                                                 ;81E094|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E096|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E099|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81E0A9|C220    |      ;
    %SetFlag(daily1, $0022)
    SEP #$20                                                   ;81E0B6|E220    |      ;
    LDA.L nOwnedCows                                           ;81E0B8|AF0A1F7F|7F1F0A;
    INC A                                                      ;81E0BC|1A      |      ;
    STA.L nOwnedCows                                           ;81E0BD|8F0A1F7F|7F1F0A;
    REP #$20                                                   ;81E0C1|C220    |      ;
    LDA.W #$0014                                               ;81E0C3|A91400  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E0C6|2282B283|83B282;
    JMP.W .return                                              ;81E0CA|4C21E2  |81E221;
 
 
.label23:
    SEP #$20                                                   ;81E0CD|E220    |      ;
    LDA.B #$02                                                 ;81E0CF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E0D1|8D9A01  |00019A;
    LDX.W #$0303                                               ;81E0D4|A20303  |      ;
    LDA.B #$00                                                 ;81E0D7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E0D9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E0DC|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E0EC|4C21E2  |81E221;
 
 
.case3:
    SEP #$20                                                   ;81E0EF|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E0F1|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E0F4|C902    |      ;
    BNE +                                                      ;81E0F6|D003    |81E0FB;
    JMP.W .return                                              ;81E0F8|4C21E2  |81E221;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E0FB|AD8F01  |00018F;
    BEQ +                                                      ;81E0FE|F003    |81E103;
    JMP.W .label31                                             ;81E100|4C00E2  |81E200;
 
 
  + SEP #$20                                                   ;81E103|E220    |      ;
    LDA.B #$00                                                 ;81E105|A900    |      ;
    XBA                                                        ;81E107|EB      |      ;
    LDA.L nOwnedChickens                                       ;81E108|AF0B1F7F|7F1F0B;
    REP #$20                                                   ;81E10C|C220    |      ;
    INC A                                                      ;81E10E|1A      |      ;
    ASL A                                                      ;81E10F|0A      |      ;
    ASL A                                                      ;81E110|0A      |      ;
    ASL A                                                      ;81E111|0A      |      ;
    ASL A                                                      ;81E112|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81E113|857E    |00007E;
    SEP #$20                                                   ;81E115|E220    |      ;
    LDA.B #$00                                                 ;81E117|A900    |      ;
    XBA                                                        ;81E119|EB      |      ;
    LDA.L nOwnedCows                                           ;81E11A|AF0A1F7F|7F1F0A;
    REP #$20                                                   ;81E11E|C220    |      ;
    ASL A                                                      ;81E120|0A      |      ;
    ASL A                                                      ;81E121|0A      |      ;
    ASL A                                                      ;81E122|0A      |      ;
    ASL A                                                      ;81E123|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;81E124|8580    |000080;
    CLC                                                        ;81E126|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;81E127|657E    |00007E;
    STA.B strcVariables.n16Temp1                               ;81E129|857E    |00007E;
    LDA.L nPlantedGrassCount                                   ;81E12B|AF291F7F|7F1F29;
    CMP.B strcVariables.n16Temp1                               ;81E12F|C57E    |00007E;
    BCC +                                                      ;81E131|9003    |81E136;
    JMP.W .label29                                             ;81E133|4C7CE1  |81E17C;
 
 
  + SEP #$20                                                   ;81E136|E220    |      ;
    LDA.B #$02                                                 ;81E138|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E13A|8D9A01  |00019A;
    LDX.W #$0306                                               ;81E13D|A20603  |      ;
    LDA.B #$00                                                 ;81E140|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E142|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E145|225F9383|83935F;
    REP #$20                                                   ;81E149|C220    |      ;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E157|4C21E2  |81E221;
 
 
.haveMaxChickens:
    SEP #$20                                                   ;81E15A|E220    |      ;
    LDA.B #$02                                                 ;81E15C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E15E|8D9A01  |00019A;
    LDX.W #$03B7                                               ;81E161|A2B703  |      ;
    LDA.B #$00                                                 ;81E164|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E166|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E169|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81E179|4C21E2  |81E221;
 
 
.label29:
    REP #$20                                                   ;81E17C|C220    |      ;
    LDA.W #$FF9C                                               ;81E17E|A99CFF  |      ;
    STA.B ptrTemp0x72                                          ;81E181|8572    |000072;
    SEP #$20                                                   ;81E183|E220    |      ;
    LDA.B #$FF                                                 ;81E185|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81E187|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81E189|22C9B183|83B1C9;
    REP #$20                                                   ;81E18D|C220    |      ;
    CMP.W #$0000                                               ;81E18F|C90000  |      ;
    BEQ +                                                      ;81E192|F021    |81E1B5;
    SEP #$20                                                   ;81E194|E220    |      ;
    LDA.B #$02                                                 ;81E196|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E198|8D9A01  |00019A;
    LDX.W #$0304                                               ;81E19B|A20403  |      ;
    LDA.B #$00                                                 ;81E19E|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E1A0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E1A3|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA .return                                                ;81E1B3|806C    |81E221;
 
 
  + SEP #$20                                                   ;81E1B5|E220    |      ;
    LDA.B #$02                                                 ;81E1B7|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E1B9|8D9A01  |00019A;
    LDX.W #$0311                                               ;81E1BC|A21103  |      ;
    LDA.B #$00                                                 ;81E1BF|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E1C1|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E1C4|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81E1D4|C220    |      ;
    LDA.W #$0002                                               ;81E1D6|A90200  |      ;
    JSL.L fGameEngine_AddChicken                               ;81E1D9|2207C883|83C807;
    REP #$20                                                   ;81E1DD|C220    |      ;
    %SetFlag(daily1, $0020)
    SEP #$20                                                   ;81E1EA|E220    |      ;
    LDA.L nOwnedChickens                                       ;81E1EC|AF0B1F7F|7F1F0B;
    INC A                                                      ;81E1F0|1A      |      ;
    STA.L nOwnedChickens                                       ;81E1F1|8F0B1F7F|7F1F0B;
    REP #$20                                                   ;81E1F5|C220    |      ;
    LDA.W #$000A                                               ;81E1F7|A90A00  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E1FA|2282B283|83B282;
    BRA .return                                                ;81E1FE|8021    |81E221;
 
 
.label31:
    SEP #$20                                                   ;81E200|E220    |      ;
    LDA.B #$02                                                 ;81E202|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E204|8D9A01  |00019A;
    LDX.W #$0303                                               ;81E207|A20303  |      ;
    LDA.B #$00                                                 ;81E20A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E20C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E20F|225F9383|83935F;
 
.break:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA .return                                                ;81E21F|8000    |81E221;
 
 
.return:
    RTS                                                        ;81E221|60      |      ;
 
 
.return2:
    JSL.L fDialog_Unknown_8393F9                               ;81E222|22F99383|8393F9;
    SEP #$20                                                   ;81E226|E220    |      ;
    LDA.B #$01                                                 ;81E228|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E22A|8D9A01  |00019A;
    REP #$20                                                   ;81E22D|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;81E22F|AD2801  |000128;
    AND.W #$FF7F                                               ;81E232|297FFF  |      ;
    STA.W strcJoypad1.newInput                                 ;81E235|8D2801  |000128;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E244|60      |      ;
 
 
fPlayerInteraction0x2F:
    %SetCurrentCarriedItemIndex($007E)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E269|60      |      ;
 
 
fPlayerInteraction0x30:
    %SetCurrentCarriedItemIndex($007F)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E28E|60      |      ;
 
 
fPlayerInteraction0x31:
    %SetCurrentCarriedItemIndex($0080)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E2B3|60      |      ;
 
 
fPlayerInteraction0x32:
    %SetCurrentCarriedItemIndex($0081)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E2D8|60      |      ;
 
 
fPlayerInteraction0x33_EllenDiary:
    SEP #$20                                                   ;81E2D9|E220    |      ;
    REP #$10                                                   ;81E2DB|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E2DD|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E2E0|C901    |      ;
    BEQ +                                                      ;81E2E2|F01B    |81E2FF;
    SEP #$20                                                   ;81E2E4|E220    |      ;
    LDA.B #$02                                                 ;81E2E6|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E2E8|8D9A01  |00019A;
    LDX.W #$0023                                               ;81E2EB|A22300  |      ;
    LDA.B #$00                                                 ;81E2EE|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E2F0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E2F3|225F9383|83935F;
    SEP #$20                                                   ;81E2F7|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81E2F9|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81E2FC|4C48E3  |81E348;
 
 
  + SEP #$20                                                   ;81E2FF|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E301|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E304|C902    |      ;
    BNE +                                                      ;81E306|D003    |81E30B;
    JMP.W .justReturn                                          ;81E308|4C48E3  |81E348;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E30B|AD8F01  |00018F;
    BEQ +                                                      ;81E30E|F003    |81E313;
    JMP.W .return                                              ;81E310|4C3CE3  |81E33C;
 
 
  + REP #$20                                                   ;81E313|C220    |      ;
    LDA.L nLove_Ellen                                          ;81E315|AF251F7F|7F1F25;
    JSR.W fLove_ScaleToHearts                                  ;81E319|20C5D1  |81D1C5;
    REP #$30                                                   ;81E31C|C230    |      ;
    CLC                                                        ;81E31E|18      |      ;
    ADC.W #$03A6                                               ;81E31F|69A603  |      ;
    TAX                                                        ;81E322|AA      |      ;
    SEP #$20                                                   ;81E323|E220    |      ;
    LDA.B #$02                                                 ;81E325|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E327|8D9A01  |00019A;
    LDA.B #$00                                                 ;81E32A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E32C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E32F|225F9383|83935F;
    REP #$20                                                   ;81E333|C220    |      ;
    LDA.W #$FFFF                                               ;81E335|A9FFFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E338|2282B283|83B282;
 
.return:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.justReturn:
    RTS                                                        ;81E348|60      |      ;
 
 
fPlayerInteraction0x34:
    %SetCurrentCarriedItemIndex($0082)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E36D|60      |      ;
 
 
fPlayerInteraction0x35:
    SEP #$20                                                   ;81E36E|E220    |      ;
    REP #$10                                                   ;81E370|C210    |      ;
    LDA.B #$24                                                 ;81E372|A924    |      ;
    LDX.W #$0007                                               ;81E374|A20700  |      ;
    LDY.W #$0078                                               ;81E377|A07800  |      ;
    JSL.L fAudioUnknown_8382FE                                 ;81E37A|22FE8283|8382FE;
    SEP #$20                                                   ;81E37E|E220    |      ;
    STZ.W strcAudio.toolId                                     ;81E380|9C1901  |000119;
    JSL.L fToolUsedSound_Unknown828FF3                         ;81E383|22F38F82|828FF3;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E393|60      |      ;
 
 
fPlayerInteraction0x36_AnnDiary:
    SEP #$20                                                   ;81E394|E220    |      ;
    REP #$10                                                   ;81E396|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E398|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E39B|C901    |      ;
    BEQ +                                                      ;81E39D|F01B    |81E3BA;
    SEP #$20                                                   ;81E39F|E220    |      ;
    LDA.B #$02                                                 ;81E3A1|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E3A3|8D9A01  |00019A;
    LDX.W #$0023                                               ;81E3A6|A22300  |      ;
    LDA.B #$00                                                 ;81E3A9|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E3AB|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E3AE|225F9383|83935F;
    SEP #$20                                                   ;81E3B2|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81E3B4|EE6F09  |00096F;
    JMP.W .return                                              ;81E3B7|4C03E4  |81E403;
 
 
  + SEP #$20                                                   ;81E3BA|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E3BC|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E3BF|C902    |      ;
    BNE +                                                      ;81E3C1|D003    |81E3C6;
    JMP.W .return                                              ;81E3C3|4C03E4  |81E403;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E3C6|AD8F01  |00018F;
    BEQ +                                                      ;81E3C9|F003    |81E3CE;
    JMP.W .exit                                                ;81E3CB|4CF7E3  |81E3F7;
 
 
  + REP #$20                                                   ;81E3CE|C220    |      ;
    LDA.L nLove_Ann                                            ;81E3D0|AF211F7F|7F1F21;
    JSR.W fLove_ScaleToHearts                                  ;81E3D4|20C5D1  |81D1C5;
    REP #$30                                                   ;81E3D7|C230    |      ;
    CLC                                                        ;81E3D9|18      |      ;
    ADC.W #$03A6                                               ;81E3DA|69A603  |      ;
    TAX                                                        ;81E3DD|AA      |      ;
    SEP #$20                                                   ;81E3DE|E220    |      ;
    LDA.B #$02                                                 ;81E3E0|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E3E2|8D9A01  |00019A;
    LDA.B #$00                                                 ;81E3E5|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E3E7|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E3EA|225F9383|83935F;
    REP #$20                                                   ;81E3EE|C220    |      ;
    LDA.W #$FFFF                                               ;81E3F0|A9FFFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E3F3|2282B283|83B282;
 
.exit:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81E403|60      |      ;
 
 
fPlayerInteraction0x37:
    %SetCurrentCarriedItemIndex($0077)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E428|60      |      ;
 
 
fPlayerInteraction0x38:
    %SetCurrentCarriedItemIndex($0076)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E44D|60      |      ;
 
 
fPlayerInteraction0x39:
    %SetCurrentCarriedItemIndex($0078)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E472|60      |      ;
 
 
fPlayerInteraction0x3A:
    %SetCurrentCarriedItemIndex($007D)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E497|60      |      ;
 
 
fPlayerInteraction0x3B:
    %SetCurrentCarriedItemIndex($0079)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E4BC|60      |      ;
 
 
fPlayerInteraction0x3C:
    %SetCurrentCarriedItemIndex($007A)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E4E1|60      |      ;
 
 
fPlayerInteraction0x3D:
    %SetCurrentCarriedItemIndex($007B)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E506|60      |      ;
 
 
fPlayerInteraction0x3E:
    %SetCurrentCarriedItemIndex($007C)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E52B|60      |      ;
 
 
fPlayerInteraction0x3F_EveDiary:
    SEP #$20                                                   ;81E52C|E220    |      ;
    REP #$10                                                   ;81E52E|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E530|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E533|C901    |      ;
    BEQ +                                                      ;81E535|F01B    |81E552;
    SEP #$20                                                   ;81E537|E220    |      ;
    LDA.B #$02                                                 ;81E539|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E53B|8D9A01  |00019A;
    LDX.W #$0023                                               ;81E53E|A22300  |      ;
    LDA.B #$00                                                 ;81E541|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E543|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E546|225F9383|83935F;
    SEP #$20                                                   ;81E54A|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81E54C|EE6F09  |00096F;
    JMP.W .return                                              ;81E54F|4C9BE5  |81E59B;
 
 
  + SEP #$20                                                   ;81E552|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E554|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E557|C902    |      ;
    BNE +                                                      ;81E559|D003    |81E55E;
    JMP.W .return                                              ;81E55B|4C9BE5  |81E59B;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E55E|AD8F01  |00018F;
    BEQ +                                                      ;81E561|F003    |81E566;
    JMP.W .exit                                                ;81E563|4C8FE5  |81E58F;
 
 
  + REP #$20                                                   ;81E566|C220    |      ;
    LDA.L nLove_Eve                                            ;81E568|AF271F7F|7F1F27;
    JSR.W fLove_ScaleToHearts                                  ;81E56C|20C5D1  |81D1C5;
    REP #$30                                                   ;81E56F|C230    |      ;
    CLC                                                        ;81E571|18      |      ;
    ADC.W #$03A6                                               ;81E572|69A603  |      ;
    TAX                                                        ;81E575|AA      |      ;
    SEP #$20                                                   ;81E576|E220    |      ;
    LDA.B #$02                                                 ;81E578|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E57A|8D9A01  |00019A;
    LDA.B #$00                                                 ;81E57D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E57F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E582|225F9383|83935F;
    REP #$20                                                   ;81E586|C220    |      ;
    LDA.W #$FFFF                                               ;81E588|A9FFFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E58B|2282B283|83B282;
 
.exit:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81E59B|60      |      ;
 
 
fPlayerInteraction0x40_LessonsOfLove:
    SEP #$20                                                   ;81E59C|E220    |      ;
    REP #$10                                                   ;81E59E|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E5A0|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E5A3|C901    |      ;
    BEQ .check                                                 ;81E5A5|F01B    |81E5C2;
    SEP #$20                                                   ;81E5A7|E220    |      ;
    LDA.B #$02                                                 ;81E5A9|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E5AB|8D9A01  |00019A;
    LDX.W #$045F                                               ;81E5AE|A25F04  |      ;
    LDA.B #$00                                                 ;81E5B1|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E5B3|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E5B6|225F9383|83935F;
    SEP #$20                                                   ;81E5BA|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81E5BC|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81E5BF|4C9FE6  |81E69F;
 
 
.check:
    REP #$30                                                   ;81E5C2|C230    |      ;
    LDA.W strcJoypad1.current                                  ;81E5C4|AD2401  |000124;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;81E5CA|F003    |81E5CF;
    JMP.W .return                                              ;81E5CC|4CA0E6  |81E6A0;
 
 
  + SEP #$20                                                   ;81E5CF|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E5D1|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E5D4|C902    |      ;
    BNE +                                                      ;81E5D6|D003    |81E5DB;
    JMP.W .justReturn                                          ;81E5D8|4C9FE6  |81E69F;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E5DB|AD8F01  |00018F;
    CMP.B #$00                                                 ;81E5DE|C900    |      ;
    BEQ .present                                               ;81E5E0|F013    |81E5F5;
    CMP.B #$01                                                 ;81E5E2|C901    |      ;
    BEQ .festival                                              ;81E5E4|F031    |81E617;
    CMP.B #$02                                                 ;81E5E6|C902    |      ;
    BEQ .marriage                                              ;81E5E8|F04F    |81E639;
    CMP.B #$03                                                 ;81E5EA|C903    |      ;
    BEQ .conversation                                          ;81E5EC|F06D    |81E65B;
    CMP.B #$04                                                 ;81E5EE|C904    |      ;
    BNE .present                                               ;81E5F0|D003    |81E5F5;
    JMP.W .diary                                               ;81E5F2|4C7DE6  |81E67D;
 
 
.present:
    SEP #$20                                                   ;81E5F5|E220    |      ;
    LDA.B #$02                                                 ;81E5F7|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E5F9|8D9A01  |00019A;
    LDX.W #$0460                                               ;81E5FC|A26004  |      ;
    LDA.B #$00                                                 ;81E5FF|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E601|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E604|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81E614|4C9FE6  |81E69F;
 
 
.festival:
    SEP #$20                                                   ;81E617|E220    |      ;
    LDA.B #$02                                                 ;81E619|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E61B|8D9A01  |00019A;
    LDX.W #$0462                                               ;81E61E|A26204  |      ;
    LDA.B #$00                                                 ;81E621|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E623|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E626|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81E636|4C9FE6  |81E69F;
 
 
.marriage:
    SEP #$20                                                   ;81E639|E220    |      ;
    LDA.B #$02                                                 ;81E63B|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E63D|8D9A01  |00019A;
    LDX.W #$0464                                               ;81E640|A26404  |      ;
    LDA.B #$00                                                 ;81E643|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E645|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E648|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81E658|4C9FE6  |81E69F;
 
 
.conversation:
    SEP #$20                                                   ;81E65B|E220    |      ;
    LDA.B #$02                                                 ;81E65D|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E65F|8D9A01  |00019A;
    LDX.W #$0461                                               ;81E662|A26104  |      ;
    LDA.B #$00                                                 ;81E665|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E667|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E66A|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81E67A|4C9FE6  |81E69F;
 
 
.diary:
    SEP #$20                                                   ;81E67D|E220    |      ;
    LDA.B #$02                                                 ;81E67F|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E681|8D9A01  |00019A;
    LDX.W #$0463                                               ;81E684|A26304  |      ;
    LDA.B #$00                                                 ;81E687|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E689|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E68C|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81E69C|4C9FE6  |81E69F;
 
 
.justReturn:
    RTS                                                        ;81E69F|60      |      ;
 
 
.return:
    JSL.L fDialog_Unknown_8393F9                               ;81E6A0|22F99383|8393F9;
    SEP #$20                                                   ;81E6A4|E220    |      ;
    LDA.B #$01                                                 ;81E6A6|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E6A8|8D9A01  |00019A;
    REP #$20                                                   ;81E6AB|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;81E6AD|AD2801  |000128;
    AND.W #~!JOYPAD_A                                               
    STA.W strcJoypad1.newInput                                 ;81E6B3|8D2801  |000128;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81E6C2|60      |      ;
 
 
fPlayerInteraction0x41_HotSprings:
    REP #$30                                                   ;81E6C3|C230    |      ;
    %SetPlayerFlag(!PFLAGS_INSPRINGS)
    %SetPlayerAction(!PACTION_JUMP)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %UpdateStamina(12)
    RTS                                                        ;81E6E9|60      |      ;
 
 
fPlayerInteraction0x42:
    SEP #$20                                                   ;81E6EA|E220    |      ;
    REP #$10                                                   ;81E6EC|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E6EE|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E6F1|C901    |      ;
    BEQ .case1                                                 ;81E6F3|F03D    |81E732;
    CMP.B #$02                                                 ;81E6F5|C902    |      ;
    BEQ .case2                                                 ;81E6F7|F069    |81E762;
    CMP.B #$03                                                 ;81E6F9|C903    |      ;
    BNE .default                                               ;81E6FB|D003    |81E700;
    JMP.W .case3                                               ;81E6FD|4C91E7  |81E791;
 
 
.default:
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_LEFT)
    %SetObjectDirection(!PDIR_LEFT)
    SEP #$20                                                   ;81E71F|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81E721|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81E724|AD7009  |000970;
    CMP.B #$20                                                 ;81E727|C920    |      ;
    BNE .return                                                ;81E729|D072    |81E79D;
    LDA.B #$01                                                 ;81E72B|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81E72D|8D6F09  |00096F;
    BRA .return                                                ;81E730|806B    |81E79D;
 
 
.case1:
    SEP #$20                                                   ;81E732|E220    |      ;
    LDX.W #$030C                                               ;81E734|A20C03  |      ;
    LDA.L strcShedItems.row2                                   ;81E737|AF011F7F|7F1F01;
    AND.B #$04                                                 ;81E73B|2904    |      ;
    BNE +                                                      ;81E73D|D00A    |81E749;
    LDA.W strcPlayerData.toolEquipped                          ;81E73F|AD2109  |000921;
    CMP.B #!EITEM_BELL                                                 
    BEQ +                                                      ;81E744|F003    |81E749;
    LDX.W #$010E                                               ;81E746|A20E01  |      ;
 
  + SEP #$20                                                   ;81E749|E220    |      ;
    LDA.B #$02                                                 ;81E74B|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E74D|8D9A01  |00019A;
    LDA.B #$00                                                 ;81E750|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E752|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E755|225F9383|83935F;
    SEP #$20                                                   ;81E759|E220    |      ;
    LDA.B #$02                                                 ;81E75B|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81E75D|8D6F09  |00096F;
    BRA .return                                                ;81E760|803B    |81E79D;
 
 
.case2:
    SEP #$20                                                   ;81E762|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E764|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E767|C902    |      ;
    BNE +                                                      ;81E769|D003    |81E76E;
    JMP.W .return                                              ;81E76B|4C9DE7  |81E79D;
 
 
  + SEP #$20                                                   ;81E76E|E220    |      ;
    LDA.B #$03                                                 ;81E770|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81E772|8D6F09  |00096F;
    LDA.B #$01                                                 ;81E775|A901    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;81E777|8D9F09  |00099F;
    LDA.L strcShedItems.row2                                   ;81E77A|AF011F7F|7F1F01;
    ORA.B #$04                                                 ;81E77E|0904    |      ;
    STA.L strcShedItems.row2                                   ;81E780|8F011F7F|7F1F01;
    REP #$20                                                   ;81E784|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81E786|AD9601  |000196;
    ORA.W #$2000                                               ;81E789|090020  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;81E78C|8D9601  |000196;
    BRA .return                                                ;81E78F|800C    |81E79D;
 
 
.case3:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81E79D|60      |      ;
 
 
fPlayerInteraction0x43:
    SEP #$20                                                   ;81E79E|E220    |      ;
    REP #$10                                                   ;81E7A0|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81E7A2|AD6F09  |00096F;
    CMP.B #$01                                                 ;81E7A5|C901    |      ;
    BNE +                                                      ;81E7A7|D003    |81E7AC;
    JMP.W .case1                                               ;81E7A9|4C66E8  |81E866;
 
 
  + CMP.B #$02                                                 ;81E7AC|C902    |      ;
    BNE +                                                      ;81E7AE|D003    |81E7B3;
    JMP.W .case2                                               ;81E7B0|4C10E9  |81E910;
 
 
  + CMP.B #$03                                                 ;81E7B3|C903    |      ;
    BNE +                                                      ;81E7B5|D003    |81E7BA;
    JMP.W .case3                                               ;81E7B7|4C5DE9  |81E95D;
 
 
  + CMP.B #$04                                                 ;81E7BA|C904    |      ;
    BNE +                                                      ;81E7BC|D003    |81E7C1;
    JMP.W .case4                                               ;81E7BE|4CE2E9  |81E9E2;
 
 
  + CMP.B #$05                                                 ;81E7C1|C905    |      ;
    BNE +                                                      ;81E7C3|D003    |81E7C8;
    JMP.W .case5                                               ;81E7C5|4C11EA  |81EA11;
 
 
  + CMP.B #$06                                                 ;81E7C8|C906    |      ;
    BNE +                                                      ;81E7CA|D003    |81E7CF;
    JMP.W .case6                                               ;81E7CC|4C42EA  |81EA42;
 
 
  + CMP.B #$07                                                 ;81E7CF|C907    |      ;
    BNE +                                                      ;81E7D1|D003    |81E7D6;
    JMP.W .case7                                               ;81E7D3|4C8EEA  |81EA8E;
 
 
  + CMP.B #$08                                                 ;81E7D6|C908    |      ;
    BNE +                                                      ;81E7D8|D003    |81E7DD;
    JMP.W .case8                                               ;81E7DA|4CBAEA  |81EABA;
 
 
  + CMP.B #$09                                                 ;81E7DD|C909    |      ;
    BNE +                                                      ;81E7DF|D003    |81E7E4;
    JMP.W .case9                                               ;81E7E1|4C07EB  |81EB07;
 
 
  + CMP.B #$0A                                                 ;81E7E4|C90A    |      ;
    BNE +                                                      ;81E7E6|D003    |81E7EB;
    JMP.W .caseA                                               ;81E7E8|4C8FEB  |81EB8F;
 
 
  + CMP.B #$0B                                                 ;81E7EB|C90B    |      ;
    BNE .checks                                                ;81E7ED|D003    |81E7F2;
    JMP.W .caseB                                               ;81E7EF|4CBFEB  |81EBBF;
 
 
.checks:
    SEP #$20                                                   ;81E7F2|E220    |      ;
    LDA.B #$00                                                 ;81E7F4|A900    |      ;
    XBA                                                        ;81E7F6|EB      |      ;
    LDA.W $09A0                                                ;81E7F7|ADA009  |0009A0;
    SEC                                                        ;81E7FA|38      |      ;
    SBC.B #$18                                                 ;81E7FB|E918    |      ;
    REP #$20                                                   ;81E7FD|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;81E7FF|22A7C983|83C9A7;
    SEP #$20                                                   ;81E803|E220    |      ;
    LDY.W #$0000                                               ;81E805|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81E808|B772    |000072; strcCowData.statusFlags
    AND.B #$06                                                 ;81E80A|2906    |      ; 00000110 = adult, child
    BNE .failCheck                                             ;81E80C|D03F    |81E84D;
    LDA.B [ptrTemp0x72],Y                                      ;81E80E|B772    |000072; strcCowData.statusFlags
    AND.B #$70                                                 ;81E810|2970    |      ; 01110000 = pregnacy, sick, cranky
    BNE .failCheck                                             ;81E812|D039    |81E84D;
    SEP #$20                                                   ;81E814|E220    |      ;
    LDA.L nCurrentYearID                                       ;81E816|AF181F7F|7F1F18;
    BEQ .failCheck                                             ;81E81A|F031    |81E84D;
    REP #$30                                                   ;81E81C|C230    |      ;
    %CheckFlag(event2, $8000)
    BNE .failCheck                                             ;81E825|D026    |81E84D;
    REP #$20                                                   ;81E827|C220    |      ;
    %SetFlag(event2, $8000)
    REP #$20                                                   ;81E834|C220    |      ;
    %AIExecute($0008, $0000, $007C)
    SEP #$20                                                   ;81E843|E220    |      ;
    LDA.B #$07                                                 ;81E845|A907    |      ;
    STA.W nPlayerInteractionArg1                               ;81E847|8D6F09  |00096F;
    JMP.W .return                                              ;81E84A|4CD4EB  |81EBD4;
 
 
.failCheck:
    REP #$20                                                   ;81E84D|C220    |      ;
    %AIExecute($0007, $0000, $0021)
    SEP #$20                                                   ;81E85C|E220    |      ;
    LDA.B #$01                                                 ;81E85E|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81E860|8D6F09  |00096F;
    JMP.W .return                                              ;81E863|4CD4EB  |81EBD4;
 
 
.case1:
    SEP #$20                                                   ;81E866|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81E868|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81E86B|AD7009  |000970;
    CMP.B #$40                                                 ;81E86E|C940    |      ;
    BEQ +                                                      ;81E870|F003    |81E875;
    JMP.W .return                                              ;81E872|4CD4EB  |81EBD4;
 
 
  + REP #$20                                                   ;81E875|C220    |      ;
    %CheckFlag(daily4, $2000)
    BNE .label17                                               ;81E87E|D071    |81E8F1;
    SEP #$20                                                   ;81E880|E220    |      ;
    LDA.B #$02                                                 ;81E882|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E884|8D9A01  |00019A;
    SEP #$20                                                   ;81E887|E220    |      ;
    LDA.B #$00                                                 ;81E889|A900    |      ;
    XBA                                                        ;81E88B|EB      |      ;
    LDA.W $09A0                                                ;81E88C|ADA009  |0009A0;
    SEC                                                        ;81E88F|38      |      ;
    SBC.B #$18                                                 ;81E890|E918    |      ;
    REP #$20                                                   ;81E892|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;81E894|22A7C983|83C9A7;
    SEP #$20                                                   ;81E898|E220    |      ;
    LDY.W #$0000                                               ;81E89A|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81E89D|B772    |000072; strcCowData.statusFlags
    AND.B #$06                                                 ;81E89F|2906    |      ; 00000110 = adult, child
    BNE .label15                                               ;81E8A1|D01E    |81E8C1;
    LDA.B [ptrTemp0x72],Y                                      ;81E8A3|B772    |000072; strcCowData.statusFlags
    AND.B #$70                                                 ;81E8A5|2970    |      ; 01110000 = pregnacy, sick, cranky
    BNE .label16                                               ;81E8A7|D030    |81E8D9;
    LDX.W #$030E                                               ;81E8A9|A20E03  |      ;
    SEP #$20                                                   ;81E8AC|E220    |      ;
    LDA.B #$00                                                 ;81E8AE|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E8B0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E8B3|225F9383|83935F;
    SEP #$20                                                   ;81E8B7|E220    |      ;
    LDA.B #$02                                                 ;81E8B9|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81E8BB|8D6F09  |00096F;
    JMP.W .return                                              ;81E8BE|4CD4EB  |81EBD4;
 
 
.label15:
    LDX.W #$0310                                               ;81E8C1|A21003  |      ; TEXT_B9C65A
    SEP #$20                                                   ;81E8C4|E220    |      ;
    LDA.B #$00                                                 ;81E8C6|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E8C8|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E8CB|225F9383|83935F;
    SEP #$20                                                   ;81E8CF|E220    |      ;
    LDA.B #$05                                                 ;81E8D1|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81E8D3|8D6F09  |00096F;
    JMP.W .return                                              ;81E8D6|4CD4EB  |81EBD4;
 
 
.label16:
    LDX.W #$030D                                               ;81E8D9|A20D03  |      ; TEXT_B9C3EA
    SEP #$20                                                   ;81E8DC|E220    |      ;
    LDA.B #$00                                                 ;81E8DE|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E8E0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E8E3|225F9383|83935F;
    SEP #$20                                                   ;81E8E7|E220    |      ;
    LDA.B #$05                                                 ;81E8E9|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81E8EB|8D6F09  |00096F;
    JMP.W .return                                              ;81E8EE|4CD4EB  |81EBD4;
 
 
.label17:
    REP #$30                                                   ;81E8F1|C230    |      ; TEXT_BBB4B6
    LDX.W #$0487                                               ;81E8F3|A28704  |      ;
    SEP #$20                                                   ;81E8F6|E220    |      ;
    LDA.B #$02                                                 ;81E8F8|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E8FA|8D9A01  |00019A;
    LDA.B #$00                                                 ;81E8FD|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E8FF|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E902|225F9383|83935F;
    SEP #$20                                                   ;81E906|E220    |      ;
    LDA.B #$05                                                 ;81E908|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81E90A|8D6F09  |00096F;
    JMP.W .return                                              ;81E90D|4CD4EB  |81EBD4;
 
 
.case2:
    SEP #$20                                                   ;81E910|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E912|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E915|C902    |      ;
    BNE +                                                      ;81E917|D003    |81E91C;
    JMP.W .return                                              ;81E919|4CD4EB  |81EBD4;
 
 
  + SEP #$20                                                   ;81E91C|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81E91E|AD8F01  |00018F;
    BNE +                                                      ;81E921|D01D    |81E940;
    SEP #$20                                                   ;81E923|E220    |      ;
    LDA.B #$02                                                 ;81E925|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E927|8D9A01  |00019A;
    LDX.W #$030F                                               ;81E92A|A20F03  |      ;
    LDA.B #$00                                                 ;81E92D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E92F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E932|225F9383|83935F;
    SEP #$20                                                   ;81E936|E220    |      ;
    LDA.B #$03                                                 ;81E938|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81E93A|8D6F09  |00096F;
    JMP.W .return                                              ;81E93D|4CD4EB  |81EBD4;
 
 
  + SEP #$20                                                   ;81E940|E220    |      ;
    LDA.B #$02                                                 ;81E942|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81E944|8D9A01  |00019A;
    LDX.W #$0309                                               ;81E947|A20903  |      ;
    LDA.B #$00                                                 ;81E94A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81E94C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81E94F|225F9383|83935F;
    SEP #$20                                                   ;81E953|E220    |      ;
    LDA.B #$05                                                 ;81E955|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81E957|8D6F09  |00096F;
    JMP.W .return                                              ;81E95A|4CD4EB  |81EBD4;
 
 
.case3:
    SEP #$20                                                   ;81E95D|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81E95F|AD9A01  |00019A;
    CMP.B #$02                                                 ;81E962|C902    |      ;
    BNE +                                                      ;81E964|D003    |81E969;
    JMP.W .return                                              ;81E966|4CD4EB  |81EBD4;
 
 
  + REP #$20                                                   ;81E969|C220    |      ;
    LDA.L nGameUnk7F1F15                                       ;81E96B|AF151F7F|7F1F15;
    STA.B ptrTemp0x72                                          ;81E96F|8572    |000072;
    SEP #$20                                                   ;81E971|E220    |      ;
    LDA.L nGameUnk7F1F15+2                                     ;81E973|AF171F7F|7F1F17;
    STA.B ptrTemp0x72+2                                        ;81E977|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81E979|22C9B183|83B1C9;
    REP #$20                                                   ;81E97D|C220    |      ;
    LDA.W #$0007                                               ;81E97F|A90700  |      ;
    JSL.L fAI_Unknown848020                                    ;81E982|22208084|848020;
    REP #$20                                                   ;81E986|C220    |      ;
    %AIExecute($0007, $0000, $0023)
    SEP #$20                                                   ;81E995|E220    |      ;
    LDA.B #$00                                                 ;81E997|A900    |      ;
    XBA                                                        ;81E999|EB      |      ;
    LDA.W $09A0                                                ;81E99A|ADA009  |0009A0;
    LDX.W #$0000                                               ;81E99D|A20000  |      ;
    LDY.W #$0022                                               ;81E9A0|A02200  |      ;
    JSL.L fAI_Unknown84803F                                    ;81E9A3|223F8084|84803F;
    SEP #$20                                                   ;81E9A7|E220    |      ;
    LDA.B #$00                                                 ;81E9A9|A900    |      ;
    XBA                                                        ;81E9AB|EB      |      ;
    LDA.W $09A0                                                ;81E9AC|ADA009  |0009A0;
    SEC                                                        ;81E9AF|38      |      ;
    SBC.B #$18                                                 ;81E9B0|E918    |      ;
    REP #$20                                                   ;81E9B2|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;81E9B4|22A7C983|83C9A7;
    SEP #$20                                                   ;81E9B8|E220    |      ;
    LDY.W #$0000                                               ;81E9BA|A00000  |      ;
    LDA.B #$00                                                 ;81E9BD|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;81E9BF|9772    |000072;
    SEP #$20                                                   ;81E9C1|E220    |      ;
    LDA.L nOwnedCows                                           ;81E9C3|AF0A1F7F|7F1F0A;
    DEC A                                                      ;81E9C7|3A      |      ;
    STA.L nOwnedCows                                           ;81E9C8|8F0A1F7F|7F1F0A;
    SEP #$20                                                   ;81E9CC|E220    |      ;
    LDA.B #$04                                                 ;81E9CE|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81E9D0|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81E9D3|9C7009  |000970;
    REP #$20                                                   ;81E9D6|C220    |      ;
    LDA.W #$FFCE                                               ;81E9D8|A9CEFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81E9DB|2282B283|83B282;
    JMP.W .return                                              ;81E9DF|4CD4EB  |81EBD4;
 
 
.case4:
    SEP #$20                                                   ;81E9E2|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81E9E4|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81E9E7|AD7009  |000970;
    CMP.B #$42                                                 ;81E9EA|C942    |      ;
    BEQ +                                                      ;81E9EC|F003    |81E9F1;
    JMP.W .return                                              ;81E9EE|4CD4EB  |81EBD4;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81E9F1|9C7009  |000970;
    REP #$20                                                   ;81E9F4|C220    |      ;
    %CheckFlag(daily4, $2000)
    BEQ +                                                      ;81E9FD|F003    |81EA02;
    JMP.W .failCheck                                           ;81E9FF|4C4DE8  |81E84D;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81EA0E|4CD4EB  |81EBD4;
 
 
.case5:
    SEP #$20                                                   ;81EA11|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EA13|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EA16|C902    |      ;
    BNE +                                                      ;81EA18|D003    |81EA1D;
    JMP.W .return                                              ;81EA1A|4CD4EB  |81EBD4;
 
 
  + REP #$20                                                   ;81EA1D|C220    |      ;
    LDA.W #$0007                                               ;81EA1F|A90700  |      ;
    JSL.L fAI_Unknown848020                                    ;81EA22|22208084|848020;
    REP #$20                                                   ;81EA26|C220    |      ;
    %AIExecute($0007, $0000, $0023)
    SEP #$20                                                   ;81EA35|E220    |      ;
    LDA.B #$06                                                 ;81EA37|A906    |      ;
    STA.W nPlayerInteractionArg1                               ;81EA39|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EA3C|9C7009  |000970;
    JMP.W .return                                              ;81EA3F|4CD4EB  |81EBD4;
 
 
.case6:
    SEP #$20                                                   ;81EA42|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EA44|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EA47|AD7009  |000970;
    CMP.B #$40                                                 ;81EA4A|C940    |      ;
    BEQ +                                                      ;81EA4C|F003    |81EA51;
    JMP.W .return                                              ;81EA4E|4CD4EB  |81EBD4;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81EA5D|C220    |      ;
    %CheckFlag(daily4, $2000)
    BEQ +                                                      ;81EA66|F003    |81EA6B;
    JMP.W .return                                              ;81EA68|4CD4EB  |81EBD4;
 
 
  + SEP #$20                                                   ;81EA6B|E220    |      ;
    LDA.B #$00                                                 ;81EA6D|A900    |      ;
    XBA                                                        ;81EA6F|EB      |      ;
    LDA.W $09A0                                                ;81EA70|ADA009  |0009A0;
    JSL.L fAI_SetCCPointer                                     ;81EA73|227C8884|84887C;
    SEP #$20                                                   ;81EA77|E220    |      ;
    REP #$10                                                   ;81EA79|C210    |      ;
    LDY.W #$0001                                               ;81EA7B|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;81EA7E|B7CC    |0000CC;
    ORA.B #$A8                                                 ;81EA80|09A8    |      ;
    SEP #$20                                                   ;81EA82|E220    |      ;
    REP #$10                                                   ;81EA84|C210    |      ;
    LDY.W #$0001                                               ;81EA86|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;81EA89|97CC    |0000CC;
    JMP.W .return                                              ;81EA8B|4CD4EB  |81EBD4;
 
 
.case7:
    SEP #$20                                                   ;81EA8E|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EA90|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EA93|AD7009  |000970;
    CMP.B #$42                                                 ;81EA96|C942    |      ;
    BEQ +                                                      ;81EA98|F003    |81EA9D;
    JMP.W .return                                              ;81EA9A|4CD4EB  |81EBD4;
 
 
  + LDX.W #$0149                                               ;81EA9D|A24901  |      ;
    SEP #$20                                                   ;81EAA0|E220    |      ;
    LDA.B #$02                                                 ;81EAA2|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EAA4|8D9A01  |00019A;
    LDA.B #$00                                                 ;81EAA7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EAA9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EAAC|225F9383|83935F;
    SEP #$20                                                   ;81EAB0|E220    |      ;
    LDA.B #$08                                                 ;81EAB2|A908    |      ;
    STA.W nPlayerInteractionArg1                               ;81EAB4|8D6F09  |00096F;
    JMP.W .return                                              ;81EAB7|4CD4EB  |81EBD4;
 
 
.case8:
    SEP #$20                                                   ;81EABA|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EABC|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EABF|C902    |      ;
    BNE +                                                      ;81EAC1|D003    |81EAC6;
    JMP.W .return                                              ;81EAC3|4CD4EB  |81EBD4;
 
 
  + SEP #$20                                                   ;81EAC6|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81EAC8|AD8F01  |00018F;
    BNE +                                                      ;81EACB|D01D    |81EAEA;
    SEP #$20                                                   ;81EACD|E220    |      ;
    LDA.B #$02                                                 ;81EACF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EAD1|8D9A01  |00019A;
    LDX.W #$014B                                               ;81EAD4|A24B01  |      ;
    LDA.B #$00                                                 ;81EAD7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EAD9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EADC|225F9383|83935F;
    SEP #$20                                                   ;81EAE0|E220    |      ;
    LDA.B #$09                                                 ;81EAE2|A909    |      ;
    STA.W nPlayerInteractionArg1                               ;81EAE4|8D6F09  |00096F;
    JMP.W .return                                              ;81EAE7|4CD4EB  |81EBD4;
 
 
  + SEP #$20                                                   ;81EAEA|E220    |      ;
    LDA.B #$02                                                 ;81EAEC|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EAEE|8D9A01  |00019A;
    LDX.W #$014C                                               ;81EAF1|A24C01  |      ;
    LDA.B #$00                                                 ;81EAF4|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EAF6|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EAF9|225F9383|83935F;
    SEP #$20                                                   ;81EAFD|E220    |      ;
    LDA.B #$0A                                                 ;81EAFF|A90A    |      ;
    STA.W nPlayerInteractionArg1                               ;81EB01|8D6F09  |00096F;
    JMP.W .return                                              ;81EB04|4CD4EB  |81EBD4;
 
 
.case9:
    SEP #$20                                                   ;81EB07|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EB09|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EB0C|C902    |      ;
    BNE +                                                      ;81EB0E|D003    |81EB13;
    JMP.W .return                                              ;81EB10|4CD4EB  |81EBD4;
 
 
  + REP #$20                                                   ;81EB13|C220    |      ;
    LDA.W #$0008                                               ;81EB15|A90800  |      ;
    JSL.L fAI_Unknown848020                                    ;81EB18|22208084|848020;
    REP #$20                                                   ;81EB1C|C220    |      ;
    %AIExecute($0008, $0000, $007D)
    SEP #$20                                                   ;81EB2B|E220    |      ;
    LDA.B #$00                                                 ;81EB2D|A900    |      ;
    XBA                                                        ;81EB2F|EB      |      ;
    LDA.W $09A0                                                ;81EB30|ADA009  |0009A0;
    LDX.W #$0000                                               ;81EB33|A20000  |      ;
    LDY.W #$0022                                               ;81EB36|A02200  |      ;
    JSL.L fAI_Unknown84803F                                    ;81EB39|223F8084|84803F;
    SEP #$20                                                   ;81EB3D|E220    |      ;
    LDA.B #$00                                                 ;81EB3F|A900    |      ;
    XBA                                                        ;81EB41|EB      |      ;
    LDA.W $09A0                                                ;81EB42|ADA009  |0009A0;
    SEC                                                        ;81EB45|38      |      ;
    SBC.B #$18                                                 ;81EB46|E918    |      ;
    REP #$20                                                   ;81EB48|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;81EB4A|22A7C983|83C9A7;
    SEP #$20                                                   ;81EB4E|E220    |      ;
    LDY.W #$0000                                               ;81EB50|A00000  |      ;
    LDA.B #$00                                                 ;81EB53|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;81EB55|9772    |000072;
    SEP #$20                                                   ;81EB57|E220    |      ;
    LDA.L nOwnedCows                                           ;81EB59|AF0A1F7F|7F1F0A;
    DEC A                                                      ;81EB5D|3A      |      ;
    STA.L nOwnedCows                                           ;81EB5E|8F0A1F7F|7F1F0A;
    SEP #$20                                                   ;81EB62|E220    |      ;
    LDA.B #$04                                                 ;81EB64|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81EB66|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EB69|9C7009  |000970;
    LDA.L strcShedItems.row3                                   ;81EB6C|AF021F7F|7F1F02;
    ORA.B #$20                                                 ;81EB70|0920    |      ;
    STA.L strcShedItems.row3                                   ;81EB72|8F021F7F|7F1F02;
    REP #$20                                                   ;81EB76|C220    |      ;
    LDA.W #$FFCE                                               ;81EB78|A9CEFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81EB7B|2282B283|83B282;
    REP #$20                                                   ;81EB7F|C220    |      ;
    %SetFlag(daily4, $2000)
    JMP.W .return                                              ;81EB8C|4CD4EB  |81EBD4;
 
 
.caseA:
    SEP #$20                                                   ;81EB8F|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EB91|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EB94|C902    |      ;
    BNE +                                                      ;81EB96|D003    |81EB9B;
    JMP.W .return                                              ;81EB98|4CD4EB  |81EBD4;
 
 
  + REP #$20                                                   ;81EB9B|C220    |      ;
    LDA.W #$0008                                               ;81EB9D|A90800  |      ;
    JSL.L fAI_Unknown848020                                    ;81EBA0|22208084|848020;
    REP #$20                                                   ;81EBA4|C220    |      ;
    %AIExecute($0008, $0000, $007D)
    SEP #$20                                                   ;81EBB3|E220    |      ;
    LDA.B #$0B                                                 ;81EBB5|A90B    |      ;
    STA.W nPlayerInteractionArg1                               ;81EBB7|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EBBA|9C7009  |000970;
    BRA .return                                                ;81EBBD|8015    |81EBD4;
 
 
.caseB:
    SEP #$20                                                   ;81EBBF|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EBC1|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EBC4|AD7009  |000970;
    CMP.B #$42                                                 ;81EBC7|C942    |      ;
    BEQ +                                                      ;81EBC9|F003    |81EBCE;
    JMP.W .return                                              ;81EBCB|4CD4EB  |81EBD4;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81EBCE|9C7009  |000970;
    JMP.W .failCheck                                           ;81EBD1|4C4DE8  |81E84D;
 
 
.return:
    RTS                                                        ;81EBD4|60      |      ;
 
 
fPlayerInteraction0x44:
    SEP #$20                                                   ;81EBD5|E220    |      ;
    REP #$10                                                   ;81EBD7|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81EBD9|AD6F09  |00096F;
    CMP.B #$01                                                 ;81EBDC|C901    |      ;
    BNE +                                                      ;81EBDE|D003    |81EBE3;
    JMP.W .case1                                               ;81EBE0|4C7DEC  |81EC7D;
 
 
  + CMP.B #$02                                                 ;81EBE3|C902    |      ;
    BNE +                                                      ;81EBE5|D003    |81EBEA;
    JMP.W .case2                                               ;81EBE7|4CD3EC  |81ECD3;
 
 
  + CMP.B #$03                                                 ;81EBEA|C903    |      ;
    BNE +                                                      ;81EBEC|D003    |81EBF1;
    JMP.W .case3                                               ;81EBEE|4C20ED  |81ED20;
 
 
  + CMP.B #$04                                                 ;81EBF1|C904    |      ;
    BNE +                                                      ;81EBF3|D003    |81EBF8;
    JMP.W .case4                                               ;81EBF5|4CA5ED  |81EDA5;
 
 
  + CMP.B #$05                                                 ;81EBF8|C905    |      ;
    BNE +                                                      ;81EBFA|D003    |81EBFF;
    JMP.W .case5                                               ;81EBFC|4CD4ED  |81EDD4;
 
 
  + CMP.B #$06                                                 ;81EBFF|C906    |      ;
    BNE +                                                      ;81EC01|D003    |81EC06;
    JMP.W .case6                                               ;81EC03|4C05EE  |81EE05;
 
 
  + CMP.B #$07                                                 ;81EC06|C907    |      ;
    BNE +                                                      ;81EC08|D003    |81EC0D;
    JMP.W .case7                                               ;81EC0A|4C51EE  |81EE51;
 
 
  + CMP.B #$08                                                 ;81EC0D|C908    |      ;
    BNE +                                                      ;81EC0F|D003    |81EC14;
    JMP.W .case8                                               ;81EC11|4C7DEE  |81EE7D;
 
 
  + CMP.B #$09                                                 ;81EC14|C909    |      ;
    BNE +                                                      ;81EC16|D003    |81EC1B;
    JMP.W .case9                                               ;81EC18|4CCAEE  |81EECA;
 
 
  + CMP.B #$0A                                                 ;81EC1B|C90A    |      ;
    BNE +                                                      ;81EC1D|D003    |81EC22;
    JMP.W .caseA                                               ;81EC1F|4C67EF  |81EF67;
 
 
  + CMP.B #$0B                                                 ;81EC22|C90B    |      ;
    BNE .checks                                                ;81EC24|D003    |81EC29;
    JMP.W .caseB                                               ;81EC26|4C97EF  |81EF97;
 
 
.checks:
    SEP #$20                                                   ;81EC29|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;81EC2B|AF191F7F|7F1F19;
    CMP.B #!SEASON_FALL                                                 
    BNE .loop                                                  ;81EC31|D031    |81EC64;
    REP #$30                                                   ;81EC33|C230    |      ;
    %CheckFlag(event2, $4000)
    BNE .loop                                                  ;81EC3C|D026    |81EC64;
    REP #$20                                                   ;81EC3E|C220    |      ;
    %SetFlag(event2, $4000)
    REP #$20                                                   ;81EC4B|C220    |      ;
    %AIExecute($0008, $0000, $007C)
    SEP #$20                                                   ;81EC5A|E220    |      ;
    LDA.B #$07                                                 ;81EC5C|A907    |      ;
    STA.W nPlayerInteractionArg1                               ;81EC5E|8D6F09  |00096F;
    JMP.W .return                                              ;81EC61|4CACEF  |81EFAC;
 
 
.loop:
    REP #$20                                                   ;81EC64|C220    |      ;
    %AIExecute($0007, $0000, $0021)
    SEP #$20                                                   ;81EC73|E220    |      ;
    LDA.B #$01                                                 ;81EC75|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81EC77|8D6F09  |00096F;
    JMP.W .return                                              ;81EC7A|4CACEF  |81EFAC;
 
 
.case1:
    SEP #$20                                                   ;81EC7D|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EC7F|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EC82|AD7009  |000970;
    CMP.B #$42                                                 ;81EC85|C942    |      ;
    BEQ +                                                      ;81EC87|F003    |81EC8C;
    JMP.W .return                                              ;81EC89|4CACEF  |81EFAC;
 
 
  + REP #$20                                                   ;81EC8C|C220    |      ;
    %CheckFlag(daily4, $1000)
    BNE +                                                      ;81EC95|D01D    |81ECB4;
    LDX.W #$030E                                               ;81EC97|A20E03  |      ;
    SEP #$20                                                   ;81EC9A|E220    |      ;
    LDA.B #$02                                                 ;81EC9C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EC9E|8D9A01  |00019A;
    LDA.B #$00                                                 ;81ECA1|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81ECA3|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81ECA6|225F9383|83935F;
    SEP #$20                                                   ;81ECAA|E220    |      ;
    LDA.B #$02                                                 ;81ECAC|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81ECAE|8D6F09  |00096F;
    JMP.W .return                                              ;81ECB1|4CACEF  |81EFAC;
 
 
  + REP #$30                                                   ;81ECB4|C230    |      ;
    LDX.W #$0487                                               ;81ECB6|A28704  |      ;
    SEP #$20                                                   ;81ECB9|E220    |      ;
    LDA.B #$02                                                 ;81ECBB|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81ECBD|8D9A01  |00019A;
    LDA.B #$00                                                 ;81ECC0|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81ECC2|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81ECC5|225F9383|83935F;
    SEP #$20                                                   ;81ECC9|E220    |      ;
    LDA.B #$05                                                 ;81ECCB|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81ECCD|8D6F09  |00096F;
    JMP.W .return                                              ;81ECD0|4CACEF  |81EFAC;
 
 
.case2:
    SEP #$20                                                   ;81ECD3|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81ECD5|AD9A01  |00019A;
    CMP.B #$02                                                 ;81ECD8|C902    |      ;
    BNE +                                                      ;81ECDA|D003    |81ECDF;
    JMP.W .return                                              ;81ECDC|4CACEF  |81EFAC;
 
 
  + SEP #$20                                                   ;81ECDF|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81ECE1|AD8F01  |00018F;
    BNE +                                                      ;81ECE4|D01D    |81ED03;
    SEP #$20                                                   ;81ECE6|E220    |      ;
    LDA.B #$02                                                 ;81ECE8|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81ECEA|8D9A01  |00019A;
    LDX.W #$030F                                               ;81ECED|A20F03  |      ;
    LDA.B #$00                                                 ;81ECF0|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81ECF2|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81ECF5|225F9383|83935F;
    SEP #$20                                                   ;81ECF9|E220    |      ;
    LDA.B #$03                                                 ;81ECFB|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81ECFD|8D6F09  |00096F;
    JMP.W .return                                              ;81ED00|4CACEF  |81EFAC;
 
 
  + SEP #$20                                                   ;81ED03|E220    |      ;
    LDA.B #$02                                                 ;81ED05|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81ED07|8D9A01  |00019A;
    LDX.W #$0309                                               ;81ED0A|A20903  |      ;
    LDA.B #$00                                                 ;81ED0D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81ED0F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81ED12|225F9383|83935F;
    SEP #$20                                                   ;81ED16|E220    |      ;
    LDA.B #$05                                                 ;81ED18|A905    |      ;
    STA.W nPlayerInteractionArg1                               ;81ED1A|8D6F09  |00096F;
    JMP.W .return                                              ;81ED1D|4CACEF  |81EFAC;
 
 
.case3:
    SEP #$20                                                   ;81ED20|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81ED22|AD9A01  |00019A;
    CMP.B #$02                                                 ;81ED25|C902    |      ;
    BNE +                                                      ;81ED27|D003    |81ED2C;
    JMP.W .return                                              ;81ED29|4CACEF  |81EFAC;
 
 
  + REP #$20                                                   ;81ED2C|C220    |      ;
    LDA.L nGameUnk7F1F15                                       ;81ED2E|AF151F7F|7F1F15;
    STA.B ptrTemp0x72                                          ;81ED32|8572    |000072;
    SEP #$20                                                   ;81ED34|E220    |      ;
    LDA.L nGameUnk7F1F15+2                                     ;81ED36|AF171F7F|7F1F17;
    STA.B ptrTemp0x72+2                                        ;81ED3A|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81ED3C|22C9B183|83B1C9;
    REP #$20                                                   ;81ED40|C220    |      ;
    LDA.W #$0007                                               ;81ED42|A90700  |      ;
    JSL.L fAI_Unknown848020                                    ;81ED45|22208084|848020;
    REP #$20                                                   ;81ED49|C220    |      ;
    %AIExecute($0007, $0000, $0023)
    SEP #$20                                                   ;81ED58|E220    |      ;
    LDA.B #$00                                                 ;81ED5A|A900    |      ;
    XBA                                                        ;81ED5C|EB      |      ;
    LDA.W $09A1                                                ;81ED5D|ADA109  |0009A1;
    LDX.W #$0000                                               ;81ED60|A20000  |      ;
    LDY.W #$0024                                               ;81ED63|A02400  |      ;
    JSL.L fAI_Unknown84803F                                    ;81ED66|223F8084|84803F;
    SEP #$20                                                   ;81ED6A|E220    |      ;
    LDA.B #$00                                                 ;81ED6C|A900    |      ;
    XBA                                                        ;81ED6E|EB      |      ;
    LDA.W $09A1                                                ;81ED6F|ADA109  |0009A1;
    SEC                                                        ;81ED72|38      |      ;
    SBC.B #$24                                                 ;81ED73|E924    |      ;
    REP #$20                                                   ;81ED75|C220    |      ;
    JSL.L fGameEngine_GetChickenData                           ;81ED77|2295C983|83C995;
    SEP #$20                                                   ;81ED7B|E220    |      ;
    LDY.W #$0000                                               ;81ED7D|A00000  |      ;
    LDA.B #$00                                                 ;81ED80|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;81ED82|9772    |000072;
    SEP #$20                                                   ;81ED84|E220    |      ;
    LDA.L nOwnedChickens                                       ;81ED86|AF0B1F7F|7F1F0B;
    DEC A                                                      ;81ED8A|3A      |      ;
    STA.L nOwnedChickens                                       ;81ED8B|8F0B1F7F|7F1F0B;
    SEP #$20                                                   ;81ED8F|E220    |      ;
    LDA.B #$04                                                 ;81ED91|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81ED93|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81ED96|9C7009  |000970;
    REP #$20                                                   ;81ED99|C220    |      ;
    LDA.W #$FFEC                                               ;81ED9B|A9ECFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81ED9E|2282B283|83B282;
    JMP.W .return                                              ;81EDA2|4CACEF  |81EFAC;
 
 
.case4:
    SEP #$20                                                   ;81EDA5|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EDA7|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EDAA|AD7009  |000970;
    CMP.B #$42                                                 ;81EDAD|C942    |      ;
    BEQ +                                                      ;81EDAF|F003    |81EDB4;
    JMP.W .return                                              ;81EDB1|4CACEF  |81EFAC;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81EDB4|9C7009  |000970;
    REP #$20                                                   ;81EDB7|C220    |      ;
    %CheckFlag(daily4, $1000)
    BEQ +                                                      ;81EDC0|F003    |81EDC5;
    JMP.W .loop                                                ;81EDC2|4C64EC  |81EC64;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81EDD1|4CACEF  |81EFAC;
 
 
.case5:
    SEP #$20                                                   ;81EDD4|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EDD6|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EDD9|C902    |      ;
    BNE +                                                      ;81EDDB|D003    |81EDE0;
    JMP.W .return                                              ;81EDDD|4CACEF  |81EFAC;
 
 
  + REP #$20                                                   ;81EDE0|C220    |      ;
    LDA.W #$0007                                               ;81EDE2|A90700  |      ;
    JSL.L fAI_Unknown848020                                    ;81EDE5|22208084|848020;
    REP #$20                                                   ;81EDE9|C220    |      ;
    %AIExecute($0007, $0000, $0023)
    SEP #$20                                                   ;81EDF8|E220    |      ;
    LDA.B #$06                                                 ;81EDFA|A906    |      ;
    STA.W nPlayerInteractionArg1                               ;81EDFC|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EDFF|9C7009  |000970;
    JMP.W .return                                              ;81EE02|4CACEF  |81EFAC;
 
 
.case6:
    SEP #$20                                                   ;81EE05|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EE07|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EE0A|AD7009  |000970;
    CMP.B #$42                                                 ;81EE0D|C942    |      ;
    BEQ +                                                      ;81EE0F|F003    |81EE14;
    JMP.W .return                                              ;81EE11|4CACEF  |81EFAC;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$20                                                   ;81EE20|C220    |      ;
    %CheckFlag(daily4, $1000)
    BEQ +                                                      ;81EE29|F003    |81EE2E;
    JMP.W .return                                              ;81EE2B|4CACEF  |81EFAC;
 
 
  + SEP #$20                                                   ;81EE2E|E220    |      ;
    LDA.B #$00                                                 ;81EE30|A900    |      ;
    XBA                                                        ;81EE32|EB      |      ;
    LDA.W $09A1                                                ;81EE33|ADA109  |0009A1;
    JSL.L fAI_SetCCPointer                                     ;81EE36|227C8884|84887C;
    SEP #$20                                                   ;81EE3A|E220    |      ;
    REP #$10                                                   ;81EE3C|C210    |      ;
    LDY.W #$0001                                               ;81EE3E|A00100  |      ;
    LDA.B [ptrAIUnknown0xCC],Y                                 ;81EE41|B7CC    |0000CC;
    ORA.B #$A8                                                 ;81EE43|09A8    |      ;
    SEP #$20                                                   ;81EE45|E220    |      ;
    REP #$10                                                   ;81EE47|C210    |      ;
    LDY.W #$0001                                               ;81EE49|A00100  |      ;
    STA.B [ptrAIUnknown0xCC],Y                                 ;81EE4C|97CC    |0000CC;
    JMP.W .return                                              ;81EE4E|4CACEF  |81EFAC;
 
 
.case7:
    SEP #$20                                                   ;81EE51|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EE53|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EE56|AD7009  |000970;
    CMP.B #$42                                                 ;81EE59|C942    |      ;
    BEQ +                                                      ;81EE5B|F003    |81EE60;
    JMP.W .return                                              ;81EE5D|4CACEF  |81EFAC;
 
 
  + LDX.W #$0148                                               ;81EE60|A24801  |      ;
    SEP #$20                                                   ;81EE63|E220    |      ;
    LDA.B #$02                                                 ;81EE65|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EE67|8D9A01  |00019A;
    LDA.B #$00                                                 ;81EE6A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EE6C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EE6F|225F9383|83935F;
    SEP #$20                                                   ;81EE73|E220    |      ;
    LDA.B #$08                                                 ;81EE75|A908    |      ;
    STA.W nPlayerInteractionArg1                               ;81EE77|8D6F09  |00096F;
    JMP.W .return                                              ;81EE7A|4CACEF  |81EFAC;
 
 
.case8:
    SEP #$20                                                   ;81EE7D|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EE7F|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EE82|C902    |      ;
    BNE +                                                      ;81EE84|D003    |81EE89;
    JMP.W .return                                              ;81EE86|4CACEF  |81EFAC;
 
 
  + SEP #$20                                                   ;81EE89|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81EE8B|AD8F01  |00018F;
    BNE +                                                      ;81EE8E|D01D    |81EEAD;
    SEP #$20                                                   ;81EE90|E220    |      ;
    LDA.B #$02                                                 ;81EE92|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EE94|8D9A01  |00019A;
    LDX.W #$014A                                               ;81EE97|A24A01  |      ;
    LDA.B #$00                                                 ;81EE9A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EE9C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EE9F|225F9383|83935F;
    SEP #$20                                                   ;81EEA3|E220    |      ;
    LDA.B #$09                                                 ;81EEA5|A909    |      ;
    STA.W nPlayerInteractionArg1                               ;81EEA7|8D6F09  |00096F;
    JMP.W .return                                              ;81EEAA|4CACEF  |81EFAC;
 
 
  + SEP #$20                                                   ;81EEAD|E220    |      ;
    LDA.B #$02                                                 ;81EEAF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81EEB1|8D9A01  |00019A;
    LDX.W #$014C                                               ;81EEB4|A24C01  |      ;
    LDA.B #$00                                                 ;81EEB7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81EEB9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81EEBC|225F9383|83935F;
    SEP #$20                                                   ;81EEC0|E220    |      ;
    LDA.B #$0A                                                 ;81EEC2|A90A    |      ;
    STA.W nPlayerInteractionArg1                               ;81EEC4|8D6F09  |00096F;
    JMP.W .return                                              ;81EEC7|4CACEF  |81EFAC;
 
 
.case9:
    SEP #$20                                                   ;81EECA|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EECC|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EECF|C902    |      ;
    BNE +                                                      ;81EED1|D003    |81EED6;
    JMP.W .return                                              ;81EED3|4CACEF  |81EFAC;
 
 
  + REP #$20                                                   ;81EED6|C220    |      ;
    LDA.W #$0008                                               ;81EED8|A90800  |      ;
    JSL.L fAI_Unknown848020                                    ;81EEDB|22208084|848020;
    REP #$20                                                   ;81EEDF|C220    |      ;
    %AIExecute($0008, $0000, $007D)
    SEP #$20                                                   ;81EEEE|E220    |      ;
    LDA.B #$00                                                 ;81EEF0|A900    |      ;
    XBA                                                        ;81EEF2|EB      |      ;
    LDA.W $09A1                                                ;81EEF3|ADA109  |0009A1;
    LDX.W #$0000                                               ;81EEF6|A20000  |      ;
    LDY.W #$0024                                               ;81EEF9|A02400  |      ;
    JSL.L fAI_Unknown84803F                                    ;81EEFC|223F8084|84803F;
    SEP #$20                                                   ;81EF00|E220    |      ;
    LDA.B #$00                                                 ;81EF02|A900    |      ;
    XBA                                                        ;81EF04|EB      |      ;
    LDA.W $09A1                                                ;81EF05|ADA109  |0009A1;
    SEC                                                        ;81EF08|38      |      ;
    SBC.B #$24                                                 ;81EF09|E924    |      ;
    REP #$20                                                   ;81EF0B|C220    |      ;
    JSL.L fGameEngine_GetChickenData                           ;81EF0D|2295C983|83C995;
    SEP #$20                                                   ;81EF11|E220    |      ;
    LDY.W #$0000                                               ;81EF13|A00000  |      ;
    LDA.B #$00                                                 ;81EF16|A900    |      ;
    STA.B [ptrTemp0x72],Y                                      ;81EF18|9772    |000072;
    SEP #$20                                                   ;81EF1A|E220    |      ;
    LDA.L nOwnedChickens                                       ;81EF1C|AF0B1F7F|7F1F0B;
    DEC A                                                      ;81EF20|3A      |      ;
    STA.L nOwnedChickens                                       ;81EF21|8F0B1F7F|7F1F0B;
    SEP #$20                                                   ;81EF25|E220    |      ;
    LDA.B #$04                                                 ;81EF27|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81EF29|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EF2C|9C7009  |000970;
    REP #$30                                                   ;81EF2F|C230    |      ;
    LDY.W #$0004                                               ;81EF31|A00400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81EF34|B772    |000072;
    STA.W nTileInFrontOfPlayerX                                ;81EF36|8D8509  |000985;
    LDY.W #$0006                                               ;81EF39|A00600  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;81EF3C|B772    |000072;
    STA.W nTileInFrontOfPlayerY                                ;81EF3E|8D8709  |000987;
    LDA.W #$0010                                               ;81EF41|A91000  |      ;
    LDX.W #$0000                                               ;81EF44|A20000  |      ;
    LDY.W #$001F                                               ;81EF47|A01F00  |      ;
    JSL.L fAI_Unknown8480F8                                    ;81EF4A|22F88084|8480F8;
    REP #$30                                                   ;81EF4E|C230    |      ;
    LDA.W #$FFEC                                               ;81EF50|A9ECFF  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81EF53|2282B283|83B282;
    REP #$20                                                   ;81EF57|C220    |      ;
    %SetFlag(daily4, $1000)
    JMP.W .return                                              ;81EF64|4CACEF  |81EFAC;
 
 
.caseA:
    SEP #$20                                                   ;81EF67|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81EF69|AD9A01  |00019A;
    CMP.B #$02                                                 ;81EF6C|C902    |      ;
    BNE +                                                      ;81EF6E|D003    |81EF73;
    JMP.W .return                                              ;81EF70|4CACEF  |81EFAC;
 
 
  + REP #$20                                                   ;81EF73|C220    |      ;
    LDA.W #$0008                                               ;81EF75|A90800  |      ;
    JSL.L fAI_Unknown848020                                    ;81EF78|22208084|848020;
    REP #$20                                                   ;81EF7C|C220    |      ;
    %AIExecute($0008, $0000, $007D)
    SEP #$20                                                   ;81EF8B|E220    |      ;
    LDA.B #$0B                                                 ;81EF8D|A90B    |      ;
    STA.W nPlayerInteractionArg1                               ;81EF8F|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EF92|9C7009  |000970;
    BRA .return                                                ;81EF95|8015    |81EFAC;
 
 
.caseB:
    SEP #$20                                                   ;81EF97|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EF99|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EF9C|AD7009  |000970;
    CMP.B #$42                                                 ;81EF9F|C942    |      ;
    BEQ +                                                      ;81EFA1|F003    |81EFA6;
    JMP.W .return                                              ;81EFA3|4CACEF  |81EFAC;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81EFA6|9C7009  |000970;
    JMP.W .loop                                                ;81EFA9|4C64EC  |81EC64;
 
 
.return:
    RTS                                                        ;81EFAC|60      |      ;
 
 
fPlayerInteraction0x45:
    SEP #$20                                                   ;81EFAD|E220    |      ;
    REP #$10                                                   ;81EFAF|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81EFB1|AD6F09  |00096F;
    CMP.B #$01                                                 ;81EFB4|C901    |      ;
    BEQ .case1                                                 ;81EFB6|F029    |81EFE1;
    CMP.B #$02                                                 ;81EFB8|C902    |      ;
    BEQ .case2                                                 ;81EFBA|F057    |81F013;
    CMP.B #$03                                                 ;81EFBC|C903    |      ;
    BEQ .case3                                                 ;81EFBE|F06F    |81F02F;
    CMP.B #$04                                                 ;81EFC0|C904    |      ;
    BNE .checks                                                ;81EFC2|D003    |81EFC7;
    JMP.W .case4                                               ;81EFC4|4C54F0  |81F054;
 
 
.checks:
    SEP #$20                                                   ;81EFC7|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81EFC9|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81EFCC|AD7009  |000970;
    CMP.B #$08                                                 ;81EFCF|C908    |      ;
    BEQ +                                                      ;81EFD1|F003    |81EFD6;
    JMP.W .return                                              ;81EFD3|4C60F0  |81F060;
 
 
  + LDA.B #$01                                                 ;81EFD6|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81EFD8|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81EFDB|9C7009  |000970;
    JMP.W .return                                              ;81EFDE|4C60F0  |81F060;
 
 
.case1:
    %SetPlayerFlag(!PFLAGS_INTRANSITION)
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_LEFT)
    %SetObjectDirection(!PDIR_LEFT)
    SEP #$20                                                   ;81F000|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F002|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F005|AD7009  |000970;
    CMP.B #$20                                                 ;81F008|C920    |      ;
    BNE .return                                                ;81F00A|D054    |81F060;
    LDA.B #$02                                                 ;81F00C|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F00E|8D6F09  |00096F;
    BRA .return                                                ;81F011|804D    |81F060;
 
 
.case2:
    SEP #$20                                                   ;81F013|E220    |      ;
    LDX.W #$0317                                               ;81F015|A21703  |      ;
    LDA.B #$02                                                 ;81F018|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F01A|8D9A01  |00019A;
    LDA.B #$00                                                 ;81F01D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F01F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F022|225F9383|83935F;
    SEP #$20                                                   ;81F026|E220    |      ;
    LDA.B #$03                                                 ;81F028|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F02A|8D6F09  |00096F;
    BRA .return                                                ;81F02D|8031    |81F060;
 
 
.case3:
    SEP #$20                                                   ;81F02F|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F031|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F034|C902    |      ;
    BNE +                                                      ;81F036|D003    |81F03B;
    JMP.W .return                                              ;81F038|4C60F0  |81F060;
 
 
  + SEP #$20                                                   ;81F03B|E220    |      ;
    LDA.B #$04                                                 ;81F03D|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81F03F|8D6F09  |00096F;
    LDA.B #$02                                                 ;81F042|A902    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;81F044|8D9F09  |00099F;
    REP #$20                                                   ;81F047|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;81F049|AD9601  |000196;
    ORA.W #$2000                                               ;81F04C|090020  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;81F04F|8D9601  |000196;
    BRA .return                                                ;81F052|800C    |81F060;
 
 
.case4:
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
.return:
    RTS                                                        ;81F060|60      |      ;
 
 
fPlayerInteraction0x46:
    SEP #$20                                                   ;81F061|E220    |      ;
    REP #$10                                                   ;81F063|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F065|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F068|C901    |      ;
    BEQ .case1                                                 ;81F06A|F027    |81F093;
    CMP.B #$02                                                 ;81F06C|C902    |      ;
    BNE +                                                      ;81F06E|D003    |81F073;
    JMP.W .case2                                               ;81F070|4CD2F0  |81F0D2;
 
 
  + CMP.B #$03                                                 ;81F073|C903    |      ;
    BNE +                                                      ;81F075|D003    |81F07A;
    JMP.W .case3                                               ;81F077|4C03F1  |81F103;
 
 
  + REP #$20                                                   ;81F07A|C220    |      ;
    %AIExecute($0006, $0000, $0026)
    SEP #$20                                                   ;81F089|E220    |      ;
    LDA.B #$01                                                 ;81F08B|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F08D|8D6F09  |00096F;
    JMP.W .return                                              ;81F090|4C20F1  |81F120;
 
 
.case1:
    SEP #$20                                                   ;81F093|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F095|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F098|AD7009  |000970;
    CMP.B #$42                                                 ;81F09B|C942    |      ;
    BEQ +                                                      ;81F09D|F003    |81F0A2;
    JMP.W .return                                              ;81F09F|4C20F1  |81F120;
 
 
  + SEP #$20                                                   ;81F0A2|E220    |      ;
    LDA.B #$02                                                 ;81F0A4|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F0A6|8D9A01  |00019A;
    LDX.W #$031A                                               ;81F0A9|A21A03  |      ;
    REP #$20                                                   ;81F0AC|C220    |      ;
    LDA.L nShippingProfit                                      ;81F0AE|AF071F7F|7F1F07;
    BNE +                                                      ;81F0B2|D00B    |81F0BF;
    SEP #$20                                                   ;81F0B4|E220    |      ;
    LDA.L nShippingProfit+2                                    ;81F0B6|AF091F7F|7F1F09;
    BNE +                                                      ;81F0BA|D003    |81F0BF;
    LDX.W #$031B                                               ;81F0BC|A21B03  |      ;
 
  + LDA.B #$00                                                 ;81F0BF|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F0C1|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F0C4|225F9383|83935F;
    SEP #$20                                                   ;81F0C8|E220    |      ;
    LDA.B #$02                                                 ;81F0CA|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F0CC|8D6F09  |00096F;
    JMP.W .return                                              ;81F0CF|4C20F1  |81F120;
 
 
.case2:
    SEP #$20                                                   ;81F0D2|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F0D4|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F0D7|C902    |      ;
    BNE +                                                      ;81F0D9|D003    |81F0DE;
    JMP.W .return                                              ;81F0DB|4C20F1  |81F120;
 
 
  + REP #$20                                                   ;81F0DE|C220    |      ;
    LDA.W #$0006                                               ;81F0E0|A90600  |      ;
    JSL.L fAI_Unknown848020                                    ;81F0E3|22208084|848020;
    REP #$20                                                   ;81F0E7|C220    |      ;
    %AIExecute($0006, $0000, $0027)
    SEP #$20                                                   ;81F0F6|E220    |      ;
    LDA.B #$03                                                 ;81F0F8|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F0FA|8D6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;81F0FD|9C7009  |000970;
    JMP.W .return                                              ;81F100|4C20F1  |81F120;
 
 
.case3:
    SEP #$20                                                   ;81F103|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F105|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F108|AD7009  |000970;
    CMP.B #$42                                                 ;81F10B|C942    |      ;
    BEQ +                                                      ;81F10D|F003    |81F112;
    JMP.W .return                                              ;81F10F|4C20F1  |81F120;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA .return                                                ;81F11E|8000    |81F120;
 
 
.return:
    RTS                                                        ;81F120|60      |      ;
 
 
fPlayerInteraction0x47:
    SEP #$20                                                   ;81F121|E220    |      ;
    REP #$10                                                   ;81F123|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F125|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F128|C901    |      ;
    BNE +                                                      ;81F12A|D003    |81F12F;
    JMP.W .case1                                               ;81F12C|4CCEF1  |81F1CE;
 
 
  + CMP.B #$02                                                 ;81F12F|C902    |      ;
    BNE +                                                      ;81F131|D003    |81F136;
    JMP.W .case2                                               ;81F133|4CF3F1  |81F1F3;
 
 
  + CMP.B #$03                                                 ;81F136|C903    |      ;
    BNE +                                                      ;81F138|D003    |81F13D;
    JMP.W .case3                                               ;81F13A|4C11F2  |81F211;
 
 
  + SEP #$20                                                   ;81F13D|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F13F|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F142|AD7009  |000970;
    CMP.B #$20                                                 ;81F145|C920    |      ;
    BEQ .checks                                                ;81F147|F003    |81F14C;
    JMP.W .justReturn                                          ;81F149|4CD9F2  |81F2D9;
 
 
.checks:
    SEP #$20                                                   ;81F14C|E220    |      ;
    LDA.L nCurrentYearID                                       ;81F14E|AF181F7F|7F1F18;
    BNE .year1andFall                                          ;81F152|D015    |81F169;
    LDA.L nCurrentSeasonID                                     ;81F154|AF191F7F|7F1F19;
    CMP.B #!SEASON_FALL                                                 
    BCS .year1andFall                                          ;81F15A|B00D    |81F169;
    REP #$20                                                   ;81F15C|C220    |      ;
    %SetFlag(event7, $0004)
 
.year1andFall:
    SEP #$20                                                   ;81F169|E220    |      ; If we expand house in year 1 before Fall we get clock
    STZ.W nPlayerInteractionArg2                               ;81F16B|9C7009  |000970;
    REP #$20                                                   ;81F16E|C220    |      ;
    LDA.L nReqWoodForExpansion                                 ;81F170|AF0E1F7F|7F1F0E;
    CMP.W #$00FA                                               ;81F174|C9FA00  |      ;
    BEQ .firstUpgrade                                          ;81F177|F010    |81F189;
    REP #$20                                                   ;81F179|C220    |      ;
    LDA.L nStoredWood                                          ;81F17B|AF0C1F7F|7F1F0C;
    CMP.W #$01F4                                               ;81F17F|C9F401  |      ;
    BCC .upgrade                                               ;81F182|902D    |81F1B1;
    LDX.W #$013B                                               ;81F184|A23B01  |      ;
    BRA .notEnoughWood                                         ;81F187|800E    |81F197;
 
 
.firstUpgrade:
    REP #$20                                                   ;81F189|C220    |      ;
    LDA.L nStoredWood                                          ;81F18B|AF0C1F7F|7F1F0C;
    CMP.W #$00FA                                               ;81F18F|C9FA00  |      ;
    BCC .upgrade                                               ;81F192|901D    |81F1B1;
    LDX.W #$0134                                               ;81F194|A23401  |      ;
 
.notEnoughWood:
    SEP #$20                                                   ;81F197|E220    |      ;
    LDA.B #$02                                                 ;81F199|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F19B|8D9A01  |00019A;
    LDA.B #$00                                                 ;81F19E|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F1A0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F1A3|225F9383|83935F;
    SEP #$20                                                   ;81F1A7|E220    |      ;
    LDA.B #$03                                                 ;81F1A9|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F1AB|8D6F09  |00096F;
    JMP.W .justReturn                                          ;81F1AE|4CD9F2  |81F2D9;
 
 
.upgrade:
    SEP #$20                                                   ;81F1B1|E220    |      ;
    LDA.B #$02                                                 ;81F1B3|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F1B5|8D9A01  |00019A;
    LDX.W #$0137                                               ;81F1B8|A23701  |      ;
    LDA.B #$00                                                 ;81F1BB|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F1BD|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F1C0|225F9383|83935F;
    SEP #$20                                                   ;81F1C4|E220    |      ;
    LDA.B #$01                                                 ;81F1C6|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F1C8|8D6F09  |00096F;
    JMP.W .justReturn                                          ;81F1CB|4CD9F2  |81F2D9;
 
 
.case1:
    SEP #$20                                                   ;81F1CE|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F1D0|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F1D3|C902    |      ;
    BNE +                                                      ;81F1D5|D003    |81F1DA;
    JMP.W .justReturn                                          ;81F1D7|4CD9F2  |81F2D9;
 
 
  + REP #$20                                                   ;81F1DA|C220    |      ;
    LDA.W #$0009                                               ;81F1DC|A90900  |      ;
    LDX.W #$0000                                               ;81F1DF|A20000  |      ;
    LDY.W #$002D                                               ;81F1E2|A02D00  |      ;
    JSL.L fAI_Unknown84803F                                    ;81F1E5|223F8084|84803F;
    SEP #$20                                                   ;81F1E9|E220    |      ;
    LDA.B #$02                                                 ;81F1EB|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F1ED|8D6F09  |00096F;
    JMP.W .justReturn                                          ;81F1F0|4CD9F2  |81F2D9;
 
 
.case2:
    SEP #$20                                                   ;81F1F3|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F1F5|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F1F8|AD7009  |000970;
    CMP.B #$C6                                                 ;81F1FB|C9C6    |      ;
    BEQ +                                                      ;81F1FD|F003    |81F202;
    JMP.W .justReturn                                          ;81F1FF|4CD9F2  |81F2D9;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F20E|4CD9F2  |81F2D9;
 
 
.case3:
    SEP #$20                                                   ;81F211|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F213|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F216|C902    |      ;
    BNE +                                                      ;81F218|D003    |81F21D;
    JMP.W .justReturn                                          ;81F21A|4CD9F2  |81F2D9;
 
 
  + SEP #$20                                                   ;81F21D|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81F21F|AD8F01  |00018F;
    BEQ +                                                      ;81F222|F003    |81F227;
    JMP.W .return                                              ;81F224|4CBDF2  |81F2BD;
 
 
  + REP #$30                                                   ;81F227|C230    |      ;
    LDA.L nReqWoodForExpansion                                 ;81F229|AF0E1F7F|7F1F0E;
    CMP.W #$00FA                                               ;81F22D|C9FA00  |      ;
    BEQ .label1                                                ;81F230|F01A    |81F24C;
    REP #$20                                                   ;81F232|C220    |      ;
    LDA.W #$FC18                                               ;81F234|A918FC  |      ;
    STA.B ptrTemp0x72                                          ;81F237|8572    |000072;
    SEP #$20                                                   ;81F239|E220    |      ;
    LDA.B #$FF                                                 ;81F23B|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81F23D|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81F23F|22C9B183|83B1C9;
    REP #$20                                                   ;81F243|C220    |      ;
    CMP.W #$0000                                               ;81F245|C90000  |      ;
    BNE .label3                                                ;81F248|D057    |81F2A1;
    BRA .label2                                                ;81F24A|8018    |81F264;
 
 
.label1:
    REP #$20                                                   ;81F24C|C220    |      ;
    LDA.W #$FE0C                                               ;81F24E|A90CFE  |      ;
    STA.B ptrTemp0x72                                          ;81F251|8572    |000072;
    SEP #$20                                                   ;81F253|E220    |      ;
    LDA.B #$FF                                                 ;81F255|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81F257|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81F259|22C9B183|83B1C9;
    REP #$20                                                   ;81F25D|C220    |      ;
    CMP.W #$0000                                               ;81F25F|C90000  |      ;
    BNE .label3                                                ;81F262|D03D    |81F2A1;
 
.label2:
    REP #$30                                                   ;81F264|C230    |      ;
    LDA.L nReqWoodForExpansion                                 ;81F266|AF0E1F7F|7F1F0E;
    EOR.W #$FFFF                                               ;81F26A|49FFFF  |      ;
    INC A                                                      ;81F26D|1A      |      ;
    JSL.L fGameEngine_AddWood                                  ;81F26E|2224B283|83B224;
    SEP #$20                                                   ;81F272|E220    |      ;
    LDA.B #$02                                                 ;81F274|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F276|8D9A01  |00019A;
    LDX.W #$0135                                               ;81F279|A23501  |      ;
    LDA.B #$00                                                 ;81F27C|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F27E|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F281|225F9383|83935F;
    SEP #$20                                                   ;81F285|E220    |      ;
    LDA.B #$01                                                 ;81F287|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F289|8D6F09  |00096F;
    LDA.B #$00                                                 ;81F28C|A900    |      ;
    STA.L nConstructionDayCounter                              ;81F28E|8F351F7F|7F1F35;
    REP #$20                                                   ;81F292|C220    |      ;
    %SetFlag(event2, $0080)
    BRA .justReturn                                            ;81F29F|8038    |81F2D9;
 
 
.label3:
    SEP #$20                                                   ;81F2A1|E220    |      ;
    LDA.B #$02                                                 ;81F2A3|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F2A5|8D9A01  |00019A;
    LDX.W #$0304                                               ;81F2A8|A20403  |      ;
    LDA.B #$00                                                 ;81F2AB|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F2AD|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F2B0|225F9383|83935F;
    SEP #$20                                                   ;81F2B4|E220    |      ;
    LDA.B #$01                                                 ;81F2B6|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F2B8|8D6F09  |00096F;
    BRA .justReturn                                            ;81F2BB|801C    |81F2D9;
 
 
.return:
    SEP #$20                                                   ;81F2BD|E220    |      ;
    LDA.B #$02                                                 ;81F2BF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F2C1|8D9A01  |00019A;
    LDX.W #$0136                                               ;81F2C4|A23601  |      ;
    LDA.B #$00                                                 ;81F2C7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F2C9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F2CC|225F9383|83935F;
    SEP #$20                                                   ;81F2D0|E220    |      ;
    LDA.B #$01                                                 ;81F2D2|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F2D4|8D6F09  |00096F;
    BRA .justReturn                                            ;81F2D7|8000    |81F2D9;
 
 
.justReturn:
    RTS                                                        ;81F2D9|60      |      ;
 
 
fPlayerInteraction0x48:
    SEP #$20                                                   ;81F2DA|E220    |      ;
    REP #$10                                                   ;81F2DC|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F2DE|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F2E1|C901    |      ;
    BEQ .case1                                                 ;81F2E3|F063    |81F348;
    CMP.B #$02                                                 ;81F2E5|C902    |      ;
    BNE +                                                      ;81F2E7|D003    |81F2EC;
    JMP.W .case2                                               ;81F2E9|4CBBF3  |81F3BB;
 
 
  + CMP.B #$03                                                 ;81F2EC|C903    |      ;
    BNE +                                                      ;81F2EE|D003    |81F2F3;
    JMP.W .case3                                               ;81F2F0|4CD9F3  |81F3D9;
 
 
  + SEP #$20                                                   ;81F2F3|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F2F5|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F2F8|AD7009  |000970;
    CMP.B #$20                                                 ;81F2FB|C920    |      ;
    BEQ +                                                      ;81F2FD|F003    |81F302;
    JMP.W .return                                              ;81F2FF|4C0DF4  |81F40D;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81F302|9C7009  |000970;
    REP #$20                                                   ;81F305|C220    |      ;
    %CheckFlag(event1, $0080)
    BNE .label1                                                ;81F30E|D010    |81F320;
    REP #$30                                                   ;81F310|C230    |      ;
    LDA.W #$0032                                               ;81F312|A93200  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81F315|2282B283|83B282;
    REP #$30                                                   ;81F319|C230    |      ;
    LDX.W #$013D                                               ;81F31B|A23D01  |      ;
    BRA .label2                                                ;81F31E|800E    |81F32E;
 
 
.label1:
    REP #$30                                                   ;81F320|C230    |      ;
    LDA.W #$0064                                               ;81F322|A96400  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81F325|2282B283|83B282;
    REP #$30                                                   ;81F329|C230    |      ;
    LDX.W #$0140                                               ;81F32B|A24001  |      ;
 
.label2:
    SEP #$20                                                   ;81F32E|E220    |      ;
    LDA.B #$02                                                 ;81F330|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F332|8D9A01  |00019A;
    LDA.B #$00                                                 ;81F335|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F337|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F33A|225F9383|83935F;
    SEP #$20                                                   ;81F33E|E220    |      ;
    LDA.B #$01                                                 ;81F340|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F342|8D6F09  |00096F;
    JMP.W .return                                              ;81F345|4C0DF4  |81F40D;
 
 
.case1:
    SEP #$20                                                   ;81F348|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F34A|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F34D|C902    |      ;
    BNE .obtainClock                                           ;81F34F|D003    |81F354;
    JMP.W .return                                              ;81F351|4C0DF4  |81F40D;
 
 
.obtainClock:
    REP #$20                                                   ;81F354|C220    |      ;
    %CheckFlag(event1, $0080)
    BNE +                                                      ;81F35D|D034    |81F393;
    SEP #$20                                                   ;81F35F|E220    |      ;
    REP #$20                                                   ;81F361|C220    |      ;
    %CheckFlag(event7, $0004)
    BEQ +                                                      ;81F36A|F027    |81F393;
    %SetFlag(event6, $4000)
    SEP #$20                                                   ;81F377|E220    |      ;
    LDA.B #$02                                                 ;81F379|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F37B|8D9A01  |00019A;
    LDX.W #$025C                                               ;81F37E|A25C02  |      ;
    LDA.B #$00                                                 ;81F381|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F383|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F386|225F9383|83935F;
    SEP #$20                                                   ;81F38A|E220    |      ;
    LDA.B #$03                                                 ;81F38C|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F38E|8D6F09  |00096F;
    BRA .return                                                ;81F391|807A    |81F40D;
 
 
  + REP #$20                                                   ;81F393|C220    |      ;
    LDA.W #$0009                                               ;81F395|A90900  |      ;
    LDX.W #$0000                                               ;81F398|A20000  |      ;
    LDY.W #$0038                                               ;81F39B|A03800  |      ;
    JSL.L fAI_Unknown84803F                                    ;81F39E|223F8084|84803F;
    REP #$20                                                   ;81F3A2|C220    |      ;
    LDA.W #$000A                                               ;81F3A4|A90A00  |      ;
    LDX.W #$0000                                               ;81F3A7|A20000  |      ;
    LDY.W #$0039                                               ;81F3AA|A03900  |      ;
    JSL.L fAI_Unknown84803F                                    ;81F3AD|223F8084|84803F;
    SEP #$20                                                   ;81F3B1|E220    |      ;
    LDA.B #$02                                                 ;81F3B3|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F3B5|8D6F09  |00096F;
    JMP.W .return                                              ;81F3B8|4C0DF4  |81F40D;
 
 
.case2:
    SEP #$20                                                   ;81F3BB|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F3BD|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F3C0|AD7009  |000970;
    CMP.B #$C6                                                 ;81F3C3|C9C6    |      ;
    BEQ +                                                      ;81F3C5|F003    |81F3CA;
    JMP.W .return                                              ;81F3C7|4C0DF4  |81F40D;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81F3D6|4C0DF4  |81F40D;
 
 
.case3:
    SEP #$20                                                   ;81F3D9|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F3DB|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F3DE|C902    |      ;
    BNE +                                                      ;81F3E0|D003    |81F3E5;
    JMP.W .return                                              ;81F3E2|4C0DF4  |81F40D;
 
 
  + REP #$20                                                   ;81F3E5|C220    |      ;
    LDA.W #$0009                                               ;81F3E7|A90900  |      ;
    LDX.W #$0000                                               ;81F3EA|A20000  |      ;
    LDY.W #$0038                                               ;81F3ED|A03800  |      ;
    JSL.L fAI_Unknown84803F                                    ;81F3F0|223F8084|84803F;
    REP #$20                                                   ;81F3F4|C220    |      ;
    LDA.W #$000A                                               ;81F3F6|A90A00  |      ;
    LDX.W #$0000                                               ;81F3F9|A20000  |      ;
    LDY.W #$0039                                               ;81F3FC|A03900  |      ;
    JSL.L fAI_Unknown84803F                                    ;81F3FF|223F8084|84803F;
    SEP #$20                                                   ;81F403|E220    |      ;
    LDA.B #$02                                                 ;81F405|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F407|8D6F09  |00096F;
    JMP.W .return                                              ;81F40A|4C0DF4  |81F40D;
 
 
.return:
    RTS                                                        ;81F40D|60      |      ;
 
 
fPlayerInteraction0x49:
    SEP #$20                                                   ;81F40E|E220    |      ;
    REP #$10                                                   ;81F410|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F412|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F415|C901    |      ;
    BEQ .case1                                                 ;81F417|F033    |81F44C;
    CMP.B #$02                                                 ;81F419|C902    |      ;
    BEQ .case2                                                 ;81F41B|F054    |81F471;
    SEP #$20                                                   ;81F41D|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F41F|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F422|AD7009  |000970;
    CMP.B #$20                                                 ;81F425|C920    |      ;
    BEQ +                                                      ;81F427|F003    |81F42C;
    JMP.W .return                                              ;81F429|4C8FF4  |81F48F;
 
 
  + STZ.W nPlayerInteractionArg2                               ;81F42C|9C7009  |000970;
    SEP #$20                                                   ;81F42F|E220    |      ;
    LDA.B #$02                                                 ;81F431|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F433|8D9A01  |00019A;
    LDX.W #$0300                                               ;81F436|A20003  |      ;
    LDA.B #$00                                                 ;81F439|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F43B|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F43E|225F9383|83935F;
    SEP #$20                                                   ;81F442|E220    |      ;
    LDA.B #$01                                                 ;81F444|A901    |      ;
    STA.W nPlayerInteractionArg1                               ;81F446|8D6F09  |00096F;
    JMP.W .return                                              ;81F449|4C8FF4  |81F48F;
 
 
.case1:
    SEP #$20                                                   ;81F44C|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F44E|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F451|C902    |      ;
    BNE +                                                      ;81F453|D003    |81F458;
    JMP.W .return                                              ;81F455|4C8FF4  |81F48F;
 
 
  + REP #$20                                                   ;81F458|C220    |      ;
    LDA.W #$000B                                               ;81F45A|A90B00  |      ;
    LDX.W #$0000                                               ;81F45D|A20000  |      ;
    LDY.W #$001E                                               ;81F460|A01E00  |      ;
    JSL.L fAI_Unknown84803F                                    ;81F463|223F8084|84803F;
    SEP #$20                                                   ;81F467|E220    |      ;
    LDA.B #$02                                                 ;81F469|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F46B|8D6F09  |00096F;
    JMP.W .return                                              ;81F46E|4C8FF4  |81F48F;
 
 
.case2:
    SEP #$20                                                   ;81F471|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F473|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F476|AD7009  |000970;
    CMP.B #$C6                                                 ;81F479|C9C6    |      ;
    BEQ +                                                      ;81F47B|F003    |81F480;
    JMP.W .return                                              ;81F47D|4C8FF4  |81F48F;
 
 
  + %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .return                                              ;81F48C|4C8FF4  |81F48F;
 
 
.return:
    RTS                                                        ;81F48F|60      |      ;
 
 
fPlayerInteraction0x4A:
    REP #$30                                                   ;81F490|C230    |      ;
    LDA.W #$00FB                                               ;81F492|A9FB00  |      ;
    LDX.W #$0010                                               ;81F495|A21000  |      ;
    STX.W $09AD                                                ;81F498|8EAD09  |0009AD;
    LDY.W #$0030                                               ;81F49B|A03000  |      ;
    STY.W $09AF                                                ;81F49E|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F4A1|2288A681|81A688;
    REP #$30                                                   ;81F4A5|C230    |      ;
    LDA.W #$0001                                               ;81F4A7|A90100  |      ;
    JMP.W fPlayerInteraction_Return                            ;81F4AA|4C56F5  |81F556;
 
 
fPlayerInteraction0x4B:
    REP #$30                                                   ;81F4AD|C230    |      ;
    LDA.W #$00FB                                               ;81F4AF|A9FB00  |      ;
    LDX.W #$00B0                                               ;81F4B2|A2B000  |      ;
    STX.W $09AD                                                ;81F4B5|8EAD09  |0009AD;
    LDY.W #$0090                                               ;81F4B8|A09000  |      ;
    STY.W $09AF                                                ;81F4BB|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F4BE|2288A681|81A688;
    REP #$30                                                   ;81F4C2|C230    |      ;
    LDA.W #$0002                                               ;81F4C4|A90200  |      ;
    JMP.W fPlayerInteraction_Return                            ;81F4C7|4C56F5  |81F556;
 
 
fPlayerInteraction0x4C:
    REP #$30                                                   ;81F4CA|C230    |      ;
    LDA.W #$00FB                                               ;81F4CC|A9FB00  |      ;
    LDX.W #$01C0                                               ;81F4CF|A2C001  |      ;
    STX.W $09AD                                                ;81F4D2|8EAD09  |0009AD;
    LDY.W #$0050                                               ;81F4D5|A05000  |      ;
    STY.W $09AF                                                ;81F4D8|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F4DB|2288A681|81A688;
    REP #$30                                                   ;81F4DF|C230    |      ;
    LDA.W #$0003                                               ;81F4E1|A90300  |      ;
    BRA fPlayerInteraction_Return                              ;81F4E4|8070    |81F556;
 
 
fPlayerInteraction0x4D:
    REP #$30                                                   ;81F4E6|C230    |      ;
    LDA.W #$00FB                                               ;81F4E8|A9FB00  |      ;
    LDX.W #$02A0                                               ;81F4EB|A2A002  |      ;
    STX.W $09AD                                                ;81F4EE|8EAD09  |0009AD;
    LDY.W #$0030                                               ;81F4F1|A03000  |      ;
    STY.W $09AF                                                ;81F4F4|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F4F7|2288A681|81A688;
    REP #$30                                                   ;81F4FB|C230    |      ;
    LDA.W #$0004                                               ;81F4FD|A90400  |      ;
    BRA fPlayerInteraction_Return                              ;81F500|8054    |81F556;
 
 
fPlayerInteraction0x4E:
    REP #$30                                                   ;81F502|C230    |      ;
    LDA.W #$00FB                                               ;81F504|A9FB00  |      ;
    LDX.W #$0050                                               ;81F507|A25000  |      ;
    STX.W $09AD                                                ;81F50A|8EAD09  |0009AD;
    LDY.W #$02C0                                               ;81F50D|A0C002  |      ;
    STY.W $09AF                                                ;81F510|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F513|2288A681|81A688;
    REP #$30                                                   ;81F517|C230    |      ;
    LDA.W #$0005                                               ;81F519|A90500  |      ;
    BRA fPlayerInteraction_Return                              ;81F51C|8038    |81F556;
 
 
fPlayerInteraction0x4F:
    REP #$30                                                   ;81F51E|C230    |      ;
    LDA.W #$00FB                                               ;81F520|A9FB00  |      ;
    LDX.W #$0210                                               ;81F523|A21002  |      ;
    STX.W $09AD                                                ;81F526|8EAD09  |0009AD;
    LDY.W #$0250                                               ;81F529|A05002  |      ;
    STY.W $09AF                                                ;81F52C|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F52F|2288A681|81A688;
    REP #$30                                                   ;81F533|C230    |      ;
    LDA.W #$0006                                               ;81F535|A90600  |      ;
    BRA fPlayerInteraction_Return                              ;81F538|801C    |81F556;
 
 
fPlayerInteraction0x50:
    REP #$30                                                   ;81F53A|C230    |      ;
    LDA.W #$00FB                                               ;81F53C|A9FB00  |      ;
    LDX.W #$0210                                               ;81F53F|A21002  |      ;
    STX.W $09AD                                                ;81F542|8EAD09  |0009AD;
    LDY.W #$0330                                               ;81F545|A03003  |      ;
    STY.W $09AF                                                ;81F548|8CAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;81F54B|2288A681|81A688;
    REP #$30                                                   ;81F54F|C230    |      ;
    LDA.W #$0007                                               ;81F551|A90700  |      ;
    BRA fPlayerInteraction_Return                              ;81F554|8000    |81F556;
 
 
fPlayerInteraction_Return:
    REP #$30                                                   ;81F556|C230    |      ;
    TAX                                                        ;81F558|AA      |      ;
    SEP #$20                                                   ;81F559|E220    |      ;
    LDA.W $09A4,X                                              ;81F55B|BDA409  |0009A4;
    BEQ +                                                      ;81F55E|F034    |81F594;
    TXY                                                        ;81F560|9B      |      ;
    XBA                                                        ;81F561|EB      |      ;
    LDA.B #$00                                                 ;81F562|A900    |      ;
    XBA                                                        ;81F564|EB      |      ;
    REP #$20                                                   ;81F565|C220    |      ;
    DEC A                                                      ;81F567|3A      |      ;
    ASL A                                                      ;81F568|0A      |      ;
    TAX                                                        ;81F569|AA      |      ;
    LDA.L aPlayerInteraction_SetFlags,X                        ;81F56A|BFB4FA81|81FAB4;
    AND.L strcFlags.unknown3                                   ;81F56E|2F781F7F|7F1F78;
    BNE +                                                      ;81F572|D020    |81F594;
    TYX                                                        ;81F574|BB      |      ;
    SEP #$20                                                   ;81F575|E220    |      ;
    LDA.W $09A4,X                                              ;81F577|BDA409  |0009A4;
    CLC                                                        ;81F57A|18      |      ;
    ADC.B #$1D                                                 ;81F57B|691D    |      ;
    STA.W strcPlayerData.carryItemId                           ;81F57D|8D1D09  |00091D;
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81F593|60      |      ;
 
 
  + REP #$30                                                   ;81F594|C230    |      ;
    LDA.W #$00A1                                               ;81F596|A9A100  |      ;
    LDX.W $09AD                                                ;81F599|AEAD09  |0009AD;
    LDY.W $09AF                                                ;81F59C|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;81F59F|223AB082|82B03A;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81F5AF|60      |      ;
 
 
fPlayerInteraction0x51:
    SEP #$20                                                   ;81F5B0|E220    |      ;
    REP #$10                                                   ;81F5B2|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F5B4|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F5B7|C901    |      ;
    BEQ .case1                                                 ;81F5B9|F030    |81F5EB;
    CMP.B #$02                                                 ;81F5BB|C902    |      ;
    BNE +                                                      ;81F5BD|D003    |81F5C2;
    JMP.W .case2                                               ;81F5BF|4C6CF6  |81F66C;
 
 
  + CMP.B #$03                                                 ;81F5C2|C903    |      ;
    BNE +                                                      ;81F5C4|D003    |81F5C9;
    JMP.W .case3                                               ;81F5C6|4C9EF6  |81F69E;
 
 
  + CMP.B #$04                                                 ;81F5C9|C904    |      ;
    BNE +                                                      ;81F5CB|D003    |81F5D0;
    JMP.W .case4                                               ;81F5CD|4CB5F6  |81F6B5;
 
 
  + SEP #$20                                                   ;81F5D0|E220    |      ;
    LDA.B #$02                                                 ;81F5D2|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F5D4|8D9A01  |00019A;
    LDX.W #$024B                                               ;81F5D7|A24B02  |      ;
    LDA.B #$00                                                 ;81F5DA|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F5DC|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F5DF|225F9383|83935F;
    SEP #$20                                                   ;81F5E3|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81F5E5|EE6F09  |00096F;
    JMP.W fReturn_81F6D6                                       ;81F5E8|4CD6F6  |81F6D6;
 
 
.case1:
    SEP #$20                                                   ;81F5EB|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F5ED|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F5F0|C902    |      ;
    BNE +                                                      ;81F5F2|D003    |81F5F7;
    JMP.W fReturn_81F6D6                                       ;81F5F4|4CD6F6  |81F6D6;
 
 
  + SEP #$20                                                   ;81F5F7|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81F5F9|AD8F01  |00018F;
    BNE .label1                                                ;81F5FC|D035    |81F633;
    REP #$20                                                   ;81F5FE|C220    |      ;
    LDA.W #$FFEC                                               ;81F600|A9ECFF  |      ;
    STA.B ptrTemp0x72                                          ;81F603|8572    |000072;
    SEP #$20                                                   ;81F605|E220    |      ;
    LDA.B #$FF                                                 ;81F607|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81F609|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81F60B|22C9B183|83B1C9;
    REP #$20                                                   ;81F60F|C220    |      ;
    CMP.W #$0000                                               ;81F611|C90000  |      ;
    BNE .label2                                                ;81F614|D03A    |81F650;
    SEP #$20                                                   ;81F616|E220    |      ;
    LDA.B #$02                                                 ;81F618|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F61A|8D9A01  |00019A;
    LDX.W #$024C                                               ;81F61D|A24C02  |      ;
    LDA.B #$00                                                 ;81F620|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F622|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F625|225F9383|83935F;
    SEP #$20                                                   ;81F629|E220    |      ;
    LDA.B #$02                                                 ;81F62B|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F62D|8D6F09  |00096F;
    JMP.W fReturn_81F6D6                                       ;81F630|4CD6F6  |81F6D6;
 
 
.label1:
    SEP #$20                                                   ;81F633|E220    |      ;
    LDA.B #$02                                                 ;81F635|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F637|8D9A01  |00019A;
    LDX.W #$024D                                               ;81F63A|A24D02  |      ;
    LDA.B #$00                                                 ;81F63D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F63F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F642|225F9383|83935F;
    SEP #$20                                                   ;81F646|E220    |      ;
    LDA.B #$03                                                 ;81F648|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F64A|8D6F09  |00096F;
    JMP.W fReturn_81F6D6                                       ;81F64D|4CD6F6  |81F6D6;
 
 
.label2:
    SEP #$20                                                   ;81F650|E220    |      ;
    LDA.B #$02                                                 ;81F652|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F654|8D9A01  |00019A;
    LDX.W #$0213                                               ;81F657|A21302  |      ;
    LDA.B #$00                                                 ;81F65A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F65C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F65F|225F9383|83935F;
    SEP #$20                                                   ;81F663|E220    |      ;
    LDA.B #$03                                                 ;81F665|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F667|8D6F09  |00096F;
    BRA fReturn_81F6D6                                         ;81F66A|806A    |81F6D6;
 
 
.case2:
    SEP #$20                                                   ;81F66C|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F66E|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F671|C902    |      ;
    BEQ fReturn_81F6D6                                         ;81F673|F061    |81F6D6;
    REP #$20                                                   ;81F675|C220    |      ;
    %SetPlayerAction(!PACTION_AUTOPILOT)
    REP #$30                                                   ;81F67E|C230    |      ;
    LDA.W #$0030                                               ;81F680|A93000  |      ;
    STA.W strcObjectData.spriteIdx                             ;81F683|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81F686|20E6CF  |81CFE6;
    REP #$30                                                   ;81F689|C230    |      ;
    LDA.W #$0001                                               ;81F68B|A90100  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81F68E|2282B283|83B282;
    SEP #$20                                                   ;81F692|E220    |      ;
    STZ.W nPlayerInteractionArg2                               ;81F694|9C7009  |000970;
    LDA.B #$04                                                 ;81F697|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81F699|8D6F09  |00096F;
    BRA fReturn_81F6D6                                         ;81F69C|8038    |81F6D6;
 
 
.case3:
    SEP #$20                                                   ;81F69E|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F6A0|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F6A3|C902    |      ;
    BEQ fReturn_81F6D6                                         ;81F6A5|F02F    |81F6D6;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA fReturn_81F6D6                                         ;81F6B3|8021    |81F6D6;
 
 
.case4:
    SEP #$20                                                   ;81F6B5|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F6B7|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F6BA|AD7009  |000970;
    CMP.B #$64                                                 ;81F6BD|C964    |      ;
    BNE fReturn_81F6D6                                         ;81F6BF|D015    |81F6D6;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    BRA fReturn_81F6D6                                         ;81F6D4|8000    |81F6D6;
 
 
fReturn_81F6D6:
    RTS                                                        ;81F6D6|60      |      ; FIXME: I want to be .return
 
 
fPlayerInteraction0x52:
    SEP #$20                                                   ;81F6D7|E220    |      ;
    REP #$10                                                   ;81F6D9|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F6DB|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F6DE|C901    |      ;
    BEQ .case1                                                 ;81F6E0|F030    |81F712;
    CMP.B #$02                                                 ;81F6E2|C902    |      ;
    BNE +                                                      ;81F6E4|D003    |81F6E9;
    JMP.W .case2                                               ;81F6E6|4C94F7  |81F794;
 
 
  + CMP.B #$03                                                 ;81F6E9|C903    |      ;
    BNE +                                                      ;81F6EB|D003    |81F6F0;
    JMP.W .case3                                               ;81F6ED|4CC6F7  |81F7C6;
 
 
  + CMP.B #$04                                                 ;81F6F0|C904    |      ;
    BNE +                                                      ;81F6F2|D003    |81F6F7;
    JMP.W .case4                                               ;81F6F4|4CDDF7  |81F7DD;
 
 
  + SEP #$20                                                   ;81F6F7|E220    |      ;
    LDA.B #$02                                                 ;81F6F9|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F6FB|8D9A01  |00019A;
    LDX.W #$024A                                               ;81F6FE|A24A02  |      ;
    LDA.B #$00                                                 ;81F701|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F703|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F706|225F9383|83935F;
    SEP #$20                                                   ;81F70A|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81F70C|EE6F09  |00096F;
    JMP.W .return                                              ;81F70F|4CFEF7  |81F7FE;
 
 
.case1:
    SEP #$20                                                   ;81F712|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F714|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F717|C902    |      ;
    BNE +                                                      ;81F719|D003    |81F71E;
    JMP.W .return                                              ;81F71B|4CFEF7  |81F7FE;
 
 
  + SEP #$20                                                   ;81F71E|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81F720|AD8F01  |00018F;
    BNE .label1                                                ;81F723|D035    |81F75A;
    REP #$20                                                   ;81F725|C220    |      ;
    LDA.W #$FFE2                                               ;81F727|A9E2FF  |      ;
    STA.B ptrTemp0x72                                          ;81F72A|8572    |000072;
    SEP #$20                                                   ;81F72C|E220    |      ;
    LDA.B #$FF                                                 ;81F72E|A9FF    |      ;
    STA.B ptrTemp0x72+2                                        ;81F730|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;81F732|22C9B183|83B1C9;
    REP #$20                                                   ;81F736|C220    |      ;
    CMP.W #$0000                                               ;81F738|C90000  |      ;
    BNE .label2                                                ;81F73B|D03A    |81F777;
    SEP #$20                                                   ;81F73D|E220    |      ;
    LDA.B #$02                                                 ;81F73F|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F741|8D9A01  |00019A;
    LDX.W #$024C                                               ;81F744|A24C02  |      ;
    LDA.B #$00                                                 ;81F747|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F749|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F74C|225F9383|83935F;
    SEP #$20                                                   ;81F750|E220    |      ;
    LDA.B #$02                                                 ;81F752|A902    |      ;
    STA.W nPlayerInteractionArg1                               ;81F754|8D6F09  |00096F;
    JMP.W .return                                              ;81F757|4CFEF7  |81F7FE;
 
 
.label1:
    SEP #$20                                                   ;81F75A|E220    |      ;
    LDA.B #$02                                                 ;81F75C|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F75E|8D9A01  |00019A;
    LDX.W #$024D                                               ;81F761|A24D02  |      ;
    LDA.B #$00                                                 ;81F764|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F766|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F769|225F9383|83935F;
    SEP #$20                                                   ;81F76D|E220    |      ;
    LDA.B #$03                                                 ;81F76F|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F771|8D6F09  |00096F;
    JMP.W .return                                              ;81F774|4CFEF7  |81F7FE;
 
 
.label2:
    SEP #$20                                                   ;81F777|E220    |      ;
    LDA.B #$02                                                 ;81F779|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F77B|8D9A01  |00019A;
    LDX.W #$0213                                               ;81F77E|A21302  |      ;
    LDA.B #$00                                                 ;81F781|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F783|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F786|225F9383|83935F;
    SEP #$20                                                   ;81F78A|E220    |      ;
    LDA.B #$03                                                 ;81F78C|A903    |      ;
    STA.W nPlayerInteractionArg1                               ;81F78E|8D6F09  |00096F;
    JMP.W fReturn_81F6D6                                       ;81F791|4CD6F6  |81F6D6; BUG - should be .return in this function rather than previous one since we are out of function scope
 
 
.case2:
    SEP #$20                                                   ;81F794|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F796|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F799|C902    |      ;
    BEQ .return                                                ;81F79B|F061    |81F7FE;
    REP #$20                                                   ;81F79D|C220    |      ;
    %SetPlayerAction(!PACTION_AUTOPILOT)
    REP #$30                                                   ;81F7A6|C230    |      ;
    LDA.W #$00FB                                               ;81F7A8|A9FB00  |      ;
    STA.W strcObjectData.spriteIdx                             ;81F7AB|8D0109  |000901;
    JSR.W fUnknown_81CFE6                                      ;81F7AE|20E6CF  |81CFE6;
    REP #$30                                                   ;81F7B1|C230    |      ;
    LDA.W #$0003                                               ;81F7B3|A90300  |      ;
    JSL.L fGameEngine_AddHappiness                             ;81F7B6|2282B283|83B282;
    SEP #$20                                                   ;81F7BA|E220    |      ;
    STZ.W nPlayerInteractionArg2                               ;81F7BC|9C7009  |000970;
    LDA.B #$04                                                 ;81F7BF|A904    |      ;
    STA.W nPlayerInteractionArg1                               ;81F7C1|8D6F09  |00096F;
    BRA .return                                                ;81F7C4|8038    |81F7FE;
 
 
.case3:
    SEP #$20                                                   ;81F7C6|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F7C8|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F7CB|C902    |      ;
    BEQ .return                                                ;81F7CD|F02F    |81F7FE;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    BRA .return                                                ;81F7DB|8021    |81F7FE;
 
 
.case4:
    SEP #$20                                                   ;81F7DD|E220    |      ;
    INC.W nPlayerInteractionArg2                               ;81F7DF|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81F7E2|AD7009  |000970;
    CMP.B #$64                                                 ;81F7E5|C964    |      ;
    BNE .return                                                ;81F7E7|D015    |81F7FE;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    BRA .return                                                ;81F7FC|8000    |81F7FE;
 
 
.return:
    RTS                                                        ;81F7FE|60      |      ;
 
 
fPlayerInteraction0x53:
    SEP #$20                                                   ;81F7FF|E220    |      ;
    REP #$10                                                   ;81F801|C210    |      ;
    REP #$30                                                   ;81F803|C230    |      ;
    LDA.W #$0001                                               ;81F805|A90100  |      ;
    LDX.W #$0000                                               ;81F808|A20000  |      ;
    LDY.W #$0000                                               ;81F80B|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;81F80E|224ED181|81D14E;
    %SetCurrentCarriedItemDirect(!EITEM_GOLDAXE)
    %SetPlayerAction(!PACTION_ITEMONHAND)
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    REP #$30                                                   ;81F82C|C230    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;81F82E|AD8509  |000985;
    LSR A                                                      ;81F831|4A      |      ;
    LSR A                                                      ;81F832|4A      |      ;
    LSR A                                                      ;81F833|4A      |      ;
    LSR A                                                      ;81F834|4A      |      ;
    ASL A                                                      ;81F835|0A      |      ;
    ASL A                                                      ;81F836|0A      |      ;
    ASL A                                                      ;81F837|0A      |      ;
    ASL A                                                      ;81F838|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;81F839|857E    |00007E;
    LDY.W #$0000                                               ;81F83B|A00000  |      ;
 
.loop:
    REP #$30                                                   ;81F83E|C230    |      ;
    TYA                                                        ;81F840|98      |      ;
    ASL A                                                      ;81F841|0A      |      ;
    ASL A                                                      ;81F842|0A      |      ;
    TAX                                                        ;81F843|AA      |      ;
    LDA.L aGameEngine_AddChickenPositionsData,X                ;81F844|BF10CA83|83CA10;
    SEC                                                        ;81F848|38      |      ;
    SBC.W #$0008                                               ;81F849|E90800  |      ;
    CMP.B strcVariables.n16Temp1                               ;81F84C|C57E    |00007E;
    BEQ +                                                      ;81F84E|F008    |81F858;
    INY                                                        ;81F850|C8      |      ;
    CPY.W #$000D                                               ;81F851|C00D00  |      ;
    BNE .loop                                                  ;81F854|D0E8    |81F83E;
 
.deadloop:
    BRA .deadloop                                              ;81F856|80FE    |81F856;
 
 
  + TYA                                                        ;81F858|98      |      ;
    ASL A                                                      ;81F859|0A      |      ;
    TAX                                                        ;81F85A|AA      |      ;
    LDA.L aPlayerInteraction_ResetFlags,X                      ;81F85B|BFD4FA81|81FAD4;
    AND.L nEggInCoopFlags                                      ;81F85F|2F451F7F|7F1F45;
    STA.L nEggInCoopFlags                                      ;81F863|8F451F7F|7F1F45;
    BRA .return                                                ;81F867|8000    |81F869;
 
 
.return:
    RTS                                                        ;81F869|60      |      ;
 
 
fPlayerInteraction0x54_FloristNotebook:
    SEP #$20                                                   ;81F86A|E220    |      ;
    REP #$10                                                   ;81F86C|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F86E|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F871|C901    |      ;
    BEQ .checks                                                ;81F873|F01B    |81F890;
    SEP #$20                                                   ;81F875|E220    |      ;
    LDA.B #$02                                                 ;81F877|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F879|8D9A01  |00019A;
    LDX.W #$0455                                               ;81F87C|A25504  |      ;
    LDA.B #$00                                                 ;81F87F|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F881|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F884|225F9383|83935F;
    SEP #$20                                                   ;81F888|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81F88A|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81F88D|4C1EF9  |81F91E;
 
 
.checks:
    REP #$30                                                   ;81F890|C230    |      ;
    LDA.W strcJoypad1.current                                  ;81F892|AD2401  |000124;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;81F898|F003    |81F89D;
    JMP.W .return                                              ;81F89A|4C1FF9  |81F91F;
 
 
  + SEP #$20                                                   ;81F89D|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F89F|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F8A2|C902    |      ;
    BNE +                                                      ;81F8A4|D003    |81F8A9;
    JMP.W .justReturn                                          ;81F8A6|4C1EF9  |81F91E;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81F8A9|AD8F01  |00018F;
    CMP.B #$00                                                 ;81F8AC|C900    |      ;
    BEQ .case0                                                 ;81F8AE|F008    |81F8B8;
    CMP.B #$01                                                 ;81F8B0|C901    |      ;
    BEQ .case1                                                 ;81F8B2|F026    |81F8DA;
    CMP.B #$02                                                 ;81F8B4|C902    |      ;
    BEQ .case2                                                 ;81F8B6|F044    |81F8FC;
 
.case0:
    SEP #$20                                                   ;81F8B8|E220    |      ;
    LDA.B #$02                                                 ;81F8BA|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F8BC|8D9A01  |00019A;
    LDX.W #$0456                                               ;81F8BF|A25604  |      ;
    LDA.B #$00                                                 ;81F8C2|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F8C4|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F8C7|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F8D7|4C1EF9  |81F91E;
 
 
.case1:
    SEP #$20                                                   ;81F8DA|E220    |      ;
    LDA.B #$02                                                 ;81F8DC|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F8DE|8D9A01  |00019A;
    LDX.W #$0457                                               ;81F8E1|A25704  |      ;
    LDA.B #$00                                                 ;81F8E4|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F8E6|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F8E9|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F8F9|4C1EF9  |81F91E;
 
 
.case2:
    SEP #$20                                                   ;81F8FC|E220    |      ;
    LDA.B #$02                                                 ;81F8FE|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F900|8D9A01  |00019A;
    LDX.W #$0458                                               ;81F903|A25804  |      ;
    LDA.B #$00                                                 ;81F906|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F908|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F90B|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F91B|4C1EF9  |81F91E;
 
 
.justReturn:
    RTS                                                        ;81F91E|60      |      ;
 
 
.return:
    JSL.L fDialog_Unknown_8393F9                               ;81F91F|22F99383|8393F9;
    SEP #$20                                                   ;81F923|E220    |      ;
    LDA.B #$01                                                 ;81F925|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F927|8D9A01  |00019A;
    REP #$20                                                   ;81F92A|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;81F92C|AD2801  |000128;
    AND.W #~!JOYPAD_A                                               
    STA.W strcJoypad1.newInput                                 ;81F932|8D2801  |000128;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81F941|60      |      ;
 
 
fPlayerInteraction0x55_AnimalNotebook:
    SEP #$20                                                   ;81F942|E220    |      ;
    REP #$10                                                   ;81F944|C210    |      ;
    LDA.W nPlayerInteractionArg1                               ;81F946|AD6F09  |00096F;
    CMP.B #$01                                                 ;81F949|C901    |      ;
    BEQ .checks                                                ;81F94B|F01B    |81F968;
    SEP #$20                                                   ;81F94D|E220    |      ;
    LDA.B #$02                                                 ;81F94F|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F951|8D9A01  |00019A;
    LDX.W #$0459                                               ;81F954|A25904  |      ;
    LDA.B #$00                                                 ;81F957|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F959|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F95C|225F9383|83935F;
    SEP #$20                                                   ;81F960|E220    |      ;
    INC.W nPlayerInteractionArg1                               ;81F962|EE6F09  |00096F;
    JMP.W .justReturn                                          ;81F965|4C45FA  |81FA45;
 
 
.checks:
    REP #$30                                                   ;81F968|C230    |      ;
    LDA.W strcJoypad1.current                                  ;81F96A|AD2401  |000124;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;81F970|F003    |81F975;
    JMP.W .return                                              ;81F972|4C46FA  |81FA46;
 
 
  + SEP #$20                                                   ;81F975|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81F977|AD9A01  |00019A;
    CMP.B #$02                                                 ;81F97A|C902    |      ;
    BNE +                                                      ;81F97C|D003    |81F981;
    JMP.W .justReturn                                          ;81F97E|4C45FA  |81FA45;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;81F981|AD8F01  |00018F;
    CMP.B #$00                                                 ;81F984|C900    |      ;
    BEQ .case0                                                 ;81F986|F013    |81F99B;
    CMP.B #$01                                                 ;81F988|C901    |      ;
    BEQ .case1                                                 ;81F98A|F031    |81F9BD;
    CMP.B #$02                                                 ;81F98C|C902    |      ;
    BEQ .case2                                                 ;81F98E|F04F    |81F9DF;
    CMP.B #$03                                                 ;81F990|C903    |      ;
    BEQ .case3                                                 ;81F992|F06D    |81FA01;
    CMP.B #$04                                                 ;81F994|C904    |      ;
    BNE .case0                                                 ;81F996|D003    |81F99B;
    JMP.W .case4                                               ;81F998|4C23FA  |81FA23;
 
 
.case0:
    SEP #$20                                                   ;81F99B|E220    |      ;
    LDA.B #$02                                                 ;81F99D|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F99F|8D9A01  |00019A;
    LDX.W #$045A                                               ;81F9A2|A25A04  |      ;
    LDA.B #$00                                                 ;81F9A5|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F9A7|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F9AA|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F9BA|4C45FA  |81FA45;
 
 
.case1:
    SEP #$20                                                   ;81F9BD|E220    |      ;
    LDA.B #$02                                                 ;81F9BF|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F9C1|8D9A01  |00019A;
    LDX.W #$045B                                               ;81F9C4|A25B04  |      ;
    LDA.B #$00                                                 ;81F9C7|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F9C9|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F9CC|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F9DC|4C45FA  |81FA45;
 
 
.case2:
    SEP #$20                                                   ;81F9DF|E220    |      ;
    LDA.B #$02                                                 ;81F9E1|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81F9E3|8D9A01  |00019A;
    LDX.W #$045C                                               ;81F9E6|A25C04  |      ;
    LDA.B #$00                                                 ;81F9E9|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81F9EB|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81F9EE|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81F9FE|4C45FA  |81FA45;
 
 
.case3:
    SEP #$20                                                   ;81FA01|E220    |      ;
    LDA.B #$02                                                 ;81FA03|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81FA05|8D9A01  |00019A;
    LDX.W #$045D                                               ;81FA08|A25D04  |      ;
    LDA.B #$00                                                 ;81FA0B|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81FA0D|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81FA10|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81FA20|4C45FA  |81FA45;
 
 
.case4:
    SEP #$20                                                   ;81FA23|E220    |      ;
    LDA.B #$02                                                 ;81FA25|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81FA27|8D9A01  |00019A;
    LDX.W #$045E                                               ;81FA2A|A25E04  |      ;
    LDA.B #$00                                                 ;81FA2D|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81FA2F|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81FA32|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    JMP.W .justReturn                                          ;81FA42|4C45FA  |81FA45;
 
 
.justReturn:
    RTS                                                        ;81FA45|60      |      ;
 
 
.return:
    JSL.L fDialog_Unknown_8393F9                               ;81FA46|22F99383|8393F9;
    SEP #$20                                                   ;81FA4A|E220    |      ;
    LDA.B #$01                                                 ;81FA4C|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81FA4E|8D9A01  |00019A;
    REP #$20                                                   ;81FA51|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;81FA53|AD2801  |000128;
    AND.W #~!JOYPAD_A                                               
    STA.W strcJoypad1.newInput                                 ;81FA59|8D2801  |000128;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81FA68|60      |      ;
 
 
fPlayerInteraction0x56:
    SEP #$20                                                   ;81FA69|E220    |      ;
    REP #$10                                                   ;81FA6B|C210    |      ;
    INC.W nPlayerInteractionArg2                               ;81FA6D|EE7009  |000970;
    LDA.W nPlayerInteractionArg2                               ;81FA70|AD7009  |000970;
    CMP.B #$02                                                 ;81FA73|C902    |      ;
    BNE +                                                      ;81FA75|D00C    |81FA83;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
 
  + RTS                                                        ;81FA83|60      |      ;
 
 
fPlayerInteraction0x57:
    REP #$30                                                   ;81FA84|C230    |      ;
    LDX.W #$0491                                               ;81FA86|A29104  |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE +                                                      ;81FA90|D003    |81FA95;
    LDX.W #$0246                                               ;81FA92|A24602  |      ;
 
  + SEP #$20                                                   ;81FA95|E220    |      ;
    REP #$10                                                   ;81FA97|C210    |      ;
    LDA.B #$02                                                 ;81FA99|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;81FA9B|8D9A01  |00019A;
    LDA.B #$00                                                 ;81FA9E|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;81FAA0|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;81FAA3|225F9383|83935F;
    %UnsetPlayerFlag(!PFLAGS_INTERACTING)
    RTS                                                        ;81FAB3|60      |      ;
 
 
aPlayerInteraction_SetFlags:
    dw $0001,$0002,$0004,$0008,$0010,$0020                     ;81FAB4|        |      ;
    dw $0040,$0080,$0100,$0200,$0400,$0800                     ;81FAC0|        |      ;
    dw $1000,$2000,$4000,$8000                                 ;81FACC|        |      ;
 
aPlayerInteraction_ResetFlags:
    dw $FFFE,$FFFD,$FFFB,$FFF7,$FFEF,$FFDF                     ;81FAD4|        |      ;
    dw $FFBF,$FF7F,$FEFF,$FDFF,$FBFF,$F7FF                     ;81FAE0|        |      ;
    dw $EFFF,$DFFF,$BFFF,$7FFF                                 ;81FAEC|        |      ;
 
    pad $81FFFF
