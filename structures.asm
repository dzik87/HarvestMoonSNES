; Game Objects (40 entries)
struct strcGameObject   $019C
    .initailized        : skip 2    ; 00 $00019C    - $7777 if initialized, 0 if not
    .spriteTableIdx     : skip 2    ; 02 $00019E    - used as index to get sprite metadata from banks $86/$87
    .flip               : skip 2    ; 04 $0001A0
    .unknown6           : skip 2    ; 06 $0001A2
    .positionX          : skip 2    ; 08 $0001A4
    .positionY          : skip 2    ; 10 $0001A6
    .pointer12          : skip 4    ; 12 $0001A8    - value of table 8X8080, pointer to sprite_table_address
    .pointer16          : skip 3    ; 16 $0001AC    - pointer value
    .totalComponents    : skip 1    ; 19 $0001AF    - the ammount of SOBJ composing the GOBJ
    .components         : skip 1    ; 20 $0001B0    - the components, $FF means unused
    .unknown21          : skip 1    ; 21 $0001B1
    .unknown22          : skip 1    ; 22 $0001B2
    .unknown23          : skip 1    ; 23 $0001B3
    .unknown24          : skip 1    ; 24 $0001B4
    .unknown25          : skip 1    ; 25 $0001B5
    .unknown26          : skip 1    ; 26 $0001B6
    .unknown27          : skip 1    ; 27 $0001B7
    .unknown28          : skip 1    ; 28 $0001B8
    .unknown29          : skip 1    ; 29 $0001B9
    .unknown30          : skip 1    ; 30 $0001BA
    .unknown31          : skip 1    ; 31 $0001BB
    .unknown32          : skip 1    ; 32 $0001BC
    .unknown33          : skip 1    ; 33 $0001BD
    .unknown34          : skip 1    ; 34 $0001BE
    .unknown35          : skip 1    ; 35 $0001BF
endstruct align 36


; Shed Items
struct strcShedItems    $7F1F00
    .row1               : skip 1    ; 00 $7F1F00    - 0x01: sickle,         0x02: hoe,              0x04: hammer,           0x08: axe,              0x10: cornSeed,         0x20: tomatoSeed,       0x40: potatoSeed,       0x80: turnipSeed
    .row2               : skip 1    ; 01 $7F1F01    - 0x01: medicine,       0x02: miraclePotion,    0x04: bell,             0x08: grassSeed,        0x10: paint,            0x20: milker,           0x40: brush,            0x80: wateringCan
    .row3               : skip 1    ; 02 $7F1F02    - 0x01: goldSickle,     0x02: goldHoe,          0x04: goldHammer,       0x08: goldAxe,          0x10: sprinkler,        0x20: beanstalkSeed,    0x40: blueDiamond,      0x80: blueFeather
    .row4               : skip 1    ; 03 $7F1F03    - 0x01: chickenFeed,    0x02: cowFeed
endstruct align 4

; Chicken Data
struct strcChickenData  $7EC286
    .statusFlags        : skip 1    ; 00 $7EC286    - 0x01: exists,         0x02: adult,            0x04: child,            0x08: egg,              0x10: ?,                0x20: ?,                0x40: ?                 0x80: ?
    .mapID              : skip 1    ; 01 $7EC287
    .unknown2           : skip 1    ; 02 $7EC288
    .unknown3           : skip 1    ; 03 $7EC289
    .positionX          : skip 2    ; 04 $7EC28A
    .positionY          : skip 2    ; 06 $7EC28C
endstruct align 8

; Cow Data
struct strcCowData      $7EC1C6
    .statusFlags        : skip 1    ; 00 $7EC1C6    - 0x01: exists,         0x02: adult,            0x04: child,            0x08: baby,             0x10: cranky,           0x20: sick,             0x40: pregnant          0x80: ?
    .unknown1           : skip 1    ; 01 $7EC1C7
    .mapID              : skip 1    ; 02 $7EC1C8
    .age                : skip 1    ; 03 $7EC1C9    - also pregancy, crankyness, sickness
    .happiness          : skip 1    ; 04 $7EC1CA
    .unknown5           : skip 1    ; 05 $7EC1CB
    .unknown6           : skip 1    ; 06 $7EC1CC
    .unknown7           : skip 1    ; 07 $7EC1CD
    .positionX          : skip 2    ; 08 $7EC1CE
    .positionY          : skip 2    ; 10 $7EC1D0
    .name               : skip 4    ; 12 $7EC1D2    - 4 short bytes as name
endstruct align 16

; Daily flags
struct strcDailyFlags   $7F1F5A
    .flags1             : skip 2    ; 00 $7F1F5A
    .flags2             : skip 2    ; 02 $7F1F5C
    .flags3             : skip 2    ; 04 $7F1F5E
    .flags4             : skip 2    ; 06 $7F1F60
    .flags5             : skip 2    ; 08 $7F1F62
endstruct align 10

; Event flags
struct strcEventFlags   $7F1F64
    .flags1             : skip 2    ; 00 $7F1F64
    .flags2             : skip 2    ; 02 $7F1F66
    .flags3             : skip 2    ; 04 $7F1F68
    .flags4             : skip 2    ; 06 $7F1F6A
    .flags5             : skip 2    ; 08 $7F1F6C
    .flags6             : skip 2    ; 0A $7F1F6E
    .flags7             : skip 2    ; 0C $7F1F70
    .flags8             : skip 2    ; 0E $7F1F72
endstruct align 16

; Player state
struct strcPlayerFlags  $D2
    .flags              : skip 2    ; 00 $0000D2    - 0x0001: active,       0x0002: holding item,   0x0004: eating meal,    0x0008: out of stamina, 0x0010: riding horse    0x0020: in springs      0x0040: jumping over   0x0080: ?
                                    ;               - 0x0100: ?,            0x0200: ?,              0x0400: ?,              0x0800: ?,              0x0010: ?,              0x2000: ?,              0x4000: ?,             0x8000: ?
endstruct align 2