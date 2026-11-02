; Bank $83 module "graphics" - starts at $838166
;;
; @file   graphics.asm
; @brief  Small VRAM transfer helpers for the dialog box (glyph tile rows, 2x2 tilemap blocks) and the LZSS decompressor
;         used for compressed tilemaps / character data.
; @bank   $83   @range $838166-$8382C5
; @see    dialog.asm (callers), docs/formats/tilemap-compression.md, fCore_PrepareTransfer (bank $80 DMA queue)
;;
 
 
;;
; @brief   Queue two VRAM DMA transfers that copy one glyph (upper and lower tile row of a 2bpp dialog glyph) to VRAM.
; @details Uses DMA queue slots 6 and 7 (strcSystem.arrayIndex) with destination register $18 (VRAM data port) through
;          fCore_PrepareTransfer with VMAIN value $80. Transfer size is nArg1 * 16 + $10 bytes, i.e. (nArg1 + 1) 2bpp tiles.
;          Slot 6 copies from ptrTemp0x72 to VRAM word address X, slot 7 copies from ptrTemp0x72 + $100 to X + $80 (the
;          tile row below in the VRAM character layout). The transfers are only queued; they run when the queue is started.
; @param   A      number of extra tiles per row minus one (0 = one 8x8 tile per row; the dialog code passes 0, JP passes its own width value (?))
; @param   X      VRAM word destination address of the upper row
; @param   ptrTemp0x72  24-bit pointer to the glyph data (lower row at +$100)
; @modifies strcSystem.arrayIndex, strcSystem.destinationRegister, strcVariables.n16Temp1, ptrTemp0x72
; @note    ptrTemp0x72 is advanced by $100 and DMA queue slots 6 and 7 are filled.
; @clobbers A X Y
; @mode    M16X16 -> M16X16
; @calls   fCore_PrepareTransfer
; @callers fDialog_TransferGlyph
; @note    confidence: medium for the glyph-row interpretation (derived from the call site fDialog_TransferGlyph).
;;
fGraphicsTransferData:
    REP #$30                                                   ;838166|C230    |      ; A: nArg1, X: nArg2
    ASL A                                                      ;838168|0A      |      ;
    ASL A                                                      ;838169|0A      |      ;
    ASL A                                                      ;83816A|0A      |      ;
    ASL A                                                      ;83816B|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;83816C|857E    |00007E;
    SEP #$20                                                   ;83816E|E220    |      ;
    LDA.B #$06                                                 ;838170|A906    |      ;
    STA.B strcSystem.arrayIndex                                ;838172|8527    |000027; $27 = 0x06
    LDA.B #$18                                                 ;838174|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;838176|8529    |000029; $29 = 0x18
    REP #$20                                                   ;838178|C220    |      ;
    LDA.W #$0010                                               ;83817A|A91000  |      ;
    CLC                                                        ;83817D|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;83817E|657E    |00007E;
    TAY                                                        ;838180|A8      |      ; Y = nArg1 * 16 + 0x10
    REP #$20                                                   ;838181|C220    |      ;
    LDA.W #$0080                                               ;838183|A98000  |      ; A = 0x80
    PHX                                                        ;838186|DA      |      ; X -> stack1
    JSL.L fCore_PrepareTransfer                                ;838187|22338A80|808A33;
    SEP #$20                                                   ;83818B|E220    |      ;
    LDA.B #$07                                                 ;83818D|A907    |      ;
    STA.B strcSystem.arrayIndex                                ;83818F|8527    |000027; $27 = 0x07
    LDA.B #$18                                                 ;838191|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;838193|8529    |000029; $29 = 0x18
    REP #$30                                                   ;838195|C230    |      ;
    PLX                                                        ;838197|FA      |      ; X = stack1
    TXA                                                        ;838198|8A      |      ;
    CLC                                                        ;838199|18      |      ;
    ADC.W #$0080                                               ;83819A|698000  |      ;
    TAX                                                        ;83819D|AA      |      ;
    LDA.W #$0010                                               ;83819E|A91000  |      ;
    CLC                                                        ;8381A1|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;8381A2|657E    |00007E;
    TAY                                                        ;8381A4|A8      |      ;
    LDA.B ptrTemp0x72                                          ;8381A5|A572    |000072;
    CLC                                                        ;8381A7|18      |      ;
    ADC.W #$0100                                               ;8381A8|690001  |      ;
    STA.B ptrTemp0x72                                          ;8381AB|8572    |000072;
    REP #$20                                                   ;8381AD|C220    |      ;
    LDA.W #$0080                                               ;8381AF|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;8381B2|22338A80|808A33;
    RTL                                                        ;8381B6|6B      |      ;
 
 
