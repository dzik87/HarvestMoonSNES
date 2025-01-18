; Game Objects (40 entries)
struct strcGameObject       $019C
    .initailized            : skip 2    ; 00 $00019C    - $7777 if initialized, 0 if not
    .spriteTableIdx         : skip 2    ; 02 $00019E    - used as index to get sprite metadata from banks $86/$87
    .flip                   : skip 2    ; 04 $0001A0
    .unknown6               : skip 2    ; 06 $0001A2
    .positionX              : skip 2    ; 08 $0001A4
    .positionY              : skip 2    ; 0A $0001A6
    .pointer12              : skip 4    ; 0C $0001A8    - value of table 8X8080, pointer to sprite_table_address
    .pointer16              : skip 3    ; 10 $0001AC    - pointer value
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


; Daily flags
struct strcDailyFlags       $7F1F5A
    .flags1                 : skip 2    ; 00 $7F1F5A
    .flags2                 : skip 2    ; 02 $7F1F5C
    .flags3                 : skip 2    ; 04 $7F1F5E
    .flags4                 : skip 2    ; 06 $7F1F60
    .flags5                 : skip 2    ; 08 $7F1F62
endstruct align 10


; Event flags
struct strcEventFlags       $7F1F64
    .flags1                 : skip 2    ; 00 $7F1F64
    .flags2                 : skip 2    ; 02 $7F1F66
    .flags3                 : skip 2    ; 04 $7F1F68
    .flags4                 : skip 2    ; 06 $7F1F6A
    .flags5                 : skip 2    ; 08 $7F1F6C
    .flags6                 : skip 2    ; 0A $7F1F6E
    .flags7                 : skip 2    ; 0C $7F1F70
    .flags8                 : skip 2    ; 0E $7F1F72
endstruct align 16


; Unknown flags
struct strcUnknownFlags     $7F1F74
    .flags1                 : skip 2    ; 00 $7F1F74
    .flags2                 : skip 2    ; 02 $7F1F76
    .flags3                 : skip 2    ; 04 $7F1F78
endstruct align 6


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
    .unk01                  skip 1
    .nDataIndex             skip 1  ; stored as n8 used as index for pDataAddress
    .unk03                  skip 1
    .unk04                  skip 1
    .unk05                  skip 1
    .unk06                  skip 1
    .unk07                  skip 1
    .unk08                  skip 1
    .unk09                  skip 1
    .unk0A                  skip 1
    .unk0B                  skip 1
    .unk0C                  skip 1
    .unk0D                  skip 1
    .unk0E                  skip 1
    .unk0F                  skip 1
    .unk10                  skip 1
    .unk11                  skip 1
    .unk12                  skip 1
    .unk13                  skip 1
    .nOtherUnknownIndex     skip 1  ; stores pDataAddress[nDataIndex * 3 + 2] * 64 as n16 (64 is size of this struct so maybe it's child/parent index ?)
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