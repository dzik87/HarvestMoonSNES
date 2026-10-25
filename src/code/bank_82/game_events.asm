 
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
    JSL.L fEvents_NoonMealCheck                                      ;82805B|22AA8082|8280AA;
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
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;828081|22018483|838401;
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
 
 
fEvents_NoonMealCheck:
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
    JSL.L fAI_SetSlotScript                                    ;8281AE|223F8084|84803F;
    REP #$20                                                   ;8281B2|C220    |      ;
    %UnsetFlag(daily1, $0400)
 
fEvents_ShippingSceneReturn:
    RTL                                                        ;8281BF|6B      |      ;
 
 
fWeather_SetForecastDialogIndex:
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
 
fObjectMap_ApplyHuricaneDamageByMapFlags:
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
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;828301|22018483|838401;
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
    JSL.L fObjectMap_UpdateFarmTilesNewDay                             ;828398|2211A882|82A811;
    JSL.L fObjectMap_ApplyHuricaneDamageByMapFlags                                      ;82839C|22098282|828209;
    JSL.L fGameEngine_AnimalsDailyUpdate                     ;8283A0|225ABC83|83BC5A;
    JSL.L fWeatherRandomizer                                   ;8283A4|22F98C82|828CF9;
    JSL.L fCore_FindBestLove                                   ;8283A8|22C68E82|828EC6;
    JSL.L fEvents_UpdateMarriageAndChildGrowth                                      ;8283AC|22908782|828790;
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
    LDA.W $09A3+!RAM_SHIFT                                 ;8285BF|ADA309  |0009A3;
    INC A                                                      ;8285C2|1A      |      ;
    STA.W $09A3+!RAM_SHIFT                                 ;8285C3|8DA309  |0009A3;
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
    LDA.W $09A3+!RAM_SHIFT                                 ;8285F8|ADA309  |0009A3;
    INC A                                                      ;8285FB|1A      |      ;
    STA.W $09A3+!RAM_SHIFT                                 ;8285FC|8DA309  |0009A3;
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
    LDA.W $09A3+!RAM_SHIFT                                 ;828631|ADA309  |0009A3;
    INC A                                                      ;828634|1A      |      ;
    STA.W $09A3+!RAM_SHIFT                                 ;828635|8DA309  |0009A3;
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
    LDA.W $09A3+!RAM_SHIFT                                 ;82866A|ADA309  |0009A3;
    INC A                                                      ;82866D|1A      |      ;
    STA.W $09A3+!RAM_SHIFT                                 ;82866E|8DA309  |0009A3;
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
    LDA.W $09A3+!RAM_SHIFT                                 ;8286A3|ADA309  |0009A3;
    INC A                                                      ;8286A6|1A      |      ;
    STA.W $09A3+!RAM_SHIFT                                 ;8286A7|8DA309  |0009A3;
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
    LDA.W $098E+!RAM_SHIFT                                 ;82870B|AD8E09  |00098E;
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
    JSL.L fMap_ResetAndLoadDestinationArea                                      ;82875E|22D39680|8096D3;
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
 
 
fEvents_UpdateMarriageAndChildGrowth:
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
    if !REGION_JP
    TAX
    LDA.L aUnused_828AC3,X
    STA.W $08B1
    else
    ASL A                                                      ;8289E4|0A      |      ;
    ASL A                                                      ;8289E5|0A      |      ;
    ASL A                                                      ;8289E6|0A      |      ; * 16
    TAX                                                        ;8289E7|AA      |      ;
    if !REGION_DE
    LDA.L $828B03,X
    else
    LDA.L aSeasonString,X                                      ;8289E8|BFD98A82|828AD9;
    endif
    STA.W strcNames.wSeason                                    ;8289EC|8DB308  |0008B3;
    INX                                                        ;8289EF|E8      |      ;
    INX                                                        ;8289F0|E8      |      ;
    if !REGION_DE
    LDA.L $828B03,X
    else
    LDA.L aSeasonString,X                                      ;8289F1|BFD98A82|828AD9;
    endif
    STA.W strcNames.wSeason+2                                  ;8289F5|8DB508  |0008B5;
    INX                                                        ;8289F8|E8      |      ;
    INX                                                        ;8289F9|E8      |      ;
    if !REGION_DE
    LDA.L $828B03,X
    else
    LDA.L aSeasonString,X                                      ;8289FA|BFD98A82|828AD9;
    endif
    STA.W strcNames.wSeason+4                                  ;8289FE|8DB708  |0008B7;
    INX                                                        ;828A01|E8      |      ;
    INX                                                        ;828A02|E8      |      ;
    if !REGION_DE
    LDA.L $828B03,X
    else
    LDA.L aSeasonString,X                                      ;828A03|BFD98A82|828AD9;
    endif
    STA.W strcNames.wSeason+6                                  ;828A07|8DB908  |0008B9;
    INX                                                        ;828A0A|E8      |      ;
    INX                                                        ;828A0B|E8      |      ;
    if !REGION_DE
    LDA.L $828B03,X
    else
    LDA.L aSeasonString,X                                      ;828A0C|BFD98A82|828AD9;
    endif
    STA.W strcNames.wSeason+8                                  ;828A10|8DBB08  |0008BB;
    INX                                                        ;828A13|E8      |      ;
    INX                                                        ;828A14|E8      |      ;
    if !REGION_DE
    LDA.L $828B03,X
    STA.W strcNames.wSeason+10
    INX
    INX
    LDA.L $828B03,X
    STA.W strcNames.wWeekday
    INX
    INX
    LDA.L $828B03,X
    STA.W strcNames.wWeekday+2
    else
    LDA.L aSeasonString,X                                      ;828A15|BFD98A82|828AD9;
    STA.W strcNames.wSeason+10                                 ;828A19|8DBD08  |0008BD;
    endif
    endif
    SEP #$20                                                   ;828A1C|E220    |      ;
    LDA.B #$00                                                 ;828A1E|A900    |      ;
    XBA                                                        ;828A20|EB      |      ;
    LDA.L nCurrentWeekdayID                                    ;828A21|AF1A1F7F|7F1F1A;
    REP #$20                                                   ;828A25|C220    |      ;
    if !REGION_JP
