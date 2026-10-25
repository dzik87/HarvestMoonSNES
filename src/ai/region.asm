; Region support for the AI script banks ($B3-$B5).
;
; The US scripts are the base; EU/DE/JP differ in a handful of commands (`if !REGION_xx` blocks inside
; src/ai/us/scripts/*.asm, catalogue in docs/regions-ai.md) and in WRAM addresses.  Pointers need no handling:
; they are labels, so a longer or shorter script moves everything behind it automatically.
;
; wram80(label) is the long address of a WRAM variable through the $80:0000 mirror (the AI commands 0x14-0x16, 0x21,
; 0x23, 0x26-0x28, 0x32 and 0x41-0x48 use it for the low WRAM variables).  The label values carry the DE shift
; (!DE_RAM_SHIFT, WRAM from $08D1 up is 6 bytes higher) through src/common/ram.asm / structures.asm.
;
; JP: the AI scripts address the same variables 32 bytes lower (from $0917 up; measured on all 459 such operands).
; The common RAM map (src/common/region.asm, !RAM_SHIFT = -32 for JP, labels and `+!DE_RAM_SHIFT` literals) carries
; this shift now, so no extra delta is applied here.
!AI_JP_WRAM_DELTA = 0

function wram80(a) = $800000|select(greaterequal(a&$FFFF,$0917),(a&$FFFF)+!AI_JP_WRAM_DELTA,a&$FFFF)
