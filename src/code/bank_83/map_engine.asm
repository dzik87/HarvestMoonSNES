; Bank $83 module "map_engine" - starts at $83CA98
 
fMapEngine_AreaEvents:
    SEP #$20                                                   ;83CA98|E220    |      ;
    REP #$10                                                   ;83CA9A|C210    |      ;
    LDA.B #$00                                                 ;83CA9C|A900    |      ;
    XBA                                                        ;83CA9E|EB      |      ;
    LDA.B strcMap.loadAreaId                                   ;83CA9F|A522    |000022;
    REP #$20                                                   ;83CAA1|C220    |      ;
    ASL A                                                      ;83CAA3|0A      |      ;
    TAX                                                        ;83CAA4|AA      |      ;
    JSR.W (.areaEventsJumpTable,X)                             ;83CAA5|FCA9CA  |83CAA9;
    RTL                                                        ;83CAA8|6B      |      ;
 
.areaEventsJumpTable:
    dw fAreaEvents_Farm                                        ;83CAA9|        |83CB69; 0x60 * [ptr16]
    dw fAreaEvents_Farm                                        ;83CAAB|        |83CB69;
    dw fAreaEvents_Farm                                        ;83CAAD|        |83CB69;
    dw fAreaEvents_Farm                                        ;83CAAF|        |83CB69;
    dw fAreaEvents_Town                                        ;83CAB1|        |83D2E0;
    dw fAreaEvents_Town                                        ;83CAB3|        |83D2E0;
    dw fAreaEvents_Town                                        ;83CAB5|        |83D2E0;
    dw fAreaEvents_Town                                        ;83CAB7|        |83D2E0;
    dw fAreaEvents_Festival1                                   ;83CAB9|        |83E5DF;
    dw fAreaEvents_Festival2                                   ;83CABB|        |83E5F1;
    dw fAreaEvents_Festival3                                   ;83CABD|        |83E603;
    dw fAreaEvents_EggFestival                                 ;83CABF|        |83E6B2;
    dw fAreaEvents_CrossRoad                                   ;83CAC1|        |83E407;
    dw fAreaEvents_CrossRoad                                   ;83CAC3|        |83E407;
    dw fAreaEvents_CrossRoad                                   ;83CAC5|        |83E407;
    dw fAreaEvents_CrossRoad                                   ;83CAC7|        |83E407;
    dw fAreaEvents_Woods                                       ;83CAC9|        |83DC4A;
    dw fAreaEvents_Woods                                       ;83CACB|        |83DC4A;
    dw fAreaEvents_Woods                                       ;83CACD|        |83DC4A;
    dw fAreaEvents_Woods                                       ;83CACF|        |83DC4A;
    dw fAreaEvents_SNF_Spa                                     ;83CAD1|        |83E661;
    dw fAreaEvents_House                                       ;83CAD3|        |83DED3;
    dw fAreaEvents_House                                       ;83CAD5|        |83DED3;
    dw fAreaEvents_House                                       ;83CAD7|        |83DED3;
    dw fAreaEvents_MajorHouse                                  ;83CAD9|        |83D4D7;
    dw fAreaEvents_MajorHouse                                  ;83CADB|        |83D4D7;
    dw fAreaEvents_MariaBedroom                                ;83CADD|        |83D5E7;
    dw fAreaEvents_Church                                      ;83CADF|        |83D613;
    dw fAreaEvents_Florist                                     ;83CAE1|        |83D74E;
    dw fAreaEvents_NinaBedroom                                 ;83CAE3|        |83D818;
    dw fAreaEvents_Bar                                         ;83CAE5|        |83DB8F;
    dw fAreaEvents_EveBedroom                                  ;83CAE7|        |83DC1E;
    dw fAreaEvents_Restaurant                                  ;83CAE9|        |83D955;
    dw fAreaEvents_EllenBedroom                                ;83CAEB|        |83DA1F;
    dw fAreaEvents_Toolshop                                    ;83CAED|        |83D844;
    dw fAreaEvents_AnnBedroom                                  ;83CAEF|        |83D929;
    dw fAreaEvents_AnimalShop                                  ;83CAF1|        |83DAED;
    dw fAreaEvents_FortuneTeller                               ;83CAF3|        |83DA4B;
    dw fAreaEvents_Shed                                        ;83CAF5|        |83E6C4;
    dw fAreaEvents_CowBarn                                     ;83CAF7|        |83DE9B;
    dw fAreaEvents_Coop                                        ;83CAF9|        |83E5B4;
    dw fAreaEvents_Mine                                        ;83CAFB|        |83E4CB;
    dw fAreaEvents_ImpsUnderground                             ;83CAFD|        |83DE64;
    dw fAreaEvents_WorksmanHouse                               ;83CAFF|        |83DD95;
    dw fAreaEvents_GoldChicken                                 ;83CB01|        |83E5A2;
    dw fAreaEvents_Wedding                                     ;83CB03|        |83E5CD;
    dw fAreaEvents_Wedding                                     ;83CB05|        |83E5CD;
    dw fAreaEvents_Wedding                                     ;83CB07|        |83E5CD;
    dw fAreaEvents_Wedding                                     ;83CB09|        |83E5CD;
    dw fAreaEvents_MountainTop                                 ;83CB0B|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB0D|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB0F|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB11|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB13|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB15|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB17|        |83E586;
    dw fAreaEvents_MountainTop                                 ;83CB19|        |83E586;
    dw fAreaEvents_SNF_MountainTop                             ;83CB1B|        |83E632;
    dw fAreaEvents_MountainTopUnknown                          ;83CB1D|        |83E690;
    dw fAreaEvents_MountainTopBean                             ;83CB1F|        |83E74C;
    dw fAreaEvents_Intro                                       ;83CB21|        |83E76D;
    dw fAreaEvents_Endings                                     ;83CB23|        |83EBA6;
    dw fAreaEvents_MountainTopBean                             ;83CB25|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB27|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB29|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB2B|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB2D|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB2F|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB31|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB33|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB35|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB37|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB39|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB3B|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB3D|        |83E74C;
    dw fAreaEvents_Endings                                     ;83CB3F|        |83EBA6;
    dw fAreaEvents_MountainTopBean                             ;83CB41|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB43|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB45|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB47|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB49|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB4B|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB4D|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB4F|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB51|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB53|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB55|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB57|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB59|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB5B|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB5D|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB5F|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB61|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB63|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB65|        |83E74C;
    dw fAreaEvents_MountainTopBean                             ;83CB67|        |83E74C;
 
fAreaEvents_Farm:
    REP #$30                                                   ;83CB69|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83CB72|D050    |83CBC4;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .maria                                                 ;83CB7B|D014    |83CB91;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .nina                                                  ;83CB84|D01C    |83CBA2;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .ellen                                                 ;83CB8D|D024    |83CBB3;
    BRA +                                                      ;83CB8F|8033    |83CBC4;
 
 
.maria:
    REP #$30                                                   ;83CB91|C230    |      ;
    %AIExecute($0013, $0044, $0000)
    BRA +                                                      ;83CBA0|8022    |83CBC4;
 
 
.nina:
    REP #$30                                                   ;83CBA2|C230    |      ;
    %AIExecute($0013, $0044, $0002)
    BRA +                                                      ;83CBB1|8011    |83CBC4;
 
 
.ellen:
    REP #$30                                                   ;83CBB3|C230    |      ;
    %AIExecute($0013, $0044, $0003)
    BRA +                                                      ;83CBC2|8000    |83CBC4;
 
 
  + REP #$30                                                   ;83CBC4|C230    |      ;
    %CheckFlag(event6, $0004)
    BEQ +                                                      ;83CBCD|F018    |83CBE7;
    LDA.L nFirstChildAge                                       ;83CBCF|AF371F7F|7F1F37;
    CMP.W #$003C                                               ;83CBD3|C93C00  |      ;
    BCC +                                                      ;83CBD6|900F    |83CBE7;
    REP #$30                                                   ;83CBD8|C230    |      ;
    %AIExecute($0014, $0045, $0001)
 
  + REP #$30                                                   ;83CBE7|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ +                                                      ;83CBF0|F018    |83CC0A;
    LDA.L nSecondChildAge                                      ;83CBF2|AF391F7F|7F1F39;
    CMP.W #$003C                                               ;83CBF6|C93C00  |      ;
    BCC +                                                      ;83CBF9|900F    |83CC0A;
    REP #$30                                                   ;83CBFB|C230    |      ;
    %AIExecute($0015, $0045, $0004)
 
  + REP #$30                                                   ;83CC0A|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83CC0C|AD9601  |000196;
    AND.W #$001A                                               ;83CC0F|291A00  |      ;
    BEQ +                                                      ;83CC12|F003    |83CC17;
    JMP.W .label9                                              ;83CC14|4C5BCE  |83CE5B;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BEQ +                                                      ;83CC1E|F003    |83CC23;
    JMP.W .label9                                              ;83CC20|4C5BCE  |83CE5B;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BEQ +                                                      ;83CC2A|F003    |83CC2F;
    JMP.W .label9                                              ;83CC2C|4C5BCE  |83CE5B;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BEQ +                                                      ;83CC36|F003    |83CC3B;
    JMP.W .label9                                              ;83CC38|4C5BCE  |83CE5B;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BEQ +                                                      ;83CC42|F003    |83CC47;
    JMP.W .label9                                              ;83CC44|4C5BCE  |83CE5B;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BEQ +                                                      ;83CC4E|F003    |83CC53;
    JMP.W .label9                                              ;83CC50|4C5BCE  |83CE5B;
 
 
  + SEP #$20                                                   ;83CC53|E220    |      ;
    LDA.L nCurrentTimeID                                       ;83CC55|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83CC59|C906    |      ;
    BEQ +                                                      ;83CC5B|F003    |83CC60;
    JMP.W .label9                                              ;83CC5D|4C5BCE  |83CE5B;
 
 
  + LDA.L nInGameHourCounter                                   ;83CC60|AF1D1F7F|7F1F1D;
    BEQ +                                                      ;83CC64|F003    |83CC69;
    JMP.W .label9                                              ;83CC66|4C5BCE  |83CE5B;
 
 
  + LDA.L nInGameMinuteCounter                                 ;83CC69|AF1E1F7F|7F1F1E;
    BEQ +                                                      ;83CC6D|F003    |83CC72;
    JMP.W .label9                                              ;83CC6F|4C5BCE  |83CE5B;
 
 
  + LDA.L nCurrentDay                                          ;83CC72|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83CC76|C901    |      ;
    BNE +                                                      ;83CC78|D003    |83CC7D;
    JMP.W .label9                                              ;83CC7A|4C5BCE  |83CE5B;
 
 
  + CMP.B #$08                                                 ;83CC7D|C908    |      ;
    BCC .label4                                                ;83CC7F|9019    |83CC9A;
    CMP.B #$0D                                                 ;83CC81|C90D    |      ;
    BCS +                                                      ;83CC83|B003    |83CC88;
    JMP.W .label9                                              ;83CC85|4C5BCE  |83CE5B;
 
 
  + CMP.B #$12                                                 ;83CC88|C912    |      ;
    BCC .label4                                                ;83CC8A|900E    |83CC9A;
    CMP.B #$19                                                 ;83CC8C|C919    |      ;
    BCS +                                                      ;83CC8E|B003    |83CC93;
    JMP.W .label9                                              ;83CC90|4C5BCE  |83CE5B;
 
 
  + CMP.B #$1D                                                 ;83CC93|C91D    |      ;
    BCC .label4                                                ;83CC95|9003    |83CC9A;
    JMP.W .label9                                              ;83CC97|4C5BCE  |83CE5B;
 
 
.label4:
    REP #$20                                                   ;83CC9A|C220    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .label5                                                ;83CCA3|D044    |83CCE9;
    %CheckFlag(event2, $0080)
    BNE .label5                                                ;83CCAC|D03B    |83CCE9;
    %CheckFlag(event4, $2000)
    BNE .label5                                                ;83CCB5|D032    |83CCE9;
    %CheckFlag(event4, $1000)
    BNE .label5                                                ;83CCBE|D029    |83CCE9;
    LDA.L nLove_Maria                                          ;83CCC0|AF1F1F7F|7F1F1F;
    CMP.W #$00C8                                               ;83CCC4|C9C800  |      ;
    BCC .label5                                                ;83CCC7|9020    |83CCE9;
    %SetFlag(event4, $1000)
    REP #$30                                                   ;83CCD4|C230    |      ;
    %AIExecute($0000, $0019, $0000)
    SEP #$20                                                   ;83CCE3|E220    |      ;
    STZ.W $09A3                                                ;83CCE5|9CA309  |0009A3;
    RTS                                                        ;83CCE8|60      |      ;
 
 
.label5:
    REP #$20                                                   ;83CCE9|C220    |      ;
    %CheckFlag(event4, $1000)
    BNE .label6                                                ;83CCF2|D044    |83CD38;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .label6                                                ;83CCFB|D03B    |83CD38;
    %CheckFlag(event4, $8000)
    BNE .label6                                                ;83CD04|D032    |83CD38;
    %CheckFlag(event4, $4000)
    BNE .label6                                                ;83CD0D|D029    |83CD38;
    LDA.L nLove_Ann                                            ;83CD0F|AF211F7F|7F1F21;
    CMP.W #$00C8                                               ;83CD13|C9C800  |      ;
    BCC .label6                                                ;83CD16|9020    |83CD38;
    %SetFlag(event4, $4000)
    REP #$30                                                   ;83CD23|C230    |      ;
    %AIExecute($0000, $001A, $0000)
    SEP #$20                                                   ;83CD32|E220    |      ;
    STZ.W $09A3                                                ;83CD34|9CA309  |0009A3;
    RTS                                                        ;83CD37|60      |      ;
 
 
.label6:
    REP #$20                                                   ;83CD38|C220    |      ;
    %CheckFlag(event4, $1000)
    BNE .label7                                                ;83CD41|D04D    |83CD90;
    %CheckFlag(event4, $4000)
    BNE .label7                                                ;83CD4A|D044    |83CD90;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .label7                                                ;83CD53|D03B    |83CD90;
    %CheckFlag(event5, $0002)
    BNE .label7                                                ;83CD5C|D032    |83CD90;
    %CheckFlag(event5, $0001)
    BNE .label7                                                ;83CD65|D029    |83CD90;
    LDA.L nLove_Nina                                           ;83CD67|AF231F7F|7F1F23;
    CMP.W #$00C8                                               ;83CD6B|C9C800  |      ;
    BCC .label7                                                ;83CD6E|9020    |83CD90;
    %SetFlag(event5, $0001)
    REP #$30                                                   ;83CD7B|C230    |      ;
    %AIExecute($0000, $001B, $0000)
    SEP #$20                                                   ;83CD8A|E220    |      ;
    STZ.W $09A3                                                ;83CD8C|9CA309  |0009A3;
    RTS                                                        ;83CD8F|60      |      ;
 
 
.label7:
    REP #$20                                                   ;83CD90|C220    |      ;
    %CheckFlag(event4, $1000)
    BNE .label8                                                ;83CD99|D056    |83CDF1;
    %CheckFlag(event4, $4000)
    BNE .label8                                                ;83CDA2|D04D    |83CDF1;
    %CheckFlag(event5, $0001)
    BNE .label8                                                ;83CDAB|D044    |83CDF1;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .label8                                                ;83CDB4|D03B    |83CDF1;
    %CheckFlag(event5, $0008)
    BNE .label8                                                ;83CDBD|D032    |83CDF1;
    %CheckFlag(event5, $0004)
    BNE .label8                                                ;83CDC6|D029    |83CDF1;
    LDA.L nLove_Ellen                                          ;83CDC8|AF251F7F|7F1F25;
    CMP.W #$00C8                                               ;83CDCC|C9C800  |      ;
    BCC .label8                                                ;83CDCF|9020    |83CDF1;
    %SetFlag(event5, $0004)
    REP #$30                                                   ;83CDDC|C230    |      ;
    %AIExecute($0000, $001C, $0000)
    SEP #$20                                                   ;83CDEB|E220    |      ;
    STZ.W $09A3                                                ;83CDED|9CA309  |0009A3;
    RTS                                                        ;83CDF0|60      |      ;
 
 
.label8:
    REP #$20                                                   ;83CDF1|C220    |      ;
    %CheckFlag(event4, $1000)
    BNE .label9                                                ;83CDFA|D05F    |83CE5B;
    %CheckFlag(event4, $4000)
    BNE .label9                                                ;83CE03|D056    |83CE5B;
    %CheckFlag(event5, $0001)
    BNE .label9                                                ;83CE0C|D04D    |83CE5B;
    %CheckFlag(event5, $0004)
    BNE .label9                                                ;83CE15|D044    |83CE5B;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .label9                                                ;83CE1E|D03B    |83CE5B;
    %CheckFlag(event5, $0020)
    BNE .label9                                                ;83CE27|D032    |83CE5B;
    %CheckFlag(event5, $0010)
    BNE .label9                                                ;83CE30|D029    |83CE5B;
    LDA.L nLove_Eve                                            ;83CE32|AF271F7F|7F1F27;
    CMP.W #$00C8                                               ;83CE36|C9C800  |      ;
    BCC .label9                                                ;83CE39|9020    |83CE5B;
    %SetFlag(event5, $0010)
    REP #$30                                                   ;83CE46|C230    |      ;
    %AIExecute($0000, $001D, $0000)
    SEP #$20                                                   ;83CE55|E220    |      ;
    STZ.W $09A3                                                ;83CE57|9CA309  |0009A3;
    RTS                                                        ;83CE5A|60      |      ;
 
 
.label9:
    REP #$30                                                   ;83CE5B|C230    |      ;
    %CheckFlag(daily1, $0002)
    BEQ .label10                                               ;83CE64|F02D    |83CE93;
    REP #$20                                                   ;83CE66|C220    |      ;
    %AIExecute($0007, $0000, $0020)
    SEP #$20                                                   ;83CE75|E220    |      ;
    LDA.B #$42                                                 ;83CE77|A942    |      ;
    STA.W nPlayerInteractionIndex                              ;83CE79|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;83CE7C|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;83CE7F|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;83CE92|60      |      ;
 
 
.label10:
    REP #$30                                                   ;83CE93|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE .label11                                               ;83CE9C|D010    |83CEAE;
    REP #$30                                                   ;83CE9E|C230    |      ;
    %AIExecute($0000, $000A, $0002)
    RTS                                                        ;83CEAD|60      |      ;
 
 
.label11:
    REP #$30                                                   ;83CEAE|C230    |      ;
    %CheckFlag(event3, $0020)
    BNE .label12                                               ;83CEB7|D024    |83CEDD;
    REP #$30                                                   ;83CEB9|C230    |      ;
    %AIExecute($0000, $000C, $0000)
    REP #$20                                                   ;83CEC8|C220    |      ;
    %SetFlag(event3, $0020)
    SEP #$20                                                   ;83CED5|E220    |      ;
    LDA.B #$03                                                 ;83CED7|A903    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;83CED9|8D9F09  |00099F;
    RTS                                                        ;83CEDC|60      |      ;
 
 
.label12:
    REP #$30                                                   ;83CEDD|C230    |      ;
    %CheckFlag(event3, $0080)
    BNE .label13                                               ;83CEE6|D028    |83CF10;
    REP #$30                                                   ;83CEE8|C230    |      ;
    %AIExecute($0000, $000C, $0001)
    REP #$20                                                   ;83CEF7|C220    |      ;
    LDA.W #$0078                                               ;83CEF9|A97800  |      ;
    STA.L nDogX                                                ;83CEFC|8F2C1F7F|7F1F2C;
    LDA.W #$01A8                                               ;83CF00|A9A801  |      ;
    STA.L nDogY                                                ;83CF03|8F2E1F7F|7F1F2E;
    SEP #$20                                                   ;83CF07|E220    |      ;
    LDA.B #$00                                                 ;83CF09|A900    |      ;
    STA.L nDogAreaId                                           ;83CF0B|8F301F7F|7F1F30;
    RTS                                                        ;83CF0F|60      |      ;
 
 
.label13:
    SEP #$20                                                   ;83CF10|E220    |      ;
    REP #$10                                                   ;83CF12|C210    |      ;
    LDA.W nWeatherForecast                                     ;83CF14|AD8C09  |00098C;
    CMP.B #$06                                                 ;83CF17|C906    |      ;
    BCC .label14                                               ;83CF19|9027    |83CF42;
    LDA.L nCurrentTimeID                                       ;83CF1B|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83CF1F|C906    |      ;
    BNE .label14                                               ;83CF21|D01F    |83CF42;
    LDA.L nInGameHourCounter                                   ;83CF23|AF1D1F7F|7F1F1D;
    BNE .label14                                               ;83CF27|D019    |83CF42;
    LDA.L nInGameMinuteCounter                                 ;83CF29|AF1E1F7F|7F1F1E;
    BEQ +                                                      ;83CF2D|F003    |83CF32;
    JMP.W .label17                                             ;83CF2F|4CF8CF  |83CFF8;
 
 
  + REP #$30                                                   ;83CF32|C230    |      ;
    %AIExecute($0006, $0024, $0000)
    RTS                                                        ;83CF41|60      |      ;
 
 
.label14:
    REP #$30                                                   ;83CF42|C230    |      ;
    %CheckFlag(event7, $0002)
    BEQ .label15                                               ;83CF4B|F026    |83CF73;
    SEP #$20                                                   ;83CF4D|E220    |      ;
    LDA.L nCurrentTimeID                                       ;83CF4F|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83CF53|C906    |      ;
    BNE .label15                                               ;83CF55|D01C    |83CF73;
    LDA.L nInGameHourCounter                                   ;83CF57|AF1D1F7F|7F1F1D;
    BNE .label15                                               ;83CF5B|D016    |83CF73;
    LDA.L nInGameMinuteCounter                                 ;83CF5D|AF1E1F7F|7F1F1E;
    BNE .label15                                               ;83CF61|D010    |83CF73;
    REP #$30                                                   ;83CF63|C230    |      ;
    %AIExecute($0006, $0024, $0002)
    RTS                                                        ;83CF72|60      |      ;
 
 
.label15:
    REP #$30                                                   ;83CF73|C230    |      ;
    %CheckFlag(event1, $0010)
    BEQ .label16                                               ;83CF7C|F026    |83CFA4;
    SEP #$20                                                   ;83CF7E|E220    |      ;
    LDA.L nCurrentTimeID                                       ;83CF80|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83CF84|C906    |      ;
    BNE .label16                                               ;83CF86|D01C    |83CFA4;
    LDA.L nInGameHourCounter                                   ;83CF88|AF1D1F7F|7F1F1D;
    BNE .label16                                               ;83CF8C|D016    |83CFA4;
    LDA.L nInGameMinuteCounter                                 ;83CF8E|AF1E1F7F|7F1F1E;
    BNE .label16                                               ;83CF92|D010    |83CFA4;
    REP #$30                                                   ;83CF94|C230    |      ;
    %AIExecute($0006, $0024, $0003)
    RTS                                                        ;83CFA3|60      |      ;
 
 
.label16:
    REP #$30                                                   ;83CFA4|C230    |      ;
    %CheckFlag(event7, $0001)
    BNE .label17                                               ;83CFAD|D049    |83CFF8;
    SEP #$20                                                   ;83CFAF|E220    |      ;
    LDA.L nCurrentYearID                                       ;83CFB1|AF181F7F|7F1F18;
    BNE .label17                                               ;83CFB5|D041    |83CFF8;
    LDA.L nCurrentSeasonID                                     ;83CFB7|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;83CFBB|C901    |      ;
    BNE .label17                                               ;83CFBD|D039    |83CFF8;
    LDA.L nCurrentDay                                          ;83CFBF|AF1B1F7F|7F1F1B;
    CMP.B #$14                                                 ;83CFC3|C914    |      ;
    BCS .label17                                               ;83CFC5|B031    |83CFF8;
    LDA.L nCurrentTimeID                                       ;83CFC7|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83CFCB|C906    |      ;
    BNE .label17                                               ;83CFCD|D029    |83CFF8;
    LDA.L nInGameHourCounter                                   ;83CFCF|AF1D1F7F|7F1F1D;
    BNE .label17                                               ;83CFD3|D023    |83CFF8;
    LDA.L nInGameMinuteCounter                                 ;83CFD5|AF1E1F7F|7F1F1E;
    BNE .label17                                               ;83CFD9|D01D    |83CFF8;
    REP #$20                                                   ;83CFDB|C220    |      ;
    %SetFlag(event7, $0001)
    REP #$30                                                   ;83CFE8|C230    |      ;
    %AIExecute($000B, $0024, $0001)
    RTS                                                        ;83CFF7|60      |      ;
 
 
.label17:
    REP #$30                                                   ;83CFF8|C230    |      ;
    %CheckFlag(event2, $0040)
    BEQ .label18                                               ;83D001|F03A    |83D03D;
    REP #$20                                                   ;83D003|C220    |      ;
    %AIExecute($0009, $0000, $002C)
    SEP #$20                                                   ;83D012|E220    |      ;
    LDA.B #$47                                                 ;83D014|A947    |      ;
    STA.W nPlayerInteractionIndex                              ;83D016|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;83D019|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;83D01C|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    REP #$20                                                   ;83D02F|C220    |      ;
    %UnsetFlag(event2, $0040)
    RTS                                                        ;83D03C|60      |      ;
 
 
