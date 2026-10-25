; Bank $84 module "input" - starts at $84C034
 
fInput_Handler:
    SEP #$20                                                   ;84C034|E220    |      ;
    REP #$10                                                   ;84C036|C210    |      ;
    LDA.W strcDialogDisplay.mapUnk19A                          ;84C038|AD9A01  |00019A;
    CMP.B #$01                                                 ;84C03B|C901    |      ;
    BNE +                                                      ;84C03D|D003    |84C042;
    JMP.W fInput_Handler_case01                                ;84C03F|4CB7C6  |84C6B7;
 
 
  + CMP.B #$02                                                 ;84C042|C902    |      ;
    BNE +                                                      ;84C044|D003    |84C049;
    JMP.W fInput_DialogHandler                                 ;84C046|4C05CF  |84CF05;
 
 
  + CMP.B #$03                                                 ;84C049|C903    |      ;
    BNE +                                                      ;84C04B|D003    |84C050;
    JMP.W fInput_Handler_case03                                ;84C04D|4C40C5  |84C540;
 
 
  + CMP.B #$04                                                 ;84C050|C904    |      ;
    BNE +                                                      ;84C052|D003    |84C057;
    JMP.W fInput_Handler_case04                                ;84C054|4C88C2  |84C288;
 
 
  + CMP.B #$05                                                 ;84C057|C905    |      ;
    BNE +                                                      ;84C059|D003    |84C05E;
    JMP.W fNameInput_ControlsHandler                           ;84C05B|4C66C0  |84C066;
 
 
  + CMP.B #$06                                                 ;84C05E|C906    |      ;
    BNE +                                                      ;84C060|D003    |84C065;
    JMP.W fInput_Handler_case06                                ;84C062|4CD2CE  |84CED2;
 
 
  + RTL                                                        ;84C065|6B      |      ;
 
 
fNameInput_ControlsHandler:
    REP #$30                                                   ;84C066|C230    |      ;
    LDA.W strcJoypad1.autorepeat                               ;84C068|AD2C01  |00012C;
    BIT.W #!JOYPAD_DOWN                                               
    BEQ +                                                      ;84C06E|F003    |84C073;
    JMP.W fNameInput_DownButton                                ;84C070|4C04C2  |84C204;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C073|AD2C01  |00012C;
    BIT.W #!JOYPAD_UP                                               
    BEQ +                                                      ;84C079|F003    |84C07E;
    JMP.W fNameInput_UpButton                                  ;84C07B|4C25C2  |84C225;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C07E|AD2C01  |00012C;
    BIT.W #!JOYPAD_RIGHT                                               
    BEQ +                                                      ;84C084|F003    |84C089;
    JMP.W fNameInput_RightButton                               ;84C086|4C46C2  |84C246;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C089|AD2C01  |00012C;
    BIT.W #!JOYPAD_LEFT                                               
    BEQ +                                                      ;84C08F|F003    |84C094;
    JMP.W fNameInput_LeftButton                                ;84C091|4C67C2  |84C267;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C094|AD2801  |000128;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;84C09A|F003    |84C09F;
    JMP.W fNameInput_BButton                                   ;84C09C|4CABC0  |84C0AB;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C09F|AD2801  |000128;
    BIT.W #!JOYPAD_A                                               
    BEQ .return                                                ;84C0A5|F003    |84C0AA;
    JMP.W fNameInput_AButton                                   ;84C0A7|4CEEC0  |84C0EE;
 
 
.return:
    RTL                                                        ;84C0AA|6B      |      ;
 
 
fNameInput_BButton:
    SEP #$20                                                   ;84C0AB|E220    |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;84C0AD|AD9409  |000994;
    BEQ .label2                                                ;84C0B0|F029    |84C0DB;
    CMP.B #$04                                                 ;84C0B2|C904    |      ;
    BEQ .label1                                                ;84C0B4|F009    |84C0BF;
    REP #$20                                                   ;84C0B6|C220    |      ;
    LDA.W #$00A8                                               ;84C0B8|A9A800  |      ;
    JSL.L fTextUnknown_82EA60                                  ;84C0BB|2260EA82|82EA60;
 
.label1:
    SEP #$20                                                   ;84C0BF|E220    |      ;
    LDA.B #$00                                                 ;84C0C1|A900    |      ;
    XBA                                                        ;84C0C3|EB      |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;84C0C4|AD9409  |000994;
    DEC A                                                      ;84C0C7|3A      |      ;
    REP #$20                                                   ;84C0C8|C220    |      ;
    TAX                                                        ;84C0CA|AA      |      ;
    SEP #$20                                                   ;84C0CB|E220    |      ;
    LDA.B #$B1                                                 ;84C0CD|A9B1    |      ;
    STA.W strcNames.sTemp,X                                    ;84C0CF|9D8508  |000885;
    SEP #$20                                                   ;84C0D2|E220    |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;84C0D4|AD9409  |000994;
    DEC A                                                      ;84C0D7|3A      |      ;
    STA.W strcMenuData.nameEntryIdx                            ;84C0D8|8D9409  |000994;
 
.label2:
    SEP #$20                                                   ;84C0DB|E220    |      ;
    REP #$10                                                   ;84C0DD|C210    |      ;
    LDA.B #$02                                                 ;84C0DF|A902    |      ;
    STA.W strcAudio.reg114                                     ;84C0E1|8D1401  |000114;
    LDA.B #$06                                                 ;84C0E4|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C0E6|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C0E9|22328383|838332;
    RTL                                                        ;84C0ED|6B      |      ;
 
 
fNameInput_AButton:
    REP #$20                                                   ;84C0EE|C220    |      ;
    LDA.W #$0005                                               ;84C0F0|A90500  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C0F3|22ACEB82|82EBAC;
    REP #$20                                                   ;84C0F7|C220    |      ;
    CMP.W #$0001                                               ;84C0F9|C90100  |      ;
    BEQ fNameInput_SelectCharTable0                                   ;84C0FC|F059    |84C157;
    CMP.W #$0002                                               ;84C0FE|C90200  |      ;
    BEQ fNameInput_SelectCharTable1                                   ;84C101|F07B    |84C17E;
    CMP.W #$0003                                               ;84C103|C90300  |      ;
    BNE +                                                      ;84C106|D003    |84C10B;
    JMP.W fNameInput_SelectCharTable2                                 ;84C108|4CA8C1  |84C1A8;
 
 
  + CMP.W #$0004                                               ;84C10B|C90400  |      ;
    BNE +                                                      ;84C10E|D003    |84C113;
    JMP.W fNameInput_SelectCharTable3                                 ;84C110|4CD2C1  |84C1D2;
 
 
  + SEP #$20                                                   ;84C113|E220    |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;84C115|AD9409  |000994;
    CMP.B #$04                                                 ;84C118|C904    |      ;
    BEQ .lastLetterInput                                       ;84C11A|F028    |84C144;
    REP #$20                                                   ;84C11C|C220    |      ;
    LDA.W #$0004                                               ;84C11E|A90400  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C121|22ACEB82|82EBAC;
    SEP #$20                                                   ;84C125|E220    |      ;
    PHA                                                        ;84C127|48      |      ;
    LDA.B #$00                                                 ;84C128|A900    |      ;
    XBA                                                        ;84C12A|EB      |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;84C12B|AD9409  |000994;
    REP #$20                                                   ;84C12E|C220    |      ;
    TAX                                                        ;84C130|AA      |      ;
    SEP #$20                                                   ;84C131|E220    |      ;
    PLA                                                        ;84C133|68      |      ;
    STA.W strcNames.sTemp,X                                    ;84C134|9D8508  |000885;
    JSL.L fTextUnknown_82EA60                                  ;84C137|2260EA82|82EA60;
    SEP #$20                                                   ;84C13B|E220    |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;84C13D|AD9409  |000994;
    INC A                                                      ;84C140|1A      |      ;
    STA.W strcMenuData.nameEntryIdx                            ;84C141|8D9409  |000994;
 
.lastLetterInput:
    SEP #$20                                                   ;84C144|E220    |      ;
    REP #$10                                                   ;84C146|C210    |      ;
    LDA.B #$01                                                 ;84C148|A901    |      ;
    STA.W strcAudio.reg114                                     ;84C14A|8D1401  |000114;
    LDA.B #$06                                                 ;84C14D|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C14F|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C152|22328383|838332;
    RTL                                                        ;84C156|6B      |      ;
 
 
fNameInput_SelectCharTable0:
    SEP #$20                                                   ;84C157|E220    |      ;
    LDA.B #$00                                                 ;84C159|A900    |      ;
    STA.W strcMenuData.tableSelector                           ;84C15B|8D9309  |000993;
    REP #$20                                                   ;84C15E|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;84C160|9C3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;84C163|9C3E01  |00013E;
    REP #$20                                                   ;84C166|C220    |      ;
    STZ.W strcMenuData.menuIdx                                 ;84C168|9C9109  |000991;
    SEP #$20                                                   ;84C16B|E220    |      ;
    REP #$10                                                   ;84C16D|C210    |      ;
    LDA.B #$01                                                 ;84C16F|A901    |      ;
    STA.W strcAudio.reg114                                     ;84C171|8D1401  |000114;
    LDA.B #$06                                                 ;84C174|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C176|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C179|22328383|838332;
    RTL                                                        ;84C17D|6B      |      ;
 
 
fNameInput_SelectCharTable1:
    SEP #$20                                                   ;84C17E|E220    |      ;
    LDA.B #$01                                                 ;84C180|A901    |      ;
    STA.W strcMenuData.tableSelector                           ;84C182|8D9309  |000993;
    REP #$20                                                   ;84C185|C220    |      ;
    LDA.W #$0100                                               ;84C187|A90001  |      ;
    STA.W strcBGScrool.BG1HorOffs                              ;84C18A|8D3C01  |00013C;
    STZ.W strcBGScrool.BG1VerOffs                              ;84C18D|9C3E01  |00013E;
    REP #$20                                                   ;84C190|C220    |      ;
    STZ.W strcMenuData.menuIdx                                 ;84C192|9C9109  |000991;
    SEP #$20                                                   ;84C195|E220    |      ;
    REP #$10                                                   ;84C197|C210    |      ;
    LDA.B #$01                                                 ;84C199|A901    |      ;
    STA.W strcAudio.reg114                                     ;84C19B|8D1401  |000114;
    LDA.B #$06                                                 ;84C19E|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C1A0|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C1A3|22328383|838332;
    RTL                                                        ;84C1A7|6B      |      ;
 
 
fNameInput_SelectCharTable2:
    SEP #$20                                                   ;84C1A8|E220    |      ;
    LDA.B #$02                                                 ;84C1AA|A902    |      ;
    STA.W strcMenuData.tableSelector                           ;84C1AC|8D9309  |000993;
    REP #$20                                                   ;84C1AF|C220    |      ;
    STZ.W strcBGScrool.BG1HorOffs                              ;84C1B1|9C3C01  |00013C;
    LDA.W #$0100                                               ;84C1B4|A90001  |      ;
    STA.W strcBGScrool.BG1VerOffs                              ;84C1B7|8D3E01  |00013E;
    REP #$20                                                   ;84C1BA|C220    |      ;
    STZ.W strcMenuData.menuIdx                                 ;84C1BC|9C9109  |000991;
    SEP #$20                                                   ;84C1BF|E220    |      ;
    REP #$10                                                   ;84C1C1|C210    |      ;
    LDA.B #$01                                                 ;84C1C3|A901    |      ;
    STA.W strcAudio.reg114                                     ;84C1C5|8D1401  |000114;
    LDA.B #$06                                                 ;84C1C8|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C1CA|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C1CD|22328383|838332;
    RTL                                                        ;84C1D1|6B      |      ;
 
 
fNameInput_SelectCharTable3:
    SEP #$20                                                   ;84C1D2|E220    |      ;
    LDA.W strcMenuData.nameEntryIdx                            ;84C1D4|AD9409  |000994;
    BEQ +                                                      ;84C1D7|F018    |84C1F1;
    LDA.B #$03                                                 ;84C1D9|A903    |      ;
    STA.W strcMenuData.tableSelector                           ;84C1DB|8D9309  |000993;
    SEP #$20                                                   ;84C1DE|E220    |      ;
    REP #$10                                                   ;84C1E0|C210    |      ;
    LDA.B #$01                                                 ;84C1E2|A901    |      ;
    STA.W strcAudio.reg114                                     ;84C1E4|8D1401  |000114;
    LDA.B #$06                                                 ;84C1E7|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C1E9|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C1EC|22328383|838332;
    RTL                                                        ;84C1F0|6B      |      ;
 
 
  + SEP #$20                                                   ;84C1F1|E220    |      ;
    REP #$10                                                   ;84C1F3|C210    |      ;
    LDA.B #$02                                                 ;84C1F5|A902    |      ;
    STA.W strcAudio.reg114                                     ;84C1F7|8D1401  |000114;
    LDA.B #$06                                                 ;84C1FA|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C1FC|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C1FF|22328383|838332;
    RTL                                                        ;84C203|6B      |      ;
 
 
fNameInput_DownButton:
    REP #$20                                                   ;84C204|C220    |      ;
    LDA.W #$0000                                               ;84C206|A90000  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C209|22ACEB82|82EBAC;
    REP #$20                                                   ;84C20D|C220    |      ;
    STA.W strcMenuData.menuIdx                                 ;84C20F|8D9109  |000991;
    SEP #$20                                                   ;84C212|E220    |      ;
    REP #$10                                                   ;84C214|C210    |      ;
    LDA.B #$03                                                 ;84C216|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C218|8D1401  |000114;
    LDA.B #$06                                                 ;84C21B|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C21D|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C220|22328383|838332;
    RTL                                                        ;84C224|6B      |      ;
 
 