;;
; @brief   Queue two small VRAM DMA transfers that write a 2 x 2 block of BG tilemap entries (two words per row).
; @details Slot 6 copies 4 bytes from ptrTemp0x72 to VRAM word address X, slot 7 copies the next 4 bytes
;          (ptrTemp0x72 + 4) to X + $20, which is the next row of a 32-column tilemap. Both use VMAIN value $80 and
;          destination register $18.
; @param   X      VRAM word address of the top-left tilemap entry
; @param   ptrTemp0x72  24-bit pointer to 4 tilemap words (two rows of two entries)
; @modifies strcSystem.arrayIndex, strcSystem.destinationRegister, ptrTemp0x72
; @note    ptrTemp0x72 is advanced by 4 and DMA queue slots 6 and 7 are filled.
; @clobbers A X Y
; @mode    M8X16 -> M16X16
; @calls   fCore_PrepareTransfer
; @callers fDialog_DrawBlinkIconFrame (next-page blink icon of the dialog box)
;;
fGraphics_WriteTilemap2x2:
    SEP #$20                                                   ;8381B7|E220    |      ; X: nArg1, $72: ptr24
    REP #$10                                                   ;8381B9|C210    |      ;
    LDA.B #$06                                                 ;8381BB|A906    |      ;
    STA.B strcSystem.arrayIndex                                ;8381BD|8527    |000027; $27 = 0x06
    LDA.B #$18                                                 ;8381BF|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;8381C1|8529    |000029; $29 = 0x18
    LDY.W #$0004                                               ;8381C3|A00400  |      ; Y = 0x04
    REP #$20                                                   ;8381C6|C220    |      ;
    LDA.W #$0080                                               ;8381C8|A98000  |      ; A = 0x80
    PHX                                                        ;8381CB|DA      |      ; X -> stack1
    JSL.L fCore_PrepareTransfer                                ;8381CC|22338A80|808A33;
    SEP #$20                                                   ;8381D0|E220    |      ;
    LDA.B #$07                                                 ;8381D2|A907    |      ;
    STA.B strcSystem.arrayIndex                                ;8381D4|8527    |000027; $27 = 0x07
    LDA.B #$18                                                 ;8381D6|A918    |      ;
    STA.B strcSystem.destinationRegister                       ;8381D8|8529    |000029; $29 = 0x18
    REP #$30                                                   ;8381DA|C230    |      ;
    PLX                                                        ;8381DC|FA      |      ;
    TXA                                                        ;8381DD|8A      |      ;
    CLC                                                        ;8381DE|18      |      ;
    ADC.W #$0020                                               ;8381DF|692000  |      ;
    TAX                                                        ;8381E2|AA      |      ; X = nArg1 + 0x20
    LDY.W #$0004                                               ;8381E3|A00400  |      ;
    REP #$20                                                   ;8381E6|C220    |      ;
    LDA.B ptrTemp0x72                                          ;8381E8|A572    |000072;
    CLC                                                        ;8381EA|18      |      ;
    ADC.W #$0004                                               ;8381EB|690400  |      ;
    STA.B ptrTemp0x72                                          ;8381EE|8572    |000072; $72 += 0x04
    LDA.W #$0080                                               ;8381F0|A98000  |      ;
    JSL.L fCore_PrepareTransfer                                ;8381F3|22338A80|808A33;
    RTL                                                        ;8381F7|6B      |      ;
 
 