.label18:
    REP #$30                                                   ;83D03D|C230    |      ;
    %CheckFlag(event2, $0080)
    BEQ .label19                                               ;83D046|F018    |83D060;
    SEP #$20                                                   ;83D048|E220    |      ;
    LDA.L nConstructionDayCounter                              ;83D04A|AF351F7F|7F1F35;
    BEQ .label19                                               ;83D04E|F010    |83D060;
    REP #$30                                                   ;83D050|C230    |      ;
    %AIExecute($0000, $0000, $002E)
    RTS                                                        ;83D05F|60      |      ;
 
 
.label19:
    REP #$30                                                   ;83D060|C230    |      ;
    %CheckFlag(event2, $0100)
    BEQ .label20                                               ;83D069|F047    |83D0B2;
    %UnsetFlag(event2, $0100)
    REP #$30                                                   ;83D076|C230    |      ;
    %AIExecute($0009, $0000, $0036)
    REP #$30                                                   ;83D085|C230    |      ;
    %AIExecute($000A, $0000, $0037)
    SEP #$20                                                   ;83D094|E220    |      ;
    LDA.B #$48                                                 ;83D096|A948    |      ;
    STA.W nPlayerInteractionIndex                              ;83D098|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;83D09B|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;83D09E|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;83D0B1|60      |      ;
 
 
.label20:
    REP #$30                                                   ;83D0B2|C230    |      ;
    %CheckFlag(event1, $0100)
    BNE .label21                                               ;83D0BB|D042    |83D0FF;
    SEP #$20                                                   ;83D0BD|E220    |      ;
    LDA.L nHorseAge                                            ;83D0BF|AF321F7F|7F1F32;
    CMP.B #$15                                                 ;83D0C3|C915    |      ;
    BNE .label21                                               ;83D0C5|D038    |83D0FF;
    REP #$30                                                   ;83D0C7|C230    |      ;
    %SetFlag(event1, $0100)
    %AIExecute($000B, $0000, $001D)
    SEP #$20                                                   ;83D0E1|E220    |      ;
    LDA.B #$49                                                 ;83D0E3|A949    |      ;
    STA.W nPlayerInteractionIndex                              ;83D0E5|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;83D0E8|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;83D0EB|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
    RTS                                                        ;83D0FE|60      |      ;
 
 
.label21:
    SEP #$20                                                   ;83D0FF|E220    |      ;
    REP #$10                                                   ;83D101|C210    |      ;
    LDA.L nCurrentYearID                                       ;83D103|AF181F7F|7F1F18;
    BEQ .label22                                               ;83D107|F05A    |83D163;
    LDA.L nCurrentTimeID                                       ;83D109|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83D10D|C906    |      ;
    BNE .label22                                               ;83D10F|D052    |83D163;
    LDA.L nInGameHourCounter                                   ;83D111|AF1D1F7F|7F1F1D;
    BNE .label22                                               ;83D115|D04C    |83D163;
    LDA.L nInGameMinuteCounter                                 ;83D117|AF1E1F7F|7F1F1E;
    BNE .label22                                               ;83D11B|D046    |83D163;
    REP #$20                                                   ;83D11D|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D11F|AD9601  |000196;
    AND.W #$001A                                               ;83D122|291A00  |      ;
    BNE .label22                                               ;83D125|D03C    |83D163;
    REP #$20                                                   ;83D127|C220    |      ;
    LDA.L nMoney                                               ;83D129|AF041F7F|7F1F04;
    CLC                                                        ;83D12D|18      |      ;
    ADC.W #$F448                                               ;83D12E|6948F4  |      ;
    SEP #$20                                                   ;83D131|E220    |      ;
    LDA.L nMoney+2                                             ;83D133|AF061F7F|7F1F06;
    ADC.B #$FF                                                 ;83D137|69FF    |      ;
    BMI .label22                                               ;83D139|3028    |83D163;
    REP #$30                                                   ;83D13B|C230    |      ;
    %CheckFlag(event3, $0400)
    BNE .label22                                               ;83D144|D01D    |83D163;
    REP #$30                                                   ;83D146|C230    |      ;
    %AIExecute($0000, $0013, $0000)
    REP #$20                                                   ;83D155|C220    |      ;
    %SetFlag(event3, $0400)
    RTS                                                        ;83D162|60      |      ;
 
 
.label22:
    SEP #$20                                                   ;83D163|E220    |      ;
    REP #$10                                                   ;83D165|C210    |      ;
    LDA.L nCurrentYearID                                       ;83D167|AF181F7F|7F1F18;
    BNE .label23                                               ;83D16B|D008    |83D175;
    LDA.L nCurrentSeasonID                                     ;83D16D|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83D171|C903    |      ;
    BNE .label24                                               ;83D173|D059    |83D1CE;
 
.label23:
    SEP #$20                                                   ;83D175|E220    |      ;
    LDA.L nCurrentTimeID                                       ;83D177|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83D17B|C906    |      ;
    BNE .label24                                               ;83D17D|D04F    |83D1CE;
    LDA.L nInGameHourCounter                                   ;83D17F|AF1D1F7F|7F1F1D;
    BNE .label24                                               ;83D183|D049    |83D1CE;
    LDA.L nInGameMinuteCounter                                 ;83D185|AF1E1F7F|7F1F1E;
    BNE .label24                                               ;83D189|D043    |83D1CE;
    LDA.L nCurrentWeekdayID                                    ;83D18B|AF1A1F7F|7F1F1A;
    CMP.B #$06                                                 ;83D18F|C906    |      ;
    BNE .label24                                               ;83D191|D03B    |83D1CE;
    REP #$20                                                   ;83D193|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D195|AD9601  |000196;
    AND.W #$001A                                               ;83D198|291A00  |      ;
    BNE .label24                                               ;83D19B|D031    |83D1CE;
    REP #$30                                                   ;83D19D|C230    |      ;
    %CheckFlag(event1, $00C0)
    BEQ .label24                                               ;83D1A6|F026    |83D1CE;
    REP #$30                                                   ;83D1A8|C230    |      ;
    %CheckFlag(event3, $4000)
    BNE .label24                                               ;83D1B1|D01B    |83D1CE;
    %SetFlag(event3, $4000)
    REP #$30                                                   ;83D1BE|C230    |      ;
    %AIExecute($0000, $0016, $0000)
    RTS                                                        ;83D1CD|60      |      ;
 
 
.label24:
    SEP #$20                                                   ;83D1CE|E220    |      ;
    REP #$10                                                   ;83D1D0|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D1D2|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;83D1D6|C902    |      ;
    BNE .label26                                               ;83D1D8|D064    |83D23E;
    LDA.L nCurrentDay                                          ;83D1DA|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83D1DE|C901    |      ;
    BEQ .label26                                               ;83D1E0|F05C    |83D23E;
    CMP.B #$08                                                 ;83D1E2|C908    |      ;
    BCC .label25                                               ;83D1E4|9012    |83D1F8;
    CMP.B #$0D                                                 ;83D1E6|C90D    |      ;
    BCC .label26                                               ;83D1E8|9054    |83D23E;
    CMP.B #$12                                                 ;83D1EA|C912    |      ;
    BCC .label25                                               ;83D1EC|900A    |83D1F8;
    CMP.B #$19                                                 ;83D1EE|C919    |      ;
    BCC .label26                                               ;83D1F0|904C    |83D23E;
    CMP.B #$1D                                                 ;83D1F2|C91D    |      ;
    BCC .label25                                               ;83D1F4|9002    |83D1F8;
    BRA .label26                                               ;83D1F6|8046    |83D23E;
 
 
.label25:
    REP #$20                                                   ;83D1F8|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D1FA|AD9601  |000196;
    AND.W #$001A                                               ;83D1FD|291A00  |      ;
    BNE .label26                                               ;83D200|D03C    |83D23E;
    REP #$30                                                   ;83D202|C230    |      ;
    %CheckFlag(event1, $00C0)
    BEQ .label26                                               ;83D20B|F031    |83D23E;
    REP #$30                                                   ;83D20D|C230    |      ;
    %CheckFlag(event3, $2000)
    BEQ .label26                                               ;83D216|F026    |83D23E;
    REP #$30                                                   ;83D218|C230    |      ;
    %CheckFlag(event4, $0100)
    BNE .label26                                               ;83D221|D01B    |83D23E;
    %SetFlag(event4, $0080)
    REP #$30                                                   ;83D22E|C230    |      ;
    %AIExecute($0000, $0018, $0000)
    RTS                                                        ;83D23D|60      |      ;
 
 
.label26:
    REP #$30                                                   ;83D23E|C230    |      ;
    %CheckFlag(event4, $0800)
    BNE .label28                                               ;83D247|D055    |83D29E;
    %CheckFlag(event4, $0400)
    BNE .label27                                               ;83D250|D03C    |83D28E;
    LDA.W strcDialogDisplay.mapFlags                           ;83D252|AD9601  |000196;
    AND.W #$001E                                               ;83D255|291E00  |      ;
    BNE .label28                                               ;83D258|D044    |83D29E;
    %CheckFlag(event6, $0400)
    BEQ .label28                                               ;83D261|F03B    |83D29E;
    SEP #$20                                                   ;83D263|E220    |      ;
    LDA.L nOwnedChickens                                       ;83D265|AF0B1F7F|7F1F0B;
    CMP.B #$06                                                 ;83D269|C906    |      ;
    BCC .label28                                               ;83D26B|9031    |83D29E;
    LDA.L nCurrentTimeID                                       ;83D26D|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83D271|C906    |      ;
    BNE .label28                                               ;83D273|D029    |83D29E;
    LDA.L nInGameHourCounter                                   ;83D275|AF1D1F7F|7F1F1D;
    BNE .label28                                               ;83D279|D023    |83D29E;
    LDA.L nInGameMinuteCounter                                 ;83D27B|AF1E1F7F|7F1F1E;
    BNE .label28                                               ;83D27F|D01D    |83D29E;
    REP #$20                                                   ;83D281|C220    |      ;
    %SetFlag(event4, $0400)
 
.label27:
    REP #$30                                                   ;83D28E|C230    |      ;
    %AIExecute($0000, $0029, $0000)
    RTS                                                        ;83D29D|60      |      ;
 
 
.label28:
    REP #$30                                                   ;83D29E|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D2A0|AD9601  |000196;
    AND.W #$001A                                               ;83D2A3|291A00  |      ;
    BNE .justReturn                                            ;83D2A6|D037    |83D2DF;
    SEP #$20                                                   ;83D2A8|E220    |      ;
    LDA.L nCurrentTimeID                                       ;83D2AA|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83D2AE|C906    |      ;
    BNE .justReturn                                            ;83D2B0|D02D    |83D2DF;
    LDA.L nInGameHourCounter                                   ;83D2B2|AF1D1F7F|7F1F1D;
    BNE .justReturn                                            ;83D2B6|D027    |83D2DF;
    LDA.L nInGameMinuteCounter                                 ;83D2B8|AF1E1F7F|7F1F1E;
    BNE .justReturn                                            ;83D2BC|D021    |83D2DF;
    LDA.B #$08                                                 ;83D2BE|A908    |      ;
    JSL.L fCore_GetRandomNumber                                ;83D2C0|22F98980|8089F9;
    BNE .justReturn                                            ;83D2C4|D019    |83D2DF;
    REP #$30                                                   ;83D2C6|C230    |      ;
    %AIExecute($0000, $0023, $0000)
    REP #$30                                                   ;83D2D5|C230    |      ;
    LDA.W #$0002                                               ;83D2D7|A90200  |      ;
    JSL.L fGameEngine_AddHappiness                             ;83D2DA|2282B283|83B282;
    RTS                                                        ;83D2DE|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83D2DF|60      |      ;
 
 
fAreaEvents_Town:
    REP #$30                                                   ;83D2E0|C230    |      ;
    %CheckFlag(daily4, $0400)
    BEQ +                                                      ;83D2E9|F019    |83D304;
    %CheckFlag(daily4, $FBFF)
    STA.B $60                                                  ;83D2F2|8560    |000060;
    REP #$30                                                   ;83D2F4|C230    |      ;
    %AIExecute($0000, $0014, $0003)
    RTS                                                        ;83D303|60      |      ;
 
 
  + SEP #$20                                                   ;83D304|E220    |      ;
    REP #$10                                                   ;83D306|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D308|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;83D30C|C902    |      ;
    BEQ +                                                      ;83D30E|F003    |83D313;
    JMP.W .label1                                              ;83D310|4CB8D3  |83D3B8;
 
 
  + LDA.L nCurrentDay                                          ;83D313|AF1B1F7F|7F1F1B;
    CMP.B #$14                                                 ;83D317|C914    |      ;
    BEQ +                                                      ;83D319|F003    |83D31E;
    JMP.W .label1                                              ;83D31B|4CB8D3  |83D3B8;
 
 
  + LDA.L nCurrentTimeID                                       ;83D31E|AF1C1F7F|7F1F1C;
    CMP.B #$0F                                                 ;83D322|C90F    |      ;
    BCC +                                                      ;83D324|9003    |83D329;
    JMP.W .label1                                              ;83D326|4CB8D3  |83D3B8;
 
 
  + REP #$30                                                   ;83D329|C230    |      ;
    %AIExecute($0015, $0000, $007E)
    REP #$20                                                   ;83D338|C220    |      ;
    STZ.B strcVariables.n16Temp1                               ;83D33A|647E    |00007E;
    SEP #$20                                                   ;83D33C|E220    |      ;
    LDA.B #$00                                                 ;83D33E|A900    |      ;
    STA.W $09A4                                                ;83D340|8DA409  |0009A4;
    LDA.B #$01                                                 ;83D343|A901    |      ;
    STA.W $09A5                                                ;83D345|8DA509  |0009A5;
    LDA.B #$02                                                 ;83D348|A902    |      ;
    STA.W $09A6                                                ;83D34A|8DA609  |0009A6;
    LDA.B #$03                                                 ;83D34D|A903    |      ;
    STA.W $09A7                                                ;83D34F|8DA709  |0009A7;
    LDA.B #$04                                                 ;83D352|A904    |      ;
    STA.W $09A8                                                ;83D354|8DA809  |0009A8;
    LDA.B #$05                                                 ;83D357|A905    |      ;
    STA.W $09A9                                                ;83D359|8DA909  |0009A9;
    LDA.B #$00                                                 ;83D35C|A900    |      ;
    STA.W $09AA                                                ;83D35E|8DAA09  |0009AA;
    LDA.B #$00                                                 ;83D361|A900    |      ;
    STA.W $09AB                                                ;83D363|8DAB09  |0009AB;
    LDY.W #$0000                                               ;83D366|A00000  |      ;
 
  - SEP #$20                                                   ;83D369|E220    |      ;
    REP #$10                                                   ;83D36B|C210    |      ;
    PHY                                                        ;83D36D|5A      |      ;
    TYX                                                        ;83D36E|BB      |      ;
    STY.B strcVariables.n16Temp4                               ;83D36F|8484    |000084;
    LDA.W $09A4,X                                              ;83D371|BDA409  |0009A4;
    STA.B strcVariables.n8Temp4                                ;83D374|8595    |000095;
    SEP #$20                                                   ;83D376|E220    |      ;
    LDA.B #$08                                                 ;83D378|A908    |      ;
    JSL.L fCore_GetRandomNumber                                ;83D37A|22F98980|8089F9;
    SEP #$20                                                   ;83D37E|E220    |      ;
    REP #$10                                                   ;83D380|C210    |      ;
    XBA                                                        ;83D382|EB      |      ;
    LDA.B #$00                                                 ;83D383|A900    |      ;
    XBA                                                        ;83D385|EB      |      ;
    REP #$20                                                   ;83D386|C220    |      ;
    TAX                                                        ;83D388|AA      |      ;
    STX.B strcVariables.n16Unk86                               ;83D389|8686    |000086;
    SEP #$20                                                   ;83D38B|E220    |      ;
    LDA.W $09A4,X                                              ;83D38D|BDA409  |0009A4;
    LDX.B strcVariables.n16Temp4                               ;83D390|A684    |000084;
    STA.W $09A4,X                                              ;83D392|9DA409  |0009A4;
    LDA.B strcVariables.n8Temp4                                ;83D395|A595    |000095;
    LDX.B strcVariables.n16Unk86                               ;83D397|A686    |000086;
    STA.W $09A4,X                                              ;83D399|9DA409  |0009A4;
    PLY                                                        ;83D39C|7A      |      ;
    INY                                                        ;83D39D|C8      |      ;
    CPY.W #$0007                                               ;83D39E|C00700  |      ;
    BNE -                                                      ;83D3A1|D0C6    |83D369;
    SEP #$20                                                   ;83D3A3|E220    |      ;
    STZ.W $09A2                                                ;83D3A5|9CA209  |0009A2;
    REP #$30                                                   ;83D3A8|C230    |      ;
    %AIExecute($0000, $0028, $0002)
    RTS                                                        ;83D3B7|60      |      ;
 
 
.label1:
    SEP #$20                                                   ;83D3B8|E220    |      ;
    REP #$10                                                   ;83D3BA|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D3BC|AF191F7F|7F1F19;
    BNE +                                                      ;83D3C0|D020    |83D3E2;
    LDA.L nCurrentDay                                          ;83D3C2|AF1B1F7F|7F1F1B;
    CMP.B #$17                                                 ;83D3C6|C917    |      ;
    BNE +                                                      ;83D3C8|D018    |83D3E2;
    LDA.L nCurrentTimeID                                       ;83D3CA|AF1C1F7F|7F1F1C;
    CMP.B #$0F                                                 ;83D3CE|C90F    |      ;
    BCS +                                                      ;83D3D0|B010    |83D3E2;
    REP #$30                                                   ;83D3D2|C230    |      ;
    %AIExecute($0000, $000E, $0000)
    RTS                                                        ;83D3E1|60      |      ;
 
 
  + SEP #$20                                                   ;83D3E2|E220    |      ;
    REP #$10                                                   ;83D3E4|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D3E6|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;83D3EA|C902    |      ;
    BNE +                                                      ;83D3EC|D020    |83D40E;
    LDA.L nCurrentDay                                          ;83D3EE|AF1B1F7F|7F1F1B;
    CMP.B #$0C                                                 ;83D3F2|C90C    |      ;
    BNE +                                                      ;83D3F4|D018    |83D40E;
    LDA.L nCurrentTimeID                                       ;83D3F6|AF1C1F7F|7F1F1C;
    CMP.B #$0F                                                 ;83D3FA|C90F    |      ;
    BCS +                                                      ;83D3FC|B010    |83D40E;
    REP #$30                                                   ;83D3FE|C230    |      ;
    %AIExecute($0000, $0026, $0000)
    RTS                                                        ;83D40D|60      |      ;
 
 
  + SEP #$20                                                   ;83D40E|E220    |      ;
    REP #$10                                                   ;83D410|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D412|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83D416|C903    |      ;
    BNE +                                                      ;83D418|D020    |83D43A;
    LDA.L nCurrentDay                                          ;83D41A|AF1B1F7F|7F1F1B;
    CMP.B #$0A                                                 ;83D41E|C90A    |      ;
    BNE +                                                      ;83D420|D018    |83D43A;
    LDA.L nCurrentTimeID                                       ;83D422|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;83D426|C911    |      ;
    BCS +                                                      ;83D428|B010    |83D43A;
    REP #$30                                                   ;83D42A|C230    |      ;
    %AIExecute($0000, $0027, $0000)
    RTS                                                        ;83D439|60      |      ;
 
 
  + REP #$30                                                   ;83D43A|C230    |      ;
    %CheckFlag(event4, $4000)
    BNE +                                                      ;83D443|D00D    |83D452;
    %AIExecute($0015, $0000, $007E)
 
  + REP #$30                                                   ;83D452|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83D45B|D010    |83D46D;
    REP #$30                                                   ;83D45D|C230    |      ;
    %AIExecute($0000, $000B, $0000)
    RTS                                                        ;83D46C|60      |      ;
 
 
  + REP #$20                                                   ;83D46D|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D46F|AD9601  |000196;
    AND.W #$0008                                               ;83D472|290800  |      ;
    BNE +                                                      ;83D475|D03F    |83D4B6;
    SEP #$20                                                   ;83D477|E220    |      ;
    LDA.W nWeatherForecast                                     ;83D479|AD8C09  |00098C;
    CMP.B #$03                                                 ;83D47C|C903    |      ;
    BEQ +                                                      ;83D47E|F036    |83D4B6;
    REP #$30                                                   ;83D480|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE +                                                      ;83D489|D02B    |83D4B6;
    LDA.W strcDialogDisplay.mapFlags                           ;83D48B|AD9601  |000196;
    AND.W #$0200                                               ;83D48E|290002  |      ;
    BNE +                                                      ;83D491|D023    |83D4B6;
    LDA.W strcDialogDisplay.mapFlags                           ;83D493|AD9601  |000196;
    AND.W #$0002                                               ;83D496|290200  |      ;
    BNE +                                                      ;83D499|D01B    |83D4B6;
    SEP #$20                                                   ;83D49B|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83D49D|AF1A1F7F|7F1F1A;
    BEQ .return1                                               ;83D4A1|F014    |83D4B7;
    CMP.B #$06                                                 ;83D4A3|C906    |      ;
    BEQ .return2                                               ;83D4A5|F020    |83D4C7;
    REP #$30                                                   ;83D4A7|C230    |      ;
    %AIExecute($0000, $0001, $0000)
 
  + RTS                                                        ;83D4B6|60      |      ;
 
 
.return1:
    REP #$30                                                   ;83D4B7|C230    |      ;
    %AIExecute($0000, $0003, $0000)
    RTS                                                        ;83D4C6|60      |      ;
 
 
.return2:
    REP #$30                                                   ;83D4C7|C230    |      ;
    %AIExecute($0000, $0002, $0000)
    RTS                                                        ;83D4D6|60      |      ;
 
 
fAreaEvents_MajorHouse:
    REP #$30                                                   ;83D4D7|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE +                                                      ;83D4E0|D002    |83D4E4;
    BRA fAreaEvents_MajorHouseHandler                          ;83D4E2|801B    |83D4FF;
 
 
  + REP #$30                                                   ;83D4E4|C230    |      ;
    %CheckFlag(event6, $0002)
    BEQ fAreaEvents_MajorHouseHandler                          ;83D4ED|F010    |83D4FF;
    REP #$30                                                   ;83D4EF|C230    |      ;
    %AIExecute($0000, $0022, $0003)
    RTS                                                        ;83D4FE|60      |      ;
 
 
fAreaEvents_MajorHouseHandler:
    SEP #$20                                                   ;83D4FF|E220    |      ;
    REP #$10                                                   ;83D501|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D503|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83D507|C903    |      ;
    BNE +                                                      ;83D509|D020    |83D52B;
    LDA.L nCurrentDay                                          ;83D50B|AF1B1F7F|7F1F1B;
    CMP.B #$0A                                                 ;83D50F|C90A    |      ;
    BNE +                                                      ;83D511|D018    |83D52B;
    LDA.L nCurrentTimeID                                       ;83D513|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;83D517|C911    |      ;
    BCS +                                                      ;83D519|B010    |83D52B;
    REP #$30                                                   ;83D51B|C230    |      ;
    %AIExecute($0000, $0027, $0003)
    RTS                                                        ;83D52A|60      |      ;
 
 
  + REP #$30                                                   ;83D52B|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83D534|D010    |83D546;
    REP #$30                                                   ;83D536|C230    |      ;
    %AIExecute($0000, $000B, $0001)
    RTS                                                        ;83D545|60      |      ;
 
 
  + REP #$20                                                   ;83D546|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D548|AD9601  |000196;
    AND.W #$0008                                               ;83D54B|290800  |      ;
    BNE .label2                                                ;83D54E|D067    |83D5B7;
    SEP #$20                                                   ;83D550|E220    |      ;
    REP #$10                                                   ;83D552|C210    |      ;
    LDA.W nWeatherForecast                                     ;83D554|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83D559|B02C    |83D587;
    LDA.W nWeatherForecast                                     ;83D55B|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83D560|F065    |83D5C7;
    REP #$30                                                   ;83D562|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83D56B|D05A    |83D5C7;
    LDA.W strcDialogDisplay.mapFlags                           ;83D56D|AD9601  |000196;
    AND.W #$0200                                               ;83D570|290002  |      ;
    BNE .label3                                                ;83D573|D062    |83D5D7;
    LDA.W strcDialogDisplay.mapFlags                           ;83D575|AD9601  |000196;
    AND.W #$0002                                               ;83D578|290200  |      ;
    BNE .label1                                                ;83D57B|D02A    |83D5A7;
    SEP #$20                                                   ;83D57D|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83D57F|AF1A1F7F|7F1F1A;
    CMP.B #!DAY_SATURDAY                                                 
    BEQ .saturday                                              ;83D585|F010    |83D597;
 
.anyFestival:
    REP #$30                                                   ;83D587|C230    |      ;
    %AIExecute($0000, $0001, $0001)
    RTS                                                        ;83D596|60      |      ;
 
 
.saturday:
    REP #$30                                                   ;83D597|C230    |      ;
    %AIExecute($0000, $0002, $0001)
    RTS                                                        ;83D5A6|60      |      ;
 
 