fNameInput_UpButton:
    REP #$20                                                   ;84C225|C220    |      ;
    LDA.W #$0001                                               ;84C227|A90100  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C22A|22ACEB82|82EBAC;
    REP #$20                                                   ;84C22E|C220    |      ;
    STA.W strcMenuData.menuIdx                                 ;84C230|8D9109  |000991;
    SEP #$20                                                   ;84C233|E220    |      ;
    REP #$10                                                   ;84C235|C210    |      ;
    LDA.B #$03                                                 ;84C237|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C239|8D1401  |000114;
    LDA.B #$06                                                 ;84C23C|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C23E|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C241|22328383|838332;
    RTL                                                        ;84C245|6B      |      ;
 
 
fNameInput_RightButton:
    REP #$20                                                   ;84C246|C220    |      ;
    LDA.W #$0002                                               ;84C248|A90200  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C24B|22ACEB82|82EBAC;
    REP #$20                                                   ;84C24F|C220    |      ;
    STA.W strcMenuData.menuIdx                                 ;84C251|8D9109  |000991;
    SEP #$20                                                   ;84C254|E220    |      ;
    REP #$10                                                   ;84C256|C210    |      ;
    LDA.B #$03                                                 ;84C258|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C25A|8D1401  |000114;
    LDA.B #$06                                                 ;84C25D|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C25F|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C262|22328383|838332;
    RTL                                                        ;84C266|6B      |      ;
 
 
fNameInput_LeftButton:
    REP #$20                                                   ;84C267|C220    |      ;
    LDA.W #$0003                                               ;84C269|A90300  |      ;
    JSL.L fMenuUnknown_82EBAC                                  ;84C26C|22ACEB82|82EBAC;
    REP #$20                                                   ;84C270|C220    |      ;
    STA.W strcMenuData.menuIdx                                 ;84C272|8D9109  |000991;
    SEP #$20                                                   ;84C275|E220    |      ;
    REP #$10                                                   ;84C277|C210    |      ;
    LDA.B #$03                                                 ;84C279|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C27B|8D1401  |000114;
    LDA.B #$06                                                 ;84C27E|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C280|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C283|22328383|838332;
    RTL                                                        ;84C287|6B      |      ;
 
 
fInput_Handler_case04:
    SEP #$20                                                   ;84C288|E220    |      ;
    LDA.B strcVariables.n8Temp4                                ;84C28A|A595    |000095;
    CMP.B #$01                                                 ;84C28C|C901    |      ;
    BNE +                                                      ;84C28E|D003    |84C293;
    JMP.W fInput_Case04_State1                                 ;84C290|4CB4C2  |84C2B4;
 
 
  + CMP.B #$02                                                 ;84C293|C902    |      ;
    BNE +                                                      ;84C295|D003    |84C29A;
    JMP.W fInput_Case04_StartToState6                                 ;84C297|4C28C4  |84C428;
 
 
  + CMP.B #$03                                                 ;84C29A|C903    |      ;
    BNE +                                                      ;84C29C|D003    |84C2A1;
    JMP.W fInput_Case04_StartToState6                                 ;84C29E|4C28C4  |84C428;
 
 
  + CMP.B #$05                                                 ;84C2A1|C905    |      ;
    BNE +                                                      ;84C2A3|D003    |84C2A8;
    JMP.W fInput_Case04_State5_ThreeWayChoice                                 ;84C2A5|4C58C4  |84C458;
 
 
  + CMP.B #$07                                                 ;84C2A8|C907    |      ;
    BEQ fInput_Case04_State7_ToggleChoice                                   ;84C2AA|F052    |84C2FE;
    CMP.B #$08                                                 ;84C2AC|C908    |      ;
    BNE +                                                      ;84C2AE|D003    |84C2B3;
    JMP.W fInput_Case04_State8_LoadChoice                                  ;84C2B0|4C80C3  |84C380;
 
 
  + RTL                                                        ;84C2B3|6B      |      ;
 
 
fInput_Case04_State1:
    %CheckPlayerAction(!PACTION_JUMP)
    BEQ +                                                      ;84C2BB|F004    |84C2C1;
    JSL.L fInput_AIJoypadHandler                               ;84C2BD|22D6C784|84C7D6;
 
  + REP #$30                                                   ;84C2C1|C230    |      ;
    %CheckFlag(daily1, $8000)
    BEQ .justReturn                                            ;84C2CA|F00B    |84C2D7;
    LDA.W strcJoypad1.newInput                                 ;84C2CC|AD2801  |000128;
    BIT.W #!JOYPAD_START                                               
    BEQ .justReturn                                            ;84C2D2|F003    |84C2D7;
    JMP.W $C2D8                                                ;84C2D4|4CD8C2  |84C2D8;
 
 
.justReturn:
    RTL                                                        ;84C2D7|6B      |      ;
 
 
  + SEP #$20                                                   ;84C2D8|E220    |      ;
    LDA.B #$09                                                 ;84C2DA|A909    |      ;
    STA.B strcVariables.n8Temp4                                ;84C2DC|8595    |000095;
    SEP #$20                                                   ;84C2DE|E220    |      ;
    REP #$10                                                   ;84C2E0|C210    |      ;
    LDA.B #$03                                                 ;84C2E2|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C2E4|8D1401  |000114;
    LDA.B #$06                                                 ;84C2E7|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C2E9|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C2EC|22328383|838332;
    REP #$20                                                   ;84C2F0|C220    |      ;
    %SetFlag(daily2, $0004)
    RTL                                                        ;84C2FD|6B      |      ;
 
 
fInput_Case04_State7_ToggleChoice:
    REP #$30                                                   ;84C2FE|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84C300|AD2801  |000128;
    BIT.W #!JOYPAD_DOWN                                               
    BEQ +                                                      ;84C306|F003    |84C30B;
    JMP.W .label1                                              ;84C308|4C2DC3  |84C32D;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C30B|AD2801  |000128;
    BIT.W #!JOYPAD_UP                                               
    BEQ +                                                      ;84C311|F003    |84C316;
    JMP.W .label1                                              ;84C313|4C2DC3  |84C32D;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C316|AD2801  |000128;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;84C31C|F003    |84C321;
    JMP.W .label2                                              ;84C31E|4C4EC3  |84C34E;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C321|AD2801  |000128;
    BIT.W #!JOYPAD_A                                               
    BEQ .justReturn                                            ;84C327|F003    |84C32C;
    JMP.W .label3                                              ;84C329|4C67C3  |84C367;
 
 
.justReturn:
    RTL                                                        ;84C32C|6B      |      ;
 
 
.label1:
    SEP #$20                                                   ;84C32D|E220    |      ;
    LDA.W $098E                                                ;84C32F|AD8E09  |00098E;
    EOR.B #$01                                                 ;84C332|4901    |      ;
    STA.W $098E                                                ;84C334|8D8E09  |00098E;
    LDA.B #$01                                                 ;84C337|A901    |      ;
    STA.B strcVariables.u8Unk97                                ;84C339|8597    |000097;
    SEP #$20                                                   ;84C33B|E220    |      ;
    REP #$10                                                   ;84C33D|C210    |      ;
    LDA.B #$03                                                 ;84C33F|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C341|8D1401  |000114;
    LDA.B #$06                                                 ;84C344|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C346|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C349|22328383|838332;
    RTL                                                        ;84C34D|6B      |      ;
 
 
.label2:
    SEP #$20                                                   ;84C34E|E220    |      ;
    LDA.B #$01                                                 ;84C350|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;84C352|8594    |000094;
    SEP #$20                                                   ;84C354|E220    |      ;
    REP #$10                                                   ;84C356|C210    |      ;
    LDA.B #$03                                                 ;84C358|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C35A|8D1401  |000114;
    LDA.B #$06                                                 ;84C35D|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C35F|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C362|22328383|838332;
    RTL                                                        ;84C366|6B      |      ;
 
 
.label3:
    SEP #$20                                                   ;84C367|E220    |      ;
    LDA.B #$02                                                 ;84C369|A902    |      ;
    STA.B strcVariables.n8Temp3                                ;84C36B|8594    |000094;
    SEP #$20                                                   ;84C36D|E220    |      ;
    REP #$10                                                   ;84C36F|C210    |      ;
    LDA.B #$01                                                 ;84C371|A901    |      ;
    STA.W strcAudio.reg114                                     ;84C373|8D1401  |000114;
    LDA.B #$06                                                 ;84C376|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C378|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C37B|22328383|838332;
    RTL                                                        ;84C37F|6B      |      ;
 
 
fInput_Case04_State8_LoadChoice:
    REP #$30                                                   ;84C380|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84C382|AD2801  |000128;
    BIT.W #!JOYPAD_DOWN                                               
    BEQ +                                                      ;84C388|F003    |84C38D;
    JMP.W .label1                                              ;84C38A|4CAFC3  |84C3AF;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C38D|AD2801  |000128;
    BIT.W #!JOYPAD_UP                                               
    BEQ +                                                      ;84C393|F003    |84C398;
    JMP.W .label1                                              ;84C395|4CAFC3  |84C3AF;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C398|AD2801  |000128;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;84C39E|F003    |84C3A3;
    JMP.W .label2                                              ;84C3A0|4CD0C3  |84C3D0;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C3A3|AD2801  |000128;
    BIT.W #!JOYPAD_A                                               
    BEQ .justReturn                                            ;84C3A9|F003    |84C3AE;
    JMP.W .label3                                              ;84C3AB|4CE9C3  |84C3E9;
 
 
.justReturn:
    RTL                                                        ;84C3AE|6B      |      ;
 
 
.label1:
    SEP #$20                                                   ;84C3AF|E220    |      ;
    LDA.W $098E                                                ;84C3B1|AD8E09  |00098E;
    EOR.B #$01                                                 ;84C3B4|4901    |      ;
    STA.W $098E                                                ;84C3B6|8D8E09  |00098E;
    LDA.B #$01                                                 ;84C3B9|A901    |      ;
    STA.B strcVariables.u8Unk97                                ;84C3BB|8597    |000097;
    SEP #$20                                                   ;84C3BD|E220    |      ;
    REP #$10                                                   ;84C3BF|C210    |      ;
    LDA.B #$03                                                 ;84C3C1|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C3C3|8D1401  |000114;
    LDA.B #$06                                                 ;84C3C6|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C3C8|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C3CB|22328383|838332;
    RTL                                                        ;84C3CF|6B      |      ;
 
 
.label2:
    SEP #$20                                                   ;84C3D0|E220    |      ;
    LDA.B #$01                                                 ;84C3D2|A901    |      ;
    STA.B strcVariables.n8Temp3                                ;84C3D4|8594    |000094;
    SEP #$20                                                   ;84C3D6|E220    |      ;
    REP #$10                                                   ;84C3D8|C210    |      ;
    LDA.B #$03                                                 ;84C3DA|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C3DC|8D1401  |000114;
    LDA.B #$06                                                 ;84C3DF|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C3E1|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C3E4|22328383|838332;
    RTL                                                        ;84C3E8|6B      |      ;
 
 
.label3:
    SEP #$20                                                   ;84C3E9|E220    |      ;
    LDA.B #$00                                                 ;84C3EB|A900    |      ;
    XBA                                                        ;84C3ED|EB      |      ;
    LDA.W $098E                                                ;84C3EE|AD8E09  |00098E;
    JSL.L fGameEngine_LoadContinue                             ;84C3F1|2245BA83|83BA45;
    REP #$30                                                   ;84C3F5|C230    |      ;
    CPX.W #$0000                                               ;84C3F7|E00000  |      ;
    BEQ +                                                      ;84C3FA|F019    |84C415;
    SEP #$20                                                   ;84C3FC|E220    |      ;
    LDA.B #$02                                                 ;84C3FE|A902    |      ;
    STA.B strcVariables.n8Temp3                                ;84C400|8594    |000094;
    SEP #$20                                                   ;84C402|E220    |      ;
    REP #$10                                                   ;84C404|C210    |      ;
    LDA.B #$01                                                 ;84C406|A901    |      ;
    STA.W strcAudio.reg114                                     ;84C408|8D1401  |000114;
    LDA.B #$06                                                 ;84C40B|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C40D|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C410|22328383|838332;
    RTL                                                        ;84C414|6B      |      ;
 
 
  + SEP #$20                                                   ;84C415|E220    |      ;
    REP #$10                                                   ;84C417|C210    |      ;
    LDA.B #$02                                                 ;84C419|A902    |      ;
    STA.W strcAudio.reg114                                     ;84C41B|8D1401  |000114;
    LDA.B #$06                                                 ;84C41E|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C420|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C423|22328383|838332;
    RTL                                                        ;84C427|6B      |      ;
 
 
fInput_Case04_StartToState6:
    REP #$30                                                   ;84C428|C230    |      ;
    %CheckFlag(daily1, $8000)
    BEQ .justReturn                                            ;84C431|F00B    |84C43E;
    LDA.W strcJoypad1.newInput                                 ;84C433|AD2801  |000128;
    BIT.W #!JOYPAD_START                                               
    BEQ .justReturn                                            ;84C439|F003    |84C43E;
    JMP.W .label1                                              ;84C43B|4C3FC4  |84C43F;
 
 
.justReturn:
    RTL                                                        ;84C43E|6B      |      ;
 
 
.label1:
    SEP #$20                                                   ;84C43F|E220    |      ;
    LDA.B #$06                                                 ;84C441|A906    |      ;
    STA.B strcVariables.n8Temp4                                ;84C443|8595    |000095;
    SEP #$20                                                   ;84C445|E220    |      ;
    REP #$10                                                   ;84C447|C210    |      ;
    LDA.B #$03                                                 ;84C449|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C44B|8D1401  |000114;
    LDA.B #$06                                                 ;84C44E|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C450|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C453|22328383|838332;
    RTL                                                        ;84C457|6B      |      ;
 
 