;;
; @brief   Decompress an LZSS blob (N=2048, F=34) from ptrTemp0x72 to the buffer at ptrUnknown0x75.
; @details Header: word = number of output bytes, followed by 2 more header bytes (skipped). The 2 KB ring buffer is
;          $7F:0000-$7F:07FF, cleared first, write position starts at $07DE. Flag bytes are read LSB first: 1 = literal byte,
;          0 = match: byte 1 = ring offset low 8 bits, byte 2 = bits 0-4 length-3, bits 5-7 = ring offset bits 8-10.
;          Output stops when the counter from the header reaches zero (no end marker). Full format description:
;          docs/formats/tilemap-compression.md.
; @param   ptrTemp0x72     24-bit pointer to the compressed blob
; @param   ptrUnknown0x75  24-bit pointer to the destination buffer
; @return  A      0 (remaining byte counter, strcVariables.n16Temp1)
; @modifies ptrTemp0x72, ptrUnknown0x75, strcVariables.n16Temp1, strcVariables.n16Temp2, strcVariables.n16Temp3, strcVariables.n16Temp4, strcVariables.n16Unk86, strcVariables.n16Unk88
; @note    ptrTemp0x72 / ptrUnknown0x75 end past the last byte read / written; the ring buffer $7F:0000-$7F:07FF is overwritten.
; @clobbers X
; @mode    M16X16 -> =
; @callers fDialog_LoadDialogBoxGraphics, fTileMap_LoadAreaGraphics (two call sites)
; @note    The scratch fields n16Temp2 (flag byte), n16Temp3 (flag bit counter), n16Temp4 (ring write position),
;          n16Unk86 (ring read position) and n16Unk88 (match length) are the "Unk" ones named in structures.asm.
;;
fGraphicsDecompressTilemap:
    PHP                                                        ;8381F8|08      |      ;
    REP #$30                                                   ;8381F9|C230    |      ;
    LDA.W #$0000                                               ;8381FB|A90000  |      ;
    TAX                                                        ;8381FE|AA      |      ;
 
  - STA.L $7F0000,X                                            ;8381FF|9F00007F|7F0000;
    INX                                                        ;838203|E8      |      ;
    INX                                                        ;838204|E8      |      ;
    CPX.W #$0800                                               ;838205|E00008  |      ;
    BCC -                                                      ;838208|90F5    |8381FF;
    REP #$20                                                   ;83820A|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;83820C|A772    |000072;
    STA.B strcVariables.n16Temp1                               ;83820E|857E    |00007E;
    INC.B ptrTemp0x72                                          ;838210|E672    |000072;
    INC.B ptrTemp0x72                                          ;838212|E672    |000072;
    INC.B ptrTemp0x72                                          ;838214|E672    |000072;
    INC.B ptrTemp0x72                                          ;838216|E672    |000072;
    STZ.B strcVariables.n16Temp2                               ;838218|6480    |000080;
    STZ.B strcVariables.n16Temp3                               ;83821A|6482    |000082;
    LDA.W #$07DE                                               ;83821C|A9DE07  |      ;
    STA.B strcVariables.n16Temp4                               ;83821F|8584    |000084;
    LDA.B strcVariables.n16Temp1                               ;838221|A57E    |00007E;
    BNE .loop                                                  ;838223|D000    |838225;
 