.label1:
    REP #$30                                                   ;83D5A7|C230    |      ;
    %AIExecute($0000, $0004, $0000)
    RTS                                                        ;83D5B6|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83D5B7|C230    |      ;
    %AIExecute($0000, $0007, $0000)
    RTS                                                        ;83D5C6|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83D5C7|C230    |      ;
    %AIExecute($0000, $0006, $0000)
    RTS                                                        ;83D5D6|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83D5D7|C230    |      ;
    %AIExecute($0000, $0008, $0000)
    RTS                                                        ;83D5E6|60      |      ;
 
 
fAreaEvents_MariaBedroom:
    REP #$30                                                   ;83D5E7|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE +                                                      ;83D5F0|D003    |83D5F5;
    JMP.W fAreaEvents_MajorHouseHandler                        ;83D5F2|4CFFD4  |83D4FF;
 
 
  + REP #$30                                                   ;83D5F5|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83D5FE|D003    |83D603;
    JMP.W fAreaEvents_MajorHouseHandler                        ;83D600|4CFFD4  |83D4FF;
 
 
  + REP #$30                                                   ;83D603|C230    |      ;
    %AIExecute($0000, $0022, $0004)
    RTS                                                        ;83D612|60      |      ;
 
 
fAreaEvents_Church:
    SEP #$20                                                   ;83D613|E220    |      ;
    REP #$10                                                   ;83D615|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D617|AF191F7F|7F1F19;
    CMP.B #!SEASON_WINTER                                                 
    BNE +                                                      ;83D61D|D020    |83D63F;
    LDA.L nCurrentDay                                          ;83D61F|AF1B1F7F|7F1F1B;
    CMP.B #$0A                                                 ;83D623|C90A    |      ;
    BNE +                                                      ;83D625|D018    |83D63F;
    LDA.L nCurrentTimeID                                       ;83D627|AF1C1F7F|7F1F1C;
    CMP.B #$11                                                 ;83D62B|C911    |      ;
    BCS +                                                      ;83D62D|B010    |83D63F;
    REP #$30                                                   ;83D62F|C230    |      ;
    %AIExecute($0000, $0027, $0002)
    RTS                                                        ;83D63E|60      |      ;
 
 
  + SEP #$20                                                   ;83D63F|E220    |      ;
    REP #$10                                                   ;83D641|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83D643|AF191F7F|7F1F19;
    CMP.B #!SEASON_WINTER                                                 
    BNE +                                                      ;83D649|D023    |83D66E;
    LDA.L nCurrentDay                                          ;83D64B|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83D64F|C918    |      ;
    BNE +                                                      ;83D651|D01B    |83D66E;
    REP #$20                                                   ;83D653|C220    |      ;
    %CheckFlag(unknown1, $0002)
    BEQ +                                                      ;83D65C|F010    |83D66E;
    REP #$30                                                   ;83D65E|C230    |      ;
    %AIExecute($0000, $000F, $0002)
    RTS                                                        ;83D66D|60      |      ;
 
 
  + REP #$30                                                   ;83D66E|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83D677|D010    |83D689;
    REP #$30                                                   ;83D679|C230    |      ;
    %AIExecute($0000, $000B, $000C)
    RTS                                                        ;83D688|60      |      ;
 
 
  + REP #$20                                                   ;83D689|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D68B|AD9601  |000196;
    AND.W #!AFLAGS_UNK0008                                               
    BEQ +                                                      ;83D691|F003    |83D696;
    JMP.W .label4                                              ;83D693|4C1ED7  |83D71E;
 
 
  + SEP #$20                                                   ;83D696|E220    |      ;
    REP #$10                                                   ;83D698|C210    |      ;
    LDA.W nWeatherForecast                                     ;83D69A|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83D69F|B03D    |83D6DE;
    LDA.W nWeatherForecast                                     ;83D6A1|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BNE +                                                      ;83D6A6|D003    |83D6AB;
    JMP.W .hurricane                                           ;83D6A8|4C2ED7  |83D72E;
 
 
  + REP #$30                                                   ;83D6AB|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83D6B4|D078    |83D72E;
    LDA.W strcDialogDisplay.mapFlags                           ;83D6B6|AD9601  |000196;
    AND.W #$0200                                               ;83D6B9|290002  |      ;
    BEQ +                                                      ;83D6BC|F003    |83D6C1;
    JMP.W .label5                                              ;83D6BE|4C3ED7  |83D73E;
 
 
  + %CheckFlag(event3, $0001)
    BEQ .justReturn                                            ;83D6C8|F023    |83D6ED;
    LDA.W strcDialogDisplay.mapFlags                           ;83D6CA|AD9601  |000196;
    AND.W #$0002                                               ;83D6CD|290200  |      ;
    BNE .label3                                                ;83D6D0|D03C    |83D70E;
    SEP #$20                                                   ;83D6D2|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83D6D4|AF1A1F7F|7F1F1A;
    BEQ .notSunday                                             ;83D6D8|F014    |83D6EE;
    CMP.B #$06                                                 ;83D6DA|C906    |      ;
    BEQ .saturday                                              ;83D6DC|F020    |83D6FE;
 
.anyFestival:
    REP #$30                                                   ;83D6DE|C230    |      ;
    %AIExecute($0000, $0001, $0002)
 
.justReturn:
    RTS                                                        ;83D6ED|60      |      ;
 
 
.notSunday:
    REP #$30                                                   ;83D6EE|C230    |      ;
    %AIExecute($0000, $0003, $0001)
    RTS                                                        ;83D6FD|60      |      ;
 
 
.saturday:
    REP #$30                                                   ;83D6FE|C230    |      ;
    %AIExecute($0000, $0002, $0002)
    RTS                                                        ;83D70D|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83D70E|C230    |      ;
    %AIExecute($0000, $0004, $0001)
    RTS                                                        ;83D71D|60      |      ;
 
 
.label4:
    REP #$30                                                   ;83D71E|C230    |      ;
    %AIExecute($0000, $0007, $0001)
    RTS                                                        ;83D72D|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83D72E|C230    |      ;
    %AIExecute($0000, $0006, $0001)
    RTS                                                        ;83D73D|60      |      ;
 
 
.label5:
    REP #$30                                                   ;83D73E|C230    |      ;
    %AIExecute($0000, $0008, $0001)
    RTS                                                        ;83D74D|60      |      ;
 
 
fAreaEvents_Florist:
    REP #$30                                                   ;83D74E|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE +                                                      ;83D757|D002    |83D75B;
    BRA fAreaEvents_FloristHandler                             ;83D759|801B    |83D776;
 
 
  + REP #$30                                                   ;83D75B|C230    |      ;
    %CheckFlag(event6, $0002)
    BEQ fAreaEvents_FloristHandler                             ;83D764|F010    |83D776;
    REP #$30                                                   ;83D766|C230    |      ;
    %AIExecute($0000, $0022, $0007)
    RTS                                                        ;83D775|60      |      ;
 
 
fAreaEvents_FloristHandler:
    REP #$30                                                   ;83D776|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83D77F|D010    |83D791;
    REP #$30                                                   ;83D781|C230    |      ;
    %AIExecute($0000, $000B, $0003)
    RTS                                                        ;83D790|60      |      ;
 
 
  + REP #$20                                                   ;83D791|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D793|AD9601  |000196;
    AND.W #$0008                                               ;83D796|290800  |      ;
    BNE .label5                                                ;83D799|D04D    |83D7E8;
    SEP #$20                                                   ;83D79B|E220    |      ;
    REP #$10                                                   ;83D79D|C210    |      ;
    LDA.W nWeatherForecast                                     ;83D79F|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83D7A4|B022    |83D7C8;
    LDA.W nWeatherForecast                                     ;83D7A6|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83D7AB|F04B    |83D7F8;
    REP #$30                                                   ;83D7AD|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83D7B6|D040    |83D7F8;
    LDA.W strcDialogDisplay.mapFlags                           ;83D7B8|AD9601  |000196;
    AND.W #$0200                                               ;83D7BB|290002  |      ;
    BNE .label7                                                ;83D7BE|D048    |83D808;
    LDA.W strcDialogDisplay.mapFlags                           ;83D7C0|AD9601  |000196;
    AND.W #$0002                                               ;83D7C3|290200  |      ;
    BNE .label4                                                ;83D7C6|D010    |83D7D8;
 
.anyFestival:
    REP #$30                                                   ;83D7C8|C230    |      ;
    %AIExecute($0000, $0001, $0003)
    RTS                                                        ;83D7D7|60      |      ;
 
 
.label4:
    REP #$30                                                   ;83D7D8|C230    |      ;
    %AIExecute($0000, $0004, $0002)
    RTS                                                        ;83D7E7|60      |      ;
 
 
.label5:
    REP #$30                                                   ;83D7E8|C230    |      ;
    %AIExecute($0000, $0007, $0002)
    RTS                                                        ;83D7F7|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83D7F8|C230    |      ;
    %AIExecute($0000, $0006, $0002)
    RTS                                                        ;83D807|60      |      ;
 
 
.label7:
    REP #$30                                                   ;83D808|C230    |      ;
    %AIExecute($0000, $0008, $0002)
    RTS                                                        ;83D817|60      |      ;
 
 
fAreaEvents_NinaBedroom:
    REP #$30                                                   ;83D818|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE +                                                      ;83D821|D003    |83D826;
    JMP.W fAreaEvents_FloristHandler                           ;83D823|4C76D7  |83D776;
 
 
  + REP #$30                                                   ;83D826|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83D82F|D003    |83D834;
    JMP.W fAreaEvents_FloristHandler                           ;83D831|4C76D7  |83D776;
 
 
  + REP #$30                                                   ;83D834|C230    |      ;
    %AIExecute($0000, $0022, $0008)
    RTS                                                        ;83D843|60      |      ;
 
 
fAreaEvents_Toolshop:
    REP #$30                                                   ;83D844|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE +                                                      ;83D84D|D002    |83D851;
    BRA fAreaEvents_ToolshopHandler                            ;83D84F|801B    |83D86C;
 
 
  + REP #$30                                                   ;83D851|C230    |      ;
    %CheckFlag(event6, $0002)
    BEQ fAreaEvents_ToolshopHandler                            ;83D85A|F010    |83D86C;
    REP #$30                                                   ;83D85C|C230    |      ;
    %AIExecute($0000, $0022, $0005)
    RTS                                                        ;83D86B|60      |      ;
 
 
fAreaEvents_ToolshopHandler:
    REP #$30                                                   ;83D86C|C230    |      ;
    %CheckFlag(daily3, $0010)
    BEQ +                                                      ;83D875|F010    |83D887;
    REP #$30                                                   ;83D877|C230    |      ;
    %AIExecute($0000, $001A, $0001)
    RTS                                                        ;83D886|60      |      ;
 
 
  + REP #$30                                                   ;83D887|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE .label1                                                ;83D890|D010    |83D8A2;
    REP #$30                                                   ;83D892|C230    |      ;
    %AIExecute($0000, $000B, $0002)
    RTS                                                        ;83D8A1|60      |      ;
 
 
.label1:
    REP #$20                                                   ;83D8A2|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D8A4|AD9601  |000196;
    AND.W #$0008                                               ;83D8A7|290800  |      ;
    BNE .label3                                                ;83D8AA|D04D    |83D8F9;
    SEP #$20                                                   ;83D8AC|E220    |      ;
    REP #$10                                                   ;83D8AE|C210    |      ;
    LDA.W nWeatherForecast                                     ;83D8B0|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83D8B5|B022    |83D8D9;
    LDA.W nWeatherForecast                                     ;83D8B7|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83D8BC|F04B    |83D909;
    REP #$30                                                   ;83D8BE|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83D8C7|D040    |83D909;
    LDA.W strcDialogDisplay.mapFlags                           ;83D8C9|AD9601  |000196;
    AND.W #$0200                                               ;83D8CC|290002  |      ;
    BNE .label4                                                ;83D8CF|D048    |83D919;
    LDA.W strcDialogDisplay.mapFlags                           ;83D8D1|AD9601  |000196;
    AND.W #$0002                                               ;83D8D4|290200  |      ;
    BNE .label2                                                ;83D8D7|D010    |83D8E9;
 
.anyFestival:
    REP #$30                                                   ;83D8D9|C230    |      ;
    %AIExecute($0000, $0001, $0004)
    RTS                                                        ;83D8E8|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83D8E9|C230    |      ;
    %AIExecute($0000, $0004, $0003)
    RTS                                                        ;83D8F8|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83D8F9|C230    |      ;
    %AIExecute($0000, $0007, $0003)
    RTS                                                        ;83D908|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83D909|C230    |      ;
    %AIExecute($0000, $0006, $0003)
    RTS                                                        ;83D918|60      |      ;
 
 
.label4:
    REP #$30                                                   ;83D919|C230    |      ;
    %AIExecute($0000, $0008, $0003)
    RTS                                                        ;83D928|60      |      ;
 
 
fAreaEvents_AnnBedroom:
    REP #$30                                                   ;83D929|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE +                                                      ;83D932|D003    |83D937;
    JMP.W fAreaEvents_ToolshopHandler                          ;83D934|4C6CD8  |83D86C;
 
 
  + REP #$30                                                   ;83D937|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83D940|D003    |83D945;
    JMP.W fAreaEvents_ToolshopHandler                          ;83D942|4C6CD8  |83D86C;
 
 
  + REP #$30                                                   ;83D945|C230    |      ;
    %AIExecute($0000, $0022, $0006)
    RTS                                                        ;83D954|60      |      ;
 
 
fAreaEvents_Restaurant:
    REP #$30                                                   ;83D955|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE +                                                      ;83D95E|D002    |83D962;
    BRA fAreaEvents_RestaurantHandler                          ;83D960|801B    |83D97D;
 
 
  + REP #$30                                                   ;83D962|C230    |      ;
    %CheckFlag(event6, $0002)
    BEQ fAreaEvents_RestaurantHandler                          ;83D96B|F010    |83D97D;
    REP #$30                                                   ;83D96D|C230    |      ;
    %AIExecute($0000, $0022, $0009)
    RTS                                                        ;83D97C|60      |      ;
 
 
fAreaEvents_RestaurantHandler:
    REP #$30                                                   ;83D97D|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83D986|D010    |83D998;
    REP #$30                                                   ;83D988|C230    |      ;
    %AIExecute($0000, $000B, $0004)
    RTS                                                        ;83D997|60      |      ;
 
 
  + REP #$20                                                   ;83D998|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83D99A|AD9601  |000196;
    AND.W #$0008                                               ;83D99D|290800  |      ;
    BNE .label2                                                ;83D9A0|D04D    |83D9EF;
    SEP #$20                                                   ;83D9A2|E220    |      ;
    REP #$10                                                   ;83D9A4|C210    |      ;
    LDA.W nWeatherForecast                                     ;83D9A6|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83D9AB|B022    |83D9CF;
    LDA.W nWeatherForecast                                     ;83D9AD|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83D9B2|F04B    |83D9FF;
    REP #$30                                                   ;83D9B4|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83D9BD|D040    |83D9FF;
    LDA.W strcDialogDisplay.mapFlags                           ;83D9BF|AD9601  |000196;
    AND.W #$0200                                               ;83D9C2|290002  |      ;
    BNE .label3                                                ;83D9C5|D048    |83DA0F;
    LDA.W strcDialogDisplay.mapFlags                           ;83D9C7|AD9601  |000196;
    AND.W #$0002                                               ;83D9CA|290200  |      ;
    BNE .label1                                                ;83D9CD|D010    |83D9DF;
 
.anyFestival:
    REP #$30                                                   ;83D9CF|C230    |      ;
    %AIExecute($0000, $0001, $0005)
    RTS                                                        ;83D9DE|60      |      ;
 
 
.label1:
    REP #$30                                                   ;83D9DF|C230    |      ;
    %AIExecute($0000, $0004, $0004)
    RTS                                                        ;83D9EE|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83D9EF|C230    |      ;
    %AIExecute($0000, $0007, $0004)
    RTS                                                        ;83D9FE|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83D9FF|C230    |      ;
    %AIExecute($0000, $0006, $0004)
    RTS                                                        ;83DA0E|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83DA0F|C230    |      ;
    %AIExecute($0000, $0008, $0004)
    RTS                                                        ;83DA1E|60      |      ;
 
 
fAreaEvents_EllenBedroom:
    REP #$30                                                   ;83DA1F|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE +                                                      ;83DA28|D003    |83DA2D;
    JMP.W fAreaEvents_RestaurantHandler                        ;83DA2A|4C7DD9  |83D97D;
 
 
  + REP #$30                                                   ;83DA2D|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83DA36|D003    |83DA3B;
    JMP.W fAreaEvents_RestaurantHandler                        ;83DA38|4C7DD9  |83D97D;
 
 
  + REP #$30                                                   ;83DA3B|C230    |      ;
    %AIExecute($0000, $0022, $000A)
    RTS                                                        ;83DA4A|60      |      ;
 
 
fAreaEvents_FortuneTeller:
    REP #$30                                                   ;83DA4B|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83DA54|D010    |83DA66;
    REP #$30                                                   ;83DA56|C230    |      ;
    %AIExecute($0000, $000B, $0005)
    RTS                                                        ;83DA65|60      |      ;
 
 
  + REP #$20                                                   ;83DA66|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83DA68|AD9601  |000196;
    AND.W #$0008                                               ;83DA6B|290800  |      ;
    BNE .label2                                                ;83DA6E|D04D    |83DABD;
    SEP #$20                                                   ;83DA70|E220    |      ;
    REP #$10                                                   ;83DA72|C210    |      ;
    LDA.W nWeatherForecast                                     ;83DA74|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83DA79|B022    |83DA9D;
    LDA.W nWeatherForecast                                     ;83DA7B|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83DA80|F04B    |83DACD;
    REP #$30                                                   ;83DA82|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83DA8B|D040    |83DACD;
    LDA.W strcDialogDisplay.mapFlags                           ;83DA8D|AD9601  |000196;
    AND.W #$0200                                               ;83DA90|290002  |      ;
    BNE .label3                                                ;83DA93|D048    |83DADD;
    LDA.W strcDialogDisplay.mapFlags                           ;83DA95|AD9601  |000196;
    AND.W #$0002                                               ;83DA98|290200  |      ;
    BNE .label1                                                ;83DA9B|D010    |83DAAD;
 
.anyFestival:
    REP #$30                                                   ;83DA9D|C230    |      ;
    %AIExecute($0000, $0001, $0006)
    RTS                                                        ;83DAAC|60      |      ;
 
 
.label1:
    REP #$30                                                   ;83DAAD|C230    |      ;
    %AIExecute($0000, $0004, $0005)
    RTS                                                        ;83DABC|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83DABD|C230    |      ;
    %AIExecute($0000, $0007, $0005)
    RTS                                                        ;83DACC|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83DACD|C230    |      ;
    %AIExecute($0000, $0006, $0005)
    RTS                                                        ;83DADC|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83DADD|C230    |      ;
    %AIExecute($0000, $0008, $0005)
    RTS                                                        ;83DAEC|60      |      ;
 
 
fAreaEvents_AnimalShop:
    REP #$30                                                   ;83DAED|C230    |      ;
    %CheckFlag(event3, $0001)
    BNE +                                                      ;83DAF6|D010    |83DB08;
    REP #$30                                                   ;83DAF8|C230    |      ;
    %AIExecute($0000, $000B, $0006)
    RTS                                                        ;83DB07|60      |      ;
 
 
  + REP #$20                                                   ;83DB08|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83DB0A|AD9601  |000196;
    AND.W #$0008                                               ;83DB0D|290800  |      ;
    BNE .label2                                                ;83DB10|D04D    |83DB5F;
    SEP #$20                                                   ;83DB12|E220    |      ;
    REP #$10                                                   ;83DB14|C210    |      ;
    LDA.W nWeatherForecast                                     ;83DB16|AD8C09  |00098C;
    CMP.B #!WEATHER_FLOWERFESTIVAL                                                 
    BCS .anyFestival                                           ;83DB1B|B022    |83DB3F;
    LDA.W nWeatherForecast                                     ;83DB1D|AD8C09  |00098C;
    CMP.B #!WEATHER_HURRICANE                                                 
    BEQ .hurricane                                             ;83DB22|F04B    |83DB6F;
    REP #$30                                                   ;83DB24|C230    |      ;
    %CheckFlag(event1, $0020)
    BNE .hurricane                                             ;83DB2D|D040    |83DB6F;
    LDA.W strcDialogDisplay.mapFlags                           ;83DB2F|AD9601  |000196;
    AND.W #$0200                                               ;83DB32|290002  |      ;
    BNE .label3                                                ;83DB35|D048    |83DB7F;
    LDA.W strcDialogDisplay.mapFlags                           ;83DB37|AD9601  |000196;
    AND.W #$0002                                               ;83DB3A|290200  |      ;
    BNE .label1                                                ;83DB3D|D010    |83DB4F;
 
.anyFestival:
    REP #$30                                                   ;83DB3F|C230    |      ;
    %AIExecute($0000, $0001, $0007)
    RTS                                                        ;83DB4E|60      |      ;
 
 
.label1:
    REP #$30                                                   ;83DB4F|C230    |      ;
    %AIExecute($0000, $0004, $0006)
    RTS                                                        ;83DB5E|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83DB5F|C230    |      ;
    %AIExecute($0000, $0007, $0006)
    RTS                                                        ;83DB6E|60      |      ;
 
 
.hurricane:
    REP #$30                                                   ;83DB6F|C230    |      ;
    %AIExecute($0000, $0006, $0006)
    RTS                                                        ;83DB7E|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83DB7F|C230    |      ;
    %AIExecute($0000, $0008, $0006)
    RTS                                                        ;83DB8E|60      |      ;
 
 
fAreaEvents_Bar:
    REP #$30                                                   ;83DB8F|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE +                                                      ;83DB98|D002    |83DB9C;
    BRA fAreaEvents_BarHandler                                 ;83DB9A|801B    |83DBB7;
 
 
  + REP #$30                                                   ;83DB9C|C230    |      ;
    %CheckFlag(event6, $0002)
    BEQ fAreaEvents_BarHandler                                 ;83DBA5|F010    |83DBB7;
    REP #$30                                                   ;83DBA7|C230    |      ;
    %AIExecute($0000, $0022, $000B)
    RTS                                                        ;83DBB6|60      |      ;
 
 
fAreaEvents_BarHandler:
    SEP #$20                                                   ;83DBB7|E220    |      ;
    REP #$10                                                   ;83DBB9|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83DBBB|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83DBBF|C903    |      ;
    BNE +                                                      ;83DBC1|D023    |83DBE6;
    LDA.L nCurrentDay                                          ;83DBC3|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83DBC7|C918    |      ;
    BNE +                                                      ;83DBC9|D01B    |83DBE6;
    REP #$20                                                   ;83DBCB|C220    |      ;
    %CheckFlag(unknown1, $0004)
    BEQ +                                                      ;83DBD4|F010    |83DBE6;
    REP #$30                                                   ;83DBD6|C230    |      ;
    %AIExecute($0000, $000F, $0003)
    RTS                                                        ;83DBE5|60      |      ;
 
 
  + REP #$30                                                   ;83DBE6|C230    |      ;
    %CheckFlag(event3, $0002)
    BNE +                                                      ;83DBEF|D01D    |83DC0E;
    REP #$30                                                   ;83DBF1|C230    |      ;
    %AIExecute($0000, $000B, $0007)
    REP #$30                                                   ;83DC00|C230    |      ;
    %SetFlag(event3, $0002)
    RTS                                                        ;83DC0D|60      |      ;
 
 
  + REP #$30                                                   ;83DC0E|C230    |      ;
    %AIExecute($0000, $0005, $0000)
    RTS                                                        ;83DC1D|60      |      ;
 
 
fAreaEvents_EveBedroom:
    REP #$30                                                   ;83DC1E|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE +                                                      ;83DC27|D003    |83DC2C;
    JMP.W fAreaEvents_BarHandler                               ;83DC29|4CB7DB  |83DBB7;
 
 
  + REP #$30                                                   ;83DC2C|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE +                                                      ;83DC35|D003    |83DC3A;
    JMP.W fAreaEvents_BarHandler                               ;83DC37|4CB7DB  |83DBB7;
 
 
  + REP #$30                                                   ;83DC3A|C230    |      ;
    %AIExecute($0000, $0022, $000C)
    RTS                                                        ;83DC49|60      |      ;
 
 
fAreaEvents_Woods:
    REP #$30                                                   ;83DC4A|C230    |      ;
    %CheckFlag(event3, $0004)
    BNE +                                                      ;83DC53|D01D    |83DC72;
    REP #$30                                                   ;83DC55|C230    |      ;
    %AIExecute($0000, $000B, $0009)
    REP #$20                                                   ;83DC64|C220    |      ;
    %SetFlag(event3, $0004)
    RTS                                                        ;83DC71|60      |      ;
 
 
  + REP #$30                                                   ;83DC72|C230    |      ;
    %CheckFlag(daily3, $0020)
    BEQ +                                                      ;83DC7B|F010    |83DC8D;
    REP #$30                                                   ;83DC7D|C230    |      ;
    %AIExecute($0000, $001D, $0003)
    RTS                                                        ;83DC8C|60      |      ;
 
 
  + REP #$30                                                   ;83DC8D|C230    |      ;
    %CheckFlag(event5, $0010)
    BEQ +                                                      ;83DC96|F010    |83DCA8;
    REP #$30                                                   ;83DC98|C230    |      ;
    %AIExecute($0000, $001D, $0001)
    RTS                                                        ;83DCA7|60      |      ;
 
 
  + REP #$30                                                   ;83DCA8|C230    |      ;
    %CheckFlag(event5, $0004)
    BEQ .label1                                                ;83DCB1|F02C    |83DCDF;
    %CheckFlag(daily3, $0008)
    BNE +                                                      ;83DCBA|D011    |83DCCD;
    REP #$30                                                   ;83DCBC|C230    |      ;
    %AIExecute($0009, $001C, $0001)
    BRA .label2                                                ;83DCCB|8072    |83DD3F;
 
 
  + REP #$30                                                   ;83DCCD|C230    |      ;
    %AIExecute($0009, $001C, $0002)
    JMP.W .justReturn                                          ;83DCDC|4C74DD  |83DD74;
 
 