fInput_Case04_State5_ThreeWayChoice:
    REP #$30                                                   ;84C458|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84C45A|AD2801  |000128;
    BIT.W #!JOYPAD_DOWN                                               
    BEQ +                                                      ;84C460|F003    |84C465;
    JMP.W .label1                                              ;84C462|4C7CC4  |84C47C;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C465|AD2801  |000128;
    BIT.W #!JOYPAD_UP                                               
    BEQ +                                                      ;84C46B|F003    |84C470;
    JMP.W .label2                                              ;84C46D|4CC4C4  |84C4C4;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C470|AD2801  |000128;
    BIT.W #!JOYPAD_A                                               
    BEQ +                                                      ;84C476|F003    |84C47B;
    JMP.W .label3                                              ;84C478|4C0CC5  |84C50C;
 
 
  + RTL                                                        ;84C47B|6B      |      ;
 
 
.label1:
    REP #$20                                                   ;84C47C|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;84C47E|6490    |000090;
    SEP #$20                                                   ;84C480|E220    |      ;
    LDA.W nUnknownFlags09D                                     ;84C482|AD8D09  |00098D;
    CMP.B #$02                                                 ;84C485|C902    |      ;
    BEQ +                                                      ;84C487|F01B    |84C4A4;
    INC A                                                      ;84C489|1A      |      ;
    STA.W nUnknownFlags09D                                     ;84C48A|8D8D09  |00098D;
    LDA.B #$01                                                 ;84C48D|A901    |      ;
    STA.B strcVariables.u8Unk97                                ;84C48F|8597    |000097;
    SEP #$20                                                   ;84C491|E220    |      ;
    REP #$10                                                   ;84C493|C210    |      ;
    LDA.B #$03                                                 ;84C495|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C497|8D1401  |000114;
    LDA.B #$06                                                 ;84C49A|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C49C|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C49F|22328383|838332;
    RTL                                                        ;84C4A3|6B      |      ;
 
 
  + REP #$20                                                   ;84C4A4|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;84C4A6|6490    |000090;
    SEP #$20                                                   ;84C4A8|E220    |      ;
    STZ.W nUnknownFlags09D                                     ;84C4AA|9C8D09  |00098D;
    LDA.B #$01                                                 ;84C4AD|A901    |      ;
    STA.B strcVariables.u8Unk97                                ;84C4AF|8597    |000097;
    SEP #$20                                                   ;84C4B1|E220    |      ;
    REP #$10                                                   ;84C4B3|C210    |      ;
    LDA.B #$03                                                 ;84C4B5|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C4B7|8D1401  |000114;
    LDA.B #$06                                                 ;84C4BA|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C4BC|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C4BF|22328383|838332;
    RTL                                                        ;84C4C3|6B      |      ;
 
 
.label2:
    REP #$20                                                   ;84C4C4|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;84C4C6|6490    |000090;
    SEP #$20                                                   ;84C4C8|E220    |      ;
    LDA.W nUnknownFlags09D                                     ;84C4CA|AD8D09  |00098D;
    BEQ +                                                      ;84C4CD|F01B    |84C4EA;
    DEC A                                                      ;84C4CF|3A      |      ;
    STA.W nUnknownFlags09D                                     ;84C4D0|8D8D09  |00098D;
    LDA.B #$01                                                 ;84C4D3|A901    |      ;
    STA.B strcVariables.u8Unk97                                ;84C4D5|8597    |000097;
    SEP #$20                                                   ;84C4D7|E220    |      ;
    REP #$10                                                   ;84C4D9|C210    |      ;
    LDA.B #$03                                                 ;84C4DB|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C4DD|8D1401  |000114;
    LDA.B #$06                                                 ;84C4E0|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C4E2|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C4E5|22328383|838332;
    RTL                                                        ;84C4E9|6B      |      ;
 
 
  + REP #$20                                                   ;84C4EA|C220    |      ;
    STZ.B strcVariables.n16Unk90                               ;84C4EC|6490    |000090;
    SEP #$20                                                   ;84C4EE|E220    |      ;
    LDA.B #$02                                                 ;84C4F0|A902    |      ;
    STA.W nUnknownFlags09D                                     ;84C4F2|8D8D09  |00098D;
    LDA.B #$01                                                 ;84C4F5|A901    |      ;
    STA.B strcVariables.u8Unk97                                ;84C4F7|8597    |000097;
    SEP #$20                                                   ;84C4F9|E220    |      ;
    REP #$10                                                   ;84C4FB|C210    |      ;
    LDA.B #$03                                                 ;84C4FD|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C4FF|8D1401  |000114;
    LDA.B #$06                                                 ;84C502|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C504|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C507|22328383|838332;
    RTL                                                        ;84C50B|6B      |      ;
 
 
.label3:
    SEP #$20                                                   ;84C50C|E220    |      ;
    LDA.W nUnknownFlags09D                                     ;84C50E|AD8D09  |00098D;
    BEQ ..label1                                               ;84C511|F00A    |84C51D;
    CMP.B #$01                                                 ;84C513|C901    |      ;
    BEQ ..label2                                               ;84C515|F00E    |84C525;
    LDA.B #$0A                                                 ;84C517|A90A    |      ;
    STA.B strcVariables.n8Temp4                                ;84C519|8595    |000095;
    BRA +                                                      ;84C51B|8010    |84C52D;
 
 
..label1:
    SEP #$20                                                   ;84C51D|E220    |      ;
    LDA.B #$08                                                 ;84C51F|A908    |      ;
    STA.B strcVariables.n8Temp4                                ;84C521|8595    |000095;
    BRA +                                                      ;84C523|8008    |84C52D;
 
 
..label2:
    SEP #$20                                                   ;84C525|E220    |      ;
    LDA.B #$07                                                 ;84C527|A907    |      ;
    STA.B strcVariables.n8Temp4                                ;84C529|8595    |000095;
    BRA +                                                      ;84C52B|8000    |84C52D;
 
 
  + SEP #$20                                                   ;84C52D|E220    |      ;
    REP #$10                                                   ;84C52F|C210    |      ;
    LDA.B #$01                                                 ;84C531|A901    |      ;
    STA.W strcAudio.reg114                                     ;84C533|8D1401  |000114;
    LDA.B #$06                                                 ;84C536|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C538|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C53B|22328383|838332;
    RTL                                                        ;84C53F|6B      |      ;
 
 
fInput_Handler_case03:
    REP #$30                                                   ;84C540|C230    |      ;
    LDA.W strcJoypad1.autorepeat                               ;84C542|AD2C01  |00012C;
    BIT.W #$0400                                               ;84C545|890004  |      ;
    BEQ +                                                      ;84C548|F003    |84C54D;
    JMP.W fInput_Case03_CursorDown                                 ;84C54A|4CD1C5  |84C5D1;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C54D|AD2C01  |00012C;
    BIT.W #$0800                                               ;84C550|890008  |      ;
    BEQ +                                                      ;84C553|F003    |84C558;
    JMP.W fInput_Case03_CursorUp                                 ;84C555|4C12C6  |84C612;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C558|AD2C01  |00012C;
    BIT.W #$0100                                               ;84C55B|890001  |      ;
    BEQ +                                                      ;84C55E|F003    |84C563;
    JMP.W fInput_Case03_CursorRight                                 ;84C560|4C51C6  |84C651;
 
 
  + LDA.W strcJoypad1.autorepeat                               ;84C563|AD2C01  |00012C;
    BIT.W #$0200                                               ;84C566|890002  |      ;
    BEQ +                                                      ;84C569|F003    |84C56E;
    JMP.W fInput_Case03_CursorLeft                                 ;84C56B|4C84C6  |84C684;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C56E|AD2801  |000128;
    BIT.W #!JOYPAD_A                                               
    BEQ +                                                      ;84C574|F003    |84C579;
    JMP.W fInput_Case03_ConfirmSelection                                 ;84C576|4C7AC5  |84C57A;
 
 
  + RTL                                                        ;84C579|6B      |      ;
 
 
fInput_Case03_ConfirmSelection:
    SEP #$20                                                   ;84C57A|E220    |      ;
    REP #$10                                                   ;84C57C|C210    |      ;
    LDA.B #$01                                                 ;84C57E|A901    |      ;
    STA.W strcAudio.reg114                                     ;84C580|8D1401  |000114;
    LDA.B #$06                                                 ;84C583|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C585|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C588|22328383|838332;
    SEP #$20                                                   ;84C58C|E220    |      ;
    STZ.W strcDialogDisplay.dialogFlags                        ;84C58E|9C9B01  |00019B;
    SEP #$20                                                   ;84C591|E220    |      ;
    LDA.B #$02                                                 ;84C593|A902    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;84C595|8D9A01  |00019A;
    LDA.B #$00                                                 ;84C598|A900    |      ;
    XBA                                                        ;84C59A|EB      |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C59B|AD8A01  |00018A;
    CMP.B #$0B                                                 ;84C59E|C90B    |      ;
    BCC .label1                                                ;84C5A0|9012    |84C5B4;
    SEP #$20                                                   ;84C5A2|E220    |      ;
    LDA.B #$01                                                 ;84C5A4|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;84C5A6|8D9A01  |00019A;
    REP #$20                                                   ;84C5A9|C220    |      ;
    LDA.W #$0001                                               ;84C5AB|A90100  |      ;
    JSL.L fDialog_DrawBlinkIconFrame                               ;84C5AE|22D79483|8394D7;
    BRA +                                                      ;84C5B2|8014    |84C5C8;
 
 
.label1:
    REP #$20                                                   ;84C5B4|C220    |      ;
    ASL A                                                      ;84C5B6|0A      |      ;
    TAX                                                        ;84C5B7|AA      |      ;
    LDA.L aDialogDialogPointerIndexes_839467,X                 ;84C5B8|BF679483|839467;
    TAX                                                        ;84C5BC|AA      |      ;
    SEP #$20                                                   ;84C5BD|E220    |      ;
    LDA.B #$00                                                 ;84C5BF|A900    |      ;
    STA.W strcDialogDisplay.dialogUnk191                       ;84C5C1|8D9101  |000191;
    JSL.L fDialog_DialogHandler                                ;84C5C4|225F9383|83935F;
 
  + REP #$20                                                   ;84C5C8|C220    |      ;
    LDA.W #$0100                                               ;84C5CA|A90001  |      ;
    STA.W strcBGScrool.BG2VerOffs                              ;84C5CD|8D4201  |000142;
    RTL                                                        ;84C5D0|6B      |      ;
 
 
fInput_Case03_CursorDown:
    SEP #$20                                                   ;84C5D1|E220    |      ;
    REP #$10                                                   ;84C5D3|C210    |      ;
    LDA.B #$03                                                 ;84C5D5|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C5D7|8D1401  |000114;
    LDA.B #$06                                                 ;84C5DA|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C5DC|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C5DF|22328383|838332;
    SEP #$20                                                   ;84C5E3|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C5E5|AD8A01  |00018A;
    CMP.B #$0B                                                 ;84C5E8|C90B    |      ;
    BCS .return                                                ;84C5EA|B025    |84C611;
    REP #$20                                                   ;84C5EC|C220    |      ;
    LDA.W #$0001                                               ;84C5EE|A90100  |      ;
    JSL.L fDialog_DrawBlinkIconFrame                               ;84C5F1|22D79483|8394D7;
    SEP #$20                                                   ;84C5F5|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C5F7|AD8A01  |00018A;
    CMP.B #$0A                                                 ;84C5FA|C90A    |      ;
    BNE +                                                      ;84C5FC|D007    |84C605;
    LDA.B #$00                                                 ;84C5FE|A900    |      ;
    STA.W strcDialogDisplay.dialoUnk18A                        ;84C600|8D8A01  |00018A;
    BRA .return                                                ;84C603|800C    |84C611;
 
 
  + SEP #$20                                                   ;84C605|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C607|AD8A01  |00018A;
    INC A                                                      ;84C60A|1A      |      ;
    STA.W strcDialogDisplay.dialoUnk18A                        ;84C60B|8D8A01  |00018A;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;84C60E|9C8B01  |00018B;
 
.return:
    RTL                                                        ;84C611|6B      |      ;
 
 
fInput_Case03_CursorUp:
    SEP #$20                                                   ;84C612|E220    |      ;
    REP #$10                                                   ;84C614|C210    |      ;
    LDA.B #$03                                                 ;84C616|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C618|8D1401  |000114;
    LDA.B #$06                                                 ;84C61B|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C61D|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C620|22328383|838332;
    SEP #$20                                                   ;84C624|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C626|AD8A01  |00018A;
    CMP.B #$0B                                                 ;84C629|C90B    |      ;
    BCS .return                                                ;84C62B|B023    |84C650;
    REP #$20                                                   ;84C62D|C220    |      ;
    LDA.W #$0001                                               ;84C62F|A90100  |      ;
    JSL.L fDialog_DrawBlinkIconFrame                               ;84C632|22D79483|8394D7;
    SEP #$20                                                   ;84C636|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C638|AD8A01  |00018A;
    BNE +                                                      ;84C63B|D007    |84C644;
    LDA.B #$0A                                                 ;84C63D|A90A    |      ;
    STA.W strcDialogDisplay.dialoUnk18A                        ;84C63F|8D8A01  |00018A;
    BRA .return                                                ;84C642|800C    |84C650;
 
 
  + SEP #$20                                                   ;84C644|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C646|AD8A01  |00018A;
    DEC A                                                      ;84C649|3A      |      ;
    STA.W strcDialogDisplay.dialoUnk18A                        ;84C64A|8D8A01  |00018A;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;84C64D|9C8B01  |00018B;
 
.return:
    RTL                                                        ;84C650|6B      |      ;
 
 
