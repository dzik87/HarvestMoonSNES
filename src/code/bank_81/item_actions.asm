 
    ORG $818000
 
 
fItemCarried_Begin:
    SEP #$20                                                   ;818000|E220    |      ;
    REP #$10                                                   ;818002|C210    |      ;
    LDA.B #$01                                                 ;818004|A901    |      ;
    STA.W $0974+!RAM_SHIFT                                 ;818006|8D7409  |000974;
    LDA.B #$01                                                 ;818009|A901    |      ;
    STA.W $0975+!RAM_SHIFT                                 ;81800B|8D7509  |000975;
    LDA.B #$00                                                 ;81800E|A900    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;818010|8D7609  |000976;
    LDA.W strcPlayerData.carryItemId                           ;818013|AD1D09  |00091D;
    STA.W nCarriedItemId                                       ;818016|8D8409  |000984;
    REP #$20                                                   ;818019|C220    |      ;
    LDA.W #$0002                                               ;81801B|A90200  |      ;
    CLC                                                        ;81801E|18      |      ;
    ADC.B strcPlayer.direction                                 ;81801F|65DA    |0000DA;
    TAY                                                        ;818021|A8      |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;818022|22B78081|8180B7;
    REP #$20                                                   ;818026|C220    |      ;
    LDA.B strcPlayer.posX                                      ;818028|A5D6    |0000D6;
    STA.W nUnknownX                                            ;81802A|8D8009  |000980;
    LDA.B strcPlayer.posY                                      ;81802D|A5D8    |0000D8;
    INC A                                                      ;81802F|1A      |      ;
    INC A                                                      ;818030|1A      |      ;
    STA.W nUnknownY                                            ;818031|8D8209  |000982;
    JSL.L fObjectSlots_Allocate                                      ;818034|2200A581|81A500;
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
 
 
fItemCarried_RunHandler:
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
 
 
fItemCarried_LoadPoseData:
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
    STA.W $097A+!RAM_SHIFT                                 ;8180E6|8D7A09  |00097A;
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
    STA.W $097E+!RAM_SHIFT                                 ;8180FA|8D7E09  |00097E; A * 64
    RTL                                                        ;8180FD|6B      |      ;
 
 
subItemCarried_Mushroom:
    JSR.W fItemCarried_PhaseDispatch_Forage                                      ;8180FE|205588  |818855;
    RTS                                                        ;818101|60      |      ;
 
 
subItemCarried_PoisonMushroom:
    JSR.W fItemCarried_PhaseDispatch_Forage                                      ;818102|205588  |818855;
    RTS                                                        ;818105|60      |      ;
 
 
subItemCarried_WildGrape:
    JSR.W fItemCarried_PhaseDispatch_Forage                                      ;818106|205588  |818855;
    RTS                                                        ;818109|60      |      ;
 
 
subItemCarried_BerryStrongSmell:
    JSR.W fItemCarried_PhaseDispatch_Forage                                      ;81810A|205588  |818855;
    RTS                                                        ;81810D|60      |      ;
 
 
subItemCarried_MoonFlower:
    JSR.W fItemCarried_PhaseDispatch_Forage                                      ;81810E|205588  |818855;
    RTS                                                        ;818111|60      |      ;
 
 
subItemCarried_Cake:
    JSR.W fItemCarried_PhaseDispatch_Forage                                      ;818112|205588  |818855;
    RTS                                                        ;818115|60      |      ;
 
 
subItemCarried_Fish:
    JSR.W fItemCarried_PhaseDispatch_Forage                                      ;818116|205588  |818855;
    RTS                                                        ;818119|60      |      ;
 
 
subItemCarried_PowerBerry:
    JSR.W fItemCarried_PhaseDispatch_Forage                                      ;81811A|205588  |818855;
    RTS                                                        ;81811D|60      |      ;
 
 
subItemCarried_Bush:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;81811E|20E588  |8188E5;
    RTS                                                        ;818121|60      |      ;
 
 
subItemCarried_Bush2:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;818122|20E588  |8188E5;
    RTS                                                        ;818125|60      |      ;
 
 
subItemCarried_0x0D:
    JSR.W fItemCarried_PhaseDispatch_NoSell                                      ;818126|209A88  |81889A;
    RTS                                                        ;818129|60      |      ;
 
 
subItemCarried_0x0E:
    JSR.W fItemCarried_PhaseDispatch_NoSell                                      ;81812A|209A88  |81889A;
    RTS                                                        ;81812D|60      |      ;
 
 
subItemCarried_0x57:
    JSR.W fItemCarried_PhaseDispatch_NoSell                                      ;81812E|209A88  |81889A;
    RTS                                                        ;818131|60      |      ;
 
 
subItemCarried_Corn:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;818132|20E588  |8188E5;
    REP #$30                                                   ;818135|C230    |      ;
    %CheckFlag(daily3, $0001)
    if !REGION_EUDE
    BEQ L_818149
    LDA.L $7F1F4A
    CMP.W #$03E7
    BCS L_818149
    INC A
    else
    BEQ +                                                      ;81813E|F009    |818149;
    LDA.L nStatShippedCorns                                    ;818140|AF4A1F7F|7F1F4A;
    INC A                                                      ;818144|1A      |      ;
    endif
    STA.L nStatShippedCorns                                    ;818145|8F4A1F7F|7F1F4A;
 
  + RTS                                                        ;818149|60      |      ;
 
 
subItemCarried_Tomato:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;81814A|20E588  |8188E5;
    REP #$30                                                   ;81814D|C230    |      ;
    %CheckFlag(daily3, $0001)
    if !REGION_EUDE
    BEQ L_818161
    LDA.L $7F1F4C
    CMP.W #$03E7
    BCS L_818161
    INC A
    else
    BEQ +                                                      ;818156|F009    |818161;
    LDA.L nStatShippedTomatoes                                 ;818158|AF4C1F7F|7F1F4C;
    INC A                                                      ;81815C|1A      |      ;
    endif
    STA.L nStatShippedTomatoes                                 ;81815D|8F4C1F7F|7F1F4C;
 
  + RTS                                                        ;818161|60      |      ;
 
 
subItemCarried_Potato:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;818162|20E588  |8188E5;
    REP #$30                                                   ;818165|C230    |      ;
    %CheckFlag(daily3, $0001)
    if !REGION_EUDE
    BEQ L_818179
    LDA.L $7F1F50
    CMP.W #$03E7
    BCS L_818179
    INC A
    else
    BEQ +                                                      ;81816E|F009    |818179;
    LDA.L nStatShippedPotatoes                                 ;818170|AF501F7F|7F1F50;
    INC A                                                      ;818174|1A      |      ;
    endif
    STA.L nStatShippedPotatoes                                 ;818175|8F501F7F|7F1F50;
 
  + RTS                                                        ;818179|60      |      ;
 
 
subItemCarried_Turnip:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;81817A|20E588  |8188E5; X = 26
    REP #$30                                                   ;81817D|C230    |      ;
    %CheckFlag(daily3, $0001)
    if !REGION_EUDE
    BEQ L_818191
    LDA.L $7F1F4E
    CMP.W #$03E7
    BCS L_818191
    INC A
    else
    BEQ +                                                      ;818186|F009    |818191;
    LDA.L nStatShippedTurnips                                  ;818188|AF4E1F7F|7F1F4E;
    INC A                                                      ;81818C|1A      |      ;
    endif
    STA.L nStatShippedTurnips                                  ;81818D|8F4E1F7F|7F1F4E;
 
  + RTS                                                        ;818191|60      |      ;
 
 
subItemCarried_Egg:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;818192|20E588  |8188E5;
    RTS                                                        ;818195|60      |      ;
 
 
subItemCarried_SmallMilk:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;818196|20E588  |8188E5;
    RTS                                                        ;818199|60      |      ;
 
 
subItemCarried_MediumMilk:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;81819A|20E588  |8188E5;
    RTS                                                        ;81819D|60      |      ;
 
 
subItemCarried_LargeMilk:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;81819E|20E588  |8188E5;
    RTS                                                        ;8181A1|60      |      ;
 
 
subItemCarried_Herb:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;8181A2|20E588  |8188E5;
    RTS                                                        ;8181A5|60      |      ;
 
 
subItemCarried_Flower:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;8181A6|20E588  |8188E5;
    RTS                                                        ;8181A9|60      |      ;
 
 
subItemCarried_Feed:
    JSR.W fItemCarried_PhaseDispatch_Feed                                      ;8181AA|20BC88  |8188BC;
    RTS                                                        ;8181AD|60      |      ;
 
 
subItemCarried_GreenPerfume:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;8181AE|202389  |818923;
    SEP #$20                                                   ;8181B1|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8181B3|AD7609  |000976;
    CMP.B #$FF                                                 ;8181B6|C9FF    |      ;
    BNE +                                                      ;8181B8|D00D    |8181C7;
    SEP #$20                                                   ;8181BA|E220    |      ;
    STZ.W $0976+!RAM_SHIFT                                 ;8181BC|9C7609  |000976;
    LDA.B #!EITEM_PERFUMEGREEN                                                 
    STA.W nCarriedItemId                                       ;8181C1|8D8409  |000984;
    STA.W strcPlayerData.carryItemId                           ;8181C4|8D1D09  |00091D;
 
  + RTS                                                        ;8181C7|60      |      ;
 
 
subItemCarried_RedPerfume:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;8181C8|202389  |818923;
    SEP #$20                                                   ;8181CB|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8181CD|AD7609  |000976;
    CMP.B #$FF                                                 ;8181D0|C9FF    |      ;
    BNE +                                                      ;8181D2|D00D    |8181E1;
    SEP #$20                                                   ;8181D4|E220    |      ;
    STZ.W $0976+!RAM_SHIFT                                 ;8181D6|9C7609  |000976;
    LDA.B #!EITEM_PERFUMERED                                                 
    STA.W nCarriedItemId                                       ;8181DB|8D8409  |000984;
    STA.W strcPlayerData.carryItemId                           ;8181DE|8D1D09  |00091D;
 
  + RTS                                                        ;8181E1|60      |      ;
 
 
subItemCarried_BluePerfume:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;8181E2|202389  |818923;
    SEP #$20                                                   ;8181E5|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8181E7|AD7609  |000976;
    CMP.B #$FF                                                 ;8181EA|C9FF    |      ;
    BNE +                                                      ;8181EC|D00D    |8181FB;
    SEP #$20                                                   ;8181EE|E220    |      ;
    STZ.W $0976+!RAM_SHIFT                                 ;8181F0|9C7609  |000976;
    LDA.B #!EITEM_PERFUMEBLUE                                                 
    STA.W nCarriedItemId                                       ;8181F5|8D8409  |000984;
    STA.W strcPlayerData.carryItemId                           ;8181F8|8D1D09  |00091D;
 
  + RTS                                                        ;8181FB|60      |      ;
 
 