.label1:
    SEP #$20                                                   ;83DCDF|E220    |      ;
    REP #$10                                                   ;83DCE1|C210    |      ;
    LDA.L nCurrentYearID                                       ;83DCE3|AF181F7F|7F1F18;
    BEQ .label2                                                ;83DCE7|F056    |83DD3F;
    LDA.L nCurrentSeasonID                                     ;83DCE9|AF191F7F|7F1F19;
    CMP.B #$02                                                 ;83DCED|C902    |      ;
    BCC .label2                                                ;83DCEF|904E    |83DD3F;
    LDA.L nCurrentDay                                          ;83DCF1|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83DCF5|C901    |      ;
    BEQ .label2                                                ;83DCF7|F046    |83DD3F;
    CMP.B #$08                                                 ;83DCF9|C908    |      ;
    BCC +                                                      ;83DCFB|9012    |83DD0F;
    CMP.B #$0D                                                 ;83DCFD|C90D    |      ;
    BCC .label2                                                ;83DCFF|903E    |83DD3F;
    CMP.B #$12                                                 ;83DD01|C912    |      ;
    BCC +                                                      ;83DD03|900A    |83DD0F;
    CMP.B #$19                                                 ;83DD05|C919    |      ;
    BCC .label2                                                ;83DD07|9036    |83DD3F;
    CMP.B #$1D                                                 ;83DD09|C91D    |      ;
    BCC +                                                      ;83DD0B|9002    |83DD0F;
    BRA .label2                                                ;83DD0D|8030    |83DD3F;
 
 
  + REP #$20                                                   ;83DD0F|C220    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83DD11|AD9601  |000196;
    AND.W #$001A                                               ;83DD14|291A00  |      ;
    BNE .label2                                                ;83DD17|D026    |83DD3F;
    %CheckFlag(event4, $0200)
    BNE .label2                                                ;83DD20|D01D    |83DD3F;
    SEP #$20                                                   ;83DD22|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83DD24|AF1A1F7F|7F1F1A;
    BEQ .label2                                                ;83DD28|F015    |83DD3F;
    CMP.B #$06                                                 ;83DD2A|C906    |      ;
    BEQ .label2                                                ;83DD2C|F011    |83DD3F;
    REP #$30                                                   ;83DD2E|C230    |      ;
    %AIExecute($0009, $0021, $0000)
    BRA .label2                                                ;83DD3D|8000    |83DD3F;
 
 
.label2:
    REP #$30                                                   ;83DD3F|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83DD41|AD9601  |000196;
    AND.W #$0008                                               ;83DD44|290800  |      ;
    BNE .justReturn                                            ;83DD47|D02B    |83DD74;
    LDA.W strcDialogDisplay.mapFlags                           ;83DD49|AD9601  |000196;
    AND.W #$0200                                               ;83DD4C|290002  |      ;
    BNE .justReturn                                            ;83DD4F|D023    |83DD74;
    LDA.W strcDialogDisplay.mapFlags                           ;83DD51|AD9601  |000196;
    AND.W #$0002                                               ;83DD54|290200  |      ;
    BNE .justReturn                                            ;83DD57|D01B    |83DD74;
    SEP #$20                                                   ;83DD59|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83DD5B|AF1A1F7F|7F1F1A;
    BEQ .notSunday                                             ;83DD5F|F014    |83DD75;
    CMP.B #$06                                                 ;83DD61|C906    |      ;
    BEQ .saturday                                              ;83DD63|F020    |83DD85;
    REP #$30                                                   ;83DD65|C230    |      ;
    %AIExecute($0000, $0001, $0008)
 
.justReturn:
    RTS                                                        ;83DD74|60      |      ;
 
 
.notSunday:
    REP #$30                                                   ;83DD75|C230    |      ;
    %AIExecute($0000, $0003, $0002)
    RTS                                                        ;83DD84|60      |      ;
 
 
.saturday:
    REP #$30                                                   ;83DD85|C230    |      ;
    %AIExecute($0000, $0002, $0003)
    RTS                                                        ;83DD94|60      |      ;
 
 
fAreaEvents_WorksmanHouse:
    REP #$30                                                   ;83DD95|C230    |      ;
    %CheckFlag(event4, $2000)
    BNE +                                                      ;83DD9E|D019    |83DDB9;
    %CheckFlag(event4, $1000)
    BEQ +                                                      ;83DDA7|F010    |83DDB9;
    REP #$30                                                   ;83DDA9|C230    |      ;
    %AIExecute($0000, $0019, $0001)
    RTS                                                        ;83DDB8|60      |      ;
 
 
  + REP #$30                                                   ;83DDB9|C230    |      ;
    %CheckFlag(event3, $0008)
    BNE .label2                                                ;83DDC2|D046    |83DE0A;
    SEP #$20                                                   ;83DDC4|E220    |      ;
    LDA.L nCurrentYearID                                       ;83DDC6|AF181F7F|7F1F18;
    BNE .label1                                                ;83DDCA|D031    |83DDFD;
    LDA.L nCurrentSeasonID                                     ;83DDCC|AF191F7F|7F1F19;
    CMP.B #!SEASON_FALL                                                 
    BCS .label1                                                ;83DDD2|B029    |83DDFD;
    CMP.B #!SEASON_SPRING                                                 
    BEQ +                                                      ;83DDD6|F008    |83DDE0;
    LDA.L nCurrentDay                                          ;83DDD8|AF1B1F7F|7F1F1B;
    CMP.B #$1A                                                 ;83DDDC|C91A    |      ;
    BCS .label1                                                ;83DDDE|B01D    |83DDFD;
 
  + REP #$30                                                   ;83DDE0|C230    |      ;
    %AIExecute($0000, $000B, $000A)
    REP #$20                                                   ;83DDEF|C220    |      ;
    %SetFlag(event3, $0008)
    RTS                                                        ;83DDFC|60      |      ;
 
 
.label1:
    REP #$20                                                   ;83DDFD|C220    |      ;
    %SetFlag(event3, $0008)
 
.label2:
    REP #$30                                                   ;83DE0A|C230    |      ;
    LDA.W strcDialogDisplay.mapFlags                           ;83DE0C|AD9601  |000196;
    AND.W #$0008                                               ;83DE0F|290800  |      ;
    BNE .label4                                                ;83DE12|D030    |83DE44;
    LDA.W strcDialogDisplay.mapFlags                           ;83DE14|AD9601  |000196;
    AND.W #$0200                                               ;83DE17|290002  |      ;
    BNE .label5                                                ;83DE1A|D038    |83DE54;
    LDA.W strcDialogDisplay.mapFlags                           ;83DE1C|AD9601  |000196;
    AND.W #$0002                                               ;83DE1F|290200  |      ;
    BNE .label3                                                ;83DE22|D010    |83DE34;
    REP #$30                                                   ;83DE24|C230    |      ;
    %AIExecute($0000, $0001, $0009)
    RTS                                                        ;83DE33|60      |      ;
 
 
.label3:
    REP #$30                                                   ;83DE34|C230    |      ;
    %AIExecute($0000, $0004, $0007)
    RTS                                                        ;83DE43|60      |      ;
 
 
.label4:
    REP #$30                                                   ;83DE44|C230    |      ;
    %AIExecute($0000, $0007, $0007)
    RTS                                                        ;83DE53|60      |      ;
 
 
.label5:
    REP #$30                                                   ;83DE54|C230    |      ;
    %AIExecute($0000, $0008, $0007)
    RTS                                                        ;83DE63|60      |      ;
 
 
fAreaEvents_ImpsUnderground:
    REP #$30                                                   ;83DE64|C230    |      ;
    %CheckFlag(event3, $2000)
    BNE +                                                      ;83DE6D|D010    |83DE7F;
    REP #$30                                                   ;83DE6F|C230    |      ;
    %AIExecute($0000, $0015, $0000)
    RTS                                                        ;83DE7E|60      |      ;
 
 
  + REP #$30                                                   ;83DE7F|C230    |      ;
    %CheckFlag(event1, $0002)
    BEQ .justReturn                                            ;83DE88|F010    |83DE9A;
    REP #$30                                                   ;83DE8A|C230    |      ;
    %AIExecute($0000, $0001, $000A)
    RTS                                                        ;83DE99|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83DE9A|60      |      ;
 
 
fAreaEvents_CowBarn:
    REP #$20                                                   ;83DE9B|C220    |      ;
    %CheckFlag(event1, $0008)
    BEQ .justReturn                                            ;83DEA4|F02C    |83DED2;
    REP #$20                                                   ;83DEA6|C220    |      ;
    %AIExecute($0015, $0000, $0025)
    SEP #$20                                                   ;83DEB5|E220    |      ;
    LDA.B #$45                                                 ;83DEB7|A945    |      ;
    STA.W nPlayerInteractionIndex                              ;83DEB9|8D6E09  |00096E;
    STZ.W nPlayerInteractionArg1                               ;83DEBC|9C6F09  |00096F;
    STZ.W nPlayerInteractionArg2                               ;83DEBF|9C7009  |000970;
    %SetPlayerFlag(!PFLAGS_INTERACTING)
    %SetPlayerAction(!PACTION_NONE)
 
.justReturn:
    RTS                                                        ;83DED2|60      |      ;
 
 
fAreaEvents_House:
    SEP #$20                                                   ;83DED3|E220    |      ;
    REP #$10                                                   ;83DED5|C210    |      ;
    LDA.L nCurrentYearID                                       ;83DED7|AF181F7F|7F1F18;
    CMP.B #$02                                                 ;83DEDB|C902    |      ;
    BNE +                                                      ;83DEDD|D013    |83DEF2;
    LDA.L nCurrentSeasonID                                     ;83DEDF|AF191F7F|7F1F19;
    CMP.B #!SEASON_SUMMER                                                 
    BNE +                                                      ;83DEE5|D00B    |83DEF2;
    LDA.L nCurrentDay                                          ;83DEE7|AF1B1F7F|7F1F1B;
    CMP.B #$1E                                                 ;83DEEB|C91E    |      ;
    BNE +                                                      ;83DEED|D003    |83DEF2;
    JMP.W fAreaInit_HouseHelper                                ;83DEEF|4CD8F4  |83F4D8;
 
 
  + REP #$30                                                   ;83DEF2|C230    |      ;
    %CheckFlag(event1, $0080)
    BEQ +                                                      ;83DEFB|F009    |83DF06;
    SEP #$20                                                   ;83DEFD|E220    |      ;
    LDA.B #!AREA_HOUSE3                                                 
    STA.W nDestinationAreaId                                   ;83DF01|8D8B09  |00098B;
    BRA .jump                                                  ;83DF04|8014    |83DF1A;
 
 
  + REP #$30                                                   ;83DF06|C230    |      ;
    %CheckFlag(event1, $0040)
    BEQ .jump                                                  ;83DF0F|F009    |83DF1A;
    SEP #$20                                                   ;83DF11|E220    |      ;
    LDA.B #!AREA_HOUSE2                                                 
    STA.W nDestinationAreaId                                   ;83DF15|8D8B09  |00098B;
    BRA .jump                                                  ;83DF18|8000    |83DF1A;
 
 
.jump:
    REP #$30                                                   ;83DF1A|C230    |      ;
    %CheckFlag(event5, $2000)
    BEQ +                                                      ;83DF23|F022    |83DF47;
    %CheckFlag(event5, $4000)
    BNE +                                                      ;83DF2C|D019    |83DF47;
    LDA.W #$009C                                               ;83DF2E|A99C00  |      ;
    STA.W nTileInFrontOfPlayerX                                ;83DF31|8D8509  |000985;
    LDA.W #$0090                                               ;83DF34|A99000  |      ;
    STA.W nTileInFrontOfPlayerY                                ;83DF37|8D8709  |000987;
    LDA.W #$0010                                               ;83DF3A|A91000  |      ;
    LDX.W #$0000                                               ;83DF3D|A20000  |      ;
    LDY.W #$001F                                               ;83DF40|A01F00  |      ;
    JSL.L fAI_Unknown8480F8                                    ;83DF43|22F88084|8480F8;
 
  + REP #$30                                                   ;83DF47|C230    |      ;
    %CheckFlag(event6, $0080)
    BNE .label1                                                ;83DF50|D003    |83DF55;
    JMP.W .label2                                              ;83DF52|4CF8DF  |83DFF8;
 
 
.label1:
    %UnsetFlag(event6, $0080)
    SEP #$20                                                   ;83DF60|E220    |      ;
    LDA.B #$19                                                 ;83DF62|A919    |      ;
    JSL.L fAudioUnknown_8382C6                                 ;83DF64|22C68283|8382C6;
    SEP #$20                                                   ;83DF68|E220    |      ;
    REP #$10                                                   ;83DF6A|C210    |      ;
    LDA.B #$02                                                 ;83DF6C|A902    |      ;
    LDX.W #$0240                                               ;83DF6E|A24002  |      ;
    LDY.W #$02C0                                               ;83DF71|A0C002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DF74|2249B082|82B049;
    SEP #$20                                                   ;83DF78|E220    |      ;
    REP #$10                                                   ;83DF7A|C210    |      ;
    LDA.B #$02                                                 ;83DF7C|A902    |      ;
    LDX.W #$0250                                               ;83DF7E|A25002  |      ;
    LDY.W #$02C0                                               ;83DF81|A0C002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DF84|2249B082|82B049;
    SEP #$20                                                   ;83DF88|E220    |      ;
    REP #$10                                                   ;83DF8A|C210    |      ;
    LDA.B #$02                                                 ;83DF8C|A902    |      ;
    LDX.W #$0260                                               ;83DF8E|A26002  |      ;
    LDY.W #$02C0                                               ;83DF91|A0C002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DF94|2249B082|82B049;
    SEP #$20                                                   ;83DF98|E220    |      ;
    REP #$10                                                   ;83DF9A|C210    |      ;
    LDA.B #$02                                                 ;83DF9C|A902    |      ;
    LDX.W #$0240                                               ;83DF9E|A24002  |      ;
    LDY.W #$02D0                                               ;83DFA1|A0D002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFA4|2249B082|82B049;
    SEP #$20                                                   ;83DFA8|E220    |      ;
    REP #$10                                                   ;83DFAA|C210    |      ;
    LDA.B #$02                                                 ;83DFAC|A902    |      ;
    LDX.W #$0250                                               ;83DFAE|A25002  |      ;
    LDY.W #$02D0                                               ;83DFB1|A0D002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFB4|2249B082|82B049;
    SEP #$20                                                   ;83DFB8|E220    |      ;
    REP #$10                                                   ;83DFBA|C210    |      ;
    LDA.B #$02                                                 ;83DFBC|A902    |      ;
    LDX.W #$0260                                               ;83DFBE|A26002  |      ;
    LDY.W #$02D0                                               ;83DFC1|A0D002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFC4|2249B082|82B049;
    SEP #$20                                                   ;83DFC8|E220    |      ;
    REP #$10                                                   ;83DFCA|C210    |      ;
    LDA.B #$02                                                 ;83DFCC|A902    |      ;
    LDX.W #$0240                                               ;83DFCE|A24002  |      ;
    LDY.W #$02E0                                               ;83DFD1|A0E002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFD4|2249B082|82B049;
    SEP #$20                                                   ;83DFD8|E220    |      ;
    REP #$10                                                   ;83DFDA|C210    |      ;
    LDA.B #$02                                                 ;83DFDC|A902    |      ;
    LDX.W #$0250                                               ;83DFDE|A25002  |      ;
    LDY.W #$02E0                                               ;83DFE1|A0E002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFE4|2249B082|82B049;
    SEP #$20                                                   ;83DFE8|E220    |      ;
    REP #$10                                                   ;83DFEA|C210    |      ;
    LDA.B #$02                                                 ;83DFEC|A902    |      ;
    LDX.W #$0260                                               ;83DFEE|A26002  |      ;
    LDY.W #$02E0                                               ;83DFF1|A0E002  |      ;
    JSL.L fMap_UpdateFarmTilemapCoords                         ;83DFF4|2249B082|82B049;
 
.label2:
    REP #$30                                                   ;83DFF8|C230    |      ;
    %CheckFlag(event6, $0100)
    BEQ +                                                      ;83E001|F013    |83E016;
    %UnsetFlag(event6, $0100)
    SEP #$20                                                   ;83E00E|E220    |      ;
    LDA.B #$15                                                 ;83E010|A915    |      ;
    JSL.L fAudioUnknown_8382C6                                 ;83E012|22C68283|8382C6;
 
  + REP #$30                                                   ;83E016|C230    |      ;
    %CheckFlag(event6, $0200)
    BEQ +                                                      ;83E01F|F02B    |83E04C;
    %UnsetFlag(event6, $0200)
    SEP #$20                                                   ;83E02C|E220    |      ;
    REP #$10                                                   ;83E02E|C210    |      ;
    LDA.B #$22                                                 ;83E030|A922    |      ;
    LDX.W #$0007                                               ;83E032|A20700  |      ;
    LDY.W #$0014                                               ;83E035|A01400  |      ;
    JSL.L fAudioUnknown_8382FE                                 ;83E038|22FE8283|8382FE;
    SEP #$20                                                   ;83E03C|E220    |      ;
    REP #$10                                                   ;83E03E|C210    |      ;
    LDA.B #$22                                                 ;83E040|A922    |      ;
    LDX.W #$0007                                               ;83E042|A20700  |      ;
    LDY.W #$001E                                               ;83E045|A01E00  |      ;
    JSL.L fAudioUnknown_8382FE                                 ;83E048|22FE8283|8382FE;
 
  + REP #$30                                                   ;83E04C|C230    |      ;
    %CheckFlag(event6, $0020)
    BEQ +                                                      ;83E055|F01D    |83E074;
    SEP #$20                                                   ;83E057|E220    |      ;
    REP #$10                                                   ;83E059|C210    |      ;
    LDA.B #$20                                                 ;83E05B|A920    |      ;
    LDX.W #$0007                                               ;83E05D|A20700  |      ;
    LDY.W #$003C                                               ;83E060|A03C00  |      ;
    JSL.L fAudioUnknown_8382FE                                 ;83E063|22FE8283|8382FE;
    REP #$30                                                   ;83E067|C230    |      ;
    %UnsetFlag(event6, $0020)
 
  + REP #$30                                                   ;83E074|C230    |      ;
    %CheckFlag(event6, $0010)
    BEQ .label6                                                ;83E07D|F05C    |83E0DB;
    %CheckFlag(daily3, $4000)
    BNE .label5                                                ;83E086|D043    |83E0CB;
    %CheckFlag(daily3, $2000)
    BNE +                                                      ;83E08F|D010    |83E0A1;
    REP #$30                                                   ;83E091|C230    |      ;
    %AIExecute($0000, $001F, $0000)
    RTS                                                        ;83E0A0|60      |      ;
 
 
  + REP #$30                                                   ;83E0A1|C230    |      ;
    %AIExecute($0000, $001F, $0001)
    REP #$20                                                   ;83E0B0|C220    |      ;
    LDA.L nFirstChildAge                                       ;83E0B2|AF371F7F|7F1F37;
    CMP.W #$003C                                               ;83E0B6|C93C00  |      ;
    BNE +                                                      ;83E0B9|D008    |83E0C3;
    SEP #$20                                                   ;83E0BB|E220    |      ;
    LDA.B #$05                                                 ;83E0BD|A905    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;83E0BF|8D9F09  |00099F;
    RTS                                                        ;83E0C2|60      |      ;
 
 
  + SEP #$20                                                   ;83E0C3|E220    |      ;
    LDA.B #$06                                                 ;83E0C5|A906    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;83E0C7|8D9F09  |00099F;
    RTS                                                        ;83E0CA|60      |      ;
 
 
.label5:
    REP #$30                                                   ;83E0CB|C230    |      ;
    %AIExecute($0000, $001F, $0002)
    RTS                                                        ;83E0DA|60      |      ;
 
 
.label6:
    REP #$30                                                   ;83E0DB|C230    |      ;
    %CheckFlag(event6, $0040)
    BEQ .label7                                                ;83E0E4|F05E    |83E144;
    REP #$30                                                   ;83E0E6|C230    |      ;
    %UnsetFlag(event6, $0040)
    SEP #$20                                                   ;83E0F3|E220    |      ;
    LDA.B #$00                                                 ;83E0F5|A900    |      ;
    XBA                                                        ;83E0F7|EB      |      ;
    LDA.W strcStockData.unkCow                                 ;83E0F8|AD3709  |000937;
    REP #$20                                                   ;83E0FB|C220    |      ;
    JSL.L fGameEngine_GetCowData                               ;83E0FD|22A7C983|83C9A7;
    SEP #$20                                                   ;83E101|E220    |      ;
    REP #$10                                                   ;83E103|C210    |      ;
    LDA.B #$00                                                 ;83E105|A900    |      ;
    XBA                                                        ;83E107|EB      |      ;
    LDY.W #$000C                                               ;83E108|A00C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83E10B|B772    |000072;
    REP #$20                                                   ;83E10D|C220    |      ;
    STA.W strcNames.wCurrentCow                                ;83E10F|8D8908  |000889;
    SEP #$20                                                   ;83E112|E220    |      ;
    LDY.W #$000D                                               ;83E114|A00D00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83E117|B772    |000072;
    REP #$20                                                   ;83E119|C220    |      ;
    STA.W strcNames.wCurrentCow+2                              ;83E11B|8D8B08  |00088B;
    SEP #$20                                                   ;83E11E|E220    |      ;
    LDY.W #$000E                                               ;83E120|A00E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83E123|B772    |000072;
    REP #$20                                                   ;83E125|C220    |      ;
    STA.W strcNames.wCurrentCow+4                              ;83E127|8D8D08  |00088D;
    SEP #$20                                                   ;83E12A|E220    |      ;
    LDY.W #$000F                                               ;83E12C|A00F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83E12F|B772    |000072;
    STA.W strcNames.wCurrentCow+6                              ;83E131|8D8F08  |00088F;
    REP #$30                                                   ;83E134|C230    |      ;
    %AIExecute($0000, $0020, $0000)
    RTS                                                        ;83E143|60      |      ;
 
 
.label7:
    REP #$30                                                   ;83E144|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .label8                                                ;83E14D|D027    |83E176;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .label9                                                ;83E156|D02E    |83E186;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BNE .label10                                               ;83E15F|D032    |83E193;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BNE .label11                                               ;83E168|D036    |83E1A0;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .label12                                               ;83E171|D03A    |83E1AD;
    JMP.W .label23                                             ;83E173|4CC6E2  |83E2C6;
 
 
.label8:
    REP #$30                                                   ;83E176|C230    |      ;
    LDA.L nLove_Maria                                          ;83E178|AF1F1F7F|7F1F1F;
    CMP.W #$00C8                                               ;83E17C|C9C800  |      ;
    BCC +                                                      ;83E17F|9003    |83E184;
    JMP.W .label14                                             ;83E181|4C10E2  |83E210;
 
 
  + BRA .label13                                               ;83E184|8034    |83E1BA;
 
 
.label9:
    REP #$30                                                   ;83E186|C230    |      ;
    LDA.L nLove_Ann                                            ;83E188|AF211F7F|7F1F21;
    CMP.W #$00C8                                               ;83E18C|C9C800  |      ;
    BCS .label14                                               ;83E18F|B07F    |83E210;
    BRA .label13                                               ;83E191|8027    |83E1BA;
 
 
.label10:
    REP #$30                                                   ;83E193|C230    |      ;
    LDA.L nLove_Nina                                           ;83E195|AF231F7F|7F1F23;
    CMP.W #$00C8                                               ;83E199|C9C800  |      ;
    BCS .label14                                               ;83E19C|B072    |83E210;
    BRA .label13                                               ;83E19E|801A    |83E1BA;
 
 
.label11:
    REP #$30                                                   ;83E1A0|C230    |      ;
    LDA.L nLove_Ellen                                          ;83E1A2|AF251F7F|7F1F25;
    CMP.W #$00C8                                               ;83E1A6|C9C800  |      ;
    BCS .label14                                               ;83E1A9|B065    |83E210;
    BRA .label13                                               ;83E1AB|800D    |83E1BA;
 
 
.label12:
    REP #$30                                                   ;83E1AD|C230    |      ;
    LDA.L nLove_Eve                                            ;83E1AF|AF271F7F|7F1F27;
    CMP.W #$00C8                                               ;83E1B3|C9C800  |      ;
    BCS .label14                                               ;83E1B6|B058    |83E210;
    BRA .label13                                               ;83E1B8|8000    |83E1BA;
 
 