fInput_Case03_CursorRight:
    SEP #$20                                                   ;84C651|E220    |      ;
    REP #$10                                                   ;84C653|C210    |      ;
    LDA.B #$03                                                 ;84C655|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C657|8D1401  |000114;
    LDA.B #$06                                                 ;84C65A|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C65C|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C65F|22328383|838332;
    SEP #$20                                                   ;84C663|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C665|AD8A01  |00018A;
    CMP.B #$0B                                                 ;84C668|C90B    |      ;
    BCS .return                                                ;84C66A|B017    |84C683;
    REP #$20                                                   ;84C66C|C220    |      ;
    LDA.W #$0001                                               ;84C66E|A90100  |      ;
    JSL.L fDialog_DrawBlinkIconFrame                               ;84C671|22D79483|8394D7;
    SEP #$20                                                   ;84C675|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C677|AD8A01  |00018A;
    CLC                                                        ;84C67A|18      |      ;
    ADC.B #$0B                                                 ;84C67B|690B    |      ;
    STA.W strcDialogDisplay.dialoUnk18A                        ;84C67D|8D8A01  |00018A;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;84C680|9C8B01  |00018B;
 
.return:
    RTL                                                        ;84C683|6B      |      ;
 
 
fInput_Case03_CursorLeft:
    SEP #$20                                                   ;84C684|E220    |      ;
    REP #$10                                                   ;84C686|C210    |      ;
    LDA.B #$03                                                 ;84C688|A903    |      ;
    STA.W strcAudio.reg114                                     ;84C68A|8D1401  |000114;
    LDA.B #$06                                                 ;84C68D|A906    |      ;
    STA.W strcAudio.reg115                                     ;84C68F|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84C692|22328383|838332;
    SEP #$20                                                   ;84C696|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C698|AD8A01  |00018A;
    CMP.B #$0B                                                 ;84C69B|C90B    |      ;
    BCC .return                                                ;84C69D|9017    |84C6B6;
    REP #$20                                                   ;84C69F|C220    |      ;
    LDA.W #$0001                                               ;84C6A1|A90100  |      ;
    JSL.L fDialog_DrawBlinkIconFrame                               ;84C6A4|22D79483|8394D7;
    SEP #$20                                                   ;84C6A8|E220    |      ;
    LDA.W strcDialogDisplay.dialoUnk18A                        ;84C6AA|AD8A01  |00018A;
    SEC                                                        ;84C6AD|38      |      ;
    SBC.B #$0B                                                 ;84C6AE|E90B    |      ;
    STA.W strcDialogDisplay.dialoUnk18A                        ;84C6B0|8D8A01  |00018A;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;84C6B3|9C8B01  |00018B;
 
.return:
    RTL                                                        ;84C6B6|6B      |      ;
 
 
fInput_Handler_case01:
    %CheckPlayerFlags(!PFLAGS_INTRANSITION|!PFLAGS_INTERACTING|!PFLAGS_EATINGMEAL)
    BEQ +                                                      ;84C6BE|F003    |84C6C3;
    JMP.W fInput_PlayerReturn                                  ;84C6C0|4CB5C7  |84C7B5;
 
 
  + LDA.B strcPlayer.action                                    ;84C6C3|A5D4    |0000D4;
    CMP.W #!PACTION_JUMP                                               
    BNE +                                                      ;84C6C8|D003    |84C6CD;
    JMP.W fInput_PlayerReturn                                  ;84C6CA|4CB5C7  |84C7B5;
 
 
  + %CheckFlag(daily2, $0020)
    BEQ +                                                      ;84C6D4|F003    |84C6D9;
    JMP.W fInput_PlayerReturn                                  ;84C6D6|4CB5C7  |84C7B5;
 
 
  + %CheckPlayerFlags(!PFLAGS_AISTEERING)
    BEQ +                                                      ;84C6E0|F003    |84C6E5;
    JMP.W fInput_AIJoypadHandler                               ;84C6E2|4CD6C7  |84C7D6;
 
 
  + %CheckPlayerFlags(!PFLAGS_USERCONTROL)
    BNE +                                                      ;84C6EC|D003    |84C6F1;
    JMP.W fInput_PlayerReturn                                  ;84C6EE|4CB5C7  |84C7B5;
 
 
  + %CheckPlayerAction(!PACTION_FISHING)
    BNE +                                                      ;84C6F8|D003    |84C6FD;
    JMP.W fInput_PlayerButtonY                                 ;84C6FA|4CAAC7  |84C7AA;
 
 
  + CMP.W #!PACTION_FISHINGBITE                                               
    BNE +                                                      ;84C700|D003    |84C705;
    JMP.W fInput_PlayerButtonY                                 ;84C702|4CAAC7  |84C7AA;
 
 
  + SEP #$20                                                   ;84C705|E220    |      ;
    LDX.B strcPlayer.action                                    ;84C707|A6D4    |0000D4;
    LDA.L aActionLookupTable,X                                 ;84C709|BFB6C784|84C7B6;
    BEQ +                                                      ;84C70D|F003    |84C712;
    JMP.W fInput_PlayerReturn                                  ;84C70F|4CB5C7  |84C7B5;
 
 
  + REP #$30                                                   ;84C712|C230    |      ;
    LDA.W strcJoypad1.current                                  ;84C714|AD2401  |000124;
    BIT.W #!JOYPAD_DOWN                                               
    BEQ +                                                      ;84C71A|F003    |84C71F;
    JMP.W fAiInput_PressDown                                   ;84C71C|4C35C9  |84C935;
 
 
  + LDA.W strcJoypad1.current                                  ;84C71F|AD2401  |000124;
    BIT.W #!JOYPAD_UP                                               
    BEQ +                                                      ;84C725|F003    |84C72A;
    JMP.W fAiInput_PressUp                                     ;84C727|4C6FC9  |84C96F;
 
 
  + LDA.W strcJoypad1.current                                  ;84C72A|AD2401  |000124;
    BIT.W #!JOYPAD_RIGHT                                               
    BEQ +                                                      ;84C730|F003    |84C735;
    JMP.W fAiInput_PressRight                                  ;84C732|4CA9C9  |84C9A9;
 
 
  + LDA.W strcJoypad1.current                                  ;84C735|AD2401  |000124;
    BIT.W #!JOYPAD_LEFT                                               
    BEQ fInput_PlayerNormalGameplay                            ;84C73B|F003    |84C740;
    JMP.W fAiInput_PressLeft                                   ;84C73D|4CE3C9  |84C9E3;
 
 
fInput_PlayerNormalGameplay:
    %CheckPlayerFlags(!PFLAGS_AISTEERING)
    BEQ +                                                      ;84C747|F003    |84C74C;
    JMP.W fInput_AiControl                                     ;84C749|4C04C8  |84C804;
 
 
  + %CheckPlayerAction(!PACTION_0F)
    BNE +                                                      ;84C753|D003    |84C758;
    JMP.W fInput_PlayerButtonY                                 ;84C755|4CAAC7  |84C7AA;
 
 
  + REP #$20                                                   ;84C758|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84C75A|AD2801  |000128;
    BIT.W #!JOYPAD_A                                               
    BEQ +                                                      ;84C760|F003    |84C765;
    JMP.W fInput_PlayerButtonA_Interact                        ;84C762|4CA5CA  |84CAA5;
 
 
  + %CheckPlayerFlags(!PFLAGS_INSPRINGS)
    BEQ +                                                      ;84C76C|F003    |84C771;
    JMP.W fInput_PlayerReturn                                  ;84C76E|4CB5C7  |84C7B5;
 
 
  + REP #$20                                                   ;84C771|C220    |      ;
    LDA.W strcJoypad1.current                                  ;84C773|AD2401  |000124;
    BIT.W #!JOYPAD_B                                               
    BEQ +                                                      ;84C779|F003    |84C77E;
    JMP.W fInput_PlayerButtonB                                 ;84C77B|4C1DCA  |84CA1D;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C77E|AD2801  |000128;
    BIT.W #!JOYPAD_SELECT                                               
    BEQ +                                                      ;84C784|F003    |84C789;
    JMP.W fInput_PlayerButtonSelect_ShowTool                   ;84C786|4C7ACE  |84CE7A;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C789|AD2801  |000128;
    BIT.W #!JOYPAD_X                                               
    BEQ +                                                      ;84C78F|F003    |84C794;
    JMP.W fInput_PlayerButtonX_SwapTool                        ;84C791|4CA6CE  |84CEA6;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C794|AD2801  |000128;
    BIT.W #!JOYPAD_R                                               
    BEQ +                                                      ;84C79A|F003    |84C79F;
    JMP.W fInput_PlayerButtonR_WhistleHorse                    ;84C79C|4C0CCE  |84CE0C;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84C79F|AD2801  |000128;
    BIT.W #!JOYPAD_L                                               
    BEQ fInput_PlayerButtonY                                   ;84C7A5|F003    |84C7AA;
    JMP.W fInput_PlayerButtonL_WhistleDog                      ;84C7A7|4C43CE  |84CE43;
 
 
fInput_PlayerButtonY:
    LDA.W strcJoypad1.newInput                                 ;84C7AA|AD2801  |000128;
    BIT.W #!JOYPAD_Y                                               
    BEQ fInput_PlayerReturn                                    ;84C7B0|F003    |84C7B5;
    JMP.W fInput_PlayerButtonY_UseTool                         ;84C7B2|4C77CD  |84CD77;
 
 
fInput_PlayerReturn:
    RTL                                                        ;84C7B5|6B      |      ;
 
 
aActionLookupTable:
    db $00,$00,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01         ;84C7B6|        |      ; 0x20 * [n8]
    db $01,$01,$00,$00,$01,$00,$00,$01,$01,$01,$01,$01         ;84C7C2|        |      ;
    db $01,$00,$01,$01,$01,$00,$00,$00                         ;84C7CE|        |      ;
 
fInput_AIJoypadHandler:
    REP #$30                                                   ;84C7D6|C230    |      ;
    LDA.W strcAiControlData.input                              ;84C7D8|ADFD08  |0008FD;
    BIT.W #!JOYPAD_DOWN                                               
    BEQ +                                                      ;84C7DE|F003    |84C7E3;
    JMP.W fAiInput_PressDown                                   ;84C7E0|4C35C9  |84C935;
 
 
  + LDA.W strcAiControlData.input                              ;84C7E3|ADFD08  |0008FD;
    BIT.W #!JOYPAD_UP                                               
    BEQ +                                                      ;84C7E9|F003    |84C7EE;
    JMP.W fAiInput_PressUp                                     ;84C7EB|4C6FC9  |84C96F;
 
 
  + LDA.W strcAiControlData.input                              ;84C7EE|ADFD08  |0008FD;
    BIT.W #!JOYPAD_RIGHT                                               
    BEQ +                                                      ;84C7F4|F003    |84C7F9;
    JMP.W fAiInput_PressRight                                  ;84C7F6|4CA9C9  |84C9A9;
 
 
  + LDA.W strcAiControlData.input                              ;84C7F9|ADFD08  |0008FD;
    BIT.W #!JOYPAD_LEFT                                               
    BEQ fInput_AiControl                                       ;84C7FF|F003    |84C804;
    JMP.W fAiInput_PressLeft                                   ;84C801|4CE3C9  |84C9E3;
 
 
fInput_AiControl:
    LDA.W strcAiControlData.input                              ;84C804|ADFD08  |0008FD;
    BIT.W #$0080                                               ;84C807|898000  |      ;
    BEQ +                                                      ;84C80A|F003    |84C80F;
    JMP.W fInput_PlayerButtonA_Interact                        ;84C80C|4CA5CA  |84CAA5;
 
 
  + LDA.W strcAiControlData.input                              ;84C80F|ADFD08  |0008FD;
    BIT.W #$8000                                               ;84C812|890080  |      ;
    BEQ +                                                      ;84C815|F003    |84C81A;
    JMP.W fInput_PlayerButtonB                                 ;84C817|4C1DCA  |84CA1D;
 
 
  + LDA.W strcAiControlData.input                              ;84C81A|ADFD08  |0008FD;
    BIT.W #$2000                                               ;84C81D|890020  |      ;
    BEQ +                                                      ;84C820|F003    |84C825;
    JMP.W fInput_PlayerButtonSelect_ShowTool                   ;84C822|4C7ACE  |84CE7A;
 
 
  + LDA.W strcAiControlData.input                              ;84C825|ADFD08  |0008FD;
    BIT.W #$0040                                               ;84C828|894000  |      ;
    BEQ +                                                      ;84C82B|F003    |84C830;
    JMP.W fInput_PlayerButtonX_SwapTool                        ;84C82D|4CA6CE  |84CEA6;
 
 
  + LDA.W strcAiControlData.input                              ;84C830|ADFD08  |0008FD;
    BIT.W #$0010                                               ;84C833|891000  |      ;
    BEQ +                                                      ;84C836|F003    |84C83B;
    JMP.W fInput_PlayerButtonR_WhistleHorse                    ;84C838|4C0CCE  |84CE0C;
 
 
  + LDA.W strcAiControlData.input                              ;84C83B|ADFD08  |0008FD;
    BIT.W #$0020                                               ;84C83E|892000  |      ;
    BEQ +                                                      ;84C841|F003    |84C846;
    JMP.W fInput_PlayerButtonL_WhistleDog                      ;84C843|4C43CE  |84CE43;
 
 
  + LDA.W strcAiControlData.input                              ;84C846|ADFD08  |0008FD;
    BIT.W #$4000                                               ;84C849|890040  |      ;
    BEQ +                                                      ;84C84C|F003    |84C851;
    JMP.W fInput_PlayerButtonY_UseTool                         ;84C84E|4C77CD  |84CD77;
 
 
  + RTL                                                        ;84C851|6B      |      ;
 
 
