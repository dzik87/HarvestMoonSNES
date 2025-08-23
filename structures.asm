;
; 1-3       ptrCurrentDialog            ptr24
;


;
; 4-5       ptrPaletteNext              ptr24
;


;
; 7-9       ptrUnknown0x07              ptr24
;


;
; A-C       ptrAudioData                ptr24
;


;
; Size and start OK
;
struct strcMap              $7E000D
    .pSelected              : skip 3    ; 0D-0F     ptr24
    .unk10                  : skip 2    ; 10-11
    .unk12                  : skip 2    ; 12-13
    .unk14                  : skip 2    ; 14-14
    .unk16                  : skip 2    ; 16-17
    .pCurrent               : skip 4    ; 18-1B     ptr24 - 1B not used, end of struct ?
    .unk1C                  : skip 2    ; 1C-1D
    .unk1E                  : skip 2    ; 1E-1F
    .unk20                  : skip 1    ; 20
    .unk21                  : skip 1    ; 21
    .loadAreaId             : skip 1    ; 22
endstruct align 22


;
; Size and start OK - System stuff - require more attention to actually figure out what is what
;
struct strcSystem           $7E0023
    .unk23                  : skip 1    ; 23
    .INIDISP                : skip 1    ; 24        SNES_INIDISP
    .nBrightness            : skip 1    ; 25
    .nBrightnessStep        : skip 1    ; 26
    .arrayIndex             : skip 1    ; 27
    .DMAchannelFlags        : skip 1    ; 28
    .destinationRegister    : skip 1    ; 29        SNES_BBAD0
    .array2A                : skip 1*8  ; 2A-31
    .array32                : skip 2*8  ; 32-41
endstruct align 31


;
; 42-71     ptrUnknown0x42              16 * ptr24
;


;
; 72-74     ptrUnknown0x72              ptr24
;


;
; 75-77     ptrUnknown0x75              ptr24
;


;
; 78-7A     ptrObjectData               ptr24
;


;
; 7B-7D not used
;


;
; 7E - 91 Variables used everywhere
;
struct strcVariables        $7E007E
    .n16Temp1               : skip 2    ; 7E-7F
    .n16Temp2               : skip 2    ; 80-81
    .n16Temp3               : skip 2    ; 82-83
    .n16Temp4               : skip 2    ; 84-85
    .n16Unk86               : skip 2    ; 86-87
    .n16Unk88               : skip 2    ; 88-89
    .n16Unk8A               : skip 2    ; 8A-8B
    .n16Unk8C               : skip 2    ; 8C-8D
    .n16Unk8E               : skip 2    ; 8E-8F
    .n16Unk90               : skip 2    ; 90-91
    .n8Temp1                : skip 1    ; 92
    .n8Temp2                : skip 1    ; 93
    .n8Temp3                : skip 1    ; 94
    .n8Temp4                : skip 1    ; 95
    .u8Unk96                : skip 1    ; 96
    .u8Unk97                : skip 1    ; 97
endstruct align 26


;
; 98 not used
;


;
; 99 - ???
; 9A - written to SNES_MDMAEN (DMA Enable)
;


;
; Size and start OK
;
struct strcObject           $7E009B
    .posX                   : skip 2    ; 9B-9C
    .posY                   : skip 2    ; 9D-9E
    .flip                   : skip 2    ; 9F-A0
    .spriteTableIdx         : skip 2    ; A1-A2
    .unkA3                  : skip 2    ; A3-A4
    .gameObjectIdx          : skip 2    ; A5-A6
    .exists                 : skip 2    ; A7-A8     0 if exists FF/-1 if does not
    .gameObjectIdxOffs      : skip 2    ; A9-AA     aGameObjectIndexOffsets[gameObjectIdx]
    .unkAB                  : skip 2    ; AB-AC
    .totalComponents        : skip 2    ; AD-AE 
    .bankAddress            : skip 2    ; AF-B0 
    .unkB1                  : skip 1    ; B1
    .unkB2                  : skip 1    ; B2
    .pData                  : skip 3    ; B3-B5     ptr24
endstruct align 27


;
; B6 not used
;


;
; B7-B8 ???
;