.label13:
    SEP #$20                                                   ;83E1BA|E220    |      ;
    REP #$10                                                   ;83E1BC|C210    |      ;
    LDA.L nCurrentTimeID                                       ;83E1BE|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83E1C2|C906    |      ;
    BNE .label14                                               ;83E1C4|D04A    |83E210;
    LDA.L nInGameHourCounter                                   ;83E1C6|AF1D1F7F|7F1F1D;
    BNE .label14                                               ;83E1CA|D044    |83E210;
    LDA.L nInGameMinuteCounter                                 ;83E1CC|AF1E1F7F|7F1F1E;
    BNE .label14                                               ;83E1D0|D03E    |83E210;
    REP #$20                                                   ;83E1D2|C220    |      ;
    %CheckFlag(event6, $000C)
    BNE .label14                                               ;83E1DB|D033    |83E210;
    %CheckFlag(event6, $0001)
    BNE .label14                                               ;83E1E4|D02A    |83E210;
    REP #$30                                                   ;83E1E6|C230    |      ;
    %AIExecute($0000, $0022, $0000)
    REP #$30                                                   ;83E1F5|C230    |      ;
    %SetFlag(event6, $0003)
    %SetFlag(daily3, $1000)
    JMP.W .label23                                             ;83E20D|4CC6E2  |83E2C6;
 
 
.label14:
    REP #$30                                                   ;83E210|C230    |      ;
    %UnsetFlag(daily3, $1000)
    %CheckFlag(event6, $0002)
    BNE .label17                                               ;83E224|D03C    |83E262;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BNE .label18                                               ;83E22D|D042    |83E271;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BEQ +                                                      ;83E236|F003    |83E23B;
    JMP.W .label19                                             ;83E238|4C82E2  |83E282;
 
 
  + %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BEQ .label15                                               ;83E242|F003    |83E247;
    JMP.W .label20                                             ;83E244|4C93E2  |83E293;
 
 
.label15:
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BEQ .label16                                               ;83E24E|F003    |83E253;
    JMP.W .label21                                             ;83E250|4CA4E2  |83E2A4;
 
 
.label16:
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BEQ +                                                      ;83E25A|F003    |83E25F;
    JMP.W .label22                                             ;83E25C|4CB5E2  |83E2B5;
 
 
  + JMP.W .label23                                             ;83E25F|4CC6E2  |83E2C6;
 
 
.label17:
    REP #$30                                                   ;83E262|C230    |      ;
    %SetFlag(daily3, $1000)
    BRA .label23                                               ;83E26F|8055    |83E2C6;
 
 
.label18:
    REP #$30                                                   ;83E271|C230    |      ;
    %AIExecute($0013, $0043, $0000)
    BRA .label23                                               ;83E280|8044    |83E2C6;
 
 
.label19:
    REP #$30                                                   ;83E282|C230    |      ;
    %AIExecute($0013, $0043, $0001)
    BRA .label23                                               ;83E291|8033    |83E2C6;
 
 
.label20:
    REP #$30                                                   ;83E293|C230    |      ;
    %AIExecute($0013, $0043, $0002)
    BRA .label23                                               ;83E2A2|8022    |83E2C6;
 
 
.label21:
    REP #$30                                                   ;83E2A4|C230    |      ;
    %AIExecute($0013, $0043, $0003)
    BRA .label23                                               ;83E2B3|8011    |83E2C6;
 
 
.label22:
    REP #$30                                                   ;83E2B5|C230    |      ;
    %AIExecute($0013, $0043, $0004)
    BRA .label23                                               ;83E2C4|8000    |83E2C6;
 
 
.label23:
    REP #$30                                                   ;83E2C6|C230    |      ;
    %CheckFlag(event6, $0004)
    BEQ .label24                                               ;83E2CF|F018    |83E2E9;
    LDA.L nFirstChildAge                                       ;83E2D1|AF371F7F|7F1F37;
    CMP.W #$003C                                               ;83E2D5|C93C00  |      ;
    BCC .label24                                               ;83E2D8|900F    |83E2E9;
    REP #$30                                                   ;83E2DA|C230    |      ;
    %AIExecute($0014, $0045, $0000)
 
.label24:
    REP #$30                                                   ;83E2E9|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ .label25                                               ;83E2F2|F018    |83E30C;
    LDA.L nSecondChildAge                                      ;83E2F4|AF391F7F|7F1F39;
    CMP.W #$003C                                               ;83E2F8|C93C00  |      ;
    BCC .label25                                               ;83E2FB|900F    |83E30C;
    REP #$30                                                   ;83E2FD|C230    |      ;
    %AIExecute($0015, $0045, $0003)
 
.label25:
    REP #$30                                                   ;83E30C|C230    |      ;
    %CheckFlag(daily4, $0020)
    BNE .label26                                               ;83E315|D019    |83E330;
    %CheckFlag(event3, $0001)
    BNE .label27                                               ;83E31E|D020    |83E340;
    REP #$30                                                   ;83E320|C230    |      ;
    %AIExecute($0000, $000A, $0000)
    RTS                                                        ;83E32F|60      |      ;
 
 
.label26:
    REP #$30                                                   ;83E330|C230    |      ;
    %AIExecute($0000, $000A, $0003)
    RTS                                                        ;83E33F|60      |      ;
 
 
.label27:
    SEP #$20                                                   ;83E340|E220    |      ;
    REP #$10                                                   ;83E342|C210    |      ;
    LDA.L nCurrentYearID                                       ;83E344|AF181F7F|7F1F18;
    CMP.B #$01                                                 ;83E348|C901    |      ;
    BNE .label28                                               ;83E34A|D034    |83E380;
    LDA.L nCurrentSeasonID                                     ;83E34C|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;83E350|C901    |      ;
    BNE .label28                                               ;83E352|D02C    |83E380;
    LDA.L nCurrentDay                                          ;83E354|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83E358|C901    |      ;
    BNE .label28                                               ;83E35A|D024    |83E380;
    LDA.L nCurrentTimeID                                       ;83E35C|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83E360|C906    |      ;
    BNE .label28                                               ;83E362|D01C    |83E380;
    LDA.L nInGameHourCounter                                   ;83E364|AF1D1F7F|7F1F1D;
    BNE .label28                                               ;83E368|D016    |83E380;
    LDA.L nInGameMinuteCounter                                 ;83E36A|AF1E1F7F|7F1F1E;
    BNE .label28                                               ;83E36E|D010    |83E380;
    REP #$30                                                   ;83E370|C230    |      ;
    %AIExecute($0000, $000A, $0004)
    RTS                                                        ;83E37F|60      |      ;
 
 
.label28:
    SEP #$20                                                   ;83E380|E220    |      ;
    REP #$10                                                   ;83E382|C210    |      ;
    LDA.L nCurrentYearID                                       ;83E384|AF181F7F|7F1F18;
    CMP.B #$02                                                 ;83E388|C902    |      ;
    BNE .label29                                               ;83E38A|D034    |83E3C0;
    LDA.L nCurrentSeasonID                                     ;83E38C|AF191F7F|7F1F19;
    CMP.B #$01                                                 ;83E390|C901    |      ;
    BNE .label29                                               ;83E392|D02C    |83E3C0;
    LDA.L nCurrentDay                                          ;83E394|AF1B1F7F|7F1F1B;
    CMP.B #$1D                                                 ;83E398|C91D    |      ;
    BNE .label29                                               ;83E39A|D024    |83E3C0;
    LDA.L nCurrentTimeID                                       ;83E39C|AF1C1F7F|7F1F1C;
    CMP.B #$06                                                 ;83E3A0|C906    |      ;
    BNE .label29                                               ;83E3A2|D01C    |83E3C0;
    LDA.L nInGameHourCounter                                   ;83E3A4|AF1D1F7F|7F1F1D;
    BNE .label29                                               ;83E3A8|D016    |83E3C0;
    LDA.L nInGameMinuteCounter                                 ;83E3AA|AF1E1F7F|7F1F1E;
    BNE .label29                                               ;83E3AE|D010    |83E3C0;
    REP #$30                                                   ;83E3B0|C230    |      ;
    %AIExecute($0000, $000A, $0005)
    RTS                                                        ;83E3BF|60      |      ;
 
 
.label29:
    SEP #$20                                                   ;83E3C0|E220    |      ;
    REP #$10                                                   ;83E3C2|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E3C4|AF191F7F|7F1F19;
    BNE .label30                                               ;83E3C8|D018    |83E3E2;
    LDA.L nCurrentDay                                          ;83E3CA|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83E3CE|C901    |      ;
    BNE .label30                                               ;83E3D0|D010    |83E3E2;
    REP #$30                                                   ;83E3D2|C230    |      ;
    %AIExecute($0000, $0028, $0000)
    RTS                                                        ;83E3E1|60      |      ;
 
 
.label30:
    SEP #$20                                                   ;83E3E2|E220    |      ;
    REP #$10                                                   ;83E3E4|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E3E6|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83E3EA|C903    |      ;
    BNE .justReturn                                            ;83E3EC|D018    |83E406;
    LDA.L nCurrentDay                                          ;83E3EE|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83E3F2|C918    |      ;
    BNE .justReturn                                            ;83E3F4|D010    |83E406;
    REP #$30                                                   ;83E3F6|C230    |      ;
    %AIExecute($0000, $000F, $0000)
    RTS                                                        ;83E405|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83E406|60      |      ;
 
 
fAreaEvents_CrossRoad:
    REP #$30                                                   ;83E407|C230    |      ;
    %UnsetFlag(daily2, $0080)
    REP #$30                                                   ;83E414|C230    |      ;
    %AIExecute($0015, $0000, $0015)
    REP #$20                                                   ;83E423|C220    |      ;
    %CheckFlag(event3, $0001)
    BNE .horseEventCheck                                       ;83E42C|D036    |83E464;
    %CheckFlag(event3, $0010)
    BNE .houseExtensionCampain                                 ;83E435|D01D    |83E454;
    REP #$30                                                   ;83E437|C230    |      ;
    %AIExecute($0000, $000A, $0001)
    REP #$20                                                   ;83E446|C220    |      ;
    %SetFlag(event3, $0010)
    RTS                                                        ;83E453|60      |      ;
 
 
.houseExtensionCampain:
    REP #$30                                                   ;83E454|C230    |      ;
    %AIExecute($0000, $000B, $000B)
    RTS                                                        ;83E463|60      |      ;
 
 
.horseEventCheck:
    SEP #$20                                                   ;83E464|E220    |      ;
    REP #$10                                                   ;83E466|C210    |      ;
    LDA.L nCurrentYearID                                       ;83E468|AF181F7F|7F1F18;
    BNE .launchHorseEvent                                      ;83E46C|D00A    |83E478;
    SEP #$20                                                   ;83E46E|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;83E470|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83E474|C903    |      ;
    BNE .justReturn                                            ;83E476|D052    |83E4CA;
 
.launchHorseEvent:
    REP #$20                                                   ;83E478|C220    |      ;
    %CheckFlag(event3, $0040)
    BNE .label2                                                ;83E481|D024    |83E4A7;
    REP #$30                                                   ;83E483|C230    |      ;
    %AIExecute($0000, $000D, $0000)
    REP #$20                                                   ;83E492|C220    |      ;
    %SetFlag(event3, $0040)
    SEP #$20                                                   ;83E49F|E220    |      ;
    LDA.B #$04                                                 ;83E4A1|A904    |      ;
    STA.W strcMenuData.nameDestinationIdx                      ;83E4A3|8D9F09  |00099F;
    RTS                                                        ;83E4A6|60      |      ;
 
 
.label2:
    REP #$30                                                   ;83E4A7|C230    |      ;
    %CheckFlag(event3, $0100)
    BNE .justReturn                                            ;83E4B0|D018    |83E4CA;
    REP #$30                                                   ;83E4B2|C230    |      ;
    %AIExecute($0000, $000D, $0001)
    SEP #$20                                                   ;83E4C1|E220    |      ;
    LDA.B #$00                                                 ;83E4C3|A900    |      ;
    STA.L nHorseAreaIdMaybe                                    ;83E4C5|8F311F7F|7F1F31;
    RTS                                                        ;83E4C9|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83E4CA|60      |      ;
 
 
fAreaEvents_Mine:
    REP #$30                                                   ;83E4CB|C230    |      ;
    %CheckFlag(event4, $0040)
    BNE +                                                      ;83E4D4|D019    |83E4EF;
    LDA.W #$00E0                                               ;83E4D6|A9E000  |      ;
    STA.W nTileInFrontOfPlayerX                                ;83E4D9|8D8509  |000985;
    LDA.W #$0180                                               ;83E4DC|A98001  |      ;
    STA.W nTileInFrontOfPlayerY                                ;83E4DF|8D8709  |000987;
    LDA.W #$0010                                               ;83E4E2|A91000  |      ;
    LDX.W #$0000                                               ;83E4E5|A20000  |      ;
    LDY.W #$001F                                               ;83E4E8|A01F00  |      ;
    JSL.L fAI_Unknown8480F8                                    ;83E4EB|22F88084|8480F8;
 
  + REP #$30                                                   ;83E4EF|C230    |      ;
    LDA.B strcPlayer.posY                                      ;83E4F1|A5D8    |0000D8;
    CMP.W #$0200                                               ;83E4F3|C90002  |      ;
    BCC .label1                                                ;83E4F6|903D    |83E535;
    %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BNE +                                                      ;83E4FF|D003    |83E504;
    JMP.W .label1                                              ;83E501|4C35E5  |83E535;
 
 
  + %UnsetPlayerFlag(!PFLAGS_DOGHUGGING)
    SEP #$20                                                   ;83E510|E220    |      ;
    LDA.L nCurrentSeasonID                                     ;83E512|AF191F7F|7F1F19;
    STA.L nDogAreaId                                           ;83E516|8F301F7F|7F1F30;
    REP #$30                                                   ;83E51A|C230    |      ;
    LDA.W #$0078                                               ;83E51C|A97800  |      ;
    STA.L nDogX                                                ;83E51F|8F2C1F7F|7F1F2C;
    LDA.W #$01A8                                               ;83E523|A9A801  |      ;
    STA.L nDogY                                                ;83E526|8F2E1F7F|7F1F2E;
    REP #$30                                                   ;83E52A|C230    |      ;
    LDA.W #$0000                                               ;83E52C|A90000  |      ;
    CLC                                                        ;83E52F|18      |      ;
    ADC.B strcPlayer.direction                                 ;83E530|65DA    |0000DA;
    STA.W strcObjectData.spriteIdx                             ;83E532|8D0109  |000901;
 
.label1:
    REP #$30                                                   ;83E535|C230    |      ;
    %CheckFlag(event5, $0010)
    BEQ +                                                      ;83E53E|F010    |83E550;
    REP #$30                                                   ;83E540|C230    |      ;
    %AIExecute($0000, $001D, $0002)
    RTS                                                        ;83E54F|60      |      ;
 
 
  + REP #$30                                                   ;83E550|C230    |      ;
    %CheckFlag(event5, $0001)
    BEQ +                                                      ;83E559|F010    |83E56B;
    REP #$30                                                   ;83E55B|C230    |      ;
    %AIExecute($0000, $001B, $0001)
    RTS                                                        ;83E56A|60      |      ;
 
 
  + SEP #$20                                                   ;83E56B|E220    |      ;
    LDA.L nCurrentWeekdayID                                    ;83E56D|AF1A1F7F|7F1F1A;
    CMP.B #!DAY_SATURDAY                                                 
    BNE .justReturn                                            ;83E573|D010    |83E585;
    REP #$30                                                   ;83E575|C230    |      ;
    %AIExecute($0000, $0002, $0004)
    RTS                                                        ;83E584|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83E585|60      |      ;
 
 
fAreaEvents_MountainTop:
    REP #$30                                                   ;83E586|C230    |      ;
    %CheckFlag(event3, $0200)
    BEQ .justReturn                                            ;83E58F|F010    |83E5A1;
    REP #$30                                                   ;83E591|C230    |      ;
    %AIExecute($0000, $0014, $0001)
    RTS                                                        ;83E5A0|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83E5A1|60      |      ;
 
 
fAreaEvents_GoldChicken:
    REP #$30                                                   ;83E5A2|C230    |      ;
    REP #$30                                                   ;83E5A4|C230    |      ;
    %AIExecute($0000, $0014, $0002)
    RTS                                                        ;83E5B3|60      |      ;
 
 
fAreaEvents_Coop:
    REP #$30                                                   ;83E5B4|C230    |      ;
    %CheckFlag(event4, $4000)
    BEQ .justReturn                                            ;83E5BD|F00D    |83E5CC;
    %AIExecute($0015, $0000, $007F)
 
.justReturn:
    RTS                                                        ;83E5CC|60      |      ;
 
 
fAreaEvents_Wedding:
    REP #$30                                                   ;83E5CD|C230    |      ;
    REP #$30                                                   ;83E5CF|C230    |      ;
    %AIExecute($0000, $001E, $0000)
    RTS                                                        ;83E5DE|60      |      ;
 
 
fAreaEvents_Festival1:
    REP #$30                                                   ;83E5DF|C230    |      ;
    REP #$30                                                   ;83E5E1|C230    |      ;
    %AIExecute($0000, $000E, $0001)
    RTS                                                        ;83E5F0|60      |      ;
 
 
fAreaEvents_Festival2:
    REP #$30                                                   ;83E5F1|C230    |      ;
    REP #$30                                                   ;83E5F3|C230    |      ;
    %AIExecute($0000, $0026, $0001)
    RTS                                                        ;83E602|60      |      ;
 
 
fAreaEvents_Festival3:
    SEP #$20                                                   ;83E603|E220    |      ;
    REP #$10                                                   ;83E605|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E607|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83E60B|C903    |      ;
    BNE .justReturn                                            ;83E60D|D022    |83E631;
    LDA.L nCurrentDay                                          ;83E60F|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83E613|C918    |      ;
    BNE .justReturn                                            ;83E615|D01A    |83E631;
    REP #$20                                                   ;83E617|C220    |      ;
    %CheckFlag(unknown1, $0001)
    BEQ .justReturn                                            ;83E620|F00F    |83E631;
    REP #$30                                                   ;83E622|C230    |      ;
    %AIExecute($0000, $000F, $0001)
 
.justReturn:
    RTS                                                        ;83E631|60      |      ;
 
 
fAreaEvents_SNF_MountainTop:
    SEP #$20                                                   ;83E632|E220    |      ;
    REP #$10                                                   ;83E634|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E636|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83E63A|C903    |      ;
    BNE .justReturn                                            ;83E63C|D022    |83E660;
    LDA.L nCurrentDay                                          ;83E63E|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83E642|C918    |      ;
    BNE .justReturn                                            ;83E644|D01A    |83E660;
    REP #$20                                                   ;83E646|C220    |      ;
    %CheckFlag(unknown1, $0008)
    BEQ .justReturn                                            ;83E64F|F00F    |83E660;
    REP #$30                                                   ;83E651|C230    |      ;
    %AIExecute($0000, $000F, $0004)
 
.justReturn:
    RTS                                                        ;83E660|60      |      ;
 
 
fAreaEvents_SNF_Spa:
    SEP #$20                                                   ;83E661|E220    |      ;
    REP #$10                                                   ;83E663|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E665|AF191F7F|7F1F19;
    CMP.B #$03                                                 ;83E669|C903    |      ;
    BNE .justReturn                                            ;83E66B|D022    |83E68F;
    LDA.L nCurrentDay                                          ;83E66D|AF1B1F7F|7F1F1B;
    CMP.B #$18                                                 ;83E671|C918    |      ;
    BNE .justReturn                                            ;83E673|D01A    |83E68F;
    REP #$20                                                   ;83E675|C220    |      ;
    %CheckFlag(unknown1, $0010)
    BEQ .justReturn                                            ;83E67E|F00F    |83E68F;
    REP #$30                                                   ;83E680|C230    |      ;
    %AIExecute($0000, $000F, $0005)
 
.justReturn:
    RTS                                                        ;83E68F|60      |      ;
 
 
fAreaEvents_MountainTopUnknown:
    SEP #$20                                                   ;83E690|E220    |      ;
    REP #$10                                                   ;83E692|C210    |      ;
    LDA.L nCurrentSeasonID                                     ;83E694|AF191F7F|7F1F19;
    BNE .justReturn                                            ;83E698|D017    |83E6B1;
    LDA.L nCurrentDay                                          ;83E69A|AF1B1F7F|7F1F1B;
    CMP.B #$01                                                 ;83E69E|C901    |      ;
    BNE .justReturn                                            ;83E6A0|D00F    |83E6B1;
    REP #$30                                                   ;83E6A2|C230    |      ;
    %AIExecute($0000, $0028, $0001)
 
.justReturn:
    RTS                                                        ;83E6B1|60      |      ;
 
 
fAreaEvents_EggFestival:
    REP #$30                                                   ;83E6B2|C230    |      ;
    REP #$30                                                   ;83E6B4|C230    |      ;
    %AIExecute($0000, $0028, $0003)
    RTS                                                        ;83E6C3|60      |      ;
 
 
fAreaEvents_Shed:
    REP #$30                                                   ;83E6C4|C230    |      ;
    %CheckFlag(event6, $0002)
    BNE .label3                                                ;83E6CD|D036    |83E705;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BNE .label1                                                ;83E6D6|D00B    |83E6E3;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BNE .label2                                                ;83E6DF|D013    |83E6F4;
    BRA .label3                                                ;83E6E1|8022    |83E705;
 
 
.label1:
    REP #$30                                                   ;83E6E3|C230    |      ;
    %AIExecute($0013, $0044, $0001)
    BRA .label3                                                ;83E6F2|8011    |83E705;
 
 
.label2:
    REP #$30                                                   ;83E6F4|C230    |      ;
    %AIExecute($0013, $0044, $0004)
    BRA .label3                                                ;83E703|8000    |83E705;
 
 
.label3:
    REP #$30                                                   ;83E705|C230    |      ;
    %CheckFlag(event6, $0004)
    BEQ +                                                      ;83E70E|F018    |83E728;
    LDA.L nFirstChildAge                                       ;83E710|AF371F7F|7F1F37;
    CMP.W #$003C                                               ;83E714|C93C00  |      ;
    BCC +                                                      ;83E717|900F    |83E728;
    REP #$30                                                   ;83E719|C230    |      ;
    %AIExecute($0014, $0045, $0002)
 
  + REP #$30                                                   ;83E728|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ .justReturn                                            ;83E731|F018    |83E74B;
    LDA.L nSecondChildAge                                      ;83E733|AF391F7F|7F1F39;
    CMP.W #$003C                                               ;83E737|C93C00  |      ;
    BCC .justReturn                                            ;83E73A|900F    |83E74B;
    REP #$30                                                   ;83E73C|C230    |      ;
    %AIExecute($0015, $0045, $0005)
 
.justReturn:
    RTS                                                        ;83E74B|60      |      ;
 
 
fAreaEvents_MountainTopBean:
    RTS                                                        ;83E74C|60      |      ;
 
 
aUnusedTable_83E74D:
    dw $0001,$0002,$0004,$0008,$0010,$0020                     ;83E74D|        |      ;
    dw $0040,$0080,$0100,$0200,$0400,$0800                     ;83E759|        |      ;
    dw $1000,$2000,$4000,$8000                                 ;83E765|        |      ;
 
