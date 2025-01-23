; Game Objects (40 entries)
struct strcGameObject       $00019C
    .initailized            : skip 2    ; 00 $00019C    - $7777 if initialized, 0 if not
    .spriteTableIdx         : skip 2    ; 02 $00019E    - used as index to get sprite metadata from banks $86/$87
    .flip                   : skip 2    ; 04 $0001A0
    .unknown6               : skip 2    ; 06 $0001A2
    .positionX              : skip 2    ; 08 $0001A4
    .positionY              : skip 2    ; 0A $0001A6
    .objectListPointer      : skip 4    ; 0C $0001A8    - value of table 8X8080, pointer to sprite_table_address
    .objectDataPointer      : skip 3    ; 10 $0001AC    - pointer value
    .totalComponents        : skip 1    ; 13 $0001AF    - the ammount of SOBJ composing the GOBJ
    .components             : skip 1    ; 14 $0001B0    - the components, $FF means unused
    .unknown21              : skip 1    ; 15 $0001B1
    .unknown22              : skip 1    ; 16 $0001B2
    .unknown23              : skip 1    ; 17 $0001B3
    .unknown24              : skip 1    ; 18 $0001B4
    .unknown25              : skip 1    ; 19 $0001B5
    .unknown26              : skip 1    ; 1A $0001B6
    .unknown27              : skip 1    ; 1B $0001B7
    .unknown28              : skip 1    ; 1C $0001B8
    .unknown29              : skip 1    ; 1D $0001B9
    .unknown30              : skip 1    ; 1E $0001BA
    .unknown31              : skip 1    ; 1F $0001BB
    .unknown32              : skip 1    ; 20 $0001BC
    .unknown33              : skip 1    ; 21 $0001BD
    .unknown34              : skip 1    ; 22 $0001BE
    .unknown35              : skip 1    ; 23 $0001BF
endstruct align 36

; Size and start to be confirmed
struct strcSingleObjectData $00009B
    .posX                   : skip 2    ; 9B-9C
    .posY                   : skip 2    ; 9D-9E
    .flip                   : skip 2    ; 9F-A0
    .spriteTableIdx         : skip 2    ; A1-A2
    .unk6                   : skip 2    ; A3-A4
    .gameObjectIdx          : skip 2    ; A5-A6
    .exists                 : skip 2    ; A7-A8 0 if exists FF/-1 if does not
    .gameObjectIdxOffs      : skip 2    ; A9-AA aGameObjectIndexOffsets[gameObjectIdx]
    .unkAB                  : skip 2    ; AB-AC
    .totalComponents        : skip 2    ; AD-AE 
    .unkAF                  : skip 2    ; AF-B0 
    .unkB1                  : skip 1    ; B1
    .unkB2                  : skip 1    ; B2
    .pObjectData            : skip 4    ; B3-B6 ptr24
endstruct


;
; Size to be confirmed, start is 100% ok
;
struct strcMap              $00000D
    .pSelectedTilemap       : skip 3    ; 0D-0F ptr24
    .unk10                  : skip 2    ; 10
    .unk12                  : skip 2    ; 12
    .unk14                  : skip 2    ; 14
    .unk16                  : skip 2    ; 16
    .pCurrentTilemap        : skip 4    ; 18-1B ptr24
    .unk1C                  : skip 2    ; 1C
    .unk1E                  : skip 2    ; 1E
    .unk20                  : skip 1    ; 20
    .unk21                  : skip 1    ; 21
    .loadAreaId             : skip 1    ; 22
endstruct


; Map scrool
;struct strcMapScrool        $00087C ; up to 0881
; 087C
; 087E
; 0880


; Names
;struct strcNames            $000881 ; up to 08FD

; Size and start to be confirmed
struct strcMenuObjectData   $000991
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


; Shed Items
struct strcShedItems        $7F1F00
    .row1                   : skip 1    ; 00 $7F1F00    - 0x01: sickle,         0x02: hoe,              0x04: hammer,           0x08: axe,              0x10: cornSeed,         0x20: tomatoSeed,       0x40: potatoSeed,       0x80: turnipSeed
    .row2                   : skip 1    ; 01 $7F1F01    - 0x01: medicine,       0x02: miraclePotion,    0x04: bell,             0x08: grassSeed,        0x10: paint,            0x20: milker,           0x40: brush,            0x80: wateringCan
    .row3                   : skip 1    ; 02 $7F1F02    - 0x01: goldSickle,     0x02: goldHoe,          0x04: goldHammer,       0x08: goldAxe,          0x10: sprinkler,        0x20: beanstalkSeed,    0x40: blueDiamond,      0x80: blueFeather
    .row4                   : skip 1    ; 03 $7F1F03    - 0x01: chickenFeed,    0x02: cowFeed
endstruct align 4


; Chicken Data
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


; Cow Data
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


; Joypad 1 controls
struct strcJoypad1          $000124
    .current                : skip 2    ; 00 $000124
    .lastFrame              : skip 2    ; 02 $000126
    .newInput               : skip 2    ; 04 $000128
    .newUnpressed           : skip 2    ; 06 $00012A
    .autorepeat             : skip 2    ; 08 $00012C
    .unused0A               : skip 2    ; 0A $00012E
endstruct align 12


; Joypad 2 controls
struct strcJoypad2          $000130
    .current                : skip 2    ; 00 $000130
    .lastFrame              : skip 2    ; 02 $000132
    .newInput               : skip 2    ; 04 $000134
    .newUnpressed           : skip 2    ; 06 $000136
    .autorepeat             : skip 2    ; 08 $000138
    .unused0A               : skip 2    ; 0A $00013A
endstruct align 12

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


; Unknown AI structure pointer to it is stored at 0xCC (48 entries)
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
    .pDataAddress           skip 2  ; data address in B3 - hardcoded
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


; Gfx BG scrool Data
struct strcBGScrool         $00013C
    .BG1HorOffs             skip 2
    .BG1VerOffs             skip 2
    .BG2HorOffs             skip 2
    .BG2VerOffs             skip 2
    .BG3HorOffs             skip 2
    .BG3VerOffs             skip 2
endstruct