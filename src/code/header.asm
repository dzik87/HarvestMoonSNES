
;;
; @file     header.asm
; @brief    SNES cartridge header ($80FFB0-$80FFDF), ROM checksum and the CPU interrupt vector table ($80FFE0-$80FFFF) for the four regions.
; @details  Header fields: maker code (E9 US, 01 EU/DE, 99 JP), game code AYWE/AYWP/AYWD/AYWJ, title "HARVEST MOON" (JP: half-width katakana), map mode $30 (LoROM, FastROM), chipset $02 (ROM + RAM + battery),
;           ROM size $0B (2 MiB), RAM size $03 (8 KiB SRAM), country code, developer ID $33 (extended header), version 0. The checksum words are fixed values per region and must match the built ROM (tools/build.py verifies it).
;           Interrupt vectors (word each): native COP, BRK, ABORT, NMI (fCore_InterruptNMI), unused RESET slot, IRQ (fCore_InterruptIRQ); emulation COP, unused, ABORT, NMI, RESET (fCore_Reset = real entry point), IRQ/BRK.
;           All unused vectors point at fCore_InterruptReturn (RTI).
; @bank     $80
; @range    $80FFB0-$80FFFF
; @see      src/code/bank_80/core.asm, docs/regions.md
;;
    ORG $80FFB0

; HEADER
    if !REGION_EUDE
        db "01"                                                ; ASCII maker code (EU, DE)
        if !REGION_DE
            db "AYWD"                                          ; ASCII game code (DE)
        else
            db "AYWP"                                          ; ASCII game code (EU)
        endif
    elseif !REGION_JP
        db "99"                                                ; ASCII maker code (JP)
        db "AYWJ"                                              ; ASCII game code (JP)
    else
        db "E9"                                                ; ASCII maker code
        db "AYWE"                                              ; ASCII game code
    endif
    db $00,$00,$00,$00,$00,$00                                 ; Reserved, should be zero
    db $00                                                     ; Expansion flash size: 1 << N kilobytes
    db $00                                                     ; Expansion RAM size: 1 << N kilobytes - for GSU?
    db $00                                                     ; Special version (usually zero)
    db $00                                                     ; Chipset subtype, used if chipset is $F0-$FF
    if !REGION_JP
        db $CE,$DE,$B8,$BC,$DE,$AE,$B3,$D3,$C9,$B6,$DE,$C0,$D8    ; Cartridge title (JP: half-width katakana)
        db "        "
    else
        db "HARVEST MOON         "                                 ; Cartridge title (21 bytes uppercase ASCII. Unused bytes should be spaces.)
    endif
    db $30                                                     ; ROM speed and memory map mode (LoROM/HiROM/ExHiROM)
    db $02                                                     ; Chipset (Indicates if a cartridge contains extra RAM, a battery, and/or a coprocessor)
    db $0B                                                     ; ROM size: 1<<N kilobytes, rounded up (so 8=256KB, 12=4096KB and so on)
    db $03                                                     ; RAM size: 1<<N kilobytes (so 1=2KB, 5=32KB, and so on)
    if !REGION_DE
        db $09                                                 ; Country (DE)
    elseif !REGION_EU
        db $02                                                 ; Country (EU)
    elseif !REGION_JP
        db $00                                                 ; Country (JP)
    else
        db $01                                                 ; Country (Implies NTSC/PAL)
    endif
    db $33                                                     ; Developer ID
    db $00                                                     ; ROM version (0 = first)
 
;;
; @brief    ROM checksum complement and checksum words of the header; fixed per region (US $81C3/$7E3C, EU $9053/$6FAC, DE $0975/$F68A, JP $B159/$4EA6).
; @format   `[word checksum complement][word checksum]`, 4 bytes at $80FFDC.
; @note     Must equal the sum of all ROM bytes; tools/build.py verifies it for every region.
;;
RomChecksum:
    if !REGION_DE
        dw $0975                                               ; Checksum complement (Checksum ^ $FFFF) (DE)
        dw $F68A                                               ; Checksum (DE)
    elseif !REGION_EU
        dw $9053                                               ; Checksum complement (Checksum ^ $FFFF) (EU)
        dw $6FAC                                               ; Checksum (EU)
    elseif !REGION_JP
        dw $B159                                               ; Checksum complement (Checksum ^ $FFFF) (JP)
        dw $4EA6                                               ; Checksum (JP)
    else
        dw $81C3                                               ; Checksum complement (Checksum ^ $FFFF)
        dw $7E3C                                               ; Checksum
    endif
    
    dw fCore_InterruptReturn    ; $FFE0 unused
    dw fCore_InterruptReturn    ; $FFE2 unused
    dw fCore_InterruptReturn    ; $FFE4 native COP
    dw fCore_InterruptReturn    ; $FFE6 native BRK
    dw fCore_InterruptReturn    ; $FFE8 native ABORT
    dw fCore_InterruptNMI    ; $FFEA native NMI (VBlank)
    dw fCore_InterruptReturn    ; $FFEC native RESET slot (unused)
    dw fCore_InterruptIRQ    ; $FFEE native IRQ
    dw fCore_InterruptReturn    ; $FFF0 unused
    dw fCore_InterruptReturn    ; $FFF2 unused
    dw fCore_InterruptReturn    ; $FFF4 emulation COP
    dw fCore_InterruptReturn    ; $FFF6 unused
    dw fCore_InterruptReturn    ; $FFF8 emulation ABORT
    dw fCore_InterruptReturn    ; $FFFA emulation NMI
    dw fCore_Reset    ; $FFFC emulation RESET (entry point after power on)
    dw fCore_InterruptReturn    ; $FFFE emulation IRQ/BRK