.first:
.nd:
.rd:
.loadordinal:
    ASL A
    TAX
    LDA.L L_828ACB,X
    STA.W $08B3
    RTL
aUnused_828AC3:
    db $69,$01,$CB,$01,$15,$01,$27,$01,$29,$01,$3C,$01,$78,$02,$6C,$01
    db $AA,$01,$38,$01,$E4,$00
fWeatherForecast_828C09:
    REP #$30
    STZ.W strcDialogDisplay.mapFlags
    else
    ASL A                                                      ;828A27|0A      |      ;
    ASL A                                                      ;828A28|0A      |      ;
    ASL A                                                      ;828A29|0A      |      ;
    ASL A                                                      ;828A2A|0A      |      ;
    ASL A                                                      ;828A2B|0A      |      ;
    TAX                                                        ;828A2C|AA      |      ;
    LDA.L aWeekdayString,X                                     ;828A2D|BF198B82|828B19;
    if !REGION_DE
    STA.W strcNames.wWeekday+4
    INX
    INX
    LDA.L aWeekdayString,X
    STA.W strcNames.wWeekday+6
    else
    STA.W strcNames.wWeekday                                   ;828A31|8DBF08  |0008BF;
    endif
    INX                                                        ;828A34|E8      |      ;
    INX                                                        ;828A35|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A36|BF198B82|828B19;
    if !REGION_DE
    STA.W strcNames.wWeekday+8
    else
    STA.W strcNames.wWeekday+2                                 ;828A3A|8DC108  |0008C1;
    endif
    INX                                                        ;828A3D|E8      |      ;
    INX                                                        ;828A3E|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A3F|BF198B82|828B19;
    if !REGION_DE
    STA.W strcNames.wWeekday+10
    else
    STA.W strcNames.wWeekday+4                                 ;828A43|8DC308  |0008C3;
    endif
    INX                                                        ;828A46|E8      |      ;
    INX                                                        ;828A47|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A48|BF198B82|828B19;
    if !REGION_DE
    STA.W strcNames.wWeekday+12
    else
    STA.W strcNames.wWeekday+6                                 ;828A4C|8DC508  |0008C5;
    endif
    INX                                                        ;828A4F|E8      |      ;
    INX                                                        ;828A50|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A51|BF198B82|828B19;
    if !REGION_DE
    STA.W strcNames.wWeekday+14
    else
    STA.W strcNames.wWeekday+8                                 ;828A55|8DC708  |0008C7;
    endif
    INX                                                        ;828A58|E8      |      ;
    INX                                                        ;828A59|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A5A|BF198B82|828B19;
    if !REGION_DE
    STA.W strcNames.wWeekday+16
    else
    STA.W strcNames.wWeekday+10                                ;828A5E|8DC908  |0008C9;
    endif
    INX                                                        ;828A61|E8      |      ;
    INX                                                        ;828A62|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A63|BF198B82|828B19;
    if !REGION_DE
    STA.W $08D1
    else
    STA.W strcNames.wWeekday+12                                ;828A67|8DCB08  |0008CB;
    endif
    INX                                                        ;828A6A|E8      |      ;
    INX                                                        ;828A6B|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A6C|BF198B82|828B19;
    if !REGION_DE
    STA.W $08D3
    else
    STA.W strcNames.wWeekday+14                                ;828A70|8DCD08  |0008CD;
    endif
    INX                                                        ;828A73|E8      |      ;
    INX                                                        ;828A74|E8      |      ;
    LDA.L aWeekdayString,X                                     ;828A75|BF198B82|828B19;
    if !REGION_DE
    STA.W $08D5
    else
    STA.W strcNames.wWeekday+16                                ;828A79|8DCF08  |0008CF;
    endif
    SEP #$20                                                   ;828A7C|E220    |      ;
    LDA.B #$00                                                 ;828A7E|A900    |      ;
    XBA                                                        ;828A80|EB      |      ;
    LDA.L nCurrentDay                                          ;828A81|AF1B1F7F|7F1F1B;
    if !REGION_EUDE
    REP #$30
    CMP.W #$0001
    BEQ .first
    CMP.W #$0002
    BEQ .nd
    CMP.W #$0003
    BEQ .rd
    CMP.W #$0015
    BEQ .first
    CMP.W #$0016
    BEQ .nd
    CMP.W #$0017
    else
    REP #$20                                                   ;828A85|C220    |      ;
    CMP.W #$0001                                               ;828A87|C90100  |      ;
    BEQ .first                                                 ;828A8A|F00F    |828A9B;
    CMP.W #$0002                                               ;828A8C|C90200  |      ;
    BEQ .nd                                                    ;828A8F|F011    |828AA2;
    CMP.W #$0003                                               ;828A91|C90300  |      ;
    endif
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
    if !REGION_DE
    LDA.L L_828BC3,X
    else
    LDA.L aDayOrdinalString,X                                  ;828AB2|BFF98B82|828BF9;
    endif
    STA.W strcNames.wDayOrdinal                                ;828AB6|8DD108  |0008D1;
    INX                                                        ;828AB9|E8      |      ;
    INX                                                        ;828ABA|E8      |      ;
    if !REGION_DE
    LDA.L L_828BC3,X
    else
    LDA.L aDayOrdinalString,X                                  ;828ABB|BFF98B82|828BF9;
    endif
    STA.W strcNames.wDayOrdinal+2                              ;828ABF|8DD308  |0008D3;
    RTL                                                        ;828AC2|6B      |      ;
 
 