subItemCarried_RedEgg:
    REP #$30                                                   ;8181FC|C230    |      ;
    %CheckFlag(unknown1, $0020)
    BEQ +                                                      ;818205|F003    |81820A;
    JMP.W fEggFestival_DiscardEgg                           ;818207|4C3783  |818337;
 
 
  + SEP #$20                                                   ;81820A|E220    |      ;
    REP #$10                                                   ;81820C|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81820E|AD7609  |000976;
    BNE ++                                                     ;818211|D019    |81822C;
    LDA.W $09AC+!RAM_SHIFT                                 ;818213|ADAC09  |0009AC;
    CMP.B #$01                                                 ;818216|C901    |      ;
    BEQ +                                                      ;818218|F003    |81821D;
    JMP.W fEggFestival_WrongEggDialog                         ;81821A|4C6C83  |81836C;
 
 
  + REP #$30                                                   ;81821D|C230    |      ;
    LDA.W #$00A1                                               ;81821F|A9A100  |      ;
    LDX.W $09AD+!RAM_SHIFT                                 ;818222|AEAD09  |0009AD;
    LDY.W $09AF+!RAM_SHIFT                                 ;818225|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;818228|223AB082|82B03A;
 
 ++ JSR.W fItemCarried_PhaseDispatch_Produce                                      ;81822C|20E588  |8188E5;
    SEP #$20                                                   ;81822F|E220    |      ;
    REP #$10                                                   ;818231|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818233|AD7609  |000976;
    CMP.B #$03                                                 ;818236|C903    |      ;
    BNE +                                                      ;818238|D003    |81823D;
    JMP.W fEggFestival_SetEggFlag0040                           ;81823A|4C5E83  |81835E;
 
 
  + RTS                                                        ;81823D|60      |      ;
 
 
subItemCarried_LightPurpleEgg:
    REP #$30                                                   ;81823E|C230    |      ;
    %CheckFlag(unknown1, $0020)
    BEQ +                                                      ;818247|F003    |81824C;
    JMP.W fEggFestival_DiscardEgg                           ;818249|4C3783  |818337;
 
 
  + SEP #$20                                                   ;81824C|E220    |      ;
    REP #$10                                                   ;81824E|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818250|AD7609  |000976;
    BNE ++                                                     ;818253|D019    |81826E;
    LDA.W $09AC+!RAM_SHIFT                                 ;818255|ADAC09  |0009AC;
    CMP.B #$02                                                 ;818258|C902    |      ;
    BEQ +                                                      ;81825A|F003    |81825F;
    JMP.W fEggFestival_WrongEggDialog                         ;81825C|4C6C83  |81836C;
 
 
  + REP #$30                                                   ;81825F|C230    |      ;
    LDA.W #$00A1                                               ;818261|A9A100  |      ;
    LDX.W $09AD+!RAM_SHIFT                                 ;818264|AEAD09  |0009AD;
    LDY.W $09AF+!RAM_SHIFT                                 ;818267|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;81826A|223AB082|82B03A;
 
 ++ JSR.W fItemCarried_PhaseDispatch_Produce                                      ;81826E|20E588  |8188E5;
    SEP #$20                                                   ;818271|E220    |      ;
    REP #$10                                                   ;818273|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818275|AD7609  |000976;
    CMP.B #$03                                                 ;818278|C903    |      ;
    BNE .return                                                ;81827A|D003    |81827F;
    JMP.W fEggFestival_SetEggFlag0040                           ;81827C|4C5E83  |81835E;
 
 
.return:
    RTS                                                        ;81827F|60      |      ;
 
 
subItemCarried_BlueEgg:
    REP #$30                                                   ;818280|C230    |      ;
    %CheckFlag(unknown1, $0020)
    BEQ +                                                      ;818289|F003    |81828E;
    JMP.W fEggFestival_DiscardEgg                           ;81828B|4C3783  |818337;
 
 
  + SEP #$20                                                   ;81828E|E220    |      ;
    REP #$10                                                   ;818290|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818292|AD7609  |000976;
    BNE ++                                                     ;818295|D019    |8182B0;
    LDA.W $09AC+!RAM_SHIFT                                 ;818297|ADAC09  |0009AC;
    CMP.B #$03                                                 ;81829A|C903    |      ;
    BEQ +                                                      ;81829C|F003    |8182A1;
    JMP.W fEggFestival_WrongEggDialog                         ;81829E|4C6C83  |81836C;
 
 
  + REP #$30                                                   ;8182A1|C230    |      ;
    LDA.W #$00A1                                               ;8182A3|A9A100  |      ;
    LDX.W $09AD+!RAM_SHIFT                                 ;8182A6|AEAD09  |0009AD;
    LDY.W $09AF+!RAM_SHIFT                                 ;8182A9|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;8182AC|223AB082|82B03A;
 
 ++ JSR.W fItemCarried_PhaseDispatch_Produce                                      ;8182B0|20E588  |8188E5;
    SEP #$20                                                   ;8182B3|E220    |      ;
    REP #$10                                                   ;8182B5|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8182B7|AD7609  |000976;
    CMP.B #$03                                                 ;8182BA|C903    |      ;
    BNE +                                                      ;8182BC|D003    |8182C1;
    JMP.W fEggFestival_SetEggFlag0040                           ;8182BE|4C5E83  |81835E;
 
 
  + RTS                                                        ;8182C1|60      |      ;
 
 
subItemCarried_PurpleEgg:
    REP #$30                                                   ;8182C2|C230    |      ;
    %CheckFlag(unknown1, $0020)
    BNE fEggFestival_DiscardEgg                             ;8182CB|D06A    |818337;
    SEP #$20                                                   ;8182CD|E220    |      ;
    REP #$10                                                   ;8182CF|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8182D1|AD7609  |000976;
    BNE ++                                                     ;8182D4|D019    |8182EF;
    LDA.W $09AC+!RAM_SHIFT                                 ;8182D6|ADAC09  |0009AC;
    CMP.B #$04                                                 ;8182D9|C904    |      ;
    BEQ +                                                      ;8182DB|F003    |8182E0;
    JMP.W fEggFestival_WrongEggDialog                         ;8182DD|4C6C83  |81836C;
 
 
  + REP #$30                                                   ;8182E0|C230    |      ;
    LDA.W #$00A1                                               ;8182E2|A9A100  |      ;
    LDX.W $09AD+!RAM_SHIFT                                 ;8182E5|AEAD09  |0009AD;
    LDY.W $09AF+!RAM_SHIFT                                 ;8182E8|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;8182EB|223AB082|82B03A;
 
 ++ JSR.W fItemCarried_PhaseDispatch_Produce                                      ;8182EF|20E588  |8188E5;
    SEP #$20                                                   ;8182F2|E220    |      ;
    REP #$10                                                   ;8182F4|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8182F6|AD7609  |000976;
    CMP.B #$03                                                 ;8182F9|C903    |      ;
    BEQ fEggFestival_SetEggFlag0040                             ;8182FB|F061    |81835E;
    RTS                                                        ;8182FD|60      |      ;
 
 
subItemCarried_GreenEgg:
    REP #$30                                                   ;8182FE|C230    |      ;
    %CheckFlag(unknown1, $0020)
    BNE fEggFestival_DiscardEgg                             ;818307|D02E    |818337;
    SEP #$20                                                   ;818309|E220    |      ;
    REP #$10                                                   ;81830B|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81830D|AD7609  |000976;
    BNE +                                                      ;818310|D016    |818328;
    LDA.W $09AC+!RAM_SHIFT                                 ;818312|ADAC09  |0009AC;
    CMP.B #$05                                                 ;818315|C905    |      ;
    BNE fEggFestival_WrongEggDialog                           ;818317|D053    |81836C;
    REP #$30                                                   ;818319|C230    |      ;
    LDA.W #$00A1                                               ;81831B|A9A100  |      ;
    LDX.W $09AD+!RAM_SHIFT                                 ;81831E|AEAD09  |0009AD;
    LDY.W $09AF+!RAM_SHIFT                                 ;818321|ACAF09  |0009AF;
    JSL.L fMap_UpdateCurrentTilemap                            ;818324|223AB082|82B03A;
 
  + JSR.W fItemCarried_PhaseDispatch_Produce                                      ;818328|20E588  |8188E5;
    SEP #$20                                                   ;81832B|E220    |      ;
    REP #$10                                                   ;81832D|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81832F|AD7609  |000976;
    CMP.B #$03                                                 ;818332|C903    |      ;
    BEQ fEggFestival_SetEggFlag0040                             ;818334|F028    |81835E;
    RTS                                                        ;818336|60      |      ;
 
 
fEggFestival_DiscardEgg:
    REP #$30                                                   ;818337|C230    |      ;
    LDA.W nGameObjectIdx                                       ;818339|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;81833C|85A5    |0000A5;
    JSL.L fObject_Destroy                                ;81833E|22A28185|8581A2;
    JSL.L fObjectSlots_FreeCurrent                                      ;818342|22F1A481|81A4F1;
    SEP #$20                                                   ;818346|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818348|9C1D09  |00091D;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
 
fEggFestival_SetEggFlag0040:
    REP #$30                                                   ;81835E|C230    |      ;
    %SetFlag(unknown1, $0040)
    RTS                                                        ;81836B|60      |      ;
 
 
fEggFestival_WrongEggDialog:
    REP #$30                                                   ;81836C|C230    |      ;
    LDA.W #$00FC                                               ;81836E|A9FC00  |      ;
    LDX.W $09AD+!RAM_SHIFT                                 ;818371|AEAD09  |0009AD;
    LDY.W $09AF+!RAM_SHIFT                                 ;818374|ACAF09  |0009AF;
    JSL.L fSetTileAtCoords                                     ;818377|2288A681|81A688;
    REP #$30                                                   ;81837B|C230    |      ;
    LDA.W nGameObjectIdx                                       ;81837D|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818380|85A5    |0000A5;
    JSL.L fObject_Destroy                                ;818382|22A28185|8581A2;
    JSL.L fObjectSlots_FreeCurrent                                      ;818386|22F1A481|81A4F1;
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
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;8183B7|20E588  |8188E5;
    RTS                                                        ;8183BA|60      |      ;
 
 
subItemCarried_Chicken:
    JSR.W fItemCarried_PhaseDispatch_Animal                                      ;8183BB|203A88  |81883A;
    RTS                                                        ;8183BE|60      |      ;
 
 
subItemCarried_Chick:
    JSR.W fItemCarried_PhaseDispatch_Animal                                      ;8183BF|203A88  |81883A;
    RTS                                                        ;8183C2|60      |      ;
 
 
subItemCarried_0x27:
    RTS                                                        ;8183C3|60      |      ;
 
 
