; Region (release) selection for the patch blocks of the code banks $80-$85.
;
; The build defines at most one of REGION_EU, REGION_DE, REGION_JP (assembler option -D..=1); without any of
; them the US release is built. Patch blocks in the sources look like
;
;     if !REGION_EUDE         ; or !REGION_DE / !REGION_EU / !REGION_JP
;         <code of these releases>
;     elseif !REGION_JP
;         <JP code>
;     else
;         <US code>
;     endif
;
; Symbols for conditions: !REGION_US, !REGION_EU, !REGION_DE, !REGION_JP (each 0 or 1) and the derived
; !REGION_EUDE (DE or EU: the two PAL releases, which share most of their changes against US).

!REGION_EU ?= 0
!REGION_DE ?= 0
!REGION_JP ?= 0
!REGION_COUNT #= !REGION_EU+!REGION_DE+!REGION_JP
if !REGION_COUNT > 1
    error "Define at most one of REGION_EU, REGION_DE, REGION_JP"
endif
!REGION_US #= 1-!REGION_COUNT
!REGION_EUDE #= !REGION_EU|!REGION_DE

; WRAM layout. Everything from $7E08D1 up to the DMA queues at $7E2000 is `!RAM_SHIFT` bytes higher than in the
; US release (strcNames has release specific field sizes, see src/common/structures.asm). Hex literals that point
; into this block are written `$xxxx+!RAM_SHIFT`.
if !REGION_DE
    !RAM_SHIFT = 6
    !NAME_WEEKDAY_SIZE = 24
elseif !REGION_JP
    !RAM_SHIFT = -32
    !NAME_WEEKDAY_SIZE = 2
else
    !RAM_SHIFT = 0
    !NAME_WEEKDAY_SIZE = 18
endif

; Former name of !RAM_SHIFT (still used by the AI script banks).
!DE_RAM_SHIFT #= !RAM_SHIFT

; Sizes of the text fields of strcNames (US/EU/DE; JP has 2 byte kanji words)
if !REGION_JP
    !NAME_GIRL_SIZE = 8
    !NAME_SEASON_SIZE = 2
    !NAME_ORDINAL_SIZE = 0
else
    !NAME_GIRL_SIZE = 10
    !NAME_SEASON_SIZE = 12
    !NAME_ORDINAL_SIZE = 4
endif