aUnused_828AC3:
    db $69,$01,$CB,$01,$15,$01,$27,$01,$29,$01,$3C,$01         ;828AC3|        |      ;
    if !REGION_DE
    db $78,$02,$6C,$01,$AA,$01,$38,$01,$E4,$00,$1F,$00,$11,$00,$45,$00
    db $07,$00,$0B,$00,$08,$00,$0D,$00,$06,$00,$2C,$00,$0E,$00,$0C,$00
    db $0C,$00,$04,$00,$11,$00,$B1,$00,$B1,$00,$21,$00,$04,$00,$11,$00
    db $01,$00,$12,$00,$13,$00,$B1,$00,$B1,$00,$30,$00,$08,$00,$0D,$00
    db $13,$00,$04,$00,$11,$00,$B1,$00,$B1,$00
    else
    db $78,$02,$6C,$01,$AA,$01,$38,$01,$E4,$00                 ;828ACF|        |      ;
    endif
 
aSeasonString:
    dw $002C,$000F,$0011,$0008,$000D,$0006                     ;828AD9|        |      ; 0x04 * [string[16]]
    dw $0000,$0000,$002C,$0014,$000C,$000C                     ;828AE5|        |      ;
    dw $0004,$0011,$0000,$0000,$001F,$0000                     ;828AF1|        |      ;
    dw $000B,$000B,$00B1,$00B1,$0000,$0000                     ;828AFD|        |      ;
    dw $0030,$0008,$000D,$0013,$0004,$0011                     ;828B09|        |      ;
    dw $0000,$0000                                             ;828B15|        |      ;
 