subItemCarried_0x28:
    RTS                                                        ;8183C4|60      |      ;
 
 
subItemCarried_Mole:
    JSR.W fItemCarried_PhaseDispatch_Animal                                      ;8183C5|203A88  |81883A;
    RTS                                                        ;8183C8|60      |      ;
 
 
subItemCarried_0x2A:
    JSL.L fShed_PlaceEquippedTool                                      ;8183C9|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;8183CD|20C387  |8187C3;
    RTS                                                        ;8183D0|60      |      ;
 
 
subItemCarried_0x2B:
    JSL.L fShed_PlaceEquippedTool                                      ;8183D1|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;8183D5|20C387  |8187C3;
    RTS                                                        ;8183D8|60      |      ;
 
 
subItemCarried_0x2C:
    JSL.L fShed_PlaceEquippedTool                                      ;8183D9|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;8183DD|20C387  |8187C3;
    RTS                                                        ;8183E0|60      |      ;
 
 
subItemCarried_0x2D:
    JSL.L fShed_PlaceEquippedTool                                      ;8183E1|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;8183E5|20C387  |8187C3;
    RTS                                                        ;8183E8|60      |      ;
 
 
subItemCarried_0x2E:
    JSL.L fShed_PlaceEquippedTool                                      ;8183E9|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;8183ED|20C387  |8187C3;
    RTS                                                        ;8183F0|60      |      ;
 
 
subItemCarried_0x2F:
    JSL.L fShed_PlaceEquippedTool                                      ;8183F1|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;8183F5|20C387  |8187C3;
    RTS                                                        ;8183F8|60      |      ;
 
 
subItemCarried_0x30:
    JSL.L fShed_PlaceEquippedTool                                      ;8183F9|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;8183FD|20C387  |8187C3;
    RTS                                                        ;818400|60      |      ;
 
 
subItemCarried_0x31:
    JSL.L fShed_PlaceEquippedTool                                      ;818401|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;818405|20C387  |8187C3;
    RTS                                                        ;818408|60      |      ;
 
 
subItemCarried_0x32:
    JSL.L fShed_PlaceEquippedTool                                      ;818409|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;81840D|20C387  |8187C3;
    RTS                                                        ;818410|60      |      ;
 
 
subItemCarried_0x33:
    JSL.L fShed_PlaceEquippedTool                                      ;818411|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;818415|20C387  |8187C3;
    RTS                                                        ;818418|60      |      ;
 
 
subItemCarried_0x34:
    JSL.L fShed_PlaceEquippedTool                                      ;818419|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;81841D|20C387  |8187C3;
    RTS                                                        ;818420|60      |      ;
 
 
subItemCarried_0x35:
    JSL.L fShed_PlaceEquippedTool                                      ;818421|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;818425|20C387  |8187C3;
    RTS                                                        ;818428|60      |      ;
 
 
subItemCarried_0x36:
    JSL.L fShed_PlaceEquippedTool                                      ;818429|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;81842D|20C387  |8187C3;
    RTS                                                        ;818430|60      |      ;
 
 
subItemCarried_0x37:
    JSL.L fShed_PlaceEquippedTool                                      ;818431|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;818435|20C387  |8187C3;
    RTS                                                        ;818438|60      |      ;
 
 
subItemCarried_0x38:
    JSL.L fShed_PlaceEquippedTool                                      ;818439|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;81843D|20C387  |8187C3;
    RTS                                                        ;818440|60      |      ;
 
 
subItemCarried_0x39:
    JSL.L fShed_PlaceEquippedTool                                      ;818441|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;818445|20C387  |8187C3;
    RTS                                                        ;818448|60      |      ;
 
 
subItemCarried_0x3A:
    JSL.L fShed_PlaceEquippedTool                                      ;818449|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;81844D|20C387  |8187C3;
    RTS                                                        ;818450|60      |      ;
 
 
subItemCarried_0x3B:
    JSL.L fShed_PlaceEquippedTool                                      ;818451|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;818455|20C387  |8187C3;
    RTS                                                        ;818458|60      |      ;
 
 
subItemCarried_0x3C:
    JSL.L fShed_PlaceEquippedTool                                      ;818459|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;81845D|20C387  |8187C3;
    RTS                                                        ;818460|60      |      ;
 
 
subItemCarried_0x3D:
    JSL.L fShed_PlaceEquippedTool                                      ;818461|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;818465|20C387  |8187C3;
    RTS                                                        ;818468|60      |      ;
 
 
subItemCarried_0x3E:
    JSL.L fShed_PlaceEquippedTool                                      ;818469|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;81846D|20C387  |8187C3;
    RTS                                                        ;818470|60      |      ;
 
 
subItemCarried_0x3F:
    JSL.L fShed_PlaceEquippedTool                                      ;818471|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;818475|20C387  |8187C3;
    RTS                                                        ;818478|60      |      ;
 
 
subItemCarried_0x40:
    JSL.L fShed_PlaceEquippedTool                                      ;818479|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;81847D|20C387  |8187C3;
    RTS                                                        ;818480|60      |      ;
 
 
subItemCarried_0x41:
    JSL.L fShed_PlaceEquippedTool                                      ;818481|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;818485|20C387  |8187C3;
    RTS                                                        ;818488|60      |      ;
 
 
subItemCarried_0x42:
    JSL.L fShed_PlaceEquippedTool                                      ;818489|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;81848D|20C387  |8187C3;
    RTS                                                        ;818490|60      |      ;
 
 
subItemCarried_0x43:
    JSL.L fShed_PlaceEquippedTool                                      ;818491|224AA981|81A94A;
    JSR.W fItemCarriedTool_EquipFromShed                                      ;818495|20C387  |8187C3;
    RTS                                                        ;818498|60      |      ;
 
 
subItemCarried_0x44:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;818499|202389  |818923;
    SEP #$20                                                   ;81849C|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81849E|AD7609  |000976;
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
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;8184D5|202389  |818923;
    SEP #$20                                                   ;8184D8|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8184DA|AD7609  |000976;
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
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;818511|202389  |818923;
    SEP #$20                                                   ;818514|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818516|AD7609  |000976;
    CMP.B #$FF                                                 ;818519|C9FF    |      ;
    BNE ++                                                     ;81851B|D02F    |81854C;
    LDA.L strcShedItems.row1                                   ;81851D|AF001F7F|7F1F00;
    ORA.B #$20                                                 ;818521|0920    |      ;
    STA.L strcShedItems.row1                                   ;818523|8F001F7F|7F1F00;
    SEP #$20                                                   ;818527|E220    |      ;
    if !REGION_DE
    LDA.W strcPlayerData.toolEquipped
    CMP.B #$06
    BNE .r_818529_1
    STZ.W strcPlayerData.toolEquipped
.r_818529_1:
  + SEP #$20
    LDA.W strcPlayerData.toolSecond
    CMP.B #$06
    BNE .r_818529_2
    STZ.W strcPlayerData.toolSecond
.r_818529_2:
    SEP #$20
    LDA.W strcPlayerData.leftTomatoSeeds
    CMP.B #$FF
    else
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
    endif
    BEQ ++                                                     ;818546|F004    |81854C;
    INC A                                                      ;818548|1A      |      ;
    STA.W strcPlayerData.leftTomatoSeeds                       ;818549|8D2909  |000929;
 
 ++ RTS                                                        ;81854C|60      |      ;
 
 
subItemCarried_0x47:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;81854D|202389  |818923;
    SEP #$20                                                   ;818550|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818552|AD7609  |000976;
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
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;818589|202389  |818923;
    SEP #$20                                                   ;81858C|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81858E|AD7609  |000976;
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
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;8185C5|202389  |818923;
    SEP #$20                                                   ;8185C8|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8185CA|AD7609  |000976;
    CMP.B #$FF                                                 ;8185CD|C9FF    |      ;
    BNE +                                                      ;8185CF|D00D    |8185DE;
    SEP #$20                                                   ;8185D1|E220    |      ;
    STZ.W $0976+!RAM_SHIFT                                 ;8185D3|9C7609  |000976;
    LDA.B #!EITEM_CHICKENFEED                                                 
    STA.W nCarriedItemId                                       ;8185D8|8D8409  |000984;
    STA.W strcPlayerData.carryItemId                           ;8185DB|8D1D09  |00091D;
 
  + RTS                                                        ;8185DE|60      |      ;
 
 
subItemCarried_0x4A:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;8185DF|202389  |818923;
    SEP #$20                                                   ;8185E2|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8185E4|AD7609  |000976;
    CMP.B #$FF                                                 ;8185E7|C9FF    |      ;
    BNE +                                                      ;8185E9|D00A    |8185F5;
    LDA.L strcShedItems.row2                                   ;8185EB|AF011F7F|7F1F01;
    ORA.B #$10                                                 ;8185EF|0910    |      ;
    STA.L strcShedItems.row2                                   ;8185F1|8F011F7F|7F1F01;
 
  + RTS                                                        ;8185F5|60      |      ;
 
 
subItemCarried_0x4B:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;8185F6|202389  |818923;
    SEP #$20                                                   ;8185F9|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8185FB|AD7609  |000976;
    CMP.B #$FF                                                 ;8185FE|C9FF    |      ;
    BNE +                                                      ;818600|D00A    |81860C;
    LDA.L strcShedItems.row2                                   ;818602|AF011F7F|7F1F01;
    ORA.B #$20                                                 ;818606|0920    |      ;
    STA.L strcShedItems.row2                                   ;818608|8F011F7F|7F1F01;
 
  + RTS                                                        ;81860C|60      |      ;
 
 
subItemCarried_0x4C:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;81860D|202389  |818923;
    SEP #$20                                                   ;818610|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818612|AD7609  |000976;
    CMP.B #$FF                                                 ;818615|C9FF    |      ;
    BNE +                                                      ;818617|D00A    |818623;
    LDA.L strcShedItems.row2                                   ;818619|AF011F7F|7F1F01;
    ORA.B #$40                                                 ;81861D|0940    |      ;
    STA.L strcShedItems.row2                                   ;81861F|8F011F7F|7F1F01;
 
  + RTS                                                        ;818623|60      |      ;
 
 
subItemCarried_0x4D:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;818624|202389  |818923;
    SEP #$20                                                   ;818627|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818629|AD7609  |000976;
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
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;81865B|202389  |818923;
    SEP #$20                                                   ;81865E|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818660|AD7609  |000976;
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
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;818692|202389  |818923;
    SEP #$20                                                   ;818695|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818697|AD7609  |000976;
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
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;8186C9|202389  |818923;
    SEP #$20                                                   ;8186CC|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8186CE|AD7609  |000976;
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
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;818700|202389  |818923;
    SEP #$20                                                   ;818703|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818705|AD7609  |000976;
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
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;818737|202389  |818923;
    SEP #$20                                                   ;81873A|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81873C|AD7609  |000976;
    CMP.B #$FF                                                 ;81873F|C9FF    |      ;
    BNE +                                                      ;818741|D00A    |81874D;
    LDA.L strcShedItems.row2                                   ;818743|AF011F7F|7F1F01;
    ORA.B #$01                                                 ;818747|0901    |      ;
    STA.L strcShedItems.row2                                   ;818749|8F011F7F|7F1F01;
 
  + RTS                                                        ;81874D|60      |      ;
 
 