;
; B9-BA not used
;


;
; BB-BC
; BD-BE
; BF-C0 X - something with camera
; C1-C2 Y - something with camera
; C3-C4 flags
; C5-C6
; C7-C8
; C9-CB ptrAIActionData     ptr24
; CC-CE ptrAIUnknown0xCC    prt24
; CF-D1 ptrUnknown0xCF      ptr24
;


;
; Size to be checkd and start OK
;
struct strcPlayer           $7E00D2
    .flags                  : skip 2    ; D2-D3
    .action                 : skip 2    ; D4-D5
    .posX                   : skip 2    ; D6-D7     current coords
    .posY                   : skip 2    ; D8-D9     current coords
    .direction              : skip 2    ; DA-DB     
    .unkDC                  : skip 2    ; DC-DD     
    .lastRandomNumber       : skip 1    ; DE        rng + 
    .lastX                  : skip 2    ; DF-E0     last coords
    .lastY                  : skip 2    ; E1-E2     last coords
    .unkE3                  : skip 2    ; E3-E4     speed? move increment? rounding?
    .newX                   : skip 2    ; E5-E6     new coords
    .newY                   : skip 2    ; E7-E8     new coords
    .unkPosX                : skip 2    ; E9-EA     unknown X
    .unkPosY                : skip 2    ; EB-EC     unknown Y
    .offsetCamX             : skip 2    ; ED-EE     new camera coords
    .offsetCamY             : skip 2    ; EF-F0     new camera coords
endstruct


;
; some of prevoius structs might be part if this structure
;
struct strcCamera           $7E00F1
    .offsetCamX             : skip 2    ; F1-F2
    .offsetCamY             : skip 2    ; F3-F4
    .cameraX                : skip 2    ; F5-F6
    .cameraY                : skip 2    ; F7-F8
endstruct align 8


;
; F9 - FF not used
;


;
; Size and start OK
;
struct strcRandom           $7E0100
    .a                      : skip 1    ; 100
    .b                      : skip 1    ; 101
    .c                      : skip 1    ; 102
endstruct


;
; Size and start OK
;
struct strcAudio            $7E0103
    .index                  : skip 1    ; 103
    .list                   : skip 10   ; 104-10D
    .unk10E                 : skip 1    ; 10E
    .unk10F                 : skip 1    ; 10F
    .trackId                : skip 1    ; 110
    .unk111                 : skip 1    ; 111
    .unk112                 : skip 1    ; 112
    .unk113                 : skip 1    ; 113
    .reg114                 : skip 1    ; 114
    .reg115                 : skip 1    ; 115
    .reg116                 : skip 1    ; 116
    .trackIdCopy            : skip 1    ; 117
    .unk118                 : skip 1    ; 118
    .toolId                 : skip 1    ; 119
    .unkMulti11A            : skip 1    ; 11A
    .unkMulti11B            : skip 1    ; 11B
    .unkMulti11C            : skip 2    ; 11C-11D
    .unkMulti11E            : skip 2    ; 11E-11F
    .unkMulti120            : skip 2    ; 120-121
    .unkMulti122            : skip 2    ; 122-123
endstruct align 33


;
; Size and start OK - Joypad 1 controls
;
struct strcJoypad1          $7E0124
    .current                : skip 2    ; 124-125
    .lastFrame              : skip 2    ; 126-127
    .newInput               : skip 2    ; 128-129
    .newUnpressed           : skip 2    ; 12A-12B
    .autorepeat             : skip 2    ; 12C-12D
    .unused0A               : skip 2    ; 12E-12F
endstruct align 12


;
; Size and start OK - Joypad 2 controls
;
struct strcJoypad2          $7E0130
    .current                : skip 2    ; 130-131
    .lastFrame              : skip 2    ; 132-132
    .newInput               : skip 2    ; 134-135
    .newUnpressed           : skip 2    ; 136-138
    .autorepeat             : skip 2    ; 138-139
    .unused0A               : skip 2    ; 13A-13B
endstruct align 12


