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


; Player state
struct strcPlayerFlags      $D2
    .flags                  : skip 2    ; 00 $0000D2
endstruct align 2

!PLAYERFLAGS_ACTIVE         = $0001
!PLAYERFLAGS_HOLDINGITEM    = $0002
!PLAYERFLAGS_EATINGMEAL     = $0004
!PLAYERFLAGS_OUTOFSTAMINA   = $0008
!PLAYERFLAGS_RIDINGHORSE    = $0010
!PLAYERFLAGS_INSPRINGS      = $0020
!PLAYERFLAGS_JUMPINGOVER    = $0040
!PLAYERFLAGS_UNK0080        = $0080
!PLAYERFLAGS_UNK0100        = $0100
!PLAYERFLAGS_UNK0200        = $0200
!PLAYERFLAGS_UNK0400        = $0400
!PLAYERFLAGS_UNK0800        = $0800
!PLAYERFLAGS_UNK1000        = $1000
!PLAYERFLAGS_UNK2000        = $2000
!PLAYERFLAGS_UNK4000        = $4000
!PLAYERFLAGS_UNK8000        = $8000


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


; Equipped items            $000921
!EQUIPPEDITEM_NONE          =   $00
!EQUIPPEDITEM_SICKLE        =   $01
!EQUIPPEDITEM_HOE           =   $02
!EQUIPPEDITEM_HAMMER        =   $03
!EQUIPPEDITEM_AXE           =   $04
!EQUIPPEDITEM_CORNSEED      =   $05
!EQUIPPEDITEM_TOMATOSEED    =   $06
!EQUIPPEDITEM_POTATOSEED    =   $07
!EQUIPPEDITEM_TURNIPSEED    =   $08
!EQUIPPEDITEM_MEDICIDE      =   $09
!EQUIPPEDITEM_MIRACLEPOTION =   $0A
!EQUIPPEDITEM_BELL          =   $0B
!EQUIPPEDITEM_GRASSSEED     =   $0C
!EQUIPPEDITEM_PAINT         =   $0D
!EQUIPPEDITEM_MILKER        =   $0E
!EQUIPPEDITEM_BRUSH         =   $0F
!EQUIPPEDITEM_WATERINGCAN   =   $10
!EQUIPPEDITEM_GOLDSICKLE    =   $11
!EQUIPPEDITEM_GOLDHOE       =   $12
!EQUIPPEDITEM_GOLDHAMMER    =   $13
!EQUIPPEDITEM_GOLDAXE       =   $14
!EQUIPPEDITEM_SPRINKLER     =   $15
!EQUIPPEDITEM_BEANSTALKSEED =   $16
!EQUIPPEDITEM_BLUEDIAMOND   =   $17
!EQUIPPEDITEM_BLUEFEATHER   =   $18
!EQUIPPEDITEM_CHICKENFEED   =   $19
!EQUIPPEDITEM_COWFEED       =   $1A
!EQUIPPEDITEM_FISHINGPOLE   =   $1B


; Weather forecast          $00098C
!WEATHER_SUN                =   $00
!WEATHER_RAIN               =   $01
!WEATHER_SNOW               =   $02
!WEATHER_HURRICANE          =   $03
!WEATHER_FAIR               =   $04
!WEATHER_CALM               =   $05
!WEATHER_FLOWERFESTIVAL     =   $06
!WEATHER_HARVESTFESTIVAL    =   $07
!WEATHER_THANKSGIVING       =   $08
!WEATHER_STARNIGHTFESTIVAL  =   $09
!WEATHER_NEWYEARFESTIVAL    =   $0A
!WEATHER_EGGFESTIVAL        =   $0B
!WEATHER_COUNT              =   $0C


; Seasons                   $7F1F19
!SEASON_SPRING              =   $00
!SEASON_SUMMER              =   $01
!SEASON_FALL                =   $02
!SEASON_WINTER              =   $03


; nMapEngine_flags          $000196
!AREA_FORCETELEPORT         = $4000