subItemCarried_0x53:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;81874E|202389  |818923;
    SEP #$20                                                   ;818751|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818753|AD7609  |000976;
    CMP.B #$FF                                                 ;818756|C9FF    |      ;
    BNE +                                                      ;818758|D00A    |818764;
    LDA.L strcShedItems.row2                                   ;81875A|AF011F7F|7F1F01;
    ORA.B #$02                                                 ;81875E|0902    |      ;
    STA.L strcShedItems.row2                                   ;818760|8F011F7F|7F1F01;
 
  + RTS                                                        ;818764|60      |      ;
 
 
subItemCarried_0x54:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;818765|202389  |818923;
    SEP #$20                                                   ;818768|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81876A|AD7609  |000976;
    CMP.B #$FF                                                 ;81876D|C9FF    |      ;
    BNE +                                                      ;81876F|D00F    |818780;
    LDA.L strcShedItems.row4                                   ;818771|AF031F7F|7F1F03;
    ORA.B #$01                                                 ;818775|0901    |      ;
    STA.L strcShedItems.row4                                   ;818777|8F031F7F|7F1F03;
    LDA.B #$0C                                                 ;81877B|A90C    |      ;
    STA.W strcPlayerData.leftChickenFood                       ;81877D|8D2D09  |00092D;
 
  + RTS                                                        ;818780|60      |      ;
 
 
subItemCarried_0x55:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;818781|202389  |818923;
    SEP #$20                                                   ;818784|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818786|AD7609  |000976;
    CMP.B #$FF                                                 ;818789|C9FF    |      ;
    BNE +                                                      ;81878B|D00F    |81879C;
    LDA.L strcShedItems.row4                                   ;81878D|AF031F7F|7F1F03;
    ORA.B #$02                                                 ;818791|0902    |      ;
    STA.L strcShedItems.row4                                   ;818793|8F031F7F|7F1F03;
    LDA.B #$0C                                                 ;818797|A90C    |      ;
    STA.W strcPlayerData.leftCowFood                           ;818799|8D2C09  |00092C;
 
  + RTS                                                        ;81879C|60      |      ;
 
 
subItemCarried_0x56:
    JSR.W fItemCarried_PhaseDispatch_Buyable                                      ;81879D|202389  |818923;
    SEP #$20                                                   ;8187A0|E220    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8187A2|AD7609  |000976;
    CMP.B #$FF                                                 ;8187A5|C9FF    |      ;
    BNE +                                                      ;8187A7|D00D    |8187B6;
    SEP #$20                                                   ;8187A9|E220    |      ;
    STZ.W $0976+!RAM_SHIFT                                 ;8187AB|9C7609  |000976;
    LDA.B #!EITEM_TOMATOSEED                                                 
    STA.W nCarriedItemId                                       ;8187B0|8D8409  |000984;
    STA.W strcPlayerData.carryItemId                           ;8187B3|8D1D09  |00091D;
 
  + RTS                                                        ;8187B6|60      |      ;
 
 
subItemCarried_0x58:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;8187B7|20E588  |8188E5;
    RTS                                                        ;8187BA|60      |      ;
 
 
subItemCarried_0x59:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;8187BB|20E588  |8188E5;
    RTS                                                        ;8187BE|60      |      ;
 
 
subItemCarried_0x5A:
    JSR.W fItemCarried_PhaseDispatch_Produce                                      ;8187BF|20E588  |8188E5;
    RTS                                                        ;8187C2|60      |      ;
 
 
fItemCarriedTool_EquipFromShed:
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
    JSL.L fObject_Destroy                                ;818828|22A28185|8581A2;
    JSL.L fObjectSlots_FreeCurrent                                      ;81882C|22F1A481|81A4F1;
    SEP #$20                                                   ;818830|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818832|9C1D09  |00091D;
    JSL.L fToolUsedSound_PlayOnToolChange                         ;818835|22F38F82|828FF3;
    RTS                                                        ;818839|60      |      ;
 
 
fItemCarried_PhaseDispatch_Animal:
    SEP #$20                                                   ;81883A|E220    |      ;
    REP #$10                                                   ;81883C|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81883E|AD7609  |000976;
    BNE +                                                      ;818841|D003    |818846;
    JMP.W fItemCarried_StartHolding                                      ;818843|4C1090  |819010;
 
 
  + CMP.B #$02                                                 ;818846|C902    |      ;
    BNE +                                                      ;818848|D003    |81884D;
    JMP.W fItemCarriedAnimal_CarryLoop                                      ;81884A|4C2892  |819228;
 
 
  + CMP.B #$03                                                 ;81884D|C903    |      ;
    BNE +                                                      ;81884F|D003    |818854;
    JMP.W fItemCarriedAnimal_PutDown                                      ;818851|4C1B8E  |818E1B;
 
 
  + RTS                                                        ;818854|60      |      ;
 
 
fItemCarried_PhaseDispatch_Forage:
    SEP #$20                                                   ;818855|E220    |      ;
    REP #$10                                                   ;818857|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818859|AD7609  |000976;
    BNE +                                                      ;81885C|D003    |818861;
    JMP.W fItemFound_ShowFoundDialog                             ;81885E|4C6B8B  |818B6B;
 
 
  + CMP.B #$01                                                 ;818861|C901    |      ;
    BNE +                                                      ;818863|D003    |818868;
    JMP.W fItemFound_Consume                                   ;818865|4CA58B  |818BA5;
 
 
  + CMP.B #$02                                                 ;818868|C902    |      ;
    BNE +                                                      ;81886A|D003    |81886F;
    JMP.W fItemCarried_CarryLoop                                      ;81886C|4C4990  |819049;
 
 
  + CMP.B #$03                                                 ;81886F|C903    |      ;
    BNE +                                                      ;818871|D003    |818876;
    JMP.W fItemCarried_PutDown                                      ;818873|4C7993  |819379;
 
 
  + CMP.B #$04                                                 ;818876|C904    |      ;
    BNE +                                                      ;818878|D003    |81887D;
    JMP.W fItemCarried_PhaseClearSlot                                      ;81887A|4C8F96  |81968F;
 
 
  + CMP.B #$05                                                 ;81887D|C905    |      ;
    BNE +                                                      ;81887F|D003    |818884;
    JMP.W fItemSell_ShowPriceDialog                              ;818881|4C2A8F  |818F2A;
 
 
  + CMP.B #$06                                                 ;818884|C906    |      ;
    BNE +                                                      ;818886|D003    |81888B;
    JMP.W fItemSell_HandleAnswer                              ;818888|4C5A8F  |818F5A;
 
 
  + CMP.B #$07                                                 ;81888B|C907    |      ;
    BNE +                                                      ;81888D|D003    |818892;
    JMP.W fItemCarried_PhaseWaitScriptEnd                                      ;81888F|4C9596  |819695;
 
 
  + CMP.B #$08                                                 ;818892|C908    |      ;
    BNE +                                                      ;818894|D003    |818899;
    JMP.W fItemCarried_DestroyAndRelease                                      ;818896|4C2190  |819021;
 
 
  + RTS                                                        ;818899|60      |      ;
 
 
fItemCarried_PhaseDispatch_NoSell:
    SEP #$20                                                   ;81889A|E220    |      ;
    REP #$10                                                   ;81889C|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;81889E|AD7609  |000976;
    BNE +                                                      ;8188A1|D003    |8188A6;
    JMP.W fItemCarried_StartHolding                                      ;8188A3|4C1090  |819010;
 
 
  + CMP.B #$02                                                 ;8188A6|C902    |      ;
    BNE +                                                      ;8188A8|D003    |8188AD;
    JMP.W fItemCarried_CarryLoop_NoSell                                      ;8188AA|4C248C  |818C24;
 
 
  + CMP.B #$03                                                 ;8188AD|C903    |      ;
    BNE +                                                      ;8188AF|D003    |8188B4;
    JMP.W fItemCarried_PutDown_NoSell                                      ;8188B1|4C388D  |818D38;
 
 
  + CMP.B #$04                                                 ;8188B4|C904    |      ;
    BNE +                                                      ;8188B6|D003    |8188BB;
    JMP.W fItemCarried_ClearObjectSlot                                      ;8188B8|4C168E  |818E16;
 
 
  + RTS                                                        ;8188BB|60      |      ;
 
 
fItemCarried_PhaseDispatch_Feed:
    SEP #$20                                                   ;8188BC|E220    |      ;
    REP #$10                                                   ;8188BE|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8188C0|AD7609  |000976;
    BNE +                                                      ;8188C3|D003    |8188C8;
    JMP.W fItemCarried_StartHolding                                      ;8188C5|4C1090  |819010;
 
 
  + CMP.B #$02                                                 ;8188C8|C902    |      ;
    BNE +                                                      ;8188CA|D003    |8188CF;
    JMP.W fItemCarried_CarryLoop                                      ;8188CC|4C4990  |819049;
 
 
  + CMP.B #$03                                                 ;8188CF|C903    |      ;
    BNE +                                                      ;8188D1|D003    |8188D6;
    JMP.W fItemCarriedFeed_PutDown                                      ;8188D3|4C988E  |818E98;
 
 
  + CMP.B #$04                                                 ;8188D6|C904    |      ;
    BNE +                                                      ;8188D8|D003    |8188DD;
    JMP.W fItemCarried_PhaseClearSlot                                      ;8188DA|4C8F96  |81968F;
 
 
  + CMP.B #$08                                                 ;8188DD|C908    |      ;
    BNE +                                                      ;8188DF|D003    |8188E4;
    JMP.W fItemCarried_DestroyAndRelease                                      ;8188E1|4C2190  |819021;
 
 
  + RTS                                                        ;8188E4|60      |      ;
 
 