.loop:
    DEC.B strcVariables.n16Temp3                               ;838225|C682    |000082;
    BPL +                                                      ;838227|1010    |838239;
    REP #$20                                                   ;838229|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;83822B|A772    |000072;
    INC.B ptrTemp0x72                                          ;83822D|E672    |000072;
    AND.W #$00FF                                               ;83822F|29FF00  |      ;
    STA.B strcVariables.n16Temp2                               ;838232|8580    |000080;
    LDA.W #$0007                                               ;838234|A90700  |      ;
    STA.B strcVariables.n16Temp3                               ;838237|8582    |000082;
 
  + LSR.B strcVariables.n16Temp2                               ;838239|4680    |000080;
    BCC +                                                      ;83823B|9028    |838265;
    REP #$20                                                   ;83823D|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;83823F|A772    |000072;
    INC.B ptrTemp0x72                                          ;838241|E672    |000072;
    AND.W #$00FF                                               ;838243|29FF00  |      ;
    SEP #$20                                                   ;838246|E220    |      ;
    STA.B [ptrUnknown0x75]                                     ;838248|8775    |000075;
    REP #$30                                                   ;83824A|C230    |      ;
    INC.B ptrUnknown0x75                                       ;83824C|E675    |000075;
    DEC.B strcVariables.n16Temp1                               ;83824E|C67E    |00007E;
    BEQ .return                                                ;838250|F070    |8382C2;
    LDX.B strcVariables.n16Temp4                               ;838252|A684    |000084;
    SEP #$20                                                   ;838254|E220    |      ;
    STA.L $7F0000,X                                            ;838256|9F00007F|7F0000;
    REP #$30                                                   ;83825A|C230    |      ;
    TXA                                                        ;83825C|8A      |      ;
    INC A                                                      ;83825D|1A      |      ;
    AND.W #$07FF                                               ;83825E|29FF07  |      ;
    STA.B strcVariables.n16Temp4                               ;838261|8584    |000084;
    BRA .loop                                                  ;838263|80C0    |838225;
 
 
  + REP #$20                                                   ;838265|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;838267|A772    |000072;
    INC.B ptrTemp0x72                                          ;838269|E672    |000072;
    AND.W #$00FF                                               ;83826B|29FF00  |      ;
    STA.B strcVariables.n16Unk86                               ;83826E|8586    |000086;
    REP #$20                                                   ;838270|C220    |      ;
    LDA.B [ptrTemp0x72]                                        ;838272|A772    |000072;
    INC.B ptrTemp0x72                                          ;838274|E672    |000072;
    AND.W #$00FF                                               ;838276|29FF00  |      ;
    TAX                                                        ;838279|AA      |      ;
    AND.W #$001F                                               ;83827A|291F00  |      ;
    INC A                                                      ;83827D|1A      |      ;
    INC A                                                      ;83827E|1A      |      ;
    INC A                                                      ;83827F|1A      |      ;
    STA.B strcVariables.n16Unk88                               ;838280|8588    |000088;
    TXA                                                        ;838282|8A      |      ;
    AND.W #$00E0                                               ;838283|29E000  |      ;
    ASL A                                                      ;838286|0A      |      ;
    ASL A                                                      ;838287|0A      |      ;
    ASL A                                                      ;838288|0A      |      ;
    ORA.B strcVariables.n16Unk86                               ;838289|0586    |000086;
    STA.B strcVariables.n16Unk86                               ;83828B|8586    |000086;
 
  - LDX.B strcVariables.n16Unk86                               ;83828D|A686    |000086;
    LDA.L $7F0000,X                                            ;83828F|BF00007F|7F0000;
    AND.W #$00FF                                               ;838293|29FF00  |      ;
    SEP #$20                                                   ;838296|E220    |      ;
    STA.B [ptrUnknown0x75]                                     ;838298|8775    |000075;
    REP #$30                                                   ;83829A|C230    |      ;
    INC.B ptrUnknown0x75                                       ;83829C|E675    |000075;
    DEC.B strcVariables.n16Temp1                               ;83829E|C67E    |00007E;
    BEQ .return                                                ;8382A0|F020    |8382C2;
    LDX.B strcVariables.n16Temp4                               ;8382A2|A684    |000084;
    SEP #$20                                                   ;8382A4|E220    |      ;
    STA.L $7F0000,X                                            ;8382A6|9F00007F|7F0000;
    REP #$30                                                   ;8382AA|C230    |      ;
    TXA                                                        ;8382AC|8A      |      ;
    INC A                                                      ;8382AD|1A      |      ;
    AND.W #$07FF                                               ;8382AE|29FF07  |      ;
    STA.B strcVariables.n16Temp4                               ;8382B1|8584    |000084;
    LDA.B strcVariables.n16Unk86                               ;8382B3|A586    |000086;
    INC A                                                      ;8382B5|1A      |      ;
    AND.W #$07FF                                               ;8382B6|29FF07  |      ;
    STA.B strcVariables.n16Unk86                               ;8382B9|8586    |000086;
    DEC.B strcVariables.n16Unk88                               ;8382BB|C688    |000088;
    BNE -                                                      ;8382BD|D0CE    |83828D;
    JMP.W .loop                                                ;8382BF|4C2582  |838225;
 
 
.return:
    LDA.B strcVariables.n16Temp1                               ;8382C2|A57E    |00007E;
    PLP                                                        ;8382C4|28      |      ;
    RTL                                                        ;8382C5|6B      |      ;
