; Game Objects (40 entries)
struct strcGameObject   $019C
    .initailized        : skip 2    ; 00 $019C      - $7777 if initialized, 0 if not
    .spriteTableIdx     : skip 2    ; 02 $019E      - used as index to get sprite metadata from banks $86/$87
    .flip               : skip 2    ; 04 $01A0
    .unknown6           : skip 2    ; 06 $01A2
    .positionX          : skip 2    ; 08 $01A4
    .positionY          : skip 2    ; 10 $01A6
    .pointer12          : skip 4    ; 12 $01A8      - value of table 8X8080, pointer to sprite_table_address
    .pointer16          : skip 3    ; 16 $01AC      - pointer value
    .totalComponents    : skip 1    ; 19 $01AF      - the ammount of SOBJ composing the GOBJ
    .components         : skip 1    ; 20 $01B0      - the components, $FF means unused
    .unknown21          : skip 1    ; 21 $01B1
    .unknown22          : skip 1    ; 22 $01B2
    .unknown23          : skip 1    ; 23 $01B3
    .unknown24          : skip 1    ; 24 $01B4
    .unknown25          : skip 1    ; 25 $01B5
    .unknown26          : skip 1    ; 26 $01B6
    .unknown27          : skip 1    ; 27 $01B7
    .unknown28          : skip 1    ; 28 $01B8
    .unknown29          : skip 1    ; 29 $01B9
    .unknown30          : skip 1    ; 30 $01BA
    .unknown31          : skip 1    ; 31 $01BB
    .unknown32          : skip 1    ; 32 $01BC
    .unknown33          : skip 1    ; 33 $01BD
    .unknown34          : skip 1    ; 34 $01BE
    .unknown35          : skip 1    ; 35 $01BF
endstruct align 36


; Shed Items
struct strcShedItems    $7F1F00
    .row1               : skip 1    ; 00 $7F1F00
    .row2               : skip 1    ; 01 $7F1F01
    .row3               : skip 1    ; 02 $7F1F02
    .row4               : skip 1    ; 03 $7F1F03
endstruct align 4

; Chicken Data
struct strcChickenData  $7EC286
    .unknown0           : skip 1    ; 00 $7EC286    - ?1??ECAe (E - egg, C - child, A - adult, e - exists)
    .mapID              : skip 1    ; 01 $7EC287
    .unknown2           : skip 1    ; 02 $7EC288
    .unknown3           : skip 1    ; 03 $7EC289
    .positionX          : skip 2    ; 04 $7EC28A
    .positionY          : skip 2    ; 06 $7EC28C
endstruct align 8

; Cow Data
struct strcCowData      $7EC1C6
    .statusFlags        : skip 1    ; 00 $7EC1C6    - ?pscBCAe (p - pregnacy, s - sick, c - cranky, B - baby, C - child, A - adult, e - exists)
    .unknown0           : skip 1    ; 01 $7EC1C7
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