fAreaEvents_Intro:
    SEP #$20                                                   ;83E76D|E220    |      ;
    REP #$10                                                   ;83E76F|C210    |      ;
    SEP #$20                                                   ;83E771|E220    |      ;
    LDA.B #$07                                                 ;83E773|A907    |      ;
    STA.L nCurrentTimeID                                       ;83E775|8F1C1F7F|7F1F1C;
    LDA.B #$00                                                 ;83E779|A900    |      ;
    STA.L nInGameHourCounter                                   ;83E77B|8F1D1F7F|7F1F1D;
    LDA.B #$00                                                 ;83E77F|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;83E781|8F1E1F7F|7F1F1E;
    REP #$20                                                   ;83E785|C220    |      ;
    STZ.W strcObjectData.exist                                 ;83E787|9C1509  |000915;
    STZ.B strcPlayer.flags                                     ;83E78A|64D2    |0000D2;
    STZ.B strcPlayer.action                                    ;83E78C|64D4    |0000D4;
    SEP #$20                                                   ;83E78E|E220    |      ;
    LDA.W strcPlayerData.stamina                               ;83E790|AD1709  |000917;
    STA.W strcPlayerData.energy                                ;83E793|8D1809  |000918;
    STZ.W strcPlayerData.lastExcercise                         ;83E796|9C2509  |000925;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;83E7B8|C230    |      ;
    LDA.W #$0000                                               ;83E7BA|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;83E7BD|8D0109  |000901;
    SEP #$20                                                   ;83E7C0|E220    |      ;
    STZ.W nTimeState                                           ;83E7C2|9C7309  |000973;
    SEP #$20                                                   ;83E7C5|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;83E7C7|9C1D09  |00091D;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;83E7D6|E220    |      ;
    LDA.L nIntroHowToPlayIndex2                                ;83E7D8|AF491F7F|7F1F49;
    BNE +                                                      ;83E7DC|D003    |83E7E1;
    JMP.W .howToPlay00                                         ;83E7DE|4CADE8  |83E8AD;
 
 
  + CMP.B #$01                                                 ;83E7E1|C901    |      ;
    BNE +                                                      ;83E7E3|D003    |83E7E8;
    JMP.W .howToPlay01                                         ;83E7E5|4CC5E8  |83E8C5;
 
 
  + CMP.B #$02                                                 ;83E7E8|C902    |      ;
    BNE +                                                      ;83E7EA|D003    |83E7EF;
    JMP.W .howToPlay02                                         ;83E7EC|4CDDE8  |83E8DD;
 
 
  + CMP.B #$03                                                 ;83E7EF|C903    |      ;
    BNE +                                                      ;83E7F1|D003    |83E7F6;
    JMP.W .howToPlay03                                         ;83E7F3|4CF5E8  |83E8F5;
 
 
  + CMP.B #$04                                                 ;83E7F6|C904    |      ;
    BNE +                                                      ;83E7F8|D003    |83E7FD;
    JMP.W .howToPlay04                                         ;83E7FA|4C0DE9  |83E90D;
 
 
  + CMP.B #$05                                                 ;83E7FD|C905    |      ;
    BNE +                                                      ;83E7FF|D003    |83E804;
    JMP.W .howToPlay05                                         ;83E801|4C25E9  |83E925;
 
 
  + CMP.B #$06                                                 ;83E804|C906    |      ;
    BNE +                                                      ;83E806|D003    |83E80B;
    JMP.W .howToPlay06                                         ;83E808|4C3DE9  |83E93D;
 
 
  + CMP.B #$07                                                 ;83E80B|C907    |      ;
    BNE +                                                      ;83E80D|D003    |83E812;
    JMP.W .howToPlay07                                         ;83E80F|4C55E9  |83E955;
 
 
  + CMP.B #$08                                                 ;83E812|C908    |      ;
    BNE +                                                      ;83E814|D003    |83E819;
    JMP.W .howToPlay08                                         ;83E816|4C8DE9  |83E98D;
 
 
  + CMP.B #$09                                                 ;83E819|C909    |      ;
    BNE +                                                      ;83E81B|D003    |83E820;
    JMP.W .howToPlay09                                         ;83E81D|4CA5E9  |83E9A5;
 
 
  + CMP.B #$0A                                                 ;83E820|C90A    |      ;
    BNE +                                                      ;83E822|D003    |83E827;
    JMP.W .howToPlay0A                                         ;83E824|4CBDE9  |83E9BD;
 
 
  + CMP.B #$0B                                                 ;83E827|C90B    |      ;
    BNE +                                                      ;83E829|D003    |83E82E;
    JMP.W .howToPlay0B                                         ;83E82B|4CD5E9  |83E9D5;
 
 
  + CMP.B #$0C                                                 ;83E82E|C90C    |      ;
    BNE +                                                      ;83E830|D003    |83E835;
    JMP.W .howToPlay0C                                         ;83E832|4CEDE9  |83E9ED;
 
 
  + CMP.B #$0D                                                 ;83E835|C90D    |      ;
    BNE +                                                      ;83E837|D003    |83E83C;
    JMP.W .howToPlay0D                                         ;83E839|4C05EA  |83EA05;
 
 
  + CMP.B #$0E                                                 ;83E83C|C90E    |      ;
    BNE +                                                      ;83E83E|D003    |83E843;
    JMP.W .howToPlay0E                                         ;83E840|4C3DEA  |83EA3D;
 
 
  + CMP.B #$0F                                                 ;83E843|C90F    |      ;
    BNE +                                                      ;83E845|D003    |83E84A;
    JMP.W .howToPlay0F                                         ;83E847|4C55EA  |83EA55;
 
 
  + CMP.B #$10                                                 ;83E84A|C910    |      ;
    BNE +                                                      ;83E84C|D003    |83E851;
    JMP.W .howToPlay10                                         ;83E84E|4C6DEA  |83EA6D;
 
 
  + CMP.B #$11                                                 ;83E851|C911    |      ;
    BNE +                                                      ;83E853|D003    |83E858;
    JMP.W .howToPlay11                                         ;83E855|4C85EA  |83EA85;
 
 
  + CMP.B #$12                                                 ;83E858|C912    |      ;
    BNE +                                                      ;83E85A|D003    |83E85F;
    JMP.W .howToPlay12                                         ;83E85C|4C9DEA  |83EA9D;
 
 
  + CMP.B #$13                                                 ;83E85F|C913    |      ;
    BNE +                                                      ;83E861|D003    |83E866;
    JMP.W .howToPlay13                                         ;83E863|4CB5EA  |83EAB5;
 
 
  + CMP.B #$14                                                 ;83E866|C914    |      ;
    BNE +                                                      ;83E868|D003    |83E86D;
    JMP.W .howToPlay14                                         ;83E86A|4CCDEA  |83EACD;
 
 
  + CMP.B #$15                                                 ;83E86D|C915    |      ;
    BNE +                                                      ;83E86F|D003    |83E874;
    JMP.W .howToPlay15                                         ;83E871|4CE5EA  |83EAE5;
 
 
  + CMP.B #$16                                                 ;83E874|C916    |      ;
    BNE +                                                      ;83E876|D003    |83E87B;
    JMP.W .howToPlay16                                         ;83E878|4CFDEA  |83EAFD;
 
 
  + CMP.B #$17                                                 ;83E87B|C917    |      ;
    BNE +                                                      ;83E87D|D003    |83E882;
    JMP.W .howToPlay17                                         ;83E87F|4C15EB  |83EB15;
 
 
  + CMP.B #$18                                                 ;83E882|C918    |      ;
    BNE +                                                      ;83E884|D003    |83E889;
    JMP.W .howToPlay18                                         ;83E886|4C2DEB  |83EB2D;
 
 
  + CMP.B #$19                                                 ;83E889|C919    |      ;
    BNE +                                                      ;83E88B|D003    |83E890;
    JMP.W .howToPlay19                                         ;83E88D|4C45EB  |83EB45;
 
 
  + CMP.B #$1A                                                 ;83E890|C91A    |      ;
    BNE +                                                      ;83E892|D003    |83E897;
    JMP.W .howToPlay1A                                         ;83E894|4C5DEB  |83EB5D;
 
 
  + CMP.B #$1B                                                 ;83E897|C91B    |      ;
    BNE +                                                      ;83E899|D003    |83E89E;
    JMP.W .howToPlay1B                                         ;83E89B|4C75EB  |83EB75;
 
 
  + CMP.B #$1C                                                 ;83E89E|C91C    |      ;
    BNE +                                                      ;83E8A0|D003    |83E8A5;
    JMP.W .howToPlay1C                                         ;83E8A2|4C8DEB  |83EB8D;
 
 
  + CMP.B #$1D                                                 ;83E8A5|C91D    |      ;
    BNE +                                                      ;83E8A7|D003    |83E8AC;
    JMP.W .howToPlay1D                                         ;83E8A9|4CA5EB  |83EBA5;
 
 
  + RTS                                                        ;83E8AC|60      |      ;
 
 
.howToPlay00:
    REP #$30                                                   ;83E8AD|C230    |      ;
    %AIExecute($0000, $0047, $0001)
    SEP #$20                                                   ;83E8BC|E220    |      ;
    LDA.B #$01                                                 ;83E8BE|A901    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E8C0|8F491F7F|7F1F49;
    RTS                                                        ;83E8C4|60      |      ;
 
 
.howToPlay01:
    REP #$30                                                   ;83E8C5|C230    |      ;
    %AIExecute($0000, $0047, $0002)
    SEP #$20                                                   ;83E8D4|E220    |      ;
    LDA.B #$02                                                 ;83E8D6|A902    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E8D8|8F491F7F|7F1F49;
    RTS                                                        ;83E8DC|60      |      ;
 
 
.howToPlay02:
    REP #$30                                                   ;83E8DD|C230    |      ;
    %AIExecute($0000, $0047, $0003)
    SEP #$20                                                   ;83E8EC|E220    |      ;
    LDA.B #$03                                                 ;83E8EE|A903    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E8F0|8F491F7F|7F1F49;
    RTS                                                        ;83E8F4|60      |      ;
 
 
.howToPlay03:
    REP #$30                                                   ;83E8F5|C230    |      ;
    %AIExecute($0000, $0047, $0004)
    SEP #$20                                                   ;83E904|E220    |      ;
    LDA.B #$04                                                 ;83E906|A904    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E908|8F491F7F|7F1F49;
    RTS                                                        ;83E90C|60      |      ;
 
 
.howToPlay04:
    REP #$30                                                   ;83E90D|C230    |      ;
    %AIExecute($0000, $0047, $0005)
    SEP #$20                                                   ;83E91C|E220    |      ;
    LDA.B #$05                                                 ;83E91E|A905    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E920|8F491F7F|7F1F49;
    RTS                                                        ;83E924|60      |      ;
 
 
.howToPlay05:
    REP #$30                                                   ;83E925|C230    |      ;
    %AIExecute($0000, $0047, $0006)
    SEP #$20                                                   ;83E934|E220    |      ;
    LDA.B #$06                                                 ;83E936|A906    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E938|8F491F7F|7F1F49;
    RTS                                                        ;83E93C|60      |      ;
 
 
.howToPlay06:
    REP #$30                                                   ;83E93D|C230    |      ;
    %AIExecute($0000, $0047, $0007)
    SEP #$20                                                   ;83E94C|E220    |      ;
    LDA.B #$07                                                 ;83E94E|A907    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E950|8F491F7F|7F1F49;
    RTS                                                        ;83E954|60      |      ;
 
 
.howToPlay07:
    SEP #$20                                                   ;83E955|E220    |      ;
    LDA.B #$3D                                                 ;83E957|A93D    |      ;
    STA.L strcShedItems.row1                                   ;83E959|8F001F7F|7F1F00;
    LDA.B #$00                                                 ;83E95D|A900    |      ;
    STA.L strcShedItems.row2                                   ;83E95F|8F011F7F|7F1F01;
    LDA.B #$12                                                 ;83E963|A912    |      ;
    STA.L strcShedItems.row3                                   ;83E965|8F021F7F|7F1F02;
    LDA.B #$00                                                 ;83E969|A900    |      ;
    STA.L strcShedItems.row4                                   ;83E96B|8F031F7F|7F1F03;
    STZ.W strcPlayerData.toolEquipped                          ;83E96F|9C2109  |000921;
    STZ.W strcPlayerData.toolSecond                            ;83E972|9C2309  |000923;
    REP #$30                                                   ;83E975|C230    |      ;
    %AIExecute($0000, $0047, $0008)
    SEP #$20                                                   ;83E984|E220    |      ;
    LDA.B #$08                                                 ;83E986|A908    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E988|8F491F7F|7F1F49;
    RTS                                                        ;83E98C|60      |      ;
 
 
.howToPlay08:
    REP #$30                                                   ;83E98D|C230    |      ;
    %AIExecute($0000, $0047, $0009)
    SEP #$20                                                   ;83E99C|E220    |      ;
    LDA.B #$09                                                 ;83E99E|A909    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E9A0|8F491F7F|7F1F49;
    RTS                                                        ;83E9A4|60      |      ;
 
 
.howToPlay09:
    REP #$30                                                   ;83E9A5|C230    |      ;
    %AIExecute($0000, $0047, $000A)
    SEP #$20                                                   ;83E9B4|E220    |      ;
    LDA.B #$0A                                                 ;83E9B6|A90A    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E9B8|8F491F7F|7F1F49;
    RTS                                                        ;83E9BC|60      |      ;
 
 
.howToPlay0A:
    REP #$30                                                   ;83E9BD|C230    |      ;
    %AIExecute($0000, $0047, $000B)
    SEP #$20                                                   ;83E9CC|E220    |      ;
    LDA.B #$0B                                                 ;83E9CE|A90B    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E9D0|8F491F7F|7F1F49;
    RTS                                                        ;83E9D4|60      |      ;
 
 
.howToPlay0B:
    REP #$30                                                   ;83E9D5|C230    |      ;
    %AIExecute($0000, $0047, $000C)
    SEP #$20                                                   ;83E9E4|E220    |      ;
    LDA.B #$0C                                                 ;83E9E6|A90C    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83E9E8|8F491F7F|7F1F49;
    RTS                                                        ;83E9EC|60      |      ;
 
 
.howToPlay0C:
    REP #$30                                                   ;83E9ED|C230    |      ;
    %AIExecute($0000, $0047, $000D)
    SEP #$20                                                   ;83E9FC|E220    |      ;
    LDA.B #$0D                                                 ;83E9FE|A90D    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA00|8F491F7F|7F1F49;
    RTS                                                        ;83EA04|60      |      ;
 
 
.howToPlay0D:
    SEP #$20                                                   ;83EA05|E220    |      ;
    LDA.B #$0D                                                 ;83EA07|A90D    |      ;
    STA.L strcShedItems.row1                                   ;83EA09|8F001F7F|7F1F00;
    LDA.B #$64                                                 ;83EA0D|A964    |      ;
    STA.L strcShedItems.row2                                   ;83EA0F|8F011F7F|7F1F01;
    LDA.B #$12                                                 ;83EA13|A912    |      ;
    STA.L strcShedItems.row3                                   ;83EA15|8F021F7F|7F1F02;
    LDA.B #$00                                                 ;83EA19|A900    |      ;
    STA.L strcShedItems.row4                                   ;83EA1B|8F031F7F|7F1F03;
    STZ.W strcPlayerData.toolEquipped                          ;83EA1F|9C2109  |000921;
    STZ.W strcPlayerData.toolSecond                            ;83EA22|9C2309  |000923;
    REP #$30                                                   ;83EA25|C230    |      ;
    %AIExecute($0000, $0047, $000E)
    SEP #$20                                                   ;83EA34|E220    |      ;
    LDA.B #$0E                                                 ;83EA36|A90E    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA38|8F491F7F|7F1F49;
    RTS                                                        ;83EA3C|60      |      ;
 
 
.howToPlay0E:
    REP #$30                                                   ;83EA3D|C230    |      ;
    %AIExecute($0000, $0047, $000F)
    SEP #$20                                                   ;83EA4C|E220    |      ;
    LDA.B #$0F                                                 ;83EA4E|A90F    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA50|8F491F7F|7F1F49;
    RTS                                                        ;83EA54|60      |      ;
 
 
.howToPlay0F:
    REP #$30                                                   ;83EA55|C230    |      ;
    %AIExecute($0000, $0047, $0010)
    SEP #$20                                                   ;83EA64|E220    |      ;
    LDA.B #$10                                                 ;83EA66|A910    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA68|8F491F7F|7F1F49;
    RTS                                                        ;83EA6C|60      |      ;
 
 
.howToPlay10:
    REP #$30                                                   ;83EA6D|C230    |      ;
    %AIExecute($0000, $0047, $0011)
    SEP #$20                                                   ;83EA7C|E220    |      ;
    LDA.B #$11                                                 ;83EA7E|A911    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA80|8F491F7F|7F1F49;
    RTS                                                        ;83EA84|60      |      ;
 
 
.howToPlay11:
    REP #$30                                                   ;83EA85|C230    |      ;
    %AIExecute($0000, $0047, $0012)
    SEP #$20                                                   ;83EA94|E220    |      ;
    LDA.B #$12                                                 ;83EA96|A912    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EA98|8F491F7F|7F1F49;
    RTS                                                        ;83EA9C|60      |      ;
 
 
.howToPlay12:
    REP #$30                                                   ;83EA9D|C230    |      ;
    %AIExecute($0000, $0047, $0013)
    SEP #$20                                                   ;83EAAC|E220    |      ;
    LDA.B #$13                                                 ;83EAAE|A913    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EAB0|8F491F7F|7F1F49;
    RTS                                                        ;83EAB4|60      |      ;
 
 
.howToPlay13:
    REP #$30                                                   ;83EAB5|C230    |      ;
    %AIExecute($0000, $0047, $0014)
    SEP #$20                                                   ;83EAC4|E220    |      ;
    LDA.B #$14                                                 ;83EAC6|A914    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EAC8|8F491F7F|7F1F49;
    RTS                                                        ;83EACC|60      |      ;
 
 
.howToPlay14:
    REP #$30                                                   ;83EACD|C230    |      ;
    %AIExecute($0000, $0047, $0015)
    SEP #$20                                                   ;83EADC|E220    |      ;
    LDA.B #$15                                                 ;83EADE|A915    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EAE0|8F491F7F|7F1F49;
    RTS                                                        ;83EAE4|60      |      ;
 
 
.howToPlay15:
    REP #$30                                                   ;83EAE5|C230    |      ;
    %AIExecute($0000, $0047, $0016)
    SEP #$20                                                   ;83EAF4|E220    |      ;
    LDA.B #$16                                                 ;83EAF6|A916    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EAF8|8F491F7F|7F1F49;
    RTS                                                        ;83EAFC|60      |      ;
 
 
.howToPlay16:
    REP #$30                                                   ;83EAFD|C230    |      ;
    %AIExecute($0000, $0047, $0017)
    SEP #$20                                                   ;83EB0C|E220    |      ;
    LDA.B #$17                                                 ;83EB0E|A917    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB10|8F491F7F|7F1F49;
    RTS                                                        ;83EB14|60      |      ;
 
 
.howToPlay17:
    REP #$30                                                   ;83EB15|C230    |      ;
    %AIExecute($0000, $0047, $0018)
    SEP #$20                                                   ;83EB24|E220    |      ;
    LDA.B #$18                                                 ;83EB26|A918    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB28|8F491F7F|7F1F49;
    RTS                                                        ;83EB2C|60      |      ;
 
 
.howToPlay18:
    REP #$30                                                   ;83EB2D|C230    |      ;
    %AIExecute($0000, $0047, $0019)
    SEP #$20                                                   ;83EB3C|E220    |      ;
    LDA.B #$19                                                 ;83EB3E|A919    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB40|8F491F7F|7F1F49;
    RTS                                                        ;83EB44|60      |      ;
 
 
.howToPlay19:
    REP #$30                                                   ;83EB45|C230    |      ;
    %AIExecute($0000, $0047, $001A)
    SEP #$20                                                   ;83EB54|E220    |      ;
    LDA.B #$1A                                                 ;83EB56|A91A    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB58|8F491F7F|7F1F49;
    RTS                                                        ;83EB5C|60      |      ;
 
 
.howToPlay1A:
    REP #$30                                                   ;83EB5D|C230    |      ;
    %AIExecute($0000, $0047, $001B)
    SEP #$20                                                   ;83EB6C|E220    |      ;
    LDA.B #$1B                                                 ;83EB6E|A91B    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB70|8F491F7F|7F1F49;
    RTS                                                        ;83EB74|60      |      ;
 
 
.howToPlay1B:
    REP #$30                                                   ;83EB75|C230    |      ;
    %AIExecute($0000, $0047, $001C)
    SEP #$20                                                   ;83EB84|E220    |      ;
    LDA.B #$1C                                                 ;83EB86|A91C    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EB88|8F491F7F|7F1F49;
    RTS                                                        ;83EB8C|60      |      ;
 
 
.howToPlay1C:
    REP #$30                                                   ;83EB8D|C230    |      ;
    %AIExecute($0000, $0047, $001D)
    SEP #$20                                                   ;83EB9C|E220    |      ;
    LDA.B #$1D                                                 ;83EB9E|A91D    |      ;
    STA.L nIntroHowToPlayIndex2                                ;83EBA0|8F491F7F|7F1F49;
    RTS                                                        ;83EBA4|60      |      ;
 
 
.howToPlay1D:
    RTS                                                        ;83EBA5|60      |      ;
 
 
fAreaEvents_Endings:
    SEP #$20                                                   ;83EBA6|E220    |      ;
    REP #$10                                                   ;83EBA8|C210    |      ;
    SEP #$20                                                   ;83EBAA|E220    |      ;
    LDA.B #$06                                                 ;83EBAC|A906    |      ;
    STA.L nCurrentTimeID                                       ;83EBAE|8F1C1F7F|7F1F1C;
    LDA.B #$00                                                 ;83EBB2|A900    |      ;
    STA.L nInGameHourCounter                                   ;83EBB4|8F1D1F7F|7F1F1D;
    LDA.B #$00                                                 ;83EBB8|A900    |      ;
    STA.L nInGameMinuteCounter                                 ;83EBBA|8F1E1F7F|7F1F1E;
    REP #$20                                                   ;83EBBE|C220    |      ;
    STZ.W strcObjectData.exist                                 ;83EBC0|9C1509  |000915;
    STZ.B strcPlayer.flags                                     ;83EBC3|64D2    |0000D2;
    STZ.B strcPlayer.action                                    ;83EBC5|64D4    |0000D4;
    SEP #$20                                                   ;83EBC7|E220    |      ;
    LDA.W strcPlayerData.stamina                               ;83EBC9|AD1709  |000917;
    STA.W strcPlayerData.energy                                ;83EBCC|8D1809  |000918;
    STZ.W strcPlayerData.lastExcercise                         ;83EBCF|9C2509  |000925;
    %SetPlayerFlag(!PFLAGS_ACTIVE)
    %SetPlayerAction(!PACTION_NONE)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    REP #$30                                                   ;83EBF1|C230    |      ;
    LDA.W #$0000                                               ;83EBF3|A90000  |      ;
    STA.W strcObjectData.spriteIdx                             ;83EBF6|8D0109  |000901;
    SEP #$20                                                   ;83EBF9|E220    |      ;
    STZ.W nTimeState                                           ;83EBFB|9C7309  |000973;
    SEP #$20                                                   ;83EBFE|E220    |      ;
    STZ.W strcPlayerData.carryItemId                           ;83EC00|9C1D09  |00091D;
    %UnsetPlayerFlag(!PFLAGS_HOLDINGITEM)
    SEP #$20                                                   ;83EC0F|E220    |      ;
    LDA.L nEndingStep                                          ;83EC11|AF471F7F|7F1F47;
    BNE +                                                      ;83EC15|D003    |83EC1A;
    JMP.W .ending00                                            ;83EC17|4C1EED  |83ED1E;
 
 
  + CMP.B #$01                                                 ;83EC1A|C901    |      ;
    BNE +                                                      ;83EC1C|D003    |83EC21;
    JMP.W .ending01                                            ;83EC1E|4C5AED  |83ED5A;
 
 
  + CMP.B #$02                                                 ;83EC21|C902    |      ;
    BNE +                                                      ;83EC23|D003    |83EC28;
    JMP.W .ending02                                            ;83EC25|4C8BED  |83ED8B;
 
 
  + CMP.B #$03                                                 ;83EC28|C903    |      ;
    BNE +                                                      ;83EC2A|D003    |83EC2F;
    JMP.W .ending03                                            ;83EC2C|4CB1ED  |83EDB1;
 
 
  + CMP.B #$04                                                 ;83EC2F|C904    |      ;
    BNE +                                                      ;83EC31|D003    |83EC36;
    JMP.W .ending04                                            ;83EC33|4CD3ED  |83EDD3;
 
 
  + CMP.B #$05                                                 ;83EC36|C905    |      ;
    BNE +                                                      ;83EC38|D003    |83EC3D;
    JMP.W .ending05                                            ;83EC3A|4CF6ED  |83EDF6;
 
 
  + CMP.B #$06                                                 ;83EC3D|C906    |      ;
    BNE +                                                      ;83EC3F|D003    |83EC44;
    JMP.W .ending06                                            ;83EC41|4C19EE  |83EE19;
 
 
  + CMP.B #$07                                                 ;83EC44|C907    |      ;
    BNE +                                                      ;83EC46|D003    |83EC4B;
    JMP.W .ending07                                            ;83EC48|4C3CEE  |83EE3C;
 
 
  + CMP.B #$08                                                 ;83EC4B|C908    |      ;
    BNE +                                                      ;83EC4D|D003    |83EC52;
    JMP.W .ending08                                            ;83EC4F|4C5FEE  |83EE5F;
 
 
  + CMP.B #$09                                                 ;83EC52|C909    |      ;
    BNE +                                                      ;83EC54|D003    |83EC59;
    JMP.W .ending09                                            ;83EC56|4C82EE  |83EE82;
 
 
  + CMP.B #$0A                                                 ;83EC59|C90A    |      ;
    BNE +                                                      ;83EC5B|D003    |83EC60;
    JMP.W .ending0A                                            ;83EC5D|4CAEEE  |83EEAE;
 
 
  + CMP.B #$0B                                                 ;83EC60|C90B    |      ;
    BNE +                                                      ;83EC62|D003    |83EC67;
    JMP.W .ending0B                                            ;83EC64|4CDAEE  |83EEDA;
 
 
  + CMP.B #$0C                                                 ;83EC67|C90C    |      ;
    BNE +                                                      ;83EC69|D003    |83EC6E;
    JMP.W .ending0C                                            ;83EC6B|4C15EF  |83EF15;
 
 
  + CMP.B #$0D                                                 ;83EC6E|C90D    |      ;
    BNE +                                                      ;83EC70|D003    |83EC75;
    JMP.W .ending0D                                            ;83EC72|4C50EF  |83EF50;
 
 
  + CMP.B #$0E                                                 ;83EC75|C90E    |      ;
    BNE +                                                      ;83EC77|D003    |83EC7C;
    JMP.W .ending0E                                            ;83EC79|4C8BEF  |83EF8B;
 
 
  + CMP.B #$0F                                                 ;83EC7C|C90F    |      ;
    BNE +                                                      ;83EC7E|D003    |83EC83;
    JMP.W .ending0F                                            ;83EC80|4CC6EF  |83EFC6;
 
 
  + CMP.B #$10                                                 ;83EC83|C910    |      ;
    BNE +                                                      ;83EC85|D003    |83EC8A;
    JMP.W .ending10                                            ;83EC87|4CE9EF  |83EFE9;
 
 
  + CMP.B #$11                                                 ;83EC8A|C911    |      ;
    BNE +                                                      ;83EC8C|D003    |83EC91;
    JMP.W .ending11                                            ;83EC8E|4C2FF0  |83F02F;
 
 
  + CMP.B #$12                                                 ;83EC91|C912    |      ;
    BNE +                                                      ;83EC93|D003    |83EC98;
    JMP.W .ending12                                            ;83EC95|4C52F0  |83F052;
 
 
  + CMP.B #$13                                                 ;83EC98|C913    |      ;
    BNE +                                                      ;83EC9A|D003    |83EC9F;
    JMP.W .ending13                                            ;83EC9C|4C75F0  |83F075;
 
 
  + CMP.B #$14                                                 ;83EC9F|C914    |      ;
    BNE +                                                      ;83ECA1|D003    |83ECA6;
    JMP.W .ending14                                            ;83ECA3|4CE3F0  |83F0E3;
 
 
  + CMP.B #$15                                                 ;83ECA6|C915    |      ;
    BNE +                                                      ;83ECA8|D003    |83ECAD;
    JMP.W .ending15                                            ;83ECAA|4C4BF1  |83F14B;
 
 
  + CMP.B #$16                                                 ;83ECAD|C916    |      ;
    BNE +                                                      ;83ECAF|D003    |83ECB4;
    JMP.W .ending16                                            ;83ECB1|4C63F1  |83F163;
 
 
  + CMP.B #$17                                                 ;83ECB4|C917    |      ;
    BNE +                                                      ;83ECB6|D003    |83ECBB;
    JMP.W .ending17                                            ;83ECB8|4C7BF1  |83F17B;
 
 
  + CMP.B #$18                                                 ;83ECBB|C918    |      ;
    BNE +                                                      ;83ECBD|D003    |83ECC2;
    JMP.W .ending18                                            ;83ECBF|4C93F1  |83F193;
 
 
  + CMP.B #$19                                                 ;83ECC2|C919    |      ;
    BNE +                                                      ;83ECC4|D003    |83ECC9;
    JMP.W .ending19                                            ;83ECC6|4CABF1  |83F1AB;
 
 
  + CMP.B #$1A                                                 ;83ECC9|C91A    |      ;
    BNE +                                                      ;83ECCB|D003    |83ECD0;
    JMP.W .ending1A                                            ;83ECCD|4CC3F1  |83F1C3;
 
 
  + CMP.B #$1B                                                 ;83ECD0|C91B    |      ;
    BNE +                                                      ;83ECD2|D003    |83ECD7;
    JMP.W .ending1B                                            ;83ECD4|4CDBF1  |83F1DB;
 
 
  + CMP.B #$1C                                                 ;83ECD7|C91C    |      ;
    BNE +                                                      ;83ECD9|D003    |83ECDE;
    JMP.W .ending1C                                            ;83ECDB|4C00F2  |83F200;
 
 
  + CMP.B #$1D                                                 ;83ECDE|C91D    |      ;
    BNE +                                                      ;83ECE0|D003    |83ECE5;
    JMP.W .ending1D                                            ;83ECE2|4C18F2  |83F218;
 
 
  + CMP.B #$1E                                                 ;83ECE5|C91E    |      ;
    BNE +                                                      ;83ECE7|D003    |83ECEC;
    JMP.W .ending1E                                            ;83ECE9|4C30F2  |83F230;
 
 
  + CMP.B #$1F                                                 ;83ECEC|C91F    |      ;
    BNE +                                                      ;83ECEE|D003    |83ECF3;
    JMP.W .ending1F                                            ;83ECF0|4C48F2  |83F248;
 
 
  + CMP.B #$20                                                 ;83ECF3|C920    |      ;
    BNE +                                                      ;83ECF5|D003    |83ECFA;
    JMP.W .ending20                                            ;83ECF7|4C6DF2  |83F26D;
 
 
  + CMP.B #$21                                                 ;83ECFA|C921    |      ;
    BNE +                                                      ;83ECFC|D003    |83ED01;
    JMP.W .ending21                                            ;83ECFE|4CFDEE  |83EEFD;
 
 
  + CMP.B #$22                                                 ;83ED01|C922    |      ;
    BNE +                                                      ;83ED03|D003    |83ED08;
    JMP.W .ending22                                            ;83ED05|4C38EF  |83EF38;
 
 
  + CMP.B #$23                                                 ;83ED08|C923    |      ;
    BNE +                                                      ;83ED0A|D003    |83ED0F;
    JMP.W .ending23                                            ;83ED0C|4C73EF  |83EF73;
 
 
  + CMP.B #$24                                                 ;83ED0F|C924    |      ;
    BNE +                                                      ;83ED11|D003    |83ED16;
    JMP.W .ending24                                            ;83ED13|4CAEEF  |83EFAE;
 
 
  + CMP.B #$25                                                 ;83ED16|C925    |      ;
    BNE +                                                      ;83ED18|D003    |83ED1D;
    JMP.W .justReturn                                          ;83ED1A|4CD7F4  |83F4D7;
 
 
  + RTS                                                        ;83ED1D|60      |      ;
 
 