fInput_Unused84C852:
    REP #$30                                                   ;84C852|C230    |      ;
    LDA.W strcJoypad1.newUnpressed                             ;84C854|AD2A01  |00012A;
    BIT.W #!JOYPAD_A                                               
    BEQ +                                                      ;84C85A|F003    |84C85F;
    JMP.W .return                                              ;84C85C|4C2BC9  |84C92B;
 
 
  + LDA.W strcJoypad1.current                                  ;84C85F|AD2401  |000124;
    BIT.W #!JOYPAD_DOWN                                               
    BNE .down                                                  ;84C865|D023    |84C88A;
    LDA.W strcJoypad1.current                                  ;84C867|AD2401  |000124;
    BIT.W #!JOYPAD_UP                                               
    BNE .up                                                    ;84C86D|D03E    |84C8AD;
    LDA.W strcJoypad1.current                                  ;84C86F|AD2401  |000124;
    BIT.W #!JOYPAD_RIGHT                                               
    BNE .right                                                 ;84C875|D059    |84C8D0;
    LDA.W strcJoypad1.current                                  ;84C877|AD2401  |000124;
    BIT.W #!JOYPAD_LEFT                                               
    BEQ +                                                      ;84C87D|F003    |84C882;
    JMP.W .left                                                ;84C87F|4CF3C8  |84C8F3;
 
 
  + %SetPlayerAction(!PACTION_NONE)
 
.justReturn:
    RTL                                                        ;84C889|6B      |      ;
 
 
.down:
    REP #$30                                                   ;84C88A|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C88C|AD1109  |000911;
    CMP.W #$0000                                               ;84C88F|C90000  |      ;
    BNE +                                                      ;84C892|D003    |84C897;
    JMP.W .setPlayerAction7                                    ;84C894|4C17C9  |84C917;
 
 
  + REP #$30                                                   ;84C897|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C899|AD1109  |000911;
    CMP.W #$0001                                               ;84C89C|C90100  |      ;
    BNE +                                                      ;84C89F|D003    |84C8A4;
    JMP.W .setPlayerAction6                                    ;84C8A1|4C21C9  |84C921;
 
 
  + %SetPlayerAction(!PACTION_NONE)
    BRA .justReturn                                            ;84C8AB|80DC    |84C889;
 
 
.up:
    REP #$30                                                   ;84C8AD|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C8AF|AD1109  |000911;
    CMP.W #$0001                                               ;84C8B2|C90100  |      ;
    BNE +                                                      ;84C8B5|D003    |84C8BA;
    JMP.W .setPlayerAction7                                    ;84C8B7|4C17C9  |84C917;
 
 
  + REP #$30                                                   ;84C8BA|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C8BC|AD1109  |000911;
    CMP.W #$0000                                               ;84C8BF|C90000  |      ;
    BNE +                                                      ;84C8C2|D003    |84C8C7;
    JMP.W .setPlayerAction6                                    ;84C8C4|4C21C9  |84C921;
 
 
  + %SetPlayerAction(!PACTION_NONE)
    BRA .justReturn                                            ;84C8CE|80B9    |84C889;
 
 
.right:
    REP #$30                                                   ;84C8D0|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C8D2|AD1109  |000911;
    CMP.W #$0002                                               ;84C8D5|C90200  |      ;
    BNE +                                                      ;84C8D8|D003    |84C8DD;
    JMP.W .setPlayerAction7                                    ;84C8DA|4C17C9  |84C917;
 
 
  + REP #$30                                                   ;84C8DD|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C8DF|AD1109  |000911;
    CMP.W #$0003                                               ;84C8E2|C90300  |      ;
    BNE +                                                      ;84C8E5|D003    |84C8EA;
    JMP.W .setPlayerAction6                                    ;84C8E7|4C21C9  |84C921;
 
 
  + %SetPlayerAction(!PACTION_NONE)
    BRA .justReturn                                            ;84C8F1|8096    |84C889;
 
 
.left:
    REP #$30                                                   ;84C8F3|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C8F5|AD1109  |000911;
    CMP.W #$0003                                               ;84C8F8|C90300  |      ;
    BNE +                                                      ;84C8FB|D003    |84C900;
    JMP.W .setPlayerAction7                                    ;84C8FD|4C17C9  |84C917;
 
 
  + REP #$30                                                   ;84C900|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C902|AD1109  |000911;
    CMP.W #$0002                                               ;84C905|C90200  |      ;
    BNE +                                                      ;84C908|D003    |84C90D;
    JMP.W .setPlayerAction6                                    ;84C90A|4C21C9  |84C921;
 
 
  + %SetPlayerAction(!PACTION_NONE)
    JMP.W .justReturn                                          ;84C914|4C89C8  |84C889;
 
 
.setPlayerAction7:
    %SetPlayerAction(!PACTION_07)
    JMP.W .justReturn                                          ;84C91E|4C89C8  |84C889;
 
 
.setPlayerAction6:
    %SetPlayerAction(!PACTION_06)
    JMP.W .justReturn                                          ;84C928|4C89C8  |84C889;
 
 
.return:
    %SetPlayerAction(!PACTION_NONE)
    JMP.W .justReturn                                          ;84C932|4C89C8  |84C889;
 
 
fAiInput_PressDown:
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_DOWN)
    %SetObjectDirection(!PDIR_DOWN)
    JMP.W fInput_PlayerNormalGameplay                          ;84C94B|4C40C7  |84C740;
 
    REP #$30                                                   ;84C94E|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C950|AD1109  |000911;
    CMP.W #$0001                                               ;84C953|C90100  |      ;
    BNE +                                                      ;84C956|D003    |84C95B;
    JMP.W .label1                                              ;84C958|4C5EC9  |84C95E;
 
 
  + JMP.W fInput_PlayerReturn                                  ;84C95B|4CB5C7  |84C7B5;
 
 
.label1:
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_UP)
    JMP.W fInput_PlayerReturn                                  ;84C96C|4CB5C7  |84C7B5;
 
 
fAiInput_PressUp:
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_UP)
    %SetObjectDirection(!PDIR_UP)
    JMP.W fInput_PlayerNormalGameplay                          ;84C985|4C40C7  |84C740;
 
    REP #$30                                                   ;84C988|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C98A|AD1109  |000911;
    CMP.W #$0000                                               ;84C98D|C90000  |      ;
    BNE +                                                      ;84C990|D003    |84C995;
    JMP.W .label1                                              ;84C992|4C98C9  |84C998;
 
 
  + JMP.W fInput_PlayerNormalGameplay                          ;84C995|4C40C7  |84C740;
 
 
.label1:
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_DOWN)
    JMP.W fInput_PlayerReturn                                  ;84C9A6|4CB5C7  |84C7B5;
 
 
fAiInput_PressRight:
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_LEFT)
    %SetObjectDirection(!PDIR_LEFT)
    JMP.W fInput_PlayerNormalGameplay                          ;84C9BF|4C40C7  |84C740;
 
    REP #$30                                                   ;84C9C2|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C9C4|AD1109  |000911;
    CMP.W #$0003                                               ;84C9C7|C90300  |      ;
    BNE +                                                      ;84C9CA|D003    |84C9CF;
    JMP.W .label1                                              ;84C9CC|4CD2C9  |84C9D2;
 
 
  + JMP.W fInput_PlayerNormalGameplay                          ;84C9CF|4C40C7  |84C740;
 
 
.label1:
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_RIGHT)
    JMP.W fInput_PlayerReturn                                  ;84C9E0|4CB5C7  |84C7B5;
 
 
fAiInput_PressLeft:
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_RIGHT)
    %SetObjectDirection(!PDIR_RIGHT)
    JMP.W fInput_PlayerNormalGameplay                          ;84C9F9|4C40C7  |84C740;
 
    REP #$30                                                   ;84C9FC|C230    |      ;
    LDA.W strcObjectData.direction                             ;84C9FE|AD1109  |000911;
    CMP.W #$0002                                               ;84CA01|C90200  |      ;
    BNE +                                                      ;84CA04|D003    |84CA09;
    JMP.W .label1                                              ;84CA06|4C0CCA  |84CA0C;
 
 
  + JMP.W fInput_PlayerNormalGameplay                          ;84CA09|4C40C7  |84C740;
 
 
.label1:
    %SetPlayerAction(!PACTION_WALK)
    %SetPlayerDirection(!PDIR_LEFT)
    JMP.W fInput_PlayerReturn                                  ;84CA1A|4CB5C7  |84C7B5;
 
 
fInput_PlayerButtonB:
    %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;84CA24|F003    |84CA29;
    JMP.W .return                                              ;84CA26|4C9DCA  |84CA9D;
 
 
  + LDA.W #$0000                                               ;84CA29|A90000  |      ;
    LDX.W #$0007                                               ;84CA2C|A20700  |      ;
    LDY.W #$0007                                               ;84CA2F|A00700  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;84CA32|224ED181|81D14E;
    REP #$30                                                   ;84CA36|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CA38|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CA3B|AC8709  |000987;
    LDA.W #$0002                                               ;84CA3E|A90200  |      ;
    JSL.L fUnknown_82AC61                                      ;84CA41|2261AC82|82AC61;
    SEP #$20                                                   ;84CA45|E220    |      ;
    AND.B #$60                                                 ;84CA47|2960    |      ;
    BEQ .return                                                ;84CA49|F052    |84CA9D;
    AND.B #$20                                                 ;84CA4B|2920    |      ;
    BNE .label1                                                ;84CA4D|D010    |84CA5F;
    %SetPlayerFlag(!PFLAGS_FALLING)
    REP #$20                                                   ;84CA58|C220    |      ;
    LDA.W #$0021                                               ;84CA5A|A92100  |      ;
    BRA .jump                                                  ;84CA5D|8007    |84CA66;
 
 
.label1:
    REP #$20                                                   ;84CA5F|C220    |      ;
    LDA.W #$001C                                               ;84CA61|A91C00  |      ;
    BRA .jump                                                  ;84CA64|8000    |84CA66;
 
 
.jump:
    REP #$30                                                   ;84CA66|C230    |      ;
    STA.B strcPlayer.unkE3                                     ;84CA68|85E3    |0000E3;
    LDA.B strcPlayer.posX                                      ;84CA6A|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;84CA6C|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;84CA6E|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;84CA70|85E1    |0000E1;
    STZ.B strcPlayer.newX                                      ;84CA72|64E5    |0000E5;
    STZ.B strcPlayer.newY                                      ;84CA74|64E7    |0000E7;
    LDA.B strcPlayer.direction                                 ;84CA76|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AF37                   ;84CA78|2237AF83|83AF37;
    REP #$30                                                   ;84CA7C|C230    |      ;
    BNE .return                                                ;84CA7E|D01D    |84CA9D;
    REP #$20                                                   ;84CA80|C220    |      ;
    LDA.W #$0020                                               ;84CA82|A92000  |      ;
    STA.B strcPlayer.unkE3                                     ;84CA85|85E3    |0000E3;
    LDA.B strcPlayer.direction                                 ;84CA87|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;84CA89|2291AD83|83AD91;
    REP #$30                                                   ;84CA8D|C230    |      ;
    CMP.W #$0000                                               ;84CA8F|C90000  |      ;
    BNE .return                                                ;84CA92|D009    |84CA9D;
    %SetPlayerAction(!PACTION_JUMP)
    BRA .justReturn                                            ;84CA9B|8007    |84CAA4;
 
 
.return:
    %SetPlayerAction(!PACTION_RUN)
 
.justReturn:
    RTL                                                        ;84CAA4|6B      |      ;
 
 