fItemCarried_PhaseDispatch_Produce:
    SEP #$20                                                   ;8188E5|E220    |      ;
    REP #$10                                                   ;8188E7|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;8188E9|AD7609  |000976;
    BNE +                                                      ;8188EC|D003    |8188F1;
    JMP.W fItemCarried_StartHolding                                      ;8188EE|4C1090  |819010;
 
 
  + CMP.B #$02                                                 ;8188F1|C902    |      ;
    BNE +                                                      ;8188F3|D003    |8188F8;
    JMP.W fItemCarried_CarryLoop                                      ;8188F5|4C4990  |819049;
 
 
  + CMP.B #$03                                                 ;8188F8|C903    |      ;
    BNE +                                                      ;8188FA|D003    |8188FF;
    JMP.W fItemCarried_PutDown                                      ;8188FC|4C7993  |819379;
 
 
  + CMP.B #$04                                                 ;8188FF|C904    |      ;
    BNE +                                                      ;818901|D003    |818906;
    JMP.W fItemCarried_PhaseClearSlot                                      ;818903|4C8F96  |81968F;
 
 
  + CMP.B #$05                                                 ;818906|C905    |      ;
    BNE +                                                      ;818908|D003    |81890D;
    JMP.W fItemSell_ShowPriceDialog                              ;81890A|4C2A8F  |818F2A;
 
 
  + CMP.B #$06                                                 ;81890D|C906    |      ;
    BNE +                                                      ;81890F|D003    |818914;
    JMP.W fItemSell_HandleAnswer                              ;818911|4C5A8F  |818F5A;
 
 
  + CMP.B #$07                                                 ;818914|C907    |      ;
    BNE +                                                      ;818916|D003    |81891B;
    JMP.W fItemCarried_PhaseWaitScriptEnd                                      ;818918|4C9596  |819695;
 
 
  + CMP.B #$08                                                 ;81891B|C908    |      ;
    BNE +                                                      ;81891D|D003    |818922;
    JMP.W fItemCarried_DestroyAndRelease                                      ;81891F|4C2190  |819021;
 
 
  + RTS                                                        ;818922|60      |      ;
 
 
fItemCarried_PhaseDispatch_Buyable:
    SEP #$20                                                   ;818923|E220    |      ;
    REP #$10                                                   ;818925|C210    |      ;
    LDA.W $0976+!RAM_SHIFT                                 ;818927|AD7609  |000976;
    BEQ fItemBuy_ShowPurchaseDialog                                 ;81892A|F013    |81893F;
    CMP.B #$01                                                 ;81892C|C901    |      ;
    BEQ fItemBuy_HandleAnswer                                 ;81892E|F059    |818989;
    CMP.B #$02                                                 ;818930|C902    |      ;
    BNE +                                                      ;818932|D003    |818937;
    JMP.W fItemBuy_WaitDialogClose                                      ;818934|4C948A  |818A94;
 
 
  + CMP.B #$03                                                 ;818937|C903    |      ;
    BNE +                                                      ;818939|D003    |81893E;
    JMP.W fItemBuy_FinishPurchase                                      ;81893B|4C198B  |818B19;
 
 
  + RTS                                                        ;81893E|60      |      ;
 
 
fItemBuy_ShowPurchaseDialog:
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
    STA.W $0976+!RAM_SHIFT                                 ;818983|8D7609  |000976;
    JMP.W fReturn_818B6A                                       ;818986|4C6A8B  |818B6A;
 
 
fItemBuy_HandleAnswer:
    SEP #$20                                                   ;818989|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;81898B|AD9A01  |00019A;
    CMP.B #$02                                                 ;81898E|C902    |      ;
    BNE +                                                      ;818990|D003    |818995;
    JMP.W fReturn_818B6A                                       ;818992|4C6A8B  |818B6A;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;818995|AD8F01  |00018F;
    BEQ +                                                      ;818998|F003    |81899D;
    JMP.W fItemBuy_ShowDeclineDialog                               ;81899A|4C4E8A  |818A4E;
 
 
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
    JMP.W fItemBuy_SetPhaseWaitDialog                                      ;818A37|4C448A  |818A44;
 
 
  + SEP #$20                                                   ;818A3A|E220    |      ;
    LDA.B #$03                                                 ;818A3C|A903    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;818A3E|8D7609  |000976;
    JMP.W fReturn_818B6A                                       ;818A41|4C6A8B  |818B6A;
 
 
fItemBuy_SetPhaseWaitDialog:
    SEP #$20                                                   ;818A44|E220    |      ;
    LDA.B #$02                                                 ;818A46|A902    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;818A48|8D7609  |000976;
    JMP.W fReturn_818B6A                                       ;818A4B|4C6A8B  |818B6A;
 
 
fItemBuy_ShowDeclineDialog:
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
    BRA fItemBuy_ReturnItemToShelf                                 ;818A92|800C    |818AA0;
 
 
fItemBuy_WaitDialogClose:
    SEP #$20                                                   ;818A94|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;818A96|AD9A01  |00019A;
    CMP.B #$02                                                 ;818A99|C902    |      ;
    BNE fItemBuy_ReturnItemToShelf                                 ;818A9B|D003    |818AA0;
    JMP.W fReturn_818B6A                                       ;818A9D|4C6A8B  |818B6A;
 
 
fItemBuy_ReturnItemToShelf:
    REP #$20                                                   ;818AA0|C220    |      ;
    LDA.W nGameObjectIdx                                       ;818AA2|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818AA5|85A5    |0000A5;
    JSL.L fObject_Destroy                                ;818AA7|22A28185|8581A2;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    JSL.L fObjectSlots_FreeCurrent                                      ;818ABE|22F1A481|81A4F1;
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
 
 
fItemBuy_FinishPurchase:
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
    JSL.L fObject_Destroy                                ;818B43|22A28185|8581A2;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    JSL.L fObjectSlots_FreeCurrent                                      ;818B5A|22F1A481|81A4F1;
    SEP #$20                                                   ;818B5E|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818B60|9C1D09  |00091D;
 
  + SEP #$20                                                   ;818B63|E220    |      ;
    LDA.B #$FF                                                 ;818B65|A9FF    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;818B67|8D7609  |000976;
 
fReturn_818B6A:
    RTS                                                        ;818B6A|60      |      ;
 
 
fItemFound_ShowFoundDialog:
    REP #$30                                                   ;818B6B|C230    |      ;
    LDY.W #$0001                                               ;818B6D|A00100  |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;818B70|22B78081|8180B7;
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
    STA.W $0976+!RAM_SHIFT                                 ;818B9F|8D7609  |000976;
    JMP.W fReturn_818C23                                       ;818BA2|4C238C  |818C23;
 
 
fItemFound_Consume:
    SEP #$20                                                   ;818BA5|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;818BA7|AD9A01  |00019A;
    CMP.B #$02                                                 ;818BAA|C902    |      ;
    BNE +                                                      ;818BAC|D003    |818BB1;
    JMP.W fReturn_818C23                                       ;818BAE|4C238C  |818C23;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;818BB1|AD8F01  |00018F;
    BEQ +                                                      ;818BB4|F003    |818BB9;
    JMP.W fItemFound_DeclineConsume                                      ;818BB6|4C0C8C  |818C0C;
 
 
  + %SetPlayerAction(!PACTION_CONSUMEITEM)
    %UnsetPlayerFlag(!PFLAGS_ANIMATING)
    REP #$20                                                   ;818BCC|C220    |      ;
    LDA.W nGameObjectIdx                                       ;818BCE|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818BD1|85A5    |0000A5;
    JSL.L fObject_Destroy                                ;818BD3|22A28185|8581A2;
    JSL.L fObjectSlots_FreeCurrent                                      ;818BD7|22F1A481|81A4F1;
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
 
 
fItemFound_DeclineConsume:
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;818C1C|E220    |      ;
    LDA.B #$02                                                 ;818C1E|A902    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;818C20|8D7609  |000976;
 
fReturn_818C23:
    RTS                                                        ;818C23|60      |      ;
 
 
fItemCarried_CarryLoop_NoSell:
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
    JSL.L fItemCarried_LoadPoseData                                      ;818C43|22B78081|8180B7;
    SEP #$20                                                   ;818C47|E220    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;818C49|AD7409  |000974;
    AND.B #$FB                                                 ;818C4C|29FB    |      ;
    STA.W $0974+!RAM_SHIFT                                 ;818C4E|8D7409  |000974;
    BRA .label3                                                ;818C51|8032    |818C85;
 
 
.label2:
    SEP #$20                                                   ;818C53|E220    |      ;
    REP #$10                                                   ;818C55|C210    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;818C57|AD7409  |000974;
    AND.B #$04                                                 ;818C5A|2904    |      ;
    BNE .label4                                                ;818C5C|D013    |818C71;
    LDY.W #$000B                                               ;818C5E|A00B00  |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;818C61|22B78081|8180B7;
    SEP #$20                                                   ;818C65|E220    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;818C67|AD7409  |000974;
    ORA.B #$04                                                 ;818C6A|0904    |      ;
    STA.W $0974+!RAM_SHIFT                                 ;818C6C|8D7409  |000974;
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
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;818CAB|2261AC82|82AC61;
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
    JSL.L fItemCarried_LoadPoseData                                      ;818D20|22B78081|8180B7;
    SEP #$20                                                   ;818D24|E220    |      ;
    LDA.B #$03                                                 ;818D26|A903    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;818D28|8D7609  |000976;
    JMP.W fReturn_818E1A                                       ;818D2B|4C1A8E  |818E1A;
 
 
.label7:
    %SetPlayerAction(!PACTION_NONE)
    JMP.W fReturn_818E1A                                       ;818D35|4C1A8E  |818E1A;
 
 
fItemCarried_PutDown_NoSell:
    REP #$20                                                   ;818D38|C220    |      ;
    LDA.W #$0001                                               ;818D3A|A90100  |      ;
    LDX.W #$0006                                               ;818D3D|A20600  |      ;
    LDY.W #$0006                                               ;818D40|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;818D43|224ED181|81D14E;
    REP #$30                                                   ;818D47|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;818D49|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;818D4C|AC8709  |000987;
    LDA.W #$0002                                               ;818D4F|A90200  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;818D52|2261AC82|82AC61;
    REP #$30                                                   ;818D56|C230    |      ;
    CPX.W #$0001                                               ;818D58|E00100  |      ;
    BEQ fItemShipped_SetBinTileAndRelease                             ;818D5B|F04E    |818DAB;
    CPX.W #$0002                                               ;818D5D|E00200  |      ;
    BEQ fItemShipped_SetBinTileAndRelease                             ;818D60|F049    |818DAB;
    CPX.W #$0007                                               ;818D62|E00700  |      ;
    BEQ fItemShipped_SetBinTileAndRelease                             ;818D65|F044    |818DAB;
    CPX.W #$0008                                               ;818D67|E00800  |      ;
    BEQ fItemShipped_SetBinTileAndRelease                             ;818D6A|F03F    |818DAB;
    REP #$20                                                   ;818D6C|C220    |      ;
    LDA.W #$0000                                               ;818D6E|A90000  |      ;
    CPX.W #$00F0                                               ;818D71|E0F000  |      ;
    BNE +                                                      ;818D74|D003    |818D79;
    JMP.W fItemCarried_StartDropAtTarget                                      ;818D76|4CEC8D  |818DEC;
 
 
  + LDA.W #$0001                                               ;818D79|A90100  |      ;
    CPX.W #$00F9                                               ;818D7C|E0F900  |      ;
    BEQ fItemCarried_StartDropAtTarget                                        ;818D7F|F06B    |818DEC;
    LDA.W #$0002                                               ;818D81|A90200  |      ;
    CPX.W #$00FA                                               ;818D84|E0FA00  |      ;
    BEQ fItemCarried_StartDropAtTarget                                        ;818D87|F063    |818DEC;
    LDA.W #$0003                                               ;818D89|A90300  |      ;
    CPX.W #$00FB                                               ;818D8C|E0FB00  |      ;
    BEQ fItemCarried_StartDropAtTarget                                        ;818D8F|F05B    |818DEC;
    LDA.W #$0004                                               ;818D91|A90400  |      ;
    CPX.W #$00FC                                               ;818D94|E0FC00  |      ;
    BEQ fItemCarried_StartDropAtTarget                                        ;818D97|F053    |818DEC;
    LDA.W #$0005                                               ;818D99|A90500  |      ;
    CPX.W #$00FD                                               ;818D9C|E0FD00  |      ;
    BEQ fItemCarried_StartDropAtTarget                                        ;818D9F|F04B    |818DEC;
    %SetPlayerAction(!PACTION_NONE)
    JMP.W fReturn_818E1A                                       ;818DA8|4C1A8E  |818E1A;
 
 