.ending00:
    REP #$30                                                   ;83ED1E|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIED)
    BNE .ending01                                              ;83ED27|D031    |83ED5A;
    LDA.L nPlayerHappiness                                     ;83ED29|AF331F7F|7F1F33;
    CMP.W #$0064                                               ;83ED2D|C96400  |      ;
    BCS .ending01                                              ;83ED30|B028    |83ED5A;
    SEP #$20                                                   ;83ED32|E220    |      ;
    LDA.L nOwnedCows                                           ;83ED34|AF0A1F7F|7F1F0A;
    BNE .ending01                                              ;83ED38|D020    |83ED5A;
    SEP #$20                                                   ;83ED3A|E220    |      ;
    LDA.L nOwnedChickens                                       ;83ED3C|AF0B1F7F|7F1F0B;
    BNE .ending01                                              ;83ED40|D018    |83ED5A;
    REP #$30                                                   ;83ED42|C230    |      ;
    %AIExecute($0000, $002F, $0000)
    SEP #$20                                                   ;83ED51|E220    |      ;
    LDA.B #$14                                                 ;83ED53|A914    |      ;
    STA.L nEndingStep                                          ;83ED55|8F471F7F|7F1F47;
    RTS                                                        ;83ED59|60      |      ;
 
 
.ending01:
    REP #$20                                                   ;83ED5A|C220    |      ;
    %SetFlag(daily3, $8000)
    SEP #$20                                                   ;83ED67|E220    |      ;
    REP #$10                                                   ;83ED69|C210    |      ;
    LDA.L nOwnedCows                                           ;83ED6B|AF0A1F7F|7F1F0A;
    CMP.B #$07                                                 ;83ED6F|C907    |      ;
    BCC .ending02                                              ;83ED71|9018    |83ED8B;
    REP #$30                                                   ;83ED73|C230    |      ;
    %AIExecute($0000, $0030, $0000)
    SEP #$20                                                   ;83ED82|E220    |      ;
    LDA.B #$02                                                 ;83ED84|A902    |      ;
    STA.L nEndingStep                                          ;83ED86|8F471F7F|7F1F47;
    RTS                                                        ;83ED8A|60      |      ;
 
 
.ending02:
    SEP #$20                                                   ;83ED8B|E220    |      ;
    REP #$10                                                   ;83ED8D|C210    |      ;
    LDA.L nOwnedCows                                           ;83ED8F|AF0A1F7F|7F1F0A;
    BEQ .ending03                                              ;83ED93|F01C    |83EDB1;
    CMP.B #$07                                                 ;83ED95|C907    |      ;
    BCS .ending03                                              ;83ED97|B018    |83EDB1;
    REP #$30                                                   ;83ED99|C230    |      ;
    %AIExecute($0000, $0031, $0000)
    SEP #$20                                                   ;83EDA8|E220    |      ;
    LDA.B #$03                                                 ;83EDAA|A903    |      ;
    STA.L nEndingStep                                          ;83EDAC|8F471F7F|7F1F47;
    RTS                                                        ;83EDB0|60      |      ;
 
 
.ending03:
    SEP #$20                                                   ;83EDB1|E220    |      ;
    REP #$10                                                   ;83EDB3|C210    |      ;
    LDA.L nOwnedChickens                                       ;83EDB5|AF0B1F7F|7F1F0B;
    BEQ .ending04                                              ;83EDB9|F018    |83EDD3;
    REP #$30                                                   ;83EDBB|C230    |      ;
    %AIExecute($0000, $0032, $0000)
    SEP #$20                                                   ;83EDCA|E220    |      ;
    LDA.B #$04                                                 ;83EDCC|A904    |      ;
    STA.L nEndingStep                                          ;83EDCE|8F471F7F|7F1F47;
    RTS                                                        ;83EDD2|60      |      ;
 
 
.ending04:
    SEP #$20                                                   ;83EDD3|E220    |      ;
    REP #$10                                                   ;83EDD5|C210    |      ;
    LDA.W $09B5                                                ;83EDD7|ADB509  |0009B5;
    CMP.B #$C0                                                 ;83EDDA|C9C0    |      ;
    BCC .ending05                                              ;83EDDC|9018    |83EDF6;
    REP #$30                                                   ;83EDDE|C230    |      ;
    %AIExecute($0000, $0033, $0000)
    SEP #$20                                                   ;83EDED|E220    |      ;
    LDA.B #$05                                                 ;83EDEF|A905    |      ;
    STA.L nEndingStep                                          ;83EDF1|8F471F7F|7F1F47;
    RTS                                                        ;83EDF5|60      |      ;
 
 
.ending05:
    REP #$30                                                   ;83EDF6|C230    |      ;
    LDA.L nStatShippedCorns                                    ;83EDF8|AF4A1F7F|7F1F4A;
    CMP.W #$00C8                                               ;83EDFC|C9C800  |      ;
    BCC .ending06                                              ;83EDFF|9018    |83EE19;
    REP #$30                                                   ;83EE01|C230    |      ;
    %AIExecute($0000, $0034, $0000)
    SEP #$20                                                   ;83EE10|E220    |      ;
    LDA.B #$06                                                 ;83EE12|A906    |      ;
    STA.L nEndingStep                                          ;83EE14|8F471F7F|7F1F47;
    RTS                                                        ;83EE18|60      |      ;
 
 
.ending06:
    REP #$30                                                   ;83EE19|C230    |      ;
    LDA.L nStatShippedTomatoes                                 ;83EE1B|AF4C1F7F|7F1F4C;
    CMP.W #$00C8                                               ;83EE1F|C9C800  |      ;
    BCC .ending07                                              ;83EE22|9018    |83EE3C;
    REP #$30                                                   ;83EE24|C230    |      ;
    %AIExecute($0000, $0035, $0000)
    SEP #$20                                                   ;83EE33|E220    |      ;
    LDA.B #$07                                                 ;83EE35|A907    |      ;
    STA.L nEndingStep                                          ;83EE37|8F471F7F|7F1F47;
    RTS                                                        ;83EE3B|60      |      ;
 
 
.ending07:
    REP #$30                                                   ;83EE3C|C230    |      ;
    LDA.L nStatShippedTurnips                                  ;83EE3E|AF4E1F7F|7F1F4E;
    CMP.W #$00C8                                               ;83EE42|C9C800  |      ;
    BCC .ending08                                              ;83EE45|9018    |83EE5F;
    REP #$30                                                   ;83EE47|C230    |      ;
    %AIExecute($0000, $0037, $0000)
    SEP #$20                                                   ;83EE56|E220    |      ;
    LDA.B #$08                                                 ;83EE58|A908    |      ;
    STA.L nEndingStep                                          ;83EE5A|8F471F7F|7F1F47;
    RTS                                                        ;83EE5E|60      |      ;
 
 
.ending08:
    REP #$30                                                   ;83EE5F|C230    |      ;
    LDA.L nStatShippedPotatoes                                 ;83EE61|AF501F7F|7F1F50;
    CMP.W #$00C8                                               ;83EE65|C9C800  |      ;
    BCC .ending09                                              ;83EE68|9018    |83EE82;
    REP #$30                                                   ;83EE6A|C230    |      ;
    %AIExecute($0000, $0036, $0000)
    SEP #$20                                                   ;83EE79|E220    |      ;
    LDA.B #$09                                                 ;83EE7B|A909    |      ;
    STA.L nEndingStep                                          ;83EE7D|8F471F7F|7F1F47;
    RTS                                                        ;83EE81|60      |      ;
 
 
.ending09:
    REP #$30                                                   ;83EE82|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIED)
    BNE .ending0A                                              ;83EE8B|D021    |83EEAE;
    LDA.L nPlayerHappiness                                     ;83EE8D|AF331F7F|7F1F33;
    CMP.W #$0064                                               ;83EE91|C96400  |      ;
    BCC .ending0A                                              ;83EE94|9018    |83EEAE;
    REP #$30                                                   ;83EE96|C230    |      ;
    %AIExecute($0000, $0038, $0000)
    SEP #$20                                                   ;83EEA5|E220    |      ;
    LDA.B #$0A                                                 ;83EEA7|A90A    |      ;
    STA.L nEndingStep                                          ;83EEA9|8F471F7F|7F1F47;
    RTS                                                        ;83EEAD|60      |      ;
 
 
.ending0A:
    REP #$30                                                   ;83EEAE|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIED)
    BNE .ending0B                                              ;83EEB7|D021    |83EEDA;
    LDA.L nPlayerHappiness                                     ;83EEB9|AF331F7F|7F1F33;
    CMP.W #$0320                                               ;83EEBD|C92003  |      ;
    BCC .ending0B                                              ;83EEC0|9018    |83EEDA;
    REP #$30                                                   ;83EEC2|C230    |      ;
    %AIExecute($0000, $0039, $0000)
    SEP #$20                                                   ;83EED1|E220    |      ;
    LDA.B #$0B                                                 ;83EED3|A90B    |      ;
    STA.L nEndingStep                                          ;83EED5|8F471F7F|7F1F47;
    RTS                                                        ;83EED9|60      |      ;
 
 
.ending0B:
    REP #$30                                                   ;83EEDA|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDMARIA)
    BEQ .ending0C                                              ;83EEE3|F030    |83EF15;
    REP #$30                                                   ;83EEE5|C230    |      ;
    %AIExecute($0000, $003A, $0000)
    SEP #$20                                                   ;83EEF4|E220    |      ;
    LDA.B #$21                                                 ;83EEF6|A921    |      ;
    STA.L nEndingStep                                          ;83EEF8|8F471F7F|7F1F47;
    RTS                                                        ;83EEFC|60      |      ;
 
 
.ending21:
    REP #$30                                                   ;83EEFD|C230    |      ;
    %AIExecute($0000, $003A, $0001)
    SEP #$20                                                   ;83EF0C|E220    |      ;
    LDA.B #$0C                                                 ;83EF0E|A90C    |      ;
    STA.L nEndingStep                                          ;83EF10|8F471F7F|7F1F47;
    RTS                                                        ;83EF14|60      |      ;
 
 
.ending0C:
    REP #$30                                                   ;83EF15|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDANN)
    BEQ .ending0D                                              ;83EF1E|F030    |83EF50;
    REP #$30                                                   ;83EF20|C230    |      ;
    %AIExecute($0000, $003B, $0000)
    SEP #$20                                                   ;83EF2F|E220    |      ;
    LDA.B #$22                                                 ;83EF31|A922    |      ;
    STA.L nEndingStep                                          ;83EF33|8F471F7F|7F1F47;
    RTS                                                        ;83EF37|60      |      ;
 
 
.ending22:
    REP #$30                                                   ;83EF38|C230    |      ;
    %AIExecute($0000, $003B, $0001)
    SEP #$20                                                   ;83EF47|E220    |      ;
    LDA.B #$0D                                                 ;83EF49|A90D    |      ;
    STA.L nEndingStep                                          ;83EF4B|8F471F7F|7F1F47;
    RTS                                                        ;83EF4F|60      |      ;
 
 
.ending0D:
    REP #$30                                                   ;83EF50|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDNINA)
    BEQ .ending0E                                              ;83EF59|F030    |83EF8B;
    REP #$30                                                   ;83EF5B|C230    |      ;
    %AIExecute($0000, $003C, $0000)
    SEP #$20                                                   ;83EF6A|E220    |      ;
    LDA.B #$23                                                 ;83EF6C|A923    |      ;
    STA.L nEndingStep                                          ;83EF6E|8F471F7F|7F1F47;
    RTS                                                        ;83EF72|60      |      ;
 
 
.ending23:
    REP #$30                                                   ;83EF73|C230    |      ;
    %AIExecute($0000, $003C, $0001)
    SEP #$20                                                   ;83EF82|E220    |      ;
    LDA.B #$0E                                                 ;83EF84|A90E    |      ;
    STA.L nEndingStep                                          ;83EF86|8F471F7F|7F1F47;
    RTS                                                        ;83EF8A|60      |      ;
 
 
.ending0E:
    REP #$30                                                   ;83EF8B|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDELLEN)
    BEQ .ending0F                                              ;83EF94|F030    |83EFC6;
    REP #$30                                                   ;83EF96|C230    |      ;
    %AIExecute($0000, $003D, $0000)
    SEP #$20                                                   ;83EFA5|E220    |      ;
    LDA.B #$24                                                 ;83EFA7|A924    |      ;
    STA.L nEndingStep                                          ;83EFA9|8F471F7F|7F1F47;
    RTS                                                        ;83EFAD|60      |      ;
 
 
.ending24:
    REP #$30                                                   ;83EFAE|C230    |      ;
    %AIExecute($0000, $003D, $0001)
    SEP #$20                                                   ;83EFBD|E220    |      ;
    LDA.B #$0F                                                 ;83EFBF|A90F    |      ;
    STA.L nEndingStep                                          ;83EFC1|8F471F7F|7F1F47;
    RTS                                                        ;83EFC5|60      |      ;
 
 
.ending0F:
    REP #$30                                                   ;83EFC6|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIEDEVE)
    BEQ .ending10                                              ;83EFCF|F018    |83EFE9;
    REP #$30                                                   ;83EFD1|C230    |      ;
    %AIExecute($0000, $003E, $0000)
    SEP #$20                                                   ;83EFE0|E220    |      ;
    LDA.B #$10                                                 ;83EFE2|A910    |      ;
    STA.L nEndingStep                                          ;83EFE4|8F471F7F|7F1F47;
    RTS                                                        ;83EFE8|60      |      ;
 
 
.ending10:
    REP #$30                                                   ;83EFE9|C230    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIED)
    BNE .ending11                                              ;83EFF2|D03B    |83F02F;
    LDA.L nPlayerHappiness                                     ;83EFF4|AF331F7F|7F1F33;
    CMP.W #$00C8                                               ;83EFF8|C9C800  |      ;
    BCC .ending11                                              ;83EFFB|9032    |83F02F;
    LDA.L nLove_Maria                                          ;83EFFD|AF1F1F7F|7F1F1F;
    CLC                                                        ;83F001|18      |      ;
    ADC.L nLove_Ann                                            ;83F002|6F211F7F|7F1F21;
    ADC.L nLove_Nina                                           ;83F006|6F231F7F|7F1F23;
    ADC.L nLove_Ellen                                          ;83F00A|6F251F7F|7F1F25;
    ADC.L nLove_Eve                                            ;83F00E|6F271F7F|7F1F27;
    CMP.W #$05DC                                               ;83F012|C9DC05  |      ;
    BCC .ending11                                              ;83F015|9018    |83F02F;
    REP #$30                                                   ;83F017|C230    |      ;
    %AIExecute($0000, $003F, $0000)
    SEP #$20                                                   ;83F026|E220    |      ;
    LDA.B #$11                                                 ;83F028|A911    |      ;
    STA.L nEndingStep                                          ;83F02A|8F471F7F|7F1F47;
    RTS                                                        ;83F02E|60      |      ;
 
 
.ending11:
    REP #$30                                                   ;83F02F|C230    |      ;
    %CheckFlag(event6, $000C)
    BEQ .ending12                                              ;83F038|F018    |83F052;
    REP #$30                                                   ;83F03A|C230    |      ;
    %AIExecute($0000, $0040, $0000)
    SEP #$20                                                   ;83F049|E220    |      ;
    LDA.B #$12                                                 ;83F04B|A912    |      ;
    STA.L nEndingStep                                          ;83F04D|8F471F7F|7F1F47;
    RTS                                                        ;83F051|60      |      ;
 
 
.ending12:
    REP #$30                                                   ;83F052|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ .ending13                                              ;83F05B|F018    |83F075;
    REP #$30                                                   ;83F05D|C230    |      ;
    %AIExecute($0000, $0041, $0000)
    SEP #$20                                                   ;83F06C|E220    |      ;
    LDA.B #$13                                                 ;83F06E|A913    |      ;
    STA.L nEndingStep                                          ;83F070|8F471F7F|7F1F47;
    RTS                                                        ;83F074|60      |      ;
 
 
.ending13:
    REP #$30                                                   ;83F075|C230    |      ;
    %CheckFlag(event6, $0008)
    BEQ .ending14                                              ;83F07E|F063    |83F0E3;
    LDA.L nPlayerHappiness                                     ;83F080|AF331F7F|7F1F33;
    CMP.W #$0384                                               ;83F084|C98403  |      ;
    BCC .ending14                                              ;83F087|905A    |83F0E3;
    SEP #$20                                                   ;83F089|E220    |      ;
    LDA.L nOwnedCows                                           ;83F08B|AF0A1F7F|7F1F0A;
    BEQ .ending14                                              ;83F08F|F052    |83F0E3;
    LDA.L nOwnedChickens                                       ;83F091|AF0B1F7F|7F1F0B;
    BEQ .ending14                                              ;83F095|F04C    |83F0E3;
    LDA.L nPowerBerryEaten                                     ;83F097|AF361F7F|7F1F36;
    CMP.B #$0A                                                 ;83F09B|C90A    |      ;
    BNE .ending14                                              ;83F09D|D044    |83F0E3;
    REP #$20                                                   ;83F09F|C220    |      ;
    LDA.L nMoney                                               ;83F0A1|AF041F7F|7F1F04;
    CLC                                                        ;83F0A5|18      |      ;
    ADC.W #$FC18                                               ;83F0A6|6918FC  |      ;
    SEP #$20                                                   ;83F0A9|E220    |      ;
    LDA.L nMoney+2                                             ;83F0AB|AF061F7F|7F1F06;
    ADC.B #$FF                                                 ;83F0AF|69FF    |      ;
    BMI .ending14                                              ;83F0B1|3030    |83F0E3;
    REP #$20                                                   ;83F0B3|C220    |      ;
    LDA.L nDogHugs                                             ;83F0B5|AF521F7F|7F1F52;
    CMP.W #$0064                                               ;83F0B9|C96400  |      ;
    BCC .ending14                                              ;83F0BC|9025    |83F0E3;
    REP #$30                                                   ;83F0BE|C230    |      ;
    %AIExecute($0000, $0042, $0000)
    SEP #$20                                                   ;83F0CD|E220    |      ;
    LDA.B #$14                                                 ;83F0CF|A914    |      ;
    STA.L nEndingStep                                          ;83F0D1|8F471F7F|7F1F47;
    REP #$20                                                   ;83F0D5|C220    |      ;
    %UnsetFlag(daily3, $8000)
    RTS                                                        ;83F0E2|60      |      ;
 
 
.ending14:
    REP #$30                                                   ;83F0E3|C230    |      ;
    LDA.L nLove_Maria                                          ;83F0E5|AF1F1F7F|7F1F1F;
    STA.W $09B3                                                ;83F0E9|8DB309  |0009B3;
    CMP.L nLove_Ann                                            ;83F0EC|CF211F7F|7F1F21;
    BCS +                                                      ;83F0F0|B007    |83F0F9;
    LDA.L nLove_Ann                                            ;83F0F2|AF211F7F|7F1F21;
    STA.W $09B3                                                ;83F0F6|8DB309  |0009B3;
 
  + REP #$30                                                   ;83F0F9|C230    |      ;
    CMP.L nLove_Nina                                           ;83F0FB|CF231F7F|7F1F23;
    BCS +                                                      ;83F0FF|B007    |83F108;
    LDA.L nLove_Nina                                           ;83F101|AF231F7F|7F1F23;
    STA.W $09B3                                                ;83F105|8DB309  |0009B3;
 
  + REP #$30                                                   ;83F108|C230    |      ;
    CMP.L nLove_Ellen                                          ;83F10A|CF251F7F|7F1F25;
    BCS +                                                      ;83F10E|B007    |83F117;
    LDA.L nLove_Ellen                                          ;83F110|AF251F7F|7F1F25;
    STA.W $09B3                                                ;83F114|8DB309  |0009B3;
 
  + REP #$30                                                   ;83F117|C230    |      ;
    CMP.L nLove_Eve                                            ;83F119|CF271F7F|7F1F27;
    BCS +                                                      ;83F11D|B007    |83F126;
    LDA.L nLove_Eve                                            ;83F11F|AF271F7F|7F1F27;
    STA.W $09B3                                                ;83F123|8DB309  |0009B3;
 
  + REP #$30                                                   ;83F126|C230    |      ;
    %AIExecute($0000, $0046, $0000)
    SEP #$20                                                   ;83F135|E220    |      ;
    LDA.B #$15                                                 ;83F137|A915    |      ;
    STA.L nEndingStep                                          ;83F139|8F471F7F|7F1F47;
    REP #$20                                                   ;83F13D|C220    |      ;
    %SetFlag(daily3, $8000)
    RTS                                                        ;83F14A|60      |      ;
 
 