;
; Size not sure and start OK - Gfx BG scrool Data
;
struct strcBGScrool         $7E013C
    .BG1HorOffs             : skip 2    ; 13C-13D
    .BG1VerOffs             : skip 2    ; 13E-13F
    .BG2HorOffs             : skip 2    ; 140-141
    .BG2VerOffs             : skip 2    ; 142-143
    .BG3HorOffs             : skip 2    ; 144-145
    .BG3VerOffs             : skip 2    ; 146-147
    .unk148                 : skip 1    ; 148
endstruct


;
; 149 not used
;


;
; Size and start OK
;
struct strcPalette          $7E014A
    .unk14A                 : skip 16   ; 14A-159   r?
    .unk15A                 : skip 16   ; 15A-169   g?
    .unk16A                 : skip 16   ; 16A-179   b?
    .countDown              : skip 1    ; 17A
    .nextIdx                : skip 1    ; 17B
    .nextHourIdx            : skip 1    ; 17C
endstruct


;
; Size and start OK - name to be reconsidered
;
struct strcDialogDisplay    $7E017D
    .mapDestX               : skip 2    ; 17D-17E
    .mapDestY               : skip 2    ; 17F-180
    .mapMultiWidth          : skip 1    ; 181
    .mapMultiHeight         : skip 1    ; 182
    .dialogId               : skip 2    ; 183-184
    .dialogUnk185           : skip 2    ; 185-186   
    .dialogCurrentOffset    : skip 2    ; 187-188   current offset in current dialog / index
    .dialoUnk189            : skip 1    ; 189
    .dialoUnk18A            : skip 1    ; 18A
    .dialogBlinkTimer       : skip 1    ; 18B       time used for blinking effect for next screen sign
    .dialogVarSize          : skip 1    ; 18C
    .dialogNameVarSize      : skip 1    ; 18D
    .dialogOptionsCount     : skip 1    ; 18E       stores how many options there was for current dialog
    .dialogOptionsAnswer    : skip 1    ; 18F       stores id of selected option
    .fontGlyphType          : skip 1    ; 190       1 - wide, 0 - thin ???
    .dialogUnk191           : skip 1    ; 191       TEST THIS - might be dialog display location ?
    .dialogNumericVarSize   : skip 3    ; 192-194   used to store dialog numeric value - sizes 0-3
    .mapCurrentPresetId     : skip 1    ; 195    
    .mapFlags               : skip 2    ; 196-197
    .mapFlagsBackup         : skip 2    ; 198-199
    .mapUnk19A              : skip 1    ; 19A
    .dialogFlags            : skip 1    ; 19B
endstruct

; mapFlags
!AFLAGS_NONE                = $0000
!AFLAGS_UNK0001             = $0001
!AFLAGS_UNK0002             = $0002
!AFLAGS_FOR0004             = $0004
!AFLAGS_UNK0008             = $0008
!AFLAGS_UNK0010             = $0010
!AFLAGS_UNK0020             = $0020
!AFLAGS_FOR0040             = $0040
!AFLAGS_UNK0080             = $0080
!AFLAGS_UNK0100             = $0100
!AFLAGS_UNK0200             = $0200
!AFLAGS_FOR0400             = $0400
!AFLAGS_UNK0800             = $0800
!AFLAGS_UNK1000             = $1000
!AFLAGS_NAMEINPUTREQUEST    = $2000
!AFLAGS_FORCETELEPORT       = $4000
!AFLAGS_RAWCHARMAP          = $8000

; dialogFlags
!DFLAGS_PROCESSDIALOG       =   $01     ; set when there is dialog to process
!DFLAGS_UNK02               =   $02     ; 
!DFLAGS_ENDDIALOG           =   $04     ; set when end of dialog is detected
!DFLAGS_NEXTSCREEN          =   $08     ; set when next screeen character is detected
!DFLAGS_OPTIONS             =   $10     ; set when FFFE is detected
!DFLAGS_UNK20               =   $20     ; 
!DFLAGS_UNK40               =   $30     ; 
!DFLAGS_NUMERICVAR          =   $80     ; set when FFFC is detected

