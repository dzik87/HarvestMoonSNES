; Bank $83 module "audio" - starts at $8382C6
 
 
fAudio_PlayTrackThenResumeMapMusic:
    SEP #$20                                                   ;8382C6|E220    |      ;
    REP #$10                                                   ;8382C8|C210    |      ;
    PHA                                                        ;8382CA|48      |      ;
    JSL.L fAudio_FadeOutOnTrackChangeFast                                 ;8382CB|221F8483|83841F;
    SEP #$20                                                   ;8382CF|E220    |      ;
    PLA                                                        ;8382D1|68      |      ;
    STA.W strcAudio.trackId                                    ;8382D2|8D1001  |000110;
    JSL.L fAudio_LoadPendingTrack                                 ;8382D5|22A48383|8383A4;
    JSL.L fAudio_StartPendingTrack                                 ;8382D9|22808383|838380;
    SEP #$20                                                   ;8382DD|E220    |      ;
    LDA.W strcAudio.trackId                                    ;8382DF|AD1001  |000110;
    STA.W strcAudio.trackIdCopy                                ;8382E2|8D1701  |000117;
    REP #$30                                                   ;8382E5|C230    |      ;
    LDA.W #$00B4                                               ;8382E7|A9B400  |      ;
    JSL.L fCore_WaitForNMITimes                                ;8382EA|225D8680|80865D;
    SEP #$20                                                   ;8382EE|E220    |      ;
    LDA.W nDestinationAreaId                                   ;8382F0|AD8B09  |00098B;
    STA.B strcMap.loadAreaId                                   ;8382F3|8522    |000022;
    JSL.L fAudioEngine_MapMusicHandler                         ;8382F5|22DE9580|8095DE;
    JSL.L fAudio_FadeOutOnTrackChangeSlow                                 ;8382F9|22018483|838401;
    RTL                                                        ;8382FD|6B      |      ;
 
 
fAudio_PlaySoundEffectAndWait:
    SEP #$20                                                   ;8382FE|E220    |      ;
    REP #$10                                                   ;838300|C210    |      ;
    STA.W strcAudio.reg114                                     ;838302|8D1401  |000114;
    PHY                                                        ;838305|5A      |      ;
    REP #$20                                                   ;838306|C220    |      ;
    TXA                                                        ;838308|8A      |      ;
    SEP #$20                                                   ;838309|E220    |      ;
    STA.W strcAudio.reg115                                     ;83830B|8D1501  |000115;
    LDA.B #$00                                                 ;83830E|A900    |      ;
    XBA                                                        ;838310|EB      |      ;
    LDA.W strcAudio.unk118                                     ;838311|AD1801  |000118;
    REP #$20                                                   ;838314|C220    |      ;
    TAX                                                        ;838316|AA      |      ;
    SEP #$20                                                   ;838317|E220    |      ;
    LDA.L nToolSoundData_80B8CD,X                              ;838319|BFCDB880|80B8CD;
    INC A                                                      ;83831D|1A      |      ;
    STA.W strcAudio.index                                      ;83831E|8D0301  |000103;
    JSL.L fAudio_PrepareSoundEffectSample                                 ;838321|223E8383|83833E;
    JSL.L fAudioSetRegister2to0A                               ;838325|22328383|838332;
    REP #$30                                                   ;838329|C230    |      ;
    PLY                                                        ;83832B|7A      |      ;
    TYA                                                        ;83832C|98      |      ;
    JSL.L fCore_WaitForNMITimes                                ;83832D|225D8680|80865D;
    RTL                                                        ;838331|6B      |      ;
 
 
fAudioSetRegister2to0A:
    SEP #$20                                                   ;838332|E220    |      ;
    LDA.B #$0A                                                 ;838334|A90A    |      ;
    STA.W strcAudio.reg116                                     ;838336|8D1601  |000116;
    JSL.L fAudio_SendPlaySfxCommand                                 ;838339|22DF8D83|838DDF;
    RTL                                                        ;83833D|6B      |      ;
 
 
fAudio_PrepareSoundEffectSample:
    SEP #$20                                                   ;83833E|E220    |      ;
    LDA.B #$00                                                 ;838340|A900    |      ;
    XBA                                                        ;838342|EB      |      ;
    LDA.W strcAudio.index                                      ;838343|AD0301  |000103;
    REP #$20                                                   ;838346|C220    |      ;
    TAX                                                        ;838348|AA      |      ;
    SEP #$20                                                   ;838349|E220    |      ;
    LDA.W strcAudio.list,X                                     ;83834B|BD0401  |000104;
    BEQ +                                                      ;83834E|F00E    |83835E;
    REP #$20                                                   ;838350|C220    |      ;
    TXA                                                        ;838352|8A      |      ;
    INC A                                                      ;838353|1A      |      ;
    SEP #$20                                                   ;838354|E220    |      ;
    JSL.L fAudio_FreeSamplesFromSlot                                 ;838356|22C78983|8389C7;
    JSL.L fCore_WaitForNextNMI                                 ;83835A|22458680|808645;
 
  + SEP #$20                                                   ;83835E|E220    |      ;
    LDA.B #$00                                                 ;838360|A900    |      ;
    XBA                                                        ;838362|EB      |      ;
    LDA.W strcAudio.reg114                                     ;838363|AD1401  |000114;
    REP #$20                                                   ;838366|C220    |      ;
    TAX                                                        ;838368|AA      |      ;
    SEP #$20                                                   ;838369|E220    |      ;
    LDA.L aAudioSfxSampleIdTable,X                               ;83836B|BF7F9283|83927F;
    BEQ +                                                      ;83836F|F004    |838375;
    JSL.L fAudio_LoadSfxSample                                 ;838371|22FF8A83|838AFF;
 
  + RTL                                                        ;838375|6B      |      ;
 
 
fAudioUnused_838376:
    SEP #$20                                                   ;838376|E220    |      ;
    LDA.W strcAudio.index                                      ;838378|AD0301  |000103;
    INC A                                                      ;83837B|1A      |      ;
    STA.W strcAudio.index                                      ;83837C|8D0301  |000103;
    RTL                                                        ;83837F|6B      |      ;
 
 
fAudio_StartPendingTrack:
    SEP #$20                                                   ;838380|E220    |      ;
    LDA.W strcAudio.trackId                                    ;838382|AD1001  |000110;
    BEQ +                                                      ;838385|F017    |83839E;
    CMP.W strcAudio.trackIdCopy                                ;838387|CD1701  |000117;
    BEQ +                                                      ;83838A|F012    |83839E;
    CMP.B #$FF                                                 ;83838C|C9FF    |      ;
    BEQ +                                                      ;83838E|F00E    |83839E;
    LDA.B #$01                                                 ;838390|A901    |      ;
    STA.W strcAudio.unk111                                     ;838392|8D1101  |000111;
    LDA.B #$40                                                 ;838395|A940    |      ;
    STA.W strcAudio.unk113                                     ;838397|8D1301  |000113;
    JSL.L fAudio_SendStartTrackCommand                                 ;83839A|22398D83|838D39;
 
  + SEP #$20                                                   ;83839E|E220    |      ;
    STZ.W strcAudio.toolId                                     ;8383A0|9C1901  |000119;
    RTL                                                        ;8383A3|6B      |      ;
 
 
fAudio_LoadPendingTrack:
    SEP #$20                                                   ;8383A4|E220    |      ;
    LDA.W strcAudio.trackId                                    ;8383A6|AD1001  |000110;
    CMP.W strcAudio.trackIdCopy                                ;8383A9|CD1701  |000117;
    BEQ +                                                      ;8383AC|F022    |8383D0;
    LDA.B #$00                                                 ;8383AE|A900    |      ;
    JSL.L fAudio_FreeSamplesFromSlot                                 ;8383B0|22C78983|8389C7;
    SEP #$20                                                   ;8383B4|E220    |      ;
    LDA.W strcAudio.trackId                                    ;8383B6|AD1001  |000110;
    BEQ +                                                      ;8383B9|F015    |8383D0;
    CMP.B #$FF                                                 ;8383BB|C9FF    |      ;
    BEQ +                                                      ;8383BD|F011    |8383D0;
    JSL.L fAudio_UploadTrackData                                 ;8383BF|22268A83|838A26;
    JSL.L fAudio_LoadTrackSamples                                 ;8383C3|228C8783|83878C;
    BRA +                                                      ;8383C7|8007    |8383D0;
 
    SEP #$20                                                   ;8383C9|E220    |      ;
    LDA.B #$00                                                 ;8383CB|A900    |      ;
    STA.W strcAudio.trackId                                    ;8383CD|8D1001  |000110;
 
  + SEP #$20                                                   ;8383D0|E220    |      ;
    LDA.B #$06                                                 ;8383D2|A906    |      ;
    STA.W strcAudio.reg115                                     ;8383D4|8D1501  |000115;
    LDA.B #$03                                                 ;8383D7|A903    |      ;
    STA.W strcAudio.reg114                                     ;8383D9|8D1401  |000114;
    SEP #$20                                                   ;8383DC|E220    |      ;
    LDA.B #$00                                                 ;8383DE|A900    |      ;
    XBA                                                        ;8383E0|EB      |      ;
    LDA.W strcAudio.trackId                                    ;8383E1|AD1001  |000110;
    STA.W strcAudio.unk118                                     ;8383E4|8D1801  |000118;
    CMP.B #$FF                                                 ;8383E7|C9FF    |      ;
    BNE +                                                      ;8383E9|D005    |8383F0;
    LDA.B #$00                                                 ;8383EB|A900    |      ;
    STA.W strcAudio.unk118                                     ;8383ED|8D1801  |000118;
 
  + REP #$20                                                   ;8383F0|C220    |      ;
    TAX                                                        ;8383F2|AA      |      ;
    SEP #$20                                                   ;8383F3|E220    |      ;
    LDA.L nToolSoundData_80B8CD,X                              ;8383F5|BFCDB880|80B8CD;
    STA.W strcAudio.index                                      ;8383F9|8D0301  |000103;
    JSL.L fAudio_PrepareSoundEffectSample                                 ;8383FC|223E8383|83833E;
 
fAudioReturn_838400:
    RTL                                                        ;838400|6B      |      ; FIXME: I want to be .return
 
 