.ending15:
    REP #$30                                                   ;83F14B|C230    |      ;
    %AIExecute($0000, $0046, $0001)
    SEP #$20                                                   ;83F15A|E220    |      ;
    LDA.B #$16                                                 ;83F15C|A916    |      ;
    STA.L nEndingStep                                          ;83F15E|8F471F7F|7F1F47;
    RTS                                                        ;83F162|60      |      ;
 
 
.ending16:
    REP #$30                                                   ;83F163|C230    |      ;
    %AIExecute($0000, $0046, $0002)
    SEP #$20                                                   ;83F172|E220    |      ;
    LDA.B #$17                                                 ;83F174|A917    |      ;
    STA.L nEndingStep                                          ;83F176|8F471F7F|7F1F47;
    RTS                                                        ;83F17A|60      |      ;
 
 
.ending17:
    REP #$30                                                   ;83F17B|C230    |      ;
    %AIExecute($0000, $0046, $0003)
    SEP #$20                                                   ;83F18A|E220    |      ;
    LDA.B #$18                                                 ;83F18C|A918    |      ;
    STA.L nEndingStep                                          ;83F18E|8F471F7F|7F1F47;
    RTS                                                        ;83F192|60      |      ;
 
 
.ending18:
    REP #$30                                                   ;83F193|C230    |      ;
    %AIExecute($0000, $0046, $0004)
    SEP #$20                                                   ;83F1A2|E220    |      ;
    LDA.B #$19                                                 ;83F1A4|A919    |      ;
    STA.L nEndingStep                                          ;83F1A6|8F471F7F|7F1F47;
    RTS                                                        ;83F1AA|60      |      ;
 
 
.ending19:
    REP #$30                                                   ;83F1AB|C230    |      ;
    %AIExecute($0000, $0046, $0005)
    SEP #$20                                                   ;83F1BA|E220    |      ;
    LDA.B #$1A                                                 ;83F1BC|A91A    |      ;
    STA.L nEndingStep                                          ;83F1BE|8F471F7F|7F1F47;
    RTS                                                        ;83F1C2|60      |      ;
 
 
.ending1A:
    REP #$30                                                   ;83F1C3|C230    |      ;
    %AIExecute($0000, $0046, $0006)
    SEP #$20                                                   ;83F1D2|E220    |      ;
    LDA.B #$1B                                                 ;83F1D4|A91B    |      ;
    STA.L nEndingStep                                          ;83F1D6|8F471F7F|7F1F47;
    RTS                                                        ;83F1DA|60      |      ;
 
 
.ending1B:
    REP #$30                                                   ;83F1DB|C230    |      ;
    %AIExecute($0000, $0046, $0007)
    SEP #$20                                                   ;83F1EA|E220    |      ;
    LDA.B #$20                                                 ;83F1EC|A920    |      ;
    STA.L nEndingStep                                          ;83F1EE|8F471F7F|7F1F47;
    REP #$20                                                   ;83F1F2|C220    |      ;
    %UnsetFlag(daily3, $8000)
    RTS                                                        ;83F1FF|60      |      ;
 
 
.ending1C:
    REP #$30                                                   ;83F200|C230    |      ;
    %AIExecute($0000, $0046, $0008)
    SEP #$20                                                   ;83F20F|E220    |      ;
    LDA.B #$1D                                                 ;83F211|A91D    |      ;
    STA.L nEndingStep                                          ;83F213|8F471F7F|7F1F47;
    RTS                                                        ;83F217|60      |      ;
 
 
.ending1D:
    REP #$30                                                   ;83F218|C230    |      ;
    %AIExecute($0000, $0046, $0009)
    SEP #$20                                                   ;83F227|E220    |      ;
    LDA.B #$1E                                                 ;83F229|A91E    |      ;
    STA.L nEndingStep                                          ;83F22B|8F471F7F|7F1F47;
    RTS                                                        ;83F22F|60      |      ;
 
 
.ending1E:
    REP #$30                                                   ;83F230|C230    |      ;
    %AIExecute($0000, $0046, $000A)
    SEP #$20                                                   ;83F23F|E220    |      ;
    LDA.B #$1F                                                 ;83F241|A91F    |      ;
    STA.L nEndingStep                                          ;83F243|8F471F7F|7F1F47;
    RTS                                                        ;83F247|60      |      ;
 
 
.ending1F:
    REP #$30                                                   ;83F248|C230    |      ;
    %AIExecute($0000, $0046, $000B)
    SEP #$20                                                   ;83F257|E220    |      ;
    LDA.B #$20                                                 ;83F259|A920    |      ;
    STA.L nEndingStep                                          ;83F25B|8F471F7F|7F1F47;
    REP #$20                                                   ;83F25F|C220    |      ;
    %UnsetFlag(daily3, $8000)
    RTS                                                        ;83F26C|60      |      ;
 
 
.ending20:
    REP #$20                                                   ;83F26D|C220    |      ;
    LDA.W #$0000                                               ;83F26F|A90000  |      ;
    STA.L nRanchMasteringRate                                  ;83F272|8F541F7F|7F1F54;
    LDA.L nMoney                                               ;83F276|AF041F7F|7F1F04;
    LSR A                                                      ;83F27A|4A      |      ;
    LSR A                                                      ;83F27B|4A      |      ;
    LSR A                                                      ;83F27C|4A      |      ;
    LSR A                                                      ;83F27D|4A      |      ;
    LSR A                                                      ;83F27E|4A      |      ;
    LSR A                                                      ;83F27F|4A      |      ;
    LSR A                                                      ;83F280|4A      |      ;
    CMP.W #$004E                                               ;83F281|C94E00  |      ;
    BCC +                                                      ;83F284|9003    |83F289;
    LDA.W #$004E                                               ;83F286|A94E00  |      ;
 
  + STA.L nRanchMasteringRate                                  ;83F289|8F541F7F|7F1F54;
    SEP #$20                                                   ;83F28D|E220    |      ;
    LDA.B #$00                                                 ;83F28F|A900    |      ;
    XBA                                                        ;83F291|EB      |      ;
    LDA.L nOwnedCows                                           ;83F292|AF0A1F7F|7F1F0A;
    ASL A                                                      ;83F296|0A      |      ;
    CLC                                                        ;83F297|18      |      ;
    ADC.L nOwnedCows                                           ;83F298|6F0A1F7F|7F1F0A;
    REP #$20                                                   ;83F29C|C220    |      ;
    ADC.L nRanchMasteringRate                                  ;83F29E|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F2A2|8F541F7F|7F1F54;
    SEP #$20                                                   ;83F2A6|E220    |      ;
    LDA.B #$00                                                 ;83F2A8|A900    |      ;
    XBA                                                        ;83F2AA|EB      |      ;
    LDA.L nOwnedChickens                                       ;83F2AB|AF0B1F7F|7F1F0B;
    ASL A                                                      ;83F2AF|0A      |      ;
    CLC                                                        ;83F2B0|18      |      ;
    ADC.L nOwnedChickens                                       ;83F2B1|6F0B1F7F|7F1F0B;
    REP #$20                                                   ;83F2B5|C220    |      ;
    ADC.L nRanchMasteringRate                                  ;83F2B7|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F2BB|8F541F7F|7F1F54;
    SEP #$20                                                   ;83F2BF|E220    |      ;
    LDA.B #$00                                                 ;83F2C1|A900    |      ;
    XBA                                                        ;83F2C3|EB      |      ;
    LDA.W strcPlayerData.stamina                               ;83F2C4|AD1709  |000917;
    SEC                                                        ;83F2C7|38      |      ;
    SBC.B #$64                                                 ;83F2C8|E964    |      ;
    LSR A                                                      ;83F2CA|4A      |      ;
    REP #$20                                                   ;83F2CB|C220    |      ;
    CLC                                                        ;83F2CD|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F2CE|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F2D2|8F541F7F|7F1F54;
    REP #$20                                                   ;83F2D6|C220    |      ;
    LDA.L nLove_Maria                                          ;83F2D8|AF1F1F7F|7F1F1F;
    AND.W #$01FF                                               ;83F2DC|29FF01  |      ;
    LSR A                                                      ;83F2DF|4A      |      ;
    LSR A                                                      ;83F2E0|4A      |      ;
    LSR A                                                      ;83F2E1|4A      |      ;
    LSR A                                                      ;83F2E2|4A      |      ;
    CLC                                                        ;83F2E3|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F2E4|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F2E8|8F541F7F|7F1F54;
    REP #$20                                                   ;83F2EC|C220    |      ;
    LDA.L nLove_Ann                                            ;83F2EE|AF211F7F|7F1F21;
    AND.W #$01FF                                               ;83F2F2|29FF01  |      ;
    LSR A                                                      ;83F2F5|4A      |      ;
    LSR A                                                      ;83F2F6|4A      |      ;
    LSR A                                                      ;83F2F7|4A      |      ;
    LSR A                                                      ;83F2F8|4A      |      ;
    CLC                                                        ;83F2F9|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F2FA|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F2FE|8F541F7F|7F1F54;
    REP #$20                                                   ;83F302|C220    |      ;
    LDA.L nLove_Nina                                           ;83F304|AF231F7F|7F1F23;
    AND.W #$01FF                                               ;83F308|29FF01  |      ;
    LSR A                                                      ;83F30B|4A      |      ;
    LSR A                                                      ;83F30C|4A      |      ;
    LSR A                                                      ;83F30D|4A      |      ;
    LSR A                                                      ;83F30E|4A      |      ;
    CLC                                                        ;83F30F|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F310|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F314|8F541F7F|7F1F54;
    REP #$20                                                   ;83F318|C220    |      ;
    LDA.L nLove_Ellen                                          ;83F31A|AF251F7F|7F1F25;
    AND.W #$01FF                                               ;83F31E|29FF01  |      ;
    LSR A                                                      ;83F321|4A      |      ;
    LSR A                                                      ;83F322|4A      |      ;
    LSR A                                                      ;83F323|4A      |      ;
    LSR A                                                      ;83F324|4A      |      ;
    CLC                                                        ;83F325|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F326|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F32A|8F541F7F|7F1F54;
    REP #$20                                                   ;83F32E|C220    |      ;
    LDA.L nLove_Eve                                            ;83F330|AF271F7F|7F1F27;
    AND.W #$01FF                                               ;83F334|29FF01  |      ;
    LSR A                                                      ;83F337|4A      |      ;
    LSR A                                                      ;83F338|4A      |      ;
    LSR A                                                      ;83F339|4A      |      ;
    LSR A                                                      ;83F33A|4A      |      ;
    CLC                                                        ;83F33B|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F33C|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F340|8F541F7F|7F1F54;
    REP #$20                                                   ;83F344|C220    |      ;
    LDA.L nStatShippedTomatoes                                 ;83F346|AF4C1F7F|7F1F4C;
    AND.W #$01FF                                               ;83F34A|29FF01  |      ;
    LSR A                                                      ;83F34D|4A      |      ;
    LSR A                                                      ;83F34E|4A      |      ;
    LSR A                                                      ;83F34F|4A      |      ;
    LSR A                                                      ;83F350|4A      |      ;
    CLC                                                        ;83F351|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F352|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F356|8F541F7F|7F1F54;
    REP #$20                                                   ;83F35A|C220    |      ;
    LDA.L nStatShippedCorns                                    ;83F35C|AF4A1F7F|7F1F4A;
    AND.W #$01FF                                               ;83F360|29FF01  |      ;
    LSR A                                                      ;83F363|4A      |      ;
    LSR A                                                      ;83F364|4A      |      ;
    LSR A                                                      ;83F365|4A      |      ;
    LSR A                                                      ;83F366|4A      |      ;
    CLC                                                        ;83F367|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F368|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F36C|8F541F7F|7F1F54;
    REP #$20                                                   ;83F370|C220    |      ;
    LDA.L nStatShippedPotatoes                                 ;83F372|AF501F7F|7F1F50;
    AND.W #$01FF                                               ;83F376|29FF01  |      ;
    LSR A                                                      ;83F379|4A      |      ;
    LSR A                                                      ;83F37A|4A      |      ;
    LSR A                                                      ;83F37B|4A      |      ;
    LSR A                                                      ;83F37C|4A      |      ;
    CLC                                                        ;83F37D|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F37E|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F382|8F541F7F|7F1F54;
    REP #$20                                                   ;83F386|C220    |      ;
    LDA.L nStatShippedTurnips                                  ;83F388|AF4E1F7F|7F1F4E;
    AND.W #$01FF                                               ;83F38C|29FF01  |      ;
    LSR A                                                      ;83F38F|4A      |      ;
    LSR A                                                      ;83F390|4A      |      ;
    LSR A                                                      ;83F391|4A      |      ;
    LSR A                                                      ;83F392|4A      |      ;
    CLC                                                        ;83F393|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F394|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F398|8F541F7F|7F1F54;
    REP #$20                                                   ;83F39C|C220    |      ;
    LDA.L nPlayerHappiness                                     ;83F39E|AF331F7F|7F1F33;
    LSR A                                                      ;83F3A2|4A      |      ;
    LSR A                                                      ;83F3A3|4A      |      ;
    LSR A                                                      ;83F3A4|4A      |      ;
    LSR A                                                      ;83F3A5|4A      |      ;
    LSR A                                                      ;83F3A6|4A      |      ;
    CLC                                                        ;83F3A7|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F3A8|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F3AC|8F541F7F|7F1F54;
    REP #$20                                                   ;83F3B0|C220    |      ;
    %CheckFlag(event1, $0080)
    BEQ +                                                      ;83F3B9|F00C    |83F3C7;
    LDA.L nRanchMasteringRate                                  ;83F3BB|AF541F7F|7F1F54;
    CLC                                                        ;83F3BF|18      |      ;
    ADC.W #$0010                                               ;83F3C0|691000  |      ;
    STA.L nRanchMasteringRate                                  ;83F3C3|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F3C7|C220    |      ;
    %CheckFlag(event1, $0040)
    BEQ +                                                      ;83F3D0|F00C    |83F3DE;
    LDA.L nRanchMasteringRate                                  ;83F3D2|AF541F7F|7F1F54;
    CLC                                                        ;83F3D6|18      |      ;
    ADC.W #$0010                                               ;83F3D7|691000  |      ;
    STA.L nRanchMasteringRate                                  ;83F3DA|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F3DE|C220    |      ;
    %CheckFlag(event6, $0008)
    BEQ +                                                      ;83F3E7|F00C    |83F3F5;
    LDA.L nRanchMasteringRate                                  ;83F3E9|AF541F7F|7F1F54;
    CLC                                                        ;83F3ED|18      |      ;
    ADC.W #$0010                                               ;83F3EE|691000  |      ;
    STA.L nRanchMasteringRate                                  ;83F3F1|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F3F5|C220    |      ;
    %CheckFlag(event6, $0004)
    BEQ +                                                      ;83F3FE|F00C    |83F40C;
    LDA.L nRanchMasteringRate                                  ;83F400|AF541F7F|7F1F54;
    CLC                                                        ;83F404|18      |      ;
    ADC.W #$0010                                               ;83F405|691000  |      ;
    STA.L nRanchMasteringRate                                  ;83F408|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F40C|C220    |      ;
    %CheckFlag(event2, !EFLAGS2_MARRIED)
    BEQ +                                                      ;83F415|F00C    |83F423;
    LDA.L nRanchMasteringRate                                  ;83F417|AF541F7F|7F1F54;
    CLC                                                        ;83F41B|18      |      ;
    ADC.W #$0020                                               ;83F41C|692000  |      ;
    STA.L nRanchMasteringRate                                  ;83F41F|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F423|C220    |      ;
    %CheckFlag(event6, $4000)
    BEQ +                                                      ;83F42C|F00C    |83F43A;
    LDA.L nRanchMasteringRate                                  ;83F42E|AF541F7F|7F1F54;
    CLC                                                        ;83F432|18      |      ;
    ADC.W #$0016                                               ;83F433|691600  |      ;
    STA.L nRanchMasteringRate                                  ;83F436|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F43A|C220    |      ;
    %CheckFlag(event5, $1000)
    BEQ +                                                      ;83F443|F00C    |83F451;
    LDA.L nRanchMasteringRate                                  ;83F445|AF541F7F|7F1F54;
    CLC                                                        ;83F449|18      |      ;
    ADC.W #$0015                                               ;83F44A|691500  |      ;
    STA.L nRanchMasteringRate                                  ;83F44D|8F541F7F|7F1F54;
 
  + REP #$20                                                   ;83F451|C220    |      ;
    LDA.L nRanchDevelopmentRate                                ;83F453|AF561F7F|7F1F56;
    LSR A                                                      ;83F457|4A      |      ;
    CLC                                                        ;83F458|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F459|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F45D|8F541F7F|7F1F54;
    REP #$20                                                   ;83F461|C220    |      ;
    LDX.W #$0000                                               ;83F463|A20000  |      ;
 
  - REP #$30                                                   ;83F466|C230    |      ;
    PHX                                                        ;83F468|DA      |      ;
    TXA                                                        ;83F469|8A      |      ;
    JSL.L fGameEngine_GetCowData                               ;83F46A|22A7C983|83C9A7;
    SEP #$20                                                   ;83F46E|E220    |      ;
    REP #$10                                                   ;83F470|C210    |      ;
    LDY.W #$0000                                               ;83F472|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F475|B772    |000072;
    AND.B #$01                                                 ;83F477|2901    |      ;
    BEQ ++                                                     ;83F479|F01C    |83F497;
    LDY.W #$0004                                               ;83F47B|A00400  |      ;
    LDA.B #$00                                                 ;83F47E|A900    |      ;
    XBA                                                        ;83F480|EB      |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F481|B772    |000072;
    LSR A                                                      ;83F483|4A      |      ;
    LSR A                                                      ;83F484|4A      |      ;
    LSR A                                                      ;83F485|4A      |      ;
    CMP.B #$19                                                 ;83F486|C919    |      ;
    BCC +                                                      ;83F488|9002    |83F48C;
    LDA.B #$19                                                 ;83F48A|A919    |      ;
 
  + REP #$20                                                   ;83F48C|C220    |      ;
    CLC                                                        ;83F48E|18      |      ;
    ADC.L nRanchMasteringRate                                  ;83F48F|6F541F7F|7F1F54;
    STA.L nRanchMasteringRate                                  ;83F493|8F541F7F|7F1F54;
 
 ++ REP #$30                                                   ;83F497|C230    |      ;
    PLX                                                        ;83F499|FA      |      ;
    INX                                                        ;83F49A|E8      |      ;
    CPX.W #$000C                                               ;83F49B|E00C00  |      ;
    BNE -                                                      ;83F49E|D0C6    |83F466;
    REP #$20                                                   ;83F4A0|C220    |      ;
    LDA.L nRanchMasteringRate                                  ;83F4A2|AF541F7F|7F1F54;
    CMP.W #$03E7                                               ;83F4A6|C9E703  |      ;
    BCC +                                                      ;83F4A9|9007    |83F4B2;
    LDA.W #$03E7                                               ;83F4AB|A9E703  |      ;
    STA.L nRanchMasteringRate                                  ;83F4AE|8F541F7F|7F1F54;
 
  + REP #$30                                                   ;83F4B2|C230    |      ;
    %AIExecute($0000, $0046, $000C)
    SEP #$20                                                   ;83F4C1|E220    |      ;
    LDA.B #$25                                                 ;83F4C3|A925    |      ;
    STA.L nEndingStep                                          ;83F4C5|8F471F7F|7F1F47;
    REP #$20                                                   ;83F4C9|C220    |      ;
    %SetFlag(daily3, $8000)
    RTS                                                        ;83F4D6|60      |      ;
 
 
.justReturn:
    RTS                                                        ;83F4D7|60      |      ;
 
 
fAreaInit_HouseHelper:
    REP #$30                                                   ;83F4D8|C230    |      ;
    %AIExecute($0000, $002E, $0000)
    REP #$30                                                   ;83F4E7|C230    |      ;
    STZ.W strcDialogDisplay.mapFlags                           ;83F4E9|9C9601  |000196;
    %SetFlag(daily3, $0002)
    SEP #$20                                                   ;83F4F7|E220    |      ;
    LDA.B #$00                                                 ;83F4F9|A900    |      ;
    STA.L nEndingStep                                          ;83F4FB|8F471F7F|7F1F47;
    SEP #$20                                                   ;83F4FF|E220    |      ;
    REP #$10                                                   ;83F501|C210    |      ;
    STZ.W $09B5                                                ;83F503|9CB509  |0009B5;
    REP #$20                                                   ;83F506|C220    |      ;
    LDA.W #!DIALOG_SPACE                                               
    STA.W strcNames.wCurrentCow                                ;83F50B|8D8908  |000889;
    STA.W strcNames.wCurrentCow+2                              ;83F50E|8D8B08  |00088B;
    STA.W strcNames.wCurrentCow+4                              ;83F511|8D8D08  |00088D;
    STA.W strcNames.wCurrentCow+6                              ;83F514|8D8F08  |00088F;
    LDX.W #$0000                                               ;83F517|A20000  |      ;
 
  - REP #$30                                                   ;83F51A|C230    |      ;
    PHX                                                        ;83F51C|DA      |      ;
    TXA                                                        ;83F51D|8A      |      ;
    JSL.L fGameEngine_GetCowData                               ;83F51E|22A7C983|83C9A7;
    SEP #$20                                                   ;83F522|E220    |      ;
    REP #$10                                                   ;83F524|C210    |      ;
    LDY.W #$0000                                               ;83F526|A00000  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F529|B772    |000072;
    AND.B #$01                                                 ;83F52B|2901    |      ;
    BEQ .label2                                                ;83F52D|F044    |83F573;
    LDY.W #$0004                                               ;83F52F|A00400  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F532|B772    |000072;
    CMP.W $09B5                                                ;83F534|CDB509  |0009B5;
    BCS .label1                                                ;83F537|B002    |83F53B;
    BRA .label2                                                ;83F539|8038    |83F573;
 
 
.label1:
    SEP #$20                                                   ;83F53B|E220    |      ;
    STA.W $09B5                                                ;83F53D|8DB509  |0009B5;
    SEP #$20                                                   ;83F540|E220    |      ;
    LDA.B #$00                                                 ;83F542|A900    |      ;
    XBA                                                        ;83F544|EB      |      ;
    LDY.W #$000C                                               ;83F545|A00C00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F548|B772    |000072;
    REP #$20                                                   ;83F54A|C220    |      ;
    STA.W strcNames.wCurrentCow                                ;83F54C|8D8908  |000889;
    SEP #$20                                                   ;83F54F|E220    |      ;
    LDY.W #$000D                                               ;83F551|A00D00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F554|B772    |000072;
    REP #$20                                                   ;83F556|C220    |      ;
    STA.W strcNames.wCurrentCow+2                              ;83F558|8D8B08  |00088B;
    SEP #$20                                                   ;83F55B|E220    |      ;
    LDY.W #$000E                                               ;83F55D|A00E00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F560|B772    |000072;
    REP #$20                                                   ;83F562|C220    |      ;
    STA.W strcNames.wCurrentCow+4                              ;83F564|8D8D08  |00088D;
    SEP #$20                                                   ;83F567|E220    |      ;
    LDY.W #$000F                                               ;83F569|A00F00  |      ;
    LDA.B [ptrTemp0x72],Y                                      ;83F56C|B772    |000072;
    REP #$20                                                   ;83F56E|C220    |      ;
    STA.W strcNames.wCurrentCow+6                              ;83F570|8D8F08  |00088F;
 
.label2:
    REP #$30                                                   ;83F573|C230    |      ;
    PLX                                                        ;83F575|FA      |      ;
    INX                                                        ;83F576|E8      |      ;
    CPX.W #$000C                                               ;83F577|E00C00  |      ;
    BNE -                                                      ;83F57A|D09E    |83F51A;
    JSL.L fObjectMap_CalculateRanchDev                         ;83F57C|220CAA82|82AA0C;
    REP #$30                                                   ;83F580|C230    |      ;
    LDA.L nRanchDevelopmentRate                                ;83F582|AF561F7F|7F1F56;
    STA.B strcVariables.n16Temp1                               ;83F586|857E    |00007E;
    LDA.W #$000A                                               ;83F588|A90A00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;83F58B|22008083|838000;
    REP #$30                                                   ;83F58F|C230    |      ;
    STA.B strcVariables.n16Temp1                               ;83F591|857E    |00007E;
    LDA.W #$0127                                               ;83F593|A92701  |      ;
    STA.B strcVariables.n16Temp2                               ;83F596|8580    |000080;
    JSL.L fMathDivide                                          ;83F598|22828083|838082;
    REP #$30                                                   ;83F59C|C230    |      ;
    STA.L nRanchDevelopmentRate                                ;83F59E|8F561F7F|7F1F56;
    CMP.W #$0064                                               ;83F5A2|C96400  |      ;
    BCC .justReturn                                            ;83F5A5|9007    |83F5AE;
    LDA.W #$0064                                               ;83F5A7|A96400  |      ;
    STA.L nRanchDevelopmentRate                                ;83F5AA|8F561F7F|7F1F56;
 
.justReturn:
    RTS                                                        ;83F5AE|60      |      ;
 
 
    pad $83FFFF