aWeekdayString:
    if !REGION_DE
    db $2C,$00,$0E,$00,$0D,$00,$0D,$00,$13,$00,$00,$00,$06,$00,$B1,$00
    db $B1,$00,$B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $26,$00,$0E,$00,$0D,$00,$13,$00,$00,$00,$06,$00,$B1,$00,$B1,$00
    db $B1,$00,$B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $1D,$00,$08,$00,$04,$00,$0D,$00,$12,$00,$13,$00,$00,$00,$06,$00
    db $B1,$00,$B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $26,$00,$08,$00,$13,$00,$13,$00,$16,$00,$0E,$00,$02,$00,$07,$00
    db $B1,$00,$B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $1D,$00,$0E,$00,$0D,$00,$0D,$00,$04,$00,$11,$00,$12,$00,$13,$00
    db $00,$00,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $1F,$00,$11,$00,$04,$00,$08,$00,$13,$00,$00,$00,$06,$00,$B1,$00
    db $B1,$00,$B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $2C,$00,$0E,$00,$0D,$00,$0D,$00,$00,$00,$01,$00,$04,$00,$0D,$00
    db $03,$00,$B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $12,$00,$13,$00,$0D,$00,$03,$00,$11,$00,$03,$00,$13,$00,$07,$00
    db $00,$00,$04,$00,$08,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00
    db $0C,$00,$0C,$00,$00,$00,$04,$00,$08,$00,$0C,$00,$0C,$00,$0C,$00
    db $0C,$00,$0C,$00,$0C,$00,$0C,$00,$00,$00,$04,$00,$08,$00,$0C,$00
    db $0C,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00,$E2,$20,$C2,$10
    db $A9,$00,$EB,$AF,$19,$1F,$7F,$C2,$20,$0A,$0A,$0A,$0A,$AA,$BF,$43
    db $8B,$82,$8D,$B3,$08,$E8,$E8,$BF,$43,$8B,$82,$8D,$B5,$08,$E8,$E8
    db $BF,$43,$8B,$82,$8D,$B7,$08,$E8,$E8,$BF,$43,$8B,$82,$8D,$B9,$08
    db $E8,$E8,$BF,$43,$8B,$82,$8D,$BB,$08,$E8,$E8,$BF,$43,$8B,$82,$8D
    db $BD,$08,$E8,$E8,$BF,$43,$8B,$82,$8D,$BF,$08,$E8,$E8,$BF,$43,$8B
    db $82,$8D,$C1,$08,$E2,$20,$A9,$00
aDayOrdinalString:
    db $EB,$AF,$1A,$1F,$7F,$C2,$20,$0A,$0A,$0A,$0A,$0A,$AA,$BF,$83,$8B
    db $82,$8D,$C3,$08,$E8,$E8,$BF,$83,$8B,$82,$8D,$C5,$08,$E8,$E8,$BF
    db $83,$8B,$82,$8D,$C7,$08,$E8,$E8,$BF,$83,$8B,$82,$8D,$C9,$08,$E8
    db $E8,$BF,$83,$8B,$82,$8D,$CB,$08,$E8,$E8,$BF,$83,$8B,$82,$8D,$CD
    db $08,$E8,$E8,$BF,$83,$8B,$82,$8D,$CF,$08,$E8,$E8,$BF,$83,$8B,$82
    db $8D,$D1,$08,$E8,$E8,$BF,$83,$8B,$82,$8D,$D3,$08,$E8,$E8,$BF,$83
    db $8B,$82,$8D,$D5,$08,$E2,$20,$A9,$00,$EB,$AF,$1B,$1F,$7F,$C2,$30
    db $C9,$01,$00,$F0,$1E,$C9,$02,$00,$F0,$20,$C9,$03,$00,$F0,$22,$C9
    db $15,$00,$F0,$0F,$C9,$16,$00,$F0,$11,$C9,$17,$00,$F0,$13,$A2,$0C
    db $00,$80,$15,$C2,$30,$A2,$00,$00,$80,$0E,$C2,$30,$A2,$04,$00,$80
    db $07,$C2,$30,$A2,$08,$00,$80,$00,$C2,$30,$BF,$63,$8C,$82,$8D,$D7
    db $08,$E8,$E8,$BF,$63,$8C,$82,$8D,$D9,$08,$6B