;
; Size and start OK - Game Objects x 40 entries (19C - 73B)
;
struct strcGameObject       $7E019C
    .initailized            : skip 2    ; 19C-19D   $7777 if initialized, 0 if not
    .spriteTableIdx         : skip 2    ; 19E-19F   used as index to get sprite metadata from banks $86/$87
    .flip                   : skip 2    ; 1A0-1A1
    .unknown6               : skip 2    ; 1A2-1A3
    .positionX              : skip 2    ; 1A4-1A5
    .positionY              : skip 2    ; 1A6-1A7
    .objectListPointer      : skip 4    ; 1A8-1AB   value of table 8X8080, pointer to sprite_table_address
    .objectDataPointer      : skip 3    ; 1AC-1AE   pointer value
    .totalComponents        : skip 1    ; 1AF       the ammount of SOBJ composing the GOBJ
    .components             : skip 1    ; 1B0       the components, $FF means unused
    .unknown1B1             : skip 1    ; 1B1
    .unknown1B2             : skip 1    ; 1B2
    .unknown1B3             : skip 1    ; 1B3
    .unknown1B4             : skip 1    ; 1B4
    .unknown1B5             : skip 1    ; 1B5
    .unknown1B6             : skip 1    ; 1B6
    .unknown1B7             : skip 1    ; 1B7
    .unknown1B8             : skip 1    ; 1B8
    .unknown1B9             : skip 1    ; 1B9
    .unknown1BA             : skip 1    ; 1BA
    .unknown1BB             : skip 1    ; 1BB
    .unknown1BC             : skip 1    ; 1BC
    .unknown1BD             : skip 1    ; 1BD
    .unknown1BE             : skip 1    ; 1BE
    .unknown1BF             : skip 1    ; 1BF
endstruct align 36


;
; 73C - 73F not used
;


;
; Unknown 740
;
struct strcUnknown740       $7E0740
    .unk740                 : skip 2    ; 740-741
    .unk742                 : skip 1    ; 742
    .unk743                 : skip 1    ; 743
endstruct


;
; Size and start OK - Map scrool
;
struct strcMapScrool        $7E087C
    .speedX                 : skip 2    ; 87C-87D
    .speedY                 : skip 2    ; 87E-87F
    .timer                  : skip 1    ; 880
endstruct align 5


;
; Size and start OK - Names
;
struct strcNames            $7E0881
    .sPlayer                : skip 4    ; 881-884
    .sTemp                  : skip 4    ; 885-888
    .wCurrentCow            : skip 8    ; 889-890
    .wUnused891             : skip 8    ; 891-898
    .sDog                   : skip 4    ; 899-89C
    .sHorse                 : skip 4    ; 89D-8A0
    .wMostLovedGirl         : skip 10   ; 8A1-8AA
    .wUnused8AB             : skip 8    ; 8AB-8B2
    .wSeason                : skip 12   ; 8B3-8BE
    .wWeekday               : skip 18   ; 8BF-8D0
    .wDayOrdinal            : skip 4    ; 8D1-8D4
    .wPlayer                : skip 8    ; 8D5-8DC
    .wDog                   : skip 8    ; 8DD-8E4
    .wHorse                 : skip 8    ; 8E5-8EC
    .wFirstChild            : skip 8    ; 8ED-8F4
    .wSecondChild           : skip 8    ; 8F5-8FC
endstruct align 124


;
; strcAiControlData 8FD-900
;
struct strcAiControlData    $7E08FD
    .input                  : skip 2    ; 8FD-8FE
    .counter                : skip 2    ; 8FF-900
endstruct align 4


;
; Size and start OK - Object data
;
struct strcObjectData       $7E0901
    .spriteIdx              : skip 2    ; 901-902
    .spriteIdxOld           : skip 2    ; 903-904
    .gameObjectIdx          : skip 2    ; 905-906
    .playerX                : skip 2    ; 907-908
    .playerY                : skip 2    ; 909-90A
    .camX                   : skip 2    ; 90B-90C
    .camY                   : skip 2    ; 90D-90E
    .flip                   : skip 2    ; 90F-910
    .direction              : skip 2    ; 911-912
    .directionNew           : skip 2    ; 913-914
    .exist                  : skip 2    ; 915-916
endstruct align 22


