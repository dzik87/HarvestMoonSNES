                       ptrUnknown0x0D = $00000D; !^ ptr24 ^!;      |        |      ;
;                       ptrUnknown0x0D+2 = $00000F           ;      |        |      ;
                       ptrUnknown0x42 = $000042; !^ 16 * ptr24 ^!;      |        |      ;
;                       ptrUnknown0x42+2 = $000044           ;      |        |      ;
                       ptrUnknown0x72 = $000072; !^ ptr24 - in post cases ^!;      |        |      ;
;                       ptrUnknown0x72+2 = $000074           ;      |        |      ;
                       nPlayerPosX = $0000D6; !^ n16 ^!     ;      |        |      ;
                       nPlayerPosY = $0000D8; !^ n16 ^!     ;      |        |      ;
                       nDestinationX = $00017D; !^ n16 (used when we change map) ^!;      |        |      ;
                       nDestinationY = $00017F; !^ n16 (used when we change map) ^!;      |        |      ;
                       nDialogIndex = $000183; !^ n16, Current dialog index ^!;      |        |      ;
                       sPlayerNameShort = $000881; !^ 4 * s8 ^!;      |        |      ;
;                       sPlayerNameShort+1 = $000882; !^ 2 ^!;      |        |      ;
;                       sPlayerNameShort+2 = $000883; !^ 3 ^!;      |        |      ;
;                       sPlayerNameShort+3 = $000884; !^ 4 ^!;      |        |      ;
                       sTempNameVariable = $000885; !^ 4 * s8 ^!;      |        |      ;
;                       sTempNameVariable+1 = $000886; !^ 2 ^!;      |        |      ;
;                       sTempNameVariable+2 = $000887; !^ 3 ^!;      |        |      ;
;                       sTempNameVariable+3 = $000888; !^ 4 ^!;      |        |      ;
                       sDogNameShort = $000899; !^ 4 * s8 ^!;      |        |      ;
;                       sDogNameShort+1 = $00089A; !^ 2 ^!   ;      |        |      ;
;                       sDogNameShort+2 = $00089B; !^ 3 ^!   ;      |        |      ;
;                       sDogNameShort+3 = $00089C; !^ 4 ^!   ;      |        |      ;
                       sHorseNameShort = $00089D; !^ 4 * s8 ^!;      |        |      ;
;                       sHorseNameShort+1 = $00089E; !^ 2 ^! ;      |        |      ;
;                       sHorseNameShort+2 = $00089F; !^ 3 ^! ;      |        |      ;
;                       sHorseNameShort+3 = $0008A0; !^ 4 ^! ;      |        |      ;
                       sSeasonName = $0008B3; !^ 6 * s8 ^!  ;      |        |      ;
;                       sSeasonName+2 = $0008B5; !^ 2 ^!     ;      |        |      ;
;                       sSeasonName+4 = $0008B7; !^ 3 ^!     ;      |        |      ;
;                       sSeasonName+6 = $0008B9; !^ 4 ^!     ;      |        |      ;
;                       sSeasonName+8 = $0008BB; !^ 5 ^!     ;      |        |      ;
;                       sSeasonName+10 = $0008BD; !^ 6 ^!    ;      |        |      ;
                       sWeekdayName = $0008BF; !^ 9 * s16 ^!;      |        |      ;
;                       sWeekdayName+2 = $0008C1; !^ 2 ^!    ;      |        |      ;
;                       sWeekdayName+4 = $0008C3; !^ 3 ^!    ;      |        |      ;
;                       sWeekdayName+6 = $0008C5; !^ 4 ^!    ;      |        |      ;
;                       sWeekdayName+8 = $0008C7; !^ 5 ^!    ;      |        |      ;
;                       sWeekdayName+10 = $0008C9; !^ 6 ^!   ;      |        |      ;
;                       sWeekdayName+12 = $0008CB; !^ 7 ^!   ;      |        |      ;
;                       sWeekdayName+14 = $0008CD; !^ 8 ^!   ;      |        |      ;
;                       sWeekdayName+16 = $0008CF; !^ 9 ^!   ;      |        |      ;
                       sNumberOrdinal = $0008D1; !^ 2 * s16 ^!;      |        |      ;