fItemShipped_SetBinTileAndRelease:
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
    JSL.L fObject_Destroy                                ;818DDD|22A28185|8581A2;
    JSL.L fObjectSlots_FreeCurrent                                      ;818DE1|22F1A481|81A4F1;
    SEP #$20                                                   ;818DE5|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818DE7|9C1D09  |00091D;
    BRA fReturn_818E1A                                         ;818DEA|802E    |818E1A;
 
 
fItemCarried_StartDropAtTarget:
    REP #$20                                                   ;818DEC|C220    |      ;
    ASL A                                                      ;818DEE|0A      |      ;
    ASL A                                                      ;818DEF|0A      |      ;
    TAX                                                        ;818DF0|AA      |      ;
    LDA.L aFixedDropPositionsXY,X                                    ;818DF1|BF63A381|81A363;
    STA.W nUnknownX                                            ;818DF5|8D8009  |000980;
    INX                                                        ;818DF8|E8      |      ;
    INX                                                        ;818DF9|E8      |      ;
    LDA.L aFixedDropPositionsXY,X                                    ;818DFA|BF63A381|81A363;
    STA.W nUnknownY                                            ;818DFE|8D8209  |000982;
    LDA.W #$00CA                                               ;818E01|A9CA00  |      ;
    STA.W $097A+!RAM_SHIFT                                 ;818E04|8D7A09  |00097A;
    SEP #$20                                                   ;818E07|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818E09|9C1D09  |00091D;
    SEP #$20                                                   ;818E0C|E220    |      ;
    LDA.B #$04                                                 ;818E0E|A904    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;818E10|8D7609  |000976;
    JMP.W fReturn_818E1A                                       ;818E13|4C1A8E  |818E1A;
 
 
fItemCarried_ClearObjectSlot:
    JSL.L fObjectSlots_FreeCurrent                                      ;818E16|22F1A481|81A4F1;
 
fReturn_818E1A:
    RTS                                                        ;818E1A|60      |      ;
 
 
fItemCarriedAnimal_PutDown:
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
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;818E7D|22F88084|8480F8;
    REP #$30                                                   ;818E81|C230    |      ;
    LDA.W nGameObjectIdx                                       ;818E83|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;818E86|85A5    |0000A5;
    JSL.L fObject_Destroy                                ;818E88|22A28185|8581A2;
    JSL.L fObjectSlots_FreeCurrent                                      ;818E8C|22F1A481|81A4F1;
    SEP #$20                                                   ;818E90|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;818E92|9C1D09  |00091D;
    JMP.W fReturn_8196AE                                       ;818E95|4CAE96  |8196AE;
 
 
fItemCarriedFeed_PutDown:
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
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;818EB7|2261AC82|82AC61;
    SEP #$20                                                   ;818EBB|E220    |      ;
    REP #$10                                                   ;818EBD|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;818EBF|A522    |000022;
    CMP.B #$27                                                 ;818EC1|C927    |      ;
    BEQ +                                                      ;818EC3|F007    |818ECC;
    CMP.B #$28                                                 ;818EC5|C928    |      ;
    BEQ .skip                                                  ;818EC7|F032    |818EFB;
    JMP.W fItemCarried_PutDown                                      ;818EC9|4C7993  |819379;
 
 
  + CPX.W #$00E2                                               ;818ECC|E0E200  |      ;
    BCS +                                                      ;818ECF|B003    |818ED4;
    JMP.W fItemCarried_PutDown                                      ;818ED1|4C7993  |819379;
 
 
  + CPX.W #$00EF                                               ;818ED4|E0EF00  |      ;
    BCC +                                                      ;818ED7|9003    |818EDC;
    JMP.W fItemCarried_PutDown                                      ;818ED9|4C7993  |819379;
 
 
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
    JMP.W fItemShipped_SetBinTileAndRelease                           ;818EF8|4CAB8D  |818DAB;
 
 
.skip:
    CPX.W #$00E2                                               ;818EFB|E0E200  |      ;
    BCS +                                                      ;818EFE|B003    |818F03;
    JMP.W fItemCarried_PutDown                                      ;818F00|4C7993  |819379;
 
 
  + CPX.W #$00EF                                               ;818F03|E0EF00  |      ;
    BCC +                                                      ;818F06|9003    |818F0B;
    JMP.W fItemCarried_PutDown                                      ;818F08|4C7993  |819379;
 
 
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
    JMP.W fItemShipped_SetBinTileAndRelease                           ;818F27|4CAB8D  |818DAB;
 
 
fItemSell_ShowPriceDialog:
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
    STA.W $0976+!RAM_SHIFT                                 ;818F54|8D7609  |000976;
    JMP.W fReturn_81900F                                       ;818F57|4C0F90  |81900F;
 
 
fItemSell_HandleAnswer:
    SEP #$20                                                   ;818F5A|E220    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;818F5C|AD9A01  |00019A;
    CMP.B #$02                                                 ;818F5F|C902    |      ;
    BNE +                                                      ;818F61|D003    |818F66;
    JMP.W fReturn_81900F                                       ;818F63|4C0F90  |81900F;
 
 
  + LDA.W strcDialogDisplay.dialogOptionsAnswer                ;818F66|AD8F01  |00018F;
    BEQ +                                                      ;818F69|F003    |818F6E;
    JMP.W fItemSell_ShowCancelDialog                                      ;818F6B|4CD78F  |818FD7;
 
 
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
    BEQ fItemSell_ResumeCarry                                        ;818F84|F064    |818FEA;
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
    JSL.L fObject_Destroy                                ;818FA0|22A28185|8581A2;
    JSL.L fObjectSlots_FreeCurrent                                      ;818FA4|22F1A481|81A4F1;
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
 
 
fItemSell_ShowCancelDialog:
    SEP #$20                                                   ;818FD7|E220    |      ;
    LDA.B #$02                                                 ;818FD9|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;818FDB|8D9A01  |00019A;
    LDX.W #$0303                                               ;818FDE|A20303  |      ;
    LDA.B #$00                                                 ;818FE1|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;818FE3|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;818FE6|225F9383|83935F;
 
fItemSell_ResumeCarry:
    REP #$20                                                   ;818FEA|C220    |      ;
    LDY.W #$0001                                               ;818FEC|A00100  |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;818FEF|22B78081|8180B7;
    LDA.W strcObjectData.camX                                  ;818FF3|AD0B09  |00090B;
    STA.W nUnknownX                                            ;818FF6|8D8009  |000980;
    LDA.W strcObjectData.camY                                  ;818FF9|AD0D09  |00090D;
    STA.W nUnknownY                                            ;818FFC|8D8209  |000982;
    SEP #$20                                                   ;818FFF|E220    |      ;
    LDA.B #$02                                                 ;819001|A902    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;819003|8D7609  |000976;
    %SetPlayerFlag(!PFLAGS_HOLDINGITEM)
 
fReturn_81900F:
    RTS                                                        ;81900F|60      |      ;
 
 
fItemCarried_StartHolding:
    REP #$30                                                   ;819010|C230    |      ;
    LDY.W #$0001                                               ;819012|A00100  |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;819015|22B78081|8180B7;
    SEP #$20                                                   ;819019|E220    |      ;
    LDA.B #$02                                                 ;81901B|A902    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;81901D|8D7609  |000976;
    RTS                                                        ;819020|60      |      ;
 
 
fItemCarried_DestroyAndRelease:
    REP #$30                                                   ;819021|C230    |      ;
    LDA.W nGameObjectIdx                                       ;819023|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;819026|85A5    |0000A5;
    JSL.L fObject_Destroy                                ;819028|22A28185|8581A2;
    JSL.L fObjectSlots_FreeCurrent                                      ;81902C|22F1A481|81A4F1;
    SEP #$20                                                   ;819030|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;819032|9C1D09  |00091D;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    RTS                                                        ;819048|60      |      ;
 
 
fItemCarried_CarryLoop:
    REP #$20                                                   ;819049|C220    |      ;
    LDA.B strcPlayer.posX                                      ;81904B|A5D6    |0000D6;
    STA.W nUnknownX                                            ;81904D|8D8009  |000980;
    LDA.B strcPlayer.posY                                      ;819050|A5D8    |0000D8;
    INC A                                                      ;819052|1A      |      ;
    INC A                                                      ;819053|1A      |      ;
    STA.W nUnknownY                                            ;819054|8D8209  |000982;
    %CheckPlayerAction(!PACTION_JUMP)
    BNE fItemCarried_CarryLoop_ActionJump                                        ;81905E|D003    |819063;
    JMP.W fItemCarried_CarryLoop_ActionOther                                      ;819060|4C7890  |819078;
 
 
fItemCarried_CarryLoop_ActionJump:
    REP #$30                                                   ;819063|C230    |      ;
    LDY.W #$0001                                               ;819065|A00100  |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;819068|22B78081|8180B7;
    SEP #$20                                                   ;81906C|E220    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;81906E|AD7409  |000974;
    AND.B #$FB                                                 ;819071|29FB    |      ;
    STA.W $0974+!RAM_SHIFT                                 ;819073|8D7409  |000974;
    BRA fItemCarried_HandleDropAction                                ;819076|8032    |8190AA;
 
 