;
; size and start OK - Player data
;
struct strcPlayerData       $7E0917
    .stamina                : skip 1    ; 917
    .energy                 : skip 1    ; 918
    .unkCounter919          : skip 1    ; 919
    .unkCounter91A          : skip 1    ; 91A
    .unkCounter91B          : skip 1    ; 91B
    .unkCounter91C          : skip 1    ; 91C
    .carryItemId            : skip 1    ; 91D
    .carryItemIdPrev        : skip 1    ; 91E
    .unkMap91F              : skip 1    ; 91F
    .nAiArg                 : skip 1    ; 920
    .toolEquipped           : skip 1    ; 921
    .toolSound              : skip 1    ; 922
    .toolSecond             : skip 1    ; 923
    .eatFood                : skip 1    ; 924
    .lastExcercise          : skip 1    ; 925
    .leftWater              : skip 1    ; 926
    .leftGrassSeeds         : skip 1    ; 927
    .leftCornSeeds          : skip 1    ; 928
    .leftTomatoSeeds        : skip 1    ; 929
    .leftPotatoSeeds        : skip 1    ; 92A
    .leftTurnipSeeds        : skip 1    ; 92B
    .leftCowFood            : skip 1    ; 92C
    .leftChickenFood        : skip 1    ; 92D
    .leftGrassToCut         : skip 2    ; 92E-92F
    .placedCowFeed          : skip 1    ; 930
    .placedChcikenFeed      : skip 1    ; 931
    .placedCowFeedFlags     : skip 2    ; 932-933
    .placedChickenFeedFlags : skip 2    ; 934-935
endstruct align 31


;
; 936 not used
;


;
; Size and start OK - Animal data ? but also any seed is last
;
struct strcStockData        $7E0937
    .unkCow                 : skip 1    ; 937
    .unkDog                 : skip 1    ; 938
    .unkHorse               : skip 1    ; 939
    .unkMole                : skip 1    ; 93A
    .unkEachChicken         : skip 12*2 ; 93B-952
    .unkEachCow             : skip 12*2 ; 953-96A
    .unkAnyTool             : skip 1    ; 96B
endstruct align 53


;
; 96C - 990 ???
;
;struct strcInteractionData  $7E096C
;    .unk96C                 : skip 1    ; 96C
;    .breakCounter           : skip 1    ; 96D
;    .index                  : skip 1    ; 96E
;    .arg1                   : skip 1    ; 96F
;    .arg2                   : skip 1    ; 970 
;    .unk971                 : skip 1    ; 971
;endstruct



;
; Size and start to be confirmed
;
struct strcMenuData         $7E0991
    .menuIdx                : skip 2    ; 0991
    .tableSelector          : skip 1    ; 0993
    .nameEntryIdx           : skip 1    ; 0994
    .gameObjectIdx          : skip 2    ; 0995
    .spriteTableIdx         : skip 2    ; 0997
    .flip                   : skip 2    ; 0999
    .posX                   : skip 2    ; 099B
    .posY                   : skip 2    ; 099D
    .nameDestinationIdx     : skip 1    ; 099F
endstruct