;                       sNumberOrdinal+2 = $0008D3; !^ 2 ^!  ;      |        |      ;
                       sPlayerNameLong = $0008D5; !^ 4 * s16 ^!;      |        |      ;
;                       sPlayerNameLong+2 = $0008D7; !^ 2 ^! ;      |        |      ;
;                       sPlayerNameLong+4 = $0008D9; !^ 3 ^! ;      |        |      ;
;                       sPlayerNameLong+6 = $0008DB; !^ 4 ^! ;      |        |      ;
                       sDogNameLong = $0008DD; !^ 4 * s16 ^!;      |        |      ;
;                       sDogNameLong+2 = $0008DF; !^ 2 ^!    ;      |        |      ;
;                       sDogNameLong+4 = $0008E1; !^ 3 ^!    ;      |        |      ;
;                       sDogNameLong+6 = $0008E3; !^ 4 ^!    ;      |        |      ;
                       sHorseNameLong = $0008E5; !^ 4 * s16 ^!;      |        |      ;
;                       sHorseNameLong+2 = $0008E7; !^ 2 ^!  ;      |        |      ;
;                       sHorseNameLong+4 = $0008E9; !^ 3 ^!  ;      |        |      ;
;                       sHorseNameLong+6 = $0008EB; !^ 4 ^!  ;      |        |      ;
                       sFirstChildNameLong = $0008ED; !^ 4 * s16 ^!;      |        |      ;
;                       sFirstChildNameLong+2 = $0008EF; !^ 2 ^!;      |        |      ;
;                       sFirstChildNameLong+4 = $0008F1; !^ 3 ^!;      |        |      ;
;                       sFirstChildNameLong+6 = $0008F3; !^ 4 ^!;      |        |      ;
                       sSecondChildNameLong = $0008F5; !^ 4 * s16 ^!;      |        |      ;