fAudio_FadeOutOnTrackChangeSlow:
    SEP #$20                                                   ;838401|E220    |      ;
    LDA.W strcAudio.trackId                                    ;838403|AD1001  |000110;
    CMP.W strcAudio.trackIdCopy                                ;838406|CD1701  |000117;
    BEQ .return                                                ;838409|F013    |83841E;
    LDA.W strcAudio.trackIdCopy                                ;83840B|AD1701  |000117;
    BEQ fAudioReturn_838400                                    ;83840E|F0F0    |838400; BUG - should be .return in this function rather than previous one since we are out of function scope
    LDA.B #$01                                                 ;838410|A901    |      ;
    STA.W strcAudio.unk112                                     ;838412|8D1201  |000112;
    LDA.B #$40                                                 ;838415|A940    |      ;
    STA.W strcAudio.unk113                                     ;838417|8D1301  |000113;
    JSL.L fAudio_SendFadeOutCommand                                 ;83841A|228B8D83|838D8B;
 
.return:
    RTL                                                        ;83841E|6B      |      ;
 
 
fAudio_FadeOutOnTrackChangeFast:
    SEP #$20                                                   ;83841F|E220    |      ;
    LDA.W strcAudio.trackId                                    ;838421|AD1001  |000110;
    CMP.W strcAudio.trackIdCopy                                ;838424|CD1701  |000117;
    BEQ .return                                                ;838427|F013    |83843C;
    LDA.W strcAudio.trackIdCopy                                ;838429|AD1701  |000117;
    BEQ .return                                                ;83842C|F00E    |83843C;
    LDA.B #$01                                                 ;83842E|A901    |      ;
    STA.W strcAudio.unk112                                     ;838430|8D1201  |000112;
    LDA.B #$10                                                 ;838433|A910    |      ;
    STA.W strcAudio.unk113                                     ;838435|8D1301  |000113;
    JSL.L fAudio_SendFadeOutCommand                                 ;838438|228B8D83|838D8B;
 
.return:
    RTL                                                        ;83843C|6B      |      ;
 
 
fAudio_UploadData:
    PHP                                                        ;83843D|08      |      ;
    REP #$30                                                   ;83843E|C230    |      ;
    REP #$30                                                   ;838440|C230    |      ;
    LDY.W #$0000                                               ;838442|A00000  |      ;
    LDA.W #$BBAA                                               ;838445|A9AABB  |      ;
 
  - CMP.W SNES_APUIO0                                          ;838448|CD4021  |002140;
    BNE -                                                      ;83844B|D0FB    |838448;
    SEP #$20                                                   ;83844D|E220    |      ;
    SEP #$20                                                   ;83844F|E220    |      ;
    LDA.B #$CC                                                 ;838451|A9CC    |      ;
    PHA                                                        ;838453|48      |      ;
    REP #$20                                                   ;838454|C220    |      ;
    REP #$20                                                   ;838456|C220    |      ;
    LDA.W #$0FD6                                               ;838458|A9D60F  |      ;
    TAX                                                        ;83845B|AA      |      ;
    SEP #$20                                                   ;83845C|E220    |      ;
    LDA.B #$00                                                 ;83845E|A900    |      ;
    STA.W SNES_APUIO2                                          ;838460|8D4221  |002142;
    LDA.B #$05                                                 ;838463|A905    |      ;
    STA.W SNES_APUIO3                                          ;838465|8D4321  |002143;
    SEP #$20                                                   ;838468|E220    |      ;
    CPX.W #$0001                                               ;83846A|E00100  |      ;
    LDA.B #$00                                                 ;83846D|A900    |      ;
    ROL A                                                      ;83846F|2A      |      ;
    STA.W SNES_APUIO1                                          ;838470|8D4121  |002141;
    ADC.B #$7F                                                 ;838473|697F    |      ;
    PLA                                                        ;838475|68      |      ;
    STA.W SNES_APUIO0                                          ;838476|8D4021  |002140;
 
  - CMP.W SNES_APUIO0                                          ;838479|CD4021  |002140;
    BNE -                                                      ;83847C|D0FB    |838479;
 
.loop:
    LDA.B [ptrAudioData],Y                                     ;83847E|B70A    |00000A;
    INY                                                        ;838480|C8      |      ;
    XBA                                                        ;838481|EB      |      ;
    LDA.B #$00                                                 ;838482|A900    |      ;
    BRA +                                                      ;838484|800B    |838491;
 
 
 -- XBA                                                        ;838486|EB      |      ;
    LDA.B [ptrAudioData],Y                                     ;838487|B70A    |00000A;
    INY                                                        ;838489|C8      |      ;
    XBA                                                        ;83848A|EB      |      ;
 
  - CMP.W SNES_APUIO0                                          ;83848B|CD4021  |002140;
    BNE -                                                      ;83848E|D0FB    |83848B;
    INC A                                                      ;838490|1A      |      ;
 
  + REP #$20                                                   ;838491|C220    |      ;
    STA.W SNES_APUIO0                                          ;838493|8D4021  |002140;
    SEP #$20                                                   ;838496|E220    |      ;
    DEX                                                        ;838498|CA      |      ;
    BNE --                                                     ;838499|D0EB    |838486;
 
  - CMP.W SNES_APUIO0                                          ;83849B|CD4021  |002140;
    BNE -                                                      ;83849E|D0FB    |83849B;
 
  - ADC.B #$03                                                 ;8384A0|6903    |      ;
    BEQ -                                                      ;8384A2|F0FC    |8384A0;
    PHA                                                        ;8384A4|48      |      ;
    REP #$20                                                   ;8384A5|C220    |      ;
    REP #$20                                                   ;8384A7|C220    |      ;
    LDA.W #$0000                                               ;8384A9|A90000  |      ;
    TAX                                                        ;8384AC|AA      |      ;
    SEP #$20                                                   ;8384AD|E220    |      ;
    LDA.B #$00                                                 ;8384AF|A900    |      ;
    STA.W SNES_APUIO2                                          ;8384B1|8D4221  |002142;
    LDA.B #$05                                                 ;8384B4|A905    |      ;
    STA.W SNES_APUIO3                                          ;8384B6|8D4321  |002143;
    SEP #$20                                                   ;8384B9|E220    |      ;
    CPX.W #$0001                                               ;8384BB|E00100  |      ;
    LDA.B #$00                                                 ;8384BE|A900    |      ;
    ROL A                                                      ;8384C0|2A      |      ;
    STA.W SNES_APUIO1                                          ;8384C1|8D4121  |002141;
    ADC.B #$7F                                                 ;8384C4|697F    |      ;
    PLA                                                        ;8384C6|68      |      ;
    STA.W SNES_APUIO0                                          ;8384C7|8D4021  |002140;
 
  - CMP.W SNES_APUIO0                                          ;8384CA|CD4021  |002140;
    BNE -                                                      ;8384CD|D0FB    |8384CA;
    BVS .loop                                                  ;8384CF|70AD    |83847E;
    PLP                                                        ;8384D1|28      |      ;
    RTL                                                        ;8384D2|6B      |      ;
 
 
fAudio_UploadSpcDataBlock_B2D120:
    SEP #$20                                                   ;8384D3|E220    |      ;
    REP #$10                                                   ;8384D5|C210    |      ;
    LDA.B #$01                                                 ;8384D7|A901    |      ;
    STA.B strcVariables.n8Temp1                                ;8384D9|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;8384DB|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;8384DE|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8384E0|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8384E3|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8384E5|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8384E8|C593    |000093;
    BNE .wait1                                                 ;8384EA|D0F2    |8384DE;
    LDA.B #$01                                                 ;8384EC|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8384EE|CD4321  |002143;
    BNE .wait1                                                 ;8384F1|D0EB    |8384DE;
    REP #$20                                                   ;8384F3|C220    |      ;
    LDA.W #$03F2                                               ;8384F5|A9F203  |      ;
    STA.B strcVariables.n16Temp1                               ;8384F8|857E    |00007E;
    LDA.W #$0003                                               ;8384FA|A90300  |      ;
    STA.B strcVariables.n16Temp2                               ;8384FD|8580    |000080;
    JSL.L fMathDivide                                          ;8384FF|22828083|838082;
    STA.B strcVariables.n16Temp2                               ;838503|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;838505|A57E    |00007E;
    BEQ +                                                      ;838507|F002    |83850B;
    INC.B strcVariables.n16Temp2                               ;838509|E680    |000080;
 
  + LDA.B strcVariables.n16Temp2                               ;83850B|A580    |000080;
    SEP #$20                                                   ;83850D|E220    |      ;
    STA.W SNES_APUIO0                                          ;83850F|8D4021  |002140;
    XBA                                                        ;838512|EB      |      ;
    STA.W SNES_APUIO1                                          ;838513|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838516|9C4221  |002142;
    LDA.B #$02                                                 ;838519|A902    |      ;
    STA.W SNES_APUIO3                                          ;83851B|8D4321  |002143;
 
.wait2:
    SEP #$20                                                   ;83851E|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838520|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838523|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838525|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838528|C593    |000093;
    BNE .wait2                                                 ;83852A|D0F2    |83851E;
    LDA.W SNES_APUIO3                                          ;83852C|AD4321  |002143;
    CMP.B #$04                                                 ;83852F|C904    |      ;
    BNE .wait2                                                 ;838531|D0EB    |83851E;
    SEP #$20                                                   ;838533|E220    |      ;
    STZ.W SNES_APUIO3                                          ;838535|9C4321  |002143;
    LDY.W #$0000                                               ;838538|A00000  |      ;
    REP #$20                                                   ;83853B|C220    |      ;
    LDA.W #$D120                                               ;83853D|A920D1  |      ;
    STA.B ptrAudioData                                         ;838540|850A    |00000A;
    SEP #$20                                                   ;838542|E220    |      ;
    LDA.B #$B2                                                 ;838544|A9B2    |      ;
    STA.B ptrAudioData+2                                       ;838546|850C    |00000C;
    REP #$20                                                   ;838548|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;83854A|A580    |000080;
    TAX                                                        ;83854C|AA      |      ;
 
.wait3:
    SEP #$20                                                   ;83854D|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83854F|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838552|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838554|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838557|C593    |000093;
    BNE .wait3                                                 ;838559|D0F2    |83854D;
    LDA.B #$01                                                 ;83855B|A901    |      ;
    CMP.W SNES_APUIO3                                          ;83855D|CD4321  |002143;
    BNE .wait3                                                 ;838560|D0EB    |83854D;
    LDA.B [ptrAudioData],Y                                     ;838562|B70A    |00000A;
    STA.W SNES_APUIO0                                          ;838564|8D4021  |002140;
    INY                                                        ;838567|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838568|B70A    |00000A;
    STA.W SNES_APUIO1                                          ;83856A|8D4121  |002141;
    INY                                                        ;83856D|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;83856E|B70A    |00000A;
    STA.W SNES_APUIO2                                          ;838570|8D4221  |002142;
    INY                                                        ;838573|C8      |      ;
    DEX                                                        ;838574|CA      |      ;
    LDA.B #$02                                                 ;838575|A902    |      ;
    STA.W SNES_APUIO3                                          ;838577|8D4321  |002143;
 