;
; Unknown AI structure pointer to it is stored at 0xCC
;
struct strcAIUnknown        $7EB586
    .unk00                  skip 1
    .flags                  skip 1  ; n8
    .nDataIndex             skip 1  ; stored as n8 used as index for pDataAddress
    .unk03                  skip 1  ; n8
    .unk04                  skip 1  ; n8
    .unk05                  skip 1  ; n8
    .unk06                  skip 1  ; n8
    .unk07                  skip 1
    .unk08                  skip 1
    .unk09                  skip 1
    .unk0A                  skip 1
    .unk0B                  skip 1
    .unk0C                  skip 1
    .unk0D                  skip 1
    .unk0E                  skip 1
    .unk0F                  skip 1
    .unk10                  skip 1  ; n8
    .unk11                  skip 1
    .unk12                  skip 1
    .unk13                  skip 1
    .nOtherUnknownIndex     skip 1  ; stores pDataAddress[nDataIndex * 3 + 2] * 64 as n16 (64 is size of this struct so maybe it's child/parent index/offset    ?)
    .unk15                  skip 1
    .nDataValue             skip 2  ; stores pDataAddress[nDataIndex * 3 + 0] as n16
    .unk18                  skip 1
    .unk19                  skip 1
    .unk1A                  skip 1
    .unk1B                  skip 1
    .unk1C                  skip 1
    .unk1D                  skip 1
    .unk1E                  skip 1
    .unk1F                  skip 1
    .unk20                  skip 1
    .unk21                  skip 1
    .unk22                  skip 1
    .unk23                  skip 1
    .unk24                  skip 1
    .unk25                  skip 1
    .unk26                  skip 1
    .unk27                  skip 1
    .unk28                  skip 1
    .unk29                  skip 1
    .unk2A                  skip 1
    .unk2B                  skip 1
    .unk2C                  skip 1
    .unk2D                  skip 1
    .unk2E                  skip 1
    .unk2F                  skip 1
    .unk30                  skip 1
    .unk31                  skip 1
    .unk32                  skip 1
    .pDataAddress           skip 2  ; ptr16 - data address in B3 - hardcoded
    .unk35                  skip 1
    .unk36                  skip 1
    .unk37                  skip 1
    .unk38                  skip 1
    .unk39                  skip 1
    .unk3A                  skip 1
    .unk3B                  skip 1
    .unk3C                  skip 1
    .unk3D                  skip 1
    .unk3E                  skip 1
    .nArg                   skip 1  ; Saved value from A register passed to fAI_SetupAreaScripting
endstruct align 64

!AIFLAGS_UNK00              =  $01
!AIFLAGS_UNK02              =  $02
!AIFLAGS_UNK04              =  $04
!AIFLAGS_UNK08              =  $08
!AIFLAGS_UNK10              =  $10
!AIFLAGS_UNK20              =  $20
!AIFLAGS_UNK40              =  $40
!AIFLAGS_UNK80              =  $80


; Cow Data x 12 entries (7EC1C6 - 7EC285)
struct strcCowData          $7EC1C6
    .statusFlags            : skip 1    ; 00 $7EC1C6
    .interactions           : skip 1    ; 01 $7EC1C7
    .mapID                  : skip 1    ; 02 $7EC1C8
    .age                    : skip 1    ; 03 $7EC1C9    - also pregancy, crankyness, sickness
    .happiness              : skip 1    ; 04 $7EC1CA
    .unknown5               : skip 1    ; 05 $7EC1CB
    .unknown6               : skip 1    ; 06 $7EC1CC
    .unknown7               : skip 1    ; 07 $7EC1CD
    .positionX              : skip 2    ; 08 $7EC1CE
    .positionY              : skip 2    ; 0A $7EC1D0
    .name                   : skip 4    ; 0C $7EC1D2    - 4 short bytes as name
endstruct align 16

!COWSTATUS_EXISTS           =   $01
!COWSTATUS_BABY             =   $02
!COWSTATUS_CHILD            =   $04
!COWSTATUS_ADULT            =   $08
!COWSTATUS_CRANKY           =   $10
!COWSTATUS_SICK             =   $20
!COWSTATUS_PREGNANT         =   $40
!COWSTATUS_BIRTHINGTODAY    =   $80


; Chicken Data x 12 entries (7EC286 - 7EC2E5)
struct strcChickenData      $7EC286
    .statusFlags            : skip 1    ; 00 $7EC286
    .mapID                  : skip 1    ; 01 $7EC287
    .age                    : skip 1    ; 02 $7EC288
    .unknown3               : skip 1    ; 03 $7EC289
    .positionX              : skip 2    ; 04 $7EC28A
    .positionY              : skip 2    ; 06 $7EC28C
endstruct align 8

!CHICKENSTATUS_EXISTS       =   $01
!CHICKENSTATUS_ISEGG        =   $02
!CHICKENSTATUS_CHILD        =   $04
!CHICKENSTATUS_ADULT        =   $08
!CHICKENSTATUS_CRANKY       =   $10
!CHICKENSTATUS_HELDBYPLAYER =   $20
!CHICKENSTATUS_ININCUBATOR  =   $40
!CHICKENSTATUS_UNK80        =   $80


; Shed Items
struct strcShedItems        $7F1F00
    .row1                   : skip 1    ; 00 $7F1F00    - 0x01: sickle,         0x02: hoe,              0x04: hammer,           0x08: axe,              0x10: cornSeed,         0x20: tomatoSeed,       0x40: potatoSeed,       0x80: turnipSeed
    .row2                   : skip 1    ; 01 $7F1F01    - 0x01: medicine,       0x02: miraclePotion,    0x04: bell,             0x08: grassSeed,        0x10: paint,            0x20: milker,           0x40: brush,            0x80: wateringCan
    .row3                   : skip 1    ; 02 $7F1F02    - 0x01: goldSickle,     0x02: goldHoe,          0x04: goldHammer,       0x08: goldAxe,          0x10: sprinkler,        0x20: beanstalkSeed,    0x40: blueDiamond,      0x80: blueFeather
    .row4                   : skip 1    ; 03 $7F1F03    - 0x01: chickenFeed,    0x02: cowFeed
endstruct align 4


; Flags
struct strcFlags            $7F1F5A
    ; daily
    .daily1                 : skip 2    ; 00 $7F1F5A
    .daily2                 : skip 2    ; 02 $7F1F5C
    .daily3                 : skip 2    ; 04 $7F1F5E
    .daily4                 : skip 2    ; 06 $7F1F60
    .daily5                 : skip 2    ; 08 $7F1F62
    ; events
    .event1                 : skip 2    ; 00 $7F1F64
    .event2                 : skip 2    ; 02 $7F1F66
    .event3                 : skip 2    ; 04 $7F1F68
    .event4                 : skip 2    ; 06 $7F1F6A
    .event5                 : skip 2    ; 08 $7F1F6C
    .event6                 : skip 2    ; 0A $7F1F6E
    .event7                 : skip 2    ; 0C $7F1F70
    .event8                 : skip 2    ; 0E $7F1F72
    ; unknown
    .unknown1               : skip 2    ; 00 $7F1F74
    .unknown2               : skip 2    ; 02 $7F1F76
    .unknown3               : skip 2    ; 04 $7F1F78
endstruct


; daily1

; daily2
!DFLAGS2_BROKECHICKENSTATUE = $0080
!DFLAGS2_DUGUPMONEY         = $0200

; daily3

; daily4

; daily5

; event1

; event2
!EFLAGS2_MARRIEDMARIA       = $0001
!EFLAGS2_MARRIEDANN         = $0002
!EFLAGS2_MARRIEDNINA        = $0004
!EFLAGS2_MARRIEDELLEN       = $0008
!EFLAGS2_MARRIEDEVE         = $0010
!EFLAGS2_MARRIED            = !EFLAGS2_MARRIEDMARIA|!EFLAGS2_MARRIEDANN|!EFLAGS2_MARRIEDNINA|!EFLAGS2_MARRIEDELLEN|!EFLAGS2_MARRIEDEVE
!EFLAGS2_PAINTEDHOUSEDOOR   = $0200
!EFLAGS2_PAINTEDHOUSELEFT   = $0400
!EFLAGS2_PAINTEDHOUSECENTER = $0800
!EFLAGS2_PAINTEDHOUSERIGHT  = $1000
!EFLAGS2_FREEDIMPFISH       = $2000

; event3

; event4

; event5

; event6

; event7

; event8

; unknown1

; unknown2

; unknown3

!JOYPAD_UNUSED1             = $0001
!JOYPAD_UNUSED2             = $0002
!JOYPAD_UNUSED3             = $0004
!JOYPAD_UNUSED4             = $0008
!JOYPAD_R                   = $0010
!JOYPAD_L                   = $0020
!JOYPAD_X                   = $0040
!JOYPAD_A                   = $0080
!JOYPAD_RIGHT               = $0100
!JOYPAD_LEFT                = $0200
!JOYPAD_DOWN                = $0400
!JOYPAD_UP                  = $0800
!JOYPAD_START               = $1000
!JOYPAD_SELECT              = $2000
!JOYPAD_Y                   = $4000
!JOYPAD_B                   = $8000