fItemCarried_CarryLoop_ActionOther:
    SEP #$20                                                   ;819078|E220    |      ;
    REP #$10                                                   ;81907A|C210    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;81907C|AD7409  |000974;
    AND.B #$04                                                 ;81907F|2904    |      ;
    BNE +                                                      ;819081|D013    |819096;
    LDY.W #$000B                                               ;819083|A00B00  |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;819086|22B78081|8180B7;
    SEP #$20                                                   ;81908A|E220    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;81908C|AD7409  |000974;
    ORA.B #$04                                                 ;81908F|0904    |      ;
    STA.W $0974+!RAM_SHIFT                                 ;819091|8D7409  |000974;
    BRA fItemCarried_HandleDropAction                                ;819094|8014    |8190AA;
 
 
  + REP #$20                                                   ;819096|C220    |      ;
    LDA.W nGameObjectIdx                                       ;819098|AD7809  |000978;
    STA.B strcObject.gameObjectIdx                             ;81909B|85A5    |0000A5;
    JSL.L fObject_GetSingleObjectData                          ;81909D|22CB8185|8581CB;
    REP #$20                                                   ;8190A1|C220    |      ;
    LDA.B strcObject.exists                                    ;8190A3|A5A7    |0000A7;
    CMP.W #$FFFF                                               ;8190A5|C9FFFF  |      ;
    BEQ fItemCarried_CarryLoop_ActionJump                                        ;8190A8|F0B9    |819063;
 
fItemCarried_HandleDropAction:
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
    JMP.W fItemShipped_DropInBin                           ;8190D6|4C9591  |819195;
 
 
  + SEP #$20                                                   ;8190D9|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;8190DB|A522    |000022;
    CMP.B #$04                                                 ;8190DD|C904    |      ;
    BCS +                                                      ;8190DF|B003    |8190E4;
    JMP.W fItemCarried_BeginPutDown                                      ;8190E1|4C7E91  |81917E;
 
 
  + CMP.B #$08                                                 ;8190E4|C908    |      ;
    BCC +                                                      ;8190E6|9003    |8190EB;
    JMP.W fItemCarried_BeginPutDown                                      ;8190E8|4C7E91  |81917E;
 
 
  + LDA.L nCurrentWeekdayID                                    ;8190EB|AF1A1F7F|7F1F1A;
    BEQ +                                                      ;8190EF|F003    |8190F4;
    JMP.W fItemCarried_BeginPutDown                                      ;8190F1|4C7E91  |81917E;
 
 
  + LDA.L nCurrentTimeID                                       ;8190F4|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;8190F8|C911    |      ;
    BCC +                                                      ;8190FA|9003    |8190FF;
    JMP.W fItemCarried_BeginPutDown                                      ;8190FC|4C7E91  |81917E;
 
 
  + REP #$20                                                   ;8190FF|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;819101|AD9601  |000196;
    AND.W #$0002                                               ;819104|290200  |      ;
    BEQ +                                                      ;819107|F003    |81910C;
    JMP.W fItemCarried_BeginPutDown                                      ;819109|4C7E91  |81917E;
 
 
  + REP #$20                                                   ;81910C|C220    |      ;
    LDA.W #$0001                                               ;81910E|A90100  |      ;
    LDX.W #$0000                                               ;819111|A20000  |      ;
    LDY.W #$0000                                               ;819114|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;819117|224ED181|81D14E;
    REP #$20                                                   ;81911B|C220    |      ;
    LDA.W #$0000                                               ;81911D|A90000  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;819120|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;819123|AC8709  |000987;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;819126|2261AC82|82AC61;
    CPX.W #$00F0                                               ;81912A|E0F000  |      ;
    BEQ +                                                      ;81912D|F003    |819132;
    JMP.W fItemCarried_BeginPutDown                                      ;81912F|4C7E91  |81917E;
 
 
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
    JMP.W fItemCarried_BeginPutDown                                      ;819149|4C7E91  |81917E;
 
 
  + REP #$20                                                   ;81914C|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;81914E|AD8509  |000985;
    STA.W nUnknownX                                            ;819151|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;819154|AD8709  |000987;
    STA.W nUnknownY                                            ;819157|8D8209  |000982;
    LDY.W #$0000                                               ;81915A|A00000  |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;81915D|22B78081|8180B7;
    SEP #$20                                                   ;819161|E220    |      ;
    LDA.B #$05                                                 ;819163|A905    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;819165|8D7609  |000976;
    %SetPlayerAction(!PACTION_NONE)
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    JMP.W fReturn_819227                                       ;81917B|4C2792  |819227;
 
 
fItemCarried_BeginPutDown:
    REP #$30                                                   ;81917E|C230    |      ;
    LDA.W #$0006                                               ;819180|A90600  |      ;
    CLC                                                        ;819183|18      |      ;
    ADC.B strcPlayer.direction                                 ;819184|65DA    |0000DA;
    TAY                                                        ;819186|A8      |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;819187|22B78081|8180B7;
    SEP #$20                                                   ;81918B|E220    |      ;
    LDA.B #$03                                                 ;81918D|A903    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;81918F|8D7609  |000976;
    JMP.W fReturn_819227                                       ;819192|4C2792  |819227;
 
 
fItemShipped_DropInBin:
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
    JSL.L fItemCarried_LoadPoseData                                      ;8191B5|22B78081|8180B7;
    REP #$30                                                   ;8191B9|C230    |      ;
    %CheckFlag(daily2, $0010)
    BEQ fItemCarried_SetPhaseFinish                                        ;8191C2|F05C    |819220;
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
    JMP.W fItemCarried_SetPhaseFinish                                      ;8191DB|4C2092  |819220;
 
 
fItemShipped_AddProfit:
    LDA.L nCurrentTimeID                                       ;8191DE|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;8191E2|C911    |      ;
    BCS fItemCarried_SetPhaseFinish                                        ;8191E4|B03A    |819220;
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
 
fItemCarried_SetPhaseFinish:
    SEP #$20                                                   ;819220|E220    |      ;
    LDA.B #$08                                                 ;819222|A908    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;819224|8D7609  |000976;
 
fReturn_819227:
    RTS                                                        ;819227|60      |      ;
 
 
fItemCarriedAnimal_CarryLoop:
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
    JSL.L fItemCarried_LoadPoseData                                      ;819247|22B78081|8180B7;
    SEP #$20                                                   ;81924B|E220    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;81924D|AD7409  |000974;
    AND.B #$FB                                                 ;819250|29FB    |      ;
    STA.W $0974+!RAM_SHIFT                                 ;819252|8D7409  |000974;
    BRA .label2                                                ;819255|8032    |819289;
 
 
.jump:
    SEP #$20                                                   ;819257|E220    |      ;
    REP #$10                                                   ;819259|C210    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;81925B|AD7409  |000974;
    AND.B #$04                                                 ;81925E|2904    |      ;
    BNE .label1                                                ;819260|D013    |819275;
    LDY.W #$000B                                               ;819262|A00B00  |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;819265|22B78081|8180B7;
    SEP #$20                                                   ;819269|E220    |      ;
    LDA.W $0974+!RAM_SHIFT                                 ;81926B|AD7409  |000974;
    ORA.B #$04                                                 ;81926E|0904    |      ;
    STA.W $0974+!RAM_SHIFT                                 ;819270|8D7409  |000974;
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
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;8192D2|2261AC82|82AC61;
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
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;819301|2261AC82|82AC61;
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
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;819330|2261AC82|82AC61;
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
    JSL.L fItemCarried_LoadPoseData                                      ;819362|22B78081|8180B7;
    SEP #$20                                                   ;819366|E220    |      ;
    LDA.B #$03                                                 ;819368|A903    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;81936A|8D7609  |000976;
    BRA .justReturn                                            ;81936D|8009    |819378;
 
 
.label3:
    %SetPlayerAction(!PACTION_NONE)
    BRA .justReturn                                            ;819376|8000    |819378;
 
 
.justReturn:
    RTS                                                        ;819378|60      |      ;
 
 
fItemCarried_PutDown:
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
 
 
  + JMP.W fItemCarried_PlaceEggInIncubator                                      ;819394|4C9794  |819497;
 
 
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
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;8193B1|2261AC82|82AC61;
    CPX.W #$00F2                                               ;8193B5|E0F200  |      ;
    BEQ +                                                      ;8193B8|F003    |8193BD;
    JMP.W fItemCarried_PlaceEggInIncubator                                      ;8193BA|4C9794  |819497;
 
 
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
    JMP.W fItemCarried_PlaceEggInIncubator                                      ;8193D6|4C9794  |819497;
 
 
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
    JSL.L fObject_Destroy                                ;819415|22A28185|8581A2;
    SEP #$20                                                   ;819419|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;81941B|A522    |000022;
    CMP.B #$27                                                 ;81941D|C927    |      ;
    BNE +                                                      ;81941F|D003    |819424;
    JMP.W fItemShipped_StartCowBarnScript                                      ;819421|4C4F94  |81944F;
 
 
  + CMP.B #$28                                                 ;819424|C928    |      ;
    BNE +                                                      ;819426|D003    |81942B;
    JMP.W fItemShipped_StartCoopScript                                      ;819428|4C7394  |819473;
 
 
  + REP #$20                                                   ;81942B|C220    |      ;
    LDA.W #$0024                                               ;81942D|A92400  |      ;
    JSL.L fTileScript_Start                                ;819430|22E1A581|81A5E1;
    SEP #$20                                                   ;819434|E220    |      ;
    LDA.B #$07                                                 ;819436|A907    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;819438|8D7609  |000976;
    %UnsetPlayerFlag(!PFLAGS_ACTIVE)
    SEP #$20                                                   ;819447|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;819449|9C1D09  |00091D;
    JMP.W fReturn_8196AE                                       ;81944C|4CAE96  |8196AE;
 
 
fItemShipped_StartCowBarnScript:
    REP #$20                                                   ;81944F|C220    |      ;
    LDA.W #$0025                                               ;819451|A92500  |      ;
    JSL.L fTileScript_Start                                ;819454|22E1A581|81A5E1;
    SEP #$20                                                   ;819458|E220    |      ;
    LDA.B #$07                                                 ;81945A|A907    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;81945C|8D7609  |000976;
    %UnsetPlayerFlag(!PFLAGS_ACTIVE)
    SEP #$20                                                   ;81946B|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;81946D|9C1D09  |00091D;
    JMP.W fReturn_8196AE                                       ;819470|4CAE96  |8196AE;
 
 
fItemShipped_StartCoopScript:
    REP #$20                                                   ;819473|C220    |      ;
    LDA.W #$0026                                               ;819475|A92600  |      ;
    JSL.L fTileScript_Start                                ;819478|22E1A581|81A5E1;
    SEP #$20                                                   ;81947C|E220    |      ;
    LDA.B #$07                                                 ;81947E|A907    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;819480|8D7609  |000976;
    %UnsetPlayerFlag(!PFLAGS_ACTIVE)
    SEP #$20                                                   ;81948F|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;819491|9C1D09  |00091D;
    JMP.W fReturn_8196AE                                       ;819494|4CAE96  |8196AE;
 
 