;                       sSecondChildNameLong+2 = $0008F7; !^ 2 ^!;      |        |      ;
;                       sSecondChildNameLong+4 = $0008F9; !^ 3 ^!;      |        |      ;
;                       sSecondChildNameLong+6 = $0008FB; !^ 4 ^!;      |        |      ;
                       nTimeState = $000973; !^ n16, 00 - stop, 01- run, 02 - skip to next day ^!;      |        |      ;
                       nUnknownX = $000980; !^ n16 ^!       ;      |        |      ;
                       nUnknownY = $000982; !^ n16 ^!       ;      |        |      ;
                       nCarriedItemId = $000984; !^ n16 ^!  ;      |        |      ;
                       SNES_INIDISP = $002100               ;      |        |      ;
                       SNES_OBSEL = $002101                 ;      |        |      ;
                       SNES_OAMADDL = $002102               ;      |        |      ;
                       SNES_OAMADDH = $002103               ;      |        |      ;
                       SNES_OAMDATA = $002104               ;      |        |      ;
                       SNES_BGMODE = $002105                ;      |        |      ;
                       SNES_MOSAIC = $002106                ;      |        |      ;
                       SNES_BG1SC = $002107                 ;      |        |      ;
                       SNES_BG2SC = $002108                 ;      |        |      ;
                       SNES_BG3SC = $002109                 ;      |        |      ;
                       SNES_BG12NBA = $00210B               ;      |        |      ;
                       SNES_BG34NBA = $00210C               ;      |        |      ;
                       SNES_BG1HOFS = $00210D               ;      |        |      ;
                       SNES_BG1VOFS = $00210E               ;      |        |      ;
                       SNES_BG2HOFS = $00210F               ;      |        |      ;
                       SNES_BG2VOFS = $002110               ;      |        |      ;
                       SNES_BG3HOFS = $002111               ;      |        |      ;
                       SNES_BG3VOFS = $002112               ;      |        |      ;
                       SNES_BG4HOFS = $002113               ;      |        |      ;
                       SNES_BG4VOFS = $002114               ;      |        |      ;
                       SNES_VMAIN = $002115                 ;      |        |      ;
                       SNES_VMADDL = $002116                ;      |        |      ;
                       SNES_VMADDH = $002117                ;      |        |      ;
                       SNES_VMDATAL = $002118               ;      |        |      ;
                       SNES_VMDATAH = $002119               ;      |        |      ;
                       SNES_M7SEL = $00211A                 ;      |        |      ;
                       SNES_M7A = $00211B                   ;      |        |      ;
                       SNES_M7B = $00211C                   ;      |        |      ;
                       SNES_M7C = $00211D                   ;      |        |      ;
                       SNES_M7D = $00211E                   ;      |        |      ;
                       SNES_M7X = $00211F                   ;      |        |      ;
                       SNES_M7Y = $002120                   ;      |        |      ;
                       SNES_CGADD = $002121                 ;      |        |      ;
                       SNES_CGDATA = $002122                ;      |        |      ;
                       SNES_W12SEL = $002123                ;      |        |      ;
                       SNES_W34SEL = $002124                ;      |        |      ;
                       SNES_WOBJSEL = $002125               ;      |        |      ;
                       SNES_WH0 = $002126                   ;      |        |      ;
                       SNES_WH1 = $002127                   ;      |        |      ;
                       SNES_WH2 = $002128                   ;      |        |      ;
                       SNES_WH3 = $002129                   ;      |        |      ;
                       SNES_WBGLOG = $00212A                ;      |        |      ;
                       SNES_WOBJLOG = $00212B               ;      |        |      ;
                       SNES_TM = $00212C                    ;      |        |      ;
                       SNES_TS = $00212D                    ;      |        |      ;
                       SNES_TMW = $00212E                   ;      |        |      ;
                       SNES_TSW = $00212F                   ;      |        |      ;
                       SNES_CGWSEL = $002130                ;      |        |      ;
                       SNES_CGADSUB = $002131               ;      |        |      ;
                       SNES_COLDATA = $002132               ;      |        |      ;
                       SNES_SETINI = $002133                ;      |        |      ;
                       SNES_MPYL = $002134                  ;      |        |      ;
                       SNES_MPYM = $002135                  ;      |        |      ;
                       SNES_MPYH = $002136                  ;      |        |      ;
                       SNES_SLHV = $002137                  ;      |        |      ;
                       SNES_OAMDATAREAD = $002138           ;      |        |      ;
                       SNES_VMDATALREAD = $002139           ;      |        |      ;
                       SNES_VMDATAHREAD = $00213A           ;      |        |      ;
                       SNES_CGDATAREAD = $00213B            ;      |        |      ;
                       SNES_OPHCT = $00213C                 ;      |        |      ;
                       SNES_OPVCT = $00213D                 ;      |        |      ;
                       SNES_STAT77 = $00213E                ;      |        |      ;
                       SNES_STAT78 = $00213F                ;      |        |      ;
                       SNES_APUIO0 = $002140                ;      |        |      ;
                       SNES_APUIO1 = $002141                ;      |        |      ;
                       SNES_APUIO2 = $002142                ;      |        |      ;
                       SNES_APUIO3 = $002143                ;      |        |      ;
                       SNES_WMDATA = $002180                ;      |        |      ;
                       SNES_WMADDL = $002181                ;      |        |      ;
                       SNES_WMADDM = $002182                ;      |        |      ;
                       SNES_WMADDH = $002183                ;      |        |      ;
                       SNES_JOYSER0 = $004016               ;      |        |      ;
                       SNES_JOYSER1 = $004017               ;      |        |      ;
                       SNES_NMITIMEN = $004200              ;      |        |      ;
                       SNES_WRIO = $004201                  ;      |        |      ;
                       SNES_WRMPYA = $004202                ;      |        |      ;
                       SNES_WRMPYB = $004203                ;      |        |      ;
                       SNES_WRDIVL = $004204                ;      |        |      ;
                       SNES_WRDIVH = $004205                ;      |        |      ;
                       SNES_WRDIVB = $004206                ;      |        |      ;
                       SNES_HTIMEL = $004207                ;      |        |      ;
                       SNES_HTIMEH = $004208                ;      |        |      ;
                       SNES_VTIMEL = $004209                ;      |        |      ;
                       SNES_VTIMEH = $00420A                ;      |        |      ;
                       SNES_MDMAEN = $00420B                ;      |        |      ;
                       SNES_HDMAEN = $00420C                ;      |        |      ;
                       SNES_MEMSEL = $00420D                ;      |        |      ;
                       SNES_RDNMI = $004210                 ;      |        |      ;
                       SNES_TIMEUP = $004211                ;      |        |      ;
                       SNES_HVBJOY = $004212                ;      |        |      ;
                       SNES_RDIO = $004213                  ;      |        |      ;
                       SNES_RDDIVL = $004214                ;      |        |      ;
                       SNES_RDDIVH = $004215                ;      |        |      ;
                       SNES_RDMPYL = $004216                ;      |        |      ;
                       SNES_RDMPYH = $004217                ;      |        |      ;
                       SNES_JOY1L = $004218                 ;      |        |      ;
                       SNES_JOY1H = $004219                 ;      |        |      ;
                       SNES_JOY2L = $00421A                 ;      |        |      ;
                       SNES_JOY2H = $00421B                 ;      |        |      ;
                       SNES_JOY3L = $00421C                 ;      |        |      ;
                       SNES_JOY3H = $00421D                 ;      |        |      ;
                       SNES_JOY4L = $00421E                 ;      |        |      ;
                       SNES_JOY4H = $00421F                 ;      |        |      ;
                       SNES_DMAP0 = $004300                 ;      |        |      ;
                       SNES_BBAD0 = $004301                 ;      |        |      ;
                       SNES_A1T0L = $004302                 ;      |        |      ;
                       SNES_A1T0H = $004303                 ;      |        |      ;
                       SNES_A1B0 = $004304                  ;      |        |      ;
                       SNES_DAS0L = $004305                 ;      |        |      ;
                       SNES_DAS0H = $004306                 ;      |        |      ;
                       SNES_DASB0 = $004307                 ;      |        |      ;
                       SNES_A2A0L = $004308                 ;      |        |      ;
                       SNES_A2A0H = $004309                 ;      |        |      ;
                       SNES_NTLR0 = $00430A                 ;      |        |      ;
                       SNES_DMAP1 = $004310                 ;      |        |      ;
                       SNES_BBAD1 = $004311                 ;      |        |      ;
                       SNES_A1T1L = $004312                 ;      |        |      ;
                       SNES_A1T1H = $004313                 ;      |        |      ;
                       SNES_A1B1 = $004314                  ;      |        |      ;
                       SNES_DAS1L = $004315                 ;      |        |      ;
                       SNES_DAS1H = $004316                 ;      |        |      ;
                       SNES_DASB1 = $004317                 ;      |        |      ;
                       SNES_A2A1L = $004318                 ;      |        |      ;
                       SNES_A2A1H = $004319                 ;      |        |      ;
                       SNES_NTLR1 = $00431A                 ;      |        |      ;
                       SNES_DMAP2 = $004320                 ;      |        |      ;
                       SNES_BBAD2 = $004321                 ;      |        |      ;
                       SNES_A1T2L = $004322                 ;      |        |      ;
                       SNES_A1T2H = $004323                 ;      |        |      ;
                       SNES_A1B2 = $004324                  ;      |        |      ;
                       SNES_DAS2L = $004325                 ;      |        |      ;
                       SNES_DAS2H = $004326                 ;      |        |      ;
                       SNES_DASB2 = $004327                 ;      |        |      ;
                       SNES_A2A2L = $004328                 ;      |        |      ;
                       SNES_A2A2H = $004329                 ;      |        |      ;
                       SNES_NTLR2 = $00432A                 ;      |        |      ;
                       SNES_DMAP3 = $004330                 ;      |        |      ;
                       SNES_BBAD3 = $004331                 ;      |        |      ;
                       SNES_A1T3L = $004332                 ;      |        |      ;
                       SNES_A1T3H = $004333                 ;      |        |      ;
                       SNES_A1B3 = $004334                  ;      |        |      ;
                       SNES_DAS3L = $004335                 ;      |        |      ;
                       SNES_DAS3H = $004336                 ;      |        |      ;
                       SNES_DASB3 = $004337                 ;      |        |      ;
                       SNES_A2A3L = $004338                 ;      |        |      ;
                       SNES_A2A3H = $004339                 ;      |        |      ;
                       SNES_NTLR3 = $00433A                 ;      |        |      ;
                       SNES_DMAP4 = $004340                 ;      |        |      ;
                       SNES_BBAD4 = $004341                 ;      |        |      ;
                       SNES_A1T4L = $004342                 ;      |        |      ;
                       SNES_A1T4H = $004343                 ;      |        |      ;
                       SNES_A1B4 = $004344                  ;      |        |      ;
                       SNES_DAS4L = $004345                 ;      |        |      ;
                       SNES_DAS4H = $004346                 ;      |        |      ;
                       SNES_DASB4 = $004347                 ;      |        |      ;
                       SNES_A2A4L = $004348                 ;      |        |      ;
                       SNES_A2A4H = $004349                 ;      |        |      ;
                       SNES_NTLR4 = $00434A                 ;      |        |      ;
                       SNES_DMAP5 = $004350                 ;      |        |      ;
                       SNES_BBAD5 = $004351                 ;      |        |      ;
                       SNES_A1T5L = $004352                 ;      |        |      ;
                       SNES_A1T5H = $004353                 ;      |        |      ;
                       SNES_A1B5 = $004354                  ;      |        |      ;
                       SNES_DAS5L = $004355                 ;      |        |      ;
                       SNES_DAS5H = $004356                 ;      |        |      ;
                       SNES_DASB5 = $004357                 ;      |        |      ;
                       SNES_A2A5L = $004358                 ;      |        |      ;
                       SNES_A2A5H = $004359                 ;      |        |      ;
                       SNES_NTLR5 = $00435A                 ;      |        |      ;
                       SNES_DMAP6 = $004360                 ;      |        |      ;
                       SNES_BBAD6 = $004361                 ;      |        |      ;
                       SNES_A1T6L = $004362                 ;      |        |      ;
                       SNES_A1T6H = $004363                 ;      |        |      ;
                       SNES_A1B6 = $004364                  ;      |        |      ;
                       SNES_DAS6L = $004365                 ;      |        |      ;
                       SNES_DAS6H = $004366                 ;      |        |      ;
                       SNES_DASB6 = $004367                 ;      |        |      ;
                       SNES_A2A6L = $004368                 ;      |        |      ;
                       SNES_A2A6H = $004369                 ;      |        |      ;
                       SNES_NTLR6 = $00436A                 ;      |        |      ;
                       SNES_DMAP7 = $004370                 ;      |        |      ;
                       SNES_BBAD7 = $004371                 ;      |        |      ;
                       SNES_A1T7L = $004372                 ;      |        |      ;
                       SNES_A1T7H = $004373                 ;      |        |      ;
                       SNES_A1B7 = $004374                  ;      |        |      ;
                       SNES_DAS7L = $004375                 ;      |        |      ;
                       SNES_DAS7H = $004376                 ;      |        |      ;
                       SNES_DASB7 = $004377                 ;      |        |      ;
                       SNES_A2A7L = $004378                 ;      |        |      ;
                       SNES_A2A7H = $004379                 ;      |        |      ;
                       SNES_NTLR7 = $00437A                 ;      |        |      ;
                       pCowData = $00C1C6; !^ pointer to 16bytes * 10 ^!;      |        |      ;
                       pChickenData = $00C286; !^ pointer to 8bytes * 10 ^!;      |        |      ;
                       nPlayersStamina = $7E0917            ;      |        |      ;
                       nPlayersEnergy = $7E0918             ;      |        |      ;
                       nWeatherForecastID = $7E098C         ;      |        |      ;
                       sShedItems = $7F1F00; !^ strSheedItems ^!;      |        |      ;