.wait4:
    SEP #$20                                                   ;83857A|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83857C|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83857F|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838581|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838584|C593    |000093;
    BNE .wait4                                                 ;838586|D0F2    |83857A;
    LDA.B #$00                                                 ;838588|A900    |      ;
    CMP.W SNES_APUIO3                                          ;83858A|CD4321  |002143;
    BNE .wait4                                                 ;83858D|D0EB    |83857A;
    STZ.W SNES_APUIO3                                          ;83858F|9C4321  |002143;
    CPX.W #$0000                                               ;838592|E00000  |      ;
    BNE .wait3                                                 ;838595|D0B6    |83854D;
    RTL                                                        ;838597|6B      |      ;
 
 
fAudio_LoadCommonSamples:
    SEP #$20                                                   ;838598|E220    |      ; X: nAudioId (0x00 - 0x09)
    REP #$10                                                   ;83859A|C210    |      ;
    LDX.W #$0000                                               ;83859C|A20000  |      ;
 
.loop:
    LDA.L aAudioSampleLookupTable,X                            ;83859F|BFB19283|8392B1;
    STA.B strcVariables.n8Temp3                                ;8385A3|8594    |000094; sAudioData2Index
    BNE +                                                      ;8385A5|D009    |8385B0;
    INX                                                        ;8385A7|E8      |      ;
    CPX.W #$000A                                               ;8385A8|E00A00  |      ;
    BNE .loop                                                  ;8385AB|D0F2    |83859F;
    JMP.W .return                                              ;8385AD|4C8B87  |83878B;
 
 
  + SEP #$20                                                   ;8385B0|E220    |      ;
    LDA.B #$02                                                 ;8385B2|A902    |      ;
    STA.B strcVariables.n8Temp1                                ;8385B4|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;8385B6|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;8385B9|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8385BB|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8385BE|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8385C0|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8385C3|C593    |000093;
    BNE .wait1                                                 ;8385C5|D0F2    |8385B9;
    LDA.B #$01                                                 ;8385C7|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8385C9|CD4321  |002143;
    BNE .wait1                                                 ;8385CC|D0EB    |8385B9;
    PHX                                                        ;8385CE|DA      |      ;
    LDA.B #$00                                                 ;8385CF|A900    |      ;
    XBA                                                        ;8385D1|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;8385D2|A594    |000094; sAudioData2Index
    REP #$20                                                   ;8385D4|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;8385D6|857E    |00007E;
    LDA.W #$000A                                               ;8385D8|A90A00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;8385DB|22008083|838000; Calculate new X offset (X * 0x0A)
    TAX                                                        ;8385DF|AA      |      ;
    SEP #$20                                                   ;8385E0|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;8385E2|A594    |000094; sAudioData2Index
    STA.W SNES_APUIO0                                          ;8385E4|8D4021  |002140;
    REP #$20                                                   ;8385E7|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;8385E9|BFEF9083|8390EF;
    SEP #$20                                                   ;8385ED|E220    |      ;
    STA.W SNES_APUIO1                                          ;8385EF|8D4121  |002141;
    XBA                                                        ;8385F2|EB      |      ;
    STA.W SNES_APUIO2                                          ;8385F3|8D4221  |002142;
    LDA.B #$02                                                 ;8385F6|A902    |      ;
    STA.W SNES_APUIO3                                          ;8385F8|8D4321  |002143;
    INX                                                        ;8385FB|E8      |      ;
    INX                                                        ;8385FC|E8      |      ;
 
.wait2:
    SEP #$20                                                   ;8385FD|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8385FF|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838602|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838604|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838607|C593    |000093;
    BNE .wait2                                                 ;838609|D0F2    |8385FD;
    LDA.W SNES_APUIO3                                          ;83860B|AD4321  |002143;
    CMP.B #$04                                                 ;83860E|C904    |      ;
    BEQ +                                                      ;838610|F002    |838614;
    BRA .wait2                                                 ;838612|80E9    |8385FD;
 
 
  + STZ.W SNES_APUIO3                                          ;838614|9C4321  |002143;
 
  - SEP #$20                                                   ;838617|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838619|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83861C|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83861E|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838621|C593    |000093;
    BNE -                                                      ;838623|D0F2    |838617;
 
  - LDA.B #$01                                                 ;838625|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838627|CD4321  |002143;
    BNE -                                                      ;83862A|D0F9    |838625;
    LDA.L sAudioSampleData,X                                   ;83862C|BFEF9083|8390EF;
    STA.W SNES_APUIO0                                          ;838630|8D4021  |002140;
    INX                                                        ;838633|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838634|BFEF9083|8390EF;
    STA.W SNES_APUIO1                                          ;838638|8D4121  |002141;
    INX                                                        ;83863B|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;83863C|BFEF9083|8390EF;
    STA.W SNES_APUIO2                                          ;838640|8D4221  |002142;
    LDA.B #$02                                                 ;838643|A902    |      ;
    STA.W SNES_APUIO3                                          ;838645|8D4321  |002143;
    INX                                                        ;838648|E8      |      ;
 
.wait3:
    SEP #$20                                                   ;838649|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83864B|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83864E|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838650|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838653|C593    |000093;
    BNE .wait3                                                 ;838655|D0F2    |838649;
    LDA.W SNES_APUIO3                                          ;838657|AD4321  |002143;
    CMP.B #$04                                                 ;83865A|C904    |      ;
    BEQ +                                                      ;83865C|F002    |838660;
    BRA .wait3                                                 ;83865E|80E9    |838649;
 
 
  + STZ.W SNES_APUIO3                                          ;838660|9C4321  |002143;
 
  - SEP #$20                                                   ;838663|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838665|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838668|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83866A|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83866D|C593    |000093;
    BNE -                                                      ;83866F|D0F2    |838663;
 
  - LDA.B #$01                                                 ;838671|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838673|CD4321  |002143;
    BNE -                                                      ;838676|D0F9    |838671;
    LDA.L sAudioSampleData,X                                   ;838678|BFEF9083|8390EF;
    STA.W SNES_APUIO0                                          ;83867C|8D4021  |002140;
    INX                                                        ;83867F|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838680|BFEF9083|8390EF;
    STA.W SNES_APUIO1                                          ;838684|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838687|9C4221  |002142;
    LDA.B #$02                                                 ;83868A|A902    |      ;
    STA.W SNES_APUIO3                                          ;83868C|8D4321  |002143;
    INX                                                        ;83868F|E8      |      ;
 