fInput_PlayerButtonA_Interact:
    %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;84CAAC|F003    |84CAB1;
    JMP.W .label3                                              ;84CAAE|4C2BCB  |84CB2B;
 
 
  + %CheckPlayerFlagsNoReg(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;84CAB6|F003    |84CABB;
    JMP.W .label4                                              ;84CAB8|4C1CCC  |84CC1C;
 
 
  + %CheckFlag(daily4, $0006)
    BEQ +                                                      ;84CAC2|F003    |84CAC7;
    JMP.W .label2                                              ;84CAC4|4CFECA  |84CAFE;
 
 
  + %CheckPlayerFlags(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;84CACE|F003    |84CAD3;
    JMP.W .label1                                              ;84CAD0|4CF6CA  |84CAF6;
 
 
  + REP #$20                                                   ;84CAD3|C220    |      ;
    LDA.W #$0000                                               ;84CAD5|A90000  |      ;
    LDX.W #$0007                                               ;84CAD8|A20700  |      ;
    LDY.W #$0007                                               ;84CADB|A00700  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;84CADE|224ED181|81D14E;
    REP #$30                                                   ;84CAE2|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CAE4|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CAE7|AC8709  |000987;
    LDA.W #$0002                                               ;84CAEA|A90200  |      ;
    JSL.L fUnknown_82AC61                                      ;84CAED|2261AC82|82AC61;
    JSL.L fUnknown_82AD0E                                      ;84CAF1|220EAD82|82AD0E;
    RTL                                                        ;84CAF5|6B      |      ;
 
 
.label1:
    %SetPlayerAction(!PACTION_DROPITEM)
    RTL                                                        ;84CAFD|6B      |      ;
 
 
.label2:
    REP #$30                                                   ;84CAFE|C230    |      ;
    LDA.W #$0000                                               ;84CB00|A90000  |      ;
    LDX.W #$0007                                               ;84CB03|A20700  |      ;
    LDY.W #$0007                                               ;84CB06|A00700  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;84CB09|224ED181|81D14E;
    REP #$30                                                   ;84CB0D|C230    |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CB0F|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CB12|AC8709  |000987;
    LDA.W #$0000                                               ;84CB15|A90000  |      ;
    JSL.L fUnknown_82AC61                                      ;84CB18|2261AC82|82AC61;
    REP #$30                                                   ;84CB1C|C230    |      ;
    CPX.W #$00F5                                               ;84CB1E|E0F500  |      ;
    BNE .justReturn                                            ;84CB21|D007    |84CB2A;
    %SetPlayerAction(!PACTION_1A)
 
.justReturn:
    RTL                                                        ;84CB2A|6B      |      ;
 
 
.label3:
    REP #$30                                                   ;84CB2B|C230    |      ;
    LDA.B strcPlayer.posX                                      ;84CB2D|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;84CB2F|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;84CB31|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;84CB33|85E1    |0000E1;
    STZ.B strcPlayer.newX                                      ;84CB35|64E5    |0000E5;
    STZ.B strcPlayer.newY                                      ;84CB37|64E7    |0000E7;
    LDA.W #$0010                                               ;84CB39|A91000  |      ;
    STA.B strcPlayer.unkE3                                     ;84CB3C|85E3    |0000E3;
    LDA.B strcPlayer.direction                                 ;84CB3E|A5DA    |0000DA;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;84CB40|2291AD83|83AD91;
    REP #$30                                                   ;84CB44|C230    |      ;
    CMP.W #$0000                                               ;84CB46|C90000  |      ;
    BEQ +                                                      ;84CB49|F003    |84CB4E;
    JMP.W .justReturn2                                         ;84CB4B|4C1BCC  |84CC1B;
 
 
  + REP #$20                                                   ;84CB4E|C220    |      ;
    LDA.W #$0000                                               ;84CB50|A90000  |      ;
    LDX.W #$0007                                               ;84CB53|A20700  |      ;
    LDY.W #$0007                                               ;84CB56|A00700  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;84CB59|224ED181|81D14E;
    REP #$20                                                   ;84CB5D|C220    |      ;
    LDA.W #$0002                                               ;84CB5F|A90200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CB62|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CB65|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;84CB68|2261AC82|82AC61;
    SEP #$20                                                   ;84CB6C|E220    |      ;
    AND.B #$1F                                                 ;84CB6E|291F    |      ;
    BEQ +                                                      ;84CB70|F003    |84CB75;
    JMP.W .justReturn2                                         ;84CB72|4C1BCC  |84CC1B;
 
 
  + CPX.W #$00FF                                               ;84CB75|E0FF00  |      ;
    BNE +                                                      ;84CB78|D003    |84CB7D;
    JMP.W .justReturn2                                         ;84CB7A|4C1BCC  |84CC1B;
 
 
  + REP #$20                                                   ;84CB7D|C220    |      ;
    LDA.W #$0001                                               ;84CB7F|A90100  |      ;
    LDX.W #$000A                                               ;84CB82|A20A00  |      ;
    LDY.W #$000A                                               ;84CB85|A00A00  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;84CB88|224ED181|81D14E;
    REP #$20                                                   ;84CB8C|C220    |      ;
    LDA.W #$0002                                               ;84CB8E|A90200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CB91|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CB94|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;84CB97|2261AC82|82AC61;
    SEP #$20                                                   ;84CB9B|E220    |      ;
    AND.B #$1F                                                 ;84CB9D|291F    |      ;
    BEQ +                                                      ;84CB9F|F003    |84CBA4;
    JMP.W .justReturn2                                         ;84CBA1|4C1BCC  |84CC1B;
 
 
  + CPX.W #$00FF                                               ;84CBA4|E0FF00  |      ;
    BNE +                                                      ;84CBA7|D003    |84CBAC;
    JMP.W .justReturn2                                         ;84CBA9|4C1BCC  |84CC1B;
 
 
  + REP #$20                                                   ;84CBAC|C220    |      ;
    LDA.W #$0001                                               ;84CBAE|A90100  |      ;
    LDX.W #$0000                                               ;84CBB1|A20000  |      ;
    LDY.W #$0000                                               ;84CBB4|A00000  |      ;
    JSL.L fStoreTileOnFrontOfPlayerAtDistance                  ;84CBB7|224ED181|81D14E;
    REP #$20                                                   ;84CBBB|C220    |      ;
    LDA.W #$0002                                               ;84CBBD|A90200  |      ;
    LDX.W nTileInFrontOfPlayerX                                ;84CBC0|AE8509  |000985;
    LDY.W nTileInFrontOfPlayerY                                ;84CBC3|AC8709  |000987;
    JSL.L fUnknown_82AC61                                      ;84CBC6|2261AC82|82AC61;
    SEP #$20                                                   ;84CBCA|E220    |      ;
    AND.B #$1F                                                 ;84CBCC|291F    |      ;
    BEQ +                                                      ;84CBCE|F003    |84CBD3;
    JMP.W .justReturn2                                         ;84CBD0|4C1BCC  |84CC1B;
 
 
  + CPX.W #$00E1                                               ;84CBD3|E0E100  |      ;
    BNE +                                                      ;84CBD6|D003    |84CBDB;
    JMP.W .justReturn2                                         ;84CBD8|4C1BCC  |84CC1B;
 
 
  + CPX.W #$00FF                                               ;84CBDB|E0FF00  |      ;
    BNE +                                                      ;84CBDE|D003    |84CBE3;
    JMP.W .justReturn2                                         ;84CBE0|4C1BCC  |84CC1B;
 
 
  + CPX.W #$00C0                                               ;84CBE3|E0C000  |      ;
    BCC +                                                      ;84CBE6|9007    |84CBEF;
    CPX.W #$00D0                                               ;84CBE8|E0D000  |      ;
    BCS +                                                      ;84CBEB|B002    |84CBEF;
    BRA .justReturn2                                           ;84CBED|802C    |84CC1B;
 
 
  + REP #$30                                                   ;84CBEF|C230    |      ;
    LDA.W nTileInFrontOfPlayerX                                ;84CBF1|AD8509  |000985;
    STA.L nDogX                                                ;84CBF4|8F2C1F7F|7F1F2C;
    LDA.W nTileInFrontOfPlayerY                                ;84CBF8|AD8709  |000987;
    STA.L nDogY                                                ;84CBFB|8F2E1F7F|7F1F2E;
    SEP #$20                                                   ;84CBFF|E220    |      ;
    LDA.B strcMap.loadAreaId                                   ;84CC01|A522    |000022;
    STA.L nDogAreaId                                           ;84CC03|8F301F7F|7F1F30;
    %SetPlayerAction(!PACTION_DROPPINGDOG)
    %UnsetPlayerFlag(!PFLAGS_DOGHUGGING)
    RTL                                                        ;84CC1A|6B      |      ;
 
 
.justReturn2:
    RTL                                                        ;84CC1B|6B      |      ;
 
 
.label4:
    REP #$30                                                   ;84CC1C|C230    |      ;
    LDA.B strcPlayer.direction                                 ;84CC1E|A5DA    |0000DA;
    CMP.W #!PDIR_DOWN                                               
    BNE +                                                      ;84CC23|D003    |84CC28;
    JMP.W .label5                                              ;84CC25|4C40CC  |84CC40;
 
 
  + CMP.W #!PDIR_UP                                               
    BNE +                                                      ;84CC2B|D003    |84CC30;
    JMP.W .label6                                              ;84CC2D|4C6FCC  |84CC6F;
 
 
  + CMP.W #!PDIR_LEFT                                               
    BNE +                                                      ;84CC33|D003    |84CC38;
    JMP.W .label7                                              ;84CC35|4C98CC  |84CC98;
 
 
  + CMP.W #!PDIR_RIGHT                                               
    BNE .label5                                                ;84CC3B|D003    |84CC40;
    JMP.W .label8                                              ;84CC3D|4CC0CC  |84CCC0;
 
 
.label5:
    %SetObjectDirection(!PDIR_LEFT)
    JSL.L fInput_IsObjectDirectionBlocked                                 ;84CC48|2216CD84|84CD16;
    REP #$30                                                   ;84CC4C|C230    |      ;
    BNE +                                                      ;84CC4E|D003    |84CC53;
    JMP.W .label9                                              ;84CC50|4CE8CC  |84CCE8;
 
 
  + LDA.W #!PDIR_RIGHT                                               
    STA.W strcObjectData.direction                             ;84CC56|8D1109  |000911;
    JSL.L fInput_IsObjectDirectionBlocked                                 ;84CC59|2216CD84|84CD16;
    REP #$30                                                   ;84CC5D|C230    |      ;
    BNE +                                                      ;84CC5F|D003    |84CC64;
    JMP.W .label9                                              ;84CC61|4CE8CC  |84CCE8;
 
 
  + LDA.W #!PDIR_DOWN                                               
    STA.B strcPlayer.direction                                 ;84CC67|85DA    |0000DA;
    STA.W strcObjectData.direction                             ;84CC69|8D1109  |000911;
    JMP.W .justReturn3                                         ;84CC6C|4C15CD  |84CD15;
 
 
.label6:
    %SetObjectDirection(!PDIR_RIGHT)
    JSL.L fInput_IsObjectDirectionBlocked                                 ;84CC77|2216CD84|84CD16;
    REP #$30                                                   ;84CC7B|C230    |      ;
    BEQ .label9                                                ;84CC7D|F069    |84CCE8;
    LDA.W #!PDIR_LEFT                                               
    STA.W strcObjectData.direction                             ;84CC82|8D1109  |000911;
    JSL.L fInput_IsObjectDirectionBlocked                                 ;84CC85|2216CD84|84CD16;
    REP #$30                                                   ;84CC89|C230    |      ;
    BEQ .label9                                                ;84CC8B|F05B    |84CCE8;
    LDA.W #!PDIR_UP                                               
    STA.B strcPlayer.direction                                 ;84CC90|85DA    |0000DA;
    STA.W strcObjectData.direction                             ;84CC92|8D1109  |000911;
    JMP.W .justReturn3                                         ;84CC95|4C15CD  |84CD15;
 
 
.label7:
    %SetObjectDirection(!PDIR_DOWN)
    JSL.L fInput_IsObjectDirectionBlocked                                 ;84CCA0|2216CD84|84CD16;
    REP #$30                                                   ;84CCA4|C230    |      ;
    BEQ .label9                                                ;84CCA6|F040    |84CCE8;
    LDA.W #!PDIR_UP                                               
    STA.W strcObjectData.direction                             ;84CCAB|8D1109  |000911;
    JSL.L fInput_IsObjectDirectionBlocked                                 ;84CCAE|2216CD84|84CD16;
    REP #$30                                                   ;84CCB2|C230    |      ;
    BEQ .label9                                                ;84CCB4|F032    |84CCE8;
    LDA.W #!PDIR_LEFT                                               
    STA.B strcPlayer.direction                                 ;84CCB9|85DA    |0000DA;
    STA.W strcObjectData.direction                             ;84CCBB|8D1109  |000911;
    BRA .justReturn3                                           ;84CCBE|8055    |84CD15;
 
 
.label8:
    %SetObjectDirection($0000)
    JSL.L fInput_IsObjectDirectionBlocked                                 ;84CCC8|2216CD84|84CD16;
    REP #$30                                                   ;84CCCC|C230    |      ;
    BEQ .label9                                                ;84CCCE|F018    |84CCE8;
    LDA.W #!PDIR_UP                                               
    STA.W strcObjectData.direction                             ;84CCD3|8D1109  |000911;
    JSL.L fInput_IsObjectDirectionBlocked                                 ;84CCD6|2216CD84|84CD16;
    REP #$30                                                   ;84CCDA|C230    |      ;
    BEQ .label9                                                ;84CCDC|F00A    |84CCE8;
    LDA.W #!PDIR_RIGHT                                               
    STA.B strcPlayer.direction                                 ;84CCE1|85DA    |0000DA;
    STA.W strcObjectData.direction                             ;84CCE3|8D1109  |000911;
    BRA .justReturn3                                           ;84CCE6|802D    |84CD15;
 
 
.label9:
    %SetPlayerAction(!PACTION_18)
    REP #$30                                                   ;84CCEF|C230    |      ;
    LDA.B strcPlayer.posX                                      ;84CCF1|A5D6    |0000D6;
    STA.W nTileInFrontOfPlayerX                                ;84CCF3|8D8509  |000985;
    LDA.B strcPlayer.posY                                      ;84CCF6|A5D8    |0000D8;
    STA.W nTileInFrontOfPlayerY                                ;84CCF8|8D8709  |000987;
    LDA.W #$0017                                               ;84CCFB|A91700  |      ;
    LDX.W #$0000                                               ;84CCFE|A20000  |      ;
    LDY.W #$0014                                               ;84CD01|A01400  |      ;
    JSL.L fAI_StartSlotScriptAtFrontTile                                    ;84CD04|22F88084|8480F8;
    REP #$20                                                   ;84CD08|C220    |      ;
    STZ.W $0878                                                ;84CD0A|9C7808  |000878;
    STZ.W $087A                                                ;84CD0D|9C7A08  |00087A;
    SEP #$20                                                   ;84CD10|E220    |      ;
    STZ.W strcStockData.unkHorse                               ;84CD12|9C3909  |000939;
 
.justReturn3:
    RTL                                                        ;84CD15|6B      |      ;
 
 
fInput_IsObjectDirectionBlocked:
    REP #$30                                                   ;84CD16|C230    |      ;
    LDA.W #$0010                                               ;84CD18|A91000  |      ;
    STA.B strcPlayer.unkE3                                     ;84CD1B|85E3    |0000E3;
    LDA.B strcPlayer.posX                                      ;84CD1D|A5D6    |0000D6;
    STA.B strcPlayer.lastX                                     ;84CD1F|85DF    |0000DF;
    LDA.B strcPlayer.posY                                      ;84CD21|A5D8    |0000D8;
    STA.B strcPlayer.lastY                                     ;84CD23|85E1    |0000E1;
    STZ.B strcPlayer.newX                                      ;84CD25|64E5    |0000E5;
    STZ.B strcPlayer.newY                                      ;84CD27|64E7    |0000E7;
    LDA.W strcObjectData.direction                             ;84CD29|AD1109  |000911;
    JSL.L fGameEngine_DirectionHandler83AF37                   ;84CD2C|2237AF83|83AF37;
    REP #$30                                                   ;84CD30|C230    |      ;
    BEQ +                                                      ;84CD32|F003    |84CD37;
    JMP.W .return                                              ;84CD34|4C71CD  |84CD71;
 
 
  + LDA.B strcPlayer.unkPosX                                   ;84CD37|A5E9    |0000E9;
    SEC                                                        ;84CD39|38      |      ;
    SBC.W #$00C0                                               ;84CD3A|E9C000  |      ;
    CMP.W #$0010                                               ;84CD3D|C91000  |      ;
    BCS +                                                      ;84CD40|B003    |84CD45;
    JMP.W .return                                              ;84CD42|4C71CD  |84CD71;
 
 
  + LDA.B strcPlayer.unkPosY                                   ;84CD45|A5EB    |0000EB;
    SEC                                                        ;84CD47|38      |      ;
    SBC.W #$00C0                                               ;84CD48|E9C000  |      ;
    CMP.W #$0010                                               ;84CD4B|C91000  |      ;
    BCS +                                                      ;84CD4E|B003    |84CD53;
    JMP.W .return                                              ;84CD50|4C71CD  |84CD71;
 
 
  + REP #$20                                                   ;84CD53|C220    |      ;
    LDA.W #$0010                                               ;84CD55|A91000  |      ;
    STA.B strcPlayer.unkE3                                     ;84CD58|85E3    |0000E3;
    LDA.W strcObjectData.direction                             ;84CD5A|AD1109  |000911;
    JSL.L fGameEngine_DirectionHandler83AD91                   ;84CD5D|2291AD83|83AD91;
    REP #$30                                                   ;84CD61|C230    |      ;
    CMP.W #$0000                                               ;84CD63|C90000  |      ;
    BEQ +                                                      ;84CD66|F003    |84CD6B;
    JMP.W .return                                              ;84CD68|4C71CD  |84CD71;
 
 
  + REP #$30                                                   ;84CD6B|C230    |      ;
    LDA.W #$0000                                               ;84CD6D|A90000  |      ;
    RTL                                                        ;84CD70|6B      |      ;
 
 
.return:
    REP #$30                                                   ;84CD71|C230    |      ;
    LDA.W #$0001                                               ;84CD73|A90100  |      ;
    RTL                                                        ;84CD76|6B      |      ;
 
 
fInput_PlayerButtonY_UseTool:
    %CheckPlayerFlags(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;84CD7E|F003    |84CD83;
    JMP.W fInput_PlayerButtonY_Return                          ;84CD80|4CDCCD  |84CDDC;
 
 
  + %CheckPlayerFlags(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;84CD8A|F003    |84CD8F;
    JMP.W fInput_PlayerButtonY_Return                          ;84CD8C|4CDCCD  |84CDDC;
 
 
  + %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;84CD96|F003    |84CD9B;
    JMP.W fInput_PlayerButtonY_Return                          ;84CD98|4CDCCD  |84CDDC;
 
 
  + %CheckPlayerAction(!PACTION_0F)
    BNE +                                                      ;84CDA2|D003    |84CDA7;
    JMP.W fInput_SetPlayerAction0x10                           ;84CDA4|4CDDCD  |84CDDD;
 
 
  + %CheckPlayerAction(!PACTION_FISHING)
    BNE +                                                      ;84CDAE|D003    |84CDB3;
    JMP.W fInput_SetPlayerAction0x0F                           ;84CDB0|4CE5CD  |84CDE5;
 
 
  + %CheckPlayerAction(!PACTION_FISHINGBITE)
    BNE fInput_SetPlayerAction0x0A                             ;84CDBA|D003    |84CDBF;
    JMP.W fInput_SetPlayerAction0x13                           ;84CDBC|4CEDCD  |84CDED;
 
 
fInput_SetPlayerAction0x0A:
    REP #$20                                                   ;84CDBF|C220    |      ;
    %CheckFlag(daily4, $8000)
    BNE fInput_PlayerButtonY_Return                            ;84CDC8|D012    |84CDDC;
    SEP #$20                                                   ;84CDCA|E220    |      ;
    LDA.W strcPlayerData.toolEquipped                          ;84CDCC|AD2109  |000921;
    BEQ fInput_PlayerButtonY_Return                            ;84CDCF|F00B    |84CDDC;
    %SetPlayerAction(!PACTION_USINGTOOL)
    JSL.L fToolUsedAnimationHandler                            ;84CDD8|22A89082|8290A8;
 
fInput_PlayerButtonY_Return:
    RTL                                                        ;84CDDC|6B      |      ;
 
 
fInput_SetPlayerAction0x10:
    %SetPlayerAction(!PACTION_10)
    RTL                                                        ;84CDE4|6B      |      ;
 
 
fInput_SetPlayerAction0x0F:
    %SetPlayerAction(!PACTION_0F)
    RTL                                                        ;84CDEC|6B      |      ;
 
 
fInput_SetPlayerAction0x13:
    %SetPlayerAction(!PACTION_REELING)
    SEP #$20                                                   ;84CDF4|E220    |      ;
    LDA.B #$03                                                 ;84CDF6|A903    |      ;
    JSL.L fCore_GetRandomNumber                                ;84CDF8|22F98980|8089F9;
    SEP #$20                                                   ;84CDFC|E220    |      ;
    XBA                                                        ;84CDFE|EB      |      ;
    LDA.B #$00                                                 ;84CDFF|A900    |      ;
    XBA                                                        ;84CE01|EB      |      ;
    REP #$20                                                   ;84CE02|C220    |      ;
    CLC                                                        ;84CE04|18      |      ;
    ADC.W #$008B                                               ;84CE05|698B00  |      ;
    STA.W strcObjectData.spriteIdx                             ;84CE08|8D0109  |000901;
    RTL                                                        ;84CE0B|6B      |      ;
 
 
fInput_PlayerButtonR_WhistleHorse:
    %CheckPlayerFlags(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;84CE13|F003    |84CE18;
    JMP.W .justReturn                                          ;84CE15|4C42CE  |84CE42;
 
 
  + %CheckPlayerFlags(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;84CE1F|F003    |84CE24;
    JMP.W .justReturn                                          ;84CE21|4C42CE  |84CE42;
 
 
  + %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;84CE2B|F003    |84CE30;
    JMP.W .justReturn                                          ;84CE2D|4C42CE  |84CE42;
 
 
  + REP #$30                                                   ;84CE30|C230    |      ;
    %CheckFlag(event3, $0100)
    BEQ .justReturn                                            ;84CE39|F007    |84CE42;
    %SetPlayerAction(!PACTION_WHISTLEHORSE)
 
.justReturn:
    RTL                                                        ;84CE42|6B      |      ;
 
 
fInput_PlayerButtonL_WhistleDog:
    %CheckPlayerFlags(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;84CE4A|F003    |84CE4F;
    JMP.W .justReturn                                          ;84CE4C|4C79CE  |84CE79;
 
 
  + %CheckPlayerFlags(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;84CE56|F003    |84CE5B;
    JMP.W .justReturn                                          ;84CE58|4C79CE  |84CE79;
 
 
  + %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;84CE62|F003    |84CE67;
    JMP.W .justReturn                                          ;84CE64|4C79CE  |84CE79;
 
 
  + REP #$30                                                   ;84CE67|C230    |      ;
    %CheckFlag(event3, $0080)
    BEQ .justReturn                                            ;84CE70|F007    |84CE79;
    %SetPlayerAction(!PACTION_WHISTLEDOG)
 
.justReturn:
    RTL                                                        ;84CE79|6B      |      ;
 
 
fInput_PlayerButtonSelect_ShowTool:
    %CheckPlayerFlags(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;84CE81|F003    |84CE86;
    JMP.W .justReturn                                          ;84CE83|4CA5CE  |84CEA5;
 
 
  + %CheckPlayerFlags(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;84CE8D|F003    |84CE92;
    JMP.W .justReturn                                          ;84CE8F|4CA5CE  |84CEA5;
 
 
  + %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;84CE99|F003    |84CE9E;
    JMP.W .justReturn                                          ;84CE9B|4CA5CE  |84CEA5;
 
 
  + %SetPlayerAction(!PACTION_SHOWTOOL)
 
.justReturn:
    RTL                                                        ;84CEA5|6B      |      ;
 
 
fInput_PlayerButtonX_SwapTool:
    %CheckPlayerFlags(!PFLAGS_HOLDINGITEM)
    BEQ +                                                      ;84CEAD|F003    |84CEB2;
    JMP.W .justReturn                                          ;84CEAF|4CD1CE  |84CED1;
 
 
  + %CheckPlayerFlags(!PFLAGS_RIDINGHORSE)
    BEQ +                                                      ;84CEB9|F003    |84CEBE;
    JMP.W .justReturn                                          ;84CEBB|4CD1CE  |84CED1;
 
 
  + %CheckPlayerFlags(!PFLAGS_DOGHUGGING)
    BEQ +                                                      ;84CEC5|F003    |84CECA;
    JMP.W .justReturn                                          ;84CEC7|4CD1CE  |84CED1;
 
 
  + %SetPlayerAction(!PACTION_SWAPTOOL)
 
.justReturn:
    RTL                                                        ;84CED1|6B      |      ;
 
 
fInput_Handler_case06:
    SEP #$20                                                   ;84CED2|E220    |      ;
    REP #$10                                                   ;84CED4|C210    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;84CED6|AD9B01  |00019B;
    AND.B #!DFLAGS_ENDDIALOG                                                 
    BEQ .justReturn                                            ;84CEDB|F027    |84CF04;
    REP #$30                                                   ;84CEDD|C230    |      ;
    LDA.W $09B1                                                ;84CEDF|ADB109  |0009B1;
    INC A                                                      ;84CEE2|1A      |      ;
    STA.W $09B1                                                ;84CEE3|8DB109  |0009B1;
    CMP.W #$0078                                               ;84CEE6|C97800  |      ;
    BNE .justReturn                                            ;84CEE9|D019    |84CF04;
    STZ.W $09B1                                                ;84CEEB|9CB109  |0009B1;
    JSL.L fDialog_EndDialogRestoreScroll                               ;84CEEE|22F99383|8393F9;
    SEP #$20                                                   ;84CEF2|E220    |      ;
    LDA.B #$01                                                 ;84CEF4|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;84CEF6|8D9A01  |00019A;
    REP #$20                                                   ;84CEF9|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84CEFB|AD2801  |000128;
    AND.W #$FF7F                                               ;84CEFE|297FFF  |      ;
    STA.W strcJoypad1.newInput                                 ;84CF01|8D2801  |000128;
 
.justReturn:
    RTL                                                        ;84CF04|6B      |      ;
 
 
fInput_DialogHandler:
    SEP #$20                                                   ;84CF05|E220    |      ;
    REP #$10                                                   ;84CF07|C210    |      ;
    LDA.W strcDialogDisplay.dialogFlags                        ;84CF09|AD9B01  |00019B;
    AND.B #!DFLAGS_UNK02                                                 
    BNE fInput_DialogHoldAFastText                                     ;84CF0E|D01D    |84CF2D;
    LDA.W strcDialogDisplay.dialogFlags                        ;84CF10|AD9B01  |00019B;
    AND.B #!DFLAGS_ENDDIALOG                                                 
    BNE fInput_DialogEndDialog                                 ;84CF15|D029    |84CF40;
    LDA.W strcDialogDisplay.dialogFlags                        ;84CF17|AD9B01  |00019B;
    AND.B #!DFLAGS_NEXTSCREEN                                                 
    BNE fInput_DialogNextScreen                                ;84CF1C|D044    |84CF62;
    LDA.W strcDialogDisplay.dialogFlags                        ;84CF1E|AD9B01  |00019B;
    AND.B #!DFLAGS_OPTIONS                                                 
    BNE fInput_DialogOptions                                   ;84CF23|D070    |84CF95;
    LDA.W strcDialogDisplay.dialogFlags                        ;84CF25|AD9B01  |00019B;
    AND.B #!DFLAGS_UNK20                                                 
    BNE fInput_DialogEndDialog                                 ;84CF2A|D014    |84CF40;
    RTL                                                        ;84CF2C|6B      |      ;
 
 
fInput_DialogHoldAFastText:
    REP #$30                                                   ;84CF2D|C230    |      ;
    LDA.W strcJoypad1.current                                  ;84CF2F|AD2401  |000124;
    BIT.W #!JOYPAD_A                                               
    BNE +                                                      ;84CF35|D001    |84CF38;
    RTL                                                        ;84CF37|6B      |      ;
 
 
  + SEP #$20                                                   ;84CF38|E220    |      ;
    LDA.B #$04                                                 ;84CF3A|A904    |      ;
    STA.W strcDialogDisplay.dialoUnk189                        ;84CF3C|8D8901  |000189;
    RTL                                                        ;84CF3F|6B      |      ;
 
 
fInput_DialogEndDialog:
    REP #$30                                                   ;84CF40|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84CF42|AD2801  |000128;
    BIT.W #!JOYPAD_A                                               
    BNE +                                                      ;84CF48|D001    |84CF4B;
    RTL                                                        ;84CF4A|6B      |      ;
 
 
  + JSL.L fDialog_EndDialogRestoreScroll                               ;84CF4B|22F99383|8393F9;
    SEP #$20                                                   ;84CF4F|E220    |      ;
    LDA.B #$01                                                 ;84CF51|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;84CF53|8D9A01  |00019A;
    REP #$20                                                   ;84CF56|C220    |      ;
    LDA.W strcJoypad1.newInput                                 ;84CF58|AD2801  |000128;
    AND.W #$FF7F                                               ;84CF5B|297FFF  |      ;
    STA.W strcJoypad1.newInput                                 ;84CF5E|8D2801  |000128;
    RTL                                                        ;84CF61|6B      |      ;
 
 
fInput_DialogNextScreen:
    REP #$30                                                   ;84CF62|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84CF64|AD2801  |000128;
    BIT.W #!JOYPAD_A                                               
    BNE +                                                      ;84CF6A|D001    |84CF6D;
    RTL                                                        ;84CF6C|6B      |      ;
 
 
  + JSL.L fDialog_ReloadFontTiles                               ;84CF6D|222D9383|83932D;
    REP #$20                                                   ;84CF71|C220    |      ;
    LDA.W strcDialogDisplay.dialogCurrentOffset                ;84CF73|AD8701  |000187;
    INC A                                                      ;84CF76|1A      |      ;
    STA.W strcDialogDisplay.dialogCurrentOffset                ;84CF77|8D8701  |000187;
    LDA.W #$5000                                               ;84CF7A|A90050  |      ;
    CLC                                                        ;84CF7D|18      |      ;
    ADC.W #$0010                                               ;84CF7E|691000  |      ;
    STA.W strcDialogDisplay.dialogUnk185                       ;84CF81|8D8501  |000185;
    SEP #$20                                                   ;84CF84|E220    |      ;
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;84CF86|9C8B01  |00018B;
    LDA.W strcDialogDisplay.dialogFlags                        ;84CF89|AD9B01  |00019B;
    AND.B #~!DFLAGS_NEXTSCREEN                                                 
    STA.W strcDialogDisplay.dialogFlags                        ;84CF8E|8D9B01  |00019B;
    STZ.W strcDialogDisplay.dialoUnk189                        ;84CF91|9C8901  |000189;
    RTL                                                        ;84CF94|6B      |      ;
 
 
fInput_DialogOptions:
    REP #$30                                                   ;84CF95|C230    |      ;
    LDA.W strcJoypad1.newInput                                 ;84CF97|AD2801  |000128;
    BIT.W #!JOYPAD_DOWN                                               
    BNE fInput_DialogOptions_Down                                   ;84CF9D|D04B    |84CFEA;
    LDA.W strcJoypad1.newInput                                 ;84CF9F|AD2801  |000128;
    BIT.W #!JOYPAD_UP                                               
    BEQ +                                                      ;84CFA5|F003    |84CFAA;
    JMP.W fInput_DialogOptions_Up                                 ;84CFA7|4C3AD0  |84D03A;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84CFAA|AD2801  |000128;
    BIT.W #!JOYPAD_RIGHT                                               
    BEQ +                                                      ;84CFB0|F003    |84CFB5;
    JMP.W fInput_DialogOptions_Right                                 ;84CFB2|4C8ED0  |84D08E;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84CFB5|AD2801  |000128;
    BIT.W #!JOYPAD_LEFT                                               
    BEQ +                                                      ;84CFBB|F003    |84CFC0;
    JMP.W fInput_DialogOptions_Left                                 ;84CFBD|4CF4D0  |84D0F4;
 
 
  + LDA.W strcJoypad1.newInput                                 ;84CFC0|AD2801  |000128;
    BIT.W #!JOYPAD_A                                               
    BEQ +                                                      ;84CFC6|F003    |84CFCB;
    JMP.W fInput_DialogOptions_Confirm                                 ;84CFC8|4CCCCF  |84CFCC;
 
 
  + RTL                                                        ;84CFCB|6B      |      ;
 
 
fInput_DialogOptions_Confirm:
    SEP #$20                                                   ;84CFCC|E220    |      ;
    REP #$10                                                   ;84CFCE|C210    |      ;
    LDA.B #$01                                                 ;84CFD0|A901    |      ;
    STA.W strcAudio.reg114                                     ;84CFD2|8D1401  |000114;
    LDA.B #$06                                                 ;84CFD5|A906    |      ;
    STA.W strcAudio.reg115                                     ;84CFD7|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84CFDA|22328383|838332;
    JSL.L fDialog_EndDialogRestoreScroll                               ;84CFDE|22F99383|8393F9;
    SEP #$20                                                   ;84CFE2|E220    |      ;
    LDA.B #$01                                                 ;84CFE4|A901    |      ;
    STA.W strcDialogDisplay.mapUnk19A                          ;84CFE6|8D9A01  |00019A;
    RTL                                                        ;84CFE9|6B      |      ;
 
 
fInput_DialogOptions_Down:
    SEP #$20                                                   ;84CFEA|E220    |      ;
    REP #$10                                                   ;84CFEC|C210    |      ;
    LDA.B #$03                                                 ;84CFEE|A903    |      ;
    STA.W strcAudio.reg114                                     ;84CFF0|8D1401  |000114;
    LDA.B #$06                                                 ;84CFF3|A906    |      ;
    STA.W strcAudio.reg115                                     ;84CFF5|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84CFF8|22328383|838332;
    REP #$30                                                   ;84CFFC|C230    |      ;
    LDX.W #$0001                                               ;84CFFE|A20100  |      ;
    LDA.W #!DIALOG_SPACE                                               
    JSL.L fDialog_TransferGlyph                                ;84D004|22239883|839823;
    SEP #$20                                                   ;84D008|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D00A|AD8F01  |00018F;
    CMP.B #$03                                                 ;84D00D|C903    |      ;
    BCC .label1                                                ;84D00F|900B    |84D01C;
    CMP.W strcDialogDisplay.dialogOptionsCount                 ;84D011|CD8E01  |00018E;
    BEQ .label2                                                ;84D014|F01A    |84D030;
    INC A                                                      ;84D016|1A      |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D017|8D8F01  |00018F;
    BRA fInput_DialogOptions_ResetBlink                                   ;84D01A|801A    |84D036;
 
 
.label1:
    CMP.W strcDialogDisplay.dialogOptionsCount                 ;84D01C|CD8E01  |00018E;
    BEQ +                                                      ;84D01F|F00A    |84D02B;
    CMP.B #$02                                                 ;84D021|C902    |      ;
    BEQ +                                                      ;84D023|F006    |84D02B;
    INC A                                                      ;84D025|1A      |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D026|8D8F01  |00018F;
    BRA fInput_DialogOptions_ResetBlink                                   ;84D029|800B    |84D036;
 
 
  + STZ.W strcDialogDisplay.dialogOptionsAnswer                ;84D02B|9C8F01  |00018F;
    BRA fInput_DialogOptions_ResetBlink                                   ;84D02E|8006    |84D036;
 
 
.label2:
    DEC A                                                      ;84D030|3A      |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D031|8D8F01  |00018F;
    BRA fInput_DialogOptions_ResetBlink                                   ;84D034|8000    |84D036;
 
 
fInput_DialogOptions_ResetBlink:
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;84D036|9C8B01  |00018B;
    RTL                                                        ;84D039|6B      |      ;
 
 
fInput_DialogOptions_Up:
    SEP #$20                                                   ;84D03A|E220    |      ;
    REP #$10                                                   ;84D03C|C210    |      ;
    LDA.B #$03                                                 ;84D03E|A903    |      ;
    STA.W strcAudio.reg114                                     ;84D040|8D1401  |000114;
    LDA.B #$06                                                 ;84D043|A906    |      ;
    STA.W strcAudio.reg115                                     ;84D045|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84D048|22328383|838332;
    REP #$30                                                   ;84D04C|C230    |      ;
    LDX.W #$0001                                               ;84D04E|A20100  |      ;
    LDA.W #!DIALOG_SPACE                                               
    JSL.L fDialog_TransferGlyph                                ;84D054|22239883|839823;
    SEP #$20                                                   ;84D058|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D05A|AD8F01  |00018F;
    BEQ .label1                                                ;84D05D|F00A    |84D069;
    CMP.B #$03                                                 ;84D05F|C903    |      ;
    BEQ .label2                                                ;84D061|F019    |84D07C;
    DEC A                                                      ;84D063|3A      |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D064|8D8F01  |00018F;
    BRA fInput_DialogOptions_ResetBlink                                   ;84D067|80CD    |84D036;
 
 
.label1:
    LDA.W strcDialogDisplay.dialogOptionsCount                 ;84D069|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D06C|C903    |      ;
    BCC +                                                      ;84D06E|9007    |84D077;
    LDA.B #$02                                                 ;84D070|A902    |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D072|8D8F01  |00018F;
    BRA .return                                                ;84D075|8013    |84D08A;
 
 
  + STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D077|8D8F01  |00018F;
    BRA .return                                                ;84D07A|800E    |84D08A;
 
 
.label2:
    LDA.W strcDialogDisplay.dialogOptionsCount                 ;84D07C|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D07F|C903    |      ;
    BEQ .return                                                ;84D081|F007    |84D08A;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D083|AD8F01  |00018F;
    INC A                                                      ;84D086|1A      |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D087|8D8F01  |00018F;
 
.return:
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;84D08A|9C8B01  |00018B;
    RTL                                                        ;84D08D|6B      |      ;
 
 
fInput_DialogOptions_Right:
    SEP #$20                                                   ;84D08E|E220    |      ;
    REP #$10                                                   ;84D090|C210    |      ;
    LDA.B #$03                                                 ;84D092|A903    |      ;
    STA.W strcAudio.reg114                                     ;84D094|8D1401  |000114;
    LDA.B #$06                                                 ;84D097|A906    |      ;
    STA.W strcAudio.reg115                                     ;84D099|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84D09C|22328383|838332;
    SEP #$20                                                   ;84D0A0|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsCount                 ;84D0A2|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D0A5|C903    |      ;
    BCC .return                                                ;84D0A7|9047    |84D0F0;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D0A9|AD8F01  |00018F;
    CMP.B #$02                                                 ;84D0AC|C902    |      ;
    BEQ .return                                                ;84D0AE|F040    |84D0F0;
    REP #$30                                                   ;84D0B0|C230    |      ;
    LDX.W #$0001                                               ;84D0B2|A20100  |      ;
    LDA.W #!DIALOG_SPACE                                               
    JSL.L fDialog_TransferGlyph                                ;84D0B8|22239883|839823;
    SEP #$20                                                   ;84D0BC|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D0BE|AD8F01  |00018F;
    CMP.B #$02                                                 ;84D0C1|C902    |      ;
    BCC +                                                      ;84D0C3|9008    |84D0CD;
    SEC                                                        ;84D0C5|38      |      ;
    SBC.B #$03                                                 ;84D0C6|E903    |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D0C8|8D8F01  |00018F;
    BRA .return                                                ;84D0CB|8023    |84D0F0;
 
 
  + SEP #$20                                                   ;84D0CD|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D0CF|AD8F01  |00018F;
    CMP.B #$01                                                 ;84D0D2|C901    |      ;
    BEQ +                                                      ;84D0D4|F008    |84D0DE;
    CLC                                                        ;84D0D6|18      |      ;
    ADC.B #$03                                                 ;84D0D7|6903    |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D0D9|8D8F01  |00018F;
    BRA .return                                                ;84D0DC|8012    |84D0F0;
 
 
  + SEP #$20                                                   ;84D0DE|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsCount                 ;84D0E0|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D0E3|C903    |      ;
    BEQ .return                                                ;84D0E5|F009    |84D0F0;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D0E7|AD8F01  |00018F;
    CLC                                                        ;84D0EA|18      |      ;
    ADC.B #$03                                                 ;84D0EB|6903    |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D0ED|8D8F01  |00018F;
 
.return:
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;84D0F0|9C8B01  |00018B;
    RTL                                                        ;84D0F3|6B      |      ;
 
 
fInput_DialogOptions_Left:
    SEP #$20                                                   ;84D0F4|E220    |      ;
    REP #$10                                                   ;84D0F6|C210    |      ;
    LDA.B #$03                                                 ;84D0F8|A903    |      ;
    STA.W strcAudio.reg114                                     ;84D0FA|8D1401  |000114;
    LDA.B #$06                                                 ;84D0FD|A906    |      ;
    STA.W strcAudio.reg115                                     ;84D0FF|8D1501  |000115;
    JSL.L fAudioSetRegister2to0A                               ;84D102|22328383|838332;
    SEP #$20                                                   ;84D106|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsCount                 ;84D108|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D10B|C903    |      ;
    BCC .return                                                ;84D10D|9047    |84D156;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D10F|AD8F01  |00018F;
    CMP.B #$02                                                 ;84D112|C902    |      ;
    BEQ .return                                                ;84D114|F040    |84D156;
    REP #$30                                                   ;84D116|C230    |      ;
    LDX.W #$0001                                               ;84D118|A20100  |      ;
    LDA.W #!DIALOG_SPACE                                               
    JSL.L fDialog_TransferGlyph                                ;84D11E|22239883|839823;
    SEP #$20                                                   ;84D122|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D124|AD8F01  |00018F;
    CMP.B #$02                                                 ;84D127|C902    |      ;
    BCC +                                                      ;84D129|9008    |84D133;
    SEC                                                        ;84D12B|38      |      ;
    SBC.B #$03                                                 ;84D12C|E903    |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D12E|8D8F01  |00018F;
    BRA .return                                                ;84D131|8023    |84D156;
 
 
  + SEP #$20                                                   ;84D133|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D135|AD8F01  |00018F;
    CMP.B #$01                                                 ;84D138|C901    |      ;
    BEQ +                                                      ;84D13A|F008    |84D144;
    CLC                                                        ;84D13C|18      |      ;
    ADC.B #$03                                                 ;84D13D|6903    |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D13F|8D8F01  |00018F;
    BRA .return                                                ;84D142|8012    |84D156;
 
 
  + SEP #$20                                                   ;84D144|E220    |      ;
    LDA.W strcDialogDisplay.dialogOptionsCount                 ;84D146|AD8E01  |00018E;
    CMP.B #$03                                                 ;84D149|C903    |      ;
    BEQ .return                                                ;84D14B|F009    |84D156;
    LDA.W strcDialogDisplay.dialogOptionsAnswer                ;84D14D|AD8F01  |00018F;
    CLC                                                        ;84D150|18      |      ;
    ADC.B #$03                                                 ;84D151|6903    |      ;
    STA.W strcDialogDisplay.dialogOptionsAnswer                ;84D153|8D8F01  |00018F;
 
.return:
    STZ.W strcDialogDisplay.dialogBlinkTimer                   ;84D156|9C8B01  |00018B;
    RTL                                                        ;84D159|6B      |      ;
 
 
    pad $84FFFF