;                       sShedItems+1 = $7F1F01               ;      |        |      ;
;                       sShedItems+2 = $7F1F02               ;      |        |      ;
;                       sShedItems+3 = $7F1F03               ;      |        |      ;
                       nMoney = $7F1F04; !^ n24 ^!          ;      |        |      ;
;                       nMoney+2 = $7F1F06                   ;      |        |      ;
                       nShippingProfit = $7F1F07; !^ n24 ^! ;      |        |      ;
;                       nShippingProfit+2 = $7F1F09          ;      |        |      ;
                       nCurrentYearID = $7F1F18; !^ n8, 00 - 1st Year, 01 - 2nd Year, 03 - 3rd Year ^!;      |        |      ;
                       nCurrentSeasonID = $7F1F19; !^ n8 ^! ;      |        |      ;
                       nCurrentWeekdayID = $7F1F1A; !^ n8 ^!;      |        |      ;
                       nCurrentDay = $7F1F1B; !^ n8 ^!      ;      |        |      ;
                       nCurrentTimeID = $7F1F1C; !^ n8 ^!   ;      |        |      ;
                       PowerBerryEaten = $7F1F36; !^ n8 range 00h-0Ah, (ammount of flowers in garden) ^!;      |        |      ;
                       nFirstChildAge = $7F1F37; !^ n16 ^!  ;      |        |      ;
                       nSecondChildAge = $7F1F39; !^ n16 ^! ;      |        |      ;
                       PrengacyFlag = $7F1F3B               ;      |        |      ;
                       sFirstChildNameShort = $7F1F3D; !^ 4 * s16 ^!;      |        |      ;
