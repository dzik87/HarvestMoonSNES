 
    ORG $828000
 
 
fGame_TimeHandler:
    SEP #$20                                                   ;828000|E220    |      ;
    REP #$10                                                   ;828002|C210    |      ;
    LDA.W nTimeState                                           ;828004|AD7309  |000973;
    AND.B #$02                                                 ;828007|2902    |      ;
    BEQ +                                                      ;828009|F003    |82800E;
    JMP.W fNextDayHandler                                      ;82800B|4CAC82  |8282AC;
 
 
  + LDA.W nTimeState                                           ;82800E|AD7309  |000973;
    AND.B #$01                                                 ;828011|2901    |      ;
    BNE +                                                      ;828013|D003    |828018;
    JMP.W .return                                              ;828015|4CA980  |8280A9;
 
 
  + REP #$20                                                   ;828018|C220    |      ;
    %CheckFlag(daily1, $0400)
    BEQ +                                                      ;828021|F003    |828026;
    JMP.W fEvents_ShippingSceneDialog                          ;828023|4C6581  |828165;
 
 
  + SEP #$20                                                   ;828026|E220    |      ;
    LDA.L nInGameMinuteCounter                                 ;828028|AF1E1F7F|7F1F1E;
    INC A                                                      ;82802C|1A      |      ;
    STA.L nInGameMinuteCounter                                 ;82802D|8F1E1F7F|7F1F1E;
    CMP.B #$3C                                                 ;828031|C93C    |      ; Ingame minute counter
    BNE .continue                                              ;828033|D057    |82808C;
    LDA.B #$00                                                 ;828035|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;828037|8F1E1F7F|7F1F1E;
    LDA.L nInGameHourCounter                                   ;82803B|AF1D1F7F|7F1F1D;
    INC A                                                      ;82803F|1A      |      ;
    STA.L nInGameHourCounter                                   ;828040|8F1D1F7F|7F1F1D;
    CMP.B #$0F                                                 ;828044|C90F    |      ; Ingame hour counter
    BNE .continue                                              ;828046|D044    |82808C;
    LDA.B #$00                                                 ;828048|A900    |      ;
    STA.L nInGameHourCounter                                   ;82804A|8F1D1F7F|7F1F1D;
    LDA.L nCurrentTimeID                                       ;82804E|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;828052|C912    |      ;
    BEQ .continue                                              ;828054|F036    |82808C;
    INC A                                                      ;828056|1A      |      ;
    STA.L nCurrentTimeID                                       ;828057|8F1C1F7F|7F1F1C;
    JSL.L fUnknown_8280AA                                      ;82805B|22AA8082|8280AA;
    JSL.L fEvents_ShippingScene                                ;82805F|22318182|828131;
    SEP #$20                                                   ;828063|E220    |      ;
    LDA.L nCurrentTimeID                                       ;828065|AF1C1F7F|7F1F1C;
    CMP.B #$12                                                 ;828069|C912    |      ;
    BEQ +                                                      ;82806B|F002    |82806F;
    BRA .continue                                              ;82806D|801D    |82808C;
 
 
  + REP #$20                                                   ;82806F|C220    |      ;
    %CheckFlag(daily3, $8000)
    BNE .continue                                              ;828078|D012    |82808C;
    SEP #$20                                                   ;82807A|E220    |      ;
    LDA.B #$FF                                                 ;82807C|A9FF    |      ;
    STA.W strcAudio.trackIdCopy                                ;82807E|8D1701  |000117;
    JSL.L fAudioUnknown_838401                                 ;828081|22018483|838401;
    SEP #$20                                                   ;828085|E220    |      ;
    LDA.B #$FF                                                 ;828087|A9FF    |      ;
    STA.W strcAudio.trackId                                    ;828089|8D1001  |000110;
 
.continue:
    SEP #$20                                                   ;82808C|E220    |      ;
    LDA.W strcPalette.nextIdx                                  ;82808E|AD7B01  |00017B;
    PHA                                                        ;828091|48      |      ;
    JSL.L fPalette_AdjustTimePalette                           ;828092|22019580|809501;
    SEP #$20                                                   ;828096|E220    |      ;
    PLA                                                        ;828098|68      |      ;
    CMP.W strcPalette.nextIdx                                  ;828099|CD7B01  |00017B;
    BEQ .return                                                ;82809C|F00B    |8280A9;
    LDY.W #$0004                                               ;82809E|A00400  |      ;
    JSL.L fCore_Zero0x42PtrFromIndex                           ;8280A1|22928F80|808F92;
    JSL.L fSubrutinesExecute_809553                            ;8280A5|22539580|809553;
 
.return:
    RTL                                                        ;8280A9|6B      |      ;
 
 
fUnknown_8280AA:
    SEP #$20                                                   ;8280AA|E220    |      ;
    REP #$10                                                   ;8280AC|C210    |      ;
    LDA.L nCurrentTimeID                                       ;8280AE|AF1C1F7F|7F1F1C;
    CMP.B #$0C                                                 ;8280B2|C90C    |      ;
    BEQ +                                                      ;8280B4|F003    |8280B9;
    JMP.W .return                                              ;8280B6|4C3081  |828130;
 
 
  + %UpdateStamina(20)
    REP #$20                                                   ;8280C1|C220    |      ;
    %CheckPlayerFlagsNoReg(!PFLAGS_UNK0400|!PFLAGS_INSPRINGS|!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;8280C8|F003    |8280CD;
    JMP.W .return                                              ;8280CA|4C3081  |828130;
 
 
  + LDA.B strcPlayer.action                                    ;8280CD|A5D4    |0000D4;
    CMP.W #!PACTION_0F                                               
    BNE +                                                      ;8280D2|D003    |8280D7;
    JMP.W .return                                              ;8280D4|4C3081  |828130;
 
 
  + CMP.W #!PACTION_10                                               
    BNE +                                                      ;8280DA|D003    |8280DF;
    JMP.W .return                                              ;8280DC|4C3081  |828130;
 
 
  + CMP.W #!PACTION_FISHING                                               
    BNE +                                                      ;8280E2|D003    |8280E7;
    JMP.W .return                                              ;8280E4|4C3081  |828130;
 
 
  + CMP.W #!PACTION_FISHINGBITE                                               
    BNE +                                                      ;8280EA|D003    |8280EF;
    JMP.W .return                                              ;8280EC|4C3081  |828130;
 
 
  + CMP.W #!PACTION_REELING                                               
    BNE +                                                      ;8280F2|D003    |8280F7;
    JMP.W .return                                              ;8280F4|4C3081  |828130;
 
 
  + CMP.W #!PACTION_17                                               
    BNE +                                                      ;8280FA|D003    |8280FF;
    JMP.W .return                                              ;8280FC|4C3081  |828130;
 
 
  + CMP.W #!PACTION_18                                               
    BNE +                                                      ;828102|D003    |828107;
    JMP.W .return                                              ;828104|4C3081  |828130;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;82810C|F003    |828111;
    JMP.W .return                                              ;82810E|4C3081  |828130;
 
 
  + SEP #$20                                                   ;828111|E220    |      ;
    LDA.B #$03                                                 ;828113|A903    |      ;
    JSL.L fCore_GetRandomNumber                                ;828115|22F98980|8089F9;
    SEP #$20                                                   ;828119|E220    |      ;
    STA.W strcPlayerData.eatFood                               ;82811B|8D2409  |000924;
    %SetPlayerFlag(!PFLAGS_EATINGMEAL)
    %SetPlayerFlag(!PFLAGS_UNK0400)
 
.return:
    RTL                                                        ;828130|6B      |      ;
 
 
fEvents_ShippingScene:
    SEP #$20                                                   ;828131|E220    |      ;
    REP #$10                                                   ;828133|C210    |      ;
    LDA.L nCurrentTimeID                                       ;828135|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;828139|C911    |      ; Check hour for selling stuff
    BEQ .sellingTime                                           ;82813B|F003    |828140;
    JMP.W fEvents_ShippingSceneReturn                          ;82813D|4CBF81  |8281BF;
 
 
.sellingTime:
    LDA.B strcMap.loadAreaId                                   ;828140|A522    |000022;
    CMP.B #$04                                                 ;828142|C904    |      ;
    BCS fEvents_ShippingSceneReturn                            ;828144|B079    |8281BF;
    LDA.B #$00                                                 ;828146|A900    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;828148|8D9A01  |00019A;
    REP #$20                                                   ;82814B|C220    |      ;
    %SetFlag(daily1, $0400)
    %AIExecute($0006, $0000, $0026)
 
fEvents_ShippingSceneDialog:
    REP #$20                                                   ;828165|C220    |      ;
    %CheckFlag(daily1, $0800)
    BEQ fEvents_ShippingSceneReturn                            ;82816E|F04F    |8281BF;
    %CheckPlayerFlags(!PFLAGS_INTERACTING)
    BEQ +                                                      ;828177|F003    |82817C;
    JMP.W fEvents_ShippingSceneReturn                          ;828179|4CBF81  |8281BF;
 
 
  + LDA.W #$0002                                               ;82817C|A90200  |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;82817F|8D9A01  |00019A;
    LDX.W #$031A                                               ;828182|A21A03  |      ;
    REP #$20                                                   ;828185|C220    |      ;
    LDA.L nShippingProfit                                      ;828187|AF071F7F|7F1F07;
    BNE +                                                      ;82818B|D00B    |828198;
    SEP #$20                                                   ;82818D|E220    |      ;
    LDA.L nShippingProfit+2                                    ;82818F|AF091F7F|7F1F09;
    BNE +                                                      ;828193|D003    |828198;
    LDX.W #$031B                                               ;828195|A21B03  |      ;
 
  + SEP #$20                                                   ;828198|E220    |      ;
    LDA.B #$00                                                 ;82819A|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;82819C|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;82819F|225F9383|83935F;
    REP #$20                                                   ;8281A3|C220    |      ;
    LDA.W #$0006                                               ;8281A5|A90600  |      ;
    LDX.W #$0000                                               ;8281A8|A20000  |      ;
    LDY.W #$0027                                               ;8281AB|A02700  |      ;
    JSL.L fAI_Unknown84803F                                    ;8281AE|223F8084|84803F;
    REP #$20                                                   ;8281B2|C220    |      ;
    %UnsetFlag(daily1, $0400)
 
fEvents_ShippingSceneReturn:
    RTL                                                        ;8281BF|6B      |      ;
 
 
fWeatherUnknown_8281C0:
    SEP #$20                                                   ;8281C0|E220    |      ;
    REP #$10                                                   ;8281C2|C210    |      ;
    LDA.B #$00                                                 ;8281C4|A900    |      ;
    XBA                                                        ;8281C6|EB      |      ;
    LDA.W nWeatherForecast                                     ;8281C7|AD8C09  |00098C;
    REP #$20                                                   ;8281CA|C220    |      ;
    TAX                                                        ;8281CC|AA      |      ;
    SEP #$20                                                   ;8281CD|E220    |      ;
    LDA.L .data,X                                              ;8281CF|BFFD8182|8281FD;
    STA.W nWeatherDialogIdIndex                                ;8281D3|8D9009  |000990;
    REP #$20                                                   ;8281D6|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;8281D8|AD9601  |000196;
    AND.W #$0010                                               ;8281DB|291000  |      ;
    BNE .label1                                                ;8281DE|D00A    |8281EA;
    LDA.W strcDialogDisplay.mapFlags                           ;8281E0|AD9601  |000196;
    AND.W #$0200                                               ;8281E3|290002  |      ;
    BNE .label2                                                ;8281E6|D00B    |8281F3;
    BRA .return                                                ;8281E8|8012    |8281FC;
 
 
.label1:
    SEP #$20                                                   ;8281EA|E220    |      ;
    LDA.B #$0B                                                 ;8281EC|A90B    |      ;
    STA.W nWeatherDialogIdIndex                                ;8281EE|8D9009  |000990;
    BRA .return                                                ;8281F1|8009    |8281FC;
 
 
.label2:
    SEP #$20                                                   ;8281F3|E220    |      ;
    LDA.B #$04                                                 ;8281F5|A904    |      ;
    STA.W nWeatherDialogIdIndex                                ;8281F7|8D9009  |000990;
    BRA .return                                                ;8281FA|8000    |8281FC;
 
 
.return:
    RTL                                                        ;8281FC|6B      |      ;
 
 
.data:
    db $00,$01,$02,$03,$00,$00,$05,$06,$07,$08,$09,$0A         ;8281FD|        |      ; 0x0C * [n8][nWeatherForecast]
 
fUnknown_828209:
    REP #$30                                                   ;828209|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82820B|AD9601  |000196;
    AND.W #$0002                                               ;82820E|290200  |      ;
    BNE .label1                                                ;828211|D021    |828234;
    LDA.W strcDialogDisplay.mapFlags                           ;828213|AD9601  |000196;
    AND.W #$0008                                               ;828216|290800  |      ;
    BNE .label2                                                ;828219|D027    |828242;
    LDA.W strcDialogDisplay.mapFlags                           ;82821B|AD9601  |000196;
    AND.W #$0010                                               ;82821E|291000  |      ;
    BNE .label3                                                ;828221|D02D    |828250;
    LDA.W strcDialogDisplay.mapFlags                           ;828223|AD9601  |000196;
    AND.W #$0100                                               ;828226|290001  |      ;
    BNE .label4                                                ;828229|D033    |82825E;
    LDA.W strcDialogDisplay.mapFlags                           ;82822B|AD9601  |000196;
    AND.W #$0200                                               ;82822E|290002  |      ;
    BNE .label5                                                ;828231|D02D    |828260;
 
.return:
    RTL                                                        ;828233|6B      |      ;
 
 
.label1:
    REP #$20                                                   ;828234|C220    |      ;
    LDA.W #$0000                                               ;828236|A90000  |      ;
    JSR.W fGetAXYArgs_828270                                   ;828239|207082  |828270;
    JSL.L fObjectMap_HuricaneDamage                            ;82823C|2213A782|82A713;
    BRA .return                                                ;828240|80F1    |828233;
 
 
.label2:
    REP #$20                                                   ;828242|C220    |      ;
    LDA.W #$0001                                               ;828244|A90100  |      ;
    JSR.W fGetAXYArgs_828270                                   ;828247|207082  |828270;
    JSL.L fObjectMap_HuricaneDamage                            ;82824A|2213A782|82A713;
    BRA .return                                                ;82824E|80E3    |828233;
 
 
.label3:
    REP #$20                                                   ;828250|C220    |      ;
    LDA.W #$0002                                               ;828252|A90200  |      ;
    JSR.W fGetAXYArgs_828270                                   ;828255|207082  |828270;
    JSL.L fObjectMap_HuricaneDamage                            ;828258|2213A782|82A713;
    BRA .return                                                ;82825C|80D5    |828233;
 
 
.label4:
    BRA .return                                                ;82825E|80D3    |828233;
 
 
.label5:
    REP #$20                                                   ;828260|C220    |      ;
    LDA.W #$0003                                               ;828262|A90300  |      ;
    JSR.W fGetAXYArgs_828270                                   ;828265|207082  |828270;
    JSL.L fObjectMap_HuricaneDamage                            ;828268|2213A782|82A713;
    BRA .return                                                ;82826C|80C5    |828233;
 
    BRA .return                                                ;82826E|80C3    |828233;
 
 
fGetAXYArgs_828270:
    REP #$30                                                   ;828270|C230    |      ; A: nIndex
    ASL A                                                      ;828272|0A      |      ;
    ASL A                                                      ;828273|0A      |      ;
    TAX                                                        ;828274|AA      |      ;
    SEP #$20                                                   ;828275|E220    |      ;
    LDA.B #$00                                                 ;828277|A900    |      ;
    XBA                                                        ;828279|EB      |      ;
    LDA.L nArgumentsTable_828298,X                             ;82827A|BF988282|828298;
    REP #$20                                                   ;82827E|C220    |      ;
    PHA                                                        ;828280|48      |      ;
    INX                                                        ;828281|E8      |      ;
    SEP #$20                                                   ;828282|E220    |      ;
    LDA.L nArgumentsTable_828298,X                             ;828284|BF988282|828298;
    REP #$20                                                   ;828288|C220    |      ;
    PHA                                                        ;82828A|48      |      ;
    INX                                                        ;82828B|E8      |      ;
    SEP #$20                                                   ;82828C|E220    |      ;
    LDA.L nArgumentsTable_828298,X                             ;82828E|BF988282|828298;
    REP #$20                                                   ;828292|C220    |      ;
    TAY                                                        ;828294|A8      |      ;
    PLX                                                        ;828295|FA      |      ;
    PLA                                                        ;828296|68      |      ;
    RTS                                                        ;828297|60      |      ;
 
 
nArgumentsTable_828298:
    db $60,$00,$00,$00,$40,$00,$00,$00,$08,$10,$04,$00         ;828298|        |      ; 0x05 * [8b argA, 8b argX, 8b argY, 8b unused]
    db $08,$00,$04,$00,$00,$40,$20,$00                         ;8282A4|        |      ;
 
fNextDayHandler:
    SEP #$20                                                   ;8282AC|E220    |      ;
    REP #$10                                                   ;8282AE|C210    |      ;
    SEP #$20                                                   ;8282B0|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;8282B2|AF1A1F7F|7F1F1A; Load CurrentWeekday
    INC A                                                      ;8282B6|1A      |      ; Increment Weekday by 1
    CMP.B #$07                                                 ;8282B7|C907    |      ; Check if thats last day of week
    BNE +                                                      ;8282B9|D002    |8282BD; If not then skip
    LDA.B #$00                                                 ;8282BB|A900    |      ; If yes then load 0
 
  + SEP #$20                                                   ;8282BD|E220    |      ;
    STA.L nCurrentWeekdayID                                    ;8282BF|8F1A1F7F|7F1F1A; Store current Weekday
    LDA.L nCurrentDay                                          ;8282C3|AF1B1F7F|7F1F1B; Load Current day
    INC A                                                      ;8282C7|1A      |      ; Incement Day by 1
    CMP.B #$1F                                                 ;8282C8|C91F    |      ; Check if its last day of month
    BNE .notLastDayOfMonth                                     ;8282CA|D02A    |8282F6; Branch if not
    LDA.L nCurrentSeasonID                                     ;8282CC|AF191F7F|7F1F19; Load Current Season
    INC A                                                      ;8282D0|1A      |      ; Increment season by 1
    CMP.B #$04                                                 ;8282D1|C904    |      ; Check if it is last season
    BNE .notLastSeason                                         ;8282D3|D019    |8282EE; Branch if not
    LDA.L nCurrentYearID                                       ;8282D5|AF181F7F|7F1F18; Load Current Year
    INC A                                                      ;8282D9|1A      |      ; Increment Year by 1
    STA.L nCurrentYearID                                       ;8282DA|8F181F7F|7F1F18; Store Year Value
    REP #$20                                                   ;8282DE|C220    |      ;
    LDA.W #$0004                                               ;8282E0|A90400  |      ; Load something to A
    JSR.W fGetAXYArgs_828270                                   ;8282E3|207082  |828270;
    JSL.L fObjectMap_HuricaneDamage                            ;8282E6|2213A782|82A713;
    SEP #$20                                                   ;8282EA|E220    |      ;
    LDA.B #$00                                                 ;8282EC|A900    |      ;
 
.notLastSeason:
    SEP #$20                                                   ;8282EE|E220    |      ;
    STA.L nCurrentSeasonID                                     ;8282F0|8F191F7F|7F1F19;
    LDA.B #$01                                                 ;8282F4|A901    |      ;
 
.notLastDayOfMonth:
    SEP #$20                                                   ;8282F6|E220    |      ;
    STA.L nCurrentDay                                          ;8282F8|8F1B1F7F|7F1F1B;
    LDA.B #$FF                                                 ;8282FC|A9FF    |      ;
    STA.W strcAudio.trackIdCopy                                ;8282FE|8D1701  |000117;
    JSL.L fAudioUnknown_838401                                 ;828301|22018483|838401;
    SEP #$20                                                   ;828305|E220    |      ;
    LDA.B #$0F                                                 ;828307|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;828309|8592    |000092;
    LDA.B #$03                                                 ;82830B|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82830D|8593    |000093;
    LDA.B #$01                                                 ;82830F|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;828311|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;828313|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;828317|220F8E80|808E0F;
    SEP #$20                                                   ;82831B|E220    |      ;
    LDA.B #$0F                                                 ;82831D|A90F    |      ;
    STA.B strcMap.loadAreaId                                   ;82831F|8522    |000022;
    REP #$30                                                   ;828321|C230    |      ;
    %UnsetFlag(event1, $0030)
    %UnsetFlag(event7, $0002)
    REP #$30                                                   ;828339|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82833B|AD9601  |000196;
    AND.W #$0010                                               ;82833E|291000  |      ;
    BEQ +                                                      ;828341|F00B    |82834E;
    %SetFlag(event1, $0020)
 
  + JSL.L fWeatherForecast_828C09                              ;82834E|22098C82|828C09;
    REP #$30                                                   ;828352|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;828354|AD9601  |000196;
    AND.W #$0200                                               ;828357|290002  |      ;
    BEQ +                                                      ;82835A|F00B    |828367;
    %SetFlag(event1, $0010)
 
  + REP #$30                                                   ;828367|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;828369|AD9601  |000196;
    AND.W #$0100                                               ;82836C|290001  |      ;
    BEQ +                                                      ;82836F|F00B    |82837C;
    %SetFlag(event7, $0002)
 
  + JSL.L fAudioEngine_SelectMapMusic                          ;82837C|22F59580|8095F5;
    SEP #$20                                                   ;828380|E220    |      ;
    LDA.B #$06                                                 ;828382|A906    |      ; Set time to 6:00AM
    STA.L nCurrentTimeID                                       ;828384|8F1C1F7F|7F1F1C; Store current time
    LDA.B #$00                                                 ;828388|A900    |      ;
    STA.L nInGameHourCounter                                   ;82838A|8F1D1F7F|7F1F1D;
    LDA.B #$00                                                 ;82838E|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;828390|8F1E1F7F|7F1F1E;
    JSL.L fWriteSeasonWeekdayAndDayOrdinal                     ;828394|22D68982|8289D6;
    JSL.L fObjectMap_Unknown82A811                             ;828398|2211A882|82A811;
    JSL.L fUnknown_828209                                      ;82839C|22098282|828209;
    JSL.L fGameEngine_AnimalsUnknown83BC5A                     ;8283A0|225ABC83|83BC5A;
    JSL.L fWeatherRandomizer                                   ;8283A4|22F98C82|828CF9;
    JSL.L fCore_FindBestLove                                   ;8283A8|22C68E82|828EC6;
    JSL.L fUnknown_828790                                      ;8283AC|22908782|828790;
    REP #$20                                                   ;8283B0|C220    |      ;
    STZ.W strcObjectData.exist                                 ;8283B2|9C1509  |000915;
    STZ.B strcPlayer.flags                                     ;8283B5|64D2    |0000D2;
    STZ.B strcPlayer.action                                    ;8283B7|64D4    |0000D4;
    SEP #$20                                                   ;8283B9|E220    |      ;
    LDA.W strcPlayerData.stamina                               ;8283BB|AD1709  |000917;
    STA.W strcPlayerData.energy                                ;8283BE|8D1809  |000918; Reset player energy to max available
    STZ.W strcPlayerData.lastExcercise                         ;8283C1|9C2509  |000925;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;8283E3|C230    |      ;
    LDA.W #$0000                                               ;8283E5|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;8283E8|8D0109  |000901;
    REP #$20                                                   ;8283EB|C220    |      ;
    LDA.L nShippingProfit                                      ;8283ED|AF071F7F|7F1F07;
    STA.B ptrTemp0x72                                          ;8283F1|8572    |000072;
    SEP #$20                                                   ;8283F3|E220    |      ;
    LDA.L nShippingProfit+2                                    ;8283F5|AF091F7F|7F1F09;
    STA.B ptrTemp0x72+2                                        ;8283F9|8574    |000074;
    JSL.L fGameEngine_AddProfit                                ;8283FB|22C9B183|83B1C9;
    REP #$20                                                   ;8283FF|C220    |      ;
    LDA.W #$0000                                               ;828401|A90000  |      ;
    STA.L nShippingProfit                                      ;828404|8F071F7F|7F1F07; zero profit
    SEP #$20                                                   ;828408|E220    |      ;
    LDA.B #$00                                                 ;82840A|A900    |      ;
    STA.L nShippingProfit+2                                    ;82840C|8F091F7F|7F1F09;
    SEP #$20                                                   ;828410|E220    |      ;
    STZ.W strcPlayerData.placedCowFeed                         ;828412|9C3009  |000930; clear cow feed counter
    STZ.W strcPlayerData.placedChcikenFeed                     ;828415|9C3109  |000931; clear chicken feed counter
    REP #$20                                                   ;828418|C220    |      ;
    STZ.W strcPlayerData.placedCowFeedFlags                    ;82841A|9C3209  |000932; zero cow feed data
    STZ.W strcPlayerData.placedChickenFeedFlags                ;82841D|9C3409  |000934; zero chicken feed data
    REP #$20                                                   ;828420|C220    |      ;
    LDA.W #$0000                                               ;828422|A90000  |      ;
    STA.L strcFlags.daily1                                     ;828425|8F5A1F7F|7F1F5A;
    LDA.W #$0000                                               ;828429|A90000  |      ;
    STA.L strcFlags.daily2                                     ;82842C|8F5C1F7F|7F1F5C;
    LDA.W #$0000                                               ;828430|A90000  |      ;
    STA.L strcFlags.daily3                                     ;828433|8F5E1F7F|7F1F5E;
    LDA.W #$0000                                               ;828437|A90000  |      ;
    STA.L strcFlags.daily4                                     ;82843A|8F601F7F|7F1F60;
    LDA.W #$0000                                               ;82843E|A90000  |      ;
    STA.L strcFlags.daily5                                     ;828441|8F621F7F|7F1F62;
    LDA.W #$0000                                               ;828445|A90000  |      ;
    STA.L strcFlags.unknown1                                   ;828448|8F741F7F|7F1F74;
    STA.L strcFlags.unknown2                                   ;82844C|8F761F7F|7F1F76;
    STA.L strcFlags.unknown3                                   ;828450|8F781F7F|7F1F78;
    REP #$20                                                   ;828454|C220    |      ;
    %SetFlag(event3, $0001)
    %CheckFlag(event2, $0020)
    BEQ +                                                      ;828468|F018    |828482;
    REP #$20                                                   ;82846A|C220    |      ;
    %UnsetFlag(event2, $0020)
    %SetFlag(event2, $0040)
 
  + REP #$20                                                   ;828482|C220    |      ;
    %CheckFlag(event2, $0080)
    BEQ .label2                                                ;82848B|F055    |8284E2;
    SEP #$20                                                   ;82848D|E220    |      ;
    LDA.L nConstructionDayCounter                              ;82848F|AF351F7F|7F1F35;
    INC A                                                      ;828493|1A      |      ;
    STA.L nConstructionDayCounter                              ;828494|8F351F7F|7F1F35;
    CMP.B #$04                                                 ;828498|C904    |      ;
    BNE .label2                                                ;82849A|D046    |8284E2;
    REP #$30                                                   ;82849C|C230    |      ;
    %SetFlag(event2, $0100)
    REP #$20                                                   ;8284A9|C220    |      ;
    LDA.W #$01F4                                               ;8284AB|A9F401  |      ;
    STA.L nReqWoodForExpansion                                 ;8284AE|8F0E1F7F|7F1F0E;
    %UnsetFlag(event2, $0080)
    %CheckFlag(event1, $0040)
    BEQ .label1                                                ;8284C4|F00F    |8284D5;
    REP #$30                                                   ;8284C6|C230    |      ;
    %SetFlag(event1, $0080)
    BRA .label2                                                ;8284D3|800D    |8284E2;
 
 
.label1:
    REP #$30                                                   ;8284D5|C230    |      ;
    %SetFlag(event1, $0040)
 
.label2:
    REP #$30                                                   ;8284E2|C230    |      ;
    %CheckFlag(event3, $0800)
    BEQ +                                                      ;8284EB|F016    |828503;
    %UnsetFlag(event3, $0800)
    %SetFlag(event3, $1000)
 
  + REP #$30                                                   ;828503|C230    |      ;
    %CheckFlag(event3, $8000)
    BEQ +                                                      ;82850C|F017    |828525;
    %UnsetFlag(event3, $8000)
    SEP #$20                                                   ;828519|E220    |      ;
    LDA.L strcShedItems.row3                                   ;82851B|AF021F7F|7F1F02;
    ORA.B #$04                                                 ;82851F|0904    |      ;
    STA.L strcShedItems.row3                                   ;828521|8F021F7F|7F1F02;
 
  + REP #$30                                                   ;828525|C230    |      ;
    %CheckFlag(event4, $0080)
    BEQ .label6                                                ;82852E|F04F    |82857F;
    %UnsetFlag(event4, $0080)
    %CheckFlag(event4, $0100)
    BNE .label3                                                ;828542|D00D    |828551;
    %SetFlag(event4, $0102)
    BRA .label6                                                ;82854F|802E    |82857F;
 
 
.label3:
    SEP #$20                                                   ;828551|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;828553|AD2109  |000921;
    CMP.B #$02                                                 ;828556|C902    |      ;
    BNE .label4                                                ;828558|D003    |82855D;
    STZ.W strcPlayerData.toolEquipped                          ;82855A|9C2109  |000921;
 
.label4:
    SEP #$20                                                   ;82855D|E220    |      ;
    LDA.W strcPlayerData.toolSecond                            ;82855F|AD2309  |000923;
    CMP.B #$02                                                 ;828562|C902    |      ;
    BNE .label5                                                ;828564|D003    |828569;
    STZ.W strcPlayerData.toolSecond                            ;828566|9C2309  |000923;
 
.label5:
    SEP #$20                                                   ;828569|E220    |      ;
    LDA.L strcShedItems.row1                                   ;82856B|AF001F7F|7F1F00;
    AND.B #$FD                                                 ;82856F|29FD    |      ;
    STA.L strcShedItems.row1                                   ;828571|8F001F7F|7F1F00;
    LDA.L strcShedItems.row3                                   ;828575|AF021F7F|7F1F02;
    ORA.B #$02                                                 ;828579|0902    |      ;
    STA.L strcShedItems.row3                                   ;82857B|8F021F7F|7F1F02;
 
.label6:
    REP #$30                                                   ;82857F|C230    |      ;
    %CheckFlag(event4, $0400)
    BEQ +                                                      ;828588|F01F    |8285A9;
    %CheckFlag(event4, $0800)
    BNE +                                                      ;828591|D016    |8285A9;
    %SetFlag(event4, $0800)
    %UnsetFlag(event4, $0400)
 
  + REP #$30                                                   ;8285A9|C230    |      ;
    %CheckFlag(event4, $1000)
    BEQ +                                                      ;8285B2|F02E    |8285E2;
    %CheckFlag(event4, $2000)
    BNE +                                                      ;8285BB|D025    |8285E2;
    SEP #$20                                                   ;8285BD|E220    |      ;
    LDA.W $09A3                                                ;8285BF|ADA309  |0009A3;
    INC A                                                      ;8285C2|1A      |      ;
    STA.W $09A3                                                ;8285C3|8DA309  |0009A3;
    CMP.B #$03                                                 ;8285C6|C903    |      ;
    BNE +                                                      ;8285C8|D018    |8285E2;
    REP #$20                                                   ;8285CA|C220    |      ;
    %SetFlag(event4, $2000)
    %UnsetFlag(event4, $1000)
 
  + REP #$30                                                   ;8285E2|C230    |      ;
    %CheckFlag(event4, $4000)
    BEQ +                                                      ;8285EB|F02E    |82861B;
    %CheckFlag(event4, $8000)
    BNE +                                                      ;8285F4|D025    |82861B;
    SEP #$20                                                   ;8285F6|E220    |      ;
    LDA.W $09A3                                                ;8285F8|ADA309  |0009A3;
    INC A                                                      ;8285FB|1A      |      ;
    STA.W $09A3                                                ;8285FC|8DA309  |0009A3;
    CMP.B #$03                                                 ;8285FF|C903    |      ;
    BNE +                                                      ;828601|D018    |82861B;
    REP #$20                                                   ;828603|C220    |      ;
    %SetFlag(event4, $8000)
    %UnsetFlag(event4, $4000)
 
  + REP #$30                                                   ;82861B|C230    |      ;
    %CheckFlag(event5, $0001)
    BEQ +                                                      ;828624|F02E    |828654;
    %CheckFlag(event5, $0002)
    BNE +                                                      ;82862D|D025    |828654;
    SEP #$20                                                   ;82862F|E220    |      ;
    LDA.W $09A3                                                ;828631|ADA309  |0009A3;
    INC A                                                      ;828634|1A      |      ;
    STA.W $09A3                                                ;828635|8DA309  |0009A3;
    CMP.B #$03                                                 ;828638|C903    |      ;
    BNE +                                                      ;82863A|D018    |828654;
    REP #$20                                                   ;82863C|C220    |      ;
    %SetFlag(event5, $0002)
    %UnsetFlag(event5, $0001)
 
  + REP #$30                                                   ;828654|C230    |      ;
    %CheckFlag(event5, $0004)
    BEQ +                                                      ;82865D|F02E    |82868D;
    %CheckFlag(event5, $0008)
    BNE +                                                      ;828666|D025    |82868D;
    SEP #$20                                                   ;828668|E220    |      ;
    LDA.W $09A3                                                ;82866A|ADA309  |0009A3;
    INC A                                                      ;82866D|1A      |      ;
    STA.W $09A3                                                ;82866E|8DA309  |0009A3;
    CMP.B #$03                                                 ;828671|C903    |      ;
    BNE +                                                      ;828673|D018    |82868D;
    REP #$20                                                   ;828675|C220    |      ;
    %SetFlag(event5, $0008)
    %UnsetFlag(event5, $0004)
 
  + REP #$30                                                   ;82868D|C230    |      ;
    %CheckFlag(event5, $0010)
    BEQ +                                                      ;828696|F02E    |8286C6;
    %CheckFlag(event5, $0020)
    BNE +                                                      ;82869F|D025    |8286C6;
    SEP #$20                                                   ;8286A1|E220    |      ;
    LDA.W $09A3                                                ;8286A3|ADA309  |0009A3;
    INC A                                                      ;8286A6|1A      |      ;
    STA.W $09A3                                                ;8286A7|8DA309  |0009A3;
    CMP.B #$03                                                 ;8286AA|C903    |      ;
    BNE +                                                      ;8286AC|D018    |8286C6;
    REP #$20                                                   ;8286AE|C220    |      ;
    %SetFlag(event5, $0020)
    %UnsetFlag(event5, $0010)
 
  + REP #$30                                                   ;8286C6|C230    |      ;
    %CheckFlag(event6, $8000)
    BEQ +                                                      ;8286CF|F017    |8286E8;
    %UnsetFlag(event6, $8000)
    SEP #$20                                                   ;8286DC|E220    |      ;
    LDA.L strcShedItems.row3                                   ;8286DE|AF021F7F|7F1F02;
    ORA.B #$01                                                 ;8286E2|0901    |      ;
    STA.L strcShedItems.row3                                   ;8286E4|8F021F7F|7F1F02;
 
  + REP #$30                                                   ;8286E8|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;8286EA|AD9601  |000196;
    AND.W #$0010                                               ;8286ED|291000  |      ;
    BEQ +                                                      ;8286F0|F00B    |8286FD;
    %SetFlag(daily4, $0001)
 
  + SEP #$20                                                   ;8286FD|E220    |      ;
    LDA.W nTimeState                                           ;8286FF|AD7309  |000973;
    AND.B #$04                                                 ;828702|2904    |      ;
    BEQ .skipToEndGame                                         ;828704|F00C    |828712;
    SEP #$20                                                   ;828706|E220    |      ;
    LDA.B #$00                                                 ;828708|A900    |      ;
    XBA                                                        ;82870A|EB      |      ;
    LDA.W $098E                                                ;82870B|AD8E09  |00098E;
    JSL.L fGameEngine_SaveGame                                 ;82870E|228EB683|83B68E;
 
.skipToEndGame:
    REP #$20                                                   ;828712|C220    |      ;
    LDA.W strcJoypad1.current                                  ;828714|AD2401  |000124;
    AND.W #!JOYPAD_SELECT|!JOYPAD_R|!JOYPAD_L                                               
    EOR.W #$2030                                               ;82871A|493020  |      ;
    BNE +                                                      ;82871D|D014    |828733;
    SEP #$20                                                   ;82871F|E220    |      ;
    LDA.B #$02                                                 ;828721|A902    |      ;
    STA.L nCurrentYearID                                       ;828723|8F181F7F|7F1F18;
    LDA.B #$01                                                 ;828727|A901    |      ;
    STA.L nCurrentSeasonID                                     ;828729|8F191F7F|7F1F19;
    LDA.B #$1E                                                 ;82872D|A91E    |      ;
    STA.L nCurrentDay                                          ;82872F|8F1B1F7F|7F1F1B;
 
  + SEP #$20                                                   ;828733|E220    |      ;
    STZ.W nTimeState                                           ;828735|9C7309  |000973;
    SEP #$20                                                   ;828738|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;82873A|9C1D09  |00091D;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    REP #$30                                                   ;828749|C230    |      ;
    LDA.W #$0088                                               ;82874B|A98800  |      ;
    STA.W strcDialogDisplay.mapDestX                           ;82874E|8D7D01  |00017D;
    LDA.W #$0078                                               ;828751|A97800  |      ;
    STA.W strcDialogDisplay.mapDestY                           ;828754|8D7F01  |00017F;
    SEP #$20                                                   ;828757|E220    |      ;
    LDA.B #$15                                                 ;828759|A915    |      ;
    STA.W nDestinationAreaId                                   ;82875B|8D8B09  |00098B;
    JSL.L fUnknown_8096D3                                      ;82875E|22D39680|8096D3;
    SEP #$20                                                   ;828762|E220    |      ;
    REP #$10                                                   ;828764|C210    |      ;
    LDA.B #$14                                                 ;828766|A914    |      ;
    JSL.L fPlayerEnergyHandler                                 ;828768|2261D081|81D061;
    REP #$30                                                   ;82876C|C230    |      ;
    %CheckFlag(daily3, $0004)
    BNE .return                                                ;828775|D016    |82878D;
    SEP #$20                                                   ;828777|E220    |      ;
    LDA.B #$03                                                 ;828779|A903    |      ;
    JSL.L fCore_GetRandomNumber                                ;82877B|22F98980|8089F9;
    SEP #$20                                                   ;82877F|E220    |      ;
    STA.W strcPlayerData.eatFood                               ;828781|8D2409  |000924;
    %SetPlayerFlag(!PFLAGS_EATINGMEAL)
 
.return:
    RTL                                                        ;82878D|6B      |      ;
 
 
.deadEnd:
    BRA .deadEnd                                               ;82878E|80FE    |82878E;
 
 
fUnknown_828790:
    REP #$30                                                   ;828790|C230    |      ;
    %UnsetFlag(event5, $0380)
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .marriedCheck                                          ;8287A4|D027    |8287CD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .marriedCheck                                          ;8287AD|D01E    |8287CD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .marriedCheck                                          ;8287B6|D015    |8287CD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .marriedCheck                                          ;8287BF|D00C    |8287CD;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .marriedCheck                                          ;8287C8|D003    |8287CD;
    JMP.W .return                                              ;8287CA|4CD589  |8289D5;
 
 
.marriedCheck:
    REP #$30                                                   ;8287CD|C230    |      ;
    LDA.L nMarriedDaysCounter                                  ;8287CF|AF3B1F7F|7F1F3B;
    INC A                                                      ;8287D3|1A      |      ;
    STA.L nMarriedDaysCounter                                  ;8287D4|8F3B1F7F|7F1F3B;
    STA.B strcVariables.n16Temp1                               ;8287D8|857E    |00007E;
    LDA.W #$0078                                               ;8287DA|A97800  |      ;
    STA.B strcVariables.n16Temp2                               ;8287DD|8580    |000080;
    JSL.L fMathDivide                                          ;8287DF|22828083|838082;
    REP #$30                                                   ;8287E3|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;8287E5|A57E    |00007E;
    BNE +                                                      ;8287E7|D00B    |8287F4;
    %SetFlag(event5, $0080)
 
  + REP #$30                                                   ;8287F4|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .marriedToMaria                                        ;8287FD|D02D    |82882C;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .marriedToAnn                                          ;828806|D04F    |828857;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .marriedToNina                                         ;82880F|D06B    |82887C;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BEQ +                                                      ;828818|F003    |82881D;
    JMP.W .marriedToEllen                                      ;82881A|4CA188  |8288A1;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BEQ +                                                      ;828824|F003    |828829;
    JMP.W .marriedToEve                                        ;828826|4CC488  |8288C4;
 
 
  + JMP.W .return                                              ;828829|4CD589  |8289D5;
 
 
.marriedToMaria:
    REP #$30                                                   ;82882C|C230    |      ;
    %CheckFlag(event6, $0004)
    BNE .skip                                                  ;828835|D00F    |828846;
    LDA.L nLove_Maria                                          ;828837|AF1F1F7F|7F1F1F;
    CMP.W #$01C2                                               ;82883B|C9C201  |      ;
    BCC +                                                      ;82883E|9003    |828843;
    JMP.W .label0                                              ;828840|4CE788  |8288E7;
 
 
  + JMP.W .canHaveSecondChild                                  ;828843|4C2789  |828927;
 
 
.skip:
    REP #$30                                                   ;828846|C230    |      ;
    LDA.L nLove_Maria                                          ;828848|AF1F1F7F|7F1F1F;
    CMP.W #$028A                                               ;82884C|C98A02  |      ;
    BCC +                                                      ;82884F|9003    |828854;
    JMP.W .label0                                              ;828851|4CE788  |8288E7;
 
 
  + JMP.W .canHaveSecondChild                                  ;828854|4C2789  |828927;
 
 
.marriedToAnn:
    REP #$30                                                   ;828857|C230    |      ;
    %CheckFlag(event6, $0004)
    BNE +                                                      ;828860|D00C    |82886E;
    LDA.L nLove_Ann                                            ;828862|AF211F7F|7F1F21;
    CMP.W #$01C2                                               ;828866|C9C201  |      ;
    BCS .label0                                                ;828869|B07C    |8288E7;
    JMP.W .canHaveSecondChild                                  ;82886B|4C2789  |828927;
 
 
  + REP #$30                                                   ;82886E|C230    |      ;
    LDA.L nLove_Ann                                            ;828870|AF211F7F|7F1F21;
    CMP.W #$028A                                               ;828874|C98A02  |      ;
    BCS .label0                                                ;828877|B06E    |8288E7;
    JMP.W .canHaveSecondChild                                  ;828879|4C2789  |828927;
 
 
.marriedToNina:
    REP #$30                                                   ;82887C|C230    |      ;
    %CheckFlag(event6, $0004)
    BNE +                                                      ;828885|D00C    |828893;
    LDA.L nLove_Nina                                           ;828887|AF231F7F|7F1F23;
    CMP.W #$01C2                                               ;82888B|C9C201  |      ;
    BCS .label0                                                ;82888E|B057    |8288E7;
    JMP.W .canHaveSecondChild                                  ;828890|4C2789  |828927;
 
 
  + REP #$30                                                   ;828893|C230    |      ;
    LDA.L nLove_Nina                                           ;828895|AF231F7F|7F1F23;
    CMP.W #$028A                                               ;828899|C98A02  |      ;
    BCS .label0                                                ;82889C|B049    |8288E7;
    JMP.W .canHaveSecondChild                                  ;82889E|4C2789  |828927;
 
 
.marriedToEllen:
    REP #$30                                                   ;8288A1|C230    |      ;
    %CheckFlag(event6, $0004)
    BNE +                                                      ;8288AA|D00B    |8288B7;
    LDA.L nLove_Ellen                                          ;8288AC|AF251F7F|7F1F25;
    CMP.W #$01C2                                               ;8288B0|C9C201  |      ;
    BCS .label0                                                ;8288B3|B032    |8288E7;
    BRA .canHaveSecondChild                                    ;8288B5|8070    |828927;
 
 
  + REP #$30                                                   ;8288B7|C230    |      ;
    LDA.L nLove_Ellen                                          ;8288B9|AF251F7F|7F1F25;
    CMP.W #$028A                                               ;8288BD|C98A02  |      ;
    BCS .label0                                                ;8288C0|B025    |8288E7;
    BRA .canHaveSecondChild                                    ;8288C2|8063    |828927;
 
 
.marriedToEve:
    REP #$30                                                   ;8288C4|C230    |      ;
    %CheckFlag(event6, $0004)
    BNE +                                                      ;8288CD|D00B    |8288DA;
    LDA.L nLove_Eve                                            ;8288CF|AF271F7F|7F1F27;
    CMP.W #$01C2                                               ;8288D3|C9C201  |      ;
    BCS .label0                                                ;8288D6|B00F    |8288E7;
    BRA .canHaveSecondChild                                    ;8288D8|804D    |828927;
 
 
  + REP #$30                                                   ;8288DA|C230    |      ;
    LDA.L nLove_Eve                                            ;8288DC|AF271F7F|7F1F27;
    CMP.W #$028A                                               ;8288E0|C98A02  |      ;
    BCS .label0                                                ;8288E3|B002    |8288E7;
    BRA .canHaveSecondChild                                    ;8288E5|8040    |828927;
 
 
.label0:
    REP #$30                                                   ;8288E7|C230    |      ;
    LDA.L nMarriedDaysCounter                                  ;8288E9|AF3B1F7F|7F1F3B;
    CMP.W #$0014                                               ;8288ED|C91400  |      ;
    BCC .canHaveSecondChild                                    ;8288F0|9035    |828927;
    %CheckFlag(event1, $0080)
    BEQ .canHaveSecondChild                                    ;8288F9|F02C    |828927;
    %CheckFlag(event6, $0004)
    BNE .checkFirstChildAge                                    ;828902|D00D    |828911;
    %SetFlag(event6, $0004)
    BRA .canHaveSecondChild                                    ;82890F|8016    |828927;
 
 
.checkFirstChildAge:
    REP #$30                                                   ;828911|C230    |      ;
    LDA.L nFirstChildAge                                       ;828913|AF371F7F|7F1F37;
    CMP.W #$005A                                               ;828917|C95A00  |      ;
    BCC .canHaveSecondChild                                    ;82891A|900B    |828927;
    %SetFlag(event6, $0008)
 
.canHaveSecondChild:
    REP #$30                                                   ;828927|C230    |      ;
    %CheckFlag(event6, $0004)
    BEQ .label4                                                ;828930|F04C    |82897E;
    LDA.L nFirstChildAge                                       ;828932|AF371F7F|7F1F37;
    INC A                                                      ;828936|1A      |      ;
    STA.L nFirstChildAge                                       ;828937|8F371F7F|7F1F37;
    CMP.W #$003C                                               ;82893B|C93C00  |      ;
    BCC .label4                                                ;82893E|903E    |82897E;
    BNE .label3                                                ;828940|D016    |828958;
    %SetFlag(event6, $0010)
    REP #$20                                                   ;82894D|C220    |      ;
    LDA.W #$0032                                               ;82894F|A93200  |      ;
    JSL.L fGameEngine_AddHappiness                             ;828952|2282B283|83B282;
    BRA .return                                                ;828956|807D    |8289D5;
 
 
.label3:
    REP #$30                                                   ;828958|C230    |      ;
    LDA.L nFirstChildAge                                       ;82895A|AF371F7F|7F1F37;
    SEC                                                        ;82895E|38      |      ;
    SBC.W #$003C                                               ;82895F|E93C00  |      ;
    STA.B strcVariables.n16Temp1                               ;828962|857E    |00007E;
    LDA.W #$0078                                               ;828964|A97800  |      ;
    STA.B strcVariables.n16Temp2                               ;828967|8580    |000080;
    JSL.L fMathDivide                                          ;828969|22828083|838082;
    REP #$30                                                   ;82896D|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;82896F|A57E    |00007E;
    BNE .label4                                                ;828971|D00B    |82897E;
    %SetFlag(event5, $0100)
 
.label4:
    REP #$30                                                   ;82897E|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ .return                                                ;828987|F04C    |8289D5;
    LDA.L nSecondChildAge                                      ;828989|AF391F7F|7F1F39;
    INC A                                                      ;82898D|1A      |      ;
    STA.L nSecondChildAge                                      ;82898E|8F391F7F|7F1F39;
    CMP.W #$003C                                               ;828992|C93C00  |      ;
    BCC .return                                                ;828995|903E    |8289D5;
    BNE .label5                                                ;828997|D016    |8289AF;
    %SetFlag(event6, $0010)
    REP #$20                                                   ;8289A4|C220    |      ;
    LDA.W #$0064                                               ;8289A6|A96400  |      ;
    JSL.L fGameEngine_AddHappiness                             ;8289A9|2282B283|83B282;
    BRA .return                                                ;8289AD|8026    |8289D5;
 
 
.label5:
    REP #$30                                                   ;8289AF|C230    |      ;
    LDA.L nSecondChildAge                                      ;8289B1|AF391F7F|7F1F39;
    SEC                                                        ;8289B5|38      |      ;
    SBC.W #$003C                                               ;8289B6|E93C00  |      ;
    STA.B strcVariables.n16Temp1                               ;8289B9|857E    |00007E;
    LDA.W #$0078                                               ;8289BB|A97800  |      ;
    STA.B strcVariables.n16Temp2                               ;8289BE|8580    |000080;
    JSL.L fMathDivide                                          ;8289C0|22828083|838082;
    REP #$30                                                   ;8289C4|C230    |      ;
    LDA.B strcVariables.n16Temp1                               ;8289C6|A57E    |00007E;
    BNE .return                                                ;8289C8|D00B    |8289D5;
    %SetFlag(event5, $0200)
 
.return:
    RTL                                                        ;8289D5|6B      |      ;
 
 
fWriteSeasonWeekdayAndDayOrdinal:
    SEP #$20                                                   ;8289D6|E220    |      ;
    REP #$10                                                   ;8289D8|C210    |      ;
    LDA.B #$00                                                 ;8289DA|A900    |      ;
    XBA                                                        ;8289DC|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;8289DD|AF191F7F|7F1F19;
    REP #$20                                                   ;8289E1|C220    |      ;
    ASL A                                                      ;8289E3|0A      |      ;
    ASL A                                                      ;8289E4|0A      |      ;
    ASL A                                                      ;8289E5|0A      |      ;
    ASL A                                                      ;8289E6|0A      |      ; * 16
    TAX                                                        ;8289E7|AA      |      ;
    LDA.L aSeasonString,X                                      ;8289E8|BFD98A82|828AD9;
    STA.W strcNames.wSeason                                    ;8289EC|8DB308  |0008B3;
    INX                                                        ;8289EF|E8      |      ;
    INX                                                        ;8289F0|E8      |      ;
    LDA.L aSeasonString,X                                      ;8289F1|BFD98A82|828AD9;
    STA.W strcNames.wSeason+2                                  ;8289F5|8DB508  |0008B5;
    INX                                                        ;8289F8|E8      |      ;
    INX                                                        ;8289F9|E8      |      ;
    LDA.L aSeasonString,X                                      ;8289FA|BFD98A82|828AD9;
    STA.W strcNames.wSeason+4                                  ;8289FE|8DB708  |0008B7;
    INX                                                        ;828A01|E8      |      ;
    INX                                                        ;828A02|E8      |      ;
    LDA.L aSeasonString,X                                      ;828A03|BFD98A82|828AD9;
    STA.W strcNames.wSeason+6                                  ;828A07|8DB908  |0008B9;
    INX                                                        ;828A0A|E8      |      ;
    INX                                                        ;828A0B|E8      |      ;
    LDA.L aSeasonString,X                                      ;828A0C|BFD98A82|828AD9;
    STA.W strcNames.wSeason+8                                  ;828A10|8DBB08  |0008BB;
    INX                                                        ;828A13|E8      |      ;
    INX                                                        ;828A14|E8      |      ;
    LDA.L aSeasonString,X                                      ;828A15|BFD98A82|828AD9;
    STA.W strcNames.wSeason+10                                 ;828A19|8DBD08  |0008BD;
    SEP #$20                                                   ;828A1C|E220    |      ;
    LDA.B #$00                                                 ;828A1E|A900    |      ;
    XBA                                                        ;828A20|EB      |      ;
    LDA.L nCurrentWeekdayID                                    ;828A21|AF1A1F7F|7F1F1A;
    REP #$20                                                   ;828A25|C220    |      ;
    ASL A                                                      ;828A27|0A      |      ;
    ASL A                                                      ;828A28|0A      |      ;
    ASL A                                                      ;828A29|0A      |      ;
    ASL A                                                      ;828A2A|0A      |      ;
    ASL A                                                      ;828A2B|0A      |      ;
    TAX                                                        ;828A2C|AA      |      ;
    LDA.L aWeekdayString,X                                     ;828A2D|BF198B82|828B19;
    STA.W strcNames.wWeekday                                   ;828A31|8DBF08  |0008BF;
    INX                                                        ;828A34|E8      |      ;
    INX                                                        ;828A35|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A36|BF198B82|828B19;
    STA.W strcNames.wWeekday+2                                 ;828A3A|8DC108  |0008C1;
    INX                                                        ;828A3D|E8      |      ;
    INX                                                        ;828A3E|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A3F|BF198B82|828B19;
    STA.W strcNames.wWeekday+4                                 ;828A43|8DC308  |0008C3;
    INX                                                        ;828A46|E8      |      ;
    INX                                                        ;828A47|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A48|BF198B82|828B19;
    STA.W strcNames.wWeekday+6                                 ;828A4C|8DC508  |0008C5;
    INX                                                        ;828A4F|E8      |      ;
    INX                                                        ;828A50|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A51|BF198B82|828B19;
    STA.W strcNames.wWeekday+8                                 ;828A55|8DC708  |0008C7;
    INX                                                        ;828A58|E8      |      ;
    INX                                                        ;828A59|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A5A|BF198B82|828B19;
    STA.W strcNames.wWeekday+10                                ;828A5E|8DC908  |0008C9;
    INX                                                        ;828A61|E8      |      ;
    INX                                                        ;828A62|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A63|BF198B82|828B19;
    STA.W strcNames.wWeekday+12                                ;828A67|8DCB08  |0008CB;
    INX                                                        ;828A6A|E8      |      ;
    INX                                                        ;828A6B|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A6C|BF198B82|828B19;
    STA.W strcNames.wWeekday+14                                ;828A70|8DCD08  |0008CD;
    INX                                                        ;828A73|E8      |      ;
    INX                                                        ;828A74|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A75|BF198B82|828B19;
    STA.W strcNames.wWeekday+16                                ;828A79|8DCF08  |0008CF;
    SEP #$20                                                   ;828A7C|E220    |      ;
    LDA.B #$00                                                 ;828A7E|A900    |      ;
    XBA                                                        ;828A80|EB      |      ;
    LDA.L nCurrentDay                                          ;828A81|AF1B1F7F|7F1F1B;
    REP #$20                                                   ;828A85|C220    |      ;
    CMP.W #$0001                                               ;828A87|C90100  |      ;
    BEQ .first                                                 ;828A8A|F00F    |828A9B;
    CMP.W #$0002                                               ;828A8C|C90200  |      ;
    BEQ .nd                                                    ;828A8F|F011    |828AA2;
    CMP.W #$0003                                               ;828A91|C90300  |      ;
    BEQ .rd                                                    ;828A94|F013    |828AA9;
    LDX.W #$000C                                               ;828A96|A20C00  |      ;
    BRA .loadordinal                                           ;828A99|8015    |828AB0;
 
 
.first:
    REP #$30                                                   ;828A9B|C230    |      ;
    LDX.W #$0000                                               ;828A9D|A20000  |      ;
    BRA .loadordinal                                           ;828AA0|800E    |828AB0;
 
 
.nd:
    REP #$30                                                   ;828AA2|C230    |      ;
    LDX.W #$0004                                               ;828AA4|A20400  |      ;
    BRA .loadordinal                                           ;828AA7|8007    |828AB0;
 
 
.rd:
    REP #$30                                                   ;828AA9|C230    |      ;
    LDX.W #$0008                                               ;828AAB|A20800  |      ;
    BRA .loadordinal                                           ;828AAE|8000    |828AB0;
 
 
.loadordinal:
    REP #$30                                                   ;828AB0|C230    |      ;
    LDA.L aDayOrdinalString,X                                  ;828AB2|BFF98B82|828BF9;
    STA.W strcNames.wDayOrdinal                                ;828AB6|8DD108  |0008D1;
    INX                                                        ;828AB9|E8      |      ;
    INX                                                        ;828ABA|E8      |      ;
    LDA.L aDayOrdinalString,X                                  ;828ABB|BFF98B82|828BF9;
    STA.W strcNames.wDayOrdinal+2                              ;828ABF|8DD308  |0008D3;
    RTL                                                        ;828AC2|6B      |      ;
 
 
aUnused_828AC3:
    db $69,$01,$CB,$01,$15,$01,$27,$01,$29,$01,$3C,$01         ;828AC3|        |      ;
    db $78,$02,$6C,$01,$AA,$01,$38,$01,$E4,$00                 ;828ACF|        |      ;
 
aSeasonString:
    dw $002C,$000F,$0011,$0008,$000D,$0006                     ;828AD9|        |      ; 0x04 * [string[16]]
    dw $0000,$0000,$002C,$0014,$000C,$000C                     ;828AE5|        |      ;
    dw $0004,$0011,$0000,$0000,$001F,$0000                     ;828AF1|        |      ;
    dw $000B,$000B,$00B1,$00B1,$0000,$0000                     ;828AFD|        |      ;
    dw $0030,$0008,$000D,$0013,$0004,$0011                     ;828B09|        |      ;
    dw $0000,$0000                                             ;828B15|        |      ;
 
aWeekdayString:
    dw $002C,$0014,$000D,$0003,$0000,$0018                     ;828B19|        |      ; 0x07 * [string[32]]
    dw $00B1,$00B1,$00B1,$0000,$0000,$0000                     ;828B25|        |      ;
    dw $0000,$0000,$0000,$0000,$0026,$000E                     ;828B31|        |      ;
    dw $000D,$0003,$0000,$0018,$00B1,$00B1                     ;828B3D|        |      ;
    dw $00B1,$0000,$0000,$0000,$0000,$0000                     ;828B49|        |      ;
    dw $0000,$0000,$002D,$0014,$0004,$0012                     ;828B55|        |      ;
    dw $0003,$0000,$0018,$00B1,$00B1,$0000                     ;828B61|        |      ;
    dw $0000,$0000,$0000,$0000,$0000,$0000                     ;828B6D|        |      ;
    dw $0030,$0004,$0003,$000D,$0004,$0012                     ;828B79|        |      ;
    dw $0003,$0000,$0018,$0000,$0000,$0000                     ;828B85|        |      ;
    dw $0000,$0000,$0000,$0000,$002D,$0007                     ;828B91|        |      ;
    dw $0014,$0011,$0012,$0003,$0000,$0018                     ;828B9D|        |      ;
    dw $00B1,$0000,$0000,$0000,$0000,$0000                     ;828BA9|        |      ;
    dw $0000,$0000,$001F,$0011,$0008,$0003                     ;828BB5|        |      ;
    dw $0000,$0018,$00B1,$00B1,$00B1,$0000                     ;828BC1|        |      ;
    dw $0000,$0000,$0000,$0000,$0000,$0000                     ;828BCD|        |      ;
    dw $002C,$0000,$0013,$0014,$0011,$0003                     ;828BD9|        |      ;
    dw $0000,$0018,$00B1,$0000,$0000,$0000                     ;828BE5|        |      ;
    dw $0000,$0000,$0000,$0000                                 ;828BF1|        |      ;
 
aDayOrdinalString:
    dw $0012,$0013,$000D,$0003,$0011,$0003                     ;828BF9|        |      ; 0x04 * [string[2]] - (st, nd, rd, th)
    dw $0013,$0007                                             ;828C05|        |      ;
 
fWeatherForecast_828C09:
    REP #$30                                                   ;828C09|C230    |      ;
    STZ.W strcDialogDisplay.mapFlags                           ;828C0B|9C9601  |000196;
    SEP #$20                                                   ;828C0E|E220    |      ;
    LDA.B #$00                                                 ;828C10|A900    |      ;
    XBA                                                        ;828C12|EB      |      ;
    LDA.W nWeatherForecast                                     ;828C13|AD8C09  |00098C;
    BEQ .weatherSunny                                          ;828C16|F01A    |828C32;
    CMP.B #$01                                                 ;828C18|C901    |      ;
    BEQ .weatherRainy                                          ;828C1A|F02F    |828C4B;
    CMP.B #$02                                                 ;828C1C|C902    |      ;
    BEQ .weatherSnowy                                          ;828C1E|F052    |828C72;
    CMP.B #$03                                                 ;828C20|C903    |      ;
    BEQ .weatherHurricane                                      ;828C22|F072    |828C96;
    CMP.B #$04                                                 ;828C24|C904    |      ;
    BEQ .weather04                                             ;828C26|F07C    |828CA4;
    CMP.B #$05                                                 ;828C28|C905    |      ;
    BNE +                                                      ;828C2A|D003    |828C2F;
    JMP.W .weather05                                           ;828C2C|4CC88C  |828CC8;
 
 
  + JMP.W .return                                              ;828C2F|4CEC8C  |828CEC;
 
 
.weatherSunny:
    SEP #$20                                                   ;828C32|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;828C34|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;828C38|C901    |      ;
    BEQ +                                                      ;828C3A|F003    |828C3F;
    JMP.W .return                                              ;828C3C|4CEC8C  |828CEC;
 
 
  + REP #$20                                                   ;828C3F|C220    |      ;
    LDA.L nWeatherTable_828CED                                 ;828C41|AFED8C82|828CED;
    STA.W strcDialogDisplay.mapFlags                           ;828C45|8D9601  |000196;
    JMP.W .return                                              ;828C48|4CEC8C  |828CEC;
 
 
.weatherRainy:
    SEP #$20                                                   ;828C4B|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;828C4D|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;828C51|C903    |      ;
    BNE +                                                      ;828C53|D00F    |828C64;
    REP #$20                                                   ;828C55|C220    |      ;
    LDX.W #$0004                                               ;828C57|A20400  |      ;
    LDA.L nWeatherTable_828CED,X                               ;828C5A|BFED8C82|828CED;
    STA.W strcDialogDisplay.mapFlags                           ;828C5E|8D9601  |000196;
    JMP.W .return                                              ;828C61|4CEC8C  |828CEC;
 
 
  + REP #$20                                                   ;828C64|C220    |      ;
    LDX.W #$0002                                               ;828C66|A20200  |      ;
    LDA.L nWeatherTable_828CED,X                               ;828C69|BFED8C82|828CED;
    STA.W strcDialogDisplay.mapFlags                           ;828C6D|8D9601  |000196;
    BRA .return                                                ;828C70|807A    |828CEC;
 
 
.weatherSnowy:
    SEP #$20                                                   ;828C72|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;828C74|AF191F7F|7F1F19;
    BNE +                                                      ;828C78|D00E    |828C88;
    LDX.W #$0002                                               ;828C7A|A20200  |      ;
    REP #$20                                                   ;828C7D|C220    |      ;
    LDA.L nWeatherTable_828CED,X                               ;828C7F|BFED8C82|828CED;
    STA.W strcDialogDisplay.mapFlags                           ;828C83|8D9601  |000196;
    BRA .return                                                ;828C86|8064    |828CEC;
 
 
  + REP #$20                                                   ;828C88|C220    |      ;
    LDX.W #$0004                                               ;828C8A|A20400  |      ;
    LDA.L nWeatherTable_828CED,X                               ;828C8D|BFED8C82|828CED;
    STA.W strcDialogDisplay.mapFlags                           ;828C91|8D9601  |000196;
    BRA .return                                                ;828C94|8056    |828CEC;
 
 
.weatherHurricane:
    REP #$20                                                   ;828C96|C220    |      ;
    LDX.W #$0006                                               ;828C98|A20600  |      ;
    LDA.L nWeatherTable_828CED,X                               ;828C9B|BFED8C82|828CED;
    STA.W strcDialogDisplay.mapFlags                           ;828C9F|8D9601  |000196;
    BRA .return                                                ;828CA2|8048    |828CEC;
 
 
.weather04:
    REP #$20                                                   ;828CA4|C220    |      ;
    LDX.W #$0008                                               ;828CA6|A20800  |      ;
    LDA.L nWeatherTable_828CED,X                               ;828CA9|BFED8C82|828CED;
    STA.W strcDialogDisplay.mapFlags                           ;828CAD|8D9601  |000196;
    %SetFlag(event1, $0002)
    %SetFlag(event6, $0100)
    BRA .return                                                ;828CC6|8024    |828CEC;
 
 
.weather05:
    REP #$20                                                   ;828CC8|C220    |      ;
    LDX.W #$000A                                               ;828CCA|A20A00  |      ;
    LDA.L nWeatherTable_828CED,X                               ;828CCD|BFED8C82|828CED;
    STA.W strcDialogDisplay.mapFlags                           ;828CD1|8D9601  |000196;
    %SetFlag(event1, $0001)
    %SetFlag(event6, $0080)
    BRA .return                                                ;828CEA|8000    |828CEC;
 
 
.return:
    RTL                                                        ;828CEC|6B      |      ;
 
 
nWeatherTable_828CED:
    dw $0004,$0002,$0008,$0010,$0200,$0100                     ;828CED|        |      ; [n16 nSunny, n16 nRainy, n16 nSnowy, n16 nHurricane, n16 nWeather4, n16 nWeather5]
 
fWeatherRandomizer:
    SEP #$20                                                   ;828CF9|E220    |      ;
    REP #$10                                                   ;828CFB|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;828CFD|AF191F7F|7F1F19;
    BNE .harvestFestival                                       ;828D01|D015    |828D18;
    LDA.L nCurrentDay                                          ;828D03|AF1B1F7F|7F1F1B;
    CMP.B #$16                                                 ;828D07|C916    |      ;
    BEQ .flowerFestival                                        ;828D09|F003    |828D0E;
    JMP.W .label6                                              ;828D0B|4C648E  |828E64;
 
 
.flowerFestival:
    SEP #$20                                                   ;828D0E|E220    |      ;
    LDA.B #!WEATHER_FLOWERFESTIVAL                                                 
    STA.W nWeatherForecast                                     ;828D12|8D8C09  |00098C;
    JMP.W .justReturn                                          ;828D15|4CB18E  |828EB1;
 
 
.harvestFestival:
    SEP #$20                                                   ;828D18|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;828D1A|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;828D1E|C902    |      ;
    BNE .thanksgivingFestival                                  ;828D20|D029    |828D4B;
    LDA.L nCurrentDay                                          ;828D22|AF1B1F7F|7F1F1B;
    CMP.B #$0B                                                 ;828D26|C90B    |      ;
    BNE .eggHuntFestival                                       ;828D28|D00A    |828D34;
    SEP #$20                                                   ;828D2A|E220    |      ;
    LDA.B #!WEATHER_HARVESTFESTIVAL                                                 
    STA.W nWeatherForecast                                     ;828D2E|8D8C09  |00098C;
    JMP.W .justReturn                                          ;828D31|4CB18E  |828EB1;
 
 
.eggHuntFestival:
    SEP #$20                                                   ;828D34|E220    |      ;
    LDA.L nCurrentDay                                          ;828D36|AF1B1F7F|7F1F1B;
    CMP.B #$13                                                 ;828D3A|C913    |      ;
    BEQ +                                                      ;828D3C|F003    |828D41;
    JMP.W .label6                                              ;828D3E|4C648E  |828E64;
 
 
  + SEP #$20                                                   ;828D41|E220    |      ;
    LDA.B #!WEATHER_EGGFESTIVAL                                                 
    STA.W nWeatherForecast                                     ;828D45|8D8C09  |00098C;
    JMP.W .justReturn                                          ;828D48|4CB18E  |828EB1;
 
 
.thanksgivingFestival:
    SEP #$20                                                   ;828D4B|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;828D4D|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;828D51|C903    |      ;
    BEQ +                                                      ;828D53|F003    |828D58;
    JMP.W .hurricane                                           ;828D55|4CDF8D  |828DDF;
 
 
  + LDA.L nCurrentDay                                          ;828D58|AF1B1F7F|7F1F1B;
    CMP.B #$09                                                 ;828D5C|C909    |      ;
    BNE .starNightFestival                                     ;828D5E|D00A    |828D6A;
    SEP #$20                                                   ;828D60|E220    |      ;
    LDA.B #!WEATHER_THANKSGIVING                                                 
    STA.W nWeatherForecast                                     ;828D64|8D8C09  |00098C;
    JMP.W .justReturn                                          ;828D67|4CB18E  |828EB1;
 
 
.starNightFestival:
    SEP #$20                                                   ;828D6A|E220    |      ;
    LDA.L nCurrentDay                                          ;828D6C|AF1B1F7F|7F1F1B;
    CMP.B #$17                                                 ;828D70|C917    |      ;
    BNE .newYearFestival                                       ;828D72|D00A    |828D7E;
    SEP #$20                                                   ;828D74|E220    |      ;
    LDA.B #!WEATHER_STARNIGHTFESTIVAL                                                 
    STA.W nWeatherForecast                                     ;828D78|8D8C09  |00098C;
    JMP.W .justReturn                                          ;828D7B|4CB18E  |828EB1;
 
 
.newYearFestival:
    SEP #$20                                                   ;828D7E|E220    |      ;
    LDA.L nCurrentDay                                          ;828D80|AF1B1F7F|7F1F1B;
    CMP.B #$1E                                                 ;828D84|C91E    |      ;
    BNE .label1                                                ;828D86|D00A    |828D92;
    SEP #$20                                                   ;828D88|E220    |      ;
    LDA.B #!WEATHER_NEWYEARFESTIVAL                                                 
    STA.W nWeatherForecast                                     ;828D8C|8D8C09  |00098C;
    JMP.W .justReturn                                          ;828D8F|4CB18E  |828EB1;
 
 
.label1:
    SEP #$20                                                   ;828D92|E220    |      ;
    LDA.L nCurrentYearID                                       ;828D94|AF181F7F|7F1F18;
    BEQ .thirdYear                                             ;828D98|F003    |828D9D;
    JMP.W .label6                                              ;828D9A|4C648E  |828E64;
 
 
.thirdYear:
    REP #$20                                                   ;828D9D|C220    |      ;
    %CheckFlag(event1, $0002)
    BEQ +                                                      ;828DA6|F003    |828DAB;
    JMP.W .label6                                              ;828DA8|4C648E  |828E64;
 
 
  + SEP #$20                                                   ;828DAB|E220    |      ;
    LDA.L nCurrentDay                                          ;828DAD|AF1B1F7F|7F1F1B;
    CMP.B #$07                                                 ;828DB1|C907    |      ;
    BEQ .sunday                                                ;828DB3|F020    |828DD5;
    LDA.B #$00                                                 ;828DB5|A900    |      ;
    XBA                                                        ;828DB7|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;828DB8|AF191F7F|7F1F19;
    REP #$20                                                   ;828DBC|C220    |      ;
    TAX                                                        ;828DBE|AA      |      ;
    SEP #$20                                                   ;828DBF|E220    |      ;
    LDA.L .e_Winter7thDay,X                                    ;828DC1|BFC28E82|828EC2;
    BNE +                                                      ;828DC5|D003    |828DCA;
    JMP.W .label6                                              ;828DC7|4C648E  |828E64;
 
 
  + JSL.L fCore_GetRandomNumber                                ;828DCA|22F98980|8089F9;
    SEP #$20                                                   ;828DCE|E220    |      ;
    BEQ .sunday                                                ;828DD0|F003    |828DD5;
    JMP.W .label6                                              ;828DD2|4C648E  |828E64;
 
 
.sunday:
    SEP #$20                                                   ;828DD5|E220    |      ;
    LDA.B #!WEATHER_FAIR                                                 
    STA.W nWeatherForecast                                     ;828DD9|8D8C09  |00098C;
    JMP.W .justReturn                                          ;828DDC|4CB18E  |828EB1;
 
 
.hurricane:
    SEP #$20                                                   ;828DDF|E220    |      ;
    LDA.L nCurrentYearID                                       ;828DE1|AF181F7F|7F1F18;
    BNE .label4                                                ;828DE5|D039    |828E20;
    REP #$20                                                   ;828DE7|C220    |      ;
    %CheckFlag(event1, $0001)
    BNE .label4                                                ;828DF0|D02E    |828E20;
    SEP #$20                                                   ;828DF2|E220    |      ;
    LDA.L nCurrentDay                                          ;828DF4|AF1B1F7F|7F1F1B;
    CMP.B #$1D                                                 ;828DF8|C91D    |      ;
    BEQ .label3                                                ;828DFA|F01A    |828E16;
    LDA.B #$00                                                 ;828DFC|A900    |      ;
    XBA                                                        ;828DFE|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;828DFF|AF191F7F|7F1F19;
    REP #$20                                                   ;828E03|C220    |      ;
    TAX                                                        ;828E05|AA      |      ;
    SEP #$20                                                   ;828E06|E220    |      ;
    LDA.L .e_Summer29thDay,X                                   ;828E08|BFBE8E82|828EBE;
    BEQ .label4                                                ;828E0C|F012    |828E20;
    JSL.L fCore_GetRandomNumber                                ;828E0E|22F98980|8089F9;
    SEP #$20                                                   ;828E12|E220    |      ;
    BNE .label4                                                ;828E14|D00A    |828E20;
 
.label3:
    SEP #$20                                                   ;828E16|E220    |      ;
    LDA.B #!WEATHER_CALM                                                 
    STA.W nWeatherForecast                                     ;828E1A|8D8C09  |00098C;
    JMP.W .justReturn                                          ;828E1D|4CB18E  |828EB1;
 
 
.label4:
    SEP #$20                                                   ;828E20|E220    |      ;
    LDA.L nCurrentDay                                          ;828E22|AF1B1F7F|7F1F1B;
    CMP.B #$1E                                                 ;828E26|C91E    |      ;
    BEQ .label6                                                ;828E28|F03A    |828E64;
    SEP #$20                                                   ;828E2A|E220    |      ;
    LDA.B #$00                                                 ;828E2C|A900    |      ;
    XBA                                                        ;828E2E|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;828E2F|AF191F7F|7F1F19;
    REP #$20                                                   ;828E33|C220    |      ;
    TAX                                                        ;828E35|AA      |      ;
    SEP #$20                                                   ;828E36|E220    |      ;
    LDA.B #$00                                                 ;828E38|A900    |      ;
    XBA                                                        ;828E3A|EB      |      ;
    LDA.L .e_Summer30thDay,X                                   ;828E3B|BFB28E82|828EB2;
    BEQ .label6                                                ;828E3F|F023    |828E64;
    REP #$30                                                   ;828E41|C230    |      ;
    TAY                                                        ;828E43|A8      |      ;
    %CheckFlag(event5, $1000)
    BEQ .label5                                                ;828E4B|F003    |828E50;
    TYA                                                        ;828E4D|98      |      ;
    ASL A                                                      ;828E4E|0A      |      ;
    TAY                                                        ;828E4F|A8      |      ;
 
.label5:
    REP #$30                                                   ;828E50|C230    |      ;
    TYA                                                        ;828E52|98      |      ;
    SEP #$20                                                   ;828E53|E220    |      ;
    JSL.L fCore_GetRandomNumber                                ;828E55|22F98980|8089F9;
    SEP #$20                                                   ;828E59|E220    |      ;
    BNE .label6                                                ;828E5B|D007    |828E64;
    LDA.B #!WEATHER_HURRICANE                                                 
    STA.W nWeatherForecast                                     ;828E5F|8D8C09  |00098C;
    BRA .justReturn                                            ;828E62|804D    |828EB1;
 
 
.label6:
    SEP #$20                                                   ;828E64|E220    |      ;
    LDA.B #$00                                                 ;828E66|A900    |      ;
    XBA                                                        ;828E68|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;828E69|AF191F7F|7F1F19; Load season to A
    REP #$20                                                   ;828E6D|C220    |      ;
    TAX                                                        ;828E6F|AA      |      ; Move A toX
    SEP #$20                                                   ;828E70|E220    |      ;
    LDA.L .e_Unknown1,X                                        ;828E72|BFB68E82|828EB6;
    BEQ .label7                                                ;828E76|F00F    |828E87;
    JSL.L fCore_GetRandomNumber                                ;828E78|22F98980|8089F9;
    SEP #$20                                                   ;828E7C|E220    |      ;
    BNE .label7                                                ;828E7E|D007    |828E87;
    LDA.B #!WEATHER_RAIN                                                 
    STA.W nWeatherForecast                                     ;828E82|8D8C09  |00098C;
    BRA .justReturn                                            ;828E85|802A    |828EB1;
 
 
.label7:
    SEP #$20                                                   ;828E87|E220    |      ;
    LDA.B #$00                                                 ;828E89|A900    |      ;
    XBA                                                        ;828E8B|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;828E8C|AF191F7F|7F1F19;
    REP #$20                                                   ;828E90|C220    |      ;
    TAX                                                        ;828E92|AA      |      ;
    SEP #$20                                                   ;828E93|E220    |      ;
    LDA.L .e_Unknown2,X                                        ;828E95|BFBA8E82|828EBA;
    BEQ .return                                                ;828E99|F00F    |828EAA;
    JSL.L fCore_GetRandomNumber                                ;828E9B|22F98980|8089F9;
    SEP #$20                                                   ;828E9F|E220    |      ;
    BNE .return                                                ;828EA1|D007    |828EAA;
    LDA.B #!WEATHER_SNOW                                                 
    STA.W nWeatherForecast                                     ;828EA5|8D8C09  |00098C;
    BRA .justReturn                                            ;828EA8|8007    |828EB1;
 
 
.return:
    SEP #$20                                                   ;828EAA|E220    |      ;
    LDA.B #!WEATHER_SUN                                                 
    STA.W nWeatherForecast                                     ;828EAE|8D8C09  |00098C;
 
.justReturn:
    RTL                                                        ;828EB1|6B      |      ;
 
 
.e_Summer30thDay:
    db $00,$1E,$00,$00                                         ;828EB2|        |      ; Season index based
 
.e_Unknown1:
    db $06,$0A,$0A,$00                                         ;828EB6|        |      ; Season index based
 
.e_Unknown2:
    db $00,$00,$00,$03                                         ;828EBA|        |      ; Season index based
 
.e_Summer29thDay:
    db $00,$1E,$00,$00                                         ;828EBE|        |      ; Season index based
 
.e_Winter7thDay:
    db $00,$00,$00,$08                                         ;828EC2|        |      ; Season index based
 
fCore_FindBestLove:
    REP #$30                                                   ;828EC6|C230    |      ;
    LDY.W #$0000                                               ;828EC8|A00000  |      ;
    LDA.L nLove_Maria                                          ;828ECB|AF1F1F7F|7F1F1F;
    STA.B strcVariables.n16Temp1                               ;828ECF|857E    |00007E;
    LDX.W #$0002                                               ;828ED1|A20200  |      ;
 
.loop:
    REP #$30                                                   ;828ED4|C230    |      ;
    LDA.L nLove_Maria,X                                        ;828ED6|BF1F1F7F|7F1F1F;
    CMP.B strcVariables.n16Temp1                               ;828EDA|C57E    |00007E;
    BCS +                                                      ;828EDC|B002    |828EE0;
    BRA .someoneLovesMeMuch                                    ;828EDE|8007    |828EE7;
 
 
  + REP #$30                                                   ;828EE0|C230    |      ;
    STA.B strcVariables.n16Temp1                               ;828EE2|857E    |00007E;
    TXA                                                        ;828EE4|8A      |      ;
    LSR A                                                      ;828EE5|4A      |      ;
    TAY                                                        ;828EE6|A8      |      ;
 
.someoneLovesMeMuch:
    REP #$30                                                   ;828EE7|C230    |      ;
    INX                                                        ;828EE9|E8      |      ;
    INX                                                        ;828EEA|E8      |      ;
    CPX.W #$000A                                               ;828EEB|E00A00  |      ;
    BNE .loop                                                  ;828EEE|D0E4    |828ED4;
    CPY.W #$0000                                               ;828EF0|C00000  |      ;
    BEQ .maria                                                 ;828EF3|F017    |828F0C;
    CPY.W #$0001                                               ;828EF5|C00100  |      ;
    BEQ .ann                                                   ;828EF8|F033    |828F2D;
    CPY.W #$0002                                               ;828EFA|C00200  |      ;
    BEQ .nina                                                  ;828EFD|F04F    |828F4E;
    CPY.W #$0003                                               ;828EFF|C00300  |      ;
    BEQ .ellen                                                 ;828F02|F06B    |828F6F;
    CPY.W #$0004                                               ;828F04|C00400  |      ;
    BNE .maria                                                 ;828F07|D003    |828F0C;
    JMP.W .eve                                                 ;828F09|4C908F  |828F90;
 
 
.maria:
    REP #$30                                                   ;828F0C|C230    |      ;
    LDA.W #$0026                                               ;828F0E|A92600  |      ;
    STA.W strcNames.wMostLovedGirl                             ;828F11|8DA108  |0008A1;
    LDA.W #$0000                                               ;828F14|A90000  |      ;
    STA.W strcNames.wMostLovedGirl+2                           ;828F17|8DA308  |0008A3;
    LDA.W #$0011                                               ;828F1A|A91100  |      ;
    STA.W strcNames.wMostLovedGirl+4                           ;828F1D|8DA508  |0008A5;
    LDA.W #$0008                                               ;828F20|A90800  |      ;
    STA.W strcNames.wMostLovedGirl+6                           ;828F23|8DA708  |0008A7;
    LDA.W #$0000                                               ;828F26|A90000  |      ;
    STA.W strcNames.wMostLovedGirl+8                           ;828F29|8DA908  |0008A9;
    RTL                                                        ;828F2C|6B      |      ;
 
 
.ann:
    REP #$30                                                   ;828F2D|C230    |      ;
    LDA.W #$001A                                               ;828F2F|A91A00  |      ;
    STA.W strcNames.wMostLovedGirl                             ;828F32|8DA108  |0008A1;
    LDA.W #$000D                                               ;828F35|A90D00  |      ;
    STA.W strcNames.wMostLovedGirl+2                           ;828F38|8DA308  |0008A3;
    LDA.W #$000D                                               ;828F3B|A90D00  |      ;
    STA.W strcNames.wMostLovedGirl+4                           ;828F3E|8DA508  |0008A5;
    LDA.W #!DIALOG_SPACE                                               
    STA.W strcNames.wMostLovedGirl+6                           ;828F44|8DA708  |0008A7;
    LDA.W #!DIALOG_SPACE                                               
    STA.W strcNames.wMostLovedGirl+8                           ;828F4A|8DA908  |0008A9;
    RTL                                                        ;828F4D|6B      |      ;
 
 
.nina:
    REP #$30                                                   ;828F4E|C230    |      ;
    LDA.W #$0027                                               ;828F50|A92700  |      ;
    STA.W strcNames.wMostLovedGirl                             ;828F53|8DA108  |0008A1;
    LDA.W #$0008                                               ;828F56|A90800  |      ;
    STA.W strcNames.wMostLovedGirl+2                           ;828F59|8DA308  |0008A3;
    LDA.W #$000D                                               ;828F5C|A90D00  |      ;
    STA.W strcNames.wMostLovedGirl+4                           ;828F5F|8DA508  |0008A5;
    LDA.W #$0000                                               ;828F62|A90000  |      ;
    STA.W strcNames.wMostLovedGirl+6                           ;828F65|8DA708  |0008A7;
    LDA.W #!DIALOG_SPACE                                               
    STA.W strcNames.wMostLovedGirl+8                           ;828F6B|8DA908  |0008A9;
    RTL                                                        ;828F6E|6B      |      ;
 
 
.ellen:
    REP #$30                                                   ;828F6F|C230    |      ;
    LDA.W #$001E                                               ;828F71|A91E00  |      ;
    STA.W strcNames.wMostLovedGirl                             ;828F74|8DA108  |0008A1;
    LDA.W #$000B                                               ;828F77|A90B00  |      ;
    STA.W strcNames.wMostLovedGirl+2                           ;828F7A|8DA308  |0008A3;
    LDA.W #$000B                                               ;828F7D|A90B00  |      ;
    STA.W strcNames.wMostLovedGirl+4                           ;828F80|8DA508  |0008A5;
    LDA.W #$0004                                               ;828F83|A90400  |      ;
    STA.W strcNames.wMostLovedGirl+6                           ;828F86|8DA708  |0008A7;
    LDA.W #$000D                                               ;828F89|A90D00  |      ;
    STA.W strcNames.wMostLovedGirl+8                           ;828F8C|8DA908  |0008A9;
    RTL                                                        ;828F8F|6B      |      ;
 
 
.eve:
    REP #$30                                                   ;828F90|C230    |      ;
    LDA.W #$001E                                               ;828F92|A91E00  |      ;
    STA.W strcNames.wMostLovedGirl                             ;828F95|8DA108  |0008A1;
    LDA.W #$0015                                               ;828F98|A91500  |      ;
    STA.W strcNames.wMostLovedGirl+2                           ;828F9B|8DA308  |0008A3;
    LDA.W #$0004                                               ;828F9E|A90400  |      ;
    STA.W strcNames.wMostLovedGirl+4                           ;828FA1|8DA508  |0008A5;
    LDA.W #!DIALOG_SPACE                                               
    STA.W strcNames.wMostLovedGirl+6                           ;828FA7|8DA708  |0008A7;
    LDA.W #!DIALOG_SPACE                                               
    STA.W strcNames.wMostLovedGirl+8                           ;828FAD|8DA908  |0008A9;
    RTL                                                        ;828FB0|6B      |      ;
 
 
fToolUsedSound_Unknown828FB1:
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
 
 
fToolUsedSound_Unknown828FF3:
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
    JSL.L fAudioUnknown_83833E                                 ;829034|223E8383|83833E;
 
  + SEP #$20                                                   ;829038|E220    |      ;
    REP #$10                                                   ;82903A|C210    |      ;
    PLX                                                        ;82903C|FA      |      ;
    INX                                                        ;82903D|E8      |      ;
    LDA.L nToolSoundData_829054,X                              ;82903E|BF549082|829054;
    BEQ .return                                                ;829042|F007    |82904B;
    STA.W strcAudio.reg114                                     ;829044|8D1401  |000114;
    JSL.L fAudioUnknown_83833E                                 ;829047|223E8383|83833E;
 
.return:
    SEP #$20                                                   ;82904B|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;82904D|AD2109  |000921;
    STA.W strcAudio.toolId                                     ;829050|8D1901  |000119;
    RTL                                                        ;829053|6B      |      ;
 
 
nToolSoundData_829054:
    db $00,$00,$00,$06,$14,$12,$06,$11,$0F,$06,$17,$17         ;829054|        |      ; 0x1C * [n8 nIndex, n8 nVal1, n8 nVal2]
    db $06,$11,$15,$06,$1B,$1B,$06,$1B,$1B,$06,$1B,$1B         ;829060|        |      ;
    db $06,$1B,$1B,$06,$00,$00,$06,$00,$00,$06,$00,$19         ;82906C|        |      ;
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
 
 
  + JSR.W fToolUsedUnknown_82927D                              ;8290B8|207D92  |82927D;
    SEP #$20                                                   ;8290BB|E220    |      ;
    STZ.W strcPlayerData.unkCounter91B                         ;8290BD|9C1B09  |00091B;
    LDA.B #$00                                                 ;8290C0|A900    |      ;
    XBA                                                        ;8290C2|EB      |      ;
    LDA.W strcPlayerData.toolEquipped                          ;8290C3|AD2109  |000921;
    ASL A                                                      ;8290C6|0A      |      ;
    TAX                                                        ;8290C7|AA      |      ;
    JSR.W (aToolUsedAnimationTable,X)                          ;8290C8|FC8BA5  |82A58B;
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
    JSR.W fToolusedUnknown_8292A0                              ;8291AD|20A092  |8292A0;
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
    JSR.W (aToolUsedActionTable,X)                             ;82926C|FCC3A5  |82A5C3;
    REP #$20                                                   ;82926F|C220    |      ;
    %SetFlag(daily1, $0040)
    RTL                                                        ;82927C|6B      |      ;
 
 
fToolUsedUnknown_82927D:
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
 
 
fToolusedUnknown_8292A0:
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
 
 
fToolUsedUnknown_8292BC:
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
 
 
fToolUsedUnknown_8292D6:
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
    JSR.W fToolusedUnknown_8292A0                              ;82932A|20A092  |8292A0;
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
    STA.W $097A                                                ;8293A8|8D7A09  |00097A;
    LDA.W #$0000                                               ;8293AB|A90000  |      ;
    STA.W $097E                                                ;8293AE|8D7E09  |00097E;
    SEP #$20                                                   ;8293B1|E220    |      ;
    LDA.B #$03                                                 ;8293B3|A903    |      ;
    STA.W $0974                                                ;8293B5|8D7409  |000974;
    LDA.B #$00                                                 ;8293B8|A900    |      ;
    STA.W $0975                                                ;8293BA|8D7509  |000975;
    LDA.B #$00                                                 ;8293BD|A900    |      ;
    STA.W $0976                                                ;8293BF|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;8293C2|2200A581|81A500;
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
    STA.W $097A                                                ;8293E5|8D7A09  |00097A;
    LDA.W #$0000                                               ;8293E8|A90000  |      ;
    STA.W $097E                                                ;8293EB|8D7E09  |00097E;
    SEP #$20                                                   ;8293EE|E220    |      ;
    LDA.B #$03                                                 ;8293F0|A903    |      ;
    STA.W $0974                                                ;8293F2|8D7409  |000974;
    LDA.B #$00                                                 ;8293F5|A900    |      ;
    STA.W $0975                                                ;8293F7|8D7509  |000975;
    LDA.B #$00                                                 ;8293FA|A900    |      ;
    STA.W $0976                                                ;8293FC|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;8293FF|2200A581|81A500;
 
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
    JSL.L fAI_Unknown8480F8                                    ;829436|22F88084|8480F8;
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
    JSR.W fToolusedUnknown_8292A0                              ;829462|20A092  |8292A0;
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
    JSL.L fAI_Unknown8480F8                                    ;8294AC|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;8294F9|22F88084|8480F8; AI spawn coin
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
    JSL.L fAI_Unknown8480F8                                    ;829533|22F88084|8480F8; AI for spawning money bag
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
    JSL.L fAI_Unknown8480F8                                    ;8295AA|22F88084|8480F8;
    BRA .return                                                ;8295AE|8000    |8295B0;
 
 
.return:
    %SetPlayerAction(!PACTION_NONE)
    %UpdateStamina(-2)
    RTS                                                        ;8295BF|60      |      ;
 
 
fToolUsedAction0x03_Hammer:
    REP #$30                                                   ;8295C0|C230    |      ;
    JSR.W fToolusedUnknown_8292A0                              ;8295C2|20A092  |8292A0;
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
    STA.W $097A                                                ;829612|8D7A09  |00097A;
    LDA.W #$0000                                               ;829615|A90000  |      ;
    STA.W $097E                                                ;829618|8D7E09  |00097E;
    SEP #$20                                                   ;82961B|E220    |      ;
    LDA.B #$03                                                 ;82961D|A903    |      ;
    STA.W $0974                                                ;82961F|8D7409  |000974;
    LDA.B #$00                                                 ;829622|A900    |      ;
    STA.W $0975                                                ;829624|8D7509  |000975;
    LDA.B #$00                                                 ;829627|A900    |      ;
    STA.W $0976                                                ;829629|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;82962C|2200A581|81A500;
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
    STA.W $097A                                                ;8296DE|8D7A09  |00097A;
    LDA.W #$0000                                               ;8296E1|A90000  |      ;
    STA.W $097E                                                ;8296E4|8D7E09  |00097E;
    SEP #$20                                                   ;8296E7|E220    |      ;
    LDA.B #$03                                                 ;8296E9|A903    |      ;
    STA.W $0974                                                ;8296EB|8D7409  |000974;
    LDA.B #$00                                                 ;8296EE|A900    |      ;
    STA.W $0975                                                ;8296F0|8D7509  |000975;
    LDA.B #$00                                                 ;8296F3|A900    |      ;
    STA.W $0976                                                ;8296F5|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;8296F8|2200A581|81A500;
    BRA .return                                                ;8296FC|8031    |82972F;
 
 
.label10:
    REP #$20                                                   ;8296FE|C220    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;829700|AD8509  |000985;
    STA.W nUnknownX                                            ;829703|8D8009  |000980;
    LDA.W nTileInFrontOfPlayerY                                ;829706|AD8709  |000987;
    STA.W nUnknownY                                            ;829709|8D8209  |000982;
    REP #$30                                                   ;82970C|C230    |      ;
    LDA.W #$00CB                                               ;82970E|A9CB00  |      ;
    STA.W $097A                                                ;829711|8D7A09  |00097A;
    LDA.W #$0000                                               ;829714|A90000  |      ;
    STA.W $097E                                                ;829717|8D7E09  |00097E;
    SEP #$20                                                   ;82971A|E220    |      ;
    LDA.B #$03                                                 ;82971C|A903    |      ;
    STA.W $0974                                                ;82971E|8D7409  |000974;
    LDA.B #$00                                                 ;829721|A900    |      ;
    STA.W $0975                                                ;829723|8D7509  |000975;
    LDA.B #$00                                                 ;829726|A900    |      ;
    STA.W $0976                                                ;829728|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;82972B|2200A581|81A500;
 
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
    REP #$20                                                   ;82975D|C220    |      ;
    LDA.W #$0015                                               ;82975F|A91500  |      ;
    LDX.W #$0000                                               ;829762|A20000  |      ;
    LDY.W #$0016                                               ;829765|A01600  |      ;
    JSL.L fAI_Unknown84803F                                    ;829768|223F8084|84803F; AI spawn power berry
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
    JSL.L fAI_Unknown8480F8                                    ;8297A9|22F88084|8480F8;
    REP #$30                                                   ;8297AD|C230    |      ;
    %SetFlag(daily2, !DFLAGS2_BROKECHICKENSTATUE)
    JMP.W .return                                              ;8297BA|4C2F97  |82972F;
 
 
fToolUsedAction0x04_Axe:
    REP #$30                                                   ;8297BD|C230    |      ;
    JSR.W fToolusedUnknown_8292A0                              ;8297BF|20A092  |8292A0;
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
    JSL.L fAI_Unknown8480F8                                    ;82989B|22F88084|8480F8;
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
    STA.W $097A                                                ;8298EF|8D7A09  |00097A;
    LDA.W #$0000                                               ;8298F2|A90000  |      ;
    STA.W $097E                                                ;8298F5|8D7E09  |00097E;
    SEP #$20                                                   ;8298F8|E220    |      ;
    LDA.B #$03                                                 ;8298FA|A903    |      ;
    STA.W $0974                                                ;8298FC|8D7409  |000974;
    LDA.B #$00                                                 ;8298FF|A900    |      ;
    STA.W $0975                                                ;829901|8D7509  |000975;
    LDA.B #$00                                                 ;829904|A900    |      ;
    STA.W $0976                                                ;829906|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;829909|2200A581|81A500;
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
    STA.W $097A                                                ;82992B|8D7A09  |00097A;
    LDA.W #$0000                                               ;82992E|A90000  |      ;
    STA.W $097E                                                ;829931|8D7E09  |00097E;
    SEP #$20                                                   ;829934|E220    |      ;
    LDA.B #$03                                                 ;829936|A903    |      ;
    STA.W $0974                                                ;829938|8D7409  |000974;
    LDA.B #$00                                                 ;82993B|A900    |      ;
    STA.W $0975                                                ;82993D|8D7509  |000975;
    LDA.B #$00                                                 ;829940|A900    |      ;
    STA.W $0976                                                ;829942|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;829945|2200A581|81A500;
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
    JSR.W fToolUsedUnknown_8292D6                              ;8299A3|20D692  |8292D6;
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
    JSR.W fToolUsedUnknown_8292D6                              ;829A02|20D692  |8292D6;
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
    JSR.W fToolUsedUnknown_8292D6                              ;829A61|20D692  |8292D6;
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
    JSR.W fToolUsedUnknown_8292D6                              ;829ABE|20D692  |8292D6;
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
    JSR.W fToolUsedUnknown_8292D6                              ;829B6B|20D692  |8292D6;
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
    JSR.W fToolusedUnknown_8292A0                              ;829BCD|20A092  |8292A0;
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
    JSR.W fToolusedUnknown_8292A0                              ;829CEE|20A092  |8292A0;
    SEP #$20                                                   ;829CF1|E220    |      ;
    CMP.B #$02                                                 ;829CF3|C902    |      ;
    BEQ .return                                                ;829CF5|F03B    |829D32;
    LDA.W strcPlayerData.leftWater                             ;829CF7|AD2609  |000926;
    BEQ .return                                                ;829CFA|F036    |829D32;
    DEC A                                                      ;829CFC|3A      |      ;
    STA.W strcPlayerData.leftWater                             ;829CFD|8D2609  |000926;
    JSR.W fToolusedUnknown_8292A0                              ;829D00|20A092  |8292A0;
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
    JSR.W fToolUsedUnknown_8292D6                              ;829D4C|20D692  |8292D6;
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
    STA.W $097A                                                ;829DC6|8D7A09  |00097A;
    LDA.W #$0000                                               ;829DC9|A90000  |      ;
    STA.W $097E                                                ;829DCC|8D7E09  |00097E;
    SEP #$20                                                   ;829DCF|E220    |      ;
    LDA.B #$03                                                 ;829DD1|A903    |      ;
    STA.W $0974                                                ;829DD3|8D7409  |000974;
    LDA.B #$00                                                 ;829DD6|A900    |      ;
    STA.W $0975                                                ;829DD8|8D7509  |000975;
    LDA.B #$00                                                 ;829DDB|A900    |      ;
    STA.W $0976                                                ;829DDD|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;829DE0|2200A581|81A500;
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
    STA.W $097A                                                ;829E03|8D7A09  |00097A;
    LDA.W #$0000                                               ;829E06|A90000  |      ;
    STA.W $097E                                                ;829E09|8D7E09  |00097E;
    SEP #$20                                                   ;829E0C|E220    |      ;
    LDA.B #$03                                                 ;829E0E|A903    |      ;
    STA.W $0974                                                ;829E10|8D7409  |000974;
    LDA.B #$00                                                 ;829E13|A900    |      ;
    STA.W $0975                                                ;829E15|8D7509  |000975;
    LDA.B #$00                                                 ;829E18|A900    |      ;
    STA.W $0976                                                ;829E1A|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;829E1D|2200A581|81A500;
 
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
    JSL.L fAI_Unknown8480F8                                    ;829E54|22F88084|8480F8;
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
    JSR.W fToolUsedUnknown_8292BC                              ;829E98|20BC92  |8292BC;
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
    JSL.L fAI_Unknown8480F8                                    ;829EE4|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;829F2C|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;829F66|22F88084|8480F8;
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
    JSL.L fAI_Unknown8480F8                                    ;829FDD|22F88084|8480F8;
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
    JSR.W fToolusedUnknown_8292A0                              ;82A007|20A092  |8292A0;
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
    STA.W $097A                                                ;82A05A|8D7A09  |00097A;
    LDA.W #$0000                                               ;82A05D|A90000  |      ;
    STA.W $097E                                                ;82A060|8D7E09  |00097E;
    SEP #$20                                                   ;82A063|E220    |      ;
    LDA.B #$03                                                 ;82A065|A903    |      ;
    STA.W $0974                                                ;82A067|8D7409  |000974;
    LDA.B #$00                                                 ;82A06A|A900    |      ;
    STA.W $0975                                                ;82A06C|8D7509  |000975;
    LDA.B #$00                                                 ;82A06F|A900    |      ;
    STA.W $0976                                                ;82A071|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;82A074|2200A581|81A500;
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
    STA.W $097A                                                ;82A113|8D7A09  |00097A;
    LDA.W #$0000                                               ;82A116|A90000  |      ;
    STA.W $097E                                                ;82A119|8D7E09  |00097E;
    SEP #$20                                                   ;82A11C|E220    |      ;
    LDA.B #$03                                                 ;82A11E|A903    |      ;
    STA.W $0974                                                ;82A120|8D7409  |000974;
    LDA.B #$00                                                 ;82A123|A900    |      ;
    STA.W $0975                                                ;82A125|8D7509  |000975;
    LDA.B #$00                                                 ;82A128|A900    |      ;
    STA.W $0976                                                ;82A12A|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;82A12D|2200A581|81A500;
 
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
    REP #$20                                                   ;82A15F|C220    |      ;
    LDA.W #$0015                                               ;82A161|A91500  |      ;
    LDX.W #$0000                                               ;82A164|A20000  |      ;
    LDY.W #$0016                                               ;82A167|A01600  |      ;
    JSL.L fAI_Unknown84803F                                    ;82A16A|223F8084|84803F;
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
    JSL.L fAI_Unknown8480F8                                    ;82A1AB|22F88084|8480F8;
    REP #$30                                                   ;82A1AF|C230    |      ;
    %SetFlag(daily2, $0080)
    JMP.W .loop                                                ;82A1BC|4C31A1  |82A131;
 
 
fToolUsedAction0x14_GoldenAxe:
    REP #$30                                                   ;82A1BF|C230    |      ;
    JSR.W fToolusedUnknown_8292A0                              ;82A1C1|20A092  |8292A0;
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
    JSL.L fAI_Unknown8480F8                                    ;82A27C|22F88084|8480F8;
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
    STA.W $097A                                                ;82A2D0|8D7A09  |00097A;
    LDA.W #$0000                                               ;82A2D3|A90000  |      ;
    STA.W $097E                                                ;82A2D6|8D7E09  |00097E;
    SEP #$20                                                   ;82A2D9|E220    |      ;
    LDA.B #$03                                                 ;82A2DB|A903    |      ;
    STA.W $0974                                                ;82A2DD|8D7409  |000974;
    LDA.B #$00                                                 ;82A2E0|A900    |      ;
    STA.W $0975                                                ;82A2E2|8D7509  |000975;
    LDA.B #$00                                                 ;82A2E5|A900    |      ;
    STA.W $0976                                                ;82A2E7|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;82A2EA|2200A581|81A500;
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
    JSR.W fToolUsedUnknown_8292D6                              ;82A325|20D692  |8292D6;
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
    JSL.L fUnknownCF_SetPointer                                ;82A399|22E1A581|81A5E1;
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
    JSL.L fUnknown_82AC61                                      ;82A3D6|2261AC82|82AC61;
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
    JSL.L fUnknown_82AC61                                      ;82A438|2261AC82|82AC61;
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
    STA.W $097A                                                ;82A486|8D7A09  |00097A;
    LDA.W #$0000                                               ;82A489|A90000  |      ;
    STA.W $097E                                                ;82A48C|8D7E09  |00097E;
    SEP #$20                                                   ;82A48F|E220    |      ;
    LDA.B #$03                                                 ;82A491|A903    |      ;
    STA.W $0974                                                ;82A493|8D7409  |000974;
    LDA.B #$00                                                 ;82A496|A900    |      ;
    STA.W $0975                                                ;82A498|8D7509  |000975;
    LDA.B #$00                                                 ;82A49B|A900    |      ;
    STA.W $0976                                                ;82A49D|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;82A4A0|2200A581|81A500;
 
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
    JSL.L fUnknown_82AC61                                      ;82A4E6|2261AC82|82AC61;
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
    STA.W $097A                                                ;82A534|8D7A09  |00097A;
    LDA.W #$0000                                               ;82A537|A90000  |      ;
    STA.W $097E                                                ;82A53A|8D7E09  |00097E;
    SEP #$20                                                   ;82A53D|E220    |      ;
    LDA.B #$03                                                 ;82A53F|A903    |      ;
    STA.W $0974                                                ;82A541|8D7409  |000974;
    LDA.B #$00                                                 ;82A544|A900    |      ;
    STA.W $0975                                                ;82A546|8D7509  |000975;
    LDA.B #$00                                                 ;82A549|A900    |      ;
    STA.W $0976                                                ;82A54B|8D7609  |000976;
    JSL.L fUnknown_81A500                                      ;82A54E|2200A581|81A500;
 
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
 
fObjectMap_LoadData:
    SEP #$20                                                   ;82A5FB|E220    |      ;
    REP #$10                                                   ;82A5FD|C210    |      ;
    LDA.B #$00                                                 ;82A5FF|A900    |      ;
    XBA                                                        ;82A601|EB      |      ; B <-> A
    LDA.B strcMap.loadAreaId                                   ;82A602|A522    |000022;
    CMP.B #$04                                                 ;82A604|C904    |      ;
    BCS .notFarm                                               ;82A606|B013    |82A61B;
    REP #$20                                                   ;82A608|C220    |      ;
    LDA.W #$A4E6                                               ;82A60A|A9E6A4  |      ;
    STA.B ptrTemp0x72                                          ;82A60D|8572    |000072;
    SEP #$20                                                   ;82A60F|E220    |      ;
    LDA.B #$7E                                                 ;82A611|A97E    |      ;
    STA.B ptrTemp0x72+2                                        ;82A613|8574    |000074; $72 = 0x7EA4E6
    LDX.W #$0000                                               ;82A615|A20000  |      ;
    PHX                                                        ;82A618|DA      |      ;
    BRA .label2                                                ;82A619|801A    |82A635;
 
 
.notFarm:
    SEP #$20                                                   ;82A61B|E220    |      ;
    ASL A                                                      ;82A61D|0A      |      ;
    CLC                                                        ;82A61E|18      |      ;
    ADC.B strcMap.loadAreaId                                   ;82A61F|6522    |000022;
    REP #$20                                                   ;82A621|C220    |      ;
    TAX                                                        ;82A623|AA      |      ;
    PHX                                                        ;82A624|DA      |      ;
    LDA.L pObjectMap,X                                         ;82A625|BF74B182|82B174;
    STA.B ptrTemp0x72                                          ;82A629|8572    |000072;
    SEP #$20                                                   ;82A62B|E220    |      ;
    INX                                                        ;82A62D|E8      |      ;
    INX                                                        ;82A62E|E8      |      ;
    LDA.L pObjectMap,X                                         ;82A62F|BF74B182|82B174;
    STA.B ptrTemp0x72+2                                        ;82A633|8574    |000074;
 
.label2:
    REP #$30                                                   ;82A635|C230    |      ;
    PLX                                                        ;82A637|FA      |      ;
    LDA.L pObjectMap2,X                                        ;82A638|BF94B282|82B294;
    STA.B strcMap.pSelected                                    ;82A63C|850D    |00000D;
    INX                                                        ;82A63E|E8      |      ;
    INX                                                        ;82A63F|E8      |      ;
    SEP #$20                                                   ;82A640|E220    |      ;
    LDA.L pObjectMap2,X                                        ;82A642|BF94B282|82B294;
    STA.B strcMap.pSelected+2                                  ;82A646|850F    |00000F;
    SEP #$20                                                   ;82A648|E220    |      ;
    LDY.W #$0000                                               ;82A64A|A00000  |      ;
 
  - TYX                                                        ;82A64D|BB      |      ; copy data
    LDA.B [ptrTemp0x72],Y                                      ;82A64E|B772    |000072;
    STA.W sCurrentObjectMap,X                                  ;82A650|9DB609  |0009B6;
    INY                                                        ;82A653|C8      |      ;
    CPY.W #$1000                                               ;82A654|C00010  |      ;
    BNE -                                                      ;82A657|D0F4    |82A64D;
    RTL                                                        ;82A659|6B      |      ;
 
 
fObjectMap_LoadDefaultFarm:
    REP #$30                                                   ;82A65A|C230    |      ;
    LDX.W #$0000                                               ;82A65C|A20000  |      ;
    LDA.L pObjectMap,X                                         ;82A65F|BF74B182|82B174;
    STA.B ptrTemp0x72                                          ;82A663|8572    |000072;
    INX                                                        ;82A665|E8      |      ;
    INX                                                        ;82A666|E8      |      ;
    SEP #$20                                                   ;82A667|E220    |      ;
    LDA.L pObjectMap,X                                         ;82A669|BF74B182|82B174;
    STA.B ptrTemp0x72+2                                        ;82A66D|8574    |000074;
    SEP #$20                                                   ;82A66F|E220    |      ;
    LDY.W #$0000                                               ;82A671|A00000  |      ;
 
  - TYX                                                        ;82A674|BB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;82A675|B772    |000072;
    STA.L sFarmTilemap,X                                       ;82A677|9FE6A47E|7EA4E6;
    INY                                                        ;82A67B|C8      |      ;
    CPY.W #$1000                                               ;82A67C|C00010  |      ;
    BNE -                                                      ;82A67F|D0F3    |82A674;
    RTL                                                        ;82A681|6B      |      ;
 
 
fObjectMap_LoadFarm:
    REP #$30                                                   ;82A682|C230    |      ;
    LDA.W #$09B6                                               ;82A684|A9B609  |      ;
    STA.B ptrTemp0x72                                          ;82A687|8572    |000072;
    SEP #$20                                                   ;82A689|E220    |      ;
    LDA.B #$80                                                 ;82A68B|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;82A68D|8574    |000074;
    SEP #$20                                                   ;82A68F|E220    |      ;
    LDY.W #$0000                                               ;82A691|A00000  |      ;
 
.loop:
    TYX                                                        ;82A694|BB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;82A695|B772    |000072;
    STA.L sFarmTilemap,X                                       ;82A697|9FE6A47E|7EA4E6;
    INY                                                        ;82A69B|C8      |      ;
    CPY.W #$1000                                               ;82A69C|C00010  |      ;
    BNE .loop                                                  ;82A69F|D0F3    |82A694;
    RTL                                                        ;82A6A1|6B      |      ;
 
 
fObjectMap_CurrentMapToFarmMap:
    SEP #$20                                                   ;82A6A2|E220    |      ;
    REP #$10                                                   ;82A6A4|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;82A6A6|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;82A6AA|C903    |      ;
    BNE .return                                                ;82A6AC|D064    |82A712;
    LDA.B #$04                                                 ;82A6AE|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82A6B0|8D8101  |000181;
    REP #$20                                                   ;82A6B3|C220    |      ;
    LDY.W #$0000                                               ;82A6B5|A00000  |      ;
 
.loop:
    LDX.W #$0000                                               ;82A6B8|A20000  |      ;
 
.continue:
    PHY                                                        ;82A6BB|5A      |      ;
    PHX                                                        ;82A6BC|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82A6BD|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82A6BF|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82A6C1|203CB1  |82B13C;
    SEP #$20                                                   ;82A6C4|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82A6C6|BFE6A47E|7EA4E6;
    BNE +                                                      ;82A6CA|D003    |82A6CF;
    JMP.W .label7                                              ;82A6CC|4CF2A6  |82A6F2;
 
 
  + CMP.B #$A0                                                 ;82A6CF|C9A0    |      ;
    BCC +                                                      ;82A6D1|9003    |82A6D6;
    JMP.W .label7                                              ;82A6D3|4CF2A6  |82A6F2;
 
 
  + CMP.B #$70                                                 ;82A6D6|C970    |      ;
    BCS .label5                                                ;82A6D8|B006    |82A6E0;
    CMP.B #$1D                                                 ;82A6DA|C91D    |      ;
    BCS .label6                                                ;82A6DC|B00C    |82A6EA;
    BRA .label7                                                ;82A6DE|8012    |82A6F2;
 
 
.label5:
    SEP #$20                                                   ;82A6E0|E220    |      ;
    LDA.B #$7A                                                 ;82A6E2|A97A    |      ;
    STA.L sFarmTilemap,X                                       ;82A6E4|9FE6A47E|7EA4E6;
    BRA .label7                                                ;82A6E8|8008    |82A6F2;
 
 
.label6:
    SEP #$20                                                   ;82A6EA|E220    |      ;
    LDA.B #$07                                                 ;82A6EC|A907    |      ;
    STA.L sFarmTilemap,X                                       ;82A6EE|9FE6A47E|7EA4E6;
 
.label7:
    REP #$30                                                   ;82A6F2|C230    |      ;
    PLX                                                        ;82A6F4|FA      |      ;
    PLY                                                        ;82A6F5|7A      |      ;
    TXA                                                        ;82A6F6|8A      |      ;
    CLC                                                        ;82A6F7|18      |      ;
    ADC.W #$0010                                               ;82A6F8|691000  |      ;
    TAX                                                        ;82A6FB|AA      |      ;
    CPX.W #$0400                                               ;82A6FC|E00004  |      ;
    BEQ +                                                      ;82A6FF|F003    |82A704;
    JMP.W .continue                                            ;82A701|4CBBA6  |82A6BB;
 
 
  + TYA                                                        ;82A704|98      |      ;
    CLC                                                        ;82A705|18      |      ;
    ADC.W #$0010                                               ;82A706|691000  |      ;
    TAY                                                        ;82A709|A8      |      ;
    CPY.W #$0400                                               ;82A70A|C00004  |      ;
 
  + BEQ .return                                                ;82A70D|F003    |82A712;
    JMP.W .loop                                                ;82A70F|4CB8A6  |82A6B8;
 
 
.return:
    RTL                                                        ;82A712|6B      |      ;
 
 
fObjectMap_HuricaneDamage:
    REP #$30                                                   ;82A713|C230    |      ; A: nArg1, X: nArg2, Y: nArg3
    STA.B strcVariables.n16Unk86                               ;82A715|8586    |000086;
    STX.B strcVariables.n16Unk88                               ;82A717|8688    |000088;
    STY.B strcVariables.n16Unk8A                               ;82A719|848A    |00008A;
    SEP #$20                                                   ;82A71B|E220    |      ;
    LDA.B #$04                                                 ;82A71D|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82A71F|8D8101  |000181;
    REP #$20                                                   ;82A722|C220    |      ;
    LDY.W #$0000                                               ;82A724|A00000  |      ;
 
 -- LDX.W #$0000                                               ;82A727|A20000  |      ;
 
  - PHY                                                        ;82A72A|5A      |      ;
    PHX                                                        ;82A72B|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82A72C|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82A72E|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82A730|203CB1  |82B13C;
    SEP #$20                                                   ;82A733|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82A735|BFE6A47E|7EA4E6;
    CMP.B #$A0                                                 ;82A739|C9A0    |      ;
    BCC +                                                      ;82A73B|9003    |82A740;
    JMP.W .label7                                              ;82A73D|4CF0A7  |82A7F0;
 
 
  + CMP.B #$05                                                 ;82A740|C905    |      ;
    BEQ .label1                                                ;82A742|F01A    |82A75E;
    CMP.B #$1D                                                 ;82A744|C91D    |      ;
    BEQ .label5                                                ;82A746|F070    |82A7B8;
    CMP.B #$70                                                 ;82A748|C970    |      ;
    BCS .label2                                                ;82A74A|B031    |82A77D;
    CMP.B #$07                                                 ;82A74C|C907    |      ;
    BNE +                                                      ;82A74E|D003    |82A753;
    JMP.W .label6                                              ;82A750|4CD4A7  |82A7D4;
 
 
  + CMP.B #$08                                                 ;82A753|C908    |      ;
    BEQ .label6                                                ;82A755|F07D    |82A7D4;
    CMP.B #$1E                                                 ;82A757|C91E    |      ;
    BCS .label6                                                ;82A759|B079    |82A7D4;
    JMP.W .label7                                              ;82A75B|4CF0A7  |82A7F0;
 
 
.label1:
    REP #$30                                                   ;82A75E|C230    |      ;
    LDA.B strcVariables.n16Unk86                               ;82A760|A586    |000086;
    BNE +                                                      ;82A762|D003    |82A767;
    JMP.W .label7                                              ;82A764|4CF0A7  |82A7F0;
 
 
  + PHX                                                        ;82A767|DA      |      ;
    JSL.L fCore_GetRandomNumber                                ;82A768|22F98980|8089F9;
    SEP #$20                                                   ;82A76C|E220    |      ;
    REP #$10                                                   ;82A76E|C210    |      ;
    PLX                                                        ;82A770|FA      |      ;
    CMP.B #$00                                                 ;82A771|C900    |      ;
    BNE .label7                                                ;82A773|D07B    |82A7F0;
    LDA.B #$06                                                 ;82A775|A906    |      ;
    STA.L sFarmTilemap,X                                       ;82A777|9FE6A47E|7EA4E6;
    BRA .label7                                                ;82A77B|8073    |82A7F0;
 
 
.label2:
    REP #$30                                                   ;82A77D|C230    |      ;
    CMP.W #$0079                                               ;82A77F|C97900  |      ;
    BEQ .label4                                                ;82A782|F029    |82A7AD;
 
.label3:
    REP #$30                                                   ;82A784|C230    |      ;
    LDA.B strcVariables.n16Unk88                               ;82A786|A588    |000088;
    BEQ .label7                                                ;82A788|F066    |82A7F0;
    PHX                                                        ;82A78A|DA      |      ;
    JSL.L fCore_GetRandomNumber                                ;82A78B|22F98980|8089F9;
    SEP #$20                                                   ;82A78F|E220    |      ;
    REP #$10                                                   ;82A791|C210    |      ;
    PLX                                                        ;82A793|FA      |      ;
    CMP.B #$00                                                 ;82A794|C900    |      ;
    BNE .label7                                                ;82A796|D058    |82A7F0;
    LDA.B #$02                                                 ;82A798|A902    |      ;
    STA.L sFarmTilemap,X                                       ;82A79A|9FE6A47E|7EA4E6;
    REP #$20                                                   ;82A79E|C220    |      ;
    LDA.L nPlantedGrassCount                                   ;82A7A0|AF291F7F|7F1F29;
    BEQ .label7                                                ;82A7A4|F04A    |82A7F0;
    DEC A                                                      ;82A7A6|3A      |      ;
    STA.L nPlantedGrassCount                                   ;82A7A7|8F291F7F|7F1F29;
    BRA .label7                                                ;82A7AB|8043    |82A7F0;
 
 
.label4:
    REP #$30                                                   ;82A7AD|C230    |      ;
    LDA.W strcPlayerData.leftGrassToCut                        ;82A7AF|AD2E09  |00092E;
    DEC A                                                      ;82A7B2|3A      |      ;
    STA.W strcPlayerData.leftGrassToCut                        ;82A7B3|8D2E09  |00092E;
    BRA .label3                                                ;82A7B6|80CC    |82A784;
 
 
.label5:
    REP #$30                                                   ;82A7B8|C230    |      ;
    LDA.B strcVariables.n16Unk88                               ;82A7BA|A588    |000088;
    BEQ .label7                                                ;82A7BC|F032    |82A7F0;
    PHX                                                        ;82A7BE|DA      |      ;
    JSL.L fCore_GetRandomNumber                                ;82A7BF|22F98980|8089F9;
    SEP #$20                                                   ;82A7C3|E220    |      ;
    REP #$10                                                   ;82A7C5|C210    |      ;
    PLX                                                        ;82A7C7|FA      |      ;
    CMP.B #$00                                                 ;82A7C8|C900    |      ;
    BNE .label7                                                ;82A7CA|D024    |82A7F0;
    LDA.B #$02                                                 ;82A7CC|A902    |      ;
    STA.L sFarmTilemap,X                                       ;82A7CE|9FE6A47E|7EA4E6;
    BRA .label7                                                ;82A7D2|801C    |82A7F0;
 
 
.label6:
    REP #$30                                                   ;82A7D4|C230    |      ;
    LDA.B strcVariables.n16Unk8A                               ;82A7D6|A58A    |00008A;
    BEQ .label7                                                ;82A7D8|F016    |82A7F0;
    PHX                                                        ;82A7DA|DA      |      ;
    JSL.L fCore_GetRandomNumber                                ;82A7DB|22F98980|8089F9;
    SEP #$20                                                   ;82A7DF|E220    |      ;
    REP #$10                                                   ;82A7E1|C210    |      ;
    PLX                                                        ;82A7E3|FA      |      ;
    CMP.B #$00                                                 ;82A7E4|C900    |      ;
    BNE .label7                                                ;82A7E6|D008    |82A7F0;
    LDA.B #$02                                                 ;82A7E8|A902    |      ;
    STA.L sFarmTilemap,X                                       ;82A7EA|9FE6A47E|7EA4E6;
    BRA .label7                                                ;82A7EE|8000    |82A7F0;
 
 
.label7:
    REP #$30                                                   ;82A7F0|C230    |      ;
    PLX                                                        ;82A7F2|FA      |      ;
    PLY                                                        ;82A7F3|7A      |      ;
    TXA                                                        ;82A7F4|8A      |      ;
    CLC                                                        ;82A7F5|18      |      ;
    ADC.W #$0010                                               ;82A7F6|691000  |      ;
    TAX                                                        ;82A7F9|AA      |      ;
    CPX.W #$0400                                               ;82A7FA|E00004  |      ;
    BEQ +                                                      ;82A7FD|F003    |82A802;
    JMP.W $A72A                                                ;82A7FF|4C2AA7  |82A72A;
 
 
  + TYA                                                        ;82A802|98      |      ;
    CLC                                                        ;82A803|18      |      ;
    ADC.W #$0010                                               ;82A804|691000  |      ;
    TAY                                                        ;82A807|A8      |      ;
    CPY.W #$0400                                               ;82A808|C00004  |      ;
    BEQ .return                                                ;82A80B|F003    |82A810;
    JMP.W $A727                                                ;82A80D|4C27A7  |82A727;
 
 
.return:
    RTL                                                        ;82A810|6B      |      ;
 
 
fObjectMap_Unknown82A811:
    SEP #$20                                                   ;82A811|E220    |      ;
    REP #$10                                                   ;82A813|C210    |      ;
    LDA.B #$04                                                 ;82A815|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82A817|8D8101  |000181;
    REP #$20                                                   ;82A81A|C220    |      ;
    LDY.W #$0000                                               ;82A81C|A00000  |      ;
 
.loop:
    LDX.W #$0000                                               ;82A81F|A20000  |      ;
 
.continue:
    PHY                                                        ;82A822|5A      |      ;
    PHX                                                        ;82A823|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82A824|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82A826|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82A828|203CB1  |82B13C;
    SEP #$20                                                   ;82A82B|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82A82D|BFE6A47E|7EA4E6;
    BNE +                                                      ;82A831|D003    |82A836;
    JMP.W .label9                                              ;82A833|4C69A9  |82A969;
 
 
  + CMP.B #$03                                                 ;82A836|C903    |      ;
    BCS +                                                      ;82A838|B003    |82A83D;
    JMP.W .label7                                              ;82A83A|4C1BA9  |82A91B;
 
 
  + CMP.B #$A0                                                 ;82A83D|C9A0    |      ;
    BCC +                                                      ;82A83F|9003    |82A844;
    JMP.W .label9                                              ;82A841|4C69A9  |82A969;
 
 
  + CMP.B #$06                                                 ;82A844|C906    |      ;
    BNE +                                                      ;82A846|D003    |82A84B;
    JMP.W .label8                                              ;82A848|4C49A9  |82A949;
 
 
  + CMP.B #$07                                                 ;82A84B|C907    |      ;
    BEQ .label1                                                ;82A84D|F055    |82A8A4;
    CMP.B #$08                                                 ;82A84F|C908    |      ;
    BNE +                                                      ;82A851|D003    |82A856;
    JMP.W .label2                                              ;82A853|4CB4A8  |82A8B4;
 
 
  + CMP.B #$1E                                                 ;82A856|C91E    |      ;
    BEQ .label1                                                ;82A858|F04A    |82A8A4;
    CMP.B #$1F                                                 ;82A85A|C91F    |      ;
    BNE +                                                      ;82A85C|D003    |82A861;
    JMP.W .label2                                              ;82A85E|4CB4A8  |82A8B4;
 
 
  + CMP.B #$1D                                                 ;82A861|C91D    |      ;
    BNE +                                                      ;82A863|D003    |82A868;
    JMP.W .label9                                              ;82A865|4C69A9  |82A969;
 
 
  + CMP.B #$20                                                 ;82A868|C920    |      ;
    BCS +                                                      ;82A86A|B003    |82A86F;
    JMP.W .label9                                              ;82A86C|4C69A9  |82A969;
 
 
  + CMP.B #$39                                                 ;82A86F|C939    |      ;
    BNE +                                                      ;82A871|D003    |82A876;
    JMP.W .label2                                              ;82A873|4CB4A8  |82A8B4;
 
 
  + CMP.B #$53                                                 ;82A876|C953    |      ;
    BNE +                                                      ;82A878|D003    |82A87D;
    JMP.W .label2                                              ;82A87A|4CB4A8  |82A8B4;
 
 
  + CMP.B #$61                                                 ;82A87D|C961    |      ;
    BNE +                                                      ;82A87F|D003    |82A884;
    JMP.W .label2                                              ;82A881|4CB4A8  |82A8B4;
 
 
  + CMP.B #$6F                                                 ;82A884|C96F    |      ;
    BNE +                                                      ;82A886|D003    |82A88B;
    JMP.W .label2                                              ;82A888|4CB4A8  |82A8B4;
 
 
  + CMP.B #$79                                                 ;82A88B|C979    |      ;
    BNE +                                                      ;82A88D|D003    |82A892;
    JMP.W .label9                                              ;82A88F|4C69A9  |82A969;
 
 
  + CMP.B #$7C                                                 ;82A892|C97C    |      ;
    BNE +                                                      ;82A894|D003    |82A899;
    JMP.W .label3                                              ;82A896|4CCFA8  |82A8CF;
 
 
  + CMP.B #$70                                                 ;82A899|C970    |      ;
    BCS .label6                                                ;82A89B|B069    |82A906;
    AND.B #$01                                                 ;82A89D|2901    |      ;
    BEQ .label1                                                ;82A89F|F003    |82A8A4;
    JMP.W .label4                                              ;82A8A1|4CDAA8  |82A8DA;
 
 
.label1:
    REP #$20                                                   ;82A8A4|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82A8A6|AD9601  |000196;
    AND.W #$0002                                               ;82A8A9|290200  |      ;
    BEQ +                                                      ;82A8AC|F003    |82A8B1;
    JMP.W .label6                                              ;82A8AE|4C06A9  |82A906;
 
 
  + JMP.W .label9                                              ;82A8B1|4C69A9  |82A969;
 
 
.label2:
    REP #$20                                                   ;82A8B4|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82A8B6|AD9601  |000196;
    AND.W #$0002                                               ;82A8B9|290200  |      ;
    BEQ +                                                      ;82A8BC|F003    |82A8C1;
    JMP.W .label9                                              ;82A8BE|4C69A9  |82A969;
 
 
  + SEP #$20                                                   ;82A8C1|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82A8C3|BFE6A47E|7EA4E6;
    DEC A                                                      ;82A8C7|3A      |      ;
    STA.L sFarmTilemap,X                                       ;82A8C8|9FE6A47E|7EA4E6;
    JMP.W .label9                                              ;82A8CC|4C69A9  |82A969;
 
 
.label3:
    SEP #$20                                                   ;82A8CF|E220    |      ;
    LDA.B #$73                                                 ;82A8D1|A973    |      ;
    STA.L sFarmTilemap,X                                       ;82A8D3|9FE6A47E|7EA4E6;
    JMP.W .label9                                              ;82A8D7|4C69A9  |82A969;
 
 
.label4:
    SEP #$20                                                   ;82A8DA|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82A8DC|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;82A8E0|C902    |      ;
    BNE .label5                                                ;82A8E2|D00C    |82A8F0;
    LDA.L sFarmTilemap,X                                       ;82A8E4|BFE6A47E|7EA4E6;
    DEC A                                                      ;82A8E8|3A      |      ;
    STA.L sFarmTilemap,X                                       ;82A8E9|9FE6A47E|7EA4E6;
    JMP.W .label9                                              ;82A8ED|4C69A9  |82A969;
 
 
.label5:
    SEP #$20                                                   ;82A8F0|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82A8F2|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;82A8F6|C903    |      ;
    BEQ .label9                                                ;82A8F8|F06F    |82A969;
    LDA.L sFarmTilemap,X                                       ;82A8FA|BFE6A47E|7EA4E6;
    INC A                                                      ;82A8FE|1A      |      ;
    STA.L sFarmTilemap,X                                       ;82A8FF|9FE6A47E|7EA4E6;
    JMP.W .label1                                              ;82A903|4CA4A8  |82A8A4;
 
 
.label6:
    SEP #$20                                                   ;82A906|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82A908|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;82A90C|C903    |      ;
    BEQ .label9                                                ;82A90E|F059    |82A969;
    LDA.L sFarmTilemap,X                                       ;82A910|BFE6A47E|7EA4E6;
    INC A                                                      ;82A914|1A      |      ;
    STA.L sFarmTilemap,X                                       ;82A915|9FE6A47E|7EA4E6;
    BRA .label9                                                ;82A919|804E    |82A969;
 
 
.label7:
    SEP #$20                                                   ;82A91B|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82A91D|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;82A921|C902    |      ;
    BEQ .label9                                                ;82A923|F044    |82A969;
    CMP.B #$03                                                 ;82A925|C903    |      ;
    BEQ .label9                                                ;82A927|F040    |82A969;
    LDA.L nCurrentDay                                          ;82A929|AF1B1F7F|7F1F1B;
    AND.B #$03                                                 ;82A92D|2903    |      ;
    BNE .label9                                                ;82A92F|D038    |82A969;
    REP #$10                                                   ;82A931|C210    |      ;
    PHX                                                        ;82A933|DA      |      ;
    JSL.L fGetRandomNumber                                     ;82A934|22388183|838138;
    SEP #$20                                                   ;82A938|E220    |      ;
    REP #$10                                                   ;82A93A|C210    |      ;
    PLX                                                        ;82A93C|FA      |      ;
    CMP.B #$00                                                 ;82A93D|C900    |      ;
    BNE .label9                                                ;82A93F|D028    |82A969;
    LDA.B #$03                                                 ;82A941|A903    |      ;
    STA.L sFarmTilemap,X                                       ;82A943|9FE6A47E|7EA4E6;
    BRA .label9                                                ;82A947|8020    |82A969;
 
 
.label8:
    SEP #$20                                                   ;82A949|E220    |      ;
    LDA.B #$08                                                 ;82A94B|A908    |      ;
    JSL.L fCore_GetRandomNumber                                ;82A94D|22F98980|8089F9;
    BNE .label9                                                ;82A951|D016    |82A969;
    REP #$20                                                   ;82A953|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82A955|AD9601  |000196;
    ORA.W #$0400                                               ;82A958|090004  |      ;
    STA.W strcDialogDisplay.mapFlags                           ;82A95B|8D9601  |000196;
    %SetFlag(event6, $0200)
 
.label9:
    REP #$30                                                   ;82A969|C230    |      ;
    PLX                                                        ;82A96B|FA      |      ;
    PLY                                                        ;82A96C|7A      |      ;
    TXA                                                        ;82A96D|8A      |      ;
    CLC                                                        ;82A96E|18      |      ;
    ADC.W #$0010                                               ;82A96F|691000  |      ;
    TAX                                                        ;82A972|AA      |      ;
    CPX.W #$0400                                               ;82A973|E00004  |      ;
    BEQ +                                                      ;82A976|F003    |82A97B;
    JMP.W .continue                                            ;82A978|4C22A8  |82A822;
 
 
  + TYA                                                        ;82A97B|98      |      ;
    CLC                                                        ;82A97C|18      |      ;
    ADC.W #$0010                                               ;82A97D|691000  |      ;
    TAY                                                        ;82A980|A8      |      ;
    CPY.W #$0400                                               ;82A981|C00004  |      ;
    BEQ +                                                      ;82A984|F003    |82A989;
    JMP.W .loop                                                ;82A986|4C1FA8  |82A81F;
 
 
  + SEP #$20                                                   ;82A989|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82A98B|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;82A98F|C903    |      ;
    BNE .justReturn                                            ;82A991|D00C    |82A99F;
    LDA.L nCurrentDay                                          ;82A993|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;82A997|C901    |      ;
    BNE .justReturn                                            ;82A999|D004    |82A99F;
    JSL.L fObjectMap_CurrentMapToFarmMap                       ;82A99B|22A2A682|82A6A2;
 
.justReturn:
    RTL                                                        ;82A99F|6B      |      ;
 
 
fObjectMap_EatingGrass:
    SEP #$20                                                   ;82A9A0|E220    |      ;
    REP #$10                                                   ;82A9A2|C210    |      ;
    LDA.B #$04                                                 ;82A9A4|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82A9A6|8D8101  |000181;
    REP #$20                                                   ;82A9A9|C220    |      ;
    STZ.W strcPlayerData.leftGrassToCut                        ;82A9AB|9C2E09  |00092E;
    LDY.W #$0000                                               ;82A9AE|A00000  |      ;
 
 -- LDX.W #$0000                                               ;82A9B1|A20000  |      ;
 
  - PHY                                                        ;82A9B4|5A      |      ;
    PHX                                                        ;82A9B5|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82A9B6|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82A9B8|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82A9BA|203CB1  |82B13C;
    SEP #$20                                                   ;82A9BD|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82A9BF|BFE6A47E|7EA4E6;
    CMP.B #$76                                                 ;82A9C3|C976    |      ;
    BEQ +                                                      ;82A9C5|F00E    |82A9D5;
    CMP.B #$77                                                 ;82A9C7|C977    |      ;
    BEQ +                                                      ;82A9C9|F00A    |82A9D5;
    CMP.B #$78                                                 ;82A9CB|C978    |      ;
    BEQ +                                                      ;82A9CD|F006    |82A9D5;
    CMP.B #$79                                                 ;82A9CF|C979    |      ;
    BEQ +                                                      ;82A9D1|F002    |82A9D5;
    BRA .label1                                                ;82A9D3|8011    |82A9E6;
 
 
  + SEP #$20                                                   ;82A9D5|E220    |      ;
    LDA.B #$7A                                                 ;82A9D7|A97A    |      ;
    STA.L sFarmTilemap,X                                       ;82A9D9|9FE6A47E|7EA4E6;
    REP #$20                                                   ;82A9DD|C220    |      ;
    LDA.W strcPlayerData.leftGrassToCut                        ;82A9DF|AD2E09  |00092E;
    INC A                                                      ;82A9E2|1A      |      ;
    STA.W strcPlayerData.leftGrassToCut                        ;82A9E3|8D2E09  |00092E;
 
.label1:
    REP #$30                                                   ;82A9E6|C230    |      ;
    PLX                                                        ;82A9E8|FA      |      ;
    PLY                                                        ;82A9E9|7A      |      ;
    LDA.W strcPlayerData.leftGrassToCut                        ;82A9EA|AD2E09  |00092E;
    BNE .justReturn                                            ;82A9ED|D01C    |82AA0B;
    TXA                                                        ;82A9EF|8A      |      ;
    CLC                                                        ;82A9F0|18      |      ;
    ADC.W #$0010                                               ;82A9F1|691000  |      ;
    TAX                                                        ;82A9F4|AA      |      ;
    CPX.W #$0400                                               ;82A9F5|E00004  |      ;
    BEQ +                                                      ;82A9F8|F003    |82A9FD;
    JMP.W $A9B4                                                ;82A9FA|4CB4A9  |82A9B4;
 
 
  + TYA                                                        ;82A9FD|98      |      ;
    CLC                                                        ;82A9FE|18      |      ;
    ADC.W #$0010                                               ;82A9FF|691000  |      ;
    TAY                                                        ;82AA02|A8      |      ;
    CPY.W #$0400                                               ;82AA03|C00004  |      ;
    BEQ .justReturn                                            ;82AA06|F003    |82AA0B;
    JMP.W $A9B1                                                ;82AA08|4CB1A9  |82A9B1;
 
 
.justReturn:
    RTL                                                        ;82AA0B|6B      |      ;
 
 
fObjectMap_CalculateRanchDev:
    SEP #$20                                                   ;82AA0C|E220    |      ;
    REP #$10                                                   ;82AA0E|C210    |      ;
    LDA.B #$04                                                 ;82AA10|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82AA12|8D8101  |000181;
    REP #$20                                                   ;82AA15|C220    |      ;
    LDA.W #$0000                                               ;82AA17|A90000  |      ;
    STA.L nRanchDevelopmentRate                                ;82AA1A|8F561F7F|7F1F56;
    LDY.W #$0000                                               ;82AA1E|A00000  |      ;
 
 -- LDX.W #$0000                                               ;82AA21|A20000  |      ;
 
  - PHY                                                        ;82AA24|5A      |      ;
    PHX                                                        ;82AA25|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82AA26|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82AA28|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82AA2A|203CB1  |82B13C;
    SEP #$20                                                   ;82AA2D|E220    |      ;
    LDA.L sFarmTilemap,X                                       ;82AA2F|BFE6A47E|7EA4E6;
    CMP.B #$A0                                                 ;82AA33|C9A0    |      ;
    BCS +                                                      ;82AA35|B019    |82AA50;
    CMP.B #$05                                                 ;82AA37|C905    |      ;
    BEQ .increaseRanchDevRate                                  ;82AA39|F00A    |82AA45;
    CMP.B #$06                                                 ;82AA3B|C906    |      ;
    BEQ .increaseRanchDevRate                                  ;82AA3D|F006    |82AA45;
    CMP.B #$1D                                                 ;82AA3F|C91D    |      ;
    BCS .increaseRanchDevRate                                  ;82AA41|B002    |82AA45;
    BRA +                                                      ;82AA43|800B    |82AA50;
 
 
.increaseRanchDevRate:
    REP #$20                                                   ;82AA45|C220    |      ;
    LDA.L nRanchDevelopmentRate                                ;82AA47|AF561F7F|7F1F56;
    INC A                                                      ;82AA4B|1A      |      ;
    STA.L nRanchDevelopmentRate                                ;82AA4C|8F561F7F|7F1F56;
 
  + REP #$30                                                   ;82AA50|C230    |      ;
    PLX                                                        ;82AA52|FA      |      ;
    PLY                                                        ;82AA53|7A      |      ;
    TXA                                                        ;82AA54|8A      |      ;
    CLC                                                        ;82AA55|18      |      ;
    ADC.W #$0010                                               ;82AA56|691000  |      ;
    TAX                                                        ;82AA59|AA      |      ;
    CPX.W #$0400                                               ;82AA5A|E00004  |      ;
    BEQ +                                                      ;82AA5D|F003    |82AA62;
    JMP.W $AA24                                                ;82AA5F|4C24AA  |82AA24;
 
 
  + TYA                                                        ;82AA62|98      |      ;
    CLC                                                        ;82AA63|18      |      ;
    ADC.W #$0010                                               ;82AA64|691000  |      ;
    TAY                                                        ;82AA67|A8      |      ;
    CPY.W #$0400                                               ;82AA68|C00004  |      ;
    BEQ .justReturn                                            ;82AA6B|F003    |82AA70;
    JMP.W $AA21                                                ;82AA6D|4C21AA  |82AA21;
 
 
.justReturn:
    RTL                                                        ;82AA70|6B      |      ;
 
 
fSound_GetToolSound:
    SEP #$20                                                   ;82AA71|E220    |      ; X: nTileX, Y: nTileY, return A: nToolSoundId (0/1/2)
    REP #$10                                                   ;82AA73|C210    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;82AA75|AD2109  |000921;
    CMP.B #$01                                                 ;82AA78|C901    |      ;
    BEQ .sickle                                                ;82AA7A|F069    |82AAE5;
    CMP.B #$11                                                 ;82AA7C|C911    |      ;
    BEQ .sickle                                                ;82AA7E|F065    |82AAE5;
    CMP.B #$02                                                 ;82AA80|C902    |      ;
    BNE +                                                      ;82AA82|D003    |82AA87;
    JMP.W .plow                                                ;82AA84|4C0AAB  |82AB0A;
 
 
  + CMP.B #$12                                                 ;82AA87|C912    |      ;
    BEQ .plow                                                  ;82AA89|F07F    |82AB0A;
    CMP.B #$03                                                 ;82AA8B|C903    |      ;
    BNE +                                                      ;82AA8D|D003    |82AA92;
    JMP.W .hammer                                              ;82AA8F|4C2FAB  |82AB2F;
 
 
  + CMP.B #$13                                                 ;82AA92|C913    |      ;
    BNE +                                                      ;82AA94|D003    |82AA99;
    JMP.W .hammer                                              ;82AA96|4C2FAB  |82AB2F;
 
 
  + CMP.B #$04                                                 ;82AA99|C904    |      ;
    BNE +                                                      ;82AA9B|D003    |82AAA0;
    JMP.W .axe                                                 ;82AA9D|4C54AB  |82AB54;
 
 
  + CMP.B #$14                                                 ;82AAA0|C914    |      ;
    BNE +                                                      ;82AAA2|D003    |82AAA7;
    JMP.W .axe                                                 ;82AAA4|4C54AB  |82AB54;
 
 
  + CMP.B #$10                                                 ;82AAA7|C910    |      ;
    BNE +                                                      ;82AAA9|D003    |82AAAE;
    JMP.W .wateringCan                                         ;82AAAB|4C79AB  |82AB79;
 
 
  + CMP.B #$15                                                 ;82AAAE|C915    |      ;
    BNE +                                                      ;82AAB0|D003    |82AAB5;
    JMP.W .sprinkler                                           ;82AAB2|4CEBAB  |82ABEB;
 
 
  + CMP.B #$0C                                                 ;82AAB5|C90C    |      ;
    BNE +                                                      ;82AAB7|D003    |82AABC;
    JMP.W .anySeedBag                                          ;82AAB9|4C10AC  |82AC10;
 
 
  + CMP.B #$05                                                 ;82AABC|C905    |      ;
    BNE +                                                      ;82AABE|D003    |82AAC3;
    JMP.W .anySeedBag                                          ;82AAC0|4C10AC  |82AC10;
 
 
  + CMP.B #$06                                                 ;82AAC3|C906    |      ;
    BNE +                                                      ;82AAC5|D003    |82AACA;
    JMP.W .anySeedBag                                          ;82AAC7|4C10AC  |82AC10;
 
 
  + CMP.B #$07                                                 ;82AACA|C907    |      ;
    BNE +                                                      ;82AACC|D003    |82AAD1;
    JMP.W .anySeedBag                                          ;82AACE|4C10AC  |82AC10;
 
 
  + CMP.B #$08                                                 ;82AAD1|C908    |      ;
    BNE +                                                      ;82AAD3|D003    |82AAD8;
    JMP.W .anySeedBag                                          ;82AAD5|4C10AC  |82AC10;
 
 
  + CMP.B #$0D                                                 ;82AAD8|C90D    |      ;
    BNE +                                                      ;82AADA|D003    |82AADF;
    JMP.W .paint                                               ;82AADC|4C35AC  |82AC35;
 
 
  + REP #$20                                                   ;82AADF|C220    |      ;
    LDA.W #$0001                                               ;82AAE1|A90100  |      ;
    RTL                                                        ;82AAE4|6B      |      ;
 
 
.sickle:
    REP #$30                                                   ;82AAE5|C230    |      ;
    LDA.W #$0001                                               ;82AAE7|A90100  |      ;
    JSL.L fUnknown_82AC61                                      ;82AAEA|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82AAEE|E0A000  |      ;
    BCS +                                                      ;82AAF1|B011    |82AB04;
    CPX.W #$0000                                               ;82AAF3|E00000  |      ;
    BEQ +                                                      ;82AAF6|F00C    |82AB04;
    SEP #$20                                                   ;82AAF8|E220    |      ;
    AND.B #$01                                                 ;82AAFA|2901    |      ;
    BEQ +                                                      ;82AAFC|F006    |82AB04;
    REP #$20                                                   ;82AAFE|C220    |      ;
    LDA.W #$0001                                               ;82AB00|A90100  |      ;
    RTL                                                        ;82AB03|6B      |      ;
 
 
  + REP #$20                                                   ;82AB04|C220    |      ;
    LDA.W #$0000                                               ;82AB06|A90000  |      ;
    RTL                                                        ;82AB09|6B      |      ;
 
 
.plow:
    REP #$30                                                   ;82AB0A|C230    |      ;
    LDA.W #$0001                                               ;82AB0C|A90100  |      ;
    JSL.L fUnknown_82AC61                                      ;82AB0F|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82AB13|E0A000  |      ;
    BCS +                                                      ;82AB16|B011    |82AB29;
    CPX.W #$0000                                               ;82AB18|E00000  |      ;
    BEQ +                                                      ;82AB1B|F00C    |82AB29;
    SEP #$20                                                   ;82AB1D|E220    |      ;
    AND.B #$02                                                 ;82AB1F|2902    |      ;
    BEQ +                                                      ;82AB21|F006    |82AB29;
    REP #$20                                                   ;82AB23|C220    |      ;
    LDA.W #$0001                                               ;82AB25|A90100  |      ;
    RTL                                                        ;82AB28|6B      |      ;
 
 
  + REP #$20                                                   ;82AB29|C220    |      ;
    LDA.W #$0000                                               ;82AB2B|A90000  |      ;
    RTL                                                        ;82AB2E|6B      |      ;
 
 
.hammer:
    REP #$30                                                   ;82AB2F|C230    |      ;
    LDA.W #$0001                                               ;82AB31|A90100  |      ;
    JSL.L fUnknown_82AC61                                      ;82AB34|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82AB38|E0A000  |      ;
    BCS +                                                      ;82AB3B|B011    |82AB4E;
    CPX.W #$0000                                               ;82AB3D|E00000  |      ;
    BEQ +                                                      ;82AB40|F00C    |82AB4E;
    SEP #$20                                                   ;82AB42|E220    |      ;
    AND.B #$04                                                 ;82AB44|2904    |      ;
    BEQ +                                                      ;82AB46|F006    |82AB4E;
    REP #$20                                                   ;82AB48|C220    |      ;
    LDA.W #$0001                                               ;82AB4A|A90100  |      ;
    RTL                                                        ;82AB4D|6B      |      ;
 
 
  + REP #$20                                                   ;82AB4E|C220    |      ;
    LDA.W #$0000                                               ;82AB50|A90000  |      ;
    RTL                                                        ;82AB53|6B      |      ;
 
 
.axe:
    REP #$30                                                   ;82AB54|C230    |      ;
    LDA.W #$0001                                               ;82AB56|A90100  |      ;
    JSL.L fUnknown_82AC61                                      ;82AB59|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82AB5D|E0A000  |      ;
    BCS +                                                      ;82AB60|B011    |82AB73;
    CPX.W #$0000                                               ;82AB62|E00000  |      ;
    BEQ +                                                      ;82AB65|F00C    |82AB73;
    SEP #$20                                                   ;82AB67|E220    |      ;
    AND.B #$08                                                 ;82AB69|2908    |      ;
    BEQ +                                                      ;82AB6B|F006    |82AB73;
    REP #$20                                                   ;82AB6D|C220    |      ;
    LDA.W #$0001                                               ;82AB6F|A90100  |      ;
    RTL                                                        ;82AB72|6B      |      ;
 
 
  + REP #$20                                                   ;82AB73|C220    |      ;
    LDA.W #$0000                                               ;82AB75|A90000  |      ;
    RTL                                                        ;82AB78|6B      |      ;
 
 
.wateringCan:
    SEP #$20                                                   ;82AB79|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82AB7B|A522    |000022;
    CMP.B #$04                                                 ;82AB7D|C904    |      ;
    BCC +                                                      ;82AB7F|9021    |82ABA2;
    CMP.B #$10                                                 ;82AB81|C910    |      ;
    BCC .wcreturn2                                             ;82AB83|9060    |82ABE5;
    CMP.B #$3D                                                 ;82AB85|C93D    |      ;
    BCS +                                                      ;82AB87|B019    |82ABA2;
    CMP.B #$14                                                 ;82AB89|C914    |      ;
    BCS .wcreturn2                                             ;82AB8B|B058    |82ABE5;
    REP #$30                                                   ;82AB8D|C230    |      ;
    LDA.W #$0001                                               ;82AB8F|A90100  |      ;
    JSL.L fUnknown_82AC61                                      ;82AB92|2261AC82|82AC61;
    CPX.W #$00F0                                               ;82AB96|E0F000  |      ;
    BEQ .wcreturn1                                             ;82AB99|F044    |82ABDF;
    CPX.W #$00F4                                               ;82AB9B|E0F400  |      ;
    BEQ .wcreturn1                                             ;82AB9E|F03F    |82ABDF;
    BRA .wcreturn2                                             ;82ABA0|8043    |82ABE5;
 
 
  + REP #$30                                                   ;82ABA2|C230    |      ;
    LDA.W #$0001                                               ;82ABA4|A90100  |      ;
    JSL.L fUnknown_82AC61                                      ;82ABA7|2261AC82|82AC61;
    CPX.W #$00F0                                               ;82ABAB|E0F000  |      ;
    BEQ .wcreturn1                                             ;82ABAE|F02F    |82ABDF;
    CPX.W #$00F9                                               ;82ABB0|E0F900  |      ;
    BEQ .wcreturn1                                             ;82ABB3|F02A    |82ABDF;
    CPX.W #$00FA                                               ;82ABB5|E0FA00  |      ;
    BEQ .wcreturn1                                             ;82ABB8|F025    |82ABDF;
    CPX.W #$00FB                                               ;82ABBA|E0FB00  |      ;
    BEQ .wcreturn1                                             ;82ABBD|F020    |82ABDF;
    CPX.W #$00FC                                               ;82ABBF|E0FC00  |      ;
    BEQ .wcreturn1                                             ;82ABC2|F01B    |82ABDF;
    CPX.W #$00FD                                               ;82ABC4|E0FD00  |      ;
    BEQ .wcreturn1                                             ;82ABC7|F016    |82ABDF;
    CPX.W #$00A0                                               ;82ABC9|E0A000  |      ;
    BCS .wcreturn2                                             ;82ABCC|B017    |82ABE5;
    CPX.W #$0000                                               ;82ABCE|E00000  |      ;
    BEQ .wcreturn2                                             ;82ABD1|F012    |82ABE5;
    SEP #$20                                                   ;82ABD3|E220    |      ;
    AND.B #$10                                                 ;82ABD5|2910    |      ;
    BEQ .wcreturn2                                             ;82ABD7|F00C    |82ABE5;
    REP #$20                                                   ;82ABD9|C220    |      ;
    LDA.W #$0001                                               ;82ABDB|A90100  |      ;
    RTL                                                        ;82ABDE|6B      |      ;
 
 
.wcreturn1:
    REP #$20                                                   ;82ABDF|C220    |      ;
    LDA.W #$0002                                               ;82ABE1|A90200  |      ;
    RTL                                                        ;82ABE4|6B      |      ;
 
 
.wcreturn2:
    REP #$20                                                   ;82ABE5|C220    |      ;
    LDA.W #$0000                                               ;82ABE7|A90000  |      ;
    RTL                                                        ;82ABEA|6B      |      ;
 
 
.sprinkler:
    REP #$30                                                   ;82ABEB|C230    |      ;
    LDA.W #$0001                                               ;82ABED|A90100  |      ;
    JSL.L fUnknown_82AC61                                      ;82ABF0|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82ABF4|E0A000  |      ;
    BCS +                                                      ;82ABF7|B011    |82AC0A;
    CPX.W #$0000                                               ;82ABF9|E00000  |      ;
    BEQ +                                                      ;82ABFC|F00C    |82AC0A;
    SEP #$20                                                   ;82ABFE|E220    |      ;
    AND.B #$10                                                 ;82AC00|2910    |      ;
    BEQ +                                                      ;82AC02|F006    |82AC0A;
    REP #$20                                                   ;82AC04|C220    |      ;
    LDA.W #$0001                                               ;82AC06|A90100  |      ;
    RTL                                                        ;82AC09|6B      |      ;
 
 
  + REP #$20                                                   ;82AC0A|C220    |      ;
    LDA.W #$0000                                               ;82AC0C|A90000  |      ;
    RTL                                                        ;82AC0F|6B      |      ;
 
 
.anySeedBag:
    REP #$30                                                   ;82AC10|C230    |      ;
    LDA.W #$0001                                               ;82AC12|A90100  |      ;
    JSL.L fUnknown_82AC61                                      ;82AC15|2261AC82|82AC61;
    CPX.W #$00A0                                               ;82AC19|E0A000  |      ;
    BCS +                                                      ;82AC1C|B011    |82AC2F;
    CPX.W #$0000                                               ;82AC1E|E00000  |      ;
    BEQ +                                                      ;82AC21|F00C    |82AC2F;
    SEP #$20                                                   ;82AC23|E220    |      ;
    AND.B #$20                                                 ;82AC25|2920    |      ;
    BEQ +                                                      ;82AC27|F006    |82AC2F;
    REP #$20                                                   ;82AC29|C220    |      ;
    LDA.W #$0001                                               ;82AC2B|A90100  |      ;
    RTL                                                        ;82AC2E|6B      |      ;
 
 
  + REP #$20                                                   ;82AC2F|C220    |      ;
    LDA.W #$0000                                               ;82AC31|A90000  |      ;
    RTL                                                        ;82AC34|6B      |      ;
 
 
.paint:
    SEP #$20                                                   ;82AC35|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82AC37|A522    |000022;
    CMP.B #$04                                                 ;82AC39|C904    |      ;
    BCS ..return0                                              ;82AC3B|B01E    |82AC5B;
    REP #$30                                                   ;82AC3D|C230    |      ;
    LDA.W #$0001                                               ;82AC3F|A90100  |      ;
    JSL.L fUnknown_82AC61                                      ;82AC42|2261AC82|82AC61;
    CPX.W #$00C3                                               ;82AC46|E0C300  |      ;
    BEQ ..return1                                              ;82AC49|F00A    |82AC55;
    CPX.W #$00E2                                               ;82AC4B|E0E200  |      ;
    BCC ..return0                                              ;82AC4E|900B    |82AC5B;
    CPX.W #$00E5                                               ;82AC50|E0E500  |      ;
    BCS ..return0                                              ;82AC53|B006    |82AC5B;
 
..return1:
    REP #$20                                                   ;82AC55|C220    |      ;
    LDA.W #$0001                                               ;82AC57|A90100  |      ;
    RTL                                                        ;82AC5A|6B      |      ;
 
 
..return0:
    REP #$20                                                   ;82AC5B|C220    |      ;
    LDA.W #$0000                                               ;82AC5D|A90000  |      ;
    RTL                                                        ;82AC60|6B      |      ;
 
 
fUnknown_82AC61:
    REP #$30                                                   ;82AC61|C230    |      ; A: nArg1, X: nPosX, Y: nPosY
    STA.B strcVariables.n16Temp3                               ;82AC63|8582    |000082;
    REP #$20                                                   ;82AC65|C220    |      ;
    %CheckFlag(daily2, $0008)
    BEQ +                                                      ;82AC6E|F003    |82AC73;
    JMP.W .return                                              ;82AC70|4CF5AC  |82ACF5;
 
 
  + JSL.L fObjectEngine_GetObjectAtCoords                      ;82AC73|2224B182|82B124;
    SEP #$20                                                   ;82AC77|E220    |      ;
    XBA                                                        ;82AC79|EB      |      ;
    LDA.B #$00                                                 ;82AC7A|A900    |      ;
    XBA                                                        ;82AC7C|EB      |      ;
    TAX                                                        ;82AC7D|AA      |      ;
    REP #$20                                                   ;82AC7E|C220    |      ;
    PHX                                                        ;82AC80|DA      |      ;
    PHA                                                        ;82AC81|48      |      ;
    ASL A                                                      ;82AC82|0A      |      ;
    ASL A                                                      ;82AC83|0A      |      ;
    INC A                                                      ;82AC84|1A      |      ;
    INC A                                                      ;82AC85|1A      |      ;
    INC A                                                      ;82AC86|1A      |      ;
    TAY                                                        ;82AC87|A8      |      ; Y = A * 7
    LDA.B strcPlayer.direction                                 ;82AC88|A5DA    |0000DA;
    ASL A                                                      ;82AC8A|0A      |      ;
    TAX                                                        ;82AC8B|AA      |      ; X = $DA * 2
    LDA.L .data1,X                                             ;82AC8C|BFFEAC82|82ACFE;
    STA.B strcVariables.n16Temp4                               ;82AC90|8584    |000084;
    SEP #$20                                                   ;82AC92|E220    |      ;
    LDA.B #$00                                                 ;82AC94|A900    |      ;
    XBA                                                        ;82AC96|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AC97|B70D    |00000D;
    REP #$20                                                   ;82AC99|C220    |      ;
    AND.B strcVariables.n16Temp4                               ;82AC9B|2584    |000084;
    BEQ +                                                      ;82AC9D|F02D    |82ACCC;
    SEP #$20                                                   ;82AC9F|E220    |      ;
    LDA.B #$00                                                 ;82ACA1|A900    |      ;
    XBA                                                        ;82ACA3|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;82ACA4|AF191F7F|7F1F19;
    REP #$20                                                   ;82ACA8|C220    |      ;
    ASL A                                                      ;82ACAA|0A      |      ;
    TAX                                                        ;82ACAB|AA      |      ; X = nSeasonId * 2
    LDA.L .data2,X                                             ;82ACAC|BF06AD82|82AD06;
    STA.B strcVariables.n16Temp4                               ;82ACB0|8584    |000084;
    SEP #$20                                                   ;82ACB2|E220    |      ;
    LDA.B #$00                                                 ;82ACB4|A900    |      ;
    XBA                                                        ;82ACB6|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ACB7|B70D    |00000D;
    REP #$20                                                   ;82ACB9|C220    |      ;
    AND.B strcVariables.n16Temp4                               ;82ACBB|2584    |000084;
    BEQ +                                                      ;82ACBD|F00D    |82ACCC;
    REP #$30                                                   ;82ACBF|C230    |      ;
    PLA                                                        ;82ACC1|68      |      ;
    PLX                                                        ;82ACC2|FA      |      ;
    ASL A                                                      ;82ACC3|0A      |      ;
    ASL A                                                      ;82ACC4|0A      |      ;
    ADC.B strcVariables.n16Temp3                               ;82ACC5|6582    |000082;
    TAY                                                        ;82ACC7|A8      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ACC8|B70D    |00000D;
    BRA .justReturn                                            ;82ACCA|8031    |82ACFD;
 
 
  + REP #$30                                                   ;82ACCC|C230    |      ;
    TYA                                                        ;82ACCE|98      |      ;
    DEC A                                                      ;82ACCF|3A      |      ;
    TAY                                                        ;82ACD0|A8      |      ;
    SEP #$20                                                   ;82ACD1|E220    |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ACD3|B70D    |00000D;
    AND.B #$80                                                 ;82ACD5|2980    |      ;
    BNE +                                                      ;82ACD7|D010    |82ACE9;
    REP #$20                                                   ;82ACD9|C220    |      ;
    PLA                                                        ;82ACDB|68      |      ;
    PLX                                                        ;82ACDC|FA      |      ;
    ASL A                                                      ;82ACDD|0A      |      ;
    ASL A                                                      ;82ACDE|0A      |      ;
    ADC.B strcVariables.n16Temp3                               ;82ACDF|6582    |000082;
    TAY                                                        ;82ACE1|A8      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ACE2|B70D    |00000D;
    LDX.W #$0000                                               ;82ACE4|A20000  |      ;
    BRA .justReturn                                            ;82ACE7|8014    |82ACFD;
 
 
  + REP #$30                                                   ;82ACE9|C230    |      ;
    PLA                                                        ;82ACEB|68      |      ;
    PLX                                                        ;82ACEC|FA      |      ;
    LDA.W #$0000                                               ;82ACED|A90000  |      ;
    LDX.W #$0000                                               ;82ACF0|A20000  |      ;
    BRA .justReturn                                            ;82ACF3|8008    |82ACFD;
 
 
.return:
    REP #$30                                                   ;82ACF5|C230    |      ;
    LDA.W #$0000                                               ;82ACF7|A90000  |      ;
    LDX.W #$0000                                               ;82ACFA|A20000  |      ;
 
.justReturn:
    RTL                                                        ;82ACFD|6B      |      ;
 
 
.data1:
    dw $0001,$0002,$0004,$0008                                 ;82ACFE|        |      ; 0x04 * [n16][nSeasonId]
 
.data2:
    dw $0010,$0020,$0040,$0080                                 ;82AD06|        |      ; 0x04 * [n16][nSeasonId]
 
fUnknown_82AD0E:
    SEP #$20                                                   ;82AD0E|E220    |      ;
    REP #$10                                                   ;82AD10|C210    |      ;
    CPX.W #$00F0                                               ;82AD12|E0F000  |      ;
    BCC +                                                      ;82AD15|9003    |82AD1A;
    JMP.W .case00F0                                            ;82AD17|4CBAAE  |82AEBA;
 
 
  + CPX.W #$00E0                                               ;82AD1A|E0E000  |      ;
    BCC +                                                      ;82AD1D|9003    |82AD22;
    JMP.W .case00E0                                            ;82AD1F|4CB8AE  |82AEB8;
 
 
  + CPX.W #$00D0                                               ;82AD22|E0D000  |      ;
    BCC +                                                      ;82AD25|9003    |82AD2A;
    JMP.W .case00D0                                            ;82AD27|4C9BAE  |82AE9B;
 
 
  + CPX.W #$00C0                                               ;82AD2A|E0C000  |      ;
    BCC +                                                      ;82AD2D|9003    |82AD32;
    JMP.W .case00C0                                            ;82AD2F|4CE0AD  |82ADE0;
 
 
  + SEP #$20                                                   ;82AD32|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;82AD34|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;82AD38|C902    |      ;
    BEQ +                                                      ;82AD3A|F006    |82AD42;
    CMP.B #$03                                                 ;82AD3C|C903    |      ;
    BEQ +                                                      ;82AD3E|F002    |82AD42;
    BRA .notWinterNotFall                                      ;82AD40|8042    |82AD84;
 
 
  + REP #$30                                                   ;82AD42|C230    |      ;
    CPX.W #$0038                                               ;82AD44|E03800  |      ;
    BNE +                                                      ;82AD47|D003    |82AD4C;
    JMP.W .justReturn                                          ;82AD49|4CE5AE  |82AEE5;
 
 
  + CPX.W #$0039                                               ;82AD4C|E03900  |      ;
    BNE +                                                      ;82AD4F|D003    |82AD54;
    JMP.W .justReturn                                          ;82AD51|4CE5AE  |82AEE5;
 
 
  + CPX.W #$0052                                               ;82AD54|E05200  |      ;
    BNE +                                                      ;82AD57|D003    |82AD5C;
    JMP.W .justReturn                                          ;82AD59|4CE5AE  |82AEE5;
 
 
  + CPX.W #$0053                                               ;82AD5C|E05300  |      ;
    BNE +                                                      ;82AD5F|D003    |82AD64;
    JMP.W .justReturn                                          ;82AD61|4CE5AE  |82AEE5;
 
 
  + CPX.W #$0060                                               ;82AD64|E06000  |      ;
    BNE +                                                      ;82AD67|D003    |82AD6C;
    JMP.W .justReturn                                          ;82AD69|4CE5AE  |82AEE5;
 
 
  + CPX.W #$0061                                               ;82AD6C|E06100  |      ;
    BNE +                                                      ;82AD6F|D003    |82AD74;
    JMP.W .justReturn                                          ;82AD71|4CE5AE  |82AEE5;
 
 
  + CPX.W #$006E                                               ;82AD74|E06E00  |      ;
    BNE +                                                      ;82AD77|D003    |82AD7C;
    JMP.W .justReturn                                          ;82AD79|4CE5AE  |82AEE5;
 
 
  + CPX.W #$006F                                               ;82AD7C|E06F00  |      ;
    BNE .notWinterNotFall                                      ;82AD7F|D003    |82AD84;
    JMP.W .justReturn                                          ;82AD81|4CE5AE  |82AEE5;
 
 
.notWinterNotFall:
    REP #$20                                                   ;82AD84|C220    |      ;
    TXA                                                        ;82AD86|8A      |      ;
    ASL A                                                      ;82AD87|0A      |      ;
    ASL A                                                      ;82AD88|0A      |      ;
    TAY                                                        ;82AD89|A8      |      ;
    INY                                                        ;82AD8A|C8      |      ;
    SEP #$20                                                   ;82AD8B|E220    |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AD8D|B70D    |00000D;
    AND.B #$80                                                 ;82AD8F|2980    |      ;
    BNE +                                                      ;82AD91|D003    |82AD96;
    JMP.W .label1                                              ;82AD93|4CC5AD  |82ADC5;
 
 
  + DEY                                                        ;82AD96|88      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AD97|B70D    |00000D;
    STA.W strcPlayerData.unkMap91F                             ;82AD99|8D1F09  |00091F;
    REP #$20                                                   ;82AD9C|C220    |      ;
    TXA                                                        ;82AD9E|8A      |      ;
    ASL A                                                      ;82AD9F|0A      |      ;
    ASL A                                                      ;82ADA0|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;82ADA1|857E    |00007E;
    SEP #$20                                                   ;82ADA3|E220    |      ;
    LDA.B #$00                                                 ;82ADA5|A900    |      ;
    XBA                                                        ;82ADA7|EB      |      ;
    LDA.L nCurrentSeasonID                                     ;82ADA8|AF191F7F|7F1F19;
    REP #$20                                                   ;82ADAC|C220    |      ;
    CLC                                                        ;82ADAE|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;82ADAF|657E    |00007E;
    TAX                                                        ;82ADB1|AA      |      ;
    SEP #$20                                                   ;82ADB2|E220    |      ;
    LDA.L aInteractionItemTable,X                              ;82ADB4|BFB4CF82|82CFB4;
    STA.W strcPlayerData.carryItemId                           ;82ADB8|8D1D09  |00091D;
    %SetPlayerAction(!PACTION_ITEMONHAND)
    JMP.W .justReturn                                          ;82ADC2|4CE5AE  |82AEE5;
 
 
.label1:
    SEP #$20                                                   ;82ADC5|E220    |      ;
    INY                                                        ;82ADC7|C8      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ADC8|B70D    |00000D;
    AND.B #$01                                                 ;82ADCA|2901    |      ;
    BNE +                                                      ;82ADCC|D003    |82ADD1;
    JMP.W .return                                              ;82ADCE|4CE6AE  |82AEE6;
 
 
  + %CheckPlayerFlags(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;82ADD8|F003    |82ADDD;
    JMP.W .justReturn                                          ;82ADDA|4CE5AE  |82AEE5;
 
 
  + JMP.W .justReturn                                          ;82ADDD|4CE5AE  |82AEE5;
 
 
.case00C0:
    REP #$20                                                   ;82ADE0|C220    |      ;
    TXA                                                        ;82ADE2|8A      |      ;
    ASL A                                                      ;82ADE3|0A      |      ;
    ASL A                                                      ;82ADE4|0A      |      ;
    TAY                                                        ;82ADE5|A8      |      ;
    SEP #$20                                                   ;82ADE6|E220    |      ;
    LDA.B #$00                                                 ;82ADE8|A900    |      ;
    XBA                                                        ;82ADEA|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ADEB|B70D    |00000D;
    STA.B strcVariables.n8Temp1                                ;82ADED|8592    |000092;
    INY                                                        ;82ADEF|C8      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82ADF0|B70D    |00000D;
    STA.B strcVariables.n8Temp2                                ;82ADF2|8593    |000093;
    BNE +                                                      ;82ADF4|D003    |82ADF9;
    JMP.W .justReturn                                          ;82ADF6|4CE5AE  |82AEE5;
 
 
  + LDA.B #$00                                                 ;82ADF9|A900    |      ;
    XBA                                                        ;82ADFB|EB      |      ;
    LDA.B strcVariables.n8Temp1                                ;82ADFC|A592    |000092;
    REP #$20                                                   ;82ADFE|C220    |      ;
    ASL A                                                      ;82AE00|0A      |      ;
    ASL A                                                      ;82AE01|0A      |      ;
    ASL A                                                      ;82AE02|0A      |      ;
    INC A                                                      ;82AE03|1A      |      ;
    INC A                                                      ;82AE04|1A      |      ;
    INC A                                                      ;82AE05|1A      |      ;
    TAX                                                        ;82AE06|AA      |      ;
    SEP #$20                                                   ;82AE07|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE09|BFF5B680|80B6F5;
    AND.B #$02                                                 ;82AE0D|2902    |      ;
    BEQ +                                                      ;82AE0F|F00A    |82AE1B;
    LDA.L nCurrentTimeID                                       ;82AE11|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;82AE15|C911    |      ;
    BCC +                                                      ;82AE17|9002    |82AE1B;
    BRA .label2                                                ;82AE19|8066    |82AE81;
 
 
  + SEP #$20                                                   ;82AE1B|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE1D|BFF5B680|80B6F5;
    AND.B #$04                                                 ;82AE21|2904    |      ;
    BEQ +                                                      ;82AE23|F00A    |82AE2F;
    LDA.L nCurrentTimeID                                       ;82AE25|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;82AE29|C911    |      ;
    BCS +                                                      ;82AE2B|B002    |82AE2F;
    BRA .label2                                                ;82AE2D|8052    |82AE81;
 
 
  + SEP #$20                                                   ;82AE2F|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE31|BFF5B680|80B6F5;
    AND.B #$08                                                 ;82AE35|2908    |      ;
    BEQ +                                                      ;82AE37|F00C    |82AE45;
    LDA.L nCurrentWeekdayID                                    ;82AE39|AF1A1F7F|7F1F1A;
    BEQ +                                                      ;82AE3D|F006    |82AE45;
    CMP.B #$06                                                 ;82AE3F|C906    |      ;
    BEQ +                                                      ;82AE41|F002    |82AE45;
    BRA .label2                                                ;82AE43|803C    |82AE81;
 
 
  + SEP #$20                                                   ;82AE45|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE47|BFF5B680|80B6F5;
    AND.B #$10                                                 ;82AE4B|2910    |      ;
    BEQ +                                                      ;82AE4D|F00A    |82AE59;
    LDA.L nCurrentWeekdayID                                    ;82AE4F|AF1A1F7F|7F1F1A;
    CMP.B #$06                                                 ;82AE53|C906    |      ;
    BNE +                                                      ;82AE55|D002    |82AE59;
    BRA .label2                                                ;82AE57|8028    |82AE81;
 
 
  + SEP #$20                                                   ;82AE59|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE5B|BFF5B680|80B6F5;
    AND.B #$20                                                 ;82AE5F|2920    |      ;
    BEQ +                                                      ;82AE61|F008    |82AE6B;
    LDA.L nCurrentWeekdayID                                    ;82AE63|AF1A1F7F|7F1F1A;
    BNE +                                                      ;82AE67|D002    |82AE6B;
    BRA .label2                                                ;82AE69|8016    |82AE81;
 
 
  + SEP #$20                                                   ;82AE6B|E220    |      ;
    LDA.L aScreenTransitionTable,X                             ;82AE6D|BFF5B680|80B6F5;
    AND.B #$80                                                 ;82AE71|2980    |      ;
    BEQ .justReturn                                            ;82AE73|F070    |82AEE5;
    REP #$20                                                   ;82AE75|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82AE77|AD9601  |000196;
    AND.W #$0010                                               ;82AE7A|291000  |      ;
    BEQ .justReturn                                            ;82AE7D|F066    |82AEE5;
    BRA .label2                                                ;82AE7F|8000    |82AE81;
 
 
.label2:
    SEP #$20                                                   ;82AE81|E220    |      ;
    LDA.B #$02                                                 ;82AE83|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;82AE85|8D9A01  |00019A;
    LDA.B #$00                                                 ;82AE88|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;82AE8A|8D9101  |000191;
    LDA.B #$00                                                 ;82AE8D|A900    |      ;
    XBA                                                        ;82AE8F|EB      |      ;
    LDA.B strcVariables.n8Temp2                                ;82AE90|A593    |000093;
    REP #$20                                                   ;82AE92|C220    |      ;
    TAX                                                        ;82AE94|AA      |      ;
    JSL.L fDialog_DialogHandler                                ;82AE95|225F9383|83935F;
    BRA .justReturn                                            ;82AE99|804A    |82AEE5;
 
 
.case00D0:
    REP #$20                                                   ;82AE9B|C220    |      ;
    TXA                                                        ;82AE9D|8A      |      ;
    ASL A                                                      ;82AE9E|0A      |      ;
    ASL A                                                      ;82AE9F|0A      |      ;
    TAY                                                        ;82AEA0|A8      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AEA1|B70D    |00000D;
    TAX                                                        ;82AEA3|AA      |      ;
    SEP #$20                                                   ;82AEA4|E220    |      ;
    REP #$10                                                   ;82AEA6|C210    |      ;
    LDA.B #$02                                                 ;82AEA8|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;82AEAA|8D9A01  |00019A;
    LDA.B #$00                                                 ;82AEAD|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;82AEAF|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;82AEB2|225F9383|83935F;
    BRA .justReturn                                            ;82AEB6|802D    |82AEE5;
 
 
.case00E0:
    BRA .justReturn                                            ;82AEB8|802B    |82AEE5;
 
 
.case00F0:
    REP #$20                                                   ;82AEBA|C220    |      ;
    TXA                                                        ;82AEBC|8A      |      ;
    ASL A                                                      ;82AEBD|0A      |      ;
    ASL A                                                      ;82AEBE|0A      |      ;
    TAY                                                        ;82AEBF|A8      |      ;
    INY                                                        ;82AEC0|C8      |      ;
    SEP #$20                                                   ;82AEC1|E220    |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AEC3|B70D    |00000D;
    AND.B #$01                                                 ;82AEC5|2901    |      ;
    BEQ .justReturn                                            ;82AEC7|F01C    |82AEE5;
    DEY                                                        ;82AEC9|88      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AECA|B70D    |00000D;
    STA.W nPlayerInteractionIndex                              ;82AECC|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;82AECF|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;82AED2|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
 
.justReturn:
    RTL                                                        ;82AEE5|6B      |      ;
 
 
.return:
    REP #$20                                                   ;82AEE6|C220    |      ;
    LDA.B strcPlayer.posX                                      ;82AEE8|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;82AEEA|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;82AEEC|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;82AEEE|85E1    |0000E1;
    STZ.B strcPlayer.newX                                      ;82AEF0|64E5    |0000E5;
    STZ.B strcPlayer.newY                                      ;82AEF2|64E7    |0000E7;
    LDA.W #$0010                                               ;82AEF4|A91000  |      ;
    STA.B strcPlayer.unkE3                                     ;82AEF7|85E3    |0000E3;
    LDA.B strcPlayer.direction                                 ;82AEF9|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;82AEFB|2291AD83|83AD91;
    RTL                                                        ;82AEFF|6B      |      ;
 
 
fUnknown_82AF00:
    REP #$30                                                   ;82AF00|C230    |      ;
    LDY.W #$0000                                               ;82AF02|A00000  |      ;
 
.loop:
    LDX.W #$0000                                               ;82AF05|A20000  |      ;
 
.continue:
    PHY                                                        ;82AF08|5A      |      ;
    PHX                                                        ;82AF09|DA      |      ;
    STX.B strcVariables.n16Temp3                               ;82AF0A|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82AF0C|8484    |000084;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82AF0E|203CB1  |82B13C;
    SEP #$20                                                   ;82AF11|E220    |      ;
    REP #$10                                                   ;82AF13|C210    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AF15|BDB609  |0009B6;
    BNE +                                                      ;82AF18|D003    |82AF1D;
    JMP.W .caseA0                                              ;82AF1A|4C09B0  |82B009;
 
 
  + CMP.B #$A0                                                 ;82AF1D|C9A0    |      ;
    BCC +                                                      ;82AF1F|9003    |82AF24;
    JMP.W .caseA0                                              ;82AF21|4C09B0  |82B009;
 
 
  + CMP.B #$73                                                 ;82AF24|C973    |      ;
    BCS +                                                      ;82AF26|B003    |82AF2B;
    JMP.W .case7A                                              ;82AF28|4CE5AF  |82AFE5;
 
 
  + CMP.B #$7A                                                 ;82AF2B|C97A    |      ;
    BCC +                                                      ;82AF2D|9003    |82AF32;
    JMP.W .case7A                                              ;82AF2F|4CE5AF  |82AFE5;
 
 
  + REP #$20                                                   ;82AF32|C220    |      ;
    STZ.B strcVariables.n16Unk86                               ;82AF34|6486    |000086;
    PHX                                                        ;82AF36|DA      |      ;
    TXA                                                        ;82AF37|8A      |      ;
    SEC                                                        ;82AF38|38      |      ;
    SBC.W #$0001                                               ;82AF39|E90100  |      ;
    TAX                                                        ;82AF3C|AA      |      ;
    SEP #$20                                                   ;82AF3D|E220    |      ;
    REP #$10                                                   ;82AF3F|C210    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AF41|BDB609  |0009B6;
    PLX                                                        ;82AF44|FA      |      ;
    CMP.B #$73                                                 ;82AF45|C973    |      ;
    BCC +                                                      ;82AF47|900D    |82AF56;
    CMP.B #$7A                                                 ;82AF49|C97A    |      ;
    BCS +                                                      ;82AF4B|B009    |82AF56;
    REP #$20                                                   ;82AF4D|C220    |      ;
    LDA.B strcVariables.n16Unk86                               ;82AF4F|A586    |000086;
    ORA.W #$0008                                               ;82AF51|090800  |      ;
    STA.B strcVariables.n16Unk86                               ;82AF54|8586    |000086;
 
  + REP #$30                                                   ;82AF56|C230    |      ;
    PHX                                                        ;82AF58|DA      |      ;
    TXA                                                        ;82AF59|8A      |      ;
    CLC                                                        ;82AF5A|18      |      ;
    ADC.W #$0001                                               ;82AF5B|690100  |      ;
    TAX                                                        ;82AF5E|AA      |      ;
    SEP #$20                                                   ;82AF5F|E220    |      ;
    REP #$10                                                   ;82AF61|C210    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AF63|BDB609  |0009B6;
    PLX                                                        ;82AF66|FA      |      ;
    CMP.B #$73                                                 ;82AF67|C973    |      ;
    BCC +                                                      ;82AF69|900D    |82AF78;
    CMP.B #$7A                                                 ;82AF6B|C97A    |      ;
    BCS +                                                      ;82AF6D|B009    |82AF78;
    REP #$20                                                   ;82AF6F|C220    |      ;
    LDA.B strcVariables.n16Unk86                               ;82AF71|A586    |000086;
    ORA.W #$0002                                               ;82AF73|090200  |      ;
    STA.B strcVariables.n16Unk86                               ;82AF76|8586    |000086;
 
  + REP #$30                                                   ;82AF78|C230    |      ;
    PHX                                                        ;82AF7A|DA      |      ;
    TXA                                                        ;82AF7B|8A      |      ;
    SEC                                                        ;82AF7C|38      |      ;
    SBC.W #$0040                                               ;82AF7D|E94000  |      ;
    TAX                                                        ;82AF80|AA      |      ;
    SEP #$20                                                   ;82AF81|E220    |      ;
    REP #$10                                                   ;82AF83|C210    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AF85|BDB609  |0009B6;
    PLX                                                        ;82AF88|FA      |      ;
    CMP.B #$73                                                 ;82AF89|C973    |      ;
    BCC +                                                      ;82AF8B|900D    |82AF9A;
    CMP.B #$7A                                                 ;82AF8D|C97A    |      ;
    BCS +                                                      ;82AF8F|B009    |82AF9A;
    REP #$20                                                   ;82AF91|C220    |      ;
    LDA.B strcVariables.n16Unk86                               ;82AF93|A586    |000086;
    ORA.W #$0004                                               ;82AF95|090400  |      ;
    STA.B strcVariables.n16Unk86                               ;82AF98|8586    |000086;
 
  + REP #$30                                                   ;82AF9A|C230    |      ;
    PHX                                                        ;82AF9C|DA      |      ;
    TXA                                                        ;82AF9D|8A      |      ;
    CLC                                                        ;82AF9E|18      |      ;
    ADC.W #$0040                                               ;82AF9F|694000  |      ;
    TAX                                                        ;82AFA2|AA      |      ;
    SEP #$20                                                   ;82AFA3|E220    |      ;
    REP #$10                                                   ;82AFA5|C210    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AFA7|BDB609  |0009B6;
    PLX                                                        ;82AFAA|FA      |      ;
    CMP.B #$73                                                 ;82AFAB|C973    |      ;
    BCC +                                                      ;82AFAD|900D    |82AFBC;
    CMP.B #$7A                                                 ;82AFAF|C97A    |      ;
    BCS +                                                      ;82AFB1|B009    |82AFBC;
    REP #$20                                                   ;82AFB3|C220    |      ;
    LDA.B strcVariables.n16Unk86                               ;82AFB5|A586    |000086;
    ORA.W #$0001                                               ;82AFB7|090100  |      ;
    STA.B strcVariables.n16Unk86                               ;82AFBA|8586    |000086;
 
  + REP #$30                                                   ;82AFBC|C230    |      ;
    PHX                                                        ;82AFBE|DA      |      ;
    LDA.B strcVariables.n16Unk86                               ;82AFBF|A586    |000086;
    TAX                                                        ;82AFC1|AA      |      ;
    SEP #$20                                                   ;82AFC2|E220    |      ;
    LDA.L .unknownData,X                                       ;82AFC4|BF2AB082|82B02A;
    DEC A                                                      ;82AFC8|3A      |      ;
    STA.B strcVariables.n8Temp3                                ;82AFC9|8594    |000094;
    PLX                                                        ;82AFCB|FA      |      ;
    SEP #$20                                                   ;82AFCC|E220    |      ;
    LDA.B #$00                                                 ;82AFCE|A900    |      ;
    XBA                                                        ;82AFD0|EB      |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AFD1|BDB609  |0009B6;
    REP #$20                                                   ;82AFD4|C220    |      ;
    ASL A                                                      ;82AFD6|0A      |      ;
    ASL A                                                      ;82AFD7|0A      |      ;
    TAY                                                        ;82AFD8|A8      |      ;
    SEP #$20                                                   ;82AFD9|E220    |      ;
    LDA.B #$00                                                 ;82AFDB|A900    |      ;
    XBA                                                        ;82AFDD|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AFDE|B70D    |00000D;
    CLC                                                        ;82AFE0|18      |      ;
    ADC.B strcVariables.n8Temp3                                ;82AFE1|6594    |000094;
    BRA +                                                      ;82AFE3|801A    |82AFFF;
 
 
.case7A:
    SEP #$20                                                   ;82AFE5|E220    |      ;
    REP #$10                                                   ;82AFE7|C210    |      ;
    LDA.B #$00                                                 ;82AFE9|A900    |      ;
    XBA                                                        ;82AFEB|EB      |      ;
    LDA.W sCurrentObjectMap,X                                  ;82AFEC|BDB609  |0009B6;
    REP #$20                                                   ;82AFEF|C220    |      ;
    ASL A                                                      ;82AFF1|0A      |      ;
    ASL A                                                      ;82AFF2|0A      |      ;
    TAY                                                        ;82AFF3|A8      |      ;
    SEP #$20                                                   ;82AFF4|E220    |      ;
    LDA.B #$00                                                 ;82AFF6|A900    |      ;
    XBA                                                        ;82AFF8|EB      |      ;
    LDA.B [strcMap.pSelected],Y                                ;82AFF9|B70D    |00000D;
    BEQ .caseA0                                                ;82AFFB|F00C    |82B009;
    REP #$20                                                   ;82AFFD|C220    |      ;
 
  + REP #$30                                                   ;82AFFF|C230    |      ;
    LDX.B strcVariables.n16Temp3                               ;82B001|A682    |000082;
    LDY.B strcVariables.n16Temp4                               ;82B003|A484    |000084;
    JSL.L fUnknown_81A83A                                      ;82B005|223AA881|81A83A;
 
.caseA0:
    REP #$30                                                   ;82B009|C230    |      ;
    PLX                                                        ;82B00B|FA      |      ;
    PLY                                                        ;82B00C|7A      |      ;
    TXA                                                        ;82B00D|8A      |      ;
    CLC                                                        ;82B00E|18      |      ;
    ADC.W #$0010                                               ;82B00F|691000  |      ;
    TAX                                                        ;82B012|AA      |      ;
    CPX.W #$0400                                               ;82B013|E00004  |      ;
    BEQ +                                                      ;82B016|F003    |82B01B;
    JMP.W .continue                                            ;82B018|4C08AF  |82AF08;
 
 
  + TYA                                                        ;82B01B|98      |      ;
    CLC                                                        ;82B01C|18      |      ;
    ADC.W #$0010                                               ;82B01D|691000  |      ;
    TAY                                                        ;82B020|A8      |      ;
    CPY.W #$0400                                               ;82B021|C00004  |      ;
    BEQ .justReturn                                            ;82B024|F003    |82B029;
    JMP.W .loop                                                ;82B026|4C05AF  |82AF05;
 
 
.justReturn:
    RTL                                                        ;82B029|6B      |      ;
 
 
.unknownData:
    db $09,$02,$07,$01,$07,$04,$07,$04,$09,$03,$08,$02         ;82B02A|        |      ;
    db $09,$06,$08,$05                                         ;82B036|        |      ;
 
fMap_UpdateCurrentTilemap:
    SEP #$20                                                   ;82B03A|E220    |      ; A: nTileId, X: nPosX, Y: nPosY
    REP #$10                                                   ;82B03C|C210    |      ;
    PHA                                                        ;82B03E|48      |      ;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82B03F|203CB1  |82B13C;
    SEP #$20                                                   ;82B042|E220    |      ;
    PLA                                                        ;82B044|68      |      ;
    STA.W sCurrentObjectMap,X                                  ;82B045|9DB609  |0009B6;
    RTL                                                        ;82B048|6B      |      ;
 
 
fMap_UpdateFarmTilemapCoords:
    SEP #$20                                                   ;82B049|E220    |      ; A: nTileId, X: nPosX, Y: nPosY
    REP #$10                                                   ;82B04B|C210    |      ;
    PHA                                                        ;82B04D|48      |      ;
    LDA.B #$04                                                 ;82B04E|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82B050|8D8101  |000181;
    PLA                                                        ;82B053|68      |      ;
    PHA                                                        ;82B054|48      |      ;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82B055|203CB1  |82B13C;
    SEP #$20                                                   ;82B058|E220    |      ;
    PLA                                                        ;82B05A|68      |      ;
    STA.L sFarmTilemap,X                                       ;82B05B|9FE6A47E|7EA4E6;
    RTL                                                        ;82B05F|6B      |      ;
 
 
fUnknown_82B060:
    SEP #$20                                                   ;82B060|E220    |      ; A: nArg1, X: nArg2, Y: nArg3
    REP #$10                                                   ;82B062|C210    |      ;
    STA.B $99                                                  ;82B064|8599    |000099;
    STX.B strcVariables.n16Temp3                               ;82B066|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82B068|8484    |000084;
    LDY.W #$0000                                               ;82B06A|A00000  |      ;
 
 -- PHY                                                        ;82B06D|5A      |      ;
    TYA                                                        ;82B06E|98      |      ;
    ASL A                                                      ;82B06F|0A      |      ;
    ASL A                                                      ;82B070|0A      |      ;
    ASL A                                                      ;82B071|0A      |      ;
    ASL A                                                      ;82B072|0A      |      ;
    STA.B strcVariables.n16Unk8E                               ;82B073|858E    |00008E;
    LDX.W #$0000                                               ;82B075|A20000  |      ;
 
  - PHX                                                        ;82B078|DA      |      ;
    TXA                                                        ;82B079|8A      |      ;
    ASL A                                                      ;82B07A|0A      |      ;
    ASL A                                                      ;82B07B|0A      |      ;
    ASL A                                                      ;82B07C|0A      |      ;
    ASL A                                                      ;82B07D|0A      |      ;
    STA.B strcVariables.n16Unk90                               ;82B07E|8590    |000090;
    REP #$30                                                   ;82B080|C230    |      ;
    LDA.B strcVariables.n16Temp3                               ;82B082|A582    |000082;
    CLC                                                        ;82B084|18      |      ;
    ADC.B strcVariables.n16Unk8E                               ;82B085|658E    |00008E;
    TAX                                                        ;82B087|AA      |      ;
    LDA.B strcVariables.n16Temp4                               ;82B088|A584    |000084;
    CLC                                                        ;82B08A|18      |      ;
    ADC.B strcVariables.n16Unk90                               ;82B08B|6590    |000090;
    TAY                                                        ;82B08D|A8      |      ;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82B08E|203CB1  |82B13C;
    SEP #$20                                                   ;82B091|E220    |      ;
    REP #$10                                                   ;82B093|C210    |      ;
    LDA.B $99                                                  ;82B095|A599    |000099;
    STA.W sCurrentObjectMap,X                                  ;82B097|9DB609  |0009B6;
    PLX                                                        ;82B09A|FA      |      ;
    INX                                                        ;82B09B|E8      |      ;
    CPX.B strcVariables.n16Unk86                               ;82B09C|E486    |000086;
    BNE -                                                      ;82B09E|D0D8    |82B078;
    PLY                                                        ;82B0A0|7A      |      ;
    INY                                                        ;82B0A1|C8      |      ;
    CPY.B strcVariables.n16Unk88                               ;82B0A2|C488    |000088;
    BNE --                                                     ;82B0A4|D0C7    |82B06D;
    RTL                                                        ;82B0A6|6B      |      ;
 
 
fUnknown_82B0A7:
    REP #$30                                                   ;82B0A7|C230    |      ;
    STX.B strcVariables.n16Unk8E                               ;82B0A9|868E    |00008E;
    STY.B strcVariables.n16Unk90                               ;82B0AB|8490    |000090;
    JSL.L fUnknown_81A801                                      ;82B0AD|2201A881|81A801;
    REP #$30                                                   ;82B0B1|C230    |      ;
    LDA.W #$F500                                               ;82B0B3|A900F5  |      ;
    STA.B ptrTemp0x72                                          ;82B0B6|8572    |000072;
    SEP #$20                                                   ;82B0B8|E220    |      ;
    LDA.B #$A7                                                 ;82B0BA|A9A7    |      ;
    STA.B ptrTemp0x72+2                                        ;82B0BC|8574    |000074;
    REP #$20                                                   ;82B0BE|C220    |      ;
    LDA.B strcVariables.n16Temp1                               ;82B0C0|A57E    |00007E;
    AND.W #$007F                                               ;82B0C2|297F00  |      ;
    LSR A                                                      ;82B0C5|4A      |      ;
    LSR A                                                      ;82B0C6|4A      |      ;
    STA.B strcVariables.n16Unk86                               ;82B0C7|8586    |000086;
    LDA.B strcVariables.n16Temp1                               ;82B0C9|A57E    |00007E;
    LSR A                                                      ;82B0CB|4A      |      ;
    LSR A                                                      ;82B0CC|4A      |      ;
    LSR A                                                      ;82B0CD|4A      |      ;
    LSR A                                                      ;82B0CE|4A      |      ;
    LSR A                                                      ;82B0CF|4A      |      ;
    LSR A                                                      ;82B0D0|4A      |      ;
    LSR A                                                      ;82B0D1|4A      |      ;
    ASL A                                                      ;82B0D2|0A      |      ;
    ASL A                                                      ;82B0D3|0A      |      ;
    ASL A                                                      ;82B0D4|0A      |      ;
    ASL A                                                      ;82B0D5|0A      |      ;
    CLC                                                        ;82B0D6|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;82B0D7|6586    |000086;
    STA.B strcVariables.n16Unk86                               ;82B0D9|8586    |000086;
    LDA.B strcVariables.n16Temp3                               ;82B0DB|A582    |000082;
    STA.B strcVariables.n16Temp4                               ;82B0DD|8584    |000084;
    LDA.B strcVariables.n16Temp2                               ;82B0DF|A580    |000080;
    STA.B strcVariables.n16Temp3                               ;82B0E1|8582    |000082;
    LDY.W #$0000                                               ;82B0E3|A00000  |      ;
 
 -- PHY                                                        ;82B0E6|5A      |      ;
    LDX.W #$0000                                               ;82B0E7|A20000  |      ;
 
  - REP #$30                                                   ;82B0EA|C230    |      ;
    PHX                                                        ;82B0EC|DA      |      ;
    PHY                                                        ;82B0ED|5A      |      ;
    LDY.B strcVariables.n16Unk86                               ;82B0EE|A486    |000086;
    INC.B strcVariables.n16Unk86                               ;82B0F0|E686    |000086;
    SEP #$20                                                   ;82B0F2|E220    |      ;
    LDA.B [ptrTemp0x72],Y                                      ;82B0F4|B772    |000072;
    PLY                                                        ;82B0F6|7A      |      ;
    PHY                                                        ;82B0F7|5A      |      ;
    PHA                                                        ;82B0F8|48      |      ;
    REP #$20                                                   ;82B0F9|C220    |      ;
    TXA                                                        ;82B0FB|8A      |      ;
    ASL A                                                      ;82B0FC|0A      |      ;
    ASL A                                                      ;82B0FD|0A      |      ;
    ASL A                                                      ;82B0FE|0A      |      ;
    ASL A                                                      ;82B0FF|0A      |      ;
    CLC                                                        ;82B100|18      |      ;
    ADC.B strcVariables.n16Unk8E                               ;82B101|658E    |00008E;
    TAX                                                        ;82B103|AA      |      ;
    TYA                                                        ;82B104|98      |      ;
    ASL A                                                      ;82B105|0A      |      ;
    ASL A                                                      ;82B106|0A      |      ;
    ASL A                                                      ;82B107|0A      |      ;
    ASL A                                                      ;82B108|0A      |      ;
    CLC                                                        ;82B109|18      |      ;
    ADC.B strcVariables.n16Unk90                               ;82B10A|6590    |000090;
    TAY                                                        ;82B10C|A8      |      ;
    SEP #$20                                                   ;82B10D|E220    |      ;
    PLA                                                        ;82B10F|68      |      ;
    JSL.L fMap_UpdateCurrentTilemap                            ;82B110|223AB082|82B03A;
    REP #$30                                                   ;82B114|C230    |      ;
    PLY                                                        ;82B116|7A      |      ;
    PLX                                                        ;82B117|FA      |      ;
    INX                                                        ;82B118|E8      |      ;
    CPX.B strcVariables.n16Temp3                               ;82B119|E482    |000082;
    BNE -                                                      ;82B11B|D0CD    |82B0EA;
    PLY                                                        ;82B11D|7A      |      ;
    INY                                                        ;82B11E|C8      |      ;
    CPY.B strcVariables.n16Temp4                               ;82B11F|C484    |000084;
    BNE --                                                     ;82B121|D0C3    |82B0E6;
    RTL                                                        ;82B123|6B      |      ;
 
 
fObjectEngine_GetObjectAtCoords:
    REP #$30                                                   ;82B124|C230    |      ; X: nPosX, Y: nPosY, return A: nObject
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82B126|203CB1  |82B13C;
    SEP #$20                                                   ;82B129|E220    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82B12B|BDB609  |0009B6;
    RTL                                                        ;82B12E|6B      |      ;
 
 
fUnknown_82B12F:
    REP #$30                                                   ;82B12F|C230    |      ; UNUSED
    TXA                                                        ;82B131|8A      |      ;
    AND.W #$FFF0                                               ;82B132|29F0FF  |      ;
    TAX                                                        ;82B135|AA      |      ;
    TYA                                                        ;82B136|98      |      ;
    AND.W #$FFF0                                               ;82B137|29F0FF  |      ;
    TAY                                                        ;82B13A|A8      |      ;
    RTL                                                        ;82B13B|6B      |      ;
 
 
fObjectEngine_ConvertCoordsToOffset:
    REP #$30                                                   ;82B13C|C230    |      ; X: nPosX, Y: nPosY, return X: nOffsetIndex
    TXA                                                        ;82B13E|8A      |      ;
    LSR A                                                      ;82B13F|4A      |      ;
    LSR A                                                      ;82B140|4A      |      ;
    LSR A                                                      ;82B141|4A      |      ;
    LSR A                                                      ;82B142|4A      |      ;
    STA.B strcVariables.n16Temp1                               ;82B143|857E    |00007E; n16TempVar1 = nPosX * 16
    TYA                                                        ;82B145|98      |      ;
    AND.W #$FFF0                                               ;82B146|29F0FF  |      ;
    STA.B strcVariables.n16Temp2                               ;82B149|8580    |000080;
    SEP #$20                                                   ;82B14B|E220    |      ;
    LDA.W strcDialogDisplay.mapMultiWidth                      ;82B14D|AD8101  |000181;
    CMP.B #$01                                                 ;82B150|C901    |      ;
    BEQ +                                                      ;82B152|F017    |82B16B;
    REP #$20                                                   ;82B154|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;82B156|A580    |000080;
    ASL A                                                      ;82B158|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;82B159|8580    |000080;
    SEP #$20                                                   ;82B15B|E220    |      ;
    LDA.W strcDialogDisplay.mapMultiWidth                      ;82B15D|AD8101  |000181;
    CMP.B #$02                                                 ;82B160|C902    |      ;
    BEQ +                                                      ;82B162|F007    |82B16B;
    REP #$20                                                   ;82B164|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;82B166|A580    |000080;
    ASL A                                                      ;82B168|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;82B169|8580    |000080;
 
  + REP #$20                                                   ;82B16B|C220    |      ;
    LDA.B strcVariables.n16Temp1                               ;82B16D|A57E    |00007E;
    CLC                                                        ;82B16F|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;82B170|6580    |000080;
    TAX                                                        ;82B172|AA      |      ;
    RTS                                                        ;82B173|60      |      ;
 
pObjectMap:
    dl sObjectMap_DefaultFarm                                  ;82B174|        |A78000; 0x60 * [ptr24]
    dl sObjectMap_DefaultFarm                                  ;82B177|        |A78000;
    dl sObjectMap_DefaultFarm                                  ;82B17A|        |A78000;
    dl sObjectMap_DefaultFarm                                  ;82B17D|        |A78000;
    dl sObjectMap_0x06                                         ;82B180|        |A79600;
    dl sObjectMap_0x06                                         ;82B183|        |A79600;
    dl sObjectMap_0x06                                         ;82B186|        |A79600;
    dl sObjectMap_0x06                                         ;82B189|        |A79600;
    dl sObjectMap_0x1D                                         ;82B18C|        |A7F000;
    dl sObjectMap_0x1B                                         ;82B18F|        |A7DC00;
    dl sObjectMap_0x1A                                         ;82B192|        |A7D800;
    dl sObjectMap_0x1C                                         ;82B195|        |A7E000;
    dl sObjectMap_0x04                                         ;82B198|        |A79400;
    dl sObjectMap_0x04                                         ;82B19B|        |A79400;
    dl sObjectMap_0x04                                         ;82B19E|        |A79400;
    dl sObjectMap_0x04                                         ;82B1A1|        |A79400;
    dl sObjectMap_0x08                                         ;82B1A4|        |A7A600;
    dl sObjectMap_0x08                                         ;82B1A7|        |A7A600;
    dl sObjectMap_0x08                                         ;82B1AA|        |A7A600;
    dl sObjectMap_0x08                                         ;82B1AD|        |A7A600;
    dl sObjectMap_0x1E                                         ;82B1B0|        |A7F400;
    dl sObjectMap_0x01                                         ;82B1B3|        |A79000;
    dl sObjectMap_0x02                                         ;82B1B6|        |A79100;
    dl sObjectMap_0x03                                         ;82B1B9|        |A79200;
    dl sObjectMap_0x10                                         ;82B1BC|        |A7C300;
    dl sObjectMap_0x10                                         ;82B1BF|        |A7C300;
    dl sObjectMap_0x10                                         ;82B1C2|        |A7C300;
    dl sObjectMap_0x11                                         ;82B1C5|        |A7C700;
    dl sObjectMap_0x12                                         ;82B1C8|        |A7C900;
    dl sObjectMap_0x12                                         ;82B1CB|        |A7C900;
    dl sObjectMap_0x13                                         ;82B1CE|        |A7CB00;
    dl sObjectMap_0x13                                         ;82B1D1|        |A7CB00;
    dl sObjectMap_0x14                                         ;82B1D4|        |A7CD00;
    dl sObjectMap_0x14                                         ;82B1D7|        |A7CD00;
    dl sObjectMap_0x15                                         ;82B1DA|        |A7CF00;
    dl sObjectMap_0x15                                         ;82B1DD|        |A7CF00;
    dl sObjectMap_0x17                                         ;82B1E0|        |A7D100;
    dl sObjectMap_0x18                                         ;82B1E3|        |A7D200;
    dl sObjectMap_0x05                                         ;82B1E6|        |A79500;
    dl sObjectMap_0x0A                                         ;82B1E9|        |A7B600;
    dl sObjectMap_0x0B                                         ;82B1EC|        |A7B800;
    dl sObjectMap_0x0D                                         ;82B1EF|        |A7BC00;
    dl sObjectMap_0x0C                                         ;82B1F2|        |A7B900;
    dl sObjectMap_0x0E                                         ;82B1F5|        |A7C000;
    dl sObjectMap_0x19                                         ;82B1F8|        |A7D300;
    dl EMPTY_FFFFFF                                            ;82B1FB|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B1FE|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B201|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B204|        |FFFFFF;
    dl sObjectMap_0x0F                                         ;82B207|        |A7C100;
    dl sObjectMap_0x0F                                         ;82B20A|        |A7C100;
    dl sObjectMap_0x0F                                         ;82B20D|        |A7C100;
    dl sObjectMap_0x0F                                         ;82B210|        |A7C100;
    dl sObjectMap_0x0F                                         ;82B213|        |A7C100;
    dl sObjectMap_0x0F                                         ;82B216|        |A7C100;
    dl sObjectMap_0x0F                                         ;82B219|        |A7C100;
    dl sObjectMap_0x0F                                         ;82B21C|        |A7C100;
    dl sObjectMap_0x0F                                         ;82B21F|        |A7C100;
    dl sObjectMap_0x0F                                         ;82B222|        |A7C100;
    dl sObjectMap_0x0F                                         ;82B225|        |A7C100;
    dl EMPTY_FFFFFF                                            ;82B228|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B22B|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B22E|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B231|        |FFFFFF;
    dl sObjectMap_0x1F                                         ;82B234|        |A7F700;
    dl EMPTY_FFFFFF                                            ;82B237|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B23A|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B23D|        |FFFFFF;
    dl sObjectMap_0x20                                         ;82B240|        |A7F800;
    dl sObjectMap_0x21                                         ;82B243|        |A7F900;
    dl sObjectMap_0x22                                         ;82B246|        |A7FA00;
    dl sObjectMap_0x23                                         ;82B249|        |A7FB00;
    dl EMPTY_FFFFFF                                            ;82B24C|        |FFFFFF;
    dl sObjectMap_0x24                                         ;82B24F|        |A7FC00;
    dl EMPTY_FFFFFF                                            ;82B252|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B255|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B258|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B25B|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B25E|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B261|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B264|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B267|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B26A|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B26D|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B270|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B273|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B276|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B279|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B27C|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B27F|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B282|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B285|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B288|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B28B|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B28E|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B291|        |FFFFFF;
pObjectMap2:
    dl sObjectMap2_0x00                                        ;82B294|        |82B3B4; 0x60 * [ptr24]
    dl sObjectMap2_0x00                                        ;82B297|        |82B3B4;
    dl sObjectMap2_0x00                                        ;82B29A|        |82B3B4;
    dl sObjectMap2_0x00                                        ;82B29D|        |82B3B4;
    dl sObjectMap2_0x03                                        ;82B2A0|        |82BFB4;
    dl sObjectMap2_0x03                                        ;82B2A3|        |82BFB4;
    dl sObjectMap2_0x03                                        ;82B2A6|        |82BFB4;
    dl sObjectMap2_0x03                                        ;82B2A9|        |82BFB4;
    dl sObjectMap2_0x03                                        ;82B2AC|        |82BFB4;
    dl sObjectMap2_0x03                                        ;82B2AF|        |82BFB4;
    dl sObjectMap2_0x03                                        ;82B2B2|        |82BFB4;
    dl sObjectMap2_0x03                                        ;82B2B5|        |82BFB4;
    dl sObjectMap2_0x02                                        ;82B2B8|        |82BBB4;
    dl sObjectMap2_0x02                                        ;82B2BB|        |82BBB4;
    dl sObjectMap2_0x02                                        ;82B2BE|        |82BBB4;
    dl sObjectMap2_0x02                                        ;82B2C1|        |82BBB4;
    dl sObjectMap2_0x04                                        ;82B2C4|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B2C7|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B2CA|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B2CD|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B2D0|        |82C3B4;
    dl sObjectMap2_0x01                                        ;82B2D3|        |82B7B4;
    dl sObjectMap2_0x01                                        ;82B2D6|        |82B7B4;
    dl sObjectMap2_0x01                                        ;82B2D9|        |82B7B4;
    dl sObjectMap2_0x05                                        ;82B2DC|        |82C7B4;
    dl sObjectMap2_0x05                                        ;82B2DF|        |82C7B4;
    dl sObjectMap2_0x05                                        ;82B2E2|        |82C7B4;
    dl sObjectMap2_0x05                                        ;82B2E5|        |82C7B4;
    dl sObjectMap2_0x05                                        ;82B2E8|        |82C7B4;
    dl sObjectMap2_0x05                                        ;82B2EB|        |82C7B4;
    dl sObjectMap2_0x06                                        ;82B2EE|        |82CBB4;
    dl sObjectMap2_0x06                                        ;82B2F1|        |82CBB4;
    dl sObjectMap2_0x06                                        ;82B2F4|        |82CBB4;
    dl sObjectMap2_0x06                                        ;82B2F7|        |82CBB4;
    dl sObjectMap2_0x06                                        ;82B2FA|        |82CBB4;
    dl sObjectMap2_0x06                                        ;82B2FD|        |82CBB4;
    dl sObjectMap2_0x05                                        ;82B300|        |82C7B4;
    dl sObjectMap2_0x06                                        ;82B303|        |82CBB4;
    dl sObjectMap2_0x02                                        ;82B306|        |82BBB4;
    dl sObjectMap2_0x02                                        ;82B309|        |82BBB4;
    dl sObjectMap2_0x02                                        ;82B30C|        |82BBB4;
    dl sObjectMap2_0x04                                        ;82B30F|        |82C3B4;
    dl sObjectMap2_0x01                                        ;82B312|        |82B7B4;
    dl sObjectMap2_0x04                                        ;82B315|        |82C3B4;
    dl sObjectMap2_0x01                                        ;82B318|        |82B7B4;
    dl EMPTY_FFFFFF                                            ;82B31B|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B31E|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B321|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B324|        |FFFFFF;
    dl sObjectMap2_0x04                                        ;82B327|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B32A|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B32D|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B330|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B333|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B336|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B339|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B33C|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B33F|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B342|        |82C3B4;
    dl sObjectMap2_0x04                                        ;82B345|        |82C3B4;
    dl EMPTY_FFFFFF                                            ;82B348|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B34B|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B34E|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B351|        |FFFFFF;
    dl sObjectMap2_0x00                                        ;82B354|        |82B3B4;
    dl EMPTY_FFFFFF                                            ;82B357|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B35A|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B35D|        |FFFFFF;
    dl sObjectMap2_0x00                                        ;82B360|        |82B3B4;
    dl sObjectMap2_0x00                                        ;82B363|        |82B3B4;
    dl sObjectMap2_0x00                                        ;82B366|        |82B3B4;
    dl sObjectMap2_0x00                                        ;82B369|        |82B3B4;
    dl EMPTY_FFFFFF                                            ;82B36C|        |FFFFFF;
    dl sObjectMap2_0x00                                        ;82B36F|        |82B3B4;
    dl EMPTY_FFFFFF                                            ;82B372|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B375|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B378|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B37B|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B37E|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B381|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B384|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B387|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B38A|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B38D|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B390|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B393|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B396|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B399|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B39C|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B39F|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B3A2|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B3A5|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B3A8|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B3AB|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B3AE|        |FFFFFF;
    dl EMPTY_FFFFFF                                            ;82B3B1|        |FFFFFF;
 
sObjectMap2_0x00:
    dw $0000,$FF00,$0200,$FF00,$020E,$FF00                     ;82B3B4|        |      ;
    dw $810F,$7F01,$8410,$FF01,$8014,$FF21                     ;82B3C0|        |      ;
    dw $0415,$FF01,$3217,$FF00,$2218,$FF00                     ;82B3CC|        |      ;
    dw $0800,$FF01,$0800,$FF01,$0800,$FF01                     ;82B3D8|        |      ;
    dw $0800,$FF01,$0400,$FF01,$0400,$FF01                     ;82B3E4|        |      ;
    dw $0400,$FF01,$0400,$FF01,$0000,$FF00                     ;82B3F0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B3FC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B408|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B414|        |      ;
    dw $0000,$FF00,$0000,$FF00,$00ED,$FF00                     ;82B420|        |      ;
    dw $10EB,$FF00,$00EC,$FF00,$101A,$FF00                     ;82B42C|        |      ;
    dw $001D,$FF00,$111F,$FF01,$0120,$FF01                     ;82B438|        |      ;
    dw $1121,$FF01,$0122,$FF01,$101A,$FF00                     ;82B444|        |      ;
    dw $001D,$FF00,$101A,$FF00,$001D,$FF00                     ;82B450|        |      ;
    dw $111F,$FF01,$0120,$FF01,$111F,$FF01                     ;82B45C|        |      ;
    dw $0120,$FF01,$1121,$FF01,$0122,$FF01                     ;82B468|        |      ;
    dw $1121,$FF01,$0122,$FF01,$1123,$FF01                     ;82B474|        |      ;
    dw $0124,$FF01,$1123,$FF01,$0124,$FF01                     ;82B480|        |      ;
    dw $1123,$FF01,$0124,$FF01,$9125,$7F01                     ;82B48C|        |      ;
    dw $8126,$7F01,$1019,$FF00,$001D,$FF00                     ;82B498|        |      ;
    dw $1019,$FF00,$001D,$FF00,$1019,$FF00                     ;82B4A4|        |      ;
    dw $001D,$FF00,$1127,$FF01,$0128,$FF01                     ;82B4B0|        |      ;
    dw $1127,$FF01,$0128,$FF01,$1127,$FF01                     ;82B4BC|        |      ;
    dw $0128,$FF01,$1129,$FF01,$012A,$FF01                     ;82B4C8|        |      ;
    dw $1129,$FF01,$012A,$FF01,$1129,$FF01                     ;82B4D4|        |      ;
    dw $012A,$FF01,$112B,$FF01,$012C,$FF01                     ;82B4E0|        |      ;
    dw $112B,$FF01,$012C,$FF01,$112B,$FF01                     ;82B4EC|        |      ;
    dw $012C,$FF01,$912D,$7F01,$812E,$7F01                     ;82B4F8|        |      ;
    dw $101B,$FF00,$001D,$FF00,$101B,$FF00                     ;82B504|        |      ;
    dw $001D,$FF00,$101B,$FF00,$001D,$FF00                     ;82B510|        |      ;
    dw $112F,$FF01,$0130,$FF01,$112F,$FF01                     ;82B51C|        |      ;
    dw $0130,$FF01,$112F,$FF01,$0130,$FF01                     ;82B528|        |      ;
    dw $9131,$7F01,$8132,$7F01,$101C,$FF00                     ;82B534|        |      ;
    dw $001D,$FF00,$1133,$FF01,$0134,$FF01                     ;82B540|        |      ;
    dw $101C,$FF00,$001D,$FF00,$101C,$FF00                     ;82B54C|        |      ;
    dw $001D,$FF00,$1133,$FF01,$0134,$FF01                     ;82B558|        |      ;
    dw $1133,$FF01,$0134,$FF01,$9135,$7F01                     ;82B564|        |      ;
    dw $8136,$7F01,$001E,$FF00,$001E,$FF00                     ;82B570|        |      ;
    dw $001E,$FF00,$0037,$FF00,$0037,$FF00                     ;82B57C|        |      ;
    dw $0037,$FF00,$0040,$FF00,$0040,$FF00                     ;82B588|        |      ;
    dw $0040,$FF00,$0149,$FF00,$0052,$7F80                     ;82B594|        |      ;
    dw $0052,$7F80,$0052,$7F80,$0000,$FF00                     ;82B5A0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B5AC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B5B8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B5C4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B5D0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B5DC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B5E8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B5F4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B600|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B60C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B618|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B624|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF01                     ;82B630|        |      ;
    dw $0000,$FF02,$0000,$FF04,$0000,$FF08                     ;82B63C|        |      ;
    dw $0000,$FF10,$0000,$FF21,$0000,$FF41                     ;82B648|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B654|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B660|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B66C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B678|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B684|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B690|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B69C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B6A8|        |      ;
    dw $0000,$FF00,$0001,$FF00,$0002,$FF00                     ;82B6B4|        |      ;
    dw $0003,$FF00,$0004,$FF00,$0005,$FF00                     ;82B6C0|        |      ;
    dw $0006,$FF00,$0007,$FF00,$0008,$FF00                     ;82B6CC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B6D8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B6E4|        |      ;
    dw $0000,$FF00,$03A2,$F301,$001B,$F301                     ;82B6F0|        |      ;
    dw $001C,$F301,$03A4,$F301,$0383,$F201                     ;82B6FC|        |      ;
    dw $03A3,$FF01,$000E,$F301,$0100,$F301                     ;82B708|        |      ;
    dw $041C,$F301,$0000,$FF00,$0000,$FF00                     ;82B714|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B720|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B72C|        |      ;
    dw $0000,$FF00,$0000,$FF01,$0000,$FF01                     ;82B738|        |      ;
    dw $0000,$FF01,$0000,$FF00,$0000,$FF00                     ;82B744|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B750|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B75C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B768|        |      ;
    dw $0000,$7F01,$0101,$FF01,$0002,$FF01                     ;82B774|        |      ;
    dw $0103,$FF01,$0004,$FF00,$0005,$FF00                     ;82B780|        |      ;
    dw $0006,$FF00,$0007,$FF00,$0008,$FF00                     ;82B78C|        |      ;
    dw $0009,$7F01,$000A,$7F01,$000B,$7F01                     ;82B798|        |      ;
    dw $000C,$7F01,$000D,$7F01,$000E,$FF00                     ;82B7A4|        |      ;
    dw $0000,$FF00                                             ;82B7B0|        |      ;
 
sObjectMap2_0x01:
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B7B4|        |      ;
    dw $0000,$FF00,$0400,$FF01,$0000,$FF00                     ;82B7C0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B7CC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B7D8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B7E4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B7F0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B7FC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B808|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B814|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B820|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B82C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B838|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B844|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B850|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B85C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B868|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B874|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B880|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B88C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B898|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B8A4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B8B0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B8BC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B8C8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B8D4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B8E0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B8EC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B8F8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B904|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B910|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B91C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B928|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B934|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B940|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B94C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B958|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B964|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B970|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B97C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B988|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B994|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B9A0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B9AC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B9B8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B9C4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B9D0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B9DC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B9E8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82B9F4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA00|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA0C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA18|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA24|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF01                     ;82BA30|        |      ;
    dw $0000,$FF02,$0000,$FF04,$0000,$FF08                     ;82BA3C|        |      ;
    dw $0000,$FF10,$0000,$FF21,$0000,$FF41                     ;82BA48|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA54|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA60|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA6C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA78|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA84|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA90|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BA9C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BAA8|        |      ;
    dw $1D09,$FF00,$0038,$FF00,$0039,$FF00                     ;82BAB4|        |      ;
    dw $003A,$FF00,$0000,$FF00,$0000,$FF00                     ;82BAC0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BACC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BAD8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BAE4|        |      ;
    dw $0000,$FF00,$017E,$F201,$0389,$F110                     ;82BAF0|        |      ;
    dw $036E,$F110,$0379,$F110,$0379,$F201                     ;82BAFC|        |      ;
    dw $039F,$F201,$0009,$F208,$0384,$FF08                     ;82BB08|        |      ;
    dw $036F,$C201,$0152,$F301,$047E,$F301                     ;82BB14|        |      ;
    dw $048F,$F301,$0000,$FF00,$0000,$FF00                     ;82BB20|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BB2C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BB38|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BB44|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BB50|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BB5C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BB68|        |      ;
    dw $010F,$F208,$0110,$F201,$0111,$FF01                     ;82BB74|        |      ;
    dw $0112,$F208,$0113,$F208,$0000,$FF01                     ;82BB80|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BB8C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BB98|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BBA4|        |      ;
    dw $0000,$FF00                                             ;82BBB0|        |      ;
 
sObjectMap2_0x02:
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BBB4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BBC0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BBCC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BBD8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BBE4|        |      ;
    dw $0000,$FF00,$8078,$FF01,$8079,$FF01                     ;82BBF0|        |      ;
    dw $807A,$FF01,$807B,$FF01,$807C,$FF01                     ;82BBFC|        |      ;
    dw $807D,$FF01,$807E,$FF01,$807F,$FF01                     ;82BC08|        |      ;
    dw $8080,$FF01,$8081,$FF01,$8082,$FF01                     ;82BC14|        |      ;
    dw $8083,$FF01,$8084,$FF01,$8085,$FF01                     ;82BC20|        |      ;
    dw $8086,$FF01,$8087,$FF01,$8088,$FF01                     ;82BC2C|        |      ;
    dw $8089,$FF01,$808A,$FF01,$808B,$FF01                     ;82BC38|        |      ;
    dw $808C,$FF01,$808D,$FF01,$808E,$FF01                     ;82BC44|        |      ;
    dw $808F,$FF01,$809D,$FF01,$8094,$FF01                     ;82BC50|        |      ;
    dw $0090,$FF01,$0091,$FF01,$0092,$FF01                     ;82BC5C|        |      ;
    dw $0093,$FF01,$00EA,$FF00,$0000,$FF01                     ;82BC68|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BC74|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BC80|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BC8C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BC98|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BCA4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BCB0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BCBC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BCC8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BCD4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BCE0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BCEC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BCF8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD04|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD10|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD1C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD28|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD34|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD40|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD4C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD58|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD64|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD70|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD7C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD88|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BD94|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BDA0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BDAC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BDB8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BDC4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BDD0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BDDC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BDE8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BDF4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE00|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE0C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE18|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE24|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF01                     ;82BE30|        |      ;
    dw $0000,$FF02,$0000,$FF04,$0000,$FF08                     ;82BE3C|        |      ;
    dw $0000,$FF10,$0000,$FF21,$0000,$FF41                     ;82BE48|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE54|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE60|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE6C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE78|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE84|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE90|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BE9C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BEA8|        |      ;
    dw $000A,$FF00,$000B,$FF00,$000C,$FF00                     ;82BEB4|        |      ;
    dw $000D,$FF00,$000E,$FF00,$000F,$FF00                     ;82BEC0|        |      ;
    dw $0010,$FF00,$0000,$FF00,$0000,$FF00                     ;82BECC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BED8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BEE4|        |      ;
    dw $0000,$FF00,$0388,$FF01,$0034,$F201                     ;82BEF0|        |      ;
    dw $034D,$F301,$034E,$F301,$034F,$F301                     ;82BEFC|        |      ;
    dw $034C,$F301,$034B,$F301,$034F,$F301                     ;82BF08|        |      ;
    dw $001E,$F301,$037C,$F208,$0000,$FF00                     ;82BF14|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BF20|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0100,$FF00                     ;82BF2C|        |      ;
    dw $0000,$FF00,$0000,$FF01,$0000,$FF01                     ;82BF38|        |      ;
    dw $0000,$FF01,$0000,$FF01,$0000,$FF01                     ;82BF44|        |      ;
    dw $0000,$FF01,$0000,$FF01,$0000,$FF01                     ;82BF50|        |      ;
    dw $0000,$FF01,$0000,$FF01,$0000,$FF01                     ;82BF5C|        |      ;
    dw $0000,$FF01,$0000,$FF01,$0000,$FF00                     ;82BF68|        |      ;
    dw $0114,$FF01,$0115,$FF01,$0016,$FF01                     ;82BF74|        |      ;
    dw $0017,$FF00,$0018,$FF00,$0019,$FF01                     ;82BF80|        |      ;
    dw $001A,$FF00,$001B,$FF01,$0000,$FF00                     ;82BF8C|        |      ;
    dw $0153,$FF01,$0000,$FF00,$0000,$FF00                     ;82BF98|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BFA4|        |      ;
    dw $0000,$FF00                                             ;82BFB0|        |      ;
 
sObjectMap2_0x03:
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BFB4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BFC0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BFCC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BFD8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82BFE4|        |      ;
    dw $0000,$FF00,$0100,$FF00,$0100,$FF00                     ;82BFF0|        |      ;
    dw $00F6,$FF01,$0000,$FF00,$0000,$FF00                     ;82BFFC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C008|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C014|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C020|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C02C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C038|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C044|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C050|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C05C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C068|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C074|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C080|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C08C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C098|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C0A4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C0B0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C0BC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C0C8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C0D4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C0E0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C0EC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C0F8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C104|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C110|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C11C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C128|        |      ;
    dw $0000,$FF00,$0000,$FF00,$80F7,$FF01                     ;82C134|        |      ;
    dw $80F8,$FF01,$80F9,$FF01,$0000,$FF00                     ;82C140|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C14C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C158|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C164|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C170|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C17C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C188|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C194|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C1A0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C1AC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C1B8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C1C4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C1D0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C1DC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C1E8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C1F4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C200|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C20C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C218|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C224|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF01                     ;82C230|        |      ;
    dw $0000,$FF02,$0000,$FF04,$0000,$FF08                     ;82C23C|        |      ;
    dw $0000,$FF10,$0000,$FF21,$0000,$FF41                     ;82C248|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C254|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C260|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C26C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C278|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C284|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C290|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C29C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C2A8|        |      ;
    dw $0011,$FF00,$3312,$FF00,$3313,$FF00                     ;82C2B4|        |      ;
    dw $2D14,$FF00,$2E15,$FF00,$2D16,$FF00                     ;82C2C0|        |      ;
    dw $2D17,$FF00,$2D18,$FF00,$3319,$FF00                     ;82C2CC|        |      ;
    dw $2D1A,$FF00,$0000,$FF00,$0000,$FF00                     ;82C2D8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C2E4|        |      ;
    dw $0000,$FF00,$0033,$F201,$002D,$F201                     ;82C2F0|        |      ;
    dw $002D,$F201,$0388,$FF01,$031C,$F201                     ;82C2FC|        |      ;
    dw $0370,$3F01,$0246,$FF01,$027E,$FF01                     ;82C308|        |      ;
    dw $028B,$FF01,$0000,$FF00,$0000,$FF00                     ;82C314|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C320|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C32C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C338|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C344|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C350|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C35C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C368|        |      ;
    dw $001C,$FF01,$011D,$FF01,$011E,$FF01                     ;82C374|        |      ;
    dw $0151,$F208,$0152,$F208,$014A,$FF01                     ;82C380|        |      ;
    dw $014B,$FF01,$014C,$FF01,$014D,$FF01                     ;82C38C|        |      ;
    dw $014E,$FF01,$014F,$FF01,$0150,$FF01                     ;82C398|        |      ;
    dw $0157,$FF01,$0000,$FF00,$0000,$FF00                     ;82C3A4|        |      ;
    dw $0000,$FF00                                             ;82C3B0|        |      ;
 
sObjectMap2_0x04:
    dw $0000,$FF00,$00DE,$FF00,$00DD,$FF00                     ;82C3B4|        |      ;
    dw $009C,$FF00,$0400,$FF01,$0000,$FF00                     ;82C3C0|        |      ;
    dw $8100,$7F01,$0000,$FF00,$0000,$FF00                     ;82C3CC|        |      ;
    dw $0800,$FF01,$0800,$FF01,$0800,$FF01                     ;82C3D8|        |      ;
    dw $0800,$FF01,$0400,$FF01,$0400,$FF01                     ;82C3E4|        |      ;
    dw $0400,$FF01,$0400,$FF01,$0800,$FF01                     ;82C3F0|        |      ;
    dw $0800,$FF01,$0800,$FF01,$0800,$FF01                     ;82C3FC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C408|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C414|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C420|        |      ;
    dw $0000,$FF00,$0000,$FF00,$00E3,$FF00                     ;82C42C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C438|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C444|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C450|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C45C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C468|        |      ;
    dw $8000,$1F81,$8000,$3F81,$8000,$2F81                     ;82C474|        |      ;
    dw $8000,$4F81,$8000,$4F81,$8100,$7F01                     ;82C480|        |      ;
    dw $8000,$FF01,$8000,$FF01,$0000,$FF00                     ;82C48C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C498|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C4A4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C4B0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C4BC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C4C8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C4D4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C4E0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C4EC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C4F8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C504|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C510|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C51C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C528|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C534|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C540|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C54C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C558|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C564|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C570|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C57C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C588|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C594|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C5A0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C5AC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C5B8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C5C4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C5D0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C5DC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C5E8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C5F4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C600|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C60C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C618|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C624|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF01                     ;82C630|        |      ;
    dw $0000,$FF02,$0000,$FF04,$0000,$FF08                     ;82C63C|        |      ;
    dw $0000,$FF10,$0000,$FF21,$0000,$FF41                     ;82C648|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C654|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C660|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C66C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C678|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C684|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C690|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C69C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C6A8|        |      ;
    dw $001B,$FF00,$331C,$FF01,$001D,$FF00                     ;82C6B4|        |      ;
    dw $001E,$FF00,$001F,$FF00,$0020,$FF00                     ;82C6C0|        |      ;
    dw $0021,$FF00,$0022,$FF00,$0000,$FF00                     ;82C6CC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C6D8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C6E4|        |      ;
    dw $0000,$FF00,$0020,$F301,$0022,$F301                     ;82C6F0|        |      ;
    dw $0033,$F201,$031D,$F301,$001F,$F301                     ;82C6FC|        |      ;
    dw $038C,$F301,$0387,$F301,$0021,$F301                     ;82C708|        |      ;
    dw $002C,$F208,$0381,$F201,$037F,$F208                     ;82C714|        |      ;
    dw $0490,$FF01,$0000,$FF00,$0000,$FF00                     ;82C720|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C72C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C738|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C744|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C750|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C75C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C768|        |      ;
    dw $021F,$FF01,$0020,$FF01,$0021,$FF10                     ;82C774|        |      ;
    dw $0022,$F110,$0223,$F201,$0024,$FF01                     ;82C780|        |      ;
    dw $0025,$FF01,$0141,$FF01,$0000,$FF01                     ;82C78C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C798|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C7A4|        |      ;
    dw $0000,$FF00                                             ;82C7B0|        |      ;
 
sObjectMap2_0x05:
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C7B4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C7C0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C7CC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C7D8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C7E4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C7F0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C7FC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C808|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C814|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C820|        |      ;
    dw $0000,$FF00,$0000,$FF00,$00BD,$FF01                     ;82C82C|        |      ;
    dw $00BF,$FF01,$00DA,$FF01,$0000,$FF00                     ;82C838|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C844|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C850|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C85C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C868|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C874|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C880|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C88C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C898|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C8A4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C8B0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C8BC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C8C8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C8D4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C8E0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C8EC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C8F8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C904|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C910|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C91C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C928|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C934|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C940|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C94C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C958|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C964|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C970|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C97C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C988|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C994|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C9A0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C9AC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C9B8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C9C4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C9D0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C9DC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C9E8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82C9F4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA00|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA0C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA18|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA24|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF01                     ;82CA30|        |      ;
    dw $0000,$FF02,$0000,$FF04,$0000,$FF08                     ;82CA3C|        |      ;
    dw $0000,$FF10,$0000,$FF21,$0000,$FF41                     ;82CA48|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA54|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA60|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA6C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA78|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA84|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA90|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CA9C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CAA8|        |      ;
    dw $0023,$FF00,$0024,$FF00,$0025,$FF00                     ;82CAB4|        |      ;
    dw $0026,$FF00,$0027,$FF00,$0028,$FF00                     ;82CAC0|        |      ;
    dw $0029,$FF00,$002A,$FF00,$002B,$FF00                     ;82CACC|        |      ;
    dw $002C,$FF00,$002D,$FF00,$0000,$FF00                     ;82CAD8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CAE4|        |      ;
    dw $0000,$FF00,$0024,$F208,$0025,$F208                     ;82CAF0|        |      ;
    dw $0026,$F208,$0382,$F201,$037D,$F201                     ;82CAFC|        |      ;
    dw $036F,$C201,$0386,$F208,$0385,$F208                     ;82CB08|        |      ;
    dw $03A5,$F301,$03A1,$FF01,$0027,$F208                     ;82CB14|        |      ;
    dw $037B,$FF01,$0379,$FF01,$037F,$F201                     ;82CB20|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CB2C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CB38|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CB44|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CB50|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CB5C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CB68|        |      ;
    dw $0126,$F201,$0127,$3201,$0128,$2201                     ;82CB74|        |      ;
    dw $0129,$2201,$012A,$1201,$012B,$1201                     ;82CB80|        |      ;
    dw $012C,$3F01,$012D,$F208,$012E,$FF01                     ;82CB8C|        |      ;
    dw $012F,$FF01,$0130,$FF01,$0131,$FF01                     ;82CB98|        |      ;
    dw $0132,$FF01,$0154,$FF01,$0155,$FF10                     ;82CBA4|        |      ;
    dw $0000,$FF00                                             ;82CBB0|        |      ;
 
sObjectMap2_0x06:
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CBB4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CBC0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CBCC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CBD8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CBE4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CBF0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CBFC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC08|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC14|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC20|        |      ;
    dw $0000,$FF00,$0000,$FF00,$00D2,$FF01                     ;82CC2C|        |      ;
    dw $00D3,$FF01,$00C6,$FF01,$0000,$FF00                     ;82CC38|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC44|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC50|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC5C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC68|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC74|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC80|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC8C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CC98|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CCA4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CCB0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CCBC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CCC8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CCD4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CCE0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CCEC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CCF8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD04|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD10|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD1C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD28|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD34|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD40|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD4C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD58|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD64|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD70|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD7C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD88|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CD94|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CDA0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CDAC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CDB8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CDC4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CDD0|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CDDC|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CDE8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CDF4|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE00|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE0C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE18|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE24|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF01                     ;82CE30|        |      ;
    dw $0000,$FF02,$0000,$FF04,$0000,$FF08                     ;82CE3C|        |      ;
    dw $0000,$FF10,$0000,$FF21,$0000,$FF41                     ;82CE48|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE54|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE60|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE6C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE78|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE84|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE90|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CE9C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CEA8|        |      ;
    dw $002E,$FF00,$002F,$FF00,$0030,$FF00                     ;82CEB4|        |      ;
    dw $0031,$FF00,$0032,$FF00,$0033,$FF00                     ;82CEC0|        |      ;
    dw $0034,$FF00,$0035,$FF00,$0036,$FF00                     ;82CECC|        |      ;
    dw $0037,$FF00,$0000,$FF00,$0000,$FF00                     ;82CED8|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CEE4|        |      ;
    dw $0000,$FF00,$03A1,$FF01,$0029,$F208                     ;82CEF0|        |      ;
    dw $0376,$FF08,$0370,$FF08,$0378,$F208                     ;82CEFC|        |      ;
    dw $036F,$C201,$0388,$FF01,$002A,$F208                     ;82CF08|        |      ;
    dw $037E,$F208,$0028,$F208,$0377,$FF08                     ;82CF14|        |      ;
    dw $037F,$F208,$002B,$F208,$0380,$FF01                     ;82CF20|        |      ;
    dw $0382,$F201,$038B,$F201,$0000,$FF00                     ;82CF2C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CF38|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CF44|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CF50|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CF5C|        |      ;
    dw $0000,$FF00,$0000,$FF00,$0000,$FF00                     ;82CF68|        |      ;
    dw $0133,$F201,$0134,$FF01,$0135,$FF01                     ;82CF74|        |      ;
    dw $0136,$F208,$0137,$F401,$0138,$F401                     ;82CF80|        |      ;
    dw $0139,$F401,$013A,$F201,$013B,$F201                     ;82CF8C|        |      ;
    dw $013C,$F201,$013D,$F201,$013E,$F201                     ;82CF98|        |      ;
    dw $013F,$F201,$0140,$FF01,$0000,$FF00                     ;82CFA4|        |      ;
    dw $0000,$FF00                                             ;82CFB0|        |      ;
 
aInteractionItemTable:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82CFB4|        |      ; 8b, 8b, 8b, 8b - season subindexed
    db $09,$09,$0A,$00,$0D,$0D,$0D,$0E,$0F,$0F,$0F,$0F         ;82CFC0|        |      ;
    db $0B,$0B,$0B,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82CFCC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82CFD8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82CFE4|        |      ;
    db $00,$00,$00,$00,$2A,$2A,$2A,$2A,$2B,$2B,$2B,$2B         ;82CFF0|        |      ;
    db $2C,$2C,$2C,$2C,$2D,$2D,$2D,$2D,$2E,$2E,$2E,$2E         ;82CFFC|        |      ;
    db $2F,$2F,$2F,$2F,$30,$30,$30,$30,$31,$31,$31,$31         ;82D008|        |      ;
    db $32,$32,$32,$32,$33,$33,$33,$33,$34,$34,$34,$34         ;82D014|        |      ;
    db $35,$35,$35,$35,$36,$36,$36,$36,$37,$37,$37,$37         ;82D020|        |      ;
    db $38,$38,$38,$38,$39,$39,$39,$39,$3A,$3A,$3A,$3A         ;82D02C|        |      ;
    db $3B,$3B,$3B,$3B,$3C,$3C,$3C,$3C,$3D,$3D,$3D,$3D         ;82D038|        |      ;
    db $3E,$3E,$3E,$3E,$3F,$3F,$3F,$3F,$40,$40,$40,$40         ;82D044|        |      ;
    db $41,$41,$41,$41,$42,$42,$42,$42,$43,$43,$43,$43         ;82D050|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D05C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D068|        |      ;
    db $03,$00,$00,$00,$19,$19,$00,$00,$00,$04,$00,$00         ;82D074|        |      ;
    db $00,$00,$01,$00,$00,$00,$02,$00,$0C,$0C,$0C,$00         ;82D080|        |      ;
    db $18,$18,$18,$18,$00,$00,$05,$00,$11,$11,$11,$11         ;82D08C|        |      ;
    db $11,$11,$11,$11,$00,$00,$00,$00,$00,$00,$00,$00         ;82D098|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D0A4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D0B0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D0BC|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D0C8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D0D4|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D0E0|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D0EC|        |      ;
    db $00,$00,$00,$00,$10,$10,$10,$10,$10,$10,$10,$10         ;82D0F8|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D104|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D110|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D11C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D128|        |      ;
    db $12,$12,$12,$12,$12,$12,$12,$12,$1C,$1C,$1C,$1C         ;82D134|        |      ;
    db $1B,$1B,$1B,$1B,$1D,$1D,$1D,$1D,$00,$00,$00,$00         ;82D140|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D14C|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00         ;82D158|        |      ;
    db $00,$00,$00,$00,$00,$00,$00,$00,$13,$13,$13,$13         ;82D164|        |      ;
    db $13,$13,$13,$13,$44,$44,$44,$44,$45,$45,$45,$45         ;82D170|        |      ;
    db $46,$46,$46,$46,$47,$47,$47,$47,$48,$48,$48,$48         ;82D17C|        |      ;
    db $49,$49,$49,$49,$4A,$4A,$4A,$4A,$4B,$4B,$4B,$4B         ;82D188|        |      ;
    db $4C,$4C,$4C,$4C,$4D,$4D,$4D,$4D,$4E,$4E,$4E,$4E         ;82D194|        |      ;
    db $4F,$4F,$4F,$4F,$50,$50,$50,$50,$51,$51,$51,$51         ;82D1A0|        |      ;
    db $52,$52,$52,$52,$53,$53,$53,$53,$54,$54,$54,$54         ;82D1AC|        |      ;
    db $55,$55,$55,$55,$56,$56,$56,$56                         ;82D1B8|        |      ;
 
fUnknown_82D1C0:
    SEP #$20                                                   ;82D1C0|E220    |      ; GIGASTART
    REP #$10                                                   ;82D1C2|C210    |      ;
    LDA.B #$0F                                                 ;82D1C4|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82D1C6|8592    |000092;
    LDA.B #$03                                                 ;82D1C8|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D1CA|8593    |000093;
    LDA.B #$01                                                 ;82D1CC|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82D1CE|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82D1D0|220A8880|80880A;
    SEP #$20                                                   ;82D1D4|E220    |      ;
    LDA.B #$06                                                 ;82D1D6|A906    |      ;
    STA.L nCurrentTimeID                                       ;82D1D8|8F1C1F7F|7F1F1C;
    LDA.B #$00                                                 ;82D1DC|A900    |      ;
    STA.L nInGameHourCounter                                   ;82D1DE|8F1D1F7F|7F1F1D;
    LDA.B #$00                                                 ;82D1E2|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;82D1E4|8F1E1F7F|7F1F1E;
    LDA.B #$01                                                 ;82D1E8|A901    |      ;
    STA.B strcVariables.n8Temp4                                ;82D1EA|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82D1EC|6494    |000094;
    REP #$20                                                   ;82D1EE|C220    |      ;
    LDA.W #$0000                                               ;82D1F0|A90000  |      ;
    STA.L strcFlags.daily1                                     ;82D1F3|8F5A1F7F|7F1F5A;
    LDA.W #$0000                                               ;82D1F7|A90000  |      ;
    STA.L strcFlags.daily2                                     ;82D1FA|8F5C1F7F|7F1F5C;
    LDA.W #$0000                                               ;82D1FE|A90000  |      ;
    STA.L strcFlags.daily3                                     ;82D201|8F5E1F7F|7F1F5E;
    LDA.W #$0000                                               ;82D205|A90000  |      ;
    STA.L strcFlags.daily4                                     ;82D208|8F601F7F|7F1F60;
    LDA.W #$0000                                               ;82D20C|A90000  |      ;
    STA.L strcFlags.unknown1                                   ;82D20F|8F741F7F|7F1F74;
    STA.L strcFlags.unknown2                                   ;82D213|8F761F7F|7F1F76;
    STA.L strcFlags.unknown3                                   ;82D217|8F781F7F|7F1F78;
    LDA.W #$0108                                               ;82D21B|A90801  |      ;
    STA.L strcFlags.daily4                                     ;82D21E|8F601F7F|7F1F60;
    REP #$20                                                   ;82D222|C220    |      ;
    LDA.W #$0000                                               ;82D224|A90000  |      ;
    STA.L strcFlags.event1                                     ;82D227|8F641F7F|7F1F64;
    LDA.W #$0000                                               ;82D22B|A90000  |      ;
    STA.L strcFlags.event2                                     ;82D22E|8F661F7F|7F1F66;
    LDA.W #$0000                                               ;82D232|A90000  |      ;
    STA.L strcFlags.event3                                     ;82D235|8F681F7F|7F1F68;
    LDA.W #$0000                                               ;82D239|A90000  |      ;
    STA.L strcFlags.event4                                     ;82D23C|8F6A1F7F|7F1F6A;
    LDA.W #$0000                                               ;82D240|A90000  |      ;
    STA.L strcFlags.event5                                     ;82D243|8F6C1F7F|7F1F6C;
    LDA.W #$0000                                               ;82D247|A90000  |      ;
    STA.L strcFlags.event6                                     ;82D24A|8F6E1F7F|7F1F6E;
    LDA.W #$0000                                               ;82D24E|A90000  |      ;
    STA.L strcFlags.event7                                     ;82D251|8F701F7F|7F1F70;
    LDA.W #$0000                                               ;82D255|A90000  |      ;
    STA.L strcFlags.event8                                     ;82D258|8F721F7F|7F1F72;
    SEP #$20                                                   ;82D25C|E220    |      ;
    LDA.B #$00                                                 ;82D25E|A900    |      ;
    STA.L nIntroHowToPlayIndex2                                ;82D260|8F491F7F|7F1F49;
    SEP #$20                                                   ;82D264|E220    |      ;
    LDA.B #$8F                                                 ;82D266|A98F    |      ;
    STA.L strcShedItems.row1                                   ;82D268|8F001F7F|7F1F00;
    LDA.B #$88                                                 ;82D26C|A988    |      ;
    STA.L strcShedItems.row2                                   ;82D26E|8F011F7F|7F1F01;
    LDA.B #$00                                                 ;82D272|A900    |      ;
    STA.L strcShedItems.row3                                   ;82D274|8F021F7F|7F1F02;
    LDA.B #$00                                                 ;82D278|A900    |      ;
    STA.L strcShedItems.row4                                   ;82D27A|8F031F7F|7F1F03;
    STZ.W strcPlayerData.toolEquipped                          ;82D27E|9C2109  |000921;
    STZ.W strcPlayerData.toolSecond                            ;82D281|9C2309  |000923;
    LDA.B #$01                                                 ;82D284|A901    |      ;
    STA.W strcPlayerData.leftGrassSeeds                        ;82D286|8D2709  |000927;
    STA.W strcPlayerData.leftTurnipSeeds                       ;82D289|8D2B09  |00092B;
    STA.W strcPlayerData.leftCornSeeds                         ;82D28C|8D2809  |000928;
    STA.W strcPlayerData.leftTomatoSeeds                       ;82D28F|8D2909  |000929;
    REP #$20                                                   ;82D292|C220    |      ;
    STZ.W strcObjectData.exist                                 ;82D294|9C1509  |000915;
    STZ.B strcPlayer.flags                                     ;82D297|64D2    |0000D2;
    STZ.B strcPlayer.action                                    ;82D299|64D4    |0000D4;
    SEP #$20                                                   ;82D29B|E220    |      ;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;82D2BC|C230    |      ;
    LDA.W #$0000                                               ;82D2BE|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;82D2C1|8D0109  |000901;
    SEP #$20                                                   ;82D2C4|E220    |      ;
    STZ.W nTimeState                                           ;82D2C6|9C7309  |000973;
    LDA.B #$00                                                 ;82D2C9|A900    |      ;
    STA.L nCurrentSeasonID                                     ;82D2CB|8F191F7F|7F1F19;
    SEP #$20                                                   ;82D2CF|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;82D2D1|9C1D09  |00091D;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    REP #$30                                                   ;82D2E0|C230    |      ;
    STZ.W strcPlayerData.placedCowFeedFlags                    ;82D2E2|9C3209  |000932;
    STZ.W strcPlayerData.placedChickenFeedFlags                ;82D2E5|9C3409  |000934;
    %UnsetFlag(daily2, $0004)
    JSL.L fCore_ZeroVRAM                                       ;82D2F3|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;82D2F7|22808980|808980;
    JSL.L fCore_Zero0x42Ptr                                    ;82D2FB|22AB8F80|808FAB;
    JSL.L fUnknown_Zero7EA220                                  ;82D2FF|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82D303|220F8285|85820F;
    JSL.L fUnknown_Zero07Ptr                                   ;82D307|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;82D30B|22008084|848000;
    JSL.L fObjectMap_LoadDefaultFarm                           ;82D30F|225AA682|82A65A;
    REP #$20                                                   ;82D313|C220    |      ;
    LDA.W #$0100                                               ;82D315|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;82D318|8D4601  |000146;
    REP #$30                                                   ;82D31B|C230    |      ;
    %AIExecute($0000, $0047, $0000)
    JSL.L fAI_HowToPlaySetup                                   ;82D32A|226F8184|84816F;
    SEP #$20                                                   ;82D32E|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D330|AD8B09  |00098B;
    STA.B strcMap.loadAreaId                                   ;82D333|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82D335|22DE9580|8095DE;
    SEP #$20                                                   ;82D339|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D33B|AD8B09  |00098B;
    JSL.L fMap_SetupArea                                       ;82D33E|222C9780|80972C;
    REP #$30                                                   ;82D342|C230    |      ;
    LDY.W #$0000                                               ;82D344|A00000  |      ;
 
  - REP #$20                                                   ;82D347|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82D349|6490    |000090;
    SEP #$20                                                   ;82D34B|E220    |      ;
    LDA.B $00                                                  ;82D34D|A500    |000000;
    BEQ -                                                      ;82D34F|F0F6    |82D347;
    REP #$20                                                   ;82D351|C220    |      ;
    LDA.W #$1800                                               ;82D353|A90018  |      ;
    STA.B $C7                                                  ;82D356|85C7    |0000C7;
    JSL.L fAudioEngine_MapChangeHandler                        ;82D358|22719680|809671;
    JSL.L fMapChangeHandler_809A64                             ;82D35C|22649A80|809A64;
    JSL.L fGame_TimeHandler                                    ;82D360|22008082|828000;
    JSL.L fDialog_IterateText                                  ;82D364|221C9583|83951C;
    JSL.L fPallete_ChangeHandler                               ;82D368|220C9080|80900C;
    JSL.L fCore_Unknown808E69                                  ;82D36C|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82D370|2234C084|84C034;
    JSL.L fUnknown_81A383                                      ;82D374|2283A381|81A383;
    JSL.L fUnknownSubrutineHandler_81BFB7                      ;82D378|22B7BF81|81BFB7;
    JSL.L fGraphics_MapScrool                                  ;82D37C|22B39580|8095B3;
    JSL.L fAI_HowToPlaySetup                                   ;82D380|226F8184|84816F;
    JSL.L fUnknownCF_81A600                                    ;82D384|2200A681|81A600;
    JSL.L fObject_Unknown8582C7                                ;82D388|22C78285|8582C7;
    JSL.L fUnknown_858CB2                                      ;82D38C|22B28C85|858CB2;
    JSL.L fUnknown_8583E0                                      ;82D390|22E08385|8583E0;
    REP #$20                                                   ;82D394|C220    |      ;
    %CheckFlag(daily2, $0004)
    BNE +                                                      ;82D39D|D007    |82D3A6;
    SEP #$20                                                   ;82D39F|E220    |      ;
    STZ.B $00                                                  ;82D3A1|6400    |000000;
    JMP.W $D347                                                ;82D3A3|4C47D3  |82D347;
 
 
  + REP #$30                                                   ;82D3A6|C230    |      ;
    LDX.W #$0000                                               ;82D3A8|A20000  |      ;
 
  - SEP #$20                                                   ;82D3AB|E220    |      ;
    LDA.B #$00                                                 ;82D3AD|A900    |      ;
    STA.L strcChickenData,X                                    ;82D3AF|9F86C27E|7EC286;
    INX                                                        ;82D3B3|E8      |      ;
    CPX.W #$0008                                               ;82D3B4|E00800  |      ;
    BNE -                                                      ;82D3B7|D0F2    |82D3AB;
    SEP #$20                                                   ;82D3B9|E220    |      ;
    LDA.B #$09                                                 ;82D3BB|A909    |      ;
    STA.B strcVariables.n8Temp4                                ;82D3BD|8595    |000095;
    REP #$20                                                   ;82D3BF|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82D3C1|6490    |000090;
    JML.L fUnknown_82D871                                      ;82D3C3|5C71D882|82D871;
 
 
fMainMenu_AutoHowToPlay:
    SEP #$20                                                   ;82D3C7|E220    |      ;
    REP #$10                                                   ;82D3C9|C210    |      ;
    LDA.B #$0F                                                 ;82D3CB|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82D3CD|8592    |000092;
    LDA.B #$03                                                 ;82D3CF|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D3D1|8593    |000093;
    LDA.B #$01                                                 ;82D3D3|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82D3D5|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82D3D7|220A8880|80880A;
    SEP #$20                                                   ;82D3DB|E220    |      ;
    LDA.B #$06                                                 ;82D3DD|A906    |      ;
    STA.L nCurrentTimeID                                       ;82D3DF|8F1C1F7F|7F1F1C;
    LDA.B #$00                                                 ;82D3E3|A900    |      ;
    STA.L nInGameHourCounter                                   ;82D3E5|8F1D1F7F|7F1F1D;
    LDA.B #$00                                                 ;82D3E9|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;82D3EB|8F1E1F7F|7F1F1E;
    LDA.B #$01                                                 ;82D3EF|A901    |      ;
    STA.B strcVariables.n8Temp4                                ;82D3F1|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82D3F3|6494    |000094;
    REP #$20                                                   ;82D3F5|C220    |      ;
    LDA.W #$0000                                               ;82D3F7|A90000  |      ;
    STA.L strcFlags.daily1                                     ;82D3FA|8F5A1F7F|7F1F5A;
    LDA.W #$0000                                               ;82D3FE|A90000  |      ;
    STA.L strcFlags.daily2                                     ;82D401|8F5C1F7F|7F1F5C;
    LDA.W #$0000                                               ;82D405|A90000  |      ;
    STA.L strcFlags.daily3                                     ;82D408|8F5E1F7F|7F1F5E;
    LDA.W #$0000                                               ;82D40C|A90000  |      ;
    STA.L strcFlags.daily4                                     ;82D40F|8F601F7F|7F1F60;
    LDA.W #$0000                                               ;82D413|A90000  |      ;
    STA.L strcFlags.unknown1                                   ;82D416|8F741F7F|7F1F74;
    STA.L strcFlags.unknown2                                   ;82D41A|8F761F7F|7F1F76;
    STA.L strcFlags.unknown3                                   ;82D41E|8F781F7F|7F1F78;
    LDA.W #$0008                                               ;82D422|A90800  |      ;
    STA.L strcFlags.daily4                                     ;82D425|8F601F7F|7F1F60;
    REP #$20                                                   ;82D429|C220    |      ;
    LDA.W #$0000                                               ;82D42B|A90000  |      ;
    STA.L strcFlags.event1                                     ;82D42E|8F641F7F|7F1F64;
    LDA.W #$0000                                               ;82D432|A90000  |      ;
    STA.L strcFlags.event2                                     ;82D435|8F661F7F|7F1F66;
    LDA.W #$0000                                               ;82D439|A90000  |      ;
    STA.L strcFlags.event3                                     ;82D43C|8F681F7F|7F1F68;
    LDA.W #$0000                                               ;82D440|A90000  |      ;
    STA.L strcFlags.event4                                     ;82D443|8F6A1F7F|7F1F6A;
    LDA.W #$0000                                               ;82D447|A90000  |      ;
    STA.L strcFlags.event5                                     ;82D44A|8F6C1F7F|7F1F6C;
    LDA.W #$0000                                               ;82D44E|A90000  |      ;
    STA.L strcFlags.event6                                     ;82D451|8F6E1F7F|7F1F6E;
    LDA.W #$0000                                               ;82D455|A90000  |      ;
    STA.L strcFlags.event7                                     ;82D458|8F701F7F|7F1F70;
    LDA.W #$0000                                               ;82D45C|A90000  |      ;
    STA.L strcFlags.event8                                     ;82D45F|8F721F7F|7F1F72;
    SEP #$20                                                   ;82D463|E220    |      ;
    LDA.B #$8F                                                 ;82D465|A98F    |      ;
    STA.L strcShedItems.row1                                   ;82D467|8F001F7F|7F1F00;
    LDA.B #$EC                                                 ;82D46B|A9EC    |      ;
    STA.L strcShedItems.row2                                   ;82D46D|8F011F7F|7F1F01;
    LDA.B #$00                                                 ;82D471|A900    |      ;
    STA.L strcShedItems.row3                                   ;82D473|8F021F7F|7F1F02;
    LDA.B #$00                                                 ;82D477|A900    |      ;
    STA.L strcShedItems.row4                                   ;82D479|8F031F7F|7F1F03;
    STZ.W strcPlayerData.toolEquipped                          ;82D47D|9C2109  |000921;
    STZ.W strcPlayerData.toolSecond                            ;82D480|9C2309  |000923;
    LDA.B #$01                                                 ;82D483|A901    |      ;
    STA.W strcPlayerData.leftGrassSeeds                        ;82D485|8D2709  |000927;
    STA.W strcPlayerData.leftTurnipSeeds                       ;82D488|8D2B09  |00092B;
    REP #$20                                                   ;82D48B|C220    |      ;
    STZ.W strcAiControlData.input                              ;82D48D|9CFD08  |0008FD;
    STZ.W strcAiControlData.counter                            ;82D490|9CFF08  |0008FF;
    REP #$20                                                   ;82D493|C220    |      ;
    STZ.W strcObjectData.exist                                 ;82D495|9C1509  |000915;
    STZ.B strcPlayer.flags                                     ;82D498|64D2    |0000D2;
    STZ.B strcPlayer.action                                    ;82D49A|64D4    |0000D4;
    SEP #$20                                                   ;82D49C|E220    |      ;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;82D4BD|C230    |      ;
    LDA.W #$0000                                               ;82D4BF|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;82D4C2|8D0109  |000901;
    SEP #$20                                                   ;82D4C5|E220    |      ;
    STZ.W nTimeState                                           ;82D4C7|9C7309  |000973;
    LDA.B #$00                                                 ;82D4CA|A900    |      ;
    STA.L nCurrentSeasonID                                     ;82D4CC|8F191F7F|7F1F19;
    SEP #$20                                                   ;82D4D0|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;82D4D2|9C1D09  |00091D;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    REP #$30                                                   ;82D4E1|C230    |      ;
    STZ.W strcPlayerData.placedCowFeedFlags                    ;82D4E3|9C3209  |000932;
    STZ.W strcPlayerData.placedChickenFeedFlags                ;82D4E6|9C3409  |000934;
    %UnsetFlag(daily2, $0004)
    JSL.L fCore_ZeroVRAM                                       ;82D4F4|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;82D4F8|22808980|808980;
    JSL.L fCore_Zero0x42Ptr                                    ;82D4FC|22AB8F80|808FAB;
    JSL.L fUnknown_Zero7EA220                                  ;82D500|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82D504|220F8285|85820F;
    JSL.L fUnknown_Zero07Ptr                                   ;82D508|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;82D50C|22008084|848000;
    JSL.L fObjectMap_LoadDefaultFarm                           ;82D510|225AA682|82A65A;
    REP #$20                                                   ;82D514|C220    |      ;
    LDA.W #$0100                                               ;82D516|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;82D519|8D4601  |000146;
    SEP #$20                                                   ;82D51C|E220    |      ;
    LDA.L nIntroHowToPlayIndex                                 ;82D51E|AF481F7F|7F1F48;
    BNE +                                                      ;82D522|D003    |82D527;
    JMP.W .howToPlay_default                                   ;82D524|4C74D5  |82D574;
 
 
  + CMP.B #$01                                                 ;82D527|C901    |      ;
    BNE +                                                      ;82D529|D003    |82D52E;
    JMP.W .howToPlay01                                         ;82D52B|4C8ED5  |82D58E;
 
 
  + CMP.B #$02                                                 ;82D52E|C902    |      ;
    BNE +                                                      ;82D530|D003    |82D535;
    JMP.W .howToPlay02                                         ;82D532|4CA8D5  |82D5A8;
 
 
  + CMP.B #$03                                                 ;82D535|C903    |      ;
    BNE +                                                      ;82D537|D003    |82D53C;
    JMP.W .howToPlay03                                         ;82D539|4CC2D5  |82D5C2;
 
 
  + CMP.B #$04                                                 ;82D53C|C904    |      ;
    BNE +                                                      ;82D53E|D003    |82D543;
    JMP.W .howToPlay04                                         ;82D540|4CDCD5  |82D5DC;
 
 
  + CMP.B #$05                                                 ;82D543|C905    |      ;
    BNE +                                                      ;82D545|D003    |82D54A;
    JMP.W .howToPlay05                                         ;82D547|4CF6D5  |82D5F6;
 
 
  + CMP.B #$06                                                 ;82D54A|C906    |      ;
    BNE +                                                      ;82D54C|D003    |82D551;
    JMP.W .howToPlay06                                         ;82D54E|4C10D6  |82D610;
 
 
  + CMP.B #$07                                                 ;82D551|C907    |      ;
    BNE +                                                      ;82D553|D003    |82D558;
    JMP.W .howToPlay07                                         ;82D555|4C2AD6  |82D62A;
 
 
  + CMP.B #$08                                                 ;82D558|C908    |      ;
    BNE +                                                      ;82D55A|D003    |82D55F;
    JMP.W .howToPlay08                                         ;82D55C|4C44D6  |82D644;
 
 
  + CMP.B #$09                                                 ;82D55F|C909    |      ;
    BNE +                                                      ;82D561|D003    |82D566;
    JMP.W .howToPlay09                                         ;82D563|4C5ED6  |82D65E;
 
 
  + CMP.B #$0A                                                 ;82D566|C90A    |      ;
    BNE +                                                      ;82D568|D003    |82D56D;
    JMP.W .howToPlay0A                                         ;82D56A|4C78D6  |82D678;
 
 
  + CMP.B #$0B                                                 ;82D56D|C90B    |      ;
    BNE .howToPlay_default                                     ;82D56F|D003    |82D574;
    JMP.W .howToPlay0B                                         ;82D571|4C92D6  |82D692;
 
 
.howToPlay_default:
    REP #$30                                                   ;82D574|C230    |      ;
    %AIExecute($0000, $0047, $0002)
    SEP #$20                                                   ;82D583|E220    |      ;
    LDA.B #$01                                                 ;82D585|A901    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D587|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D58B|4CACD6  |82D6AC;
 
 
.howToPlay01:
    REP #$30                                                   ;82D58E|C230    |      ;
    %AIExecute($0000, $0047, $0004)
    SEP #$20                                                   ;82D59D|E220    |      ;
    LDA.B #$02                                                 ;82D59F|A902    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D5A1|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D5A5|4CACD6  |82D6AC;
 
 
.howToPlay02:
    REP #$30                                                   ;82D5A8|C230    |      ;
    %AIExecute($0000, $0047, $0006)
    SEP #$20                                                   ;82D5B7|E220    |      ;
    LDA.B #$03                                                 ;82D5B9|A903    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D5BB|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D5BF|4CACD6  |82D6AC;
 
 
.howToPlay03:
    REP #$30                                                   ;82D5C2|C230    |      ;
    %AIExecute($0000, $0047, $0007)
    SEP #$20                                                   ;82D5D1|E220    |      ;
    LDA.B #$04                                                 ;82D5D3|A904    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D5D5|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D5D9|4CACD6  |82D6AC;
 
 
.howToPlay04:
    REP #$30                                                   ;82D5DC|C230    |      ;
    %AIExecute($0000, $0047, $0009)
    SEP #$20                                                   ;82D5EB|E220    |      ;
    LDA.B #$05                                                 ;82D5ED|A905    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D5EF|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D5F3|4CACD6  |82D6AC;
 
 
.howToPlay05:
    REP #$30                                                   ;82D5F6|C230    |      ;
    %AIExecute($0000, $0047, $000B)
    SEP #$20                                                   ;82D605|E220    |      ;
    LDA.B #$06                                                 ;82D607|A906    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D609|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D60D|4CACD6  |82D6AC;
 
 
.howToPlay06:
    REP #$30                                                   ;82D610|C230    |      ;
    %AIExecute($0000, $0047, $000D)
    SEP #$20                                                   ;82D61F|E220    |      ;
    LDA.B #$07                                                 ;82D621|A907    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D623|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D627|4CACD6  |82D6AC;
 
 
.howToPlay07:
    REP #$30                                                   ;82D62A|C230    |      ;
    %AIExecute($0000, $0047, $0011)
    SEP #$20                                                   ;82D639|E220    |      ;
    LDA.B #$08                                                 ;82D63B|A908    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D63D|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D641|4CACD6  |82D6AC;
 
 
.howToPlay08:
    REP #$30                                                   ;82D644|C230    |      ;
    %AIExecute($0000, $0047, $0015)
    SEP #$20                                                   ;82D653|E220    |      ;
    LDA.B #$09                                                 ;82D655|A909    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D657|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D65B|4CACD6  |82D6AC;
 
 
.howToPlay09:
    REP #$30                                                   ;82D65E|C230    |      ;
    %AIExecute($0000, $0047, $0017)
    SEP #$20                                                   ;82D66D|E220    |      ;
    LDA.B #$0A                                                 ;82D66F|A90A    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D671|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D675|4CACD6  |82D6AC;
 
 
.howToPlay0A:
    REP #$30                                                   ;82D678|C230    |      ;
    %AIExecute($0000, $0047, $0019)
    SEP #$20                                                   ;82D687|E220    |      ;
    LDA.B #$0B                                                 ;82D689|A90B    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D68B|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D68F|4CACD6  |82D6AC;
 
 
.howToPlay0B:
    REP #$30                                                   ;82D692|C230    |      ;
    %AIExecute($0000, $0047, $001B)
    SEP #$20                                                   ;82D6A1|E220    |      ;
    LDA.B #$00                                                 ;82D6A3|A900    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D6A5|8F481F7F|7F1F48;
    JMP.W fMainMenu_PrepareHowToPlay                           ;82D6A9|4CACD6  |82D6AC;
 
 
fMainMenu_PrepareHowToPlay:
    JSL.L fAI_HowToPlaySetup                                   ;82D6AC|226F8184|84816F;
    SEP #$20                                                   ;82D6B0|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D6B2|AD8B09  |00098B;
    STA.B strcMap.loadAreaId                                   ;82D6B5|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82D6B7|22DE9580|8095DE;
    SEP #$20                                                   ;82D6BB|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D6BD|AD8B09  |00098B;
    JSL.L fMap_SetupArea                                       ;82D6C0|222C9780|80972C;
    REP #$30                                                   ;82D6C4|C230    |      ;
    LDY.W #$0000                                               ;82D6C6|A00000  |      ;
 
  - REP #$20                                                   ;82D6C9|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82D6CB|6490    |000090;
    SEP #$20                                                   ;82D6CD|E220    |      ;
    LDA.B $00                                                  ;82D6CF|A500    |000000;
    BEQ -                                                      ;82D6D1|F0F6    |82D6C9;
    REP #$20                                                   ;82D6D3|C220    |      ;
    LDA.W #$1800                                               ;82D6D5|A90018  |      ;
    STA.B $C7                                                  ;82D6D8|85C7    |0000C7;
    JSL.L fAudioEngine_MapChangeHandler                        ;82D6DA|22719680|809671;
    JSL.L fMapChangeHandler_809A64                             ;82D6DE|22649A80|809A64;
    JSL.L fGame_TimeHandler                                    ;82D6E2|22008082|828000;
    JSL.L fDialog_IterateText                                  ;82D6E6|221C9583|83951C;
    JSL.L fPallete_ChangeHandler                               ;82D6EA|220C9080|80900C;
    JSL.L fCore_Unknown808E69                                  ;82D6EE|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82D6F2|2234C084|84C034;
    JSL.L fUnknown_81A383                                      ;82D6F6|2283A381|81A383;
    JSL.L fUnknownSubrutineHandler_81BFB7                      ;82D6FA|22B7BF81|81BFB7;
    JSL.L fGraphics_MapScrool                                  ;82D6FE|22B39580|8095B3;
    JSL.L fAI_HowToPlaySetup                                   ;82D702|226F8184|84816F;
    JSL.L fUnknownCF_81A600                                    ;82D706|2200A681|81A600;
    JSL.L fObject_Unknown8582C7                                ;82D70A|22C78285|8582C7;
    JSL.L fUnknown_858CB2                                      ;82D70E|22B28C85|858CB2;
    JSL.L fUnknown_8583E0                                      ;82D712|22E08385|8583E0;
    REP #$20                                                   ;82D716|C220    |      ;
    %CheckFlag(daily2, $0004)
    BNE fUnknown_82D731                                        ;82D71F|D010    |82D731;
    %CheckFlag(daily4, $0080)
    BNE fUnknown_82D731                                        ;82D728|D007    |82D731;
    SEP #$20                                                   ;82D72A|E220    |      ;
    STZ.B $00                                                  ;82D72C|6400    |000000;
    JMP.W $D6C9                                                ;82D72E|4CC9D6  |82D6C9;
 
 
fUnknown_82D731:
    REP #$30                                                   ;82D731|C230    |      ;
    LDX.W #$0000                                               ;82D733|A20000  |      ;
 
  - SEP #$20                                                   ;82D736|E220    |      ;
    LDA.B #$00                                                 ;82D738|A900    |      ;
    STA.L strcChickenData,X                                    ;82D73A|9F86C27E|7EC286;
    INX                                                        ;82D73E|E8      |      ;
    CPX.W #$0008                                               ;82D73F|E00800  |      ;
    BNE -                                                      ;82D742|D0F2    |82D736;
    SEP #$20                                                   ;82D744|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;82D746|A522    |000022;
    CMP.B #$04                                                 ;82D748|C904    |      ;
    BCS fUnknown_82D750                                        ;82D74A|B004    |82D750;
    JSL.L fObjectMap_LoadFarm                                  ;82D74C|2282A682|82A682;
 
fUnknown_82D750:
    SEP #$20                                                   ;82D750|E220    |      ;
    LDA.B #$09                                                 ;82D752|A909    |      ;
    STA.B strcVariables.n8Temp4                                ;82D754|8595    |000095;
    REP #$20                                                   ;82D756|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82D758|6490    |000090;
    JML.L fUnknown_82D871                                      ;82D75A|5C71D882|82D871;
 
 
fUnknown_82D75E:
    REP #$30                                                   ;82D75E|C230    |      ;
    SEP #$20                                                   ;82D760|E220    |      ;
    LDA.B #$04                                                 ;82D762|A904    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;82D764|8D9A01  |00019A;
    SEP #$20                                                   ;82D767|E220    |      ;
    STZ.W nUnknownFlags09D                                     ;82D769|9C8D09  |00098D;
    REP #$20                                                   ;82D76C|C220    |      ;
    %CheckFlag(daily4, $0800)
    BEQ +                                                      ;82D775|F007    |82D77E;
    SEP #$20                                                   ;82D777|E220    |      ;
    LDA.B #$02                                                 ;82D779|A902    |      ;
    STA.W nUnknownFlags09D                                     ;82D77B|8D8D09  |00098D;
 
  + SEP #$20                                                   ;82D77E|E220    |      ;
    LDA.B #$00                                                 ;82D780|A900    |      ;
    STA.L nIntroHowToPlayIndex                                 ;82D782|8F481F7F|7F1F48;
    STA.L nIntroHowToPlayIndex2                                ;82D786|8F491F7F|7F1F49;
    JSL.L fObjectMap_LoadDefaultFarm                           ;82D78A|225AA682|82A65A;
    SEP #$20                                                   ;82D78E|E220    |      ;
    LDA.B #$03                                                 ;82D790|A903    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82D792|22598C80|808C59;
    JSL.L fCore_SetForceBlank                                  ;82D796|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;82D79A|22468880|808846;
    SEP #$20                                                   ;82D79E|E220    |      ;
    LDA.B #$5D                                                 ;82D7A0|A95D    |      ;
    STA.B strcMap.loadAreaId                                   ;82D7A2|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;82D7A4|22C6A780|80A7C6;
    REP #$20                                                   ;82D7A8|C220    |      ;
    LDA.W #$006E                                               ;82D7AA|A96E00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82D7AD|22CF9180|8091CF;
    SEP #$20                                                   ;82D7B1|E220    |      ;
    REP #$10                                                   ;82D7B3|C210    |      ;
    LDA.B #$00                                                 ;82D7B5|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82D7B7|8527    |000027;
    LDA.B #$22                                                 ;82D7B9|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82D7BB|8529    |000029;
    REP #$20                                                   ;82D7BD|C220    |      ;
    LDY.W #$0200                                               ;82D7BF|A00002  |      ;
    LDX.W #$0000                                               ;82D7C2|A20000  |      ;
    LDA.W #$DA00                                               ;82D7C5|A900DA  |      ;
    STA.B ptrTemp0x72                                          ;82D7C8|8572    |000072;
    SEP #$20                                                   ;82D7CA|E220    |      ;
    LDA.B #$A9                                                 ;82D7CC|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82D7CE|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82D7D0|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82D7D4|22B28A80|808AB2;
    REP #$20                                                   ;82D7D8|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;82D7DA|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82D7DD|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82D7E0|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82D7E3|9C4201  |000142;
    JSL.L fCore_ResetForceBlank                                ;82D7E6|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82D7EA|22458680|808645;
    SEP #$20                                                   ;82D7EE|E220    |      ;
    LDA.B #$03                                                 ;82D7F0|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;82D7F2|8592    |000092;
    LDA.B #$03                                                 ;82D7F4|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D7F6|8593    |000093;
    LDA.B #$0F                                                 ;82D7F8|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82D7FA|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82D7FC|22CE8780|8087CE;
    SEP #$20                                                   ;82D800|E220    |      ;
    STZ.B strcVariables.u8Unk97                                ;82D802|6497    |000097;
    REP #$20                                                   ;82D804|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82D806|6490    |000090;
    LDA.W #$0001                                               ;82D808|A90100  |      ;
    STA.B strcObject.bankAddress                               ;82D80B|85AF    |0000AF;
 
fUnknown_82D80D:
    SEP #$20                                                   ;82D80D|E220    |      ;
    LDA.B $00                                                  ;82D80F|A500    |000000;
    BEQ fUnknown_82D80D                                        ;82D811|F0FA    |82D80D;
    JSL.L fCore_Unknown808E69                                  ;82D813|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82D817|2234C084|84C034;
    SEP #$20                                                   ;82D81B|E220    |      ;
    LDA.B strcVariables.n8Temp4                                ;82D81D|A595    |000095;
    BEQ fUnknown_82D883                                        ;82D81F|F062    |82D883;
    CMP.B #$01                                                 ;82D821|C901    |      ;
    BNE +                                                      ;82D823|D004    |82D829;
    JML.L fUnknown_82D8B0                                      ;82D825|5CB0D882|82D8B0;
 
 
  + CMP.B #$02                                                 ;82D829|C902    |      ;
    BNE +                                                      ;82D82B|D004    |82D831;
    JML.L fUnknown_82DA8C                                      ;82D82D|5C8CDA82|82DA8C;
 
 
  + CMP.B #$03                                                 ;82D831|C903    |      ;
    BNE +                                                      ;82D833|D004    |82D839;
    JML.L fUnknown_82DAC9                                      ;82D835|5CC9DA82|82DAC9;
 
 
  + CMP.B #$04                                                 ;82D839|C904    |      ;
    BNE +                                                      ;82D83B|D004    |82D841;
    JML.L fUnknown_82DC0D                                      ;82D83D|5C0DDC82|82DC0D;
 
 
  + CMP.B #$05                                                 ;82D841|C905    |      ;
    BNE +                                                      ;82D843|D004    |82D849;
    JML.L fUnknown_82DD8C                                      ;82D845|5C8CDD82|82DD8C;
 
 
  + CMP.B #$06                                                 ;82D849|C906    |      ;
    BNE +                                                      ;82D84B|D004    |82D851;
    JML.L fUnknown_82DB8E                                      ;82D84D|5C8EDB82|82DB8E;
 
 
  + CMP.B #$07                                                 ;82D851|C907    |      ;
    BNE +                                                      ;82D853|D004    |82D859;
    JML.L fUnknown_82DF92                                      ;82D855|5C92DF82|82DF92;
 
 
  + CMP.B #$08                                                 ;82D859|C908    |      ;
    BNE +                                                      ;82D85B|D004    |82D861;
    JML.L fUnknown_82E1F1                                      ;82D85D|5CF1E182|82E1F1;
 
 
  + CMP.B #$09                                                 ;82D861|C909    |      ;
    BNE +                                                      ;82D863|D004    |82D869;
    JML.L fUnknown_82DAF5                                      ;82D865|5CF5DA82|82DAF5;
 
 
  + CMP.B #$0A                                                 ;82D869|C90A    |      ;
    BNE fUnknown_82D871                                        ;82D86B|D004    |82D871;
    JML.L fUnknown_82D1C0                                      ;82D86D|5CC0D182|82D1C0;
 
 
fUnknown_82D871:
    SEP #$20                                                   ;82D871|E220    |      ;
    STZ.B $00                                                  ;82D873|6400    |000000;
    REP #$20                                                   ;82D875|C220    |      ;
    LDA.B strcVariables.n16Unk90                               ;82D877|A590    |000090;
    CMP.W #$0258                                               ;82D879|C95802  |      ;
    BNE +                                                      ;82D87C|D003    |82D881;
    JMP.W fMainMenu_AutoHowToPlay                              ;82D87E|4CC7D3  |82D3C7;
 
 
  + BRA fUnknown_82D80D                                        ;82D881|808A    |82D80D;
 
 
fUnknown_82D883:
    LDY.W #$0000                                               ;82D883|A00000  |      ;
 
  - PHY                                                        ;82D886|5A      |      ;
    JSL.L fCore_WaitForNextNMI                                 ;82D887|22458680|808645;
    REP #$30                                                   ;82D88B|C230    |      ;
    PLY                                                        ;82D88D|7A      |      ;
    INY                                                        ;82D88E|C8      |      ;
    CPY.W #$0078                                               ;82D88F|C07800  |      ;
    BNE -                                                      ;82D892|D0F2    |82D886;
    SEP #$20                                                   ;82D894|E220    |      ;
    LDA.B #$0F                                                 ;82D896|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82D898|8592    |000092;
    LDA.B #$03                                                 ;82D89A|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D89C|8593    |000093;
    LDA.B #$01                                                 ;82D89E|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82D8A0|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82D8A2|220A8880|80880A;
    SEP #$20                                                   ;82D8A6|E220    |      ;
    LDA.B #$01                                                 ;82D8A8|A901    |      ;
    STA.B strcVariables.n8Temp4                                ;82D8AA|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82D8AC|6494    |000094;
    BRA fUnknown_82D871                                        ;82D8AE|80C1    |82D871;
 
 
fUnknown_82D8B0:
    REP #$30                                                   ;82D8B0|C230    |      ;
    JSL.L fCore_ZeroVRAM                                       ;82D8B2|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;82D8B6|22808980|808980;
    JSL.L fCore_Zero0x42Ptr                                    ;82D8BA|22AB8F80|808FAB;
    JSL.L fUnknown_Zero7EA220                                  ;82D8BE|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82D8C2|220F8285|85820F;
    JSL.L fUnknown_Zero07Ptr                                   ;82D8C6|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;82D8CA|22008084|848000;
    REP #$20                                                   ;82D8CE|C220    |      ;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;82D8EF|C230    |      ;
    LDA.W #$0000                                               ;82D8F1|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;82D8F4|8D0109  |000901;
    REP #$20                                                   ;82D8F7|C220    |      ;
    LDA.W #$0100                                               ;82D8F9|A90001  |      ;
    STA.W strcBGScrool.BG3VerOffs                              ;82D8FC|8D4601  |000146;
    REP #$30                                                   ;82D8FF|C230    |      ;
    %AIExecute($0000, $0009, $0000)
    JSL.L fAI_HowToPlaySetup                                   ;82D90E|226F8184|84816F;
    SEP #$20                                                   ;82D912|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D914|AD8B09  |00098B;
    STA.B strcMap.loadAreaId                                   ;82D917|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82D919|22DE9580|8095DE;
    JSL.L fAudioUnknown_83841F                                 ;82D91D|221F8483|83841F;
    JSL.L fAudioUnknown_8383A4                                 ;82D921|22A48383|8383A4;
    JSL.L fAudioUnknown_838380                                 ;82D925|22808383|838380;
    SEP #$20                                                   ;82D929|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82D92B|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82D92E|8D1701  |000117;
    SEP #$20                                                   ;82D931|E220    |      ;
    LDA.W nDestinationAreaId                                   ;82D933|AD8B09  |00098B;
    JSL.L fMap_SetupArea                                       ;82D936|222C9780|80972C;
    REP #$30                                                   ;82D93A|C230    |      ;
    LDY.W #$0000                                               ;82D93C|A00000  |      ;
 
  - SEP #$20                                                   ;82D93F|E220    |      ;
    LDA.B $00                                                  ;82D941|A500    |000000;
    BEQ -                                                      ;82D943|F0FA    |82D93F;
    REP #$20                                                   ;82D945|C220    |      ;
    LDA.W #$1800                                               ;82D947|A90018  |      ;
    STA.B $C7                                                  ;82D94A|85C7    |0000C7;
    JSL.L fAudioEngine_MapChangeHandler                        ;82D94C|22719680|809671;
    JSL.L fMapChangeHandler_809A64                             ;82D950|22649A80|809A64;
    JSL.L fGame_TimeHandler                                    ;82D954|22008082|828000;
    JSL.L fDialog_IterateText                                  ;82D958|221C9583|83951C;
    JSL.L fPallete_ChangeHandler                               ;82D95C|220C9080|80900C;
    JSL.L fCore_Unknown808E69                                  ;82D960|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82D964|2234C084|84C034;
    JSL.L fUnknown_81A383                                      ;82D968|2283A381|81A383;
    JSL.L fUnknownSubrutineHandler_81BFB7                      ;82D96C|22B7BF81|81BFB7;
    JSL.L fGraphics_MapScrool                                  ;82D970|22B39580|8095B3;
    JSL.L fAI_HowToPlaySetup                                   ;82D974|226F8184|84816F;
    JSL.L fUnknownCF_81A600                                    ;82D978|2200A681|81A600;
    JSL.L fObject_Unknown8582C7                                ;82D97C|22C78285|8582C7;
    JSL.L fUnknown_858CB2                                      ;82D980|22B28C85|858CB2;
    JSL.L fUnknown_8583E0                                      ;82D984|22E08385|8583E0;
    REP #$20                                                   ;82D988|C220    |      ;
    %CheckFlag(daily2, $0004)
    BNE +                                                      ;82D991|D020    |82D9B3;
    SEP #$20                                                   ;82D993|E220    |      ;
    STZ.B $00                                                  ;82D995|6400    |000000;
    JMP.W $D93F                                                ;82D997|4C3FD9  |82D93F;
 
    PLY                                                        ;82D99A|7A      |      ;
    INY                                                        ;82D99B|C8      |      ;
    CPY.W #$0168                                               ;82D99C|C06801  |      ;
    BNE -                                                      ;82D99F|D09E    |82D93F;
    SEP #$20                                                   ;82D9A1|E220    |      ;
    LDA.B #$0F                                                 ;82D9A3|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82D9A5|8592    |000092;
    LDA.B #$03                                                 ;82D9A7|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D9A9|8593    |000093;
    LDA.B #$01                                                 ;82D9AB|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82D9AD|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82D9AF|220A8880|80880A;
 
  + SEP #$20                                                   ;82D9B3|E220    |      ;
    LDA.B strcVariables.n8Temp4                                ;82D9B5|A595    |000095;
    CMP.B #$09                                                 ;82D9B7|C909    |      ;
    BNE +                                                      ;82D9B9|D003    |82D9BE;
    JMP.W fUnknown_82D871                                      ;82D9BB|4C71D8  |82D871;
 
 
  + SEP #$20                                                   ;82D9BE|E220    |      ;
    LDA.B #$0F                                                 ;82D9C0|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82D9C2|8592    |000092;
    LDA.B #$03                                                 ;82D9C4|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82D9C6|8593    |000093;
    LDA.B #$01                                                 ;82D9C8|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82D9CA|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82D9CC|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82D9D0|220F8E80|808E0F;
    SEP #$20                                                   ;82D9D4|E220    |      ;
    LDA.B #$03                                                 ;82D9D6|A903    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82D9D8|22598C80|808C59;
    JSL.L fCore_ZeroVRAM                                       ;82D9DC|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;82D9E0|22808980|808980;
    JSL.L fCore_Zero0x42Ptr                                    ;82D9E4|22AB8F80|808FAB;
    JSL.L fUnknown_Zero7EA220                                  ;82D9E8|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82D9EC|220F8285|85820F;
    JSL.L fUnknown_Zero07Ptr                                   ;82D9F0|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;82D9F4|22008084|848000;
    SEP #$20                                                   ;82D9F8|E220    |      ;
    LDA.B #$5B                                                 ;82D9FA|A95B    |      ;
    STA.B strcMap.loadAreaId                                   ;82D9FC|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;82D9FE|22C6A780|80A7C6;
    REP #$20                                                   ;82DA02|C220    |      ;
    LDA.W #$006D                                               ;82DA04|A96D00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82DA07|22CF9180|8091CF;
    SEP #$20                                                   ;82DA0B|E220    |      ;
    REP #$10                                                   ;82DA0D|C210    |      ;
    LDA.B #$00                                                 ;82DA0F|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82DA11|8527    |000027;
    LDA.B #$22                                                 ;82DA13|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82DA15|8529    |000029;
    REP #$20                                                   ;82DA17|C220    |      ;
    LDY.W #$0200                                               ;82DA19|A00002  |      ;
    LDX.W #$0000                                               ;82DA1C|A20000  |      ;
    LDA.W #$D800                                               ;82DA1F|A900D8  |      ;
    STA.B ptrTemp0x72                                          ;82DA22|8572    |000072;
    SEP #$20                                                   ;82DA24|E220    |      ;
    LDA.B #$A9                                                 ;82DA26|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82DA28|8574    |000074; A9D8000 -> $72 (sPalette_0x6C)
    JSL.L fCore_PrepareTransfer                                ;82DA2A|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82DA2E|22B28A80|808AB2;
    REP #$20                                                   ;82DA32|C220    |      ;
    LDA.W #$0100                                               ;82DA34|A90001  |      ;
    STA.W strcBGScrool.BG1HorOffs                              ;82DA37|8D3C01  |00013C;
    LDA.W #$0100                                               ;82DA3A|A90001  |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;82DA3D|8D4001  |000140;
    LDA.W #$0100                                               ;82DA40|A90001  |      ;
    STA.W strcBGScrool.BG1VerOffs                              ;82DA43|8D3E01  |00013E;
    LDA.W #$0100                                               ;82DA46|A90001  |      ;
    STA.W strcBGScrool.BG2VerOffs                              ;82DA49|8D4201  |000142;
    JSL.L fAudioEngine_MapMusicHandler                         ;82DA4C|22DE9580|8095DE;
    JSL.L fAudioUnknown_83841F                                 ;82DA50|221F8483|83841F;
    JSL.L fAudioUnknown_8383A4                                 ;82DA54|22A48383|8383A4;
    JSL.L fAudioUnknown_838380                                 ;82DA58|22808383|838380;
    SEP #$20                                                   ;82DA5C|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82DA5E|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82DA61|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82DA64|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82DA68|22458680|808645;
    SEP #$20                                                   ;82DA6C|E220    |      ;
    LDA.B #$01                                                 ;82DA6E|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;82DA70|8592    |000092;
    LDA.B #$06                                                 ;82DA72|A906    |      ;
    STA.B strcVariables.n8Temp2                                ;82DA74|8593    |000093;
    LDA.B #$0F                                                 ;82DA76|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82DA78|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82DA7A|22CE8780|8087CE;
    SEP #$20                                                   ;82DA7E|E220    |      ;
    LDA.B #$02                                                 ;82DA80|A902    |      ;
    STA.B strcVariables.n8Temp4                                ;82DA82|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82DA84|6494    |000094;
    STZ.B strcVariables.u8Unk96                                ;82DA86|6496    |000096;
    JML.L fUnknown_82D871                                      ;82DA88|5C71D882|82D871;
 
 
fUnknown_82DA8C:
    SEP #$20                                                   ;82DA8C|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82DA8E|A594    |000094;
    AND.B #$01                                                 ;82DA90|2901    |      ;
    BNE .label1                                                ;82DA92|D012    |82DAA6;
    REP #$20                                                   ;82DA94|C220    |      ;
    LDA.W strcBGScrool.BG2HorOffs                              ;82DA96|AD4001  |000140;
    INC A                                                      ;82DA99|1A      |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;82DA9A|8D4001  |000140;
    LDA.W strcBGScrool.BG1HorOffs                              ;82DA9D|AD3C01  |00013C;
    BEQ +                                                      ;82DAA0|F00C    |82DAAE;
    DEC A                                                      ;82DAA2|3A      |      ;
    STA.W strcBGScrool.BG1HorOffs                              ;82DAA3|8D3C01  |00013C;
 
.label1:
    SEP #$20                                                   ;82DAA6|E220    |      ;
    INC.B strcVariables.n8Temp3                                ;82DAA8|E694    |000094;
    JML.L fUnknown_82D871                                      ;82DAAA|5C71D882|82D871;
 
 
  + SEP #$20                                                   ;82DAAE|E220    |      ;
    LDA.B strcVariables.u8Unk96                                ;82DAB0|A596    |000096;
    INC A                                                      ;82DAB2|1A      |      ;
    STA.B strcVariables.u8Unk96                                ;82DAB3|8596    |000096;
    CMP.B #$3C                                                 ;82DAB5|C93C    |      ;
    BEQ +                                                      ;82DAB7|F004    |82DABD;
    JML.L .label1                                              ;82DAB9|5CA6DA82|82DAA6;
 
 
  + SEP #$20                                                   ;82DABD|E220    |      ;
    LDA.B #$03                                                 ;82DABF|A903    |      ;
    STA.B strcVariables.n8Temp4                                ;82DAC1|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82DAC3|6494    |000094;
    JML.L fUnknown_82D871                                      ;82DAC5|5C71D882|82D871;
 
 
fUnknown_82DAC9:
    SEP #$20                                                   ;82DAC9|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82DACB|A594    |000094;
    AND.B #$01                                                 ;82DACD|2901    |      ;
    BNE .skip                                                  ;82DACF|D01C    |82DAED;
    REP #$20                                                   ;82DAD1|C220    |      ;
    LDA.W strcBGScrool.BG2HorOffs                              ;82DAD3|AD4001  |000140;
    INC A                                                      ;82DAD6|1A      |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;82DAD7|8D4001  |000140;
    LDA.W strcBGScrool.BG1VerOffs                              ;82DADA|AD3E01  |00013E;
    BNE +                                                      ;82DADD|D003    |82DAE2;
    JMP.W fUnknown_82DB8E                                      ;82DADF|4C8EDB  |82DB8E;
 
 
  + DEC A                                                      ;82DAE2|3A      |      ;
    STA.W strcBGScrool.BG1VerOffs                              ;82DAE3|8D3E01  |00013E;
    LDA.W strcBGScrool.BG2VerOffs                              ;82DAE6|AD4201  |000142;
    DEC A                                                      ;82DAE9|3A      |      ;
    STA.W strcBGScrool.BG2VerOffs                              ;82DAEA|8D4201  |000142;
 
.skip:
    SEP #$20                                                   ;82DAED|E220    |      ;
    INC.B strcVariables.n8Temp3                                ;82DAEF|E694    |000094;
    JML.L fUnknown_82D871                                      ;82DAF1|5C71D882|82D871;
 
 
fUnknown_82DAF5:
    SEP #$20                                                   ;82DAF5|E220    |      ;
    LDA.B #$5C                                                 ;82DAF7|A95C    |      ;
    STA.B strcMap.loadAreaId                                   ;82DAF9|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82DAFB|22DE9580|8095DE;
    JSL.L fAudioUnknown_838401                                 ;82DAFF|22018483|838401;
    SEP #$20                                                   ;82DB03|E220    |      ;
    LDA.B #$0F                                                 ;82DB05|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82DB07|8592    |000092;
    LDA.B #$01                                                 ;82DB09|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;82DB0B|8593    |000093;
    LDA.B #$01                                                 ;82DB0D|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82DB0F|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82DB11|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82DB15|220F8E80|808E0F;
    SEP #$20                                                   ;82DB19|E220    |      ;
    LDA.B #$03                                                 ;82DB1B|A903    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82DB1D|22598C80|808C59;
    JSL.L fCore_ZeroVRAM                                       ;82DB21|22468880|808846;
    JSL.L fCore_ZeroCGRAM                                      ;82DB25|22808980|808980;
    JSL.L fCore_Zero0x42Ptr                                    ;82DB29|22AB8F80|808FAB;
    JSL.L fUnknown_Zero7EA220                                  ;82DB2D|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82DB31|220F8285|85820F;
    JSL.L fUnknown_Zero07Ptr                                   ;82DB35|22C7A481|81A4C7;
    JSL.L fAI_ZeroCCPtr                                        ;82DB39|22008084|848000;
    REP #$20                                                   ;82DB3D|C220    |      ;
    STZ.B strcPlayer.posX                                      ;82DB3F|64D6    |0000D6;
    STZ.B strcPlayer.posY                                      ;82DB41|64D8    |0000D8;
    STZ.W strcDialogDisplay.mapDestX                           ;82DB43|9C7D01  |00017D;
    STZ.W strcDialogDisplay.mapDestY                           ;82DB46|9C7F01  |00017F;
    STZ.W strcDialogDisplay.mapFlags                           ;82DB49|9C9601  |000196;
    SEP #$20                                                   ;82DB4C|E220    |      ;
    LDA.B #$5B                                                 ;82DB4E|A95B    |      ;
    STA.B strcMap.loadAreaId                                   ;82DB50|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;82DB52|22C6A780|80A7C6;
    REP #$20                                                   ;82DB56|C220    |      ;
    LDA.W #$006D                                               ;82DB58|A96D00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82DB5B|22CF9180|8091CF;
    SEP #$20                                                   ;82DB5F|E220    |      ;
    REP #$10                                                   ;82DB61|C210    |      ;
    LDA.B #$00                                                 ;82DB63|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82DB65|8527    |000027;
    LDA.B #$22                                                 ;82DB67|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82DB69|8529    |000029;
    REP #$20                                                   ;82DB6B|C220    |      ;
    LDY.W #$0200                                               ;82DB6D|A00002  |      ;
    LDX.W #$0000                                               ;82DB70|A20000  |      ;
    LDA.W #$D800                                               ;82DB73|A900D8  |      ;
    STA.B ptrTemp0x72                                          ;82DB76|8572    |000072;
    SEP #$20                                                   ;82DB78|E220    |      ;
    LDA.B #$A9                                                 ;82DB7A|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82DB7C|8574    |000074; A9D800 -> $72 (sPalette_0x6C)
    JSL.L fCore_PrepareTransfer                                ;82DB7E|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82DB82|22B28A80|808AB2;
    SEP #$20                                                   ;82DB86|E220    |      ;
    LDA.B #$5C                                                 ;82DB88|A95C    |      ;
    STA.B strcMap.loadAreaId                                   ;82DB8A|8522    |000022;
    BRA fUnknown_82DBB2                                        ;82DB8C|8024    |82DBB2;
 
 
fUnknown_82DB8E:
    SEP #$20                                                   ;82DB8E|E220    |      ;
    LDA.B #$5C                                                 ;82DB90|A95C    |      ;
    STA.B strcMap.loadAreaId                                   ;82DB92|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82DB94|22DE9580|8095DE;
    JSL.L fAudioUnknown_838401                                 ;82DB98|22018483|838401;
    SEP #$20                                                   ;82DB9C|E220    |      ;
    LDA.B #$0F                                                 ;82DB9E|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82DBA0|8592    |000092;
    LDA.B #$01                                                 ;82DBA2|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;82DBA4|8593    |000093;
    LDA.B #$01                                                 ;82DBA6|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82DBA8|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82DBAA|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82DBAE|220F8E80|808E0F;
 
fUnknown_82DBB2:
    REP #$20                                                   ;82DBB2|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82DBB4|6490    |000090;
    STZ.W strcBGScrool.BG1HorOffs                              ;82DBB6|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82DBB9|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82DBBC|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82DBBF|9C4201  |000142;
    STZ.B strcPlayer.posX                                      ;82DBC2|64D6    |0000D6;
    STZ.B strcPlayer.posY                                      ;82DBC4|64D8    |0000D8;
    STZ.W strcDialogDisplay.mapDestX                           ;82DBC6|9C7D01  |00017D;
    STZ.W strcDialogDisplay.mapDestY                           ;82DBC9|9C7F01  |00017F;
    STZ.W strcDialogDisplay.mapFlags                           ;82DBCC|9C9601  |000196;
    JSL.L fTileMap_MapChangeHandler                            ;82DBCF|22C6A780|80A7C6;
    JSL.L fAudioUnknown_83841F                                 ;82DBD3|221F8483|83841F;
    JSL.L fAudioUnknown_8383A4                                 ;82DBD7|22A48383|8383A4;
    JSL.L fAudioUnknown_838380                                 ;82DBDB|22808383|838380;
    SEP #$20                                                   ;82DBDF|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82DBE1|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82DBE4|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82DBE7|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82DBEB|22458680|808645;
    SEP #$20                                                   ;82DBEF|E220    |      ;
    LDA.B #$01                                                 ;82DBF1|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;82DBF3|8592    |000092;
    LDA.B #$01                                                 ;82DBF5|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;82DBF7|8593    |000093;
    LDA.B #$0F                                                 ;82DBF9|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82DBFB|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82DBFD|22CE8780|8087CE;
    SEP #$20                                                   ;82DC01|E220    |      ;
    LDA.B #$04                                                 ;82DC03|A904    |      ;
    STA.B strcVariables.n8Temp4                                ;82DC05|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82DC07|6494    |000094;
    JML.L fUnknown_82D871                                      ;82DC09|5C71D882|82D871;
 
 
fUnknown_82DC0D:
    SEP #$20                                                   ;82DC0D|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82DC0F|A594    |000094;
    AND.B #$01                                                 ;82DC11|2901    |      ;
    BEQ +                                                      ;82DC13|F004    |82DC19;
    JML.L .skip                                                ;82DC15|5C22DC82|82DC22;
 
 
  + REP #$20                                                   ;82DC19|C220    |      ;
    LDA.W strcBGScrool.BG2HorOffs                              ;82DC1B|AD4001  |000140;
    INC A                                                      ;82DC1E|1A      |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;82DC1F|8D4001  |000140;
 
.skip:
    SEP #$20                                                   ;82DC22|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82DC24|A594    |000094;
    CMP.B #$3C                                                 ;82DC26|C93C    |      ;
    BEQ +                                                      ;82DC28|F008    |82DC32;
    SEP #$20                                                   ;82DC2A|E220    |      ;
    INC.B strcVariables.n8Temp3                                ;82DC2C|E694    |000094;
    JML.L fUnknown_82D871                                      ;82DC2E|5C71D882|82D871;
 
 
  + JSL.L fCore_Zero0x42Ptr                                    ;82DC32|22AB8F80|808FAB;
    REP #$20                                                   ;82DC36|C220    |      ;
    SEP #$10                                                   ;82DC38|E210    |      ;
    LDA.W #$F2A4                                               ;82DC3A|A9A4F2  |      ;
    STA.B ptrTemp0x72                                          ;82DC3D|8572    |000072;
    SEP #$20                                                   ;82DC3F|E220    |      ;
    LDA.B #$82                                                 ;82DC41|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DC43|8574    |000074; 82F2A4 -> $72 ()
    SEP #$20                                                   ;82DC45|E220    |      ;
    LDA.B #$0A                                                 ;82DC47|A90A    |      ;
    LDX.B #$04                                                 ;82DC49|A204    |      ;
    LDY.B #$07                                                 ;82DC4B|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DC4D|22488E80|808E48;
    REP #$20                                                   ;82DC51|C220    |      ;
    SEP #$10                                                   ;82DC53|E210    |      ;
    LDA.W #$F2B5                                               ;82DC55|A9B5F2  |      ;
    STA.B ptrTemp0x72                                          ;82DC58|8572    |000072;
    SEP #$20                                                   ;82DC5A|E220    |      ;
    LDA.B #$82                                                 ;82DC5C|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DC5E|8574    |000074; 82F2B5 -> $72 ()
    SEP #$20                                                   ;82DC60|E220    |      ;
    LDA.B #$0B                                                 ;82DC62|A90B    |      ;
    LDX.B #$05                                                 ;82DC64|A205    |      ;
    LDY.B #$07                                                 ;82DC66|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DC68|22488E80|808E48;
    SEP #$20                                                   ;82DC6C|E220    |      ;
    LDA.W nUnknownFlags09D                                     ;82DC6E|AD8D09  |00098D;
    CMP.B #$01                                                 ;82DC71|C901    |      ;
    BNE +                                                      ;82DC73|D004    |82DC79;
    JML.L .case01                                              ;82DC75|5CD6DC82|82DCD6;
 
 
  + CMP.B #$02                                                 ;82DC79|C902    |      ;
    BNE +                                                      ;82DC7B|D004    |82DC81;
    JML.L .case02                                              ;82DC7D|5C2BDD82|82DD2B;
 
 
  + REP #$20                                                   ;82DC81|C220    |      ;
    SEP #$10                                                   ;82DC83|E210    |      ;
    LDA.W #$F2C9                                               ;82DC85|A9C9F2  |      ;
    STA.B ptrTemp0x72                                          ;82DC88|8572    |000072;
    SEP #$20                                                   ;82DC8A|E220    |      ;
    LDA.B #$82                                                 ;82DC8C|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DC8E|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DC90|E220    |      ;
    LDA.B #$0D                                                 ;82DC92|A90D    |      ;
    LDX.B #$06                                                 ;82DC94|A206    |      ;
    LDY.B #$07                                                 ;82DC96|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DC98|22488E80|808E48;
    REP #$20                                                   ;82DC9C|C220    |      ;
    SEP #$10                                                   ;82DC9E|E210    |      ;
    LDA.W #$F2DA                                               ;82DCA0|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DCA3|8572    |000072;
    SEP #$20                                                   ;82DCA5|E220    |      ;
    LDA.B #$82                                                 ;82DCA7|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DCA9|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DCAB|E220    |      ;
    LDA.B #$0F                                                 ;82DCAD|A90F    |      ;
    LDX.B #$07                                                 ;82DCAF|A207    |      ;
    LDY.B #$07                                                 ;82DCB1|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DCB3|22488E80|808E48;
    REP #$20                                                   ;82DCB7|C220    |      ;
    SEP #$10                                                   ;82DCB9|E210    |      ;
    LDA.W #$F2DA                                               ;82DCBB|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DCBE|8572    |000072;
    SEP #$20                                                   ;82DCC0|E220    |      ;
    LDA.B #$82                                                 ;82DCC2|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DCC4|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DCC6|E220    |      ;
    LDA.B #$09                                                 ;82DCC8|A909    |      ;
    LDX.B #$08                                                 ;82DCCA|A208    |      ;
    LDY.B #$02                                                 ;82DCCC|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DCCE|22488E80|808E48;
    JML.L $82DD80                                              ;82DCD2|5C80DD82|82DD80;
 
 
.case01:
    REP #$20                                                   ;82DCD6|C220    |      ;
    SEP #$10                                                   ;82DCD8|E210    |      ;
    LDA.W #$F2DA                                               ;82DCDA|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DCDD|8572    |000072;
    SEP #$20                                                   ;82DCDF|E220    |      ;
    LDA.B #$82                                                 ;82DCE1|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DCE3|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DCE5|E220    |      ;
    LDA.B #$0D                                                 ;82DCE7|A90D    |      ;
    LDX.B #$06                                                 ;82DCE9|A206    |      ;
    LDY.B #$07                                                 ;82DCEB|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DCED|22488E80|808E48;
    REP #$20                                                   ;82DCF1|C220    |      ;
    SEP #$10                                                   ;82DCF3|E210    |      ;
    LDA.W #$F2C9                                               ;82DCF5|A9C9F2  |      ;
    STA.B ptrTemp0x72                                          ;82DCF8|8572    |000072;
    SEP #$20                                                   ;82DCFA|E220    |      ;
    LDA.B #$82                                                 ;82DCFC|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DCFE|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DD00|E220    |      ;
    LDA.B #$0F                                                 ;82DD02|A90F    |      ;
    LDX.B #$07                                                 ;82DD04|A207    |      ;
    LDY.B #$07                                                 ;82DD06|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DD08|22488E80|808E48;
    REP #$20                                                   ;82DD0C|C220    |      ;
    SEP #$10                                                   ;82DD0E|E210    |      ;
    LDA.W #$F2DA                                               ;82DD10|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DD13|8572    |000072;
    SEP #$20                                                   ;82DD15|E220    |      ;
    LDA.B #$82                                                 ;82DD17|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DD19|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DD1B|E220    |      ;
    LDA.B #$09                                                 ;82DD1D|A909    |      ;
    LDX.B #$08                                                 ;82DD1F|A208    |      ;
    LDY.B #$02                                                 ;82DD21|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DD23|22488E80|808E48;
    JML.L $82DD80                                              ;82DD27|5C80DD82|82DD80;
 
 
.case02:
    REP #$20                                                   ;82DD2B|C220    |      ;
    SEP #$10                                                   ;82DD2D|E210    |      ;
    LDA.W #$F2DA                                               ;82DD2F|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DD32|8572    |000072;
    SEP #$20                                                   ;82DD34|E220    |      ;
    LDA.B #$82                                                 ;82DD36|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DD38|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DD3A|E220    |      ;
    LDA.B #$0D                                                 ;82DD3C|A90D    |      ;
    LDX.B #$06                                                 ;82DD3E|A206    |      ;
    LDY.B #$07                                                 ;82DD40|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DD42|22488E80|808E48;
    REP #$20                                                   ;82DD46|C220    |      ;
    SEP #$10                                                   ;82DD48|E210    |      ;
    LDA.W #$F2DA                                               ;82DD4A|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DD4D|8572    |000072;
    SEP #$20                                                   ;82DD4F|E220    |      ;
    LDA.B #$82                                                 ;82DD51|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DD53|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DD55|E220    |      ;
    LDA.B #$0F                                                 ;82DD57|A90F    |      ;
    LDX.B #$07                                                 ;82DD59|A207    |      ;
    LDY.B #$07                                                 ;82DD5B|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DD5D|22488E80|808E48;
    REP #$20                                                   ;82DD61|C220    |      ;
    SEP #$10                                                   ;82DD63|E210    |      ;
    LDA.W #$F2C9                                               ;82DD65|A9C9F2  |      ;
    STA.B ptrTemp0x72                                          ;82DD68|8572    |000072;
    SEP #$20                                                   ;82DD6A|E220    |      ;
    LDA.B #$82                                                 ;82DD6C|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DD6E|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DD70|E220    |      ;
    LDA.B #$09                                                 ;82DD72|A909    |      ;
    LDX.B #$08                                                 ;82DD74|A208    |      ;
    LDY.B #$02                                                 ;82DD76|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DD78|22488E80|808E48;
    JML.L $82DD80                                              ;82DD7C|5C80DD82|82DD80;
 
 
  + SEP #$20                                                   ;82DD80|E220    |      ;
    LDA.B #$05                                                 ;82DD82|A905    |      ;
    STA.B strcVariables.n8Temp4                                ;82DD84|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82DD86|6494    |000094;
    JML.L fUnknown_82D871                                      ;82DD88|5C71D882|82D871;
 
 
fUnknown_82DD8C:
    SEP #$20                                                   ;82DD8C|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82DD8E|A594    |000094;
    AND.B #$01                                                 ;82DD90|2901    |      ;
    BNE +                                                      ;82DD92|D009    |82DD9D;
    REP #$20                                                   ;82DD94|C220    |      ;
    LDA.W strcBGScrool.BG2HorOffs                              ;82DD96|AD4001  |000140;
    INC A                                                      ;82DD99|1A      |      ;
    STA.W strcBGScrool.BG2HorOffs                              ;82DD9A|8D4001  |000140;
 
  + SEP #$20                                                   ;82DD9D|E220    |      ;
    INC.B strcVariables.n8Temp3                                ;82DD9F|E694    |000094;
    LDA.B strcVariables.u8Unk97                                ;82DDA1|A597    |000097;
    BNE +                                                      ;82DDA3|D004    |82DDA9;
    JML.L .return                                              ;82DDA5|5CBDDE82|82DEBD;
 
 
  + STZ.B strcVariables.u8Unk97                                ;82DDA9|6497    |000097;
    LDA.W nUnknownFlags09D                                     ;82DDAB|AD8D09  |00098D;
    CMP.B #$01                                                 ;82DDAE|C901    |      ;
    BNE +                                                      ;82DDB0|D004    |82DDB6;
    JML.L .case01                                              ;82DDB2|5C13DE82|82DE13;
 
 
  + CMP.B #$02                                                 ;82DDB6|C902    |      ;
    BNE +                                                      ;82DDB8|D004    |82DDBE;
    JML.L .case02                                              ;82DDBA|5C68DE82|82DE68;
 
 
  + REP #$20                                                   ;82DDBE|C220    |      ;
    SEP #$10                                                   ;82DDC0|E210    |      ;
    LDA.W #$F2C9                                               ;82DDC2|A9C9F2  |      ;
    STA.B ptrTemp0x72                                          ;82DDC5|8572    |000072;
    SEP #$20                                                   ;82DDC7|E220    |      ;
    LDA.B #$82                                                 ;82DDC9|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DDCB|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DDCD|E220    |      ;
    LDA.B #$0D                                                 ;82DDCF|A90D    |      ;
    LDX.B #$06                                                 ;82DDD1|A206    |      ;
    LDY.B #$07                                                 ;82DDD3|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DDD5|22488E80|808E48;
    REP #$20                                                   ;82DDD9|C220    |      ;
    SEP #$10                                                   ;82DDDB|E210    |      ;
    LDA.W #$F2DA                                               ;82DDDD|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DDE0|8572    |000072;
    SEP #$20                                                   ;82DDE2|E220    |      ;
    LDA.B #$82                                                 ;82DDE4|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DDE6|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DDE8|E220    |      ;
    LDA.B #$0F                                                 ;82DDEA|A90F    |      ;
    LDX.B #$07                                                 ;82DDEC|A207    |      ;
    LDY.B #$07                                                 ;82DDEE|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DDF0|22488E80|808E48;
    REP #$20                                                   ;82DDF4|C220    |      ;
    SEP #$10                                                   ;82DDF6|E210    |      ;
    LDA.W #$F2DA                                               ;82DDF8|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DDFB|8572    |000072;
    SEP #$20                                                   ;82DDFD|E220    |      ;
    LDA.B #$82                                                 ;82DDFF|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE01|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DE03|E220    |      ;
    LDA.B #$09                                                 ;82DE05|A909    |      ;
    LDX.B #$08                                                 ;82DE07|A208    |      ;
    LDY.B #$02                                                 ;82DE09|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE0B|22488E80|808E48;
    JML.L .return                                              ;82DE0F|5CBDDE82|82DEBD;
 
 
.case01:
    REP #$20                                                   ;82DE13|C220    |      ;
    SEP #$10                                                   ;82DE15|E210    |      ;
    LDA.W #$F2DA                                               ;82DE17|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DE1A|8572    |000072;
    SEP #$20                                                   ;82DE1C|E220    |      ;
    LDA.B #$82                                                 ;82DE1E|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE20|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DE22|E220    |      ;
    LDA.B #$0D                                                 ;82DE24|A90D    |      ;
    LDX.B #$06                                                 ;82DE26|A206    |      ;
    LDY.B #$07                                                 ;82DE28|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE2A|22488E80|808E48;
    REP #$20                                                   ;82DE2E|C220    |      ;
    SEP #$10                                                   ;82DE30|E210    |      ;
    LDA.W #$F2C9                                               ;82DE32|A9C9F2  |      ;
    STA.B ptrTemp0x72                                          ;82DE35|8572    |000072;
    SEP #$20                                                   ;82DE37|E220    |      ;
    LDA.B #$82                                                 ;82DE39|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE3B|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DE3D|E220    |      ;
    LDA.B #$0F                                                 ;82DE3F|A90F    |      ;
    LDX.B #$07                                                 ;82DE41|A207    |      ;
    LDY.B #$07                                                 ;82DE43|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE45|22488E80|808E48;
    REP #$20                                                   ;82DE49|C220    |      ;
    SEP #$10                                                   ;82DE4B|E210    |      ;
    LDA.W #$F2DA                                               ;82DE4D|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DE50|8572    |000072;
    SEP #$20                                                   ;82DE52|E220    |      ;
    LDA.B #$82                                                 ;82DE54|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE56|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DE58|E220    |      ;
    LDA.B #$09                                                 ;82DE5A|A909    |      ;
    LDX.B #$08                                                 ;82DE5C|A208    |      ;
    LDY.B #$02                                                 ;82DE5E|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE60|22488E80|808E48;
    JML.L .return                                              ;82DE64|5CBDDE82|82DEBD;
 
 
.case02:
    REP #$20                                                   ;82DE68|C220    |      ;
    SEP #$10                                                   ;82DE6A|E210    |      ;
    LDA.W #$F2DA                                               ;82DE6C|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DE6F|8572    |000072;
    SEP #$20                                                   ;82DE71|E220    |      ;
    LDA.B #$82                                                 ;82DE73|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE75|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DE77|E220    |      ;
    LDA.B #$0D                                                 ;82DE79|A90D    |      ;
    LDX.B #$06                                                 ;82DE7B|A206    |      ;
    LDY.B #$07                                                 ;82DE7D|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE7F|22488E80|808E48;
    REP #$20                                                   ;82DE83|C220    |      ;
    SEP #$10                                                   ;82DE85|E210    |      ;
    LDA.W #$F2DA                                               ;82DE87|A9DAF2  |      ;
    STA.B ptrTemp0x72                                          ;82DE8A|8572    |000072;
    SEP #$20                                                   ;82DE8C|E220    |      ;
    LDA.B #$82                                                 ;82DE8E|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DE90|8574    |000074; 82F2DA -> $72 ()
    SEP #$20                                                   ;82DE92|E220    |      ;
    LDA.B #$0F                                                 ;82DE94|A90F    |      ;
    LDX.B #$07                                                 ;82DE96|A207    |      ;
    LDY.B #$07                                                 ;82DE98|A007    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DE9A|22488E80|808E48;
    REP #$20                                                   ;82DE9E|C220    |      ;
    SEP #$10                                                   ;82DEA0|E210    |      ;
    LDA.W #$F2C9                                               ;82DEA2|A9C9F2  |      ;
    STA.B ptrTemp0x72                                          ;82DEA5|8572    |000072;
    SEP #$20                                                   ;82DEA7|E220    |      ;
    LDA.B #$82                                                 ;82DEA9|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82DEAB|8574    |000074; 82F2C9 -> $72 ()
    SEP #$20                                                   ;82DEAD|E220    |      ;
    LDA.B #$09                                                 ;82DEAF|A909    |      ;
    LDX.B #$08                                                 ;82DEB1|A208    |      ;
    LDY.B #$02                                                 ;82DEB3|A002    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82DEB5|22488E80|808E48;
    JML.L .return                                              ;82DEB9|5CBDDE82|82DEBD;
 
 
.return:
    REP #$30                                                   ;82DEBD|C230    |      ;
    INC.B strcVariables.n16Unk90                               ;82DEBF|E690    |000090;
    JML.L fUnknown_82D871                                      ;82DEC1|5C71D882|82D871;
 
 
fUnknown_82DEC5:
    SEP #$20                                                   ;82DEC5|E220    |      ;
    LDA.B #$5C                                                 ;82DEC7|A95C    |      ;
    STA.B strcMap.loadAreaId                                   ;82DEC9|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82DECB|22DE9580|8095DE;
    JSL.L fAudioUnknown_838401                                 ;82DECF|22018483|838401;
    SEP #$20                                                   ;82DED3|E220    |      ;
    LDA.B #$0F                                                 ;82DED5|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82DED7|8592    |000092;
    LDA.B #$01                                                 ;82DED9|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;82DEDB|8593    |000093;
    LDA.B #$01                                                 ;82DEDD|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82DEDF|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82DEE1|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82DEE5|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;82DEE9|22468880|808846;
    SEP #$20                                                   ;82DEED|E220    |      ;
    LDA.B #$03                                                 ;82DEEF|A903    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82DEF1|22598C80|808C59;
    REP #$20                                                   ;82DEF5|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;82DEF7|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82DEFA|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82DEFD|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82DF00|9C4201  |000142;
    STZ.B strcPlayer.posX                                      ;82DF03|64D6    |0000D6;
    STZ.B strcPlayer.posY                                      ;82DF05|64D8    |0000D8;
    STZ.W strcDialogDisplay.mapDestX                           ;82DF07|9C7D01  |00017D;
    STZ.W strcDialogDisplay.mapDestY                           ;82DF0A|9C7F01  |00017F;
    STZ.W strcDialogDisplay.mapFlags                           ;82DF0D|9C9601  |000196;
    SEP #$20                                                   ;82DF10|E220    |      ;
    LDA.B #$5B                                                 ;82DF12|A95B    |      ;
    STA.B strcMap.loadAreaId                                   ;82DF14|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;82DF16|22C6A780|80A7C6;
    SEP #$20                                                   ;82DF1A|E220    |      ;
    LDA.B #$5C                                                 ;82DF1C|A95C    |      ;
    STA.B strcMap.loadAreaId                                   ;82DF1E|8522    |000022;
    JSL.L fTileMap_MapChangeHandler                            ;82DF20|22C6A780|80A7C6;
    REP #$20                                                   ;82DF24|C220    |      ;
    LDA.W #$006D                                               ;82DF26|A96D00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82DF29|22CF9180|8091CF;
    SEP #$20                                                   ;82DF2D|E220    |      ;
    REP #$10                                                   ;82DF2F|C210    |      ;
    LDA.B #$00                                                 ;82DF31|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82DF33|8527    |000027;
    LDA.B #$22                                                 ;82DF35|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82DF37|8529    |000029;
    REP #$20                                                   ;82DF39|C220    |      ;
    LDY.W #$0200                                               ;82DF3B|A00002  |      ;
    LDX.W #$0000                                               ;82DF3E|A20000  |      ;
    LDA.W #$D800                                               ;82DF41|A900D8  |      ;
    STA.B ptrTemp0x72                                          ;82DF44|8572    |000072;
    SEP #$20                                                   ;82DF46|E220    |      ;
    LDA.B #$A9                                                 ;82DF48|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82DF4A|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82DF4C|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82DF50|22B28A80|808AB2;
    JSL.L fAudioUnknown_83841F                                 ;82DF54|221F8483|83841F;
    JSL.L fAudioUnknown_8383A4                                 ;82DF58|22A48383|8383A4;
    JSL.L fAudioUnknown_838380                                 ;82DF5C|22808383|838380;
    SEP #$20                                                   ;82DF60|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82DF62|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82DF65|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82DF68|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82DF6C|22458680|808645;
    SEP #$20                                                   ;82DF70|E220    |      ;
    LDA.B #$01                                                 ;82DF72|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;82DF74|8592    |000092;
    LDA.B #$01                                                 ;82DF76|A901    |      ;
    STA.B strcVariables.n8Temp2                                ;82DF78|8593    |000093;
    LDA.B #$0F                                                 ;82DF7A|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82DF7C|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82DF7E|22CE8780|8087CE;
    SEP #$20                                                   ;82DF82|E220    |      ;
    LDA.B #$04                                                 ;82DF84|A904    |      ;
    STA.B strcVariables.n8Temp4                                ;82DF86|8595    |000095;
    STZ.B strcVariables.n8Temp3                                ;82DF88|6494    |000094;
    REP #$20                                                   ;82DF8A|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;82DF8C|6490    |000090;
    JML.L fUnknown_82D871                                      ;82DF8E|5C71D882|82D871;
 
 
fUnknown_82DF92:
    SEP #$20                                                   ;82DF92|E220    |      ;
    LDA.B #$5E                                                 ;82DF94|A95E    |      ;
    STA.B strcMap.loadAreaId                                   ;82DF96|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82DF98|22DE9580|8095DE;
    JSL.L fAudioUnknown_838401                                 ;82DF9C|22018483|838401;
    SEP #$20                                                   ;82DFA0|E220    |      ;
    LDA.B #$0F                                                 ;82DFA2|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82DFA4|8592    |000092;
    LDA.B #$03                                                 ;82DFA6|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82DFA8|8593    |000093;
    LDA.B #$01                                                 ;82DFAA|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82DFAC|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82DFAE|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82DFB2|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;82DFB6|22468880|808846;
    SEP #$20                                                   ;82DFBA|E220    |      ;
    LDA.B #$04                                                 ;82DFBC|A904    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82DFBE|22598C80|808C59;
    JSL.L fTileMap_MapChangeHandler                            ;82DFC2|22C6A780|80A7C6;
    REP #$20                                                   ;82DFC6|C220    |      ;
    LDA.W #$006F                                               ;82DFC8|A96F00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82DFCB|22CF9180|8091CF;
    SEP #$20                                                   ;82DFCF|E220    |      ;
    REP #$10                                                   ;82DFD1|C210    |      ;
    LDA.B #$00                                                 ;82DFD3|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82DFD5|8527    |000027;
    LDA.B #$22                                                 ;82DFD7|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82DFD9|8529    |000029;
    REP #$20                                                   ;82DFDB|C220    |      ;
    LDY.W #$0200                                               ;82DFDD|A00002  |      ;
    LDX.W #$0000                                               ;82DFE0|A20000  |      ;
    LDA.W #$8C00                                               ;82DFE3|A9008C  |      ;
    STA.B ptrTemp0x72                                          ;82DFE6|8572    |000072;
    SEP #$20                                                   ;82DFE8|E220    |      ;
    LDA.B #$A9                                                 ;82DFEA|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82DFEC|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82DFEE|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82DFF2|22B28A80|808AB2;
    JSR.W fUnknown_82E742                                      ;82DFF6|2042E7  |82E742;
    REP #$30                                                   ;82DFF9|C230    |      ;
    LDA.W #$0000                                               ;82DFFB|A90000  |      ;
    LDY.W #$0000                                               ;82DFFE|A00000  |      ;
    JSR.W fUnknown_82E405                                      ;82E001|2005E4  |82E405;
    REP #$30                                                   ;82E004|C230    |      ;
    LDA.W #$0001                                               ;82E006|A90100  |      ;
    LDY.W #$0000                                               ;82E009|A00000  |      ;
    JSR.W fUnknown_82E405                                      ;82E00C|2005E4  |82E405;
    JSL.L fCore_Zero0x42Ptr                                    ;82E00F|22AB8F80|808FAB;
    REP #$20                                                   ;82E013|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;82E015|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82E018|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82E01B|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82E01E|9C4201  |000142;
    STZ.W strcBGScrool.BG3HorOffs                              ;82E021|9C4401  |000144;
    STZ.W strcBGScrool.BG3VerOffs                              ;82E024|9C4601  |000146;
    SEP #$20                                                   ;82E027|E220    |      ;
    LDA.B #$00                                                 ;82E029|A900    |      ;
    XBA                                                        ;82E02B|EB      |      ;
    LDA.W $098E                                                ;82E02C|AD8E09  |00098E;
    JSL.L fGameEngine_LoadContinue                             ;82E02F|2245BA83|83BA45;
    REP #$30                                                   ;82E033|C230    |      ;
    CPX.W #$0000                                               ;82E035|E00000  |      ;
    BEQ +                                                      ;82E038|F000    |82E03A;
 
  + SEP #$20                                                   ;82E03A|E220    |      ;
    LDA.W $098E                                                ;82E03C|AD8E09  |00098E;
    BEQ +                                                      ;82E03F|F004    |82E045;
    JML.L fUnknown_82E07F                                      ;82E041|5C7FE082|82E07F;
 
 
  + REP #$20                                                   ;82E045|C220    |      ;
    SEP #$10                                                   ;82E047|E210    |      ;
    LDA.W #$F2E2                                               ;82E049|A9E2F2  |      ;
    STA.B ptrTemp0x72                                          ;82E04C|8572    |000072;
    SEP #$20                                                   ;82E04E|E220    |      ;
    LDA.B #$82                                                 ;82E050|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E052|8574    |000074;
    SEP #$20                                                   ;82E054|E220    |      ;
    LDA.B #$06                                                 ;82E056|A906    |      ;
    LDX.B #$04                                                 ;82E058|A204    |      ;
    LDY.B #$00                                                 ;82E05A|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E05C|22488E80|808E48;
    REP #$20                                                   ;82E060|C220    |      ;
    SEP #$10                                                   ;82E062|E210    |      ;
    LDA.W #$F2F9                                               ;82E064|A9F9F2  |      ;
    STA.B ptrTemp0x72                                          ;82E067|8572    |000072;
    SEP #$20                                                   ;82E069|E220    |      ;
    LDA.B #$82                                                 ;82E06B|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E06D|8574    |000074;
    SEP #$20                                                   ;82E06F|E220    |      ;
    LDA.B #$06                                                 ;82E071|A906    |      ;
    LDX.B #$05                                                 ;82E073|A205    |      ;
    LDY.B #$01                                                 ;82E075|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E077|22488E80|808E48;
    JML.L fUnknown_82E0B5                                      ;82E07B|5CB5E082|82E0B5;
 
 
fUnknown_82E07F:
    REP #$20                                                   ;82E07F|C220    |      ;
    SEP #$10                                                   ;82E081|E210    |      ;
    LDA.W #$F2F9                                               ;82E083|A9F9F2  |      ;
    STA.B ptrTemp0x72                                          ;82E086|8572    |000072;
    SEP #$20                                                   ;82E088|E220    |      ;
    LDA.B #$82                                                 ;82E08A|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E08C|8574    |000074;
    SEP #$20                                                   ;82E08E|E220    |      ;
    LDA.B #$06                                                 ;82E090|A906    |      ;
    LDX.B #$04                                                 ;82E092|A204    |      ;
    LDY.B #$00                                                 ;82E094|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E096|22488E80|808E48;
    REP #$20                                                   ;82E09A|C220    |      ;
    SEP #$10                                                   ;82E09C|E210    |      ;
    LDA.W #$F2E2                                               ;82E09E|A9E2F2  |      ;
    STA.B ptrTemp0x72                                          ;82E0A1|8572    |000072;
    SEP #$20                                                   ;82E0A3|E220    |      ;
    LDA.B #$82                                                 ;82E0A5|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E0A7|8574    |000074;
    SEP #$20                                                   ;82E0A9|E220    |      ;
    LDA.B #$06                                                 ;82E0AB|A906    |      ;
    LDX.B #$05                                                 ;82E0AD|A205    |      ;
    LDY.B #$01                                                 ;82E0AF|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E0B1|22488E80|808E48;
 
fUnknown_82E0B5:
    JSL.L fAudioUnknown_83841F                                 ;82E0B5|221F8483|83841F;
    JSL.L fAudioUnknown_8383A4                                 ;82E0B9|22A48383|8383A4;
    JSL.L fAudioUnknown_838380                                 ;82E0BD|22808383|838380;
    SEP #$20                                                   ;82E0C1|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82E0C3|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82E0C6|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82E0C9|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82E0CD|22458680|808645;
    SEP #$20                                                   ;82E0D1|E220    |      ;
    LDA.B #$03                                                 ;82E0D3|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;82E0D5|8592    |000092;
    LDA.B #$03                                                 ;82E0D7|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82E0D9|8593    |000093;
    LDA.B #$0F                                                 ;82E0DB|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82E0DD|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82E0DF|22CE8780|8087CE;
    SEP #$20                                                   ;82E0E3|E220    |      ;
    STZ.B strcVariables.n8Temp3                                ;82E0E5|6494    |000094;
    STZ.B strcVariables.u8Unk96                                ;82E0E7|6496    |000096;
    STZ.B strcVariables.u8Unk97                                ;82E0E9|6497    |000097;
 
fUnknown_82E0EB:
    SEP #$20                                                   ;82E0EB|E220    |      ;
    LDA.B $00                                                  ;82E0ED|A500    |000000;
    BEQ fUnknown_82E0EB                                        ;82E0EF|F0FA    |82E0EB;
    REP #$20                                                   ;82E0F1|C220    |      ;
    LDA.W #$1800                                               ;82E0F3|A90018  |      ;
    STA.B $C7                                                  ;82E0F6|85C7    |0000C7;
    JSL.L fCore_Unknown808E69                                  ;82E0F8|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82E0FC|2234C084|84C034;
    SEP #$20                                                   ;82E100|E220    |      ;
    LDA.B strcVariables.u8Unk97                                ;82E102|A597    |000097;
    BNE +                                                      ;82E104|D004    |82E10A;
    JML.L fUnknown_82E1BD                                      ;82E106|5CBDE182|82E1BD;
 
 
  + STZ.B strcVariables.u8Unk97                                ;82E10A|6497    |000097;
    LDA.W $098E                                                ;82E10C|AD8E09  |00098E;
    BEQ +                                                      ;82E10F|F004    |82E115;
    JML.L fUnknown_82E16B                                      ;82E111|5C6BE182|82E16B;
 
 
  + REP #$20                                                   ;82E115|C220    |      ;
    LDA.W #$0000                                               ;82E117|A90000  |      ;
    JSL.L fGameEngine_LoadContinue                             ;82E11A|2245BA83|83BA45;
    REP #$30                                                   ;82E11E|C230    |      ;
    CPX.W #$0000                                               ;82E120|E00000  |      ;
    BEQ +                                                      ;82E123|F002    |82E127;
    BRA .label2                                                ;82E125|800A    |82E131;
 
 
  + REP #$30                                                   ;82E127|C230    |      ;
    LDA.W #$0000                                               ;82E129|A90000  |      ;
    STA.W strcBGScrool.BG1HorOffs                              ;82E12C|8D3C01  |00013C;
    BRA .label2                                                ;82E12F|8000    |82E131;
 
 
.label2:
    REP #$20                                                   ;82E131|C220    |      ;
    SEP #$10                                                   ;82E133|E210    |      ;
    LDA.W #$F2E2                                               ;82E135|A9E2F2  |      ;
    STA.B ptrTemp0x72                                          ;82E138|8572    |000072;
    SEP #$20                                                   ;82E13A|E220    |      ;
    LDA.B #$82                                                 ;82E13C|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E13E|8574    |000074;
    SEP #$20                                                   ;82E140|E220    |      ;
    LDA.B #$06                                                 ;82E142|A906    |      ;
    LDX.B #$04                                                 ;82E144|A204    |      ;
    LDY.B #$00                                                 ;82E146|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E148|22488E80|808E48;
    REP #$20                                                   ;82E14C|C220    |      ;
    SEP #$10                                                   ;82E14E|E210    |      ;
    LDA.W #$F2F9                                               ;82E150|A9F9F2  |      ;
    STA.B ptrTemp0x72                                          ;82E153|8572    |000072;
    SEP #$20                                                   ;82E155|E220    |      ;
    LDA.B #$82                                                 ;82E157|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E159|8574    |000074;
    SEP #$20                                                   ;82E15B|E220    |      ;
    LDA.B #$06                                                 ;82E15D|A906    |      ;
    LDX.B #$05                                                 ;82E15F|A205    |      ;
    LDY.B #$01                                                 ;82E161|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E163|22488E80|808E48;
    JML.L fUnknown_82E1BD                                      ;82E167|5CBDE182|82E1BD;
 
 
fUnknown_82E16B:
    REP #$20                                                   ;82E16B|C220    |      ;
    LDA.W #$0001                                               ;82E16D|A90100  |      ;
    JSL.L fGameEngine_LoadContinue                             ;82E170|2245BA83|83BA45;
    REP #$30                                                   ;82E174|C230    |      ;
    CPX.W #$0000                                               ;82E176|E00000  |      ;
    BEQ +                                                      ;82E179|F002    |82E17D;
    BRA .label1                                                ;82E17B|800A    |82E187;
 
 
  + REP #$30                                                   ;82E17D|C230    |      ;
    LDA.W #$0000                                               ;82E17F|A90000  |      ;
    STA.W strcBGScrool.BG1HorOffs                              ;82E182|8D3C01  |00013C;
    BRA .label1                                                ;82E185|8000    |82E187;
 
 
.label1:
    REP #$20                                                   ;82E187|C220    |      ;
    SEP #$10                                                   ;82E189|E210    |      ;
    LDA.W #$F2F9                                               ;82E18B|A9F9F2  |      ;
    STA.B ptrTemp0x72                                          ;82E18E|8572    |000072;
    SEP #$20                                                   ;82E190|E220    |      ;
    LDA.B #$82                                                 ;82E192|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E194|8574    |000074;
    SEP #$20                                                   ;82E196|E220    |      ;
    LDA.B #$06                                                 ;82E198|A906    |      ;
    LDX.B #$04                                                 ;82E19A|A204    |      ;
    LDY.B #$00                                                 ;82E19C|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E19E|22488E80|808E48;
    REP #$20                                                   ;82E1A2|C220    |      ;
    SEP #$10                                                   ;82E1A4|E210    |      ;
    LDA.W #$F2E2                                               ;82E1A6|A9E2F2  |      ;
    STA.B ptrTemp0x72                                          ;82E1A9|8572    |000072;
    SEP #$20                                                   ;82E1AB|E220    |      ;
    LDA.B #$82                                                 ;82E1AD|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E1AF|8574    |000074;
    SEP #$20                                                   ;82E1B1|E220    |      ;
    LDA.B #$06                                                 ;82E1B3|A906    |      ;
    LDX.B #$05                                                 ;82E1B5|A205    |      ;
    LDY.B #$01                                                 ;82E1B7|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E1B9|22488E80|808E48;
 
fUnknown_82E1BD:
    SEP #$20                                                   ;82E1BD|E220    |      ;
    LDA.B strcVariables.u8Unk96                                ;82E1BF|A596    |000096;
    CMP.B #$01                                                 ;82E1C1|C901    |      ;
    BNE .label1                                                ;82E1C3|D00C    |82E1D1;
    STZ.B strcVariables.u8Unk96                                ;82E1C5|6496    |000096;
    REP #$20                                                   ;82E1C7|C220    |      ;
    INC.W strcBGScrool.BG2HorOffs                              ;82E1C9|EE4001  |000140;
    DEC.W strcBGScrool.BG2VerOffs                              ;82E1CC|CE4201  |000142;
    BRA +                                                      ;82E1CF|8004    |82E1D5;
 
 
.label1:
    SEP #$20                                                   ;82E1D1|E220    |      ;
    INC.B strcVariables.u8Unk96                                ;82E1D3|E696    |000096;
 
  + SEP #$20                                                   ;82E1D5|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82E1D7|A594    |000094;
    CMP.B #$01                                                 ;82E1D9|C901    |      ;
    BNE +                                                      ;82E1DB|D004    |82E1E1;
    JML.L fUnknown_82DEC5                                      ;82E1DD|5CC5DE82|82DEC5;
 
 
  + CMP.B #$02                                                 ;82E1E1|C902    |      ;
    BNE +                                                      ;82E1E3|D004    |82E1E9;
    JML.L fStartNewGame                                        ;82E1E5|5CF9E782|82E7F9;
 
 
  + SEP #$20                                                   ;82E1E9|E220    |      ;
    STZ.B $00                                                  ;82E1EB|6400    |000000;
    JML.L fUnknown_82E0EB                                      ;82E1ED|5CEBE082|82E0EB;
 
 
fUnknown_82E1F1:
    SEP #$20                                                   ;82E1F1|E220    |      ;
    LDA.B #$5E                                                 ;82E1F3|A95E    |      ;
    STA.B strcMap.loadAreaId                                   ;82E1F5|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82E1F7|22DE9580|8095DE;
    JSL.L fAudioUnknown_838401                                 ;82E1FB|22018483|838401;
    SEP #$20                                                   ;82E1FF|E220    |      ;
    LDA.B #$0F                                                 ;82E201|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82E203|8592    |000092;
    LDA.B #$03                                                 ;82E205|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82E207|8593    |000093;
    LDA.B #$01                                                 ;82E209|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82E20B|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82E20D|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82E211|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;82E215|22468880|808846;
    SEP #$20                                                   ;82E219|E220    |      ;
    LDA.B #$04                                                 ;82E21B|A904    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82E21D|22598C80|808C59;
    JSL.L fTileMap_MapChangeHandler                            ;82E221|22C6A780|80A7C6;
    REP #$20                                                   ;82E225|C220    |      ;
    LDA.W #$006F                                               ;82E227|A96F00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82E22A|22CF9180|8091CF;
    SEP #$20                                                   ;82E22E|E220    |      ;
    REP #$10                                                   ;82E230|C210    |      ;
    LDA.B #$00                                                 ;82E232|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82E234|8527    |000027;
    LDA.B #$22                                                 ;82E236|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82E238|8529    |000029;
    REP #$20                                                   ;82E23A|C220    |      ;
    LDY.W #$0200                                               ;82E23C|A00002  |      ;
    LDX.W #$0000                                               ;82E23F|A20000  |      ;
    LDA.W #$8C00                                               ;82E242|A9008C  |      ;
    STA.B ptrTemp0x72                                          ;82E245|8572    |000072;
    SEP #$20                                                   ;82E247|E220    |      ;
    LDA.B #$A9                                                 ;82E249|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82E24B|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82E24D|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82E251|22B28A80|808AB2;
    JSR.W fUnknown_82E742                                      ;82E255|2042E7  |82E742;
    REP #$30                                                   ;82E258|C230    |      ;
    LDA.W #$0000                                               ;82E25A|A90000  |      ;
    LDY.W #$0001                                               ;82E25D|A00100  |      ;
    JSR.W fUnknown_82E405                                      ;82E260|2005E4  |82E405;
    REP #$30                                                   ;82E263|C230    |      ;
    LDA.W #$0001                                               ;82E265|A90100  |      ;
    LDY.W #$0001                                               ;82E268|A00100  |      ;
    JSR.W fUnknown_82E405                                      ;82E26B|2005E4  |82E405;
    JSL.L fCore_Zero0x42Ptr                                    ;82E26E|22AB8F80|808FAB;
    SEP #$20                                                   ;82E272|E220    |      ;
    LDA.W $098E                                                ;82E274|AD8E09  |00098E;
    BEQ +                                                      ;82E277|F004    |82E27D;
    JML.L .label1                                              ;82E279|5CB7E282|82E2B7;
 
 
  + REP #$20                                                   ;82E27D|C220    |      ;
    SEP #$10                                                   ;82E27F|E210    |      ;
    LDA.W #$F2E2                                               ;82E281|A9E2F2  |      ;
    STA.B ptrTemp0x72                                          ;82E284|8572    |000072;
    SEP #$20                                                   ;82E286|E220    |      ;
    LDA.B #$82                                                 ;82E288|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E28A|8574    |000074;
    SEP #$20                                                   ;82E28C|E220    |      ;
    LDA.B #$06                                                 ;82E28E|A906    |      ;
    LDX.B #$04                                                 ;82E290|A204    |      ;
    LDY.B #$00                                                 ;82E292|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E294|22488E80|808E48;
    REP #$20                                                   ;82E298|C220    |      ;
    SEP #$10                                                   ;82E29A|E210    |      ;
    LDA.W #$F2F9                                               ;82E29C|A9F9F2  |      ;
    STA.B ptrTemp0x72                                          ;82E29F|8572    |000072;
    SEP #$20                                                   ;82E2A1|E220    |      ;
    LDA.B #$82                                                 ;82E2A3|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E2A5|8574    |000074;
    SEP #$20                                                   ;82E2A7|E220    |      ;
    LDA.B #$06                                                 ;82E2A9|A906    |      ;
    LDX.B #$05                                                 ;82E2AB|A205    |      ;
    LDY.B #$01                                                 ;82E2AD|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E2AF|22488E80|808E48;
    JML.L .label2                                              ;82E2B3|5CEDE282|82E2ED;
 
 
.label1:
    REP #$20                                                   ;82E2B7|C220    |      ;
    SEP #$10                                                   ;82E2B9|E210    |      ;
    LDA.W #$F2F9                                               ;82E2BB|A9F9F2  |      ;
    STA.B ptrTemp0x72                                          ;82E2BE|8572    |000072;
    SEP #$20                                                   ;82E2C0|E220    |      ;
    LDA.B #$82                                                 ;82E2C2|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E2C4|8574    |000074;
    SEP #$20                                                   ;82E2C6|E220    |      ;
    LDA.B #$06                                                 ;82E2C8|A906    |      ;
    LDX.B #$04                                                 ;82E2CA|A204    |      ;
    LDY.B #$00                                                 ;82E2CC|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E2CE|22488E80|808E48;
    REP #$20                                                   ;82E2D2|C220    |      ;
    SEP #$10                                                   ;82E2D4|E210    |      ;
    LDA.W #$F2E2                                               ;82E2D6|A9E2F2  |      ;
    STA.B ptrTemp0x72                                          ;82E2D9|8572    |000072;
    SEP #$20                                                   ;82E2DB|E220    |      ;
    LDA.B #$82                                                 ;82E2DD|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E2DF|8574    |000074;
    SEP #$20                                                   ;82E2E1|E220    |      ;
    LDA.B #$06                                                 ;82E2E3|A906    |      ;
    LDX.B #$05                                                 ;82E2E5|A205    |      ;
    LDY.B #$01                                                 ;82E2E7|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E2E9|22488E80|808E48;
 
.label2:
    REP #$20                                                   ;82E2ED|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;82E2EF|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82E2F2|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82E2F5|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82E2F8|9C4201  |000142;
    STZ.W strcBGScrool.BG3HorOffs                              ;82E2FB|9C4401  |000144;
    STZ.W strcBGScrool.BG3VerOffs                              ;82E2FE|9C4601  |000146;
    JSL.L fAudioUnknown_83841F                                 ;82E301|221F8483|83841F;
    JSL.L fAudioUnknown_8383A4                                 ;82E305|22A48383|8383A4;
    JSL.L fAudioUnknown_838380                                 ;82E309|22808383|838380;
    SEP #$20                                                   ;82E30D|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82E30F|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82E312|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82E315|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82E319|22458680|808645;
    SEP #$20                                                   ;82E31D|E220    |      ;
    LDA.B #$03                                                 ;82E31F|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;82E321|8592    |000092;
    LDA.B #$03                                                 ;82E323|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82E325|8593    |000093;
    LDA.B #$0F                                                 ;82E327|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82E329|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82E32B|22CE8780|8087CE;
    SEP #$20                                                   ;82E32F|E220    |      ;
    STZ.B strcVariables.n8Temp3                                ;82E331|6494    |000094;
    STZ.B strcVariables.u8Unk96                                ;82E333|6496    |000096;
    STZ.B strcVariables.u8Unk97                                ;82E335|6497    |000097;
 
fUnknown_82E337:
    SEP #$20                                                   ;82E337|E220    |      ;
    LDA.B $00                                                  ;82E339|A500    |000000;
    BEQ fUnknown_82E337                                        ;82E33B|F0FA    |82E337;
    REP #$20                                                   ;82E33D|C220    |      ;
    LDA.W #$1800                                               ;82E33F|A90018  |      ;
    STA.B $C7                                                  ;82E342|85C7    |0000C7;
    JSL.L fCore_Unknown808E69                                  ;82E344|22698E80|808E69;
    JSL.L fInput_Handler                                       ;82E348|2234C084|84C034;
    SEP #$20                                                   ;82E34C|E220    |      ;
    LDA.B strcVariables.u8Unk97                                ;82E34E|A597    |000097;
    BNE +                                                      ;82E350|D004    |82E356;
    JML.L fUnknown_82E3D1                                      ;82E352|5CD1E382|82E3D1;
 
 
  + STZ.B strcVariables.u8Unk97                                ;82E356|6497    |000097;
    LDA.W $098E                                                ;82E358|AD8E09  |00098E;
    BEQ +                                                      ;82E35B|F004    |82E361;
    JML.L fUnknown_82E39B                                      ;82E35D|5C9BE382|82E39B;
 
 
  + REP #$20                                                   ;82E361|C220    |      ;
    SEP #$10                                                   ;82E363|E210    |      ;
    LDA.W #$F2E2                                               ;82E365|A9E2F2  |      ;
    STA.B ptrTemp0x72                                          ;82E368|8572    |000072;
    SEP #$20                                                   ;82E36A|E220    |      ;
    LDA.B #$82                                                 ;82E36C|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E36E|8574    |000074;
    SEP #$20                                                   ;82E370|E220    |      ;
    LDA.B #$06                                                 ;82E372|A906    |      ;
    LDX.B #$04                                                 ;82E374|A204    |      ;
    LDY.B #$00                                                 ;82E376|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E378|22488E80|808E48;
    REP #$20                                                   ;82E37C|C220    |      ;
    SEP #$10                                                   ;82E37E|E210    |      ;
    LDA.W #$F2F9                                               ;82E380|A9F9F2  |      ;
    STA.B ptrTemp0x72                                          ;82E383|8572    |000072;
    SEP #$20                                                   ;82E385|E220    |      ;
    LDA.B #$82                                                 ;82E387|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E389|8574    |000074;
    SEP #$20                                                   ;82E38B|E220    |      ;
    LDA.B #$06                                                 ;82E38D|A906    |      ;
    LDX.B #$05                                                 ;82E38F|A205    |      ;
    LDY.B #$01                                                 ;82E391|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E393|22488E80|808E48;
    JML.L fUnknown_82E3D1                                      ;82E397|5CD1E382|82E3D1;
 
 
fUnknown_82E39B:
    REP #$20                                                   ;82E39B|C220    |      ;
    SEP #$10                                                   ;82E39D|E210    |      ;
    LDA.W #$F2F9                                               ;82E39F|A9F9F2  |      ;
    STA.B ptrTemp0x72                                          ;82E3A2|8572    |000072;
    SEP #$20                                                   ;82E3A4|E220    |      ;
    LDA.B #$82                                                 ;82E3A6|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E3A8|8574    |000074;
    SEP #$20                                                   ;82E3AA|E220    |      ;
    LDA.B #$06                                                 ;82E3AC|A906    |      ;
    LDX.B #$04                                                 ;82E3AE|A204    |      ;
    LDY.B #$00                                                 ;82E3B0|A000    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E3B2|22488E80|808E48;
    REP #$20                                                   ;82E3B6|C220    |      ;
    SEP #$10                                                   ;82E3B8|E210    |      ;
    LDA.W #$F2E2                                               ;82E3BA|A9E2F2  |      ;
    STA.B ptrTemp0x72                                          ;82E3BD|8572    |000072;
    SEP #$20                                                   ;82E3BF|E220    |      ;
    LDA.B #$82                                                 ;82E3C1|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E3C3|8574    |000074;
    SEP #$20                                                   ;82E3C5|E220    |      ;
    LDA.B #$06                                                 ;82E3C7|A906    |      ;
    LDX.B #$05                                                 ;82E3C9|A205    |      ;
    LDY.B #$01                                                 ;82E3CB|A001    |      ;
    JSL.L fCore_Store0x72To0x42AtIndex                         ;82E3CD|22488E80|808E48;
 
fUnknown_82E3D1:
    SEP #$20                                                   ;82E3D1|E220    |      ;
    LDA.B strcVariables.u8Unk96                                ;82E3D3|A596    |000096;
    CMP.B #$01                                                 ;82E3D5|C901    |      ;
    BNE .label1                                                ;82E3D7|D00C    |82E3E5;
    STZ.B strcVariables.u8Unk96                                ;82E3D9|6496    |000096;
    REP #$20                                                   ;82E3DB|C220    |      ;
    INC.W strcBGScrool.BG2HorOffs                              ;82E3DD|EE4001  |000140;
    DEC.W strcBGScrool.BG2VerOffs                              ;82E3E0|CE4201  |000142;
    BRA +                                                      ;82E3E3|8004    |82E3E9;
 
 
.label1:
    SEP #$20                                                   ;82E3E5|E220    |      ;
    INC.B strcVariables.u8Unk96                                ;82E3E7|E696    |000096;
 
  + SEP #$20                                                   ;82E3E9|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;82E3EB|A594    |000094;
    CMP.B #$01                                                 ;82E3ED|C901    |      ;
    BNE +                                                      ;82E3EF|D004    |82E3F5;
    JML.L fUnknown_82DEC5                                      ;82E3F1|5CC5DE82|82DEC5;
 
 
  + CMP.B #$02                                                 ;82E3F5|C902    |      ;
    BNE +                                                      ;82E3F7|D004    |82E3FD;
    JML.L fLoadAndStartGame                                    ;82E3F9|5CE9E782|82E7E9;
 
 
  + SEP #$20                                                   ;82E3FD|E220    |      ;
    STZ.B $00                                                  ;82E3FF|6400    |000000;
    JML.L fUnknown_82E337                                      ;82E401|5C37E382|82E337;
 
 
fUnknown_82E405:
    REP #$30                                                   ;82E405|C230    |      ;
    PHA                                                        ;82E407|48      |      ;
    PHY                                                        ;82E408|5A      |      ;
    JSL.L fGameEngine_LoadContinue                             ;82E409|2245BA83|83BA45;
    REP #$30                                                   ;82E40D|C230    |      ;
    PLY                                                        ;82E40F|7A      |      ;
    PLA                                                        ;82E410|68      |      ;
    CPX.W #$0000                                               ;82E411|E00000  |      ;
    BNE +                                                      ;82E414|D004    |82E41A;
    JML.L fUnknown_82E5E7                                      ;82E416|5CE7E582|82E5E7;
 
 
  + ASL A                                                      ;82E41A|0A      |      ;
    ASL A                                                      ;82E41B|0A      |      ;
    ASL A                                                      ;82E41C|0A      |      ;
    TAX                                                        ;82E41D|AA      |      ;
    LDA.L aUnknown_82F278,X                                    ;82E41E|BF78F282|82F278;
    PHX                                                        ;82E422|DA      |      ;
    STA.B strcVariables.n16Temp3                               ;82E423|8582    |000082;
    LDX.W #$0000                                               ;82E425|A20000  |      ;
 
  - REP #$20                                                   ;82E428|C220    |      ;
    PHX                                                        ;82E42A|DA      |      ;
    LDA.B strcVariables.n16Temp3                               ;82E42B|A582    |000082;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E42D|8F850180|800185;
    SEP #$20                                                   ;82E431|E220    |      ;
    LDA.B #$00                                                 ;82E433|A900    |      ;
    XBA                                                        ;82E435|EB      |      ;
    LDA.W strcNames.sPlayer,X                                  ;82E436|BD8108  |000881;
    LDX.W #$0000                                               ;82E439|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E43C|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E440|22F08A80|808AF0;
    REP #$30                                                   ;82E444|C230    |      ;
    LDA.B strcVariables.n16Temp3                               ;82E446|A582    |000082;
    CLC                                                        ;82E448|18      |      ;
    ADC.W #$0008                                               ;82E449|690800  |      ;
    STA.B strcVariables.n16Temp3                               ;82E44C|8582    |000082;
    PLX                                                        ;82E44E|FA      |      ;
    INX                                                        ;82E44F|E8      |      ;
    CPX.W #$0004                                               ;82E450|E00400  |      ;
    BNE -                                                      ;82E453|D0D3    |82E428;
    REP #$30                                                   ;82E455|C230    |      ;
    PLX                                                        ;82E457|FA      |      ;
    INX                                                        ;82E458|E8      |      ;
    INX                                                        ;82E459|E8      |      ;
    LDA.L aUnknown_82F278,X                                    ;82E45A|BF78F282|82F278;
    PHX                                                        ;82E45E|DA      |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E45F|8F850180|800185;
    SEP #$20                                                   ;82E463|E220    |      ;
    LDA.L nCurrentYearID                                       ;82E465|AF181F7F|7F1F18;
    INC A                                                      ;82E469|1A      |      ;
    STA.W strcDialogDisplay.dialogNumericVarSize               ;82E46A|8D9201  |000192;
    REP #$20                                                   ;82E46D|C220    |      ;
    STZ.W strcDialogDisplay.dialogNumericVarSize+1             ;82E46F|9C9301  |000193;
    SEP #$20                                                   ;82E472|E220    |      ;
    LDA.B #$00                                                 ;82E474|A900    |      ;
    STA.W strcDialogDisplay.dialogVarSize                      ;82E476|8D8C01  |00018C;
    LDA.W strcDialogDisplay.dialogFlags                        ;82E479|AD9B01  |00019B;
    AND.B #~!DFLAGS_NUMERICVAR                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;82E47E|8D9B01  |00019B;
    JSL.L fDialog_Unknown_8397A6                               ;82E481|22A69783|8397A6;
    JSL.L fCore_StartTransfer                                  ;82E485|22F08A80|808AF0;
    REP #$30                                                   ;82E489|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E48B|AF850180|800185;
    CLC                                                        ;82E48F|18      |      ;
    ADC.W #$0008                                               ;82E490|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E493|8F850180|800185;
    REP #$20                                                   ;82E497|C220    |      ;
    LDA.W #$0000                                               ;82E499|A90000  |      ;
    SEP #$20                                                   ;82E49C|E220    |      ;
    LDA.L nCurrentYearID                                       ;82E49E|AF181F7F|7F1F18;
    REP #$20                                                   ;82E4A2|C220    |      ;
    ASL A                                                      ;82E4A4|0A      |      ;
    ASL A                                                      ;82E4A5|0A      |      ;
    TAX                                                        ;82E4A6|AA      |      ;
    LDA.L sYearOrdinal_82F298,X                                ;82E4A7|BF98F282|82F298;
    LDX.W #$0000                                               ;82E4AB|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E4AE|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E4B2|22F08A80|808AF0;
    REP #$30                                                   ;82E4B6|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E4B8|AF850180|800185;
    CLC                                                        ;82E4BC|18      |      ;
    ADC.W #$0008                                               ;82E4BD|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E4C0|8F850180|800185;
    REP #$20                                                   ;82E4C4|C220    |      ;
    LDA.W #$0000                                               ;82E4C6|A90000  |      ;
    SEP #$20                                                   ;82E4C9|E220    |      ;
    LDA.L nCurrentYearID                                       ;82E4CB|AF181F7F|7F1F18;
    REP #$20                                                   ;82E4CF|C220    |      ;
    ASL A                                                      ;82E4D1|0A      |      ;
    ASL A                                                      ;82E4D2|0A      |      ;
    CLC                                                        ;82E4D3|18      |      ;
    ADC.W #$0002                                               ;82E4D4|690200  |      ;
    TAX                                                        ;82E4D7|AA      |      ;
    LDA.L sYearOrdinal_82F298,X                                ;82E4D8|BF98F282|82F298;
    LDX.W #$0000                                               ;82E4DC|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E4DF|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E4E3|22F08A80|808AF0;
    REP #$30                                                   ;82E4E7|C230    |      ;
    PLX                                                        ;82E4E9|FA      |      ;
    INX                                                        ;82E4EA|E8      |      ;
    INX                                                        ;82E4EB|E8      |      ;
    LDA.L aUnknown_82F278,X                                    ;82E4EC|BF78F282|82F278;
    PHX                                                        ;82E4F0|DA      |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E4F1|8F850180|800185;
    SEP #$20                                                   ;82E4F5|E220    |      ;
    LDA.L nCurrentDay                                          ;82E4F7|AF1B1F7F|7F1F1B;
    STA.W strcDialogDisplay.dialogNumericVarSize               ;82E4FB|8D9201  |000192;
    REP #$20                                                   ;82E4FE|C220    |      ;
    STZ.W strcDialogDisplay.dialogNumericVarSize+1             ;82E500|9C9301  |000193;
    SEP #$20                                                   ;82E503|E220    |      ;
    LDA.B #$01                                                 ;82E505|A901    |      ;
    STA.W strcDialogDisplay.dialogVarSize                      ;82E507|8D8C01  |00018C;
    LDA.W strcDialogDisplay.dialogFlags                        ;82E50A|AD9B01  |00019B;
    AND.B #~!DFLAGS_NUMERICVAR                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;82E50F|8D9B01  |00019B;
    JSL.L fDialog_Unknown_8397A6                               ;82E512|22A69783|8397A6;
    JSL.L fCore_StartTransfer                                  ;82E516|22F08A80|808AF0;
    REP #$30                                                   ;82E51A|C230    |      ;
    PLX                                                        ;82E51C|FA      |      ;
    LDA.L aUnknown_82F278,X                                    ;82E51D|BF78F282|82F278;
    PHX                                                        ;82E521|DA      |      ;
    CLC                                                        ;82E522|18      |      ;
    ADC.W #$0008                                               ;82E523|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E526|8F850180|800185;
    SEP #$20                                                   ;82E52A|E220    |      ;
    LDA.B #$00                                                 ;82E52C|A900    |      ;
    STA.W strcDialogDisplay.dialogVarSize                      ;82E52E|8D8C01  |00018C;
    JSL.L fDialog_Unknown_8397A6                               ;82E531|22A69783|8397A6;
    JSL.L fCore_StartTransfer                                  ;82E535|22F08A80|808AF0;
    REP #$30                                                   ;82E539|C230    |      ;
    JSL.L fWriteSeasonWeekdayAndDayOrdinal                     ;82E53B|22D68982|8289D6;
    REP #$20                                                   ;82E53F|C220    |      ;
    PLX                                                        ;82E541|FA      |      ;
    INX                                                        ;82E542|E8      |      ;
    INX                                                        ;82E543|E8      |      ;
    LDA.L aUnknown_82F278,X                                    ;82E544|BF78F282|82F278;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E548|8F850180|800185;
    LDA.W strcNames.wSeason                                    ;82E54C|ADB308  |0008B3;
    LDX.W #$0000                                               ;82E54F|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E552|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E556|22F08A80|808AF0;
    REP #$30                                                   ;82E55A|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E55C|AF850180|800185;
    CLC                                                        ;82E560|18      |      ;
    ADC.W #$0008                                               ;82E561|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E564|8F850180|800185;
    LDA.W strcNames.wSeason+2                                  ;82E568|ADB508  |0008B5;
    LDX.W #$0000                                               ;82E56B|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E56E|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E572|22F08A80|808AF0;
    REP #$30                                                   ;82E576|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E578|AF850180|800185;
    CLC                                                        ;82E57C|18      |      ;
    ADC.W #$0008                                               ;82E57D|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E580|8F850180|800185;
    LDA.W strcNames.wSeason+4                                  ;82E584|ADB708  |0008B7;
    LDX.W #$0000                                               ;82E587|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E58A|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E58E|22F08A80|808AF0;
    REP #$30                                                   ;82E592|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E594|AF850180|800185;
    CLC                                                        ;82E598|18      |      ;
    ADC.W #$0008                                               ;82E599|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E59C|8F850180|800185;
    LDA.W strcNames.wSeason+6                                  ;82E5A0|ADB908  |0008B9;
    LDX.W #$0000                                               ;82E5A3|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E5A6|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E5AA|22F08A80|808AF0;
    REP #$30                                                   ;82E5AE|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E5B0|AF850180|800185;
    CLC                                                        ;82E5B4|18      |      ;
    ADC.W #$0008                                               ;82E5B5|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E5B8|8F850180|800185;
    LDA.W strcNames.wSeason+8                                  ;82E5BC|ADBB08  |0008BB;
    LDX.W #$0000                                               ;82E5BF|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E5C2|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E5C6|22F08A80|808AF0;
    REP #$30                                                   ;82E5CA|C230    |      ;
    LDA.L strcDialogDisplay.dialogUnk185+$20000                ;82E5CC|AF850180|800185;
    CLC                                                        ;82E5D0|18      |      ;
    ADC.W #$0008                                               ;82E5D1|690800  |      ;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82E5D4|8F850180|800185;
    LDA.W strcNames.wSeason+10                                 ;82E5D8|ADBD08  |0008BD;
    LDX.W #$0000                                               ;82E5DB|A20000  |      ;
    JSL.L fDialog_TransferGlyph                                ;82E5DE|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82E5E2|22F08A80|808AF0;
    RTS                                                        ;82E5E6|60      |      ; GIGAEND
 
 
fUnknown_82E5E7:
    REP #$30                                                   ;82E5E7|C230    |      ; A: nArg1, Y: nArg2
    ASL A                                                      ;82E5E9|0A      |      ;
    TAX                                                        ;82E5EA|AA      |      ;
    LDA.L aSystemTransferArgument,X                            ;82E5EB|BF3EE782|82E73E; X = A * 2
    STA.B strcVariables.n16Temp2                               ;82E5EF|8580    |000080; $80 = nTableValue (0x10E8 / 0x1228)
    STZ.B strcVariables.n16Temp3                               ;82E5F1|6482    |000082; $82 = 0
    STY.B strcVariables.n16Temp4                               ;82E5F3|8484    |000084; $84 = nArg2
 
 -- REP #$30                                                   ;82E5F5|C230    |      ;
    LDA.B strcVariables.n16Temp2                               ;82E5F7|A580    |000080; A = nTableValue (0x10E8 / 0x1228)
    TAX                                                        ;82E5F9|AA      |      ; X = nTableValue
    LDY.W #$0024                                               ;82E5FA|A02400  |      ; Y = 0x0024
    STZ.B strcVariables.n16Temp1                               ;82E5FD|647E    |00007E; $7E = 0
    LDA.B strcVariables.n16Temp4                               ;82E5FF|A584    |000084; A = Arg2
    BEQ +                                                      ;82E601|F005    |82E608;
    LDA.W #$006C                                               ;82E603|A96C00  |      ; A = 0x6C (default)
    STA.B strcVariables.n16Temp1                               ;82E606|857E    |00007E; $7E = 0x6C
 
  + REP #$30                                                   ;82E608|C230    |      ;
    LDA.W #$0000                                               ;82E60A|A90000  |      ; A = 0
 
  - REP #$20                                                   ;82E60D|C220    |      ;
    PHA                                                        ;82E60F|48      |      ; A -> stack1
    SEP #$20                                                   ;82E610|E220    |      ;
    REP #$10                                                   ;82E612|C210    |      ;
    LDA.B #$00                                                 ;82E614|A900    |      ; A = 0x00
    STA.B strcSystem.arrayIndex                                ;82E616|8527    |000027; $27 = 0x00
    LDA.B #$18                                                 ;82E618|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;82E61A|8529    |000029; $29 = 0x18
    REP #$20                                                   ;82E61C|C220    |      ;
    LDA.W #$E666                                               ;82E61E|A966E6  |      ;
    CLC                                                        ;82E621|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;82E622|657E    |00007E; A = 0xE666 / 0xE666 + 0x6C
    STA.B ptrTemp0x72                                          ;82E624|8572    |000072;
    SEP #$20                                                   ;82E626|E220    |      ;
    LDA.B #$82                                                 ;82E628|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82E62A|8574    |000074; 82E666/82E6D2 -> $72
    LDA.B #$80                                                 ;82E62C|A980    |      ; A = nTableValue
    PHY                                                        ;82E62E|5A      |      ; Y -> stack2
    PHX                                                        ;82E62F|DA      |      ; nTableValue -> stack3
    JSL.L fCore_PrepareTransfer                                ;82E630|22338A80|808A33;
    JSL.L fCore_StartPreparedTransfer                          ;82E634|22B28A80|808AB2;
    REP #$30                                                   ;82E638|C230    |      ;
    PLX                                                        ;82E63A|FA      |      ; X = nTableValue
    PLY                                                        ;82E63B|7A      |      ; Y = stack2
    TXA                                                        ;82E63C|8A      |      ; A = nTableValue
    CLC                                                        ;82E63D|18      |      ;
    ADC.W #$0020                                               ;82E63E|692000  |      ;
    TAX                                                        ;82E641|AA      |      ; X = nTableValue + 0x20
    LDA.B strcVariables.n16Temp1                               ;82E642|A57E    |00007E; A = 0x00 / 0x6C
    CLC                                                        ;82E644|18      |      ;
    ADC.W #$0024                                               ;82E645|692400  |      ; A = 0x24 / 0x90
    STA.B strcVariables.n16Temp1                               ;82E648|857E    |00007E; $7E = 0x24 / 0x90
    PLA                                                        ;82E64A|68      |      ; A = 0
    INC A                                                      ;82E64B|1A      |      ; A++
    CMP.W #$0003                                               ;82E64C|C90300  |      ;
    BNE -                                                      ;82E64F|D0BC    |82E60D;
    REP #$20                                                   ;82E651|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;82E653|A580    |000080;
    CLC                                                        ;82E655|18      |      ;
    ADC.W #$0400                                               ;82E656|690004  |      ;
    STA.B strcVariables.n16Temp2                               ;82E659|8580    |000080;
    LDA.B strcVariables.n16Temp3                               ;82E65B|A582    |000082;
    INC A                                                      ;82E65D|1A      |      ;
    STA.B strcVariables.n16Temp3                               ;82E65E|8582    |000082;
    CMP.W #$0002                                               ;82E660|C90200  |      ;
    BNE --                                                     ;82E663|D090    |82E5F5;
    RTS                                                        ;82E665|60      |      ;
 
 
nSystemTranferData_82E666:
    db $FF,$02,$FF,$02,$2C,$00,$6E,$00,$C2,$00,$FF,$02         ;82E666|        |      ; 0x03 * [0x24 bytes]
    db $08,$00,$86,$00,$66,$00,$A8,$00,$C6,$00,$FF,$02         ;82E672|        |      ;
    db $FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02         ;82E67E|        |      ;
    db $FF,$02,$FF,$02,$3C,$00,$7E,$00,$D2,$00,$FF,$02         ;82E68A|        |      ;
    db $18,$00,$96,$00,$76,$00,$B8,$00,$D6,$00,$FF,$02         ;82E696|        |      ;
    db $FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02         ;82E6A2|        |      ;
    db $FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02         ;82E6AE|        |      ;
    db $FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02         ;82E6BA|        |      ;
    db $FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02         ;82E6C6|        |      ;
 
nSystemTranferData_82E6D2:
    db $FF,$02,$FF,$02,$2C,$00,$A2,$00,$FF,$02,$08,$00         ;82E6D2|        |      ; 0x03 * [0x24 bytes]
    db $86,$00,$66,$00,$A8,$00,$C6,$00,$FF,$02,$FF,$02         ;82E6DE|        |      ;
    db $FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02         ;82E6EA|        |      ;
    db $FF,$02,$FF,$02,$3C,$00,$B2,$00,$FF,$02,$18,$00         ;82E6F6|        |      ;
    db $96,$00,$76,$00,$B8,$00,$D6,$00,$FF,$02,$FF,$02         ;82E702|        |      ;
    db $FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02         ;82E70E|        |      ;
    db $FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02         ;82E71A|        |      ;
    db $FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02         ;82E726|        |      ;
    db $FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02,$FF,$02         ;82E732|        |      ;
 
aSystemTransferArgument:
    dw $10E8,$1228                                             ;82E73E|        |      ; 0x02 * [n16, n16]
 
fUnknown_82E742:
    REP #$30                                                   ;82E742|C230    |      ;
    LDX.W #$0000                                               ;82E744|A20000  |      ;
 
 -- REP #$20                                                   ;82E747|C220    |      ;
    LDA.L aUnknown_82F268,X                                    ;82E749|BF68F282|82F268;
    STA.B strcVariables.n16Temp1                               ;82E74D|857E    |00007E;
    INC A                                                      ;82E74F|1A      |      ;
    STA.B strcVariables.n16Temp2                               ;82E750|8580    |000080;
    CLC                                                        ;82E752|18      |      ;
    ADC.W #$000F                                               ;82E753|690F00  |      ;
    STA.B strcVariables.n16Temp3                               ;82E756|8582    |000082;
    INC A                                                      ;82E758|1A      |      ;
    STA.B strcVariables.n16Temp4                               ;82E759|8584    |000084;
    LDA.L aUnknown_82F258,X                                    ;82E75B|BF58F282|82F258;
    STA.B strcVariables.n16Unk86                               ;82E75F|8586    |000086;
    LDY.W #$0000                                               ;82E761|A00000  |      ;
 
  - PHY                                                        ;82E764|5A      |      ;
    PHX                                                        ;82E765|DA      |      ;
    SEP #$20                                                   ;82E766|E220    |      ;
    LDA.B #$00                                                 ;82E768|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82E76A|8527    |000027;
    LDA.B #$18                                                 ;82E76C|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;82E76E|8529    |000029;
    REP #$30                                                   ;82E770|C230    |      ;
    LDY.W #$0004                                               ;82E772|A00400  |      ;
    LDX.B strcVariables.n16Unk86                               ;82E775|A686    |000086;
    LDA.W #$007E                                               ;82E777|A97E00  |      ;
    STA.B ptrTemp0x72                                          ;82E77A|8572    |000072;
    SEP #$20                                                   ;82E77C|E220    |      ;
    LDA.B #$80                                                 ;82E77E|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;82E780|8574    |000074; 80007E -> $72
    REP #$20                                                   ;82E782|C220    |      ;
    LDA.W #$0080                                               ;82E784|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;82E787|22338A80|808A33;
    SEP #$20                                                   ;82E78B|E220    |      ;
    LDA.B #$01                                                 ;82E78D|A901    |      ;
    STA.B strcSystem.arrayIndex                                ;82E78F|8527    |000027;
    LDA.B #$18                                                 ;82E791|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;82E793|8529    |000029;
    REP #$30                                                   ;82E795|C230    |      ;
    LDY.W #$0004                                               ;82E797|A00400  |      ;
    LDX.B strcVariables.n16Unk86                               ;82E79A|A686    |000086;
    TXA                                                        ;82E79C|8A      |      ;
    CLC                                                        ;82E79D|18      |      ;
    ADC.W #$0020                                               ;82E79E|692000  |      ;
    TAX                                                        ;82E7A1|AA      |      ;
    LDA.W #$0082                                               ;82E7A2|A98200  |      ;
    STA.B ptrTemp0x72                                          ;82E7A5|8572    |000072;
    SEP #$20                                                   ;82E7A7|E220    |      ;
    LDA.B #$80                                                 ;82E7A9|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;82E7AB|8574    |000074;
    REP #$20                                                   ;82E7AD|C220    |      ;
    LDA.W #$0080                                               ;82E7AF|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;82E7B2|22338A80|808A33;
    JSL.L fCore_StartTransfer                                  ;82E7B6|22F08A80|808AF0;
    REP #$30                                                   ;82E7BA|C230    |      ;
    INC.B strcVariables.n16Temp1                               ;82E7BC|E67E    |00007E;
    INC.B strcVariables.n16Temp1                               ;82E7BE|E67E    |00007E;
    INC.B strcVariables.n16Temp2                               ;82E7C0|E680    |000080;
    INC.B strcVariables.n16Temp2                               ;82E7C2|E680    |000080;
    INC.B strcVariables.n16Temp3                               ;82E7C4|E682    |000082;
    INC.B strcVariables.n16Temp3                               ;82E7C6|E682    |000082;
    INC.B strcVariables.n16Temp4                               ;82E7C8|E684    |000084;
    INC.B strcVariables.n16Temp4                               ;82E7CA|E684    |000084;
    INC.B strcVariables.n16Unk86                               ;82E7CC|E686    |000086;
    INC.B strcVariables.n16Unk86                               ;82E7CE|E686    |000086;
    PLX                                                        ;82E7D0|FA      |      ;
    PLY                                                        ;82E7D1|7A      |      ;
    INY                                                        ;82E7D2|C8      |      ;
    LDA.L aUnknown_82F288,X                                    ;82E7D3|BF88F282|82F288;
    STA.B strcVariables.n16Unk88                               ;82E7D7|8588    |000088;
    CPY.B strcVariables.n16Unk88                               ;82E7D9|C488    |000088;
    BNE -                                                      ;82E7DB|D087    |82E764;
    INX                                                        ;82E7DD|E8      |      ;
    INX                                                        ;82E7DE|E8      |      ;
    CPX.W #$0010                                               ;82E7DF|E01000  |      ;
    BEQ .justReturn                                            ;82E7E2|F004    |82E7E8;
    JML.L $82E747                                              ;82E7E4|5C47E782|82E747;
 
 
.justReturn:
    RTS                                                        ;82E7E8|60      |      ;
 
 
fLoadAndStartGame:
    SEP #$20                                                   ;82E7E9|E220    |      ;
    LDA.B #$00                                                 ;82E7EB|A900    |      ;
    XBA                                                        ;82E7ED|EB      |      ;
    LDA.W $098E                                                ;82E7EE|AD8E09  |00098E;
    JSL.L fGameEngine_LoadGame                                 ;82E7F1|22B1B283|83B2B1;
    JML.L fCore_GameStart                                      ;82E7F5|5C008080|808000;
 
 
fStartNewGame:
    JSL.L fGameEngine_SetDefaults                              ;82E7F9|22BEA983|83A9BE;
    JML.L fCore_GameStart                                      ;82E7FD|5C008080|808000;
 
 
fUnreached_82E801:
    SEP #$20                                                   ;82E801|E220    |      ;
    LDA.B #$00                                                 ;82E803|A900    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;82E805|8D9F09  |00099F;
    JML.L fScreen_NameInput                                    ;82E808|5C0CE882|82E80C;
 
 
fScreen_NameInput:
    SEP #$20                                                   ;82E80C|E220    |      ;
    LDA.B #!AREA_NAMEINPUT                                                 
    STA.B strcMap.loadAreaId                                   ;82E810|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;82E812|22DE9580|8095DE;
    JSL.L fAudioUnknown_838401                                 ;82E816|22018483|838401;
    SEP #$20                                                   ;82E81A|E220    |      ;
    LDA.B #$0F                                                 ;82E81C|A90F    |      ;
    STA.B strcVariables.n8Temp1                                ;82E81E|8592    |000092;
    LDA.B #$03                                                 ;82E820|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82E822|8593    |000093;
    LDA.B #$01                                                 ;82E824|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;82E826|8594    |000094;
    JSL.L fCore_ScreenFadeout                                  ;82E828|220A8880|80880A;
    JSL.L fCore_SetForceBlank                                  ;82E82C|220F8E80|808E0F;
    JSL.L fCore_ZeroVRAM                                       ;82E830|22468880|808846;
    JSL.L fCore_Zero0x42Ptr                                    ;82E834|22AB8F80|808FAB;
    JSL.L fUnknown_Zero7EA220                                  ;82E838|22D78E85|858ED7;
    JSL.L fObject_ClearGameObject                              ;82E83C|220F8285|85820F;
    REP #$20                                                   ;82E840|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;82E842|AD9601  |000196;
    STA.W strcDialogDisplay.mapFlagsBackup                     ;82E845|8D9801  |000198;
    STZ.W strcDialogDisplay.mapFlags                           ;82E848|9C9601  |000196;
    STZ.W strcObjectData.gameObjectIdx                         ;82E84B|9C0509  |000905;
    SEP #$20                                                   ;82E84E|E220    |      ;
    LDA.B #$05                                                 ;82E850|A905    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;82E852|8D9A01  |00019A;
    SEP #$20                                                   ;82E855|E220    |      ;
    LDA.B #$04                                                 ;82E857|A904    |      ;
    JSL.L fCore_ManageGraphicsPresets                          ;82E859|22598C80|808C59;
    JSL.L fTileMap_MapChangeHandler                            ;82E85D|22C6A780|80A7C6;
    REP #$20                                                   ;82E861|C220    |      ;
    LDA.W #$006F                                               ;82E863|A96F00  |      ;
    JSL.L fPalette_LoadFirstHalf                               ;82E866|22CF9180|8091CF;
    SEP #$20                                                   ;82E86A|E220    |      ;
    REP #$10                                                   ;82E86C|C210    |      ;
    LDA.B #$00                                                 ;82E86E|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82E870|8527    |000027;
    LDA.B #$22                                                 ;82E872|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82E874|8529    |000029;
    REP #$20                                                   ;82E876|C220    |      ;
    LDY.W #$0100                                               ;82E878|A00001  |      ;
    LDX.W #$0000                                               ;82E87B|A20000  |      ;
    LDA.W #$8C00                                               ;82E87E|A9008C  |      ;
    STA.B ptrTemp0x72                                          ;82E881|8572    |000072;
    SEP #$20                                                   ;82E883|E220    |      ;
    LDA.B #$A9                                                 ;82E885|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82E887|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82E889|22338A80|808A33;
    SEP #$20                                                   ;82E88D|E220    |      ;
    REP #$10                                                   ;82E88F|C210    |      ;
    LDA.B #$01                                                 ;82E891|A901    |      ;
    STA.B strcSystem.arrayIndex                                ;82E893|8527    |000027;
    LDA.B #$22                                                 ;82E895|A922    |      ;
    STA.B strcSystem.destinationRegister                       ;82E897|8529    |000029;
    REP #$20                                                   ;82E899|C220    |      ;
    LDY.W #$0100                                               ;82E89B|A00001  |      ;
    LDX.W #$0080                                               ;82E89E|A28000  |      ;
    LDA.W #$DE00                                               ;82E8A1|A900DE  |      ;
    STA.B ptrTemp0x72                                          ;82E8A4|8572    |000072;
    SEP #$20                                                   ;82E8A6|E220    |      ;
    LDA.B #$A9                                                 ;82E8A8|A9A9    |      ;
    STA.B ptrTemp0x72+2                                        ;82E8AA|8574    |000074;
    JSL.L fCore_PrepareTransfer                                ;82E8AC|22338A80|808A33;
    JSL.L fCore_StartTransfer                                  ;82E8B0|22F08A80|808AF0;
    JSL.L fUnknown_Zero07Ptr                                   ;82E8B4|22C7A481|81A4C7;
    REP #$20                                                   ;82E8B8|C220    |      ;
    LDA.W #$0219                                               ;82E8BA|A91902  |      ;
    STA.B strcObject.spriteTableIdx                            ;82E8BD|85A1    |0000A1;
    STA.W strcMenuData.spriteTableIdx                          ;82E8BF|8D9709  |000997;
    LDA.W #$0000                                               ;82E8C2|A90000  |      ;
    STA.B strcObject.flip                                      ;82E8C5|859F    |00009F;
    STA.W strcMenuData.flip                                    ;82E8C7|8D9909  |000999;
    LDA.W #$0028                                               ;82E8CA|A92800  |      ;
    STA.B strcObject.posX                                      ;82E8CD|859B    |00009B;
    STA.W strcMenuData.posX                                    ;82E8CF|8D9B09  |00099B;
    LDA.W #$0044                                               ;82E8D2|A94400  |      ;
    STA.B strcObject.posY                                      ;82E8D5|859D    |00009D;
    STA.W strcMenuData.posY                                    ;82E8D7|8D9D09  |00099D;
    STZ.B strcObject.unkA3                                     ;82E8DA|64A3    |0000A3;
    JSL.L fUnknown_858000                                      ;82E8DC|22008085|858000;
    REP #$20                                                   ;82E8E0|C220    |      ;
    LDA.B strcObject.gameObjectIdx                             ;82E8E2|A5A5    |0000A5;
    STA.W strcMenuData.gameObjectIdx                           ;82E8E4|8D9509  |000995;
    JSL.L fUnknown_82EAB4                                      ;82E8E7|22B4EA82|82EAB4;
    JSL.L fUnknown_82EA80                                      ;82E8EB|2280EA82|82EA80;
    REP #$20                                                   ;82E8EF|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;82E8F1|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;82E8F4|9C3E01  |00013E;
    STZ.W strcBGScrool.BG2HorOffs                              ;82E8F7|9C4001  |000140;
    STZ.W strcBGScrool.BG2VerOffs                              ;82E8FA|9C4201  |000142;
    STZ.W strcBGScrool.BG3HorOffs                              ;82E8FD|9C4401  |000144;
    STZ.W strcBGScrool.BG3VerOffs                              ;82E900|9C4601  |000146;
    JSL.L fAudioUnknown_83841F                                 ;82E903|221F8483|83841F;
    JSL.L fAudioUnknown_8383A4                                 ;82E907|22A48383|8383A4;
    JSL.L fAudioUnknown_838380                                 ;82E90B|22808383|838380;
    SEP #$20                                                   ;82E90F|E220    |      ;
    LDA.W strcAudio.trackId                                    ;82E911|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;82E914|8D1701  |000117;
    JSL.L fCore_ResetForceBlank                                ;82E917|221E8E80|808E1E;
    JSL.L fCore_WaitForNextNMI                                 ;82E91B|22458680|808645;
    SEP #$20                                                   ;82E91F|E220    |      ;
    LDA.B #$03                                                 ;82E921|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;82E923|8592    |000092;
    LDA.B #$03                                                 ;82E925|A903    |      ;
    STA.B strcVariables.n8Temp2                                ;82E927|8593    |000093;
    LDA.B #$0F                                                 ;82E929|A90F    |      ;
    STA.B strcVariables.n8Temp3                                ;82E92B|8594    |000094;
    JSL.L fCore_ScreenFadein                                   ;82E92D|22CE8780|8087CE;
    REP #$20                                                   ;82E931|C220    |      ;
    STZ.W strcMenuData.menuIdx                                 ;82E933|9C9109  |000991;
    SEP #$20                                                   ;82E936|E220    |      ;
    LDA.B #$00                                                 ;82E938|A900    |      ;
    STA.W strcMenuData.tableSelector                           ;82E93A|8D9309  |000993;
    STZ.W strcMenuData.nameEntryIdx                            ;82E93D|9C9409  |000994;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;82E940|9C8B01  |00018B;
    SEP #$20                                                   ;82E943|E220    |      ;
    LDA.B #$B1                                                 ;82E945|A9B1    |      ;
    STA.W strcNames.sTemp                                      ;82E947|8D8508  |000885;
    LDA.B #$B1                                                 ;82E94A|A9B1    |      ;
    STA.W strcNames.sTemp+1                                    ;82E94C|8D8608  |000886;
    LDA.B #$B1                                                 ;82E94F|A9B1    |      ;
    STA.W strcNames.sTemp+2                                    ;82E951|8D8708  |000887;
    LDA.B #$B1                                                 ;82E954|A9B1    |      ;
    STA.W strcNames.sTemp+3                                    ;82E956|8D8808  |000888;
    STZ.B strcVariables.n8Temp3                                ;82E959|6494    |000094;
    STZ.B strcVariables.u8Unk96                                ;82E95B|6496    |000096;
    STZ.B strcVariables.u8Unk97                                ;82E95D|6497    |000097;
 
  - SEP #$20                                                   ;82E95F|E220    |      ;
    LDA.B $00                                                  ;82E961|A500    |000000;
    BEQ -                                                      ;82E963|F0FA    |82E95F;
    REP #$20                                                   ;82E965|C220    |      ;
    LDA.W #$1800                                               ;82E967|A90018  |      ;
    STA.B $C7                                                  ;82E96A|85C7    |0000C7;
    JSR.W fUnknown_82EA15                                      ;82E96C|2015EA  |82EA15;
    JSL.L fInput_Handler                                       ;82E96F|2234C084|84C034;
    SEP #$20                                                   ;82E973|E220    |      ;
    LDA.W strcMenuData.tableSelector                           ;82E975|AD9309  |000993;
    CMP.B #$03                                                 ;82E978|C903    |      ;
    BNE +                                                      ;82E97A|D003    |82E97F;
    JMP.W .nameHandler                                         ;82E97C|4CCEE9  |82E9CE;
 
 
  + JSL.L fMenuUnknown_82EB57                                  ;82E97F|2257EB82|82EB57;
    SEP #$20                                                   ;82E983|E220    |      ;
    LDA.B strcVariables.u8Unk96                                ;82E985|A596    |000096;
    CMP.B #$01                                                 ;82E987|C901    |      ;
    BNE .continue                                              ;82E989|D00C    |82E997;
    STZ.B strcVariables.u8Unk96                                ;82E98B|6496    |000096;
    REP #$20                                                   ;82E98D|C220    |      ;
    INC.W strcBGScrool.BG2HorOffs                              ;82E98F|EE4001  |000140;
    DEC.W strcBGScrool.BG2VerOffs                              ;82E992|CE4201  |000142;
    BRA +                                                      ;82E995|8004    |82E99B;
 
 
.continue:
    SEP #$20                                                   ;82E997|E220    |      ;
    INC.B strcVariables.u8Unk96                                ;82E999|E696    |000096;
 
  + REP #$20                                                   ;82E99B|C220    |      ;
    LDA.W strcMenuData.spriteTableIdx                          ;82E99D|AD9709  |000997;
    STA.B strcObject.spriteTableIdx                            ;82E9A0|85A1    |0000A1;
    LDA.W strcMenuData.flip                                    ;82E9A2|AD9909  |000999;
    STA.B strcObject.flip                                      ;82E9A5|859F    |00009F;
    LDA.W strcMenuData.posX                                    ;82E9A7|AD9B09  |00099B;
    STA.B strcObject.posX                                      ;82E9AA|859B    |00009B;
    LDA.W strcMenuData.posY                                    ;82E9AC|AD9D09  |00099D;
    STA.B strcObject.posY                                      ;82E9AF|859D    |00009D;
    LDA.W strcMenuData.gameObjectIdx                           ;82E9B1|AD9509  |000995;
    STA.B strcObject.gameObjectIdx                             ;82E9B4|85A5    |0000A5;
    JSL.L fObject_Unknown8580B9                                ;82E9B6|22B98085|8580B9;
    JSL.L fObject_Unknown8582C7                                ;82E9BA|22C78285|8582C7;
    JSL.L fUnknown_858CB2                                      ;82E9BE|22B28C85|858CB2;
    JSL.L fUnknown_8583E0                                      ;82E9C2|22E08385|8583E0;
    SEP #$20                                                   ;82E9C6|E220    |      ;
    STZ.B $00                                                  ;82E9C8|6400    |000000;
    JML.L $82E95F                                              ;82E9CA|5C5FE982|82E95F;
 
 
.nameHandler:
    REP #$20                                                   ;82E9CE|C220    |      ;
    LDA.W strcDialogDisplay.mapFlagsBackup                     ;82E9D0|AD9801  |000198;
    STA.W strcDialogDisplay.mapFlags                           ;82E9D3|8D9601  |000196;
    SEP #$20                                                   ;82E9D6|E220    |      ;
    LDA.W strcMenuData.nameDestinationIdx                      ;82E9D8|AD9F09  |00099F;
    CMP.B #!NI_PLAYER                                                 
    BNE +                                                      ;82E9DD|D004    |82E9E3;
    JML.L fCore_SetPlayerName                                  ;82E9DF|5CED8080|8080ED;
 
 
  + CMP.B #!NI_COWBOUGHT                                                 
    BNE +                                                      ;82E9E5|D004    |82E9EB;
    JML.L fCore_SetBoughtCowName                               ;82E9E7|5C5F8180|80815F;
 
 
  + CMP.B #!NI_COWBORN                                                 
    BNE +                                                      ;82E9ED|D004    |82E9F3;
    JML.L fCore_SetBornCowName                                 ;82E9EF|5CD28180|8081D2;
 
 
  + CMP.B #!NI_DOG                                                 
    BNE +                                                      ;82E9F5|D004    |82E9FB;
    JML.L fCore_SetDogName                                     ;82E9F7|5C548280|808254;
 
 
  + CMP.B #!NI_HORSE                                                 
    BNE +                                                      ;82E9FD|D004    |82EA03;
    JML.L fCore_SetHorseName                                   ;82E9FF|5CC68280|8082C6;
 
 
  + CMP.B #!NI_FIRSTHILD                                                 
    BNE +                                                      ;82EA05|D004    |82EA0B;
    JML.L fCore_SetFirstChildName                              ;82EA07|5C388380|808338;
 
 
  + CMP.B #!NI_SECONDCHILD                                                 
    BNE +                                                      ;82EA0D|D004    |82EA13;
    JML.L fCore_SetSecondChildName                             ;82EA0F|5CAE8380|8083AE;
 
 
  + BRA .nameHandler                                           ;82EA13|80B9    |82E9CE;
 
 
fUnknown_82EA15:
    SEP #$20                                                   ;82EA15|E220    |      ;
    REP #$10                                                   ;82EA17|C210    |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;82EA19|AD9409  |000994;
    CMP.B #$04                                                 ;82EA1C|C904    |      ;
    BEQ .return                                                ;82EA1E|F03F    |82EA5F;
    REP #$20                                                   ;82EA20|C220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA22|AD8B01  |00018B;
    AND.W #$007F                                               ;82EA25|297F00  |      ;
    CMP.W #$0014                                               ;82EA28|C91400  |      ;
    BNE +                                                      ;82EA2B|D00C    |82EA39;
    SEP #$20                                                   ;82EA2D|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA2F|AD8B01  |00018B;
    AND.B #$80                                                 ;82EA32|2980    |      ;
    EOR.B #$80                                                 ;82EA34|4980    |      ;
    STA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA36|8D8B01  |00018B;
 
  + SEP #$20                                                   ;82EA39|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA3B|AD8B01  |00018B;
    AND.B #$80                                                 ;82EA3E|2980    |      ;
    BNE .label1                                                ;82EA40|D00B    |82EA4D;
    REP #$20                                                   ;82EA42|C220    |      ;
    LDA.W #$00A8                                               ;82EA44|A9A800  |      ;
    JSL.L fTextUnknown_82EA60                                  ;82EA47|2260EA82|82EA60;
    BRA .label2                                                ;82EA4B|8009    |82EA56;
 
 
.label1:
    REP #$20                                                   ;82EA4D|C220    |      ;
    LDA.W #!DIALOG_SPACE                                               
    JSL.L fTextUnknown_82EA60                                  ;82EA52|2260EA82|82EA60;
 
.label2:
    SEP #$20                                                   ;82EA56|E220    |      ;
    LDA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA58|AD8B01  |00018B;
    INC A                                                      ;82EA5B|1A      |      ;
    STA.W strcDialogDisplay.dialogBlinkTimer                   ;82EA5C|8D8B01  |00018B;
 
.return:
    RTS                                                        ;82EA5F|60      |      ; BIGEND
 
 
fTextUnknown_82EA60:
    REP #$20                                                   ;82EA60|C220    |      ; A: nLetterCode
    PHA                                                        ;82EA62|48      |      ; nLetterCode -> stack1
    SEP #$20                                                   ;82EA63|E220    |      ;
    LDA.B #$00                                                 ;82EA65|A900    |      ;
    XBA                                                        ;82EA67|EB      |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;82EA68|AD9409  |000994;
    REP #$20                                                   ;82EA6B|C220    |      ;
    ASL A                                                      ;82EA6D|0A      |      ;
    TAX                                                        ;82EA6E|AA      |      ;
    LDA.L aUnknown_82EB4D,X                                    ;82EA6F|BF4DEB82|82EB4D;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82EA73|8F850180|800185;
    PLA                                                        ;82EA77|68      |      ; A = nLetterCode
    LDX.W #$0001                                               ;82EA78|A20100  |      ;
    JSL.L fDialog_TransferGlyph                                ;82EA7B|22239883|839823;
    RTL                                                        ;82EA7F|6B      |      ;
 
 
fUnknown_82EA80:
    REP #$20                                                   ;82EA80|C220    |      ;
    LDA.L aUnknown_82EB4D                                      ;82EA82|AF4DEB82|82EB4D;
    STA.B strcVariables.n16Temp3                               ;82EA86|8582    |000082;
    LDX.W #$0000                                               ;82EA88|A20000  |      ;
 
  - REP #$20                                                   ;82EA8B|C220    |      ;
    PHX                                                        ;82EA8D|DA      |      ;
    LDA.B strcVariables.n16Temp3                               ;82EA8E|A582    |000082;
    STA.L strcDialogDisplay.dialogUnk185+$20000                ;82EA90|8F850180|800185;
    LDA.W #$00A8                                               ;82EA94|A9A800  |      ; nLetterCode
    LDX.W #$0001                                               ;82EA97|A20100  |      ;
    JSL.L fDialog_TransferGlyph                                ;82EA9A|22239883|839823;
    JSL.L fCore_StartTransfer                                  ;82EA9E|22F08A80|808AF0;
    REP #$30                                                   ;82EAA2|C230    |      ;
    LDA.B strcVariables.n16Temp3                               ;82EAA4|A582    |000082;
    CLC                                                        ;82EAA6|18      |      ;
    ADC.W #$0010                                               ;82EAA7|691000  |      ;
    STA.B strcVariables.n16Temp3                               ;82EAAA|8582    |000082;
    PLX                                                        ;82EAAC|FA      |      ;
    INX                                                        ;82EAAD|E8      |      ;
    CPX.W #$0004                                               ;82EAAE|E00400  |      ;
    BNE -                                                      ;82EAB1|D0D8    |82EA8B;
    RTL                                                        ;82EAB3|6B      |      ;
 
 
fUnknown_82EAB4:
    REP #$30                                                   ;82EAB4|C230    |      ;
    LDA.L nUnknown_82EB4B                                      ;82EAB6|AF4BEB82|82EB4B;
    STA.B strcVariables.n16Temp1                               ;82EABA|857E    |00007E;
    INC A                                                      ;82EABC|1A      |      ;
    STA.B strcVariables.n16Temp2                               ;82EABD|8580    |000080;
    CLC                                                        ;82EABF|18      |      ;
    ADC.W #$000F                                               ;82EAC0|690F00  |      ;
    STA.B strcVariables.n16Temp3                               ;82EAC3|8582    |000082;
    INC A                                                      ;82EAC5|1A      |      ;
    STA.B strcVariables.n16Temp4                               ;82EAC6|8584    |000084;
    LDA.L nUnknown_82EB49                                      ;82EAC8|AF49EB82|82EB49;
    STA.B strcVariables.n16Unk86                               ;82EACC|8586    |000086;
    LDY.W #$0000                                               ;82EACE|A00000  |      ;
 
  - PHY                                                        ;82EAD1|5A      |      ;
    SEP #$20                                                   ;82EAD2|E220    |      ;
    LDA.B #$00                                                 ;82EAD4|A900    |      ;
    STA.B strcSystem.arrayIndex                                ;82EAD6|8527    |000027;
    LDA.B #$18                                                 ;82EAD8|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;82EADA|8529    |000029;
    REP #$30                                                   ;82EADC|C230    |      ;
    LDY.W #$0004                                               ;82EADE|A00400  |      ;
    LDX.B strcVariables.n16Unk86                               ;82EAE1|A686    |000086;
    LDA.W #$007E                                               ;82EAE3|A97E00  |      ;
    STA.B ptrTemp0x72                                          ;82EAE6|8572    |000072;
    SEP #$20                                                   ;82EAE8|E220    |      ;
    LDA.B #$80                                                 ;82EAEA|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;82EAEC|8574    |000074; 80007E -> $72
    REP #$20                                                   ;82EAEE|C220    |      ;
    LDA.W #$0080                                               ;82EAF0|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;82EAF3|22338A80|808A33;
    SEP #$20                                                   ;82EAF7|E220    |      ;
    LDA.B #$01                                                 ;82EAF9|A901    |      ;
    STA.B strcSystem.arrayIndex                                ;82EAFB|8527    |000027;
    LDA.B #$18                                                 ;82EAFD|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;82EAFF|8529    |000029;
    REP #$30                                                   ;82EB01|C230    |      ;
    LDY.W #$0004                                               ;82EB03|A00400  |      ;
    LDX.B strcVariables.n16Unk86                               ;82EB06|A686    |000086;
    TXA                                                        ;82EB08|8A      |      ;
    CLC                                                        ;82EB09|18      |      ;
    ADC.W #$0020                                               ;82EB0A|692000  |      ;
    TAX                                                        ;82EB0D|AA      |      ;
    LDA.W #$0082                                               ;82EB0E|A98200  |      ;
    STA.B ptrTemp0x72                                          ;82EB11|8572    |000072;
    SEP #$20                                                   ;82EB13|E220    |      ;
    LDA.B #$80                                                 ;82EB15|A980    |      ;
    STA.B ptrTemp0x72+2                                        ;82EB17|8574    |000074;
    REP #$20                                                   ;82EB19|C220    |      ;
    LDA.W #$0080                                               ;82EB1B|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;82EB1E|22338A80|808A33;
    JSL.L fCore_StartTransfer                                  ;82EB22|22F08A80|808AF0;
    REP #$30                                                   ;82EB26|C230    |      ;
    INC.B strcVariables.n16Temp1                               ;82EB28|E67E    |00007E;
    INC.B strcVariables.n16Temp1                               ;82EB2A|E67E    |00007E;
    INC.B strcVariables.n16Temp2                               ;82EB2C|E680    |000080;
    INC.B strcVariables.n16Temp2                               ;82EB2E|E680    |000080;
    INC.B strcVariables.n16Temp3                               ;82EB30|E682    |000082;
    INC.B strcVariables.n16Temp3                               ;82EB32|E682    |000082;
    INC.B strcVariables.n16Temp4                               ;82EB34|E684    |000084;
    INC.B strcVariables.n16Temp4                               ;82EB36|E684    |000084;
    INC.B strcVariables.n16Unk86                               ;82EB38|E686    |000086;
    INC.B strcVariables.n16Unk86                               ;82EB3A|E686    |000086;
    PLY                                                        ;82EB3C|7A      |      ;
    INY                                                        ;82EB3D|C8      |      ;
    LDA.L nUnknown82EB55                                       ;82EB3E|AF55EB82|82EB55;
    STA.B strcVariables.n16Unk88                               ;82EB42|8588    |000088;
    CPY.B strcVariables.n16Unk88                               ;82EB44|C488    |000088;
    BNE -                                                      ;82EB46|D089    |82EAD1;
    RTS                                                        ;82EB48|60      |      ;
 
 
nUnknown_82EB49:
    dw $788C                                                   ;82EB49|        |      ; n16
 
nUnknown_82EB4B:
    dw $2002                                                   ;82EB4B|        |      ; n16
 
aUnknown_82EB4D:
    dw $5010,$5020,$5030,$5040                                 ;82EB4D|        |      ; 0x04 * [n16]
 
nUnknown82EB55:
    dw $0004                                                   ;82EB55|        |      ; n16
 
fMenuUnknown_82EB57:
    REP #$30                                                   ;82EB57|C230    |      ;
    LDA.W #$EBF8                                               ;82EB59|A9F8EB  |      ;
    STA.B ptrTemp0x72                                          ;82EB5C|8572    |000072;
    SEP #$20                                                   ;82EB5E|E220    |      ;
    LDA.B #$82                                                 ;82EB60|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82EB62|8574    |000074; 82EBF8 -> $72
    LDA.W strcMenuData.tableSelector                           ;82EB64|AD9309  |000993;
    BEQ .load                                                  ;82EB67|F020    |82EB89;
    CMP.B #$01                                                 ;82EB69|C901    |      ;
    BEQ +                                                      ;82EB6B|F00F    |82EB7C;
    REP #$20                                                   ;82EB6D|C220    |      ;
    LDA.W #$F0D0                                               ;82EB6F|A9D0F0  |      ;
    STA.B ptrTemp0x72                                          ;82EB72|8572    |000072;
    SEP #$20                                                   ;82EB74|E220    |      ;
    LDA.B #$82                                                 ;82EB76|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82EB78|8574    |000074; 82F0D0 -> $72
    BRA .load                                                  ;82EB7A|800D    |82EB89;
 
 
  + REP #$20                                                   ;82EB7C|C220    |      ;
    LDA.W #$EE30                                               ;82EB7E|A930EE  |      ;
    STA.B ptrTemp0x72                                          ;82EB81|8572    |000072;
    SEP #$20                                                   ;82EB83|E220    |      ;
    LDA.B #$82                                                 ;82EB85|A982    |      ; 82EE30 -> $72
    STA.B ptrTemp0x72+2                                        ;82EB87|8574    |000074;
 
.load:
    REP #$20                                                   ;82EB89|C220    |      ;
    LDA.W strcMenuData.menuIdx                                 ;82EB8B|AD9109  |000991;
    ASL A                                                      ;82EB8E|0A      |      ;
    ASL A                                                      ;82EB8F|0A      |      ;
    ASL A                                                      ;82EB90|0A      |      ;
    TAY                                                        ;82EB91|A8      |      ;
    SEP #$20                                                   ;82EB92|E220    |      ;
    LDA.B #$00                                                 ;82EB94|A900    |      ;
    XBA                                                        ;82EB96|EB      |      ; B = 0
    LDA.B [ptrTemp0x72],Y                                      ;82EB97|B772    |000072; Y = $0991 * 8
    REP #$20                                                   ;82EB99|C220    |      ;
    STA.W strcMenuData.posX                                    ;82EB9B|8D9B09  |00099B;
    INY                                                        ;82EB9E|C8      |      ; Y++
    SEP #$20                                                   ;82EB9F|E220    |      ;
    LDA.B #$00                                                 ;82EBA1|A900    |      ;
    XBA                                                        ;82EBA3|EB      |      ; B = 0
    LDA.B [ptrTemp0x72],Y                                      ;82EBA4|B772    |000072;
    REP #$20                                                   ;82EBA6|C220    |      ;
    STA.W strcMenuData.posY                                    ;82EBA8|8D9D09  |00099D;
    RTL                                                        ;82EBAB|6B      |      ;
 
 
fMenuUnknown_82EBAC:
    REP #$30                                                   ;82EBAC|C230    |      ; A: nArg, return A: nResult
    PHA                                                        ;82EBAE|48      |      ; nArg -> stack1
    LDA.W #$EBF8                                               ;82EBAF|A9F8EB  |      ;
    STA.B ptrTemp0x72                                          ;82EBB2|8572    |000072;
    SEP #$20                                                   ;82EBB4|E220    |      ;
    LDA.B #$82                                                 ;82EBB6|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82EBB8|8574    |000074; 82EBF8 -> $72
    LDA.W strcMenuData.tableSelector                           ;82EBBA|AD9309  |000993;
    BEQ .load                                                  ;82EBBD|F020    |82EBDF;
    CMP.B #$01                                                 ;82EBBF|C901    |      ;
    BEQ +                                                      ;82EBC1|F00F    |82EBD2;
    REP #$20                                                   ;82EBC3|C220    |      ;
    LDA.W #$F0D0                                               ;82EBC5|A9D0F0  |      ;
    STA.B ptrTemp0x72                                          ;82EBC8|8572    |000072;
    SEP #$20                                                   ;82EBCA|E220    |      ;
    LDA.B #$82                                                 ;82EBCC|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82EBCE|8574    |000074; 82F0D0 -> $72
    BRA .load                                                  ;82EBD0|800D    |82EBDF;
 
 
  + REP #$20                                                   ;82EBD2|C220    |      ;
    LDA.W #$EE30                                               ;82EBD4|A930EE  |      ;
    STA.B ptrTemp0x72                                          ;82EBD7|8572    |000072;
    SEP #$20                                                   ;82EBD9|E220    |      ;
    LDA.B #$82                                                 ;82EBDB|A982    |      ;
    STA.B ptrTemp0x72+2                                        ;82EBDD|8574    |000074; 82EE30 -> $72
 
.load:
    REP #$20                                                   ;82EBDF|C220    |      ;
    PLA                                                        ;82EBE1|68      |      ; A = nArg
    INC A                                                      ;82EBE2|1A      |      ;
    INC A                                                      ;82EBE3|1A      |      ;
    STA.B strcVariables.n16Temp1                               ;82EBE4|857E    |00007E; $7E = nArg * 4
    LDA.W strcMenuData.menuIdx                                 ;82EBE6|AD9109  |000991; A = $0991
    ASL A                                                      ;82EBE9|0A      |      ;
    ASL A                                                      ;82EBEA|0A      |      ;
    ASL A                                                      ;82EBEB|0A      |      ;
    CLC                                                        ;82EBEC|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;82EBED|657E    |00007E;
    TAY                                                        ;82EBEF|A8      |      ; Y = $0991 * 8 + nArg * 4
    SEP #$20                                                   ;82EBF0|E220    |      ;
    LDA.B #$00                                                 ;82EBF2|A900    |      ;
    XBA                                                        ;82EBF4|EB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;82EBF5|B772    |000072;
    RTL                                                        ;82EBF7|6B      |      ;
 
 
aMenuData_82EBF8:
    db $28,$44,$05,$1F,$01,$28,$1A,$00,$38,$44,$06,$20         ;82EBF8|        |      ; 0x47 * [n8 nPosX, n8 nPosY, n8?, n8?, n8, n8?, n8?, n8?]
    db $02,$00,$1B,$00,$48,$44,$07,$21,$03,$01,$1C,$00         ;82EC04|        |      ;
    db $58,$44,$08,$22,$04,$02,$1D,$00,$68,$44,$09,$23         ;82EC10|        |      ;
    db $24,$03,$1E,$00,$28,$54,$0A,$00,$06,$2D,$1F,$00         ;82EC1C|        |      ;
    db $38,$54,$0B,$01,$07,$05,$20,$00,$48,$54,$0C,$02         ;82EC28|        |      ;
    db $08,$06,$21,$00,$58,$54,$0D,$03,$09,$07,$22,$00         ;82EC34|        |      ;
    db $68,$54,$0E,$04,$29,$08,$23,$00,$28,$64,$0F,$05         ;82EC40|        |      ;
    db $0B,$32,$24,$00,$38,$64,$10,$06,$0C,$0A,$25,$00         ;82EC4C|        |      ;
    db $48,$64,$11,$07,$0D,$0B,$26,$00,$58,$64,$12,$08         ;82EC58|        |      ;
    db $0E,$0C,$27,$00,$68,$64,$13,$09,$2E,$0D,$28,$00         ;82EC64|        |      ;
    db $28,$74,$14,$0A,$10,$37,$29,$00,$38,$74,$15,$0B         ;82EC70|        |      ;
    db $11,$0F,$2A,$00,$48,$74,$16,$0C,$12,$10,$2B,$00         ;82EC7C|        |      ;
    db $58,$74,$17,$0D,$13,$11,$2C,$00,$68,$74,$18,$0E         ;82EC88|        |      ;
    db $33,$12,$2D,$00,$28,$84,$19,$0F,$15,$3C,$2E,$00         ;82EC94|        |      ;
    db $38,$84,$19,$10,$16,$14,$2F,$00,$48,$84,$19,$11         ;82ECA0|        |      ;
    db $17,$15,$30,$00,$58,$84,$19,$12,$18,$16,$31,$00         ;82ECAC|        |      ;
    db $68,$84,$19,$13,$38,$17,$32,$00,$28,$94,$1A,$14         ;82ECB8|        |      ;
    db $3D,$3D,$33,$00,$28,$A4,$1F,$19,$1B,$42,$B2,$00         ;82ECC4|        |      ;
    db $38,$A4,$20,$19,$1C,$1A,$B3,$00,$48,$A4,$21,$19         ;82ECD0|        |      ;
    db $1D,$1B,$B4,$00,$58,$A4,$22,$19,$1E,$1C,$B5,$00         ;82ECDC|        |      ;
    db $68,$A4,$23,$19,$3E,$1D,$B6,$00,$28,$B4,$00,$1A         ;82ECE8|        |      ;
    db $20,$45,$B7,$00,$38,$B4,$01,$1B,$21,$1F,$B8,$00         ;82ECF4|        |      ;
    db $48,$B4,$02,$1C,$22,$20,$B9,$00,$58,$B4,$03,$1D         ;82ED00|        |      ;
    db $23,$21,$BA,$00,$68,$B4,$04,$1E,$43,$22,$BB,$00         ;82ED0C|        |      ;
    db $88,$44,$29,$46,$25,$04,$00,$00,$98,$44,$2A,$46         ;82ED18|        |      ;
    db $26,$24,$01,$00,$A8,$44,$2B,$46,$27,$25,$02,$00         ;82ED24|        |      ;
    db $B8,$44,$2C,$46,$28,$26,$03,$00,$C8,$44,$2D,$46         ;82ED30|        |      ;
    db $00,$27,$04,$00,$88,$54,$2E,$24,$2A,$09,$05,$00         ;82ED3C|        |      ;
    db $98,$54,$2F,$25,$2B,$29,$06,$00,$A8,$54,$30,$26         ;82ED48|        |      ;
    db $2C,$2A,$07,$00,$B8,$54,$31,$27,$2D,$2B,$08,$00         ;82ED54|        |      ;
    db $C8,$54,$32,$28,$05,$2C,$09,$00,$88,$64,$33,$29         ;82ED60|        |      ;
    db $2F,$0E,$0A,$00,$98,$64,$34,$2A,$30,$2E,$0B,$00         ;82ED6C|        |      ;
    db $A8,$64,$35,$2B,$31,$2F,$0C,$00,$B8,$64,$36,$2C         ;82ED78|        |      ;
    db $32,$30,$0D,$00,$C8,$64,$37,$2D,$0A,$31,$0E,$00         ;82ED84|        |      ;
    db $88,$74,$38,$2E,$34,$13,$0F,$00,$98,$74,$39,$2F         ;82ED90|        |      ;
    db $35,$33,$10,$00,$A8,$74,$3A,$30,$36,$34,$11,$00         ;82ED9C|        |      ;
    db $B8,$74,$3B,$31,$37,$35,$12,$00,$C8,$74,$3C,$32         ;82EDA8|        |      ;
    db $0F,$36,$13,$00,$88,$84,$3D,$33,$39,$18,$14,$00         ;82EDB4|        |      ;
    db $98,$84,$3D,$34,$3A,$38,$15,$00,$A8,$84,$3D,$35         ;82EDC0|        |      ;
    db $3B,$39,$16,$00,$B8,$84,$3D,$36,$3C,$3A,$17,$00         ;82EDCC|        |      ;
    db $C8,$84,$3D,$37,$14,$3B,$18,$00,$88,$94,$3E,$38         ;82EDD8|        |      ;
    db $19,$19,$19,$00,$88,$A4,$43,$3D,$3F,$1E,$38,$00         ;82EDE4|        |      ;
    db $98,$A4,$44,$3D,$40,$3E,$39,$00,$A8,$A4,$45,$3D         ;82EDF0|        |      ;
    db $41,$3F,$3B,$00,$B8,$A4,$45,$3D,$42,$40,$3C,$00         ;82EDFC|        |      ;
    db $C8,$A4,$45,$3D,$1A,$41,$3D,$00,$88,$B4,$24,$3E         ;82EE08|        |      ;
    db $44,$23,$40,$00,$98,$B4,$25,$3F,$45,$43,$41,$00         ;82EE14|        |      ;
    db $A8,$B4,$46,$40,$1F,$44,$42,$00,$C0,$C4,$28,$45         ;82EE20|        |      ;
    db $45,$45,$00,$04                                         ;82EE2C|        |      ;
 
aMenuData_82EE30:
    db $28,$44,$05,$28,$01,$31,$50,$00,$38,$44,$06,$29         ;82EE30|        |      ; 0x54 * [n8 nPosX, n8 nPosY, n8?, n8?, n8, n8?, n8?, n8?]
    db $02,$00,$51,$00,$48,$44,$07,$2A,$03,$01,$52,$00         ;82EE3C|        |      ;
    db $58,$44,$08,$2B,$04,$02,$53,$00,$68,$44,$09,$2C         ;82EE48|        |      ;
    db $2D,$03,$54,$00,$28,$54,$0A,$00,$06,$36,$55,$00         ;82EE54|        |      ;
    db $38,$54,$0B,$01,$07,$05,$56,$00,$48,$54,$0C,$02         ;82EE60|        |      ;
    db $08,$06,$57,$00,$58,$54,$0D,$03,$09,$07,$58,$00         ;82EE6C|        |      ;
    db $68,$54,$0E,$04,$32,$08,$59,$00,$28,$64,$0F,$05         ;82EE78|        |      ;
    db $0B,$3B,$5A,$00,$38,$64,$10,$06,$0C,$0A,$5B,$00         ;82EE84|        |      ;
    db $48,$64,$11,$07,$0D,$0B,$5C,$00,$58,$64,$12,$08         ;82EE90|        |      ;
    db $0E,$0C,$5D,$00,$68,$64,$13,$09,$37,$0D,$5E,$00         ;82EE9C|        |      ;
    db $28,$74,$14,$0A,$10,$40,$5F,$00,$38,$74,$15,$0B         ;82EEA8|        |      ;
    db $11,$0F,$60,$00,$48,$74,$16,$0C,$12,$10,$61,$00         ;82EEB4|        |      ;
    db $58,$74,$17,$0D,$13,$11,$62,$00,$68,$74,$18,$0E         ;82EEC0|        |      ;
    db $3C,$12,$63,$00,$28,$84,$19,$0F,$15,$45,$64,$00         ;82EECC|        |      ;
    db $38,$84,$1A,$10,$16,$14,$65,$00,$48,$84,$1B,$11         ;82EED8|        |      ;
    db $17,$15,$66,$00,$58,$84,$1C,$12,$18,$16,$67,$00         ;82EEE4|        |      ;
    db $68,$84,$1D,$13,$41,$17,$68,$00,$28,$94,$1E,$14         ;82EEF0|        |      ;
    db $1A,$4A,$69,$00,$38,$94,$1F,$15,$1B,$19,$6A,$00         ;82EEFC|        |      ;
    db $48,$94,$20,$16,$1C,$1A,$6B,$00,$58,$94,$21,$17         ;82EF08|        |      ;
    db $1D,$1B,$6C,$00,$68,$94,$22,$18,$46,$1C,$6D,$00         ;82EF14|        |      ;
    db $28,$A4,$23,$19,$1F,$4F,$6E,$00,$38,$A4,$24,$1A         ;82EF20|        |      ;
    db $20,$1E,$6F,$00,$48,$A4,$25,$1B,$21,$1F,$70,$00         ;82EF2C|        |      ;
    db $58,$A4,$26,$1C,$22,$20,$71,$00,$68,$A4,$27,$1D         ;82EF38|        |      ;
    db $4B,$21,$72,$00,$28,$B4,$28,$1E,$24,$52,$73,$00         ;82EF44|        |      ;
    db $38,$B4,$29,$1F,$25,$23,$74,$00,$48,$B4,$2A,$20         ;82EF50|        |      ;
    db $26,$24,$75,$00,$58,$B4,$2B,$21,$27,$25,$7B,$00         ;82EF5C|        |      ;
    db $68,$B4,$2C,$22,$50,$26,$7C,$00,$28,$C4,$00,$23         ;82EF68|        |      ;
    db $29,$53,$76,$00,$38,$C4,$01,$24,$2A,$28,$77,$00         ;82EF74|        |      ;
    db $48,$C4,$02,$25,$2B,$29,$78,$00,$58,$C4,$03,$26         ;82EF80|        |      ;
    db $2C,$2A,$79,$00,$68,$C4,$04,$27,$53,$2B,$7A,$00         ;82EF8C|        |      ;
    db $88,$44,$32,$50,$2E,$04,$87,$00,$98,$44,$33,$4C         ;82EF98|        |      ;
    db $2F,$2D,$88,$00,$A8,$44,$34,$51,$30,$2E,$89,$00         ;82EFA4|        |      ;
    db $B8,$44,$35,$53,$31,$2F,$8A,$00,$C8,$44,$36,$53         ;82EFB0|        |      ;
    db $00,$30,$8B,$00,$88,$54,$37,$2D,$33,$09,$8C,$00         ;82EFBC|        |      ;
    db $98,$54,$38,$2E,$34,$32,$8D,$00,$A8,$54,$39,$2F         ;82EFC8|        |      ;
    db $35,$33,$8E,$00,$B8,$54,$3A,$30,$36,$34,$8F,$00         ;82EFD4|        |      ;
    db $C8,$54,$3B,$31,$05,$35,$90,$00,$88,$64,$3C,$32         ;82EFE0|        |      ;
    db $38,$0E,$91,$00,$98,$64,$3D,$33,$39,$37,$92,$00         ;82EFEC|        |      ;
    db $A8,$64,$3E,$34,$3A,$38,$93,$00,$B8,$64,$3F,$35         ;82EFF8|        |      ;
    db $3B,$39,$94,$00,$C8,$64,$40,$36,$0A,$3A,$95,$00         ;82F004|        |      ;
    db $88,$74,$41,$37,$3D,$13,$96,$00,$98,$74,$42,$38         ;82F010|        |      ;
    db $3E,$3C,$97,$00,$A8,$74,$43,$39,$3F,$3D,$98,$00         ;82F01C|        |      ;
    db $B8,$74,$44,$3A,$40,$3E,$99,$00,$C8,$74,$45,$3B         ;82F028|        |      ;
    db $0F,$3F,$9A,$00,$88,$84,$46,$3C,$42,$18,$9B,$00         ;82F034|        |      ;
    db $98,$84,$47,$3D,$43,$41,$9C,$00,$A8,$84,$48,$3E         ;82F040|        |      ;
    db $44,$42,$9D,$00,$B8,$84,$49,$3F,$45,$43,$9E,$00         ;82F04C|        |      ;
    db $C8,$84,$4A,$40,$14,$44,$9F,$00,$88,$94,$4B,$41         ;82F058|        |      ;
    db $47,$1D,$7E,$00,$98,$94,$4C,$42,$48,$46,$7F,$00         ;82F064|        |      ;
    db $A8,$94,$4D,$43,$49,$47,$80,$00,$B8,$94,$4E,$44         ;82F070|        |      ;
    db $4A,$48,$81,$00,$C8,$94,$4F,$45,$19,$49,$82,$00         ;82F07C|        |      ;
    db $88,$A4,$50,$46,$4C,$22,$84,$00,$98,$A4,$2E,$47         ;82F088|        |      ;
    db $4D,$4B,$85,$00,$A8,$A4,$51,$48,$4E,$4C,$86,$00         ;82F094|        |      ;
    db $B8,$A4,$53,$49,$4F,$4D,$83,$00,$C8,$A4,$52,$4A         ;82F0A0|        |      ;
    db $1E,$4E,$7D,$00,$88,$B4,$2D,$4B,$51,$27,$A0,$00         ;82F0AC|        |      ;
    db $A8,$B4,$2F,$4D,$52,$50,$00,$01,$C8,$B4,$53,$4F         ;82F0B8|        |      ;
    db $23,$51,$00,$03,$C0,$C4,$31,$52,$28,$2C,$00,$04         ;82F0C4|        |      ;
 
aMenuData_82F0D0:
    db $28,$44,$05,$23,$01,$04,$C6,$00,$38,$44,$06,$24         ;82F0D0|        |      ; 0x31 * [n8 nPosX, n8 nPosY, n8?, n8?, n8, n8?, n8?, n8?]
    db $02,$00,$C7,$00,$48,$44,$07,$25,$03,$01,$C8,$00         ;82F0DC|        |      ;
    db $58,$44,$08,$26,$04,$02,$C9,$00,$68,$44,$09,$27         ;82F0E8|        |      ;
    db $00,$03,$CA,$00,$28,$54,$0A,$00,$06,$09,$CB,$00         ;82F0F4|        |      ;
    db $38,$54,$0B,$01,$07,$05,$CC,$00,$48,$54,$0C,$02         ;82F100|        |      ;
    db $08,$06,$CD,$00,$58,$54,$0D,$03,$09,$07,$CE,$00         ;82F10C|        |      ;
    db $68,$54,$0E,$04,$05,$08,$CF,$00,$28,$64,$0F,$05         ;82F118|        |      ;
    db $0B,$0E,$D0,$00,$38,$64,$10,$06,$0C,$0A,$D1,$00         ;82F124|        |      ;
    db $48,$64,$11,$07,$0D,$0B,$D2,$00,$58,$64,$12,$08         ;82F130|        |      ;
    db $0E,$0C,$D3,$00,$68,$64,$13,$09,$0A,$0D,$D4,$00         ;82F13C|        |      ;
    db $28,$74,$14,$0A,$10,$13,$D5,$00,$38,$74,$15,$0B         ;82F148|        |      ;
    db $11,$0F,$D6,$00,$48,$74,$16,$0C,$12,$10,$D7,$00         ;82F154|        |      ;
    db $58,$74,$17,$0D,$13,$11,$D8,$00,$68,$74,$18,$0E         ;82F160|        |      ;
    db $0F,$12,$D9,$00,$28,$84,$19,$0F,$15,$18,$DA,$00         ;82F16C|        |      ;
    db $38,$84,$1A,$10,$16,$14,$DB,$00,$48,$84,$1B,$11         ;82F178|        |      ;
    db $17,$15,$DC,$00,$58,$84,$1C,$12,$18,$16,$DD,$00         ;82F184|        |      ;
    db $68,$84,$1D,$13,$14,$17,$DE,$00,$28,$94,$1E,$14         ;82F190|        |      ;
    db $1A,$2C,$DF,$00,$38,$94,$1F,$15,$1B,$19,$B2,$00         ;82F19C|        |      ;
    db $48,$94,$20,$16,$1C,$1A,$B3,$00,$58,$94,$21,$17         ;82F1A8|        |      ;
    db $1D,$1B,$B4,$00,$68,$94,$22,$18,$28,$1C,$B5,$00         ;82F1B4|        |      ;
    db $28,$A4,$23,$19,$1F,$30,$B6,$00,$38,$A4,$24,$1A         ;82F1C0|        |      ;
    db $20,$1E,$B7,$00,$48,$A4,$25,$1B,$21,$1F,$B8,$00         ;82F1CC|        |      ;
    db $58,$A4,$26,$1C,$22,$20,$B9,$00,$68,$A4,$27,$1D         ;82F1D8|        |      ;
    db $2D,$21,$BA,$00,$28,$B4,$00,$1E,$24,$30,$BB,$00         ;82F1E4|        |      ;
    db $38,$B4,$01,$1F,$25,$23,$A5,$00,$48,$B4,$02,$20         ;82F1F0|        |      ;
    db $26,$24,$A6,$00,$58,$B4,$03,$21,$27,$25,$A7,$00         ;82F1FC|        |      ;
    db $68,$B4,$04,$22,$30,$26,$A8,$00,$88,$94,$2D,$2D         ;82F208|        |      ;
    db $29,$1D,$AB,$00,$98,$94,$29,$29,$2A,$28,$AC,$00         ;82F214|        |      ;
    db $A8,$94,$2E,$2E,$2B,$29,$AD,$00,$B8,$94,$2B,$2B         ;82F220|        |      ;
    db $2C,$2A,$AE,$00,$C8,$94,$2F,$30,$19,$2B,$A9,$00         ;82F22C|        |      ;
    db $88,$A4,$28,$28,$2E,$22,$AA,$00,$A8,$A4,$2A,$2A         ;82F238|        |      ;
    db $2F,$2D,$00,$01,$C8,$A4,$30,$2C,$1E,$2E,$00,$02         ;82F244|        |      ;
    db $C0,$B4,$2C,$2F,$23,$27,$00,$04                         ;82F250|        |      ;
 
aUnknown_82F258:
    dw $78C6,$78D0,$7908,$7910,$7A06,$7A10                     ;82F258|        |      ;
    dw $7A48,$7A50                                             ;82F264|        |      ;
 
aUnknown_82F268:
    dw $2002,$2006,$200A,$200C,$2022,$2026                     ;82F268|        |      ;
    dw $202A,$202C                                             ;82F274|        |      ;
 
aUnknown_82F278:
    dw $5010,$5030,$5050,$5060,$5110,$5130                     ;82F278|        |      ;
    dw $5150,$5160                                             ;82F284|        |      ;
 
aUnknown_82F288:
    dw $0002,$0002,$0001,$0003,$0002,$0002                     ;82F288|        |      ;
    dw $0001,$0003                                             ;82F294|        |      ;
 
sYearOrdinal_82F298:
    dw $0012,$0013,$000D,$0003,$0011,$0003                     ;82F298|        |      ; 0x03 * [s16, s16]
 
aUnknown_82F2A4:
    dl $207F10,$107EF0,$107E8E                                 ;82F2A4|        |      ;
 
DATA24_82F2AD:
    dl $10720A                                                 ;82F2AD|        |      ;
    dw $FFFE                                                   ;82F2B0|        |      ;
    dl DATA24_82F2AD                                           ;82F2B2|        |82F2AD;
 
aUnknown_82F2B5:
    dl $107A8A,$10724A,$106DE5,$1065A3                         ;82F2B5|        |      ;
 
DATA24_82F2C1:
    dl $1058C3                                                 ;82F2C1|        |      ;
    dw $FFFE                                                   ;82F2C4|        |      ;
    dl DATA24_82F2C1                                           ;82F2C6|        |82F2C1;
 
aUnknown_82F2C9:
    dl $08629F,$085E1F,$1059DF,$085E1F                         ;82F2C9|        |      ;
    dw $FFFE                                                   ;82F2D5|        |      ;
    dl aUnknown_82F2C9                                         ;82F2D7|        |82F2C9;
 
aUnknown_82F2DA:
    dl $087F3F                                                 ;82F2DA|        |      ;
    dw $FFFE                                                   ;82F2DD|        |      ;
    dl aUnknown_82F2DA                                         ;82F2DF|        |82F2DA;
 
aUnknown_82F2E2:
    dl $041D4D,$04035D,$0403FF,$0437FF                         ;82F2E2|        |      ;
    dl $0403FF,$04035D                                         ;82F2EE|        |      ;
    dw $FFFE                                                   ;82F2F4|        |      ;
    dl aUnknown_82F2E2                                         ;82F2F6|        |82F2E2;
 
aUnknown_82F2F9:
    dl $041D4D                                                 ;82F2F9|        |      ;
    dw $FFFE                                                   ;82F2FC|        |      ;
    dl aUnknown_82F2F9                                         ;82F2FE|        |82F2F9;
 
    pad $82FFFF