.wait4:
    SEP #$20                                                   ;838690|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838692|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838695|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838697|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83869A|C593    |000093;
    BNE .wait4                                                 ;83869C|D0F2    |838690;
    LDA.W SNES_APUIO3                                          ;83869E|AD4321  |002143;
    CMP.B #$04                                                 ;8386A1|C904    |      ;
    BEQ +                                                      ;8386A3|F002    |8386A7;
    BRA .wait4                                                 ;8386A5|80E9    |838690;
 
 
  + STZ.W SNES_APUIO3                                          ;8386A7|9C4321  |002143;
 
  - SEP #$20                                                   ;8386AA|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8386AC|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8386AF|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8386B1|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8386B4|C593    |000093;
    BNE -                                                      ;8386B6|D0F2    |8386AA;
 
  - LDA.B #$01                                                 ;8386B8|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8386BA|CD4321  |002143;
    BNE -                                                      ;8386BD|D0F9    |8386B8;
    REP #$20                                                   ;8386BF|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;8386C1|BFEF9083|8390EF; read ptr at offset 7
    STA.B ptrAudioData                                         ;8386C5|850A    |00000A; store 16b to $0A
    INX                                                        ;8386C7|E8      |      ;
    INX                                                        ;8386C8|E8      |      ;
    SEP #$20                                                   ;8386C9|E220    |      ;
    LDA.L sAudioSampleData,X                                   ;8386CB|BFEF9083|8390EF;
    STA.B ptrAudioData+2                                       ;8386CF|850C    |00000C; store 8b to $0C
    LDA.B #$00                                                 ;8386D1|A900    |      ;
    XBA                                                        ;8386D3|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;8386D4|A594    |000094; sAudioData2Index
    ASL A                                                      ;8386D6|0A      |      ;
    REP #$20                                                   ;8386D7|C220    |      ;
    TAX                                                        ;8386D9|AA      |      ;
    LDA.L aAudioSampleSize,X                                   ;8386DA|BFFF8E83|838EFF;
    STA.B strcVariables.n16Temp1                               ;8386DE|857E    |00007E;
    LDA.W #$0003                                               ;8386E0|A90300  |      ;
    STA.B strcVariables.n16Temp2                               ;8386E3|8580    |000080;
    JSL.L fMathDivide                                          ;8386E5|22828083|838082;
    STA.B strcVariables.n16Temp2                               ;8386E9|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;8386EB|A57E    |00007E;
    BEQ +                                                      ;8386ED|F002    |8386F1;
    INC.B strcVariables.n16Temp2                               ;8386EF|E680    |000080;
 
  + LDA.B strcVariables.n16Temp2                               ;8386F1|A580    |000080;
    TAX                                                        ;8386F3|AA      |      ; X = nAudioTrackSize / 3 (we copy 3 bytes at time
    SEP #$20                                                   ;8386F4|E220    |      ;
    STA.W SNES_APUIO0                                          ;8386F6|8D4021  |002140;
    XBA                                                        ;8386F9|EB      |      ;
    STA.W SNES_APUIO1                                          ;8386FA|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;8386FD|9C4221  |002142;
    LDA.B #$02                                                 ;838700|A902    |      ;
    STA.W SNES_APUIO3                                          ;838702|8D4321  |002143;
    LDY.W #$0000                                               ;838705|A00000  |      ;
 
.wait5:
    SEP #$20                                                   ;838708|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83870A|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83870D|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83870F|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838712|C593    |000093;
    BNE .wait5                                                 ;838714|D0F2    |838708;
    LDA.W SNES_APUIO3                                          ;838716|AD4321  |002143;
    CMP.B #$04                                                 ;838719|C904    |      ;
    BEQ +                                                      ;83871B|F002    |83871F;
    BRA .wait5                                                 ;83871D|80E9    |838708;
 
 
  + STZ.W SNES_APUIO3                                          ;83871F|9C4321  |002143;
 
  - SEP #$20                                                   ;838722|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838724|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838727|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838729|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83872C|C593    |000093;
    BNE -                                                      ;83872E|D0F2    |838722;
 
  - LDA.B #$01                                                 ;838730|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838732|CD4321  |002143;
    BNE -                                                      ;838735|D0F9    |838730;
 
.copyData:
    LDA.B [ptrAudioData],Y                                     ;838737|B70A    |00000A;
    STA.W SNES_APUIO0                                          ;838739|8D4021  |002140;
    INY                                                        ;83873C|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;83873D|B70A    |00000A;
    STA.W SNES_APUIO1                                          ;83873F|8D4121  |002141;
    INY                                                        ;838742|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838743|B70A    |00000A;
    STA.W SNES_APUIO2                                          ;838745|8D4221  |002142;
    INY                                                        ;838748|C8      |      ;
    DEX                                                        ;838749|CA      |      ;
    LDA.B #$02                                                 ;83874A|A902    |      ;
    STA.W SNES_APUIO3                                          ;83874C|8D4321  |002143;
 
.wait6:
    SEP #$20                                                   ;83874F|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838751|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838754|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838756|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838759|C593    |000093;
    BNE .wait6                                                 ;83875B|D0F2    |83874F;
    LDA.B #$00                                                 ;83875D|A900    |      ;
    CMP.W SNES_APUIO3                                          ;83875F|CD4321  |002143;
    BNE .wait6                                                 ;838762|D0EB    |83874F;
    STZ.W SNES_APUIO3                                          ;838764|9C4321  |002143;
 
  - SEP #$20                                                   ;838767|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838769|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83876C|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83876E|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838771|C593    |000093;
    BNE -                                                      ;838773|D0F2    |838767;
 
  - LDA.B #$01                                                 ;838775|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838777|CD4321  |002143;
    BNE -                                                      ;83877A|D0F9    |838775;
    CPX.W #$0000                                               ;83877C|E00000  |      ;
    BNE .copyData                                              ;83877F|D0B6    |838737;
    PLX                                                        ;838781|FA      |      ;
    INX                                                        ;838782|E8      |      ;
    CPX.W #$000A                                               ;838783|E00A00  |      ;
    BEQ .return                                                ;838786|F003    |83878B;
    JMP.W .loop                                                ;838788|4C9F85  |83859F;
 
 
.return:
    RTL                                                        ;83878B|6B      |      ;
 
 
fAudio_LoadTrackSamples:
    SEP #$20                                                   ;83878C|E220    |      ;
    REP #$10                                                   ;83878E|C210    |      ;
    LDX.W #$0000                                               ;838790|A20000  |      ;
    STZ.W strcAudio.index                                      ;838793|9C0301  |000103;
    STZ.W strcAudio.unk10F                                     ;838796|9C0F01  |00010F;
 
  - STZ.W strcAudio.list,X                                     ;838799|9E0401  |000104;
    INX                                                        ;83879C|E8      |      ;
    CPX.W #$000B                                               ;83879D|E00B00  |      ;
    BNE -                                                      ;8387A0|D0F7    |838799;
    LDY.W #$0000                                               ;8387A2|A00000  |      ;
    LDA.B #$00                                                 ;8387A5|A900    |      ;
    XBA                                                        ;8387A7|EB      |      ;
    LDA.W strcAudio.trackId                                    ;8387A8|AD1001  |000110;
    REP #$20                                                   ;8387AB|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;8387AD|857E    |00007E;
    LDA.W #$000E                                               ;8387AF|A90E00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;8387B2|22008083|838000;
    TAX                                                        ;8387B6|AA      |      ;
    INX                                                        ;8387B7|E8      |      ;
    INX                                                        ;8387B8|E8      |      ;
    INX                                                        ;8387B9|E8      |      ;
    CLC                                                        ;8387BA|18      |      ;
    ADC.W #$000E                                               ;8387BB|690E00  |      ;
    STA.B strcVariables.n16Temp4                               ;8387BE|8584    |000084; nIndex = nAudioMusicTrackId * 0x0E + 0x0E + 3
 
.loop:
    SEP #$20                                                   ;8387C0|E220    |      ;
    LDA.L sAudioData1_838F83,X                                 ;8387C2|BF838F83|838F83;
    STA.B strcVariables.n8Temp3                                ;8387C6|8594    |000094;
    BNE .label1                                                ;8387C8|D010    |8387DA;
    REP #$20                                                   ;8387CA|C220    |      ;
    INX                                                        ;8387CC|E8      |      ;
    CPX.B strcVariables.n16Temp4                               ;8387CD|E484    |000084;
    BNE .loop                                                  ;8387CF|D0EF    |8387C0;
    SEP #$20                                                   ;8387D1|E220    |      ;
    LDA.B #$06                                                 ;8387D3|A906    |      ;
    STA.B strcVariables.n8Temp3                                ;8387D5|8594    |000094;
    DEX                                                        ;8387D7|CA      |      ;
    BRA .label2                                                ;8387D8|800D    |8387E7;
 
 
.label1:
    SEP #$20                                                   ;8387DA|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;8387DC|A594    |000094;
    STA.W strcAudio.list,Y                                     ;8387DE|990401  |000104;
    INC.W strcAudio.index                                      ;8387E1|EE0301  |000103;
    INC.W strcAudio.unk10F                                     ;8387E4|EE0F01  |00010F;
 
.label2:
    SEP #$20                                                   ;8387E7|E220    |      ;
    LDA.B #$03                                                 ;8387E9|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;8387EB|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;8387ED|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;8387F0|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8387F2|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8387F5|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8387F7|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8387FA|C593    |000093;
    BNE .wait1                                                 ;8387FC|D0F2    |8387F0;
    LDA.B #$01                                                 ;8387FE|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838800|CD4321  |002143;
    BNE .wait1                                                 ;838803|D0EB    |8387F0;
    PHX                                                        ;838805|DA      |      ;
    PHY                                                        ;838806|5A      |      ;
    LDA.B #$00                                                 ;838807|A900    |      ;
    XBA                                                        ;838809|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;83880A|A594    |000094;
    REP #$20                                                   ;83880C|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;83880E|857E    |00007E;
    LDA.W #$000A                                               ;838810|A90A00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;838813|22008083|838000;
    TAX                                                        ;838817|AA      |      ;
    SEP #$20                                                   ;838818|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;83881A|A594    |000094;
    STA.W SNES_APUIO0                                          ;83881C|8D4021  |002140;
    REP #$20                                                   ;83881F|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;838821|BFEF9083|8390EF;
    SEP #$20                                                   ;838825|E220    |      ;
    STA.W SNES_APUIO1                                          ;838827|8D4121  |002141;
    XBA                                                        ;83882A|EB      |      ;
    STA.W SNES_APUIO2                                          ;83882B|8D4221  |002142;
    LDA.B #$02                                                 ;83882E|A902    |      ;
    STA.W SNES_APUIO3                                          ;838830|8D4321  |002143;
    INX                                                        ;838833|E8      |      ;
    INX                                                        ;838834|E8      |      ;
 
.wait2:
    SEP #$20                                                   ;838835|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838837|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83883A|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83883C|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83883F|C593    |000093;
    BNE .wait2                                                 ;838841|D0F2    |838835;
    LDA.W SNES_APUIO3                                          ;838843|AD4321  |002143;
    CMP.B #$04                                                 ;838846|C904    |      ;
    BEQ +                                                      ;838848|F002    |83884C;
    BRA .wait2                                                 ;83884A|80E9    |838835;
 
 
  + STZ.W SNES_APUIO3                                          ;83884C|9C4321  |002143;
 
  - SEP #$20                                                   ;83884F|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838851|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838854|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838856|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838859|C593    |000093;
    BNE -                                                      ;83885B|D0F2    |83884F;
 
  - LDA.B #$01                                                 ;83885D|A901    |      ;
    CMP.W SNES_APUIO3                                          ;83885F|CD4321  |002143;
    BNE -                                                      ;838862|D0F9    |83885D;
    LDA.L sAudioSampleData,X                                   ;838864|BFEF9083|8390EF;
    STA.W SNES_APUIO0                                          ;838868|8D4021  |002140;
    INX                                                        ;83886B|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;83886C|BFEF9083|8390EF;
    STA.W SNES_APUIO1                                          ;838870|8D4121  |002141;
    INX                                                        ;838873|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838874|BFEF9083|8390EF;
    STA.W SNES_APUIO2                                          ;838878|8D4221  |002142;
    LDA.B #$02                                                 ;83887B|A902    |      ;
    STA.W SNES_APUIO3                                          ;83887D|8D4321  |002143;
    INX                                                        ;838880|E8      |      ;
 
.wait3:
    SEP #$20                                                   ;838881|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838883|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838886|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838888|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83888B|C593    |000093;
    BNE .wait3                                                 ;83888D|D0F2    |838881;
    LDA.W SNES_APUIO3                                          ;83888F|AD4321  |002143;
    CMP.B #$04                                                 ;838892|C904    |      ;
    BEQ +                                                      ;838894|F002    |838898;
    BRA .wait3                                                 ;838896|80E9    |838881;
 
 
  + STZ.W SNES_APUIO3                                          ;838898|9C4321  |002143;
 
  - SEP #$20                                                   ;83889B|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83889D|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8388A0|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8388A2|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8388A5|C593    |000093;
    BNE -                                                      ;8388A7|D0F2    |83889B;
 
  - LDA.B #$01                                                 ;8388A9|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8388AB|CD4321  |002143;
    BNE -                                                      ;8388AE|D0F9    |8388A9;
    LDA.L sAudioSampleData,X                                   ;8388B0|BFEF9083|8390EF;
    STA.W SNES_APUIO0                                          ;8388B4|8D4021  |002140;
    INX                                                        ;8388B7|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;8388B8|BFEF9083|8390EF;
    STA.W SNES_APUIO1                                          ;8388BC|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;8388BF|9C4221  |002142;
    LDA.B #$02                                                 ;8388C2|A902    |      ;
    STA.W SNES_APUIO3                                          ;8388C4|8D4321  |002143;
    INX                                                        ;8388C7|E8      |      ;
 
.wait4:
    SEP #$20                                                   ;8388C8|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8388CA|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8388CD|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8388CF|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8388D2|C593    |000093;
    BNE .wait4                                                 ;8388D4|D0F2    |8388C8;
    LDA.W SNES_APUIO3                                          ;8388D6|AD4321  |002143;
    CMP.B #$04                                                 ;8388D9|C904    |      ;
    BEQ +                                                      ;8388DB|F002    |8388DF;
    BRA .wait4                                                 ;8388DD|80E9    |8388C8;
 
 
  + STZ.W SNES_APUIO3                                          ;8388DF|9C4321  |002143;
 
  - SEP #$20                                                   ;8388E2|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8388E4|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8388E7|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8388E9|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8388EC|C593    |000093;
    BNE -                                                      ;8388EE|D0F2    |8388E2;
 
  - LDA.B #$01                                                 ;8388F0|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8388F2|CD4321  |002143;
    BNE -                                                      ;8388F5|D0F9    |8388F0;
    REP #$20                                                   ;8388F7|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;8388F9|BFEF9083|8390EF;
    STA.B ptrAudioData                                         ;8388FD|850A    |00000A;
    INX                                                        ;8388FF|E8      |      ;
    INX                                                        ;838900|E8      |      ;
    SEP #$20                                                   ;838901|E220    |      ;
    LDA.L sAudioSampleData,X                                   ;838903|BFEF9083|8390EF;
    STA.B ptrAudioData+2                                       ;838907|850C    |00000C;
    LDA.B #$00                                                 ;838909|A900    |      ;
    XBA                                                        ;83890B|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;83890C|A594    |000094;
    ASL A                                                      ;83890E|0A      |      ;
    REP #$20                                                   ;83890F|C220    |      ;
    TAX                                                        ;838911|AA      |      ;
    LDA.L aAudioSampleSize,X                                   ;838912|BFFF8E83|838EFF;
    STA.B strcVariables.n16Temp1                               ;838916|857E    |00007E;
    LDA.W #$0003                                               ;838918|A90300  |      ;
    STA.B strcVariables.n16Temp2                               ;83891B|8580    |000080;
    JSL.L fMathDivide                                          ;83891D|22828083|838082;
    STA.B strcVariables.n16Temp2                               ;838921|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;838923|A57E    |00007E;
    BEQ +                                                      ;838925|F002    |838929;
    INC.B strcVariables.n16Temp2                               ;838927|E680    |000080;
 
  + LDA.B strcVariables.n16Temp2                               ;838929|A580    |000080;
    TAX                                                        ;83892B|AA      |      ;
    SEP #$20                                                   ;83892C|E220    |      ;
    STA.W SNES_APUIO0                                          ;83892E|8D4021  |002140;
    XBA                                                        ;838931|EB      |      ;
    STA.W SNES_APUIO1                                          ;838932|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838935|9C4221  |002142;
    LDA.B #$02                                                 ;838938|A902    |      ;
    STA.W SNES_APUIO3                                          ;83893A|8D4321  |002143;
    LDY.W #$0000                                               ;83893D|A00000  |      ;
 
.wait5:
    SEP #$20                                                   ;838940|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838942|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838945|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838947|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;83894A|C593    |000093;
    BNE .wait5                                                 ;83894C|D0F2    |838940;
    LDA.W SNES_APUIO3                                          ;83894E|AD4321  |002143;
    CMP.B #$04                                                 ;838951|C904    |      ;
    BEQ +                                                      ;838953|F002    |838957;
    BRA .wait5                                                 ;838955|80E9    |838940;
 
 
  + STZ.W SNES_APUIO3                                          ;838957|9C4321  |002143;
 
  - SEP #$20                                                   ;83895A|E220    |      ;
    LDA.W SNES_APUIO3                                          ;83895C|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83895F|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838961|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838964|C593    |000093;
    BNE -                                                      ;838966|D0F2    |83895A;
 
  - LDA.B #$01                                                 ;838968|A901    |      ;
    CMP.W SNES_APUIO3                                          ;83896A|CD4321  |002143;
    BNE -                                                      ;83896D|D0F9    |838968;
 
.copyData:
    LDA.B [ptrAudioData],Y                                     ;83896F|B70A    |00000A;
    STA.W SNES_APUIO0                                          ;838971|8D4021  |002140;
    INY                                                        ;838974|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838975|B70A    |00000A;
    STA.W SNES_APUIO1                                          ;838977|8D4121  |002141;
    INY                                                        ;83897A|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;83897B|B70A    |00000A;
    STA.W SNES_APUIO2                                          ;83897D|8D4221  |002142;
    INY                                                        ;838980|C8      |      ;
    DEX                                                        ;838981|CA      |      ;
    LDA.B #$02                                                 ;838982|A902    |      ;
    STA.W SNES_APUIO3                                          ;838984|8D4321  |002143;
 
.wait6:
    SEP #$20                                                   ;838987|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838989|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;83898C|8593    |000093;
    LDA.W SNES_APUIO3                                          ;83898E|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838991|C593    |000093;
    BNE .wait6                                                 ;838993|D0F2    |838987;
    LDA.B #$00                                                 ;838995|A900    |      ;
    CMP.W SNES_APUIO3                                          ;838997|CD4321  |002143;
    BNE .wait6                                                 ;83899A|D0EB    |838987;
    STZ.W SNES_APUIO3                                          ;83899C|9C4321  |002143;
 
  - SEP #$20                                                   ;83899F|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8389A1|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8389A4|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8389A6|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8389A9|C593    |000093;
    BNE -                                                      ;8389AB|D0F2    |83899F;
 
  - LDA.B #$01                                                 ;8389AD|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8389AF|CD4321  |002143;
    BNE -                                                      ;8389B2|D0F9    |8389AD;
    CPX.W #$0000                                               ;8389B4|E00000  |      ;
    BNE .copyData                                              ;8389B7|D0B6    |83896F;
    REP #$20                                                   ;8389B9|C220    |      ;
    PLY                                                        ;8389BB|7A      |      ;
    PLX                                                        ;8389BC|FA      |      ;
    INX                                                        ;8389BD|E8      |      ;
    INY                                                        ;8389BE|C8      |      ;
    CPX.B strcVariables.n16Temp4                               ;8389BF|E484    |000084;
    BEQ .return                                                ;8389C1|F003    |8389C6;
    JMP.W .loop                                                ;8389C3|4CC087  |8387C0;
 
 
.return:
    RTL                                                        ;8389C6|6B      |      ;
 
 
fAudio_FreeSamplesFromSlot:
    SEP #$20                                                   ;8389C7|E220    |      ;
    PHA                                                        ;8389C9|48      |      ;
    STA.B strcVariables.n8Temp3                                ;8389CA|8594    |000094;
 
  - LDA.B strcVariables.n8Temp3                                ;8389CC|A594    |000094;
    BNE .label1                                                ;8389CE|D005    |8389D5;
    JSR.W fAudio_ReadSpcStatusBits0And4                                 ;8389D0|20C98E  |838EC9;
    BNE -                                                      ;8389D3|D0F7    |8389CC;
 
.label1:
    REP #$10                                                   ;8389D5|C210    |      ;
    LDA.B #$04                                                 ;8389D7|A904    |      ;
    STA.B strcVariables.n8Temp1                                ;8389D9|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;8389DB|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;8389DE|E220    |      ;
    LDA.W SNES_APUIO3                                          ;8389E0|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;8389E3|8593    |000093;
    LDA.W SNES_APUIO3                                          ;8389E5|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;8389E8|C593    |000093;
    BNE .wait1                                                 ;8389EA|D0F2    |8389DE;
    LDA.B #$01                                                 ;8389EC|A901    |      ;
    CMP.W SNES_APUIO3                                          ;8389EE|CD4321  |002143;
    BNE .wait1                                                 ;8389F1|D0EB    |8389DE;
    LDA.B strcVariables.n8Temp3                                ;8389F3|A594    |000094;
    STA.W SNES_APUIO0                                          ;8389F5|8D4021  |002140;
    STZ.W SNES_APUIO1                                          ;8389F8|9C4121  |002141;
    STZ.W SNES_APUIO2                                          ;8389FB|9C4221  |002142;
    LDA.B #$02                                                 ;8389FE|A902    |      ;
    STA.W SNES_APUIO3                                          ;838A00|8D4321  |002143;
 
  - LDA.W SNES_APUIO3                                          ;838A03|AD4321  |002143;
    CMP.B #$08                                                 ;838A06|C908    |      ;
    BEQ +                                                      ;838A08|F002    |838A0C;
    BRA -                                                      ;838A0A|80F7    |838A03;
 
 
  + STZ.W SNES_APUIO3                                          ;838A0C|9C4321  |002143;
    SEP #$20                                                   ;838A0F|E220    |      ;
    LDA.B #$00                                                 ;838A11|A900    |      ;
    XBA                                                        ;838A13|EB      |      ;
    PLA                                                        ;838A14|68      |      ;
    REP #$20                                                   ;838A15|C220    |      ;
    TAX                                                        ;838A17|AA      |      ;
    SEP #$20                                                   ;838A18|E220    |      ;
 
.zeroArray104:
    LDA.B #$00                                                 ;838A1A|A900    |      ;
    STA.W strcAudio.list,X                                     ;838A1C|9D0401  |000104;
    INX                                                        ;838A1F|E8      |      ;
    CPX.W #$000B                                               ;838A20|E00B00  |      ;
    BNE .zeroArray104                                          ;838A23|D0F5    |838A1A;
    RTL                                                        ;838A25|6B      |      ;
 
 
fAudio_UploadTrackData:
    SEP #$20                                                   ;838A26|E220    |      ;
    REP #$10                                                   ;838A28|C210    |      ;
    LDA.B #$05                                                 ;838A2A|A905    |      ;
    STA.B strcVariables.n8Temp1                                ;838A2C|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;838A2E|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;838A31|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838A33|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838A36|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838A38|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838A3B|C593    |000093;
    BNE .wait1                                                 ;838A3D|D0F2    |838A31;
    LDA.B #$01                                                 ;838A3F|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838A41|CD4321  |002143;
    BNE .wait1                                                 ;838A44|D0EB    |838A31;
    LDA.B #$00                                                 ;838A46|A900    |      ;
    XBA                                                        ;838A48|EB      |      ;
    LDA.W strcAudio.trackId                                    ;838A49|AD1001  |000110;
    ASL A                                                      ;838A4C|0A      |      ;
    REP #$20                                                   ;838A4D|C220    |      ;
    TAX                                                        ;838A4F|AA      |      ;
    LDA.L aAudioTrackDataSizeTable,X                               ;838A50|BF4F8F83|838F4F;
    STA.B strcVariables.n16Temp1                               ;838A54|857E    |00007E;
    LDA.W #$0003                                               ;838A56|A90300  |      ;
    STA.B strcVariables.n16Temp2                               ;838A59|8580    |000080;
    JSL.L fMathDivide                                          ;838A5B|22828083|838082;
    STA.B strcVariables.n16Temp2                               ;838A5F|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;838A61|A57E    |00007E;
    BEQ +                                                      ;838A63|F002    |838A67;
    INC.B strcVariables.n16Temp2                               ;838A65|E680    |000080;
 
  + LDA.B strcVariables.n16Temp2                               ;838A67|A580    |000080;
    SEP #$20                                                   ;838A69|E220    |      ;
    STA.W SNES_APUIO0                                          ;838A6B|8D4021  |002140;
    XBA                                                        ;838A6E|EB      |      ;
    STA.W SNES_APUIO1                                          ;838A6F|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838A72|9C4221  |002142;
    LDA.B #$02                                                 ;838A75|A902    |      ;
    STA.W SNES_APUIO3                                          ;838A77|8D4321  |002143;
 
  - LDA.W SNES_APUIO3                                          ;838A7A|AD4321  |002143;
    CMP.B #$04                                                 ;838A7D|C904    |      ;
    BEQ +                                                      ;838A7F|F002    |838A83;
    BRA -                                                      ;838A81|80F7    |838A7A;
 
 
  + LDY.W #$0000                                               ;838A83|A00000  |      ;
    SEP #$20                                                   ;838A86|E220    |      ;
    LDA.B #$00                                                 ;838A88|A900    |      ;
    XBA                                                        ;838A8A|EB      |      ;
    LDA.W strcAudio.trackId                                    ;838A8B|AD1001  |000110;
    REP #$20                                                   ;838A8E|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;838A90|857E    |00007E;
    LDA.W #$000E                                               ;838A92|A90E00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;838A95|22008083|838000;
    TAX                                                        ;838A99|AA      |      ;
    LDA.L sAudioData1_838F83,X                                 ;838A9A|BF838F83|838F83;
    STA.B ptrAudioData                                         ;838A9E|850A    |00000A;
    INX                                                        ;838AA0|E8      |      ;
    INX                                                        ;838AA1|E8      |      ;
    SEP #$20                                                   ;838AA2|E220    |      ;
    LDA.L sAudioData1_838F83,X                                 ;838AA4|BF838F83|838F83;
    STA.B ptrAudioData+2                                       ;838AA8|850C    |00000C;
    REP #$20                                                   ;838AAA|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;838AAC|A580    |000080;
    TAX                                                        ;838AAE|AA      |      ;
 
.loop:
    SEP #$20                                                   ;838AAF|E220    |      ;
    STZ.W SNES_APUIO3                                          ;838AB1|9C4321  |002143;
 
.wait2:
    SEP #$20                                                   ;838AB4|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838AB6|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838AB9|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838ABB|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838ABE|C593    |000093;
    BNE .wait2                                                 ;838AC0|D0F2    |838AB4;
    LDA.B #$01                                                 ;838AC2|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838AC4|CD4321  |002143;
    BNE .wait2                                                 ;838AC7|D0EB    |838AB4;
    LDA.B [ptrAudioData],Y                                     ;838AC9|B70A    |00000A;
    STA.W SNES_APUIO0                                          ;838ACB|8D4021  |002140;
    INY                                                        ;838ACE|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838ACF|B70A    |00000A;
    STA.W SNES_APUIO1                                          ;838AD1|8D4121  |002141;
    INY                                                        ;838AD4|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838AD5|B70A    |00000A;
    STA.W SNES_APUIO2                                          ;838AD7|8D4221  |002142;
    INY                                                        ;838ADA|C8      |      ;
    DEX                                                        ;838ADB|CA      |      ;
    LDA.B #$02                                                 ;838ADC|A902    |      ;
    STA.W SNES_APUIO3                                          ;838ADE|8D4321  |002143;
 
  - SEP #$20                                                   ;838AE1|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838AE3|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838AE6|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838AE8|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838AEB|C593    |000093;
    BNE -                                                      ;838AED|D0F2    |838AE1;
    LDA.B #$00                                                 ;838AEF|A900    |      ;
    CMP.W SNES_APUIO3                                          ;838AF1|CD4321  |002143;
    BNE -                                                      ;838AF4|D0EB    |838AE1;
    STZ.W SNES_APUIO3                                          ;838AF6|9C4321  |002143;
    CPX.W #$0000                                               ;838AF9|E00000  |      ;
    BNE .loop                                                  ;838AFC|D0B1    |838AAF;
    RTL                                                        ;838AFE|6B      |      ;
 
 
fAudio_LoadSfxSample:
    SEP #$20                                                   ;838AFF|E220    |      ;
    REP #$10                                                   ;838B01|C210    |      ;
    LDX.W #$0000                                               ;838B03|A20000  |      ;
    LDA.B #$03                                                 ;838B06|A903    |      ;
    STA.B strcVariables.n8Temp1                                ;838B08|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;838B0A|208B8E  |838E8B;
 
.wait1:
    SEP #$20                                                   ;838B0D|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838B0F|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838B12|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838B14|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838B17|C593    |000093;
    BNE .wait1                                                 ;838B19|D0F2    |838B0D;
    LDA.B #$01                                                 ;838B1B|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838B1D|CD4321  |002143;
    BNE .wait1                                                 ;838B20|D0EB    |838B0D;
    LDA.B #$00                                                 ;838B22|A900    |      ;
    XBA                                                        ;838B24|EB      |      ;
    LDA.W strcAudio.reg114                                     ;838B25|AD1401  |000114;
    TAX                                                        ;838B28|AA      |      ;
    LDA.L aAudioSfxSampleIdTable,X                               ;838B29|BF7F9283|83927F;
    STA.B strcVariables.n8Temp3                                ;838B2D|8594    |000094;
    LDA.W strcAudio.index                                      ;838B2F|AD0301  |000103;
    TAX                                                        ;838B32|AA      |      ;
    LDA.B strcVariables.n8Temp3                                ;838B33|A594    |000094;
    STA.W strcAudio.list,X                                     ;838B35|9D0401  |000104;
    INC.W strcAudio.index                                      ;838B38|EE0301  |000103;
    LDA.B #$00                                                 ;838B3B|A900    |      ;
    XBA                                                        ;838B3D|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;838B3E|A594    |000094;
    REP #$20                                                   ;838B40|C220    |      ;
    STA.B strcVariables.n16Temp1                               ;838B42|857E    |00007E;
    LDA.W #$000A                                               ;838B44|A90A00  |      ;
    JSL.L fMathMultiply_7EbyA                                  ;838B47|22008083|838000;
    TAX                                                        ;838B4B|AA      |      ;
    SEP #$20                                                   ;838B4C|E220    |      ;
    LDA.B strcVariables.n8Temp3                                ;838B4E|A594    |000094;
    STA.W SNES_APUIO0                                          ;838B50|8D4021  |002140;
    REP #$20                                                   ;838B53|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;838B55|BFEF9083|8390EF; X = 0
    SEP #$20                                                   ;838B59|E220    |      ;
    STA.W SNES_APUIO1                                          ;838B5B|8D4121  |002141;
    XBA                                                        ;838B5E|EB      |      ;
    STA.W SNES_APUIO2                                          ;838B5F|8D4221  |002142;
    LDA.B #$02                                                 ;838B62|A902    |      ;
    STA.W SNES_APUIO3                                          ;838B64|8D4321  |002143;
    INX                                                        ;838B67|E8      |      ;
    INX                                                        ;838B68|E8      |      ;
 
.wait2:
    SEP #$20                                                   ;838B69|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838B6B|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838B6E|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838B70|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838B73|C593    |000093;
    BNE .wait2                                                 ;838B75|D0F2    |838B69;
    LDA.W SNES_APUIO3                                          ;838B77|AD4321  |002143;
    CMP.B #$04                                                 ;838B7A|C904    |      ;
    BEQ +                                                      ;838B7C|F002    |838B80;
    BRA .wait2                                                 ;838B7E|80E9    |838B69;
 
 
  + STZ.W SNES_APUIO3                                          ;838B80|9C4321  |002143;
 
  - SEP #$20                                                   ;838B83|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838B85|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838B88|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838B8A|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838B8D|C593    |000093;
    BNE -                                                      ;838B8F|D0F2    |838B83;
 
  - LDA.B #$01                                                 ;838B91|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838B93|CD4321  |002143;
    BNE -                                                      ;838B96|D0F9    |838B91;
    LDA.L sAudioSampleData,X                                   ;838B98|BFEF9083|8390EF; X = 2
    STA.W SNES_APUIO0                                          ;838B9C|8D4021  |002140;
    INX                                                        ;838B9F|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838BA0|BFEF9083|8390EF; X = 3
    STA.W SNES_APUIO1                                          ;838BA4|8D4121  |002141;
    INX                                                        ;838BA7|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838BA8|BFEF9083|8390EF; X = 4
    STA.W SNES_APUIO2                                          ;838BAC|8D4221  |002142;
    LDA.B #$02                                                 ;838BAF|A902    |      ;
    STA.W SNES_APUIO3                                          ;838BB1|8D4321  |002143;
    INX                                                        ;838BB4|E8      |      ;
 
.wait3:
    SEP #$20                                                   ;838BB5|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838BB7|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838BBA|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838BBC|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838BBF|C593    |000093;
    BNE .wait3                                                 ;838BC1|D0F2    |838BB5;
    LDA.W SNES_APUIO3                                          ;838BC3|AD4321  |002143;
    CMP.B #$04                                                 ;838BC6|C904    |      ;
    BEQ +                                                      ;838BC8|F002    |838BCC;
    BRA .wait3                                                 ;838BCA|80E9    |838BB5;
 
 
  + STZ.W SNES_APUIO3                                          ;838BCC|9C4321  |002143;
 
  - SEP #$20                                                   ;838BCF|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838BD1|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838BD4|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838BD6|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838BD9|C593    |000093;
    BNE -                                                      ;838BDB|D0F2    |838BCF;
 
  - LDA.B #$01                                                 ;838BDD|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838BDF|CD4321  |002143;
    BNE -                                                      ;838BE2|D0F9    |838BDD;
    LDA.L sAudioSampleData,X                                   ;838BE4|BFEF9083|8390EF; X = 5
    STA.W SNES_APUIO0                                          ;838BE8|8D4021  |002140;
    INX                                                        ;838BEB|E8      |      ;
    LDA.L sAudioSampleData,X                                   ;838BEC|BFEF9083|8390EF; X = 6
    STA.W SNES_APUIO1                                          ;838BF0|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838BF3|9C4221  |002142;
    LDA.B #$02                                                 ;838BF6|A902    |      ;
    STA.W SNES_APUIO3                                          ;838BF8|8D4321  |002143;
    INX                                                        ;838BFB|E8      |      ;
 
.wait4:
    SEP #$20                                                   ;838BFC|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838BFE|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838C01|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838C03|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838C06|C593    |000093;
    BNE .wait4                                                 ;838C08|D0F2    |838BFC;
    LDA.W SNES_APUIO3                                          ;838C0A|AD4321  |002143;
    CMP.B #$04                                                 ;838C0D|C904    |      ;
    BEQ +                                                      ;838C0F|F002    |838C13;
    BRA .wait4                                                 ;838C11|80E9    |838BFC;
 
 
  + STZ.W SNES_APUIO3                                          ;838C13|9C4321  |002143;
 
  - SEP #$20                                                   ;838C16|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838C18|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838C1B|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838C1D|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838C20|C593    |000093;
    BNE -                                                      ;838C22|D0F2    |838C16;
 
  - LDA.B #$01                                                 ;838C24|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838C26|CD4321  |002143;
    BNE -                                                      ;838C29|D0F9    |838C24;
    REP #$20                                                   ;838C2B|C220    |      ;
    LDA.L sAudioSampleData,X                                   ;838C2D|BFEF9083|8390EF; X = 7
    STA.B ptrAudioData                                         ;838C31|850A    |00000A;
    INX                                                        ;838C33|E8      |      ;
    INX                                                        ;838C34|E8      |      ;
    SEP #$20                                                   ;838C35|E220    |      ;
    LDA.L sAudioSampleData,X                                   ;838C37|BFEF9083|8390EF; X = 9
    STA.B ptrAudioData+2                                       ;838C3B|850C    |00000C;
    LDA.B #$00                                                 ;838C3D|A900    |      ;
    XBA                                                        ;838C3F|EB      |      ;
    LDA.B strcVariables.n8Temp3                                ;838C40|A594    |000094;
    ASL A                                                      ;838C42|0A      |      ;
    REP #$20                                                   ;838C43|C220    |      ;
    TAX                                                        ;838C45|AA      |      ;
    LDA.L aAudioSampleSize,X                                   ;838C46|BFFF8E83|838EFF;
    STA.B strcVariables.n16Temp1                               ;838C4A|857E    |00007E;
    LDA.W #$0003                                               ;838C4C|A90300  |      ;
    STA.B strcVariables.n16Temp2                               ;838C4F|8580    |000080;
    JSL.L fMathDivide                                          ;838C51|22828083|838082;
    STA.B strcVariables.n16Temp2                               ;838C55|8580    |000080;
    LDA.B strcVariables.n16Temp1                               ;838C57|A57E    |00007E;
    BEQ +                                                      ;838C59|F002    |838C5D;
    INC.B strcVariables.n16Temp2                               ;838C5B|E680    |000080;
 
  + LDA.B strcVariables.n16Temp2                               ;838C5D|A580    |000080;
    TAX                                                        ;838C5F|AA      |      ;
    SEP #$20                                                   ;838C60|E220    |      ;
    STA.W SNES_APUIO0                                          ;838C62|8D4021  |002140;
    XBA                                                        ;838C65|EB      |      ;
    STA.W SNES_APUIO1                                          ;838C66|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838C69|9C4221  |002142;
    LDA.B #$02                                                 ;838C6C|A902    |      ;
    STA.W SNES_APUIO3                                          ;838C6E|8D4321  |002143;
    LDY.W #$0000                                               ;838C71|A00000  |      ;
 
.wait5:
    SEP #$20                                                   ;838C74|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838C76|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838C79|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838C7B|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838C7E|C593    |000093;
    BNE .wait5                                                 ;838C80|D0F2    |838C74;
    LDA.W SNES_APUIO3                                          ;838C82|AD4321  |002143;
    CMP.B #$04                                                 ;838C85|C904    |      ;
    BEQ +                                                      ;838C87|F002    |838C8B;
    BRA .wait5                                                 ;838C89|80E9    |838C74;
 
 
  + STZ.W SNES_APUIO3                                          ;838C8B|9C4321  |002143;
 
  - SEP #$20                                                   ;838C8E|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838C90|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838C93|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838C95|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838C98|C593    |000093;
    BNE -                                                      ;838C9A|D0F2    |838C8E;
 
  - LDA.B #$01                                                 ;838C9C|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838C9E|CD4321  |002143;
    BNE -                                                      ;838CA1|D0F9    |838C9C;
 
.copyData:
    SEP #$20                                                   ;838CA3|E220    |      ;
    LDA.B [ptrAudioData],Y                                     ;838CA5|B70A    |00000A;
    STA.W SNES_APUIO0                                          ;838CA7|8D4021  |002140;
    INY                                                        ;838CAA|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838CAB|B70A    |00000A;
    STA.W SNES_APUIO1                                          ;838CAD|8D4121  |002141;
    INY                                                        ;838CB0|C8      |      ;
    LDA.B [ptrAudioData],Y                                     ;838CB1|B70A    |00000A;
    STA.W SNES_APUIO2                                          ;838CB3|8D4221  |002142;
    INY                                                        ;838CB6|C8      |      ;
    DEX                                                        ;838CB7|CA      |      ;
    LDA.B #$02                                                 ;838CB8|A902    |      ;
    STA.W SNES_APUIO3                                          ;838CBA|8D4321  |002143;
 
.wait6:
    SEP #$20                                                   ;838CBD|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838CBF|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838CC2|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838CC4|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838CC7|C593    |000093;
    BNE .wait6                                                 ;838CC9|D0F2    |838CBD;
    LDA.B #$00                                                 ;838CCB|A900    |      ;
    CMP.W SNES_APUIO3                                          ;838CCD|CD4321  |002143;
    BNE .wait6                                                 ;838CD0|D0EB    |838CBD;
    STZ.W SNES_APUIO3                                          ;838CD2|9C4321  |002143;
 
  - SEP #$20                                                   ;838CD5|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838CD7|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838CDA|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838CDC|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838CDF|C593    |000093;
    BNE -                                                      ;838CE1|D0F2    |838CD5;
 
  - LDA.B #$01                                                 ;838CE3|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838CE5|CD4321  |002143;
    BNE -                                                      ;838CE8|D0F9    |838CE3;
    CPX.W #$0000                                               ;838CEA|E00000  |      ;
    BNE .copyData                                              ;838CED|D0B4    |838CA3;
    STZ.W SNES_APUIO3                                          ;838CEF|9C4321  |002143;
    RTL                                                        ;838CF2|6B      |      ;
 
 
fAudioUnused_838CF3:
    SEP #$20                                                   ;838CF3|E220    |      ;
    REP #$10                                                   ;838CF5|C210    |      ;
    STA.B strcVariables.n8Temp3                                ;838CF7|8594    |000094;
    LDA.B #$07                                                 ;838CF9|A907    |      ;
    STA.B strcVariables.n8Temp1                                ;838CFB|8592    |000092;
 
  - LDA.W SNES_APUIO3                                          ;838CFD|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838D00|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838D02|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838D05|C593    |000093;
    BNE -                                                      ;838D07|D0F4    |838CFD;
 
  - LDA.B #$01                                                 ;838D09|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838D0B|CD4321  |002143;
    BNE -                                                      ;838D0E|D0F9    |838D09;
    LDA.B strcVariables.n8Temp1                                ;838D10|A592    |000092;
    STA.W SNES_APUIO0                                          ;838D12|8D4021  |002140;
    STZ.W SNES_APUIO1                                          ;838D15|9C4121  |002141;
    STZ.W SNES_APUIO2                                          ;838D18|9C4221  |002142;
    LDA.B #$02                                                 ;838D1B|A902    |      ;
    STA.W SNES_APUIO3                                          ;838D1D|8D4321  |002143;
 
  - SEP #$20                                                   ;838D20|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838D22|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838D25|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838D27|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838D2A|C593    |000093;
    BNE -                                                      ;838D2C|D0F2    |838D20;
    LDA.B #$04                                                 ;838D2E|A904    |      ;
    CMP.W SNES_APUIO3                                          ;838D30|CD4321  |002143;
    BNE -                                                      ;838D33|D0EB    |838D20;
    STZ.W SNES_APUIO3                                          ;838D35|9C4321  |002143;
    RTL                                                        ;838D38|6B      |      ;
 
 
fAudio_SendStartTrackCommand:
    JSR.W fAudio_ReadSpcStatusBits0And4                                 ;838D39|20C98E  |838EC9;
    BNE fAudio_SendStartTrackCommand                                   ;838D3C|D0FB    |838D39;
    SEP #$20                                                   ;838D3E|E220    |      ;
    LDA.B #$08                                                 ;838D40|A908    |      ;
    STA.B strcVariables.n8Temp1                                ;838D42|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;838D44|208B8E  |838E8B;
 
  - SEP #$20                                                   ;838D47|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838D49|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838D4C|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838D4E|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838D51|C593    |000093;
    BNE -                                                      ;838D53|D0F2    |838D47;
    LDA.B #$01                                                 ;838D55|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838D57|CD4321  |002143;
    BNE -                                                      ;838D5A|D0EB    |838D47;
    LDA.W strcAudio.unk111                                     ;838D5C|AD1101  |000111;
    STA.W SNES_APUIO0                                          ;838D5F|8D4021  |002140;
    LDA.W strcAudio.unk113                                     ;838D62|AD1301  |000113;
    STA.W SNES_APUIO1                                          ;838D65|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838D68|9C4221  |002142;
    LDA.B #$02                                                 ;838D6B|A902    |      ;
    STA.W SNES_APUIO3                                          ;838D6D|8D4321  |002143;
 
  - SEP #$20                                                   ;838D70|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838D72|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838D75|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838D77|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838D7A|C593    |000093;
    BNE -                                                      ;838D7C|D0F2    |838D70;
    LDA.W SNES_APUIO3                                          ;838D7E|AD4321  |002143;
    CMP.B #$08                                                 ;838D81|C908    |      ;
    BEQ +                                                      ;838D83|F002    |838D87;
    BRA -                                                      ;838D85|80E9    |838D70;
 
 
  + STZ.W SNES_APUIO3                                          ;838D87|9C4321  |002143;
    RTL                                                        ;838D8A|6B      |      ;
 
 
fAudio_SendFadeOutCommand:
    SEP #$20                                                   ;838D8B|E220    |      ;
    JSR.W fAudio_ReadSpcStatusBits0And4                                 ;838D8D|20C98E  |838EC9;
    BEQ .return                                                ;838D90|F04C    |838DDE;
    SEP #$20                                                   ;838D92|E220    |      ;
    LDA.B #$09                                                 ;838D94|A909    |      ;
    STA.B strcVariables.n8Temp1                                ;838D96|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;838D98|208B8E  |838E8B;
 
  - SEP #$20                                                   ;838D9B|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838D9D|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838DA0|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838DA2|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838DA5|C593    |000093;
    BNE -                                                      ;838DA7|D0F2    |838D9B;
    LDA.B #$01                                                 ;838DA9|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838DAB|CD4321  |002143;
    BNE -                                                      ;838DAE|D0EB    |838D9B;
    LDA.W strcAudio.unk112                                     ;838DB0|AD1201  |000112;
    STA.W SNES_APUIO0                                          ;838DB3|8D4021  |002140;
    LDA.W strcAudio.unk113                                     ;838DB6|AD1301  |000113;
    STA.W SNES_APUIO1                                          ;838DB9|8D4121  |002141;
    STZ.W SNES_APUIO2                                          ;838DBC|9C4221  |002142;
    LDA.B #$02                                                 ;838DBF|A902    |      ;
    STA.W SNES_APUIO3                                          ;838DC1|8D4321  |002143;
 
  - SEP #$20                                                   ;838DC4|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838DC6|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838DC9|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838DCB|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838DCE|C593    |000093;
    BNE -                                                      ;838DD0|D0F2    |838DC4;
    LDA.W SNES_APUIO3                                          ;838DD2|AD4321  |002143;
    CMP.B #$08                                                 ;838DD5|C908    |      ;
    BEQ +                                                      ;838DD7|F002    |838DDB;
    BRA -                                                      ;838DD9|80E9    |838DC4;
 
 
  + STZ.W SNES_APUIO3                                          ;838DDB|9C4321  |002143;
 
.return:
    RTL                                                        ;838DDE|6B      |      ;
 
 
fAudio_SendPlaySfxCommand:
    JSR.W fAudio_ReadSpcStatusBit4                                 ;838DDF|20E48E  |838EE4; A: nArg1
    BNE .return                                                ;838DE2|D04D    |838E31;
    SEP #$20                                                   ;838DE4|E220    |      ;
    LDA.B #$0A                                                 ;838DE6|A90A    |      ;
    STA.B strcVariables.n8Temp1                                ;838DE8|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;838DEA|208B8E  |838E8B;
 
  - SEP #$20                                                   ;838DED|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838DEF|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838DF2|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838DF4|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838DF7|C593    |000093;
    BNE -                                                      ;838DF9|D0F2    |838DED;
    LDA.B #$01                                                 ;838DFB|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838DFD|CD4321  |002143;
    BNE -                                                      ;838E00|D0EB    |838DED;
    LDA.W strcAudio.reg114                                     ;838E02|AD1401  |000114;
    STA.W SNES_APUIO0                                          ;838E05|8D4021  |002140;
    LDA.W strcAudio.reg115                                     ;838E08|AD1501  |000115;
    STA.W SNES_APUIO1                                          ;838E0B|8D4121  |002141;
    LDA.W strcAudio.reg116                                     ;838E0E|AD1601  |000116;
    STA.W SNES_APUIO2                                          ;838E11|8D4221  |002142;
    LDA.B #$02                                                 ;838E14|A902    |      ;
    STA.W SNES_APUIO3                                          ;838E16|8D4321  |002143;
 
  - SEP #$20                                                   ;838E19|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838E1B|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838E1E|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838E20|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838E23|C593    |000093;
    BNE -                                                      ;838E25|D0F2    |838E19;
    LDA.W SNES_APUIO3                                          ;838E27|AD4321  |002143;
    CMP.B #$08                                                 ;838E2A|C908    |      ;
    BNE -                                                      ;838E2C|D0EB    |838E19;
    STZ.W SNES_APUIO3                                          ;838E2E|9C4321  |002143;
 
.return:
    RTL                                                        ;838E31|6B      |      ;
 
 
fAudio_SendCommand0B:
    SEP #$20                                                   ;838E32|E220    |      ;
    STA.B strcVariables.n8Temp3                                ;838E34|8594    |000094;
    REP #$10                                                   ;838E36|C210    |      ;
    LDA.B #$0B                                                 ;838E38|A90B    |      ;
    STA.B strcVariables.n8Temp1                                ;838E3A|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;838E3C|208B8E  |838E8B;
 
  - SEP #$20                                                   ;838E3F|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838E41|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838E44|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838E46|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838E49|C593    |000093;
    BNE -                                                      ;838E4B|D0F2    |838E3F;
    LDA.B #$01                                                 ;838E4D|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838E4F|CD4321  |002143;
    BNE -                                                      ;838E52|D0EB    |838E3F;
    LDA.B strcVariables.n8Temp3                                ;838E54|A594    |000094;
    STA.W SNES_APUIO0                                          ;838E56|8D4021  |002140;
    STZ.W SNES_APUIO1                                          ;838E59|9C4121  |002141;
    STZ.W SNES_APUIO2                                          ;838E5C|9C4221  |002142;
    LDA.B #$02                                                 ;838E5F|A902    |      ;
    STA.W SNES_APUIO3                                          ;838E61|8D4321  |002143;
 
  - SEP #$20                                                   ;838E64|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838E66|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838E69|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838E6B|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838E6E|C593    |000093;
    BNE -                                                      ;838E70|D0F2    |838E64;
    LDA.W SNES_APUIO3                                          ;838E72|AD4321  |002143;
    CMP.B #$08                                                 ;838E75|C908    |      ;
    BEQ +                                                      ;838E77|F002    |838E7B;
    BRA -                                                      ;838E79|80E9    |838E64;
 
 
  + STZ.W SNES_APUIO3                                          ;838E7B|9C4321  |002143;
    RTL                                                        ;838E7E|6B      |      ;
 
    SEP #$20                                                   ;838E7F|E220    |      ;
    REP #$10                                                   ;838E81|C210    |      ;
    LDA.B #$0C                                                 ;838E83|A90C    |      ;
    STA.B strcVariables.n8Temp1                                ;838E85|8592    |000092;
    JSR.W fAudio_SendSpcCommand                                 ;838E87|208B8E  |838E8B;
    RTL                                                        ;838E8A|6B      |      ;
 
 
fAudio_SendSpcCommand:
    SEP #$20                                                   ;838E8B|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838E8D|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838E90|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838E92|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838E95|C593    |000093;
    BNE fAudio_SendSpcCommand                                   ;838E97|D0F2    |838E8B;
 
  - LDA.B #$01                                                 ;838E99|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838E9B|CD4321  |002143;
    BNE -                                                      ;838E9E|D0F9    |838E99;
    LDA.B strcVariables.n8Temp1                                ;838EA0|A592    |000092;
    STA.W SNES_APUIO0                                          ;838EA2|8D4021  |002140;
    STZ.W SNES_APUIO1                                          ;838EA5|9C4121  |002141;
    STZ.W SNES_APUIO2                                          ;838EA8|9C4221  |002142;
    LDA.B #$02                                                 ;838EAB|A902    |      ;
    STA.W SNES_APUIO3                                          ;838EAD|8D4321  |002143;
 
  - LDA.W SNES_APUIO3                                          ;838EB0|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838EB3|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838EB5|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838EB8|C593    |000093;
    BNE -                                                      ;838EBA|D0F4    |838EB0;
 
  - LDA.W SNES_APUIO3                                          ;838EBC|AD4321  |002143;
    CMP.B #$04                                                 ;838EBF|C904    |      ;
    BEQ +                                                      ;838EC1|F002    |838EC5;
    BRA -                                                      ;838EC3|80F7    |838EBC;
 
 
  + STZ.W SNES_APUIO3                                          ;838EC5|9C4321  |002143;
    RTS                                                        ;838EC8|60      |      ;
 
 
fAudio_ReadSpcStatusBits0And4:
    SEP #$20                                                   ;838EC9|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838ECB|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838ECE|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838ED0|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838ED3|C593    |000093;
    BNE fAudio_ReadSpcStatusBits0And4                                   ;838ED5|D0F2    |838EC9;
    LDA.B #$01                                                 ;838ED7|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838ED9|CD4321  |002143;
    BNE fAudio_ReadSpcStatusBits0And4                                   ;838EDC|D0EB    |838EC9;
    LDA.W SNES_APUIO0                                          ;838EDE|AD4021  |002140;
    AND.B #$11                                                 ;838EE1|2911    |      ;
    RTS                                                        ;838EE3|60      |      ;
 
 
fAudio_ReadSpcStatusBit4:
    SEP #$20                                                   ;838EE4|E220    |      ;
    LDA.W SNES_APUIO3                                          ;838EE6|AD4321  |002143;
    STA.B strcVariables.n8Temp2                                ;838EE9|8593    |000093;
    LDA.W SNES_APUIO3                                          ;838EEB|AD4321  |002143;
    CMP.B strcVariables.n8Temp2                                ;838EEE|C593    |000093;
    BNE fAudio_ReadSpcStatusBit4                                   ;838EF0|D0F2    |838EE4;
    LDA.B #$01                                                 ;838EF2|A901    |      ;
    CMP.W SNES_APUIO3                                          ;838EF4|CD4321  |002143;
    BNE fAudio_ReadSpcStatusBit4                                   ;838EF7|D0EB    |838EE4;
    LDA.W SNES_APUIO0                                          ;838EF9|AD4021  |002140;
    AND.B #$10                                                 ;838EFC|2910    |      ;
    RTS                                                        ;838EFE|60      |      ;
 
 
; The sample/track tables below (sample sizes, track sizes, track table, sample table, SFX sample ids, common samples)
; are generated from assets/audio by tools/audio/audioconv.py build (run by tools/build_assets.py).
    incsrc "../../../build/gen/audio/audio_tables.inc"