fWeatherForecast_828C09:
    REP #$30
    STZ.W strcDialogDisplay.mapFlags
    elseif !REGION_EU
    db $2C,$00,$14,$00,$0D,$00,$03,$00,$00,$00,$18,$00,$B1,$00,$B1,$00
    db $B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $26,$00,$0E,$00,$0D,$00,$03,$00,$00,$00,$18,$00,$B1,$00,$B1,$00
    db $B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $2D,$00,$14,$00,$04,$00,$12,$00,$03,$00,$00,$00,$18,$00,$B1,$00
    db $B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $30,$00,$04,$00,$03,$00,$0D,$00,$04,$00,$12,$00,$03,$00,$00,$00
    db $18,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $2D,$00,$07,$00,$14,$00,$11,$00,$12,$00,$03,$00,$00,$00,$18,$00
    db $B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $1F,$00,$11,$00,$08,$00,$03,$00,$00,$00,$18,$00,$B1,$00,$B1,$00
    db $B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $2C,$00,$00,$00,$13,$00,$14,$00,$11,$00,$03,$00,$00,$00,$18,$00
    db $B1,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
aDayOrdinalString:
    db $12,$00,$13,$00,$0D,$00,$03,$00,$11,$00,$03,$00,$13,$00,$07,$00
    db $00,$00,$04,$00,$08,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00
    db $0C,$00,$0C,$00,$00,$00,$04,$00,$08,$00,$0C,$00,$0C,$00,$0C,$00
    db $0C,$00,$0C,$00,$0C,$00,$0C,$00,$00,$00,$04,$00,$08,$00,$0C,$00
    db $0C,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00,$0C,$00
fWeatherForecast_828C09:
    REP #$30
    STZ.W strcDialogDisplay.mapFlags
    else
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
    endif
    endif
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
 
 
    incsrc "../../../build/gen/blocks/day_event_tables.asm"
 
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
    if !REGION_JP
    BEQ .eve
.maria:
    REP #$30
    LDA.W #$006E
    STA.W strcNames.wMostLovedGirl
    LDA.W #$0077
    STA.W strcNames.wMostLovedGirl+2
    LDA.W #$0050
    STA.W strcNames.wMostLovedGirl+4
    LDA.W #$00B1
    STA.W strcNames.wMostLovedGirl+6
    RTL
.ann:
    REP #$30
    LDA.W #$0050
    STA.W strcNames.wMostLovedGirl
    LDA.W #$007D
    STA.W strcNames.wMostLovedGirl+2
    LDA.W #$00B1
    STA.W strcNames.wMostLovedGirl+4
    STA.W strcNames.wMostLovedGirl+6
    RTL
.nina:
    REP #$30
    LDA.W #$0065
    STA.W strcNames.wMostLovedGirl
    LDA.W #$00A1
    STA.W strcNames.wMostLovedGirl+2
    LDA.W #$0064
    STA.W strcNames.wMostLovedGirl+4
    LDA.W #$00B1
    STA.W strcNames.wMostLovedGirl+6
    RTL
.ellen:
    REP #$30
    LDA.W #$0053
    STA.W strcNames.wMostLovedGirl
    LDA.W #$0079
    STA.W strcNames.wMostLovedGirl+2
    LDA.W #$007D
    STA.W strcNames.wMostLovedGirl+4
    LDA.W #$00B1
    STA.W strcNames.wMostLovedGirl+6
    RTL
.eve:
    REP #$30
    LDA.W #$0051
    STA.W strcNames.wMostLovedGirl
    LDA.W #$00A0
    STA.W strcNames.wMostLovedGirl+2
    LDA.W #$00B1
    STA.W strcNames.wMostLovedGirl+4
    STA.W strcNames.wMostLovedGirl+6
    else
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
    if !REGION_DE
    LDA.W #$0000
    else
    LDA.W #$0004                                               ;828F9E|A90400  |      ;
    endif
    STA.W strcNames.wMostLovedGirl+4                           ;828FA1|8DA508  |0008A5;
    LDA.W #!DIALOG_SPACE                                               
    STA.W strcNames.wMostLovedGirl+6                           ;828FA7|8DA708  |0008A7;
    LDA.W #!DIALOG_SPACE                                               
    STA.W strcNames.wMostLovedGirl+8                           ;828FAD|8DA908  |0008A9;
    endif
    RTL                                                        ;828FB0|6B      |      ;