; Areas/Maps                $00098B
!AREA_FARMSPRING            =   $00
!AREA_FARMSUMMER            =   $01
!AREA_FARMFALL              =   $02
!AREA_FARMWINTER            =   $03
!AREA_TOWNSPRING            =   $04
!AREA_TOWNSUMMER            =   $05
!AREA_TOWNFALL              =   $06
!AREA_TOWNWINTER            =   $07
!AREA_DANCINGS1             =   $08
!AREA_DANCINGS2             =   $09
!AREA_NY_PUBLICSQUARE       =   $0A
!AREA_EGGFESTIVAL           =   $0B
!AREA_CROSSROADSPRING       =   $0C
!AREA_CROSSROADSUMMER       =   $0D
!AREA_CROSSROADFALL         =   $0E
!AREA_CROSSROADWINTER       =   $0F
!AREA_WOODSSPRING           =   $10
!AREA_WOODSSUMMER           =   $11
!AREA_WOODSFALL             =   $12
!AREA_WOODSWINTER           =   $13
!AREA_SPA                   =   $14
!AREA_HOUSE1                =   $15 ; No upgrade
!AREA_HOUSE2                =   $16 ; First upgrade
!AREA_HOUSE3                =   $17 ; Second upgrade
!AREA_MAJORHOUSE            =   $18
!AREA_MAJORCORRIDOR         =   $19
!AREA_MAJORBEDROOM          =   $1A
!AREA_CHURCH                =   $1B
!AREA_FLORIST               =   $1C
!AREA_FLORISTBEDROOM        =   $1D ; ??
!AREA_BAR                   =   $1E
!AREA_BARBEDROOM            =   $1F ; ??
!AREA_RESTAURANT            =   $20
!AREA_RESTAURANTBEDROOM     =   $21 ; ??
!AREA_TOOLSSHOP             =   $22
!AREA_TOOLSSHOPBEDROOM      =   $23 ; ??
!AREA_ANIMALSHOP            =   $24
!AREA_FORTUNETELLER         =   $25
!AREA_SHED                  =   $26
!AREA_COWBARN               =   $27
!AREA_COOP                  =   $28
!AREA_WOODSCAVE             =   $29
!AREA_IMPUNDERGROUND        =   $2A
!AREA_WORKSMANHOUSE         =   $2B
!AREA_GOLDCHICKEN           =   $2C
!AREA_WEDDINGSPRING         =   $2D
!AREA_WEDDINGSUMMER         =   $2E
!AREA_WEDDINGFALL           =   $2F
!AREA_WEDDINGWINTER         =   $30
!AREA_MOUNTAINTOPSPRING     =   $31
!AREA_MOUNTAINTOPSUMMER     =   $32
!AREA_MOUNTAINTOPFALL       =   $33
!AREA_MOUNTAINTOPWINTER     =   $34
!AREA_MOUNTAINTOP2SPRING    =   $35
!AREA_MNTTOPENDINGSUMMER    =   $36
!AREA_MOUNTAINTOP2FALL      =   $37
!AREA_MOUNTAINTOP2WINTER    =   $38
!AREA_MOUNTAINTOPSNF        =   $39
!AREA_MOUNTAINTOPUNK3A      =   $3A
!AREA_MOUNTAINTOPBEAN       =   $3B
!AREA_INTRO                 =   $3C ; ??? since start to main menu also how to play ?
!AREA_ENDING00              =   $3D
!AREA_ENDING01              =   $3E
!AREA_ENDING02              =   $3F
!AREA_ENDING03              =   $40
!AREA_ENDING04              =   $41
!AREA_ENDING05              =   $42
!AREA_ENDING06              =   $43
!AREA_ENDING07              =   $44
!AREA_ENDING08              =   $45
!AREA_ENDING09              =   $46
!AREA_ENDING10              =   $47
!AREA_ENDING11              =   $48
!AREA_ENDING12              =   $49
!AREA_ENDING13              =   $4A
!AREA_CREDITS0              =   $4B
!AREA_CREDITS1              =   $4C
!AREA_CREDITS2              =   $4D
!AREA_CREDITS3              =   $4E
!AREA_CREDITS4              =   $4F
!AREA_DRIVETOTOWN           =   $50