fItemCarried_PlaceEggInIncubator:
    SEP #$20                                                   ;819497|E220    |      ;
    REP #$10                                                   ;819499|C210    |      ;
    LDA.W strcPlayerData.carryItemId                           ;81949B|AD1D09  |00091D;
    CMP.B #!CITEM_EGG                                                 
    BEQ +                                                      ;8194A0|F003    |8194A5;
    JMP.W fItemCarried_PutDown_Outdoor                                      ;8194A2|4C3F95  |81953F;
 
 
  + LDA.B strcMap.loadAreaId                                   ;8194A5|A522    |000022;
    CMP.B #!AREA_COOP                                                 
    BEQ +                                                      ;8194A9|F003    |8194AE;
    JMP.W fItemCarried_PutDown_Outdoor                                      ;8194AB|4C3F95  |81953F;
 
 
  + REP #$20                                                   ;8194AE|C220    |      ;
    LDA.W #$0001                                               ;8194B0|A90100  |      ;
    LDX.W #$0000                                               ;8194B3|A20000  |      ;
    LDY.W #$0000                                               ;8194B6|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;8194B9|224ED181|81D14E;
    REP #$20                                                   ;8194BD|C220    |      ;
    LDA.W #$0000                                               ;8194BF|A90000  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8194C2|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8194C5|AC8709  |000987;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;8194C8|2261AC82|82AC61;
    CPX.W #$00F7                                               ;8194CC|E0F700  |      ;
    BEQ +                                                      ;8194CF|F003    |8194D4;
    JMP.W fItemCarried_PutDown_Outdoor                                      ;8194D1|4C3F95  |81953F;
 
 
  + REP #$30                                                   ;8194D4|C230    |      ;
    %CheckFlag(event6, $2000)
    BEQ +                                                      ;8194DD|F003    |8194E2;
    JMP.W fItemCarried_PutDown_Outdoor                                      ;8194DF|4C3F95  |81953F;
 
 
  + REP #$30                                                   ;8194E2|C230    |      ;
    LDA.W #$0014                                               ;8194E4|A91400  |      ;
    LDX.W #$0000                                               ;8194E7|A20000  |      ;
    LDY.W #$0000                                               ;8194EA|A00000  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;8194ED|22F88084|8480F8;
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
    JSL.L fObject_Destroy                                ;819526|22A28185|8581A2;
    JSL.L fObjectSlots_FreeCurrent                                      ;81952A|22F1A481|81A4F1;
    SEP #$20                                                   ;81952E|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;819530|9C1D09  |00091D;
    REP #$30                                                   ;819533|C230    |      ;
    LDA.W #$0005                                               ;819535|A90500  |      ;
    JSL.L fGameEngine_AddHappiness                             ;819538|2282B283|83B282;
    JMP.W fReturn_8196AE                                       ;81953C|4CAE96  |8196AE;
 
 
fItemCarried_PutDown_Outdoor:
    SEP #$20                                                   ;81953F|E220    |      ;
    REP #$10                                                   ;819541|C210    |      ;
    LDA.B strcMap.loadAreaId                                   ;819543|A522    |000022;
    CMP.B #!AREA_TOWNSPRING                                                 
    BCC fItemCarried_PutDown_LowAreas                                        ;819547|9047    |819590;
    CMP.B #$10                                                 ;819549|C910    |      ;
    BCS +                                                      ;81954B|B003    |819550;
    JMP.W fItemCarried_DropInFront                                      ;81954D|4C5B96  |81965B;
 
 
  + CMP.B #$15                                                 ;819550|C915    |      ;
    BCC +                                                      ;819552|9003    |819557;
    JMP.W fItemCarried_DropInFront                                      ;819554|4C5B96  |81965B;
 
 
  + REP #$20                                                   ;819557|C220    |      ;
    LDA.W #$0001                                               ;819559|A90100  |      ;
    LDX.W #$0006                                               ;81955C|A20600  |      ;
    LDY.W #$0006                                               ;81955F|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;819562|224ED181|81D14E;
    REP #$30                                                   ;819566|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;819568|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;81956B|AC8709  |000987;
    LDA.W #$0002                                               ;81956E|A90200  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;819571|2261AC82|82AC61;
    REP #$30                                                   ;819575|C230    |      ;
    LDA.W #$0006                                               ;819577|A90600  |      ;
    CPX.W #$00F0                                               ;81957A|E0F000  |      ;
    BNE +                                                      ;81957D|D003    |819582;
    JMP.W fEvent_FreedImpFish                                  ;81957F|4CF495  |8195F4;
 
 
  + LDA.W #$0007                                               ;819582|A90700  |      ;
    CPX.W #$00F4                                               ;819585|E0F400  |      ;
    BNE +                                                      ;819588|D003    |81958D;
    JMP.W fItemCarried_ThrowToTarget                                      ;81958A|4C3196  |819631;
 
 
  + JMP.W fItemCarried_DropInFront                                      ;81958D|4C5B96  |81965B;
 
 
fItemCarried_PutDown_LowAreas:
    REP #$20                                                   ;819590|C220    |      ;
    LDA.W #$0001                                               ;819592|A90100  |      ;
    LDX.W #$0006                                               ;819595|A20600  |      ;
    LDY.W #$0006                                               ;819598|A00600  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;81959B|224ED181|81D14E;
    REP #$30                                                   ;81959F|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;8195A1|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;8195A4|AC8709  |000987;
    LDA.W #$0002                                               ;8195A7|A90200  |      ;
    JSL.L fObjectEngine_GetObjectPropertyByDirSeason                                      ;8195AA|2261AC82|82AC61;
    REP #$30                                                   ;8195AE|C230    |      ;
    LDA.W #$0000                                               ;8195B0|A90000  |      ;
    CPX.W #$00F0                                               ;8195B3|E0F000  |      ;
    BNE +                                                      ;8195B6|D003    |8195BB;
    JMP.W fItemCarried_ThrowToTarget                                      ;8195B8|4C3196  |819631;
 
 
  + LDA.W #$0001                                               ;8195BB|A90100  |      ;
    CPX.W #$00F9                                               ;8195BE|E0F900  |      ;
    BNE +                                                      ;8195C1|D003    |8195C6;
    JMP.W fItemCarried_ThrowToTarget                                      ;8195C3|4C3196  |819631;
 
 
  + LDA.W #$0002                                               ;8195C6|A90200  |      ;
    CPX.W #$00FA                                               ;8195C9|E0FA00  |      ;
    BNE +                                                      ;8195CC|D003    |8195D1;
    JMP.W fItemCarried_ThrowToTarget                                      ;8195CE|4C3196  |819631;
 
 
  + LDA.W #$0003                                               ;8195D1|A90300  |      ;
    CPX.W #$00FB                                               ;8195D4|E0FB00  |      ;
    BNE +                                                      ;8195D7|D003    |8195DC;
    JMP.W fItemCarried_ThrowToTarget                                      ;8195D9|4C3196  |819631;
 
 
  + LDA.W #$0004                                               ;8195DC|A90400  |      ;
    CPX.W #$00FC                                               ;8195DF|E0FC00  |      ;
    BNE +                                                      ;8195E2|D003    |8195E7;
    JMP.W fItemCarried_ThrowToTarget                                      ;8195E4|4C3196  |819631;
 
 
  + LDA.W #$0005                                               ;8195E7|A90500  |      ;
    CPX.W #$00FD                                               ;8195EA|E0FD00  |      ;
    BNE +                                                      ;8195ED|D003    |8195F2;
    JMP.W fItemCarried_ThrowToTarget                                      ;8195EF|4C3196  |819631;
 
 
  + BRA fItemCarried_DropInFront                                        ;8195F2|8067    |81965B;
 
 
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
 
fItemCarried_ThrowToTarget:
    REP #$20                                                   ;819631|C220    |      ;
    ASL A                                                      ;819633|0A      |      ;
    ASL A                                                      ;819634|0A      |      ;
    TAX                                                        ;819635|AA      |      ;
    LDA.L aFixedDropPositionsXY,X                                    ;819636|BF63A381|81A363;
    STA.W nUnknownX                                            ;81963A|8D8009  |000980;
    INX                                                        ;81963D|E8      |      ;
    INX                                                        ;81963E|E8      |      ;
    LDA.L aFixedDropPositionsXY,X                                    ;81963F|BF63A381|81A363;
    STA.W nUnknownY                                            ;819643|8D8209  |000982;
    LDA.W #$00CA                                               ;819646|A9CA00  |      ;
    STA.W $097A+!RAM_SHIFT                                 ;819649|8D7A09  |00097A;
    SEP #$20                                                   ;81964C|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;81964E|9C1D09  |00091D;
    SEP #$20                                                   ;819651|E220    |      ;
    LDA.B #$04                                                 ;819653|A904    |      ;
    STA.W $0976+!RAM_SHIFT                                 ;819655|8D7609  |000976;
    JMP.W fReturn_8196AE                                       ;819658|4CAE96  |8196AE;
 
 
fItemCarried_DropInFront:
    SEP #$20                                                   ;81965B|E220    |      ;
    REP #$10                                                   ;81965D|C210    |      ;
    STZ.W strcPlayerData.carryItemId                           ;81965F|9C1D09  |00091D;
    REP #$20                                                   ;819662|C220    |      ;
    LDY.W #$000A                                               ;819664|A00A00  |      ;
    JSL.L fItemCarried_LoadPoseData                                      ;819667|22B78081|8180B7;
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
    STA.W $0976+!RAM_SHIFT                                 ;81968A|8D7609  |000976;
    BRA fReturn_8196AE                                         ;81968D|801F    |8196AE;
 
 
fItemCarried_PhaseClearSlot:
    JSL.L fObjectSlots_FreeCurrent                                      ;81968F|22F1A481|81A4F1;
    BRA fReturn_8196AE                                         ;819693|8019    |8196AE;
 
 
fItemCarried_PhaseWaitScriptEnd:
    REP #$30                                                   ;819695|C230    |      ;
    LDA.B ptrUnknown0xCF                                       ;819697|A5CF    |0000CF;
    BNE fReturn_8196AE                                         ;819699|D013    |8196AE;
    SEP #$20                                                   ;81969B|E220    |      ;
    LDA.B ptrUnknown0xCF+2                                     ;81969D|A5D1    |0000D1;
    BNE fReturn_8196AE                                         ;81969F|D00D    |8196AE;
    JSL.L fObjectSlots_FreeCurrent                                      ;8196A1|22F1A481|81A4F1;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
 
fReturn_8196AE:
    RTS                                                        ;8196AE|60      |      ;