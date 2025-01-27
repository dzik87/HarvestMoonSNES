
    ORG $80FFB0

; HEADER
    db "E9"                                                    ; ASCII maker code
    db "AYWE"                                                  ; ASCII game code
    db $00,$00,$00,$00,$00,$00                                 ; Reserved, should be zero
    db $00                                                     ; Expansion flash size: 1 << N kilobytes
    db $00                                                     ; Expansion RAM size: 1 << N kilobytes - for GSU?
    db $00                                                     ; Special version (usually zero)
    db $00                                                     ; Chipset subtype, used if chipset is $F0-$FF
    db "HARVEST MOON         "                                 ; Cartridge title (21 bytes uppercase ASCII. Unused bytes should be spaces.)
    db $30                                                     ; ROM speed and memory map mode (LoROM/HiROM/ExHiROM)
    db $02                                                     ; Chipset (Indicates if a cartridge contains extra RAM, a battery, and/or a coprocessor)
    db $0B                                                     ; ROM size: 1<<N kilobytes, rounded up (so 8=256KB, 12=4096KB and so on)
    db $03                                                     ; RAM size: 1<<N kilobytes (so 1=2KB, 5=32KB, and so on)
    db $01                                                     ; Country (Implies NTSC/PAL)
    db $33                                                     ; Developer ID
    db $00                                                     ; ROM version (0 = first)
 
RomChecksum:
    dw $81C3                                                   ; Checksum complement (Checksum ^ $FFFF)
    dw $7E3C                                                   ; Checksum
    
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