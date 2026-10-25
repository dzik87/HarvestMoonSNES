
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
    
    dw fCore_InterruptReturn
    dw fCore_InterruptReturn
    dw fCore_InterruptReturn
    dw fCore_InterruptReturn
    dw fCore_InterruptReturn
    dw fCore_InterruptNMI1
    dw fCore_InterruptReturn
    dw fCore_InterruptNMI3
    dw fCore_InterruptReturn
    dw fCore_InterruptReturn
    dw fCore_InterruptReturn
    dw fCore_InterruptReturn
    dw fCore_InterruptReturn
    dw fCore_InterruptReturn
    dw fCore_InterruptIRQ5
    dw fCore_InterruptReturn