;                       sFirstChildNameShort+1 = $7F1F3E; !^ 2 ^!;      |        |      ;
;                       sFirstChildNameShort+2 = $7F1F3F; !^ 3 ^!;      |        |      ;
;                       sFirstChildNameShort+3 = $7F1F40; !^ 4 ^!;      |        |      ;
                       sSecondChildNameShort = $7F1F41; !^ 4 * s8 ^!;      |        |      ;
;                       sSecondChildNameShort+1 = $7F1F42; !^ 2 ^!;      |        |      ;
;                       sSecondChildNameShort+2 = $7F1F43; !^ 3 ^!;      |        |      ;
;                       sSecondChildNameShort+3 = $7F1F44; !^ 4 ^!;      |        |      ;
                       nStatShippedCorns = $7F1F4A; !^ n16 ^!;      |        |      ;
                       nStatShippedTomatoes = $7F1F4C; !^ n16 ^!;      |        |      ;
                       nStatShippedTurnips = $7F1F4E; !^ n16 ^!;      |        |      ;
                       nStatShippedPotatoes = $7F1F50; !^ n16 ^!;      |        |      ;
                       RanchDevelopmentRate = $7F1F56; !^ range 00h-64h ^!;      |        |      ;
                       MarriedGirlID = $7F1F66              ;      |        |      ;
                       PlayerHasHorse = $7F1F69; !^ 00 - No, 01 - Yes ^!;      |        |      ;
                       ;      |        |      ;
                       Table_858C8E = $858C8E               ;      |        |      ;
                       PTR16_80FFFF = $80FFFF               ;      |        |      ;
                       LOOSE_OP_81A901 = $81A901            ;      |        |      ;
                       DATA16_9282CB = $9282CB              ;      |        |      ;
                       DATA16_92BB03 = $92BB03              ;      |        |      ;
                       DATA16_92D3AB = $92D3AB              ;      |        |      ;
                       DATA16_93D049 = $93D049              ;      |        |      ;
                       DATA16_93E12B = $93E12B              ;      |        |      ;
                       DATA16_95E8A3 = $95E8A3              ;      |        |      ;
                       DATA16_969437 = $969437              ;      |        |      ;
                       DATA16_96AD11 = $96AD11              ;      |        |      ;
                       DATA16_96C489 = $96C489              ;      |        |      ;
                       DATA16_96DC6D = $96DC6D              ;      |        |      ;
                       DATA16_97B45F = $97B45F              ;      |        |      ;
                       DATA16_98AEDB = $98AEDB              ;      |        |      ;
                       DATA16_98CC6B = $98CC6B              ;      |        |      ;
                       DATA16_98E41D = $98E41D              ;      |        |      ;
                       DATA16_99AEC3 = $99AEC3              ;      |        |      ;
                       DATA16_99DCBD = $99DCBD              ;      |        |      ;
                       DATA16_9A9921 = $9A9921              ;      |        |      ;
                       DATA16_9AAEAB = $9AAEAB              ;      |        |      ;
                       DATA16_9ABF97 = $9ABF97              ;      |        |      ;
                       DATA16_9AC489 = $9AC489              ;      |        |      ;
                       DATA16_9ACB41 = $9ACB41              ;      |        |      ;
                       DATA16_9AD357 = $9AD357              ;      |        |      ;
                       DATA16_9AE02D = $9AE02D              ;      |        |      ;
                       DATA16_9B8441 = $9B8441              ;      |        |      ;
                       DATA16_9B86AD = $9B86AD              ;      |        |      ;
                       DATA16_9B9F53 = $9B9F53              ;      |        |      ;
                       DATA16_9BB76D = $9BB76D              ;      |        |      ;
                       DATA16_9BCF8F = $9BCF8F              ;      |        |      ;
                       DATA16_9C965F = $9C965F              ;      |        |      ;
                       DATA16_9CCBA3 = $9CCBA3              ;      |        |      ;
                       DATA16_9CE37D = $9CE37D              ;      |        |      ;
                       DATA16_9DCE31 = $9DCE31              ;      |        |      ;
                       DATA16_9E9C6D = $9E9C6D              ;      |        |      ;
                       DATA16_9EB75D = $9EB75D              ;      |        |      ;
                       DATA16_9EEB3D = $9EEB3D              ;      |        |      ;
                       DATA16_9FAA75 = $9FAA75              ;      |        |      ;
                       DATA16_9FEF97 = $9FEF97              ;      |        |      ;
                       DATA16_A088E9 = $A088E9              ;      |        |      ;
                       DATA16_A0CAAF = $A0CAAF              ;      |        |      ;
                       DATA16_A48A2D = $A48A2D              ;      |        |      ;
                       DATA16_A49745 = $A49745              ;      |        |      ;
                       DATA16_A4A597 = $A4A597              ;      |        |      ;
                       DATA16_A4AA99 = $A4AA99              ;      |        |      ;
                       DATA16_A4AE95 = $A4AE95              ;      |        |      ;
                       DATA16_A4B3D1 = $A4B3D1              ;      |        |      ;
                       DATA16_A4BCC1 = $A4BCC1              ;      |        |      ;
                       DATA16_A4C065 = $A4C065              ;      |        |      ;
                       DATA16_A4CFAB = $A4CFAB              ;      |        |      ;
                       DATA16_A4D379 = $A4D379              ;      |        |      ;
                       DATA16_A58327 = $A58327              ;      |        |      ;
                       DATA16_A58B49 = $A58B49              ;      |        |      ;
                       DATA16_A5970F = $A5970F              ;      |        |      ;
                       DATA16_A59E0B = $A59E0B              ;      |        |      ;
                       DATA16_A5A3D5 = $A5A3D5              ;      |        |      ;
                       DATA16_A5AD17 = $A5AD17              ;      |        |      ;
                       DATA16_A5B361 = $A5B361              ;      |        |      ;
                       DATA16_A5B63B = $A5B63B              ;      |        |      ;
                       DATA16_A5B943 = $A5B943              ;      |        |      ;
                       DATA16_A5C4CD = $A5C4CD              ;      |        |      ;
                       DATA16_A5C955 = $A5C955              ;      |        |      ;
                       DATA16_A5E253 = $A5E253              ;      |        |      ;
                       DATA16_A5E977 = $A5E977              ;      |        |      ;
                       DATA16_A5ECFB = $A5ECFB              ;      |        |      ;
                       DATA16_A5F059 = $A5F059              ;      |        |      ;
                       DATA16_A5F671 = $A5F671              ;      |        |      ;
                       DATA16_A68229 = $A68229              ;      |        |      ;
                       DATA16_A68433 = $A68433              ;      |        |      ;
                       DATA16_A68DCF = $A68DCF              ;      |        |      ;
                       EMPTY_FFFFFF = $FFFFFF               ;      |        |      ;
