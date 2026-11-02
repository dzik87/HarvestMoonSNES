;;
; @file   objects.asm
; @brief  Game-object (animated sprite) engine: 40 object slots, animation list stepping, draw ordering, OAM buffer building,
;         and the sprite tile cache that streams 16x16 sprite graphics into VRAM through a DMA queue.
; @details An object slot (strcGameObject, $24 bytes, 40 slots at $7E019C) holds an object index (strcGameObject.spriteTableIdx),
;         flip bits ($40 horizontal, $80 vertical), a world position, the animation list pointer, the current frame pointer with
;         its frame timer and up to 16 "component" bytes = tile cache slot per 16x16 hardware sprite ($FF = not resident).
;         Indices below $0262 use animation data in bank $86, the others bank $87 (index - $262).
;         Per frame: fObject_UpdateAllAnimations -> fObject_ProcessTileLoadQueue -> fObject_RenderAll (core.asm main loop);
;         in NMI: fObject_ExecuteTileDmaQueue. Tile cache: byte table $7F0F00 (tile id -> cache slot or $FF), slot table
;         $7EA320 (4 bytes per slot: reference count, owner tile id), request ring buffer $7EA220 (64 x [tile id, address
;         of the requester's component byte]), VRAM DMA list at DMAtoVRAMData ($7EA420, 6 bytes per entry).
;         OAM shadow: DMASpriteOBJQueue ($7EA000, 128 x [x, y, tile, attr]) and DMASpriteOBJ2BitQueue ($7EA200, high table).
; @bank   $85   @range $858000-$85FFFF
; @see    docs/formats/object-data.md, docs/formats/sprite-assembly.md, src/common/structures.asm (strcObject, strcGameObject)
;;

 
    ORG $858000
 
 
;;
; @brief   Creates a new game object in the first free slot and loads its first animation frame.
; @details Selects bank $86/$87 from the object index. The search range strcPlayer.gameObjectSlotLimit grows by one on every
;          call until it reaches $28 (40 slots). The slot gets initialized = $7777, index, flip, position, list pointer
;          (word from the pointer table), step pointer (list + 3), frame pointer and timer (first step), then the frame is
;          parsed (component tile slots acquired).
; @param   strcObject.spriteTableIdx   object index (animation list)
; @param   strcObject.flip, strcObject.unkA3, strcObject.posX, strcObject.posY
; @return  strcObject.exists   0 = created, $FFFF = no free slot
; @return  strcObject.gameObjectIdx   slot number (0-39)
; @modifies strcGameObject (slot), strcPlayer.gameObjectSlotLimit, ptrUnknown0x75, ptrObjectData
; @clobbers A X Y
; @mode    M16X16
; @calls   fObject_ParseObjectData
;;
fObject_Create:
    REP #$20                                                   ;858000|C220    |      ;
    LDA.B strcObject.spriteTableIdx                            ;858002|A5A1    |0000A1;
    CMP.W #$0262                                               ;858004|C96202  |      ; game object indexes above 0x262 are located at bank 87
    BCS .high_object_bank                                                ;858007|B00A    |858013;
    SEP #$20                                                   ;858009|E220    |      ;
    LDA.B #$86                                                 ;85800B|A986    |      ;
    STA.B ptrUnknown0x75+2                                     ;85800D|8577    |000077;
    STA.B ptrObjectData+2                                      ;85800F|857A    |00007A;
    BRA .bank_selected                                                ;858011|8008    |85801B;
 
 
.high_object_bank:
    SEP #$20                                                   ;858013|E220    |      ;
    LDA.B #$87                                                 ;858015|A987    |      ;
    STA.B ptrUnknown0x75+2                                     ;858017|8577    |000077;
    STA.B ptrObjectData+2                                      ;858019|857A    |00007A;
 
.bank_selected:
    REP #$30                                                   ;85801B|C230    |      ;
    REP #$30                                                   ;85801D|C230    |      ;
    LDX.W #$0000                                               ;85801F|A20000  |      ;
    LDY.W #$0000                                               ;858022|A00000  |      ;
    LDA.B strcPlayer.gameObjectSlotLimit                                     ;858025|A5DC    |0000DC;
    CMP.W #$0028                                               ;858027|C92800  |      ;
    BEQ .find_slot_loop                                                ;85802A|F003    |85802F;
    INC A                                                      ;85802C|1A      |      ;
    STA.B strcPlayer.gameObjectSlotLimit                                     ;85802D|85DC    |0000DC;
 
.find_slot_loop:
    LDA.W strcGameObject.initailized,X                         ;85802F|BD9C01  |00019C;
    BEQ .slot_found                                                ;858032|F012    |858046;
    TXA                                                        ;858034|8A      |      ;
    CLC                                                        ;858035|18      |      ;
    ADC.W #$0024                                               ;858036|692400  |      ;
    TAX                                                        ;858039|AA      |      ;
    INY                                                        ;85803A|C8      |      ;
    CPY.B strcPlayer.gameObjectSlotLimit                                     ;85803B|C4DC    |0000DC;
    BNE .find_slot_loop                                                ;85803D|D0F0    |85802F;
    LDA.W #$FFFF                                               ;85803F|A9FFFF  |      ;
    STA.B strcObject.exists                                    ;858042|85A7    |0000A7;
    BRA fObject_ReturnLong                                         ;858044|8072    |8580B8;
 
 
.slot_found:
    STY.B strcObject.gameObjectIdx                             ;858046|84A5    |0000A5;
    LDA.W #$7777                                               ;858048|A97777  |      ;
    STA.W strcGameObject.initailized,X                         ;85804B|9D9C01  |00019C;
    LDA.B strcObject.spriteTableIdx                            ;85804E|A5A1    |0000A1;
    STA.W strcGameObject.spriteTableIdx,X                      ;858050|9D9E01  |00019E;
    LDA.B strcObject.flip                                      ;858053|A59F    |00009F;
    STA.W strcGameObject.flip,X                                ;858055|9DA001  |0001A0;
    LDA.B strcObject.unkA3                                     ;858058|A5A3    |0000A3;
    STA.W strcGameObject.unknown6,X                            ;85805A|9DA201  |0001A2;
    LDA.B strcObject.posX                                      ;85805D|A59B    |00009B;
    STA.W strcGameObject.positionX,X                           ;85805F|9DA401  |0001A4;
    LDA.B strcObject.posY                                      ;858062|A59D    |00009D;
    STA.W strcGameObject.positionY,X                           ;858064|9DA601  |0001A6;
    STX.B strcObject.gameObjectIdxOffs                         ;858067|86A9    |0000A9;
    LDA.B strcObject.spriteTableIdx                            ;858069|A5A1    |0000A1;
    CMP.W #$0262                                               ;85806B|C96202  |      ;
    BCS .high_anim_list                                                ;85806E|B00D    |85807D;
    LDA.W strcGameObject.spriteTableIdx,X                      ;858070|BD9E01  |00019E;
    ASL A                                                      ;858073|0A      |      ;
    TAX                                                        ;858074|AA      |      ;
    LDA.L aObjAnimListPtrs_86,X                                      ;858075|BF808086|868080;
    STA.B ptrUnknown0x75                                       ;858079|8575    |000075;
    BRA .store_anim_list                                                ;85807B|800F    |85808C;
 
 
.high_anim_list:
    LDA.W strcGameObject.spriteTableIdx,X                      ;85807D|BD9E01  |00019E;
    SEC                                                        ;858080|38      |      ;
    SBC.W #$0262                                               ;858081|E96202  |      ;
    ASL A                                                      ;858084|0A      |      ;
    TAX                                                        ;858085|AA      |      ;
    LDA.L aObjAnimListPtrs_87,X                                      ;858086|BF808087|878080;
    STA.B ptrUnknown0x75                                       ;85808A|8575    |000075;
 
.store_anim_list:
    LDX.B strcObject.gameObjectIdxOffs                         ;85808C|A6A9    |0000A9;
    LDA.B ptrUnknown0x75                                       ;85808E|A575    |000075;
    STA.W strcGameObject.objectListPointer,X                   ;858090|9DA801  |0001A8;
    CLC                                                        ;858093|18      |      ;
    ADC.W #$0003                                               ;858094|690300  |      ;
    STA.W strcGameObject.objectListPointer+2,X                 ;858097|9DAA01  |0001AA;
    LDY.W #$0000                                               ;85809A|A00000  |      ;
    LDA.B [ptrUnknown0x75],Y                                   ;85809D|B775    |000075;
    STA.W strcGameObject.objectDataPointer,X                   ;85809F|9DAC01  |0001AC;
    SEP #$20                                                   ;8580A2|E220    |      ;
    LDY.W #$0002                                               ;8580A4|A00200  |      ;
    LDA.B [ptrUnknown0x75],Y                                   ;8580A7|B775    |000075;
    STA.W strcGameObject.objectDataPointer+2,X                 ;8580A9|9DAE01  |0001AE;
    REP #$20                                                   ;8580AC|C220    |      ;
    JSR.W fObject_ParseObjectData                              ;8580AE|20E58A  |858AE5;
    REP #$20                                                   ;8580B1|C220    |      ;
    LDA.W #$0000                                               ;8580B3|A90000  |      ;
    STA.B strcObject.exists                                    ;8580B6|85A7    |0000A7;
 
;;
; @brief   Shared RTL (fObject_Create falls into it, Replace and Destroy jump to it).
; @note    BUG (original): Replace/Destroy use it as an early exit instead of their own .return; harmless.
;;
fObject_ReturnLong:
    RTL                                                        ;8580B8|6B      |      ; FIXME: I want to be .return
 
 
;;
; @brief   Updates flip and position of an existing object slot.
; @param   strcObject.gameObjectIdx, strcObject.flip, strcObject.posX, strcObject.posY
; @return  strcObject.exists   0 = updated, 1 = slot not in use
; @modifies strcGameObject.flip, strcGameObject.positionX, strcGameObject.positionY, strcObject.gameObjectIdxOffs
; @clobbers A X
; @mode    M16X16
;;
fObject_UpdatePositionAndFlip:
    REP #$20                                                   ;8580B9|C220    |      ;
    LDA.B strcObject.spriteTableIdx                            ;8580BB|A5A1    |0000A1;
    CMP.W #$0262                                               ;8580BD|C96202  |      ;
    BCS .high_object_bank                                                ;8580C0|B00A    |8580CC;
    SEP #$20                                                   ;8580C2|E220    |      ;
    LDA.B #$86                                                 ;8580C4|A986    |      ;
    STA.B ptrUnknown0x75+2                                     ;8580C6|8577    |000077;
    STA.B ptrObjectData+2                                      ;8580C8|857A    |00007A;
    BRA .bank_selected                                                ;8580CA|8008    |8580D4;
 
 
.high_object_bank:
    SEP #$20                                                   ;8580CC|E220    |      ;
    LDA.B #$87                                                 ;8580CE|A987    |      ;
    STA.B ptrUnknown0x75+2                                     ;8580D0|8577    |000077;
    STA.B ptrObjectData+2                                      ;8580D2|857A    |00007A;
 
.bank_selected:
    REP #$30                                                   ;8580D4|C230    |      ;
    LDA.B strcObject.gameObjectIdx                             ;8580D6|A5A5    |0000A5;
    ASL A                                                      ;8580D8|0A      |      ;
    TAX                                                        ;8580D9|AA      |      ;
    LDA.L aGameObjectIndexOffsets,X                            ;8580DA|BFE08B85|858BE0;
    STA.B strcObject.gameObjectIdxOffs                         ;8580DE|85A9    |0000A9;
    TAX                                                        ;8580E0|AA      |      ;
    LDA.W #$0001                                               ;8580E1|A90100  |      ;
    STA.B strcObject.exists                                    ;8580E4|85A7    |0000A7;
    LDA.W strcGameObject.initailized,X                         ;8580E6|BD9C01  |00019C;
    BEQ .return                                                ;8580E9|F014    |8580FF;
    LDA.B strcObject.flip                                      ;8580EB|A59F    |00009F;
    STA.W strcGameObject.flip,X                                ;8580ED|9DA001  |0001A0;
    LDA.B strcObject.posX                                      ;8580F0|A59B    |00009B;
    STA.W strcGameObject.positionX,X                           ;8580F2|9DA401  |0001A4;
    LDA.B strcObject.posY                                      ;8580F5|A59D    |00009D;
    STA.W strcGameObject.positionY,X                           ;8580F7|9DA601  |0001A6;
    LDA.W #$0000                                               ;8580FA|A90000  |      ;
    STA.B strcObject.exists                                    ;8580FD|85A7    |0000A7;
 
.return:
    RTL                                                        ;8580FF|6B      |      ;
 
 
;;
; @brief   Switches an existing object to another animation (new object index), keeping the slot.
; @details Does nothing while some tile of the old frame is still queued for loading (fObject_CheckComponentsPending:
;          the queue entries point at the component bytes). Otherwise releases the old tiles and loads the new list like
;          fObject_Create.
; @param   strcObject.gameObjectIdx, strcObject.spriteTableIdx, strcObject.flip, strcObject.unkA3, strcObject.posX, strcObject.posY
; @return  strcObject.exists   0 = replaced (not written when the call was refused: previous value stays)
; @modifies strcGameObject (slot)
; @clobbers A X Y
; @mode    M16X16
; @calls   fObject_CheckComponentsPending, fObject_ReleaseSpriteTiles, fObject_ParseObjectData
;;
fObject_Replace:
    REP #$30                                                   ;858100|C230    |      ;
    REP #$20                                                   ;858102|C220    |      ;
    LDA.B strcObject.spriteTableIdx                            ;858104|A5A1    |0000A1;
    CMP.W #$0262                                               ;858106|C96202  |      ;
    BCS .high_object_bank                                                ;858109|B00A    |858115;
    SEP #$20                                                   ;85810B|E220    |      ;
    LDA.B #$86                                                 ;85810D|A986    |      ;
    STA.B ptrUnknown0x75+2                                     ;85810F|8577    |000077;
    STA.B ptrObjectData+2                                      ;858111|857A    |00007A;
    BRA .bank_selected                                                ;858113|8008    |85811D;
 
 
.high_object_bank:
    SEP #$20                                                   ;858115|E220    |      ;
    LDA.B #$87                                                 ;858117|A987    |      ;
    STA.B ptrUnknown0x75+2                                     ;858119|8577    |000077;
    STA.B ptrObjectData+2                                      ;85811B|857A    |00007A;
 
.bank_selected:
    REP #$30                                                   ;85811D|C230    |      ;
    LDA.B strcObject.gameObjectIdx                             ;85811F|A5A5    |0000A5;
    ASL A                                                      ;858121|0A      |      ;
    TAX                                                        ;858122|AA      |      ;
    LDA.L aGameObjectIndexOffsets,X                            ;858123|BFE08B85|858BE0;
    STA.B strcObject.gameObjectIdxOffs                         ;858127|85A9    |0000A9;
    JSR.W fObject_CheckComponentsPending                                      ;858129|207B8B  |858B7B;
    LDA.B strcObject.bankAddress                               ;85812C|A5AF    |0000AF;
    BNE fObject_ReturnLong                                         ;85812E|D088    |8580B8; BUG - should be .return in this function rather than previous one since we are out of function scope
    JSR.W fObject_ReleaseSpriteTiles                                      ;858130|20418B  |858B41;
    REP #$30                                                   ;858133|C230    |      ;
    LDY.B strcObject.gameObjectIdx                             ;858135|A4A5    |0000A5;
    LDX.B strcObject.gameObjectIdxOffs                         ;858137|A6A9    |0000A9;
    LDA.B strcObject.spriteTableIdx                            ;858139|A5A1    |0000A1;
    STA.W strcGameObject.spriteTableIdx,X                      ;85813B|9D9E01  |00019E;
    LDA.B strcObject.flip                                      ;85813E|A59F    |00009F;
    STA.W strcGameObject.flip,X                                ;858140|9DA001  |0001A0;
    LDA.B strcObject.unkA3                                     ;858143|A5A3    |0000A3;
    STA.W strcGameObject.unknown6,X                            ;858145|9DA201  |0001A2;
    LDA.B strcObject.posX                                      ;858148|A59B    |00009B;
    STA.W strcGameObject.positionX,X                           ;85814A|9DA401  |0001A4;
    LDA.B strcObject.posY                                      ;85814D|A59D    |00009D;
    STA.W strcGameObject.positionY,X                           ;85814F|9DA601  |0001A6;
    STX.B strcObject.gameObjectIdxOffs                         ;858152|86A9    |0000A9;
    LDA.B strcObject.spriteTableIdx                            ;858154|A5A1    |0000A1;
    CMP.W #$0262                                               ;858156|C96202  |      ;
    BCS .high_anim_list                                                ;858159|B00D    |858168;
    LDA.W strcGameObject.spriteTableIdx,X                      ;85815B|BD9E01  |00019E;
    ASL A                                                      ;85815E|0A      |      ;
    TAX                                                        ;85815F|AA      |      ;
    LDA.L aObjAnimListPtrs_86,X                                      ;858160|BF808086|868080;
    STA.B ptrUnknown0x75                                       ;858164|8575    |000075;
    BRA .store_anim_list                                                ;858166|800F    |858177;
 
 
.high_anim_list:
    LDA.W strcGameObject.spriteTableIdx,X                      ;858168|BD9E01  |00019E;
    SEC                                                        ;85816B|38      |      ;
    SBC.W #$0262                                               ;85816C|E96202  |      ;
    ASL A                                                      ;85816F|0A      |      ;
    TAX                                                        ;858170|AA      |      ;
    LDA.L aObjAnimListPtrs_87,X                                      ;858171|BF808087|878080;
    STA.B ptrUnknown0x75                                       ;858175|8575    |000075;
 
.store_anim_list:
    LDX.B strcObject.gameObjectIdxOffs                         ;858177|A6A9    |0000A9;
    LDA.B ptrUnknown0x75                                       ;858179|A575    |000075;
    STA.W strcGameObject.objectListPointer,X                   ;85817B|9DA801  |0001A8;
    CLC                                                        ;85817E|18      |      ;
    ADC.W #$0003                                               ;85817F|690300  |      ;
    STA.W strcGameObject.objectListPointer+2,X                 ;858182|9DAA01  |0001AA;
    LDY.W #$0000                                               ;858185|A00000  |      ;
    LDA.B [ptrUnknown0x75],Y                                   ;858188|B775    |000075;
    STA.W strcGameObject.objectDataPointer,X                   ;85818A|9DAC01  |0001AC;
    SEP #$20                                                   ;85818D|E220    |      ;
    LDY.W #$0002                                               ;85818F|A00200  |      ;
    LDA.B [ptrUnknown0x75],Y                                   ;858192|B775    |000075;
    STA.W strcGameObject.objectDataPointer+2,X                 ;858194|9DAE01  |0001AE;
    REP #$20                                                   ;858197|C220    |      ;
    JSR.W fObject_ParseObjectData                              ;858199|20E58A  |858AE5;
    LDA.W #$0000                                               ;85819C|A90000  |      ;
    STA.B strcObject.exists                                    ;85819F|85A7    |0000A7;
 
.return:
    RTL                                                        ;8581A1|6B      |      ;
 
 
;;
; @brief   Frees an object slot (releases its tile cache references, initialized = 0).
; @details Refused (returns without change) while some of its tiles are still queued for loading.
; @param   strcObject.gameObjectIdx
; @modifies strcGameObject.initailized
; @clobbers A X Y
; @mode    M16X16
; @calls   fObject_CheckComponentsPending, fObject_ReleaseSpriteTiles
;;
fObject_Destroy:
    REP #$30                                                   ;8581A2|C230    |      ;
    LDA.B strcObject.gameObjectIdx                             ;8581A4|A5A5    |0000A5;
    ASL A                                                      ;8581A6|0A      |      ;
    TAX                                                        ;8581A7|AA      |      ;
    LDA.L aGameObjectIndexOffsets,X                            ;8581A8|BFE08B85|858BE0;
    STA.B strcObject.gameObjectIdxOffs                         ;8581AC|85A9    |0000A9;
    JSR.W fObject_CheckComponentsPending                                      ;8581AE|207B8B  |858B7B;
    LDA.B strcObject.bankAddress                               ;8581B1|A5AF    |0000AF;
    BEQ +                                                      ;8581B3|F003    |8581B8;
    JMP.W fObject_ReturnLong                                       ;8581B5|4CB880  |8580B8; BUG - should be .return in this function rather than JUMP to other RTL
 
 
  + JSR.W fObject_ReleaseSpriteTiles                                      ;8581B8|20418B  |858B41;
    REP #$30                                                   ;8581BB|C230    |      ;
    LDX.B strcObject.gameObjectIdxOffs                         ;8581BD|A6A9    |0000A9;
    REP #$30                                                   ;8581BF|C230    |      ;
    LDA.W #$0000                                               ;8581C1|A90000  |      ;
    STA.W strcGameObject.initailized,X                         ;8581C4|9D9C01  |00019C;
    LDA.W strcGameObject.objectListPointer+2,X                 ;8581C7|BDAA01  |0001AA;
 
.return:
    RTL                                                        ;8581CA|6B      |      ;
 
 
;;
; @brief   Reads flip, position and index of an object slot into the strcObject scratch fields.
; @param   strcObject.gameObjectIdx
; @return  strcObject.spriteTableIdx, strcObject.flip, strcObject.unkA3, strcObject.posX, strcObject.posY   (only if the slot is in use)
; @return  strcObject.exists   sign extension of the frame timer byte (strcGameObject.objectDataPointer+2): 0 or $FFFF - used by callers to detect that the animation reached a $FF-timer step (?)
; @clobbers A X
; @mode    M16X16
; @note    confidence: medium on the meaning of the exists value; callers compare strcObjectData.exist with $FFFF (see fPlayerAction0x10).
;;
fObject_GetSingleObjectData:
    REP #$30                                                   ;8581CB|C230    |      ;
    LDA.B strcObject.gameObjectIdx                             ;8581CD|A5A5    |0000A5;
    ASL A                                                      ;8581CF|0A      |      ;
    TAX                                                        ;8581D0|AA      |      ;
    LDA.L aGameObjectIndexOffsets,X                            ;8581D1|BFE08B85|858BE0;
    STA.B strcObject.gameObjectIdxOffs                         ;8581D5|85A9    |0000A9;
    TAX                                                        ;8581D7|AA      |      ;
    LDA.W strcGameObject.initailized,X                         ;8581D8|BD9C01  |00019C;
    BEQ +                                                      ;8581DB|F019    |8581F6;
    LDA.W strcGameObject.spriteTableIdx,X                      ;8581DD|BD9E01  |00019E;
    STA.B strcObject.spriteTableIdx                            ;8581E0|85A1    |0000A1;
    LDA.W strcGameObject.flip,X                                ;8581E2|BDA001  |0001A0;
    STA.B strcObject.flip                                      ;8581E5|859F    |00009F;
    LDA.W strcGameObject.unknown6,X                            ;8581E7|BDA201  |0001A2;
    STA.B strcObject.unkA3                                     ;8581EA|85A3    |0000A3;
    LDA.W strcGameObject.positionX,X                           ;8581EC|BDA401  |0001A4;
    STA.B strcObject.posX                                      ;8581EF|859B    |00009B;
    LDA.W strcGameObject.positionY,X                           ;8581F1|BDA601  |0001A6;
    STA.B strcObject.posY                                      ;8581F4|859D    |00009D;
 
  + SEP #$20                                                   ;8581F6|E220    |      ;
    LDA.W strcGameObject.objectDataPointer+2,X                 ;8581F8|BDAE01  |0001AE;
    SEP #$20                                                   ;8581FB|E220    |      ;
    CMP.B #$00                                                 ;8581FD|C900    |      ;
    BMI .sign_negative                                                ;8581FF|3005    |858206;
    XBA                                                        ;858201|EB      |      ;
    LDA.B #$00                                                 ;858202|A900    |      ;
    BRA .store_sign_extended                                                ;858204|8003    |858209;
 
 
.sign_negative:
    XBA                                                        ;858206|EB      |      ;
    LDA.B #$FF                                                 ;858207|A9FF    |      ;
 
.store_sign_extended:
    XBA                                                        ;858209|EB      |      ;
    REP #$20                                                   ;85820A|C220    |      ;
    STA.B strcObject.exists                                    ;85820C|85A7    |0000A7;
    RTL                                                        ;85820E|6B      |      ;
 
 
;;
; @brief   Resets all 40 object slots (empty, components $FF) and the OAM buffer.
; @modifies strcGameObject, strcVariables.n16Unk86, strcPlayer.gameObjectSlotLimit
; @clobbers A X Y
; @mode    M16X16
; @calls   fObject_ClearOamBuffer_Init
;;
fObject_ClearGameObject:
    REP #$30                                                   ;85820F|C230    |      ;
    REP #$20                                                   ;858211|C220    |      ;
    LDA.B strcObject.spriteTableIdx                            ;858213|A5A1    |0000A1;
    CMP.W #$0262                                               ;858215|C96202  |      ;
    BCS .bank87                                                ;858218|B00A    |858224;
    SEP #$20                                                   ;85821A|E220    |      ;
    LDA.B #$86                                                 ;85821C|A986    |      ;
    STA.B ptrUnknown0x75+2                                     ;85821E|8577    |000077;
    STA.B ptrObjectData+2                                      ;858220|857A    |00007A;
    BRA .continue                                              ;858222|8008    |85822C;
 
 
.bank87:
    SEP #$20                                                   ;858224|E220    |      ;
    LDA.B #$87                                                 ;858226|A987    |      ;
    STA.B ptrUnknown0x75+2                                     ;858228|8577    |000077;
    STA.B ptrObjectData+2                                      ;85822A|857A    |00007A;
 
.continue:
    REP #$30                                                   ;85822C|C230    |      ;
    LDA.W #$0000                                               ;85822E|A90000  |      ;
    STA.W strcVariables.n16Unk86                               ;858231|8D8600  |000086;
    LDY.W #$0000                                               ;858234|A00000  |      ;
 
.loop:
    LDX.W strcVariables.n16Unk86                               ;858237|AE8600  |000086;
    LDA.W #$0000                                               ;85823A|A90000  |      ;
    STA.W strcGameObject.initailized,X                         ;85823D|9D9C01  |00019C;
    LDA.W #$0000                                               ;858240|A90000  |      ;
    STA.W strcGameObject.spriteTableIdx,X                      ;858243|9D9E01  |00019E;
    LDA.W #$0000                                               ;858246|A90000  |      ;
    STA.W strcGameObject.flip,X                                ;858249|9DA001  |0001A0;
    LDA.W #$0000                                               ;85824C|A90000  |      ;
    STA.W strcGameObject.unknown6,X                            ;85824F|9DA201  |0001A2;
    LDA.W #$0000                                               ;858252|A90000  |      ;
    STA.W strcGameObject.positionX,X                           ;858255|9DA401  |0001A4;
    LDA.W #$0000                                               ;858258|A90000  |      ;
    STA.W strcGameObject.positionY,X                           ;85825B|9DA601  |0001A6;
    LDA.W #$0000                                               ;85825E|A90000  |      ;
    STA.W strcGameObject.objectListPointer,X                   ;858261|9DA801  |0001A8;
    LDA.W #$0000                                               ;858264|A90000  |      ;
    STA.W strcGameObject.objectListPointer+2,X                 ;858267|9DAA01  |0001AA;
    LDA.W #$0000                                               ;85826A|A90000  |      ;
    STA.W strcGameObject.objectDataPointer,X                   ;85826D|9DAC01  |0001AC;
    LDA.W #$0000                                               ;858270|A90000  |      ;
    STA.W strcGameObject.objectDataPointer+2,X                 ;858273|9DAE01  |0001AE;
    SEP #$20                                                   ;858276|E220    |      ;
    LDA.B #$FF                                                 ;858278|A9FF    |      ;
    STA.W strcGameObject.components,X                          ;85827A|9DB001  |0001B0;
    STA.W strcGameObject.unknown1B1,X                          ;85827D|9DB101  |0001B1;
    STA.W strcGameObject.unknown1B2,X                          ;858280|9DB201  |0001B2;
    STA.W strcGameObject.unknown1B3,X                          ;858283|9DB301  |0001B3;
    STA.W strcGameObject.unknown1B4,X                          ;858286|9DB401  |0001B4;
    STA.W strcGameObject.unknown1B5,X                          ;858289|9DB501  |0001B5;
    STA.W strcGameObject.unknown1B6,X                          ;85828C|9DB601  |0001B6;
    STA.W strcGameObject.unknown1B7,X                          ;85828F|9DB701  |0001B7;
    STA.W strcGameObject.unknown1B8,X                          ;858292|9DB801  |0001B8;
    STA.W strcGameObject.unknown1B9,X                          ;858295|9DB901  |0001B9;
    STA.W strcGameObject.unknown1BA,X                          ;858298|9DBA01  |0001BA;
    STA.W strcGameObject.unknown1BB,X                          ;85829B|9DBB01  |0001BB;
    STA.W strcGameObject.unknown1BC,X                          ;85829E|9DBC01  |0001BC;
    STA.W strcGameObject.unknown1BD,X                          ;8582A1|9DBD01  |0001BD;
    STA.W strcGameObject.unknown1BE,X                          ;8582A4|9DBE01  |0001BE;
    STA.W strcGameObject.unknown1BF,X                          ;8582A7|9DBF01  |0001BF;
    REP #$20                                                   ;8582AA|C220    |      ;
    LDA.W strcVariables.n16Unk86                               ;8582AC|AD8600  |000086;
    CLC                                                        ;8582AF|18      |      ;
    ADC.W #$0024                                               ;8582B0|692400  |      ;
    STA.W strcVariables.n16Unk86                               ;8582B3|8D8600  |000086;
    INY                                                        ;8582B6|C8      |      ;
    CPY.W #$0028                                               ;8582B7|C02800  |      ;
    BEQ .exit                                                  ;8582BA|F003    |8582BF;
    JMP.W .loop                                                ;8582BC|4C3782  |858237;
 
 
.exit:
    REP #$20                                                   ;8582BF|C220    |      ;
    STZ.B strcPlayer.gameObjectSlotLimit                                     ;8582C1|64DC    |0000DC;
    JSR.W fObject_ClearOamBuffer_Init                                      ;8582C3|204786  |858647;
    RTL                                                        ;8582C6|6B      |      ;
 
 
;;
; @brief   Advances the animation of every active object by one tick.
; @details For each slot below strcPlayer.gameObjectSlotLimit with initailized != 0: timer byte (strcGameObject.objectDataPointer+2)
;          = 0 -> read the next animation step (a 0 frame pointer loops back to the list start), store frame pointer and timer,
;          parse the frame; skipped for this tick while tiles of the current frame are not resident yet.
;          Timer = $FE -> object is destroyed (tiles released). Afterwards the timer is decremented unless it is $FF (hold forever).
;          Format of lists, steps and timers: docs/formats/object-data.md section 5.
; @param   strcPlayer.gameObjectSlotLimit
; @modifies strcGameObject (all active slots), strcObject.gameObjectIdxOffs, strcObject.unkAB
; @clobbers A X Y
; @mode    M16X16
; @calls   fObject_CheckComponentsPending, fObject_ReleaseSpriteTiles, fObject_ParseObjectData
;;
fObject_UpdateAllAnimations:
    REP #$30                                                   ;8582C7|C230    |      ;
    STZ.B strcObject.gameObjectIdxOffs                         ;8582C9|64A9    |0000A9;
    STZ.B strcObject.unkAB                                     ;8582CB|64AB    |0000AB;
 
.loop1:
    LDX.B strcObject.gameObjectIdxOffs                         ;8582CD|A6A9    |0000A9; outer loop
    LDA.W strcGameObject.initailized,X                         ;8582CF|BD9C01  |00019C;
    BNE .object_active                                                ;8582D2|D013    |8582E7;
 
.loop2:
    LDA.B strcObject.gameObjectIdxOffs                         ;8582D4|A5A9    |0000A9; inner loop
    CLC                                                        ;8582D6|18      |      ;
    ADC.W #$0024                                               ;8582D7|692400  |      ;
    STA.B strcObject.gameObjectIdxOffs                         ;8582DA|85A9    |0000A9;
    INC.B strcObject.unkAB                                     ;8582DC|E6AB    |0000AB;
    LDA.B strcObject.unkAB                                     ;8582DE|A5AB    |0000AB;
    CMP.B strcPlayer.gameObjectSlotLimit                                     ;8582E0|C5DC    |0000DC;
    BNE .loop1                                                 ;8582E2|D0E9    |8582CD;
    JMP.W .return                                              ;8582E4|4C7683  |858376;
 
 
.object_active:
    REP #$30                                                   ;8582E7|C230    |      ;
    LDA.W strcGameObject.spriteTableIdx,X                      ;8582E9|BD9E01  |00019E;
    CMP.W #$0262                                               ;8582EC|C96202  |      ;
    BCS .high_object_bank                                                ;8582EF|B00A    |8582FB;
    SEP #$20                                                   ;8582F1|E220    |      ;
    LDA.B #$86                                                 ;8582F3|A986    |      ;
    STA.B ptrUnknown0x75+2                                     ;8582F5|8577    |000077;
    STA.B ptrObjectData+2                                      ;8582F7|857A    |00007A;
    BRA .bank_selected                                                ;8582F9|8008    |858303;
 
 
.high_object_bank:
    SEP #$20                                                   ;8582FB|E220    |      ;
    LDA.B #$87                                                 ;8582FD|A987    |      ;
    STA.B ptrUnknown0x75+2                                     ;8582FF|8577    |000077;
    STA.B ptrObjectData+2                                      ;858301|857A    |00007A;
 
.bank_selected:
    SEP #$20                                                   ;858303|E220    |      ;
    LDA.W strcGameObject.objectDataPointer+2,X                 ;858305|BDAE01  |0001AE;
    BNE .check_remove_marker                                                ;858308|D03F    |858349;
    REP #$20                                                   ;85830A|C220    |      ;
    JSR.W fObject_CheckComponentsPending                                      ;85830C|207B8B  |858B7B;
    LDA.B strcObject.bankAddress                               ;85830F|A5AF    |0000AF;
    BNE .loop2                                                 ;858311|D0C1    |8582D4;
    JSR.W fObject_ReleaseSpriteTiles                                      ;858313|20418B  |858B41;
    REP #$30                                                   ;858316|C230    |      ;
    LDX.B strcObject.gameObjectIdxOffs                         ;858318|A6A9    |0000A9;
    LDA.W strcGameObject.objectListPointer+2,X                 ;85831A|BDAA01  |0001AA;
    STA.B ptrUnknown0x75                                       ;85831D|8575    |000075;
 
.loop3:
    LDA.B [ptrUnknown0x75]                                     ;85831F|A775    |000075; sub inner loop
    BNE .load_next_frame                                                ;858321|D007    |85832A;
    LDA.W strcGameObject.objectListPointer,X                   ;858323|BDA801  |0001A8;
    STA.B ptrUnknown0x75                                       ;858326|8575    |000075;
    BRA .loop3                                                 ;858328|80F5    |85831F;
 
 
.load_next_frame:
    STA.W strcGameObject.objectDataPointer,X                   ;85832A|9DAC01  |0001AC;
    SEP #$20                                                   ;85832D|E220    |      ;
    LDY.W #$0002                                               ;85832F|A00200  |      ;
    LDA.B [ptrUnknown0x75],Y                                   ;858332|B775    |000075;
    STA.W strcGameObject.objectDataPointer+2,X                 ;858334|9DAE01  |0001AE;
    REP #$20                                                   ;858337|C220    |      ;
    LDA.B ptrUnknown0x75                                       ;858339|A575    |000075;
    CLC                                                        ;85833B|18      |      ;
    ADC.W #$0003                                               ;85833C|690300  |      ;
    STA.W strcGameObject.objectListPointer+2,X                 ;85833F|9DAA01  |0001AA;
    JSR.W fObject_ParseObjectData                              ;858342|20E58A  |858AE5;
    REP #$30                                                   ;858345|C230    |      ;
    BRA .tick_frame_timer                                                ;858347|8019    |858362;
 
 
.check_remove_marker:
    SEP #$20                                                   ;858349|E220    |      ;
    LDA.W strcGameObject.objectDataPointer+2,X                 ;85834B|BDAE01  |0001AE;
    CMP.B #$FE                                                 ;85834E|C9FE    |      ;
    BNE .tick_frame_timer                                                ;858350|D010    |858362;
    REP #$20                                                   ;858352|C220    |      ;
    JSR.W fObject_ReleaseSpriteTiles                                      ;858354|20418B  |858B41;
    REP #$30                                                   ;858357|C230    |      ;
    LDA.W #$0000                                               ;858359|A90000  |      ;
    STA.W strcGameObject.initailized,X                         ;85835C|9D9C01  |00019C;
    JMP.W .loop2                                               ;85835F|4CD482  |8582D4;
 
 
.tick_frame_timer:
    LDX.B strcObject.gameObjectIdxOffs                         ;858362|A6A9    |0000A9;
    SEP #$20                                                   ;858364|E220    |      ;
    LDA.W strcGameObject.objectDataPointer+2,X                 ;858366|BDAE01  |0001AE;
    CMP.B #$FF                                                 ;858369|C9FF    |      ;
    BEQ .next_object                                                ;85836B|F004    |858371;
    DEC A                                                      ;85836D|3A      |      ;
    STA.W strcGameObject.objectDataPointer+2,X                 ;85836E|9DAE01  |0001AE;
 
.next_object:
    REP #$30                                                   ;858371|C230    |      ;
    JMP.W .loop2                                               ;858373|4CD482  |8582D4;
 
 
.return:
    RTL                                                        ;858376|6B      |      ;
 
 
;;
; @brief   Builds the draw order list ($084C, one byte per slot) around the reference object strcObjectData.gameObjectIdx (the player).
; @details Not a full sort: objects with positionY >= the reference's Y are placed from the front of the list in slot order,
;          objects with a smaller Y from the back, and the reference object sits between them. The renderer emits OAM
;          entries in list order, earlier entries get lower OAM indices and therefore appear in front, so objects lower on the
;          screen (larger Y) are drawn over the reference and objects higher up behind it.
; @param   strcObjectData.gameObjectIdx   reference slot
; @return  $084C..$0873   slot numbers in draw order
; @modifies strcObject.gameObjectIdxOffs, strcObject.totalComponents, strcObject.bankAddress, strcVariables.n16Temp1
; @clobbers A X Y
; @mode    M16X16
; @note    strcObject fields are reused as plain scratch variables here (front index, back index).
;;
fObject_BuildDrawOrderByY:
    REP #$30                                                   ;858377|C230    |      ;
    LDA.W strcObjectData.gameObjectIdx                         ;858379|AD0509  |000905;
    ASL A                                                      ;85837C|0A      |      ;
    TAX                                                        ;85837D|AA      |      ;
    LDA.L aGameObjectIndexOffsets,X                            ;85837E|BFE08B85|858BE0;
    TAX                                                        ;858382|AA      |      ;
    LDA.W strcGameObject.positionY,X                           ;858383|BDA601  |0001A6;
    STA.B strcObject.gameObjectIdxOffs                         ;858386|85A9    |0000A9;
    LDA.W #$0000                                               ;858388|A90000  |      ;
    STA.B strcObject.totalComponents                           ;85838B|85AD    |0000AD;
    LDA.B strcPlayer.gameObjectSlotLimit                                     ;85838D|A5DC    |0000DC;
    DEC A                                                      ;85838F|3A      |      ;
    STA.B strcObject.bankAddress                               ;858390|85AF    |0000AF;
    LDA.W #$FFFF                                               ;858392|A9FFFF  |      ;
    STA.B strcVariables.n16Temp1                               ;858395|857E    |00007E;
    LDY.W #$0000                                               ;858397|A00000  |      ;
    LDX.W #$0000                                               ;85839A|A20000  |      ;
 
.loop:
    REP #$20                                                   ;85839D|C220    |      ;
    PHX                                                        ;85839F|DA      |      ;
    CPY.W strcObjectData.gameObjectIdx                         ;8583A0|CC0509  |000905;
    BEQ .next_object                                                ;8583A3|F023    |8583C8;
    LDA.W strcGameObject.positionY,X                           ;8583A5|BDA601  |0001A6;
    CMP.B strcObject.gameObjectIdxOffs                         ;8583A8|C5A9    |0000A9;
    BCC .place_above_current                                                ;8583AA|900E    |8583BA;
    LDX.B strcObject.totalComponents                           ;8583AC|A6AD    |0000AD;
    TYA                                                        ;8583AE|98      |      ;
    SEP #$20                                                   ;8583AF|E220    |      ;
    STA.W $084C,X                                              ;8583B1|9D4C08  |00084C;
    REP #$20                                                   ;8583B4|C220    |      ;
    INC.B strcObject.totalComponents                           ;8583B6|E6AD    |0000AD;
    BRA .next_object                                                ;8583B8|800E    |8583C8;
 
 
.place_above_current:
    REP #$20                                                   ;8583BA|C220    |      ;
    LDX.B strcObject.bankAddress                               ;8583BC|A6AF    |0000AF;
    TYA                                                        ;8583BE|98      |      ;
    SEP #$20                                                   ;8583BF|E220    |      ;
    STA.W $084C,X                                              ;8583C1|9D4C08  |00084C;
    REP #$20                                                   ;8583C4|C220    |      ;
    DEC.B strcObject.bankAddress                               ;8583C6|C6AF    |0000AF;
 
.next_object:
    REP #$20                                                   ;8583C8|C220    |      ;
    PLA                                                        ;8583CA|68      |      ;
    CLC                                                        ;8583CB|18      |      ;
    ADC.W #$0024                                               ;8583CC|692400  |      ;
    TAX                                                        ;8583CF|AA      |      ;
    INY                                                        ;8583D0|C8      |      ;
    CPY.B strcPlayer.gameObjectSlotLimit                                     ;8583D1|C4DC    |0000DC;
    BNE .loop                                                  ;8583D3|D0C8    |85839D;
    LDX.B strcObject.totalComponents                           ;8583D5|A6AD    |0000AD;
    LDA.W strcObjectData.gameObjectIdx                         ;8583D7|AD0509  |000905;
    SEP #$20                                                   ;8583DA|E220    |      ;
    STA.W $084C,X                                              ;8583DC|9D4C08  |00084C;
 
.return:
    RTS                                                        ;8583DF|60      |      ;
 
 
;;
; @brief   Builds the OAM shadow buffer from all active objects and starts its DMA.
; @details Clears the buffer, builds the draw order, then for each object (in list order) walks its components from the last
;          to the first: sign-extended x/y offsets (mirrored by the object flip), minus camera, culled when outside the screen
;          ($0100-$FFEF in X, $00F0-$FFEF in Y), written as OAM x, y, tile number (from the slot table of bank $86), attribute
;          (palette from the component attr, flips, priority $20, EOR object flip, preset id << 4) and the X bit 8 in the high
;          table. Components whose tile is not resident ($FF) are skipped. Details: docs/formats/sprite-assembly.md.
; @param   strcCamera.cameraX, strcCamera.cameraY, strcDialogDisplay.mapCurrentPresetId
; @modifies DMASpriteOBJQueue, DMASpriteOBJ2BitQueue, strcObject.bankAddress (running OAM byte offset)
; @clobbers A X Y
; @mode    M16X16
; @calls   fObject_ClearOamBuffer_Frame, fObject_BuildDrawOrderByY, fObject_FlipOffsetX, fObject_FlipOffsetY, fObject_SetupOamDma
;;
fObject_RenderAll:
    REP #$30                                                   ;8583E0|C230    |      ;
    REP #$20                                                   ;8583E2|C220    |      ;
    LDA.B strcObject.spriteTableIdx                            ;8583E4|A5A1    |0000A1;
    CMP.W #$0262                                               ;8583E6|C96202  |      ;
    BCS .high_object_bank                                                ;8583E9|B00A    |8583F5;
    SEP #$20                                                   ;8583EB|E220    |      ;
    LDA.B #$86                                                 ;8583ED|A986    |      ;
    STA.B ptrUnknown0x75+2                                     ;8583EF|8577    |000077;
    STA.B ptrObjectData+2                                      ;8583F1|857A    |00007A;
    BRA .bank_selected                                                ;8583F3|8008    |8583FD;
 
 
.high_object_bank:
    SEP #$20                                                   ;8583F5|E220    |      ;
    LDA.B #$87                                                 ;8583F7|A987    |      ;
    STA.B ptrUnknown0x75+2                                     ;8583F9|8577    |000077;
    STA.B ptrObjectData+2                                      ;8583FB|857A    |00007A;
 
.bank_selected:
    REP #$30                                                   ;8583FD|C230    |      ;
    JSR.W fObject_ClearOamBuffer_Frame                                      ;8583FF|209688  |858896;
    JSR.W fObject_BuildDrawOrderByY                                ;858402|207783  |858377;
    REP #$30                                                   ;858405|C230    |      ;
    SEP #$20                                                   ;858407|E220    |      ;
    LDA.B #$00                                                 ;858409|A900    |      ;
    XBA                                                        ;85840B|EB      |      ;
    LDA.W $084C                                                ;85840C|AD4C08  |00084C;
    REP #$20                                                   ;85840F|C220    |      ;
    ASL A                                                      ;858411|0A      |      ;
    TAX                                                        ;858412|AA      |      ;
    LDA.L aGameObjectIndexOffsets,X                            ;858413|BFE08B85|858BE0;
    STA.B strcObject.gameObjectIdxOffs                         ;858417|85A9    |0000A9;
    LDA.W #$0000                                               ;858419|A90000  |      ;
    STA.B strcObject.unkAB                                     ;85841C|85AB    |0000AB;
    STA.B strcObject.bankAddress                               ;85841E|85AF    |0000AF;
    LDY.B strcObject.unkAB                                     ;858420|A4AB    |0000AB;
 
.draw_object_loop:
    LDX.B strcObject.gameObjectIdxOffs                         ;858422|A6A9    |0000A9;
    LDA.W strcGameObject.initailized,X                         ;858424|BD9C01  |00019C;
    BNE .exit                                                  ;858427|D01B    |858444;
 
.next_in_draw_order:
    INY                                                        ;858429|C8      |      ;
    TYX                                                        ;85842A|BB      |      ;
    SEP #$20                                                   ;85842B|E220    |      ;
    LDA.B #$00                                                 ;85842D|A900    |      ;
    XBA                                                        ;85842F|EB      |      ;
    LDA.W $084C,X                                              ;858430|BD4C08  |00084C;
    REP #$20                                                   ;858433|C220    |      ;
    ASL A                                                      ;858435|0A      |      ;
    TAX                                                        ;858436|AA      |      ;
    LDA.L aGameObjectIndexOffsets,X                            ;858437|BFE08B85|858BE0;
    STA.B strcObject.gameObjectIdxOffs                         ;85843B|85A9    |0000A9;
    CPY.B strcPlayer.gameObjectSlotLimit                                     ;85843D|C4DC    |0000DC;
    BNE .draw_object_loop                                                ;85843F|D0E1    |858422;
    JMP.W fObject_SetupOamDma                                      ;858441|4CF485  |8585F4;
 
 
.exit:
    STY.B strcObject.unkAB                                     ;858444|84AB    |0000AB;
    LDX.B strcObject.gameObjectIdxOffs                         ;858446|A6A9    |0000A9;
    LDA.W strcGameObject.spriteTableIdx,X                      ;858448|BD9E01  |00019E;
    CMP.W #$0262                                               ;85844B|C96202  |      ;
    BCS .object_high_bank                                                ;85844E|B00A    |85845A;
    SEP #$20                                                   ;858450|E220    |      ;
    LDA.B #$86                                                 ;858452|A986    |      ;
    STA.B ptrUnknown0x75+2                                     ;858454|8577    |000077;
    STA.B ptrObjectData+2                                      ;858456|857A    |00007A;
    BRA .object_bank_selected                                                ;858458|8008    |858462;
 
 
.object_high_bank:
    SEP #$20                                                   ;85845A|E220    |      ;
    LDA.B #$87                                                 ;85845C|A987    |      ;
    STA.B ptrUnknown0x75+2                                     ;85845E|8577    |000077;
    STA.B ptrObjectData+2                                      ;858460|857A    |00007A;
 
.object_bank_selected:
    REP #$20                                                   ;858462|C220    |      ;
    LDA.W strcGameObject.objectDataPointer,X                   ;858464|BDAC01  |0001AC;
    STA.B ptrObjectData                                        ;858467|8578    |000078;
    LDA.W strcGameObject.flip,X                                ;858469|BDA001  |0001A0;
    STA.B strcObject.flip                                      ;85846C|859F    |00009F;
    LDA.W strcGameObject.positionX,X                           ;85846E|BDA401  |0001A4;
    STA.B strcObject.posX                                      ;858471|859B    |00009B;
    LDA.W strcGameObject.positionY,X                           ;858473|BDA601  |0001A6;
    STA.B strcObject.posY                                      ;858476|859D    |00009D;
    SEP #$20                                                   ;858478|E220    |      ;
    LDA.W strcGameObject.totalComponents,X                     ;85847A|BDAF01  |0001AF;
    STA.B strcObject.totalComponents                           ;85847D|85AD    |0000AD;
    STZ.B strcObject.totalComponents+1                         ;85847F|64AE    |0000AE;
    REP #$20                                                   ;858481|C220    |      ;
    INC.B ptrObjectData                                        ;858483|E678    |000078;
    LDA.B strcObject.totalComponents                           ;858485|A5AD    |0000AD;
    DEC A                                                      ;858487|3A      |      ;
    STA.B strcVariables.n16Temp1                               ;858488|857E    |00007E; i = i - 1
    ASL A                                                      ;85848A|0A      |      ; i = i * 2
    STA.B strcVariables.n16Temp2                               ;85848B|8580    |000080; j = i * 2
    CLC                                                        ;85848D|18      |      ;
    ADC.B strcVariables.n16Temp1                               ;85848E|657E    |00007E; i = i * 3
    ADC.B strcVariables.n16Temp2                               ;858490|6580    |000080; i = i * 5
    ADC.B ptrObjectData                                        ;858492|6578    |000078;
    STA.B ptrObjectData                                        ;858494|8578    |000078;
    LDA.B strcObject.gameObjectIdxOffs                         ;858496|A5A9    |0000A9;
    STA.B ptrUnknown0x75                                       ;858498|8575    |000075;
    CLC                                                        ;85849A|18      |      ;
    ADC.B strcObject.totalComponents                           ;85849B|65AD    |0000AD;
    SEC                                                        ;85849D|38      |      ;
    SBC.W #$0001                                               ;85849E|E90100  |      ;
    STA.B ptrUnknown0x75                                       ;8584A1|8575    |000075;
 
.component_loop:
    LDY.B strcObject.unkAB                                     ;8584A3|A4AB    |0000AB;
    LDA.B strcObject.totalComponents                           ;8584A5|A5AD    |0000AD;
    BNE .component_present                                                ;8584A7|D003    |8584AC;
    JMP.W .next_in_draw_order                                              ;8584A9|4C2984  |858429;
 
 
.component_present:
    LDX.B ptrUnknown0x75                                       ;8584AC|A675    |000075;
    SEP #$20                                                   ;8584AE|E220    |      ;
    LDA.W strcGameObject.components,X                          ;8584B0|BDB001  |0001B0;
    CMP.B #$FF                                                 ;8584B3|C9FF    |      ;
    BNE .component_has_tile                                                ;8584B5|D003    |8584BA;
    JMP.W .skip_empty_component                                             ;8584B7|4CE385  |8585E3;
 
 
.component_has_tile:
    REP #$20                                                   ;8584BA|C220    |      ;
    LDY.W #$0002                                               ;8584BC|A00200  |      ;
    SEP #$20                                                   ;8584BF|E220    |      ;
    LDA.B [ptrObjectData],Y                                    ;8584C1|B778    |000078;
    SEP #$20                                                   ;8584C3|E220    |      ;
    CMP.B #$00                                                 ;8584C5|C900    |      ;
    BMI .sign_x_negative                                               ;8584C7|3005    |8584CE;
    XBA                                                        ;8584C9|EB      |      ;
    LDA.B #$00                                                 ;8584CA|A900    |      ;
    BRA .sign_x_done                                               ;8584CC|8003    |8584D1;
 
 
.sign_x_negative:
    XBA                                                        ;8584CE|EB      |      ;
    LDA.B #$FF                                                 ;8584CF|A9FF    |      ;
 
.sign_x_done:
    XBA                                                        ;8584D1|EB      |      ;
    REP #$20                                                   ;8584D2|C220    |      ;
    JSR.W fObject_FlipOffsetX                                      ;8584D4|20B08B  |858BB0;
    CLC                                                        ;8584D7|18      |      ;
    ADC.B strcObject.posX                                      ;8584D8|659B    |00009B;
    SEC                                                        ;8584DA|38      |      ;
    SBC.B strcCamera.cameraX                                   ;8584DB|E5F5    |0000F5;
    STA.B $BF                                                  ;8584DD|85BF    |0000BF;
    INY                                                        ;8584DF|C8      |      ;
    SEP #$20                                                   ;8584E0|E220    |      ;
    LDA.B [ptrObjectData],Y                                    ;8584E2|B778    |000078;
    SEP #$20                                                   ;8584E4|E220    |      ;
    CMP.B #$00                                                 ;8584E6|C900    |      ;
    BMI .sign_y_negative                                               ;8584E8|3005    |8584EF;
    XBA                                                        ;8584EA|EB      |      ;
    LDA.B #$00                                                 ;8584EB|A900    |      ;
    BRA .sign_y_done                                               ;8584ED|8003    |8584F2;
 
 
.sign_y_negative:
    XBA                                                        ;8584EF|EB      |      ;
    LDA.B #$FF                                                 ;8584F0|A9FF    |      ;
 
.sign_y_done:
    XBA                                                        ;8584F2|EB      |      ;
    REP #$20                                                   ;8584F3|C220    |      ;
    JSR.W fObject_FlipOffsetY                                      ;8584F5|20BC8B  |858BBC;
    CLC                                                        ;8584F8|18      |      ;
    ADC.B strcObject.posY                                      ;8584F9|659D    |00009D;
    SEC                                                        ;8584FB|38      |      ;
    SBC.B strcCamera.cameraY                                   ;8584FC|E5F7    |0000F7;
    STA.B $C1                                                  ;8584FE|85C1    |0000C1;
    STY.B $C5                                                  ;858500|84C5    |0000C5;
    REP #$30                                                   ;858502|C230    |      ;
    LDA.B strcObject.bankAddress                               ;858504|A5AF    |0000AF;
    AND.W #$FFE0                                               ;858506|29E0FF  |      ;
    STA.B strcVariables.n16Temp1                               ;858509|857E    |00007E;
    LSR A                                                      ;85850B|4A      |      ;
    LSR A                                                      ;85850C|4A      |      ;
    LSR A                                                      ;85850D|4A      |      ;
    LSR A                                                      ;85850E|4A      |      ;
    STA.B strcVariables.n16Temp2                               ;85850F|8580    |000080;
    LDA.B strcObject.bankAddress                               ;858511|A5AF    |0000AF;
    SEC                                                        ;858513|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;858514|E57E    |00007E;
    STA.B strcVariables.n16Temp1                               ;858516|857E    |00007E;
    LDA.B strcVariables.n16Temp2                               ;858518|A580    |000080;
    TAX                                                        ;85851A|AA      |      ;
    LDA.L DMASpriteOBJ2BitQueue,X                              ;85851B|BF00A27E|7EA200;
    STA.B $C3                                                  ;85851F|85C3    |0000C3;
    LDA.B $BF                                                  ;858521|A5BF    |0000BF;
    CMP.W #$0100                                               ;858523|C90001  |      ;
    BCC .check_x_visible                                               ;858526|900F    |858537;
    LDA.B strcVariables.n16Temp1                               ;858528|A57E    |00007E;
    AND.W #$FFFC                                               ;85852A|29FCFF  |      ;
    LSR A                                                      ;85852D|4A      |      ;
    TAX                                                        ;85852E|AA      |      ;
    LDA.L aOamHighBitPairMask,X                                       ;85852F|BFD08B85|858BD0;
    ORA.B $C3                                                  ;858533|05C3    |0000C3;
    STA.B $C3                                                  ;858535|85C3    |0000C3;
 
.check_x_visible:
    REP #$20                                                   ;858537|C220    |      ;
    LDA.B $BF                                                  ;858539|A5BF    |0000BF;
    CMP.W #$0100                                               ;85853B|C90001  |      ;
    BCC .check_y_visible                                               ;85853E|9008    |858548;
    CMP.W #$FFF0                                               ;858540|C9F0FF  |      ;
    BCS .check_y_visible                                               ;858543|B003    |858548;
    JMP.W .skip_component                                             ;858545|4CD985  |8585D9;
 
 
.check_y_visible:
    REP #$20                                                   ;858548|C220    |      ;
    LDA.B $C1                                                  ;85854A|A5C1    |0000C1;
    CMP.W #$00F0                                               ;85854C|C9F000  |      ;
    BCC .write_oam_entry                                               ;85854F|9008    |858559;
    CMP.W #$FFF0                                               ;858551|C9F0FF  |      ;
    BCS .write_oam_entry                                               ;858554|B003    |858559;
    JMP.W .skip_component                                             ;858556|4CD985  |8585D9;
 
 
.write_oam_entry:
    REP #$30                                                   ;858559|C230    |      ;
    LDX.B strcObject.bankAddress                               ;85855B|A6AF    |0000AF;
    LDA.B $BF                                                  ;85855D|A5BF    |0000BF;
    SEP #$20                                                   ;85855F|E220    |      ;
    STA.L DMASpriteOBJQueue,X                                  ;858561|9F00A07E|7EA000;
    REP #$20                                                   ;858565|C220    |      ;
    LDA.B $C1                                                  ;858567|A5C1    |0000C1;
    SEP #$20                                                   ;858569|E220    |      ;
    STA.L $7EA001,X                                            ;85856B|9F01A07E|7EA001;
    REP #$20                                                   ;85856F|C220    |      ;
    LDX.B strcVariables.n16Temp2                               ;858571|A680    |000080;
    LDA.B $C3                                                  ;858573|A5C3    |0000C3;
    STA.L DMASpriteOBJ2BitQueue,X                              ;858575|9F00A27E|7EA200;
    REP #$30                                                   ;858579|C230    |      ;
    LDX.B strcObject.bankAddress                               ;85857B|A6AF    |0000AF;
    LDY.B $C5                                                  ;85857D|A4C5    |0000C5;
    INY                                                        ;85857F|C8      |      ;
    SEP #$20                                                   ;858580|E220    |      ;
    LDA.B [ptrObjectData],Y                                    ;858582|B778    |000078;
    STA.B strcObject.unkB2                                     ;858584|85B2    |0000B2;
    ASL A                                                      ;858586|0A      |      ;
    AND.B #$0E                                                 ;858587|290E    |      ;
    STA.B strcObject.unkB1                                     ;858589|85B1    |0000B1;
    LDA.B strcObject.unkB2                                     ;85858B|A5B2    |0000B2;
    ASL A                                                      ;85858D|0A      |      ;
    ASL A                                                      ;85858E|0A      |      ;
    AND.B #$C0                                                 ;85858F|29C0    |      ;
    LSR A                                                      ;858591|4A      |      ;
    STA.B strcObject.unkB2                                     ;858592|85B2    |0000B2;
    ASL A                                                      ;858594|0A      |      ;
    ASL A                                                      ;858595|0A      |      ;
    ORA.B strcObject.unkB2                                     ;858596|05B2    |0000B2;
    AND.B #$C0                                                 ;858598|29C0    |      ;
    ORA.B strcObject.unkB1                                     ;85859A|05B1    |0000B1;
    ORA.B #$20                                                 ;85859C|0920    |      ;
    EOR.B strcObject.flip                                      ;85859E|459F    |00009F;
    STA.L $7EA003,X                                            ;8585A0|9F03A07E|7EA003;
    LDA.W strcDialogDisplay.mapCurrentPresetId                 ;8585A4|AD9501  |000195;
    ASL A                                                      ;8585A7|0A      |      ;
    ASL A                                                      ;8585A8|0A      |      ;
    ASL A                                                      ;8585A9|0A      |      ;
    ASL A                                                      ;8585AA|0A      |      ;
    ORA.L $7EA003,X                                            ;8585AB|1F03A07E|7EA003;
    STA.L $7EA003,X                                            ;8585AF|9F03A07E|7EA003;
    REP #$20                                                   ;8585B3|C220    |      ;
    LDA.W #$0000                                               ;8585B5|A90000  |      ;
    LDX.B ptrUnknown0x75                                       ;8585B8|A675    |000075;
    SEP #$20                                                   ;8585BA|E220    |      ;
    LDA.W strcGameObject.components,X                          ;8585BC|BDB001  |0001B0;
    REP #$20                                                   ;8585BF|C220    |      ;
    ASL A                                                      ;8585C1|0A      |      ;
    TAX                                                        ;8585C2|AA      |      ;
    LDA.L aObjSlotOamTile_868000,X                          ;8585C3|BF008086|868000;
    SEP #$20                                                   ;8585C7|E220    |      ;
    LDX.B strcObject.bankAddress                               ;8585C9|A6AF    |0000AF;
    STA.L $7EA002,X                                            ;8585CB|9F02A07E|7EA002;
    REP #$20                                                   ;8585CF|C220    |      ;
    LDA.B strcObject.bankAddress                               ;8585D1|A5AF    |0000AF;
    CLC                                                        ;8585D3|18      |      ;
    ADC.W #$0004                                               ;8585D4|690400  |      ;
    STA.B strcObject.bankAddress                               ;8585D7|85AF    |0000AF;
 
.skip_component:
    LDA.B ptrObjectData                                        ;8585D9|A578    |000078;
    SEC                                                        ;8585DB|38      |      ;
    SBC.W #$0005                                               ;8585DC|E90500  |      ;
    STA.B ptrObjectData                                        ;8585DF|8578    |000078;
    BRA .next_component                                               ;8585E1|800A    |8585ED;
 
 
.skip_empty_component:
    REP #$20                                                   ;8585E3|C220    |      ;
    LDA.B ptrObjectData                                        ;8585E5|A578    |000078;
    SEC                                                        ;8585E7|38      |      ;
    SBC.W #$0005                                               ;8585E8|E90500  |      ;
    STA.B ptrObjectData                                        ;8585EB|8578    |000078;
 
.next_component:
    DEC.B ptrUnknown0x75                                       ;8585ED|C675    |000075;
    DEC.B strcObject.totalComponents                           ;8585EF|C6AD    |0000AD;
    JMP.W .component_loop                                              ;8585F1|4CA384  |8584A3;
 
 
;;
; @brief   Programs DMA channel 4 to copy the $0220-byte OAM shadow ($7EA000) to OAM and requests it from the NMI handler.
; @details Stores the number of OAM bytes used (strcObject.bankAddress) at $084A and sets bit $10 in $9A (NMI DMA request mask).
; @modifies SNES_OAMADDL, SNES_DMAP4, SNES_BBAD4, SNES_A1T4L, SNES_A1T4H, SNES_A1B4, SNES_DAS4L
; @clobbers A X
; @mode    M16X16 -> M8X16
;;
fObject_SetupOamDma:
    REP #$30                                                   ;8585F4|C230    |      ;
    LDA.B strcObject.bankAddress                               ;8585F6|A5AF    |0000AF;
    STA.W $084A                                                ;8585F8|8D4A08  |00084A;
    SEP #$20                                                   ;8585FB|E220    |      ;
    LDX.W #$0000                                               ;8585FD|A20000  |      ;
    STX.W SNES_OAMADDL                                         ;858600|8E0221  |002102;
    STZ.W SNES_DMAP4                                           ;858603|9C4043  |004340;
    LDA.B #$04                                                 ;858606|A904    |      ;
    STA.W SNES_BBAD4                                           ;858608|8D4143  |004341;
    LDA.B #$00                                                 ;85860B|A900    |      ;
    STA.W SNES_A1T4L                                           ;85860D|8D4243  |004342;
    LDA.B #$A0                                                 ;858610|A9A0    |      ;
    STA.W SNES_A1T4H                                           ;858612|8D4343  |004343;
    LDA.B #$7E                                                 ;858615|A97E    |      ;
    STA.W SNES_A1B4                                            ;858617|8D4443  |004344;
    LDX.W #$0220                                               ;85861A|A22002  |      ;
    STX.W SNES_DAS4L                                           ;85861D|8E4543  |004345;
    LDA.B $9A                                                  ;858620|A59A    |00009A;
    ORA.B #$10                                                 ;858622|0910    |      ;
    STA.B $9A                                                  ;858624|859A    |00009A;
    RTL                                                        ;858626|6B      |      ;
 
 
;;
; @brief   Unused: bit 0 of each 2-bit OAM high-table pair (X bit 8 of sprite n of 8 in a word).
; @format  8 words $0001,$0004,$0010,...,$4000.
; @note    The real table used by the renderer, aOamHighBitPairMask, is generated with the offsets table and has the same values.
;;
aOamBitPairSetMaskUnused:
    dw $0001,$0004,$0010,$0040,$0100,$0400                     ;858627|        |      ;
    dw $1000,$4000                                             ;858633|        |      ;
 
;;
; @brief   Unused: inverse masks ($FFFC,$FFF3,...) to clear a 2-bit pair of the OAM high table.
; @format  8 words.
;;
aOamBitPairClearMaskUnused:
    dw $FFFC,$FFF3,$FFCF,$FF3F,$FCFF,$F3FF                     ;858637|        |      ;
    dw $CFFF,$3FFF                                             ;858643|        |      ;
 
;;
; @brief   Hides all 128 sprites: writes $F0F0 (x = y = $F0) to every OAM entry and to the high table, sets $00B7 = 1.
; @details Code identical to fObject_ClearOamBuffer_Frame (one is called from fObject_ClearGameObject, the other every frame).
; @modifies DMASpriteOBJQueue, DMASpriteOBJ2BitQueue
; @clobbers A
; @mode    M16X16
;;
fObject_ClearOamBuffer_Init:
    REP #$30                                                   ;858647|C230    |      ;
    LDA.W #$F0F0                                               ;858649|A9F0F0  |      ;
    STA.L DMASpriteOBJQueue                                    ;85864C|8F00A07E|7EA000;
    STA.L $7EA004                                              ;858650|8F04A07E|7EA004;
    STA.L $7EA008                                              ;858654|8F08A07E|7EA008;
    STA.L $7EA00C                                              ;858658|8F0CA07E|7EA00C;
    STA.L $7EA010                                              ;85865C|8F10A07E|7EA010;
    STA.L $7EA014                                              ;858660|8F14A07E|7EA014;
    STA.L $7EA018                                              ;858664|8F18A07E|7EA018;
    STA.L $7EA01C                                              ;858668|8F1CA07E|7EA01C;
    STA.L $7EA020                                              ;85866C|8F20A07E|7EA020;
    STA.L $7EA024                                              ;858670|8F24A07E|7EA024;
    STA.L $7EA028                                              ;858674|8F28A07E|7EA028;
    STA.L $7EA02C                                              ;858678|8F2CA07E|7EA02C;
    STA.L $7EA030                                              ;85867C|8F30A07E|7EA030;
    STA.L $7EA034                                              ;858680|8F34A07E|7EA034;
    STA.L $7EA038                                              ;858684|8F38A07E|7EA038;
    STA.L $7EA03C                                              ;858688|8F3CA07E|7EA03C;
    STA.L $7EA040                                              ;85868C|8F40A07E|7EA040;
    STA.L $7EA044                                              ;858690|8F44A07E|7EA044;
    STA.L $7EA048                                              ;858694|8F48A07E|7EA048;
    STA.L $7EA04C                                              ;858698|8F4CA07E|7EA04C;
    STA.L $7EA050                                              ;85869C|8F50A07E|7EA050;
    STA.L $7EA054                                              ;8586A0|8F54A07E|7EA054;
    STA.L $7EA058                                              ;8586A4|8F58A07E|7EA058;
    STA.L $7EA05C                                              ;8586A8|8F5CA07E|7EA05C;
    STA.L $7EA060                                              ;8586AC|8F60A07E|7EA060;
    STA.L $7EA064                                              ;8586B0|8F64A07E|7EA064;
    STA.L $7EA068                                              ;8586B4|8F68A07E|7EA068;
    STA.L $7EA06C                                              ;8586B8|8F6CA07E|7EA06C;
    STA.L $7EA070                                              ;8586BC|8F70A07E|7EA070;
    STA.L $7EA074                                              ;8586C0|8F74A07E|7EA074;
    STA.L $7EA078                                              ;8586C4|8F78A07E|7EA078;
    STA.L $7EA07C                                              ;8586C8|8F7CA07E|7EA07C;
    STA.L $7EA080                                              ;8586CC|8F80A07E|7EA080;
    STA.L $7EA084                                              ;8586D0|8F84A07E|7EA084;
    STA.L $7EA088                                              ;8586D4|8F88A07E|7EA088;
    STA.L $7EA08C                                              ;8586D8|8F8CA07E|7EA08C;
    STA.L $7EA090                                              ;8586DC|8F90A07E|7EA090;
    STA.L $7EA094                                              ;8586E0|8F94A07E|7EA094;
    STA.L $7EA098                                              ;8586E4|8F98A07E|7EA098;
    STA.L $7EA09C                                              ;8586E8|8F9CA07E|7EA09C;
    STA.L $7EA0A0                                              ;8586EC|8FA0A07E|7EA0A0;
    STA.L $7EA0A4                                              ;8586F0|8FA4A07E|7EA0A4;
    STA.L $7EA0A8                                              ;8586F4|8FA8A07E|7EA0A8;
    STA.L $7EA0AC                                              ;8586F8|8FACA07E|7EA0AC;
    STA.L $7EA0B0                                              ;8586FC|8FB0A07E|7EA0B0;
    STA.L $7EA0B4                                              ;858700|8FB4A07E|7EA0B4;
    STA.L $7EA0B8                                              ;858704|8FB8A07E|7EA0B8;
    STA.L $7EA0BC                                              ;858708|8FBCA07E|7EA0BC;
    STA.L $7EA0C0                                              ;85870C|8FC0A07E|7EA0C0;
    STA.L $7EA0C4                                              ;858710|8FC4A07E|7EA0C4;
    STA.L $7EA0C8                                              ;858714|8FC8A07E|7EA0C8;
    STA.L $7EA0CC                                              ;858718|8FCCA07E|7EA0CC;
    STA.L $7EA0D0                                              ;85871C|8FD0A07E|7EA0D0;
    STA.L $7EA0D4                                              ;858720|8FD4A07E|7EA0D4;
    STA.L $7EA0D8                                              ;858724|8FD8A07E|7EA0D8;
    STA.L $7EA0DC                                              ;858728|8FDCA07E|7EA0DC;
    STA.L $7EA0E0                                              ;85872C|8FE0A07E|7EA0E0;
    STA.L $7EA0E4                                              ;858730|8FE4A07E|7EA0E4;
    STA.L $7EA0E8                                              ;858734|8FE8A07E|7EA0E8;
    STA.L $7EA0EC                                              ;858738|8FECA07E|7EA0EC;
    STA.L $7EA0F0                                              ;85873C|8FF0A07E|7EA0F0;
    STA.L $7EA0F4                                              ;858740|8FF4A07E|7EA0F4;
    STA.L $7EA0F8                                              ;858744|8FF8A07E|7EA0F8;
    STA.L $7EA0FC                                              ;858748|8FFCA07E|7EA0FC;
    STA.L $7EA100                                              ;85874C|8F00A17E|7EA100;
    STA.L $7EA104                                              ;858750|8F04A17E|7EA104;
    STA.L $7EA108                                              ;858754|8F08A17E|7EA108;
    STA.L $7EA10C                                              ;858758|8F0CA17E|7EA10C;
    STA.L $7EA110                                              ;85875C|8F10A17E|7EA110;
    STA.L $7EA114                                              ;858760|8F14A17E|7EA114;
    STA.L $7EA118                                              ;858764|8F18A17E|7EA118;
    STA.L $7EA11C                                              ;858768|8F1CA17E|7EA11C;
    STA.L $7EA120                                              ;85876C|8F20A17E|7EA120;
    STA.L $7EA124                                              ;858770|8F24A17E|7EA124;
    STA.L $7EA128                                              ;858774|8F28A17E|7EA128;
    STA.L $7EA12C                                              ;858778|8F2CA17E|7EA12C;
    STA.L $7EA130                                              ;85877C|8F30A17E|7EA130;
    STA.L $7EA134                                              ;858780|8F34A17E|7EA134;
    STA.L $7EA138                                              ;858784|8F38A17E|7EA138;
    STA.L $7EA13C                                              ;858788|8F3CA17E|7EA13C;
    STA.L $7EA140                                              ;85878C|8F40A17E|7EA140;
    STA.L $7EA144                                              ;858790|8F44A17E|7EA144;
    STA.L $7EA148                                              ;858794|8F48A17E|7EA148;
    STA.L $7EA14C                                              ;858798|8F4CA17E|7EA14C;
    STA.L $7EA150                                              ;85879C|8F50A17E|7EA150;
    STA.L $7EA154                                              ;8587A0|8F54A17E|7EA154;
    STA.L $7EA158                                              ;8587A4|8F58A17E|7EA158;
    STA.L $7EA15C                                              ;8587A8|8F5CA17E|7EA15C;
    STA.L $7EA160                                              ;8587AC|8F60A17E|7EA160;
    STA.L $7EA164                                              ;8587B0|8F64A17E|7EA164;
    STA.L $7EA168                                              ;8587B4|8F68A17E|7EA168;
    STA.L $7EA16C                                              ;8587B8|8F6CA17E|7EA16C;
    STA.L $7EA170                                              ;8587BC|8F70A17E|7EA170;
    STA.L $7EA174                                              ;8587C0|8F74A17E|7EA174;
    STA.L $7EA178                                              ;8587C4|8F78A17E|7EA178;
    STA.L $7EA17C                                              ;8587C8|8F7CA17E|7EA17C;
    STA.L $7EA180                                              ;8587CC|8F80A17E|7EA180;
    STA.L $7EA184                                              ;8587D0|8F84A17E|7EA184;
    STA.L $7EA188                                              ;8587D4|8F88A17E|7EA188;
    STA.L $7EA18C                                              ;8587D8|8F8CA17E|7EA18C;
    STA.L $7EA190                                              ;8587DC|8F90A17E|7EA190;
    STA.L $7EA194                                              ;8587E0|8F94A17E|7EA194;
    STA.L $7EA198                                              ;8587E4|8F98A17E|7EA198;
    STA.L $7EA19C                                              ;8587E8|8F9CA17E|7EA19C;
    STA.L $7EA1A0                                              ;8587EC|8FA0A17E|7EA1A0;
    STA.L $7EA1A4                                              ;8587F0|8FA4A17E|7EA1A4;
    STA.L $7EA1A8                                              ;8587F4|8FA8A17E|7EA1A8;
    STA.L $7EA1AC                                              ;8587F8|8FACA17E|7EA1AC;
    STA.L $7EA1B0                                              ;8587FC|8FB0A17E|7EA1B0;
    STA.L $7EA1B4                                              ;858800|8FB4A17E|7EA1B4;
    STA.L $7EA1B8                                              ;858804|8FB8A17E|7EA1B8;
    STA.L $7EA1BC                                              ;858808|8FBCA17E|7EA1BC;
    STA.L $7EA1C0                                              ;85880C|8FC0A17E|7EA1C0;
    STA.L $7EA1C4                                              ;858810|8FC4A17E|7EA1C4;
    STA.L $7EA1C8                                              ;858814|8FC8A17E|7EA1C8;
    STA.L $7EA1CC                                              ;858818|8FCCA17E|7EA1CC;
    STA.L $7EA1D0                                              ;85881C|8FD0A17E|7EA1D0;
    STA.L $7EA1D4                                              ;858820|8FD4A17E|7EA1D4;
    STA.L $7EA1D8                                              ;858824|8FD8A17E|7EA1D8;
    STA.L $7EA1DC                                              ;858828|8FDCA17E|7EA1DC;
    STA.L $7EA1E0                                              ;85882C|8FE0A17E|7EA1E0;
    STA.L $7EA1E4                                              ;858830|8FE4A17E|7EA1E4;
    STA.L $7EA1E8                                              ;858834|8FE8A17E|7EA1E8;
    STA.L $7EA1EC                                              ;858838|8FECA17E|7EA1EC;
    STA.L $7EA1F0                                              ;85883C|8FF0A17E|7EA1F0;
    STA.L $7EA1F4                                              ;858840|8FF4A17E|7EA1F4;
    STA.L $7EA1F8                                              ;858844|8FF8A17E|7EA1F8;
    STA.L $7EA1FC                                              ;858848|8FFCA17E|7EA1FC;
    LDA.W #$0000                                               ;85884C|A90000  |      ;
    STA.L DMASpriteOBJ2BitQueue                                ;85884F|8F00A27E|7EA200;
    STA.L $7EA202                                              ;858853|8F02A27E|7EA202;
    STA.L $7EA204                                              ;858857|8F04A27E|7EA204;
    STA.L $7EA206                                              ;85885B|8F06A27E|7EA206;
    STA.L $7EA208                                              ;85885F|8F08A27E|7EA208;
    STA.L $7EA20A                                              ;858863|8F0AA27E|7EA20A;
    STA.L $7EA20C                                              ;858867|8F0CA27E|7EA20C;
    STA.L $7EA20E                                              ;85886B|8F0EA27E|7EA20E;
    STA.L $7EA210                                              ;85886F|8F10A27E|7EA210;
    STA.L $7EA212                                              ;858873|8F12A27E|7EA212;
    STA.L $7EA214                                              ;858877|8F14A27E|7EA214;
    STA.L $7EA216                                              ;85887B|8F16A27E|7EA216;
    STA.L $7EA218                                              ;85887F|8F18A27E|7EA218;
    STA.L $7EA21A                                              ;858883|8F1AA27E|7EA21A;
    STA.L $7EA21C                                              ;858887|8F1CA27E|7EA21C;
    STA.L $7EA21E                                              ;85888B|8F1EA27E|7EA21E;
    LDA.W #$0001                                               ;85888F|A90100  |      ;
    STA.W $00B7                                                ;858892|8DB700  |0000B7;
    RTS                                                        ;858895|60      |      ;
 
 
;;
; @brief   Per-frame OAM clear: hides all 128 sprites ($F0F0 into every x/y word and the high table), sets $00B7 = 1.
; @modifies DMASpriteOBJQueue, DMASpriteOBJ2BitQueue
; @clobbers A
; @mode    M16X16
; @note    confidence: low on the purpose of $00B7 (written, no reader found in src).
;;
fObject_ClearOamBuffer_Frame:
    REP #$30                                                   ;858896|C230    |      ;
    LDA.W #$F0F0                                               ;858898|A9F0F0  |      ;
    STA.L DMASpriteOBJQueue                                    ;85889B|8F00A07E|7EA000;
    STA.L $7EA004                                              ;85889F|8F04A07E|7EA004;
    STA.L $7EA008                                              ;8588A3|8F08A07E|7EA008;
    STA.L $7EA00C                                              ;8588A7|8F0CA07E|7EA00C;
    STA.L $7EA010                                              ;8588AB|8F10A07E|7EA010;
    STA.L $7EA014                                              ;8588AF|8F14A07E|7EA014;
    STA.L $7EA018                                              ;8588B3|8F18A07E|7EA018;
    STA.L $7EA01C                                              ;8588B7|8F1CA07E|7EA01C;
    STA.L $7EA020                                              ;8588BB|8F20A07E|7EA020;
    STA.L $7EA024                                              ;8588BF|8F24A07E|7EA024;
    STA.L $7EA028                                              ;8588C3|8F28A07E|7EA028;
    STA.L $7EA02C                                              ;8588C7|8F2CA07E|7EA02C;
    STA.L $7EA030                                              ;8588CB|8F30A07E|7EA030;
    STA.L $7EA034                                              ;8588CF|8F34A07E|7EA034;
    STA.L $7EA038                                              ;8588D3|8F38A07E|7EA038;
    STA.L $7EA03C                                              ;8588D7|8F3CA07E|7EA03C;
    STA.L $7EA040                                              ;8588DB|8F40A07E|7EA040;
    STA.L $7EA044                                              ;8588DF|8F44A07E|7EA044;
    STA.L $7EA048                                              ;8588E3|8F48A07E|7EA048;
    STA.L $7EA04C                                              ;8588E7|8F4CA07E|7EA04C;
    STA.L $7EA050                                              ;8588EB|8F50A07E|7EA050;
    STA.L $7EA054                                              ;8588EF|8F54A07E|7EA054;
    STA.L $7EA058                                              ;8588F3|8F58A07E|7EA058;
    STA.L $7EA05C                                              ;8588F7|8F5CA07E|7EA05C;
    STA.L $7EA060                                              ;8588FB|8F60A07E|7EA060;
    STA.L $7EA064                                              ;8588FF|8F64A07E|7EA064;
    STA.L $7EA068                                              ;858903|8F68A07E|7EA068;
    STA.L $7EA06C                                              ;858907|8F6CA07E|7EA06C;
    STA.L $7EA070                                              ;85890B|8F70A07E|7EA070;
    STA.L $7EA074                                              ;85890F|8F74A07E|7EA074;
    STA.L $7EA078                                              ;858913|8F78A07E|7EA078;
    STA.L $7EA07C                                              ;858917|8F7CA07E|7EA07C;
    STA.L $7EA080                                              ;85891B|8F80A07E|7EA080;
    STA.L $7EA084                                              ;85891F|8F84A07E|7EA084;
    STA.L $7EA088                                              ;858923|8F88A07E|7EA088;
    STA.L $7EA08C                                              ;858927|8F8CA07E|7EA08C;
    STA.L $7EA090                                              ;85892B|8F90A07E|7EA090;
    STA.L $7EA094                                              ;85892F|8F94A07E|7EA094;
    STA.L $7EA098                                              ;858933|8F98A07E|7EA098;
    STA.L $7EA09C                                              ;858937|8F9CA07E|7EA09C;
    STA.L $7EA0A0                                              ;85893B|8FA0A07E|7EA0A0;
    STA.L $7EA0A4                                              ;85893F|8FA4A07E|7EA0A4;
    STA.L $7EA0A8                                              ;858943|8FA8A07E|7EA0A8;
    STA.L $7EA0AC                                              ;858947|8FACA07E|7EA0AC;
    STA.L $7EA0B0                                              ;85894B|8FB0A07E|7EA0B0;
    STA.L $7EA0B4                                              ;85894F|8FB4A07E|7EA0B4;
    STA.L $7EA0B8                                              ;858953|8FB8A07E|7EA0B8;
    STA.L $7EA0BC                                              ;858957|8FBCA07E|7EA0BC;
    STA.L $7EA0C0                                              ;85895B|8FC0A07E|7EA0C0;
    STA.L $7EA0C4                                              ;85895F|8FC4A07E|7EA0C4;
    STA.L $7EA0C8                                              ;858963|8FC8A07E|7EA0C8;
    STA.L $7EA0CC                                              ;858967|8FCCA07E|7EA0CC;
    STA.L $7EA0D0                                              ;85896B|8FD0A07E|7EA0D0;
    STA.L $7EA0D4                                              ;85896F|8FD4A07E|7EA0D4;
    STA.L $7EA0D8                                              ;858973|8FD8A07E|7EA0D8;
    STA.L $7EA0DC                                              ;858977|8FDCA07E|7EA0DC;
    STA.L $7EA0E0                                              ;85897B|8FE0A07E|7EA0E0;
    STA.L $7EA0E4                                              ;85897F|8FE4A07E|7EA0E4;
    STA.L $7EA0E8                                              ;858983|8FE8A07E|7EA0E8;
    STA.L $7EA0EC                                              ;858987|8FECA07E|7EA0EC;
    STA.L $7EA0F0                                              ;85898B|8FF0A07E|7EA0F0;
    STA.L $7EA0F4                                              ;85898F|8FF4A07E|7EA0F4;
    STA.L $7EA0F8                                              ;858993|8FF8A07E|7EA0F8;
    STA.L $7EA0FC                                              ;858997|8FFCA07E|7EA0FC;
    STA.L $7EA100                                              ;85899B|8F00A17E|7EA100;
    STA.L $7EA104                                              ;85899F|8F04A17E|7EA104;
    STA.L $7EA108                                              ;8589A3|8F08A17E|7EA108;
    STA.L $7EA10C                                              ;8589A7|8F0CA17E|7EA10C;
    STA.L $7EA110                                              ;8589AB|8F10A17E|7EA110;
    STA.L $7EA114                                              ;8589AF|8F14A17E|7EA114;
    STA.L $7EA118                                              ;8589B3|8F18A17E|7EA118;
    STA.L $7EA11C                                              ;8589B7|8F1CA17E|7EA11C;
    STA.L $7EA120                                              ;8589BB|8F20A17E|7EA120;
    STA.L $7EA124                                              ;8589BF|8F24A17E|7EA124;
    STA.L $7EA128                                              ;8589C3|8F28A17E|7EA128;
    STA.L $7EA12C                                              ;8589C7|8F2CA17E|7EA12C;
    STA.L $7EA130                                              ;8589CB|8F30A17E|7EA130;
    STA.L $7EA134                                              ;8589CF|8F34A17E|7EA134;
    STA.L $7EA138                                              ;8589D3|8F38A17E|7EA138;
    STA.L $7EA13C                                              ;8589D7|8F3CA17E|7EA13C;
    STA.L $7EA140                                              ;8589DB|8F40A17E|7EA140;
    STA.L $7EA144                                              ;8589DF|8F44A17E|7EA144;
    STA.L $7EA148                                              ;8589E3|8F48A17E|7EA148;
    STA.L $7EA14C                                              ;8589E7|8F4CA17E|7EA14C;
    STA.L $7EA150                                              ;8589EB|8F50A17E|7EA150;
    STA.L $7EA154                                              ;8589EF|8F54A17E|7EA154;
    STA.L $7EA158                                              ;8589F3|8F58A17E|7EA158;
    STA.L $7EA15C                                              ;8589F7|8F5CA17E|7EA15C;
    STA.L $7EA160                                              ;8589FB|8F60A17E|7EA160;
    STA.L $7EA164                                              ;8589FF|8F64A17E|7EA164;
    STA.L $7EA168                                              ;858A03|8F68A17E|7EA168;
    STA.L $7EA16C                                              ;858A07|8F6CA17E|7EA16C;
    STA.L $7EA170                                              ;858A0B|8F70A17E|7EA170;
    STA.L $7EA174                                              ;858A0F|8F74A17E|7EA174;
    STA.L $7EA178                                              ;858A13|8F78A17E|7EA178;
    STA.L $7EA17C                                              ;858A17|8F7CA17E|7EA17C;
    STA.L $7EA180                                              ;858A1B|8F80A17E|7EA180;
    STA.L $7EA184                                              ;858A1F|8F84A17E|7EA184;
    STA.L $7EA188                                              ;858A23|8F88A17E|7EA188;
    STA.L $7EA18C                                              ;858A27|8F8CA17E|7EA18C;
    STA.L $7EA190                                              ;858A2B|8F90A17E|7EA190;
    STA.L $7EA194                                              ;858A2F|8F94A17E|7EA194;
    STA.L $7EA198                                              ;858A33|8F98A17E|7EA198;
    STA.L $7EA19C                                              ;858A37|8F9CA17E|7EA19C;
    STA.L $7EA1A0                                              ;858A3B|8FA0A17E|7EA1A0;
    STA.L $7EA1A4                                              ;858A3F|8FA4A17E|7EA1A4;
    STA.L $7EA1A8                                              ;858A43|8FA8A17E|7EA1A8;
    STA.L $7EA1AC                                              ;858A47|8FACA17E|7EA1AC;
    STA.L $7EA1B0                                              ;858A4B|8FB0A17E|7EA1B0;
    STA.L $7EA1B4                                              ;858A4F|8FB4A17E|7EA1B4;
    STA.L $7EA1B8                                              ;858A53|8FB8A17E|7EA1B8;
    STA.L $7EA1BC                                              ;858A57|8FBCA17E|7EA1BC;
    STA.L $7EA1C0                                              ;858A5B|8FC0A17E|7EA1C0;
    STA.L $7EA1C4                                              ;858A5F|8FC4A17E|7EA1C4;
    STA.L $7EA1C8                                              ;858A63|8FC8A17E|7EA1C8;
    STA.L $7EA1CC                                              ;858A67|8FCCA17E|7EA1CC;
    STA.L $7EA1D0                                              ;858A6B|8FD0A17E|7EA1D0;
    STA.L $7EA1D4                                              ;858A6F|8FD4A17E|7EA1D4;
    STA.L $7EA1D8                                              ;858A73|8FD8A17E|7EA1D8;
    STA.L $7EA1DC                                              ;858A77|8FDCA17E|7EA1DC;
    STA.L $7EA1E0                                              ;858A7B|8FE0A17E|7EA1E0;
    STA.L $7EA1E4                                              ;858A7F|8FE4A17E|7EA1E4;
    STA.L $7EA1E8                                              ;858A83|8FE8A17E|7EA1E8;
    STA.L $7EA1EC                                              ;858A87|8FECA17E|7EA1EC;
    STA.L $7EA1F0                                              ;858A8B|8FF0A17E|7EA1F0;
    STA.L $7EA1F4                                              ;858A8F|8FF4A17E|7EA1F4;
    STA.L $7EA1F8                                              ;858A93|8FF8A17E|7EA1F8;
    STA.L $7EA1FC                                              ;858A97|8FFCA17E|7EA1FC;
    LDA.W #$0000                                               ;858A9B|A90000  |      ;
    STA.L DMASpriteOBJ2BitQueue                                ;858A9E|8F00A27E|7EA200;
    STA.L $7EA202                                              ;858AA2|8F02A27E|7EA202;
    STA.L $7EA204                                              ;858AA6|8F04A27E|7EA204;
    STA.L $7EA206                                              ;858AAA|8F06A27E|7EA206;
    STA.L $7EA208                                              ;858AAE|8F08A27E|7EA208;
    STA.L $7EA20A                                              ;858AB2|8F0AA27E|7EA20A;
    STA.L $7EA20C                                              ;858AB6|8F0CA27E|7EA20C;
    STA.L $7EA20E                                              ;858ABA|8F0EA27E|7EA20E;
    STA.L $7EA210                                              ;858ABE|8F10A27E|7EA210;
    STA.L $7EA212                                              ;858AC2|8F12A27E|7EA212;
    STA.L $7EA214                                              ;858AC6|8F14A27E|7EA214;
    STA.L $7EA216                                              ;858ACA|8F16A27E|7EA216;
    STA.L $7EA218                                              ;858ACE|8F18A27E|7EA218;
    STA.L $7EA21A                                              ;858AD2|8F1AA27E|7EA21A;
    STA.L $7EA21C                                              ;858AD6|8F1CA27E|7EA21C;
    STA.L $7EA21E                                              ;858ADA|8F1EA27E|7EA21E;
    LDA.W #$0001                                               ;858ADE|A90100  |      ;
    STA.W $00B7                                                ;858AE1|8DB700  |0000B7;
    RTS                                                        ;858AE4|60      |      ;
 
 
;;
; @brief   Reads the current frame header and acquires a tile cache slot for each of its components.
; @details Frame = count byte + 5-byte components [tile id word, x, y, attr]. The count is stored in strcGameObject.totalComponents;
;          for each component fObject_AcquireTileSlot returns the cache slot (or $FF and queues a load request that will
;          write the slot into the component byte later); the result is stored in strcGameObject.components[i].
; @param   strcObject.gameObjectIdxOffs   slot offset
; @modifies strcGameObject.totalComponents, strcGameObject.components, strcObject.pData, strcObject.bankAddress, ptrObjectData
; @clobbers A X Y
; @mode    M16X16
; @calls   fObject_AcquireTileSlot
;;
fObject_ParseObjectData:
    REP #$30                                                   ;858AE5|C230    |      ;
    LDX.B strcObject.gameObjectIdxOffs                         ;858AE7|A6A9    |0000A9;
    LDA.W strcGameObject.objectDataPointer,X                   ;858AE9|BDAC01  |0001AC;
    STA.B ptrObjectData                                        ;858AEC|8578    |000078;
    LDY.W #$0000                                               ;858AEE|A00000  |      ;
    SEP #$20                                                   ;858AF1|E220    |      ;
    LDA.B [ptrObjectData],Y                                    ;858AF3|B778    |000078;
    STA.B strcObject.totalComponents                           ;858AF5|85AD    |0000AD;
    STA.W strcGameObject.totalComponents,X                     ;858AF7|9DAF01  |0001AF;
    STZ.B strcObject.totalComponents+1                         ;858AFA|64AE    |0000AE;
    REP #$20                                                   ;858AFC|C220    |      ;
    INY                                                        ;858AFE|C8      |      ;
    TXA                                                        ;858AFF|8A      |      ;
    CLC                                                        ;858B00|18      |      ;
    ADC.W #$019C                                               ;858B01|699C01  |      ;
    CLC                                                        ;858B04|18      |      ;
    ADC.W #$0014                                               ;858B05|691400  |      ;
    STA.B strcObject.bankAddress                               ;858B08|85AF    |0000AF;
 
.loop:
    LDA.B strcObject.totalComponents                           ;858B0A|A5AD    |0000AD;
    BNE +                                                      ;858B0C|D002    |858B10;
    BRA .exit                                                  ;858B0E|802C    |858B3C;
 
 
  + LDA.B [ptrObjectData],Y                                    ;858B10|B778    |000078;
    STA.B strcObject.pData                                     ;858B12|85B3    |0000B3;
    LDA.B strcObject.bankAddress                               ;858B14|A5AF    |0000AF;
    STA.B strcObject.pData+2                                   ;858B16|85B5    |0000B5;
    REP #$30                                                   ;858B18|C230    |      ;
    PHX                                                        ;858B1A|DA      |      ;
    PHY                                                        ;858B1B|5A      |      ;
    JSR.W fObject_AcquireTileSlot                                      ;858B1C|20308C  |858C30;
    REP #$30                                                   ;858B1F|C230    |      ;
    PLY                                                        ;858B21|7A      |      ;
    PLX                                                        ;858B22|FA      |      ;
    LDA.B strcObject.pData                                     ;858B23|A5B3    |0000B3;
    AND.W #$00FF                                               ;858B25|29FF00  |      ;
    SEP #$20                                                   ;858B28|E220    |      ;
    STA.W strcGameObject.components,X                          ;858B2A|9DB001  |0001B0;
    REP #$20                                                   ;858B2D|C220    |      ;
    INX                                                        ;858B2F|E8      |      ;
    INC.B strcObject.bankAddress                               ;858B30|E6AF    |0000AF;
    TYA                                                        ;858B32|98      |      ;
    CLC                                                        ;858B33|18      |      ;
    ADC.W #$0005                                               ;858B34|690500  |      ;
    TAY                                                        ;858B37|A8      |      ;
    DEC.B strcObject.totalComponents                           ;858B38|C6AD    |0000AD;
    BRA .loop                                                  ;858B3A|80CE    |858B0A;
 
 
.exit:
    REP #$30                                                   ;858B3C|C230    |      ;
    LDX.B strcObject.gameObjectIdxOffs                         ;858B3E|A6A9    |0000A9;
    RTS                                                        ;858B40|60      |      ;
 
 
;;
; @brief   Drops the tile cache references of all components of the current slot and marks them $FF.
; @param   strcObject.gameObjectIdxOffs
; @modifies strcGameObject.components
; @clobbers A X Y
; @mode    M16X16 (internally M8)
; @calls   fObject_ReleaseTileSlot
;;
fObject_ReleaseSpriteTiles:
    REP #$30                                                   ;858B41|C230    |      ;
    LDX.B strcObject.gameObjectIdxOffs                         ;858B43|A6A9    |0000A9;
    SEP #$20                                                   ;858B45|E220    |      ;
    LDA.B #$00                                                 ;858B47|A900    |      ;
    XBA                                                        ;858B49|EB      |      ;
    LDA.W strcGameObject.totalComponents,X                     ;858B4A|BDAF01  |0001AF;
    REP #$20                                                   ;858B4D|C220    |      ;
    TAY                                                        ;858B4F|A8      |      ;
    SEP #$20                                                   ;858B50|E220    |      ;
 
.loop:
    CPY.W #$0000                                               ;858B52|C00000  |      ;
    BEQ .exit                                                  ;858B55|F01F    |858B76;
    LDA.W strcGameObject.components,X                          ;858B57|BDB001  |0001B0;
    CMP.B #$FF                                                 ;858B5A|C9FF    |      ;
    BEQ +                                                      ;858B5C|F014    |858B72;
    STA.B strcObject.pData                                     ;858B5E|85B3    |0000B3;
    STZ.B $B4                                                  ;858B60|64B4    |0000B4;
    LDA.B #$FF                                                 ;858B62|A9FF    |      ;
    STA.W strcGameObject.components,X                          ;858B64|9DB001  |0001B0;
    PHY                                                        ;858B67|5A      |      ;
    PHX                                                        ;858B68|DA      |      ;
    JSR.W fObject_ReleaseTileSlot                                      ;858B69|209F8C  |858C9F;
    SEP #$20                                                   ;858B6C|E220    |      ;
    REP #$10                                                   ;858B6E|C210    |      ;
    PLX                                                        ;858B70|FA      |      ;
    PLY                                                        ;858B71|7A      |      ;
 
  + INX                                                        ;858B72|E8      |      ;
    DEY                                                        ;858B73|88      |      ;
    BRA .loop                                                  ;858B74|80DC    |858B52;
 
 
.exit:
    REP #$30                                                   ;858B76|C230    |      ;
    LDX.B strcObject.gameObjectIdxOffs                         ;858B78|A6A9    |0000A9;
    RTS                                                        ;858B7A|60      |      ;
 
 
;;
; @brief   Tests whether any component of the slot still waits for its tile ($FF).
; @param   strcObject.gameObjectIdxOffs
; @return  strcObject.bankAddress   $FFFF = at least one tile pending, 0 = all resident
; @modifies strcUnknown740.unk740 (incremented per refusal)
; @clobbers A X Y
; @mode    M8 -> M16X16
; @note    Misuse of strcObject.bankAddress as result variable; Replace/Destroy/UpdateAllAnimations act on it.
;;
fObject_CheckComponentsPending:
    REP #$10                                                   ;858B7B|C210    |      ;
    LDX.B strcObject.gameObjectIdxOffs                         ;858B7D|A6A9    |0000A9;
    SEP #$20                                                   ;858B7F|E220    |      ;
    LDA.B #$00                                                 ;858B81|A900    |      ;
    XBA                                                        ;858B83|EB      |      ;
    LDA.W strcGameObject.totalComponents,X                     ;858B84|BDAF01  |0001AF;
    REP #$20                                                   ;858B87|C220    |      ;
    TAY                                                        ;858B89|A8      |      ;
    SEP #$20                                                   ;858B8A|E220    |      ;
 
.loop:
    CPY.W #$0000                                               ;858B8C|C00000  |      ;
    BEQ .none_pending                                                ;858B8F|F017    |858BA8;
    LDA.W strcGameObject.components,X                          ;858B91|BDB001  |0001B0;
    CMP.B #$FF                                                 ;858B94|C9FF    |      ;
    BEQ .pending_found                                                ;858B96|F004    |858B9C;
    INX                                                        ;858B98|E8      |      ;
    DEY                                                        ;858B99|88      |      ;
    BRA .loop                                                  ;858B9A|80F0    |858B8C;
 
 
.pending_found:
    REP #$30                                                   ;858B9C|C230    |      ;
    INC.W strcUnknown740.unk740                                ;858B9E|EE4007  |000740;
    LDA.W #$FFFF                                               ;858BA1|A9FFFF  |      ;
    STA.B strcObject.bankAddress                               ;858BA4|85AF    |0000AF;
    BRA .return                                                ;858BA6|8007    |858BAF;
 
 
.none_pending:
    REP #$30                                                   ;858BA8|C230    |      ;
    LDA.W #$0000                                               ;858BAA|A90000  |      ;
    STA.B strcObject.bankAddress                               ;858BAD|85AF    |0000AF;
 
.return:
    RTS                                                        ;858BAF|60      |      ;
 
 
;;
; @brief   Mirrors a component x offset when the object is flipped horizontally (flip bit $40): o -> -o - 16.
; @param   A       sign-extended offset
; @return  A       offset to use
; @mode    M16X16
; @calls   fObject_NegateOffsetMinus16
;;
fObject_FlipOffsetX:
    REP #$30                                                   ;858BB0|C230    |      ;
    PHA                                                        ;858BB2|48      |      ;
    LDA.B strcObject.flip                                      ;858BB3|A59F    |00009F;
    AND.W #$0040                                               ;858BB5|294000  |      ;
    BEQ fObject_PullAAndReturn                                ;858BB8|F014    |858BCE;
    BRA fObject_NegateOffsetMinus16                                        ;858BBA|8008    |858BC4;
 
 
;;
; @brief   Mirrors a component y offset when the object is flipped vertically (flip bit $80): o -> -o - 16.
; @param   A       sign-extended offset
; @return  A       offset to use
; @mode    M16X16
;;
fObject_FlipOffsetY:
    PHA                                                        ;858BBC|48      |      ;
    LDA.B strcObject.flip                                      ;858BBD|A59F    |00009F;
    AND.W #$0080                                               ;858BBF|298000  |      ;
    BEQ fObject_PullAAndReturn                                ;858BC2|F00A    |858BCE;
 
;;
; @brief   Computes -A - 16 (the mirrored offset of a 16x16 sprite).
; @param   A       offset (pushed on the stack by the flip routines)
; @return  A       -A - 16
; @mode    M16
;;
fObject_NegateOffsetMinus16:
    PLA                                                        ;858BC4|68      |      ;
    EOR.W #$FFFF                                               ;858BC5|49FFFF  |      ;
    INC A                                                      ;858BC8|1A      |      ;
    CLC                                                        ;858BC9|18      |      ;
    ADC.W #$FFF0                                               ;858BCA|69F0FF  |      ;
    RTS                                                        ;858BCD|60      |      ;
 
 
;;
; @brief   Unflipped case of fObject_FlipOffsetX/Y: pulls the saved offset back into A.
; @return  A       unchanged offset
; @mode    M16
;;
fObject_PullAAndReturn:
    PLA                                                        ;858BCE|68      |      ;
    RTS                                                        ;858BCF|60      |      ;
 
 
    incsrc "../../../build/gen/blocks/game_object_offsets.asm"
 
;;
; @brief   Finds the tile cache slot of a sprite tile id, or queues a load request when it is not resident.
; @details tile id -> byte at $7F0F00+id. Resident: reference count of that slot ($7EA320+4*slot) is incremented and the slot
;          number is returned. Not resident ($FF): the request (tile id, address of the requester's component byte) is appended
;          to the ring buffer at $7EA220 (head $BD, wraps at $100, spins while full) and $FFFF is returned; the load routine later
;          writes the real slot number to that component byte.
; @param   strcObject.pData   tile id (word)
; @param   strcObject.pData+2   address of the component byte of the requester (WRAM, low 8K)
; @return  strcObject.pData   slot number, or $FFFF (low byte $FF) while queued
; @note    Writes the reference count table $7EA320, the request ring buffer $7EA220 and its head index $BD.
; @clobbers A X Y
; @mode    M16X16
;;
fObject_AcquireTileSlot:
    REP #$30                                                   ;858C30|C230    |      ;
    SEP #$20                                                   ;858C32|E220    |      ;
    LDX.B strcObject.pData                                     ;858C34|A6B3    |0000B3;
    LDA.B #$00                                                 ;858C36|A900    |      ;
    XBA                                                        ;858C38|EB      |      ;
    LDA.L $7F0F00,X                                            ;858C39|BF000F7F|7F0F00;
    REP #$20                                                   ;858C3D|C220    |      ;
    TAY                                                        ;858C3F|A8      |      ;
    ASL A                                                      ;858C40|0A      |      ;
    ASL A                                                      ;858C41|0A      |      ;
    TAX                                                        ;858C42|AA      |      ;
    CPY.W #$00FF                                               ;858C43|C0FF00  |      ;
    BNE .slot_in_use                                                ;858C46|D02A    |858C72;
    REP #$20                                                   ;858C48|C220    |      ;
    LDA.B $BD                                                  ;858C4A|A5BD    |0000BD;
    TAX                                                        ;858C4C|AA      |      ;
    CLC                                                        ;858C4D|18      |      ;
    ADC.W #$0004                                               ;858C4E|690400  |      ;
    CMP.W #$0100                                               ;858C51|C90001  |      ;
    BNE .wait_queue_space                                                ;858C54|D003    |858C59;
    LDA.W #$0000                                               ;858C56|A90000  |      ;
 
.wait_queue_space:
    CMP.B $BB                                                  ;858C59|C5BB    |0000BB;
    BEQ .wait_queue_space                                                ;858C5B|F0FC    |858C59;
    STA.B $BD                                                  ;858C5D|85BD    |0000BD;
    LDA.B strcObject.pData                                     ;858C5F|A5B3    |0000B3;
    STA.L $7EA220,X                                            ;858C61|9F20A27E|7EA220;
    LDA.B strcObject.pData+2                                   ;858C65|A5B5    |0000B5;
    STA.L $7EA222,X                                            ;858C67|9F22A27E|7EA222;
    LDA.W #$FFFF                                               ;858C6B|A9FFFF  |      ;
    STA.B strcObject.pData                                     ;858C6E|85B3    |0000B3;
    BRA .return                                                ;858C70|800C    |858C7E;
 
 
.slot_in_use:
    LDA.L $7EA320,X                                            ;858C72|BF20A37E|7EA320;
    INC A                                                      ;858C76|1A      |      ;
    STA.L $7EA320,X                                            ;858C77|9F20A37E|7EA320;
    TYA                                                        ;858C7B|98      |      ;
    STA.B strcObject.pData                                     ;858C7C|85B3    |0000B3;
 
.return:
    RTS                                                        ;858C7E|60      |      ;
 
 
;;
; @brief   Unused: single-bit masks $0001..$8000.
; @format  16 words.
;;
aObjectBitMask16Unused:
    dw $0001,$0002,$0004,$0008,$0010,$0020                     ;858C7F|        |      ;
    dw $0040,$0080,$0100,$0200,$0400,$0800                     ;858C8B|        |      ;
    dw $1000,$2000,$4000,$8000                                 ;858C97|        |      ;
 
;;
; @brief   Decrements the reference count of a tile cache slot.
; @param   strcObject.pData   slot number
; @note    Writes the reference count table entry $7EA320 + 4 * slot.
; @clobbers A X
; @mode    M16X16
; @note    Spins forever if the count is already 0 (the BEQ loops on itself); never happens in valid state.
;;
fObject_ReleaseTileSlot:
    REP #$30                                                   ;858C9F|C230    |      ;
    LDA.B strcObject.pData                                     ;858CA1|A5B3    |0000B3;
    ASL A                                                      ;858CA3|0A      |      ;
    ASL A                                                      ;858CA4|0A      |      ;
    TAX                                                        ;858CA5|AA      |      ;
 
  - LDA.L $7EA320,X                                            ;858CA6|BF20A37E|7EA320;
    BEQ -                                                      ;858CAA|F0FA    |858CA6;
    DEC A                                                      ;858CAC|3A      |      ;
    STA.L $7EA320,X                                            ;858CAD|9F20A37E|7EA320;
    RTS                                                        ;858CB1|60      |      ;
 
 
;;
; @brief   Per frame: turns queued tile requests into DMA transfers (as far as the per-frame DMA budget $C7 allows).
; @details For every pending request (ring buffer $7EA220, tail $BB) while $C7 >= $0100: choose a cache slot (first 64 loads
;          use slots in order via $0846; later it searches from the rotating start $0848 for a slot with reference count 0 -
;          endless loop if none is free), write the slot number into the requester's component byte (bank $80 mirror),
;          reset the slot's reference count to 1, clear the previous owner's entry in $7F0F00 and set the new one. The source
;          is bank $88 + (tile id >> 8) at $8000 + $2000 * ((id >> 6) & 3) + slotTable[id & $3F] * $20; the VRAM destination
;          is slotTable[slot] * $10 words. Each load appends [source address, bank, VRAM address] to the DMA list at
;          DMAtoVRAMData and terminates it with $FFFF (max $C0 bytes = 32 loads per frame). $C7 -= $0100 per load.
;          Finally stores the number of remaining requests in strcUnknown740.unk742.
; @param   $BB, $BD   ring buffer tail / head
; @param   $C7        remaining DMA budget this frame (set to $1800 at the top of the main loop)
; @modifies DMAtoVRAMData, strcUnknown740.unk742
; @note    Also writes $7EA320 (slot table), $7F0F00 (tile id to slot), $0846 / $0848 (slot allocation counters), $BB (queue tail), $C7 (DMA budget).
; @clobbers A X Y
; @mode    M8 -> M16X16
; @calls   (none; uses the hardware multiplier SNES_WRMPYA/B)
; @note    The jump at the end of the loop goes to the fixed address $858CBC (the loop head `--`).
;;
fObject_ProcessTileLoadQueue:
    SEP #$20                                                   ;858CB2|E220    |      ;
    LDA.B #$80                                                 ;858CB4|A980    |      ;
    STA.B ptrObjectData+2                                      ;858CB6|857A    |00007A;
    REP #$30                                                   ;858CB8|C230    |      ;
    STZ.B $BF                                                  ;858CBA|64BF    |0000BF;
 
 -- LDA.B $BD                                                  ;858CBC|A5BD    |0000BD;
    CMP.B $BB                                                  ;858CBE|C5BB    |0000BB;
    BNE +                                                      ;858CC0|D003    |858CC5;
    JMP.W .return                                              ;858CC2|4C288E  |858E28;
 
 
  + LDA.B $C7                                                  ;858CC5|A5C7    |0000C7;
    CMP.W #$0100                                               ;858CC7|C90001  |      ;
    BCS +                                                      ;858CCA|B003    |858CCF;
    JMP.W .return                                              ;858CCC|4C288E  |858E28;
 
 
  + LDX.B $BB                                                  ;858CCF|A6BB    |0000BB;
    LDA.L $7EA220,X                                            ;858CD1|BF20A27E|7EA220;
    STA.B $C1                                                  ;858CD5|85C1    |0000C1;
    LDA.L $7EA222,X                                            ;858CD7|BF22A27E|7EA222;
    STA.B ptrObjectData                                        ;858CDB|8578    |000078;
    LDA.B $C7                                                  ;858CDD|A5C7    |0000C7;
    SEC                                                        ;858CDF|38      |      ;
    SBC.W #$0100                                               ;858CE0|E90001  |      ;
    STA.B $C7                                                  ;858CE3|85C7    |0000C7;
    LDA.B $BB                                                  ;858CE5|A5BB    |0000BB;
    CLC                                                        ;858CE7|18      |      ;
    ADC.W #$0004                                               ;858CE8|690400  |      ;
    CMP.W #$0100                                               ;858CEB|C90001  |      ;
    BNE +                                                      ;858CEE|D003    |858CF3;
    LDA.W #$0000                                               ;858CF0|A90000  |      ;
 
  + STA.B $BB                                                  ;858CF3|85BB    |0000BB;
    LDA.W $0848                                                ;858CF5|AD4808  |000848;
    AND.W #$003F                                               ;858CF8|293F00  |      ;
    INC A                                                      ;858CFB|1A      |      ;
    STA.W $0848                                                ;858CFC|8D4808  |000848;
    LDA.W $0846                                                ;858CFF|AD4608  |000846;
    CMP.W #$0040                                               ;858D02|C94000  |      ;
    BEQ +                                                      ;858D05|F00B    |858D12;
    STA.B $C5                                                  ;858D07|85C5    |0000C5;
    ASL A                                                      ;858D09|0A      |      ;
    ASL A                                                      ;858D0A|0A      |      ;
    STA.B $C3                                                  ;858D0B|85C3    |0000C3;
    INC.W $0846                                                ;858D0D|EE4608  |000846;
    BRA .continue                                              ;858D10|8026    |858D38;
 
 
  + LDY.W #$0000                                               ;858D12|A00000  |      ;
    LDA.W $0848                                                ;858D15|AD4808  |000848;
    ASL A                                                      ;858D18|0A      |      ;
    ASL A                                                      ;858D19|0A      |      ;
 
  - TAX                                                        ;858D1A|AA      |      ;
    LDA.L $7EA320,X                                            ;858D1B|BF20A37E|7EA320;
    BEQ +                                                      ;858D1F|F010    |858D31;
    TXA                                                        ;858D21|8A      |      ;
    CLC                                                        ;858D22|18      |      ;
    ADC.W #$0004                                               ;858D23|690400  |      ;
    AND.W #$00FF                                               ;858D26|29FF00  |      ;
    INY                                                        ;858D29|C8      |      ;
    CPY.W #$0040                                               ;858D2A|C04000  |      ;
    BNE -                                                      ;858D2D|D0EB    |858D1A;
 
.deadend:
    BRA .deadend                                               ;858D2F|80FE    |858D2F;
 
 
  + STX.B $C3                                                  ;858D31|86C3    |0000C3;
    TXA                                                        ;858D33|8A      |      ;
    LSR A                                                      ;858D34|4A      |      ;
    LSR A                                                      ;858D35|4A      |      ;
    STA.B $C5                                                  ;858D36|85C5    |0000C5;
 
.continue:
    LDA.B $C3                                                  ;858D38|A5C3    |0000C3;
    BMI .continue                                              ;858D3A|30FC    |858D38;
    LDA.B $C5                                                  ;858D3C|A5C5    |0000C5;
    SEP #$20                                                   ;858D3E|E220    |      ;
    STA.B [ptrObjectData]                                      ;858D40|8778    |000078;
    STA.B ptrUnknown0x75                                       ;858D42|8575    |000075;
    STZ.B $76                                                  ;858D44|6476    |000076;
    REP #$20                                                   ;858D46|C220    |      ;
    LDX.B $C3                                                  ;858D48|A6C3    |0000C3;
    LDA.W #$0001                                               ;858D4A|A90100  |      ;
    STA.L $7EA320,X                                            ;858D4D|9F20A37E|7EA320;
    LDA.L $7EA322,X                                            ;858D51|BF22A37E|7EA322;
    CMP.W #$FFFF                                               ;858D55|C9FFFF  |      ;
    BEQ +                                                      ;858D58|F00B    |858D65;
    PHX                                                        ;858D5A|DA      |      ;
    TAX                                                        ;858D5B|AA      |      ;
    SEP #$20                                                   ;858D5C|E220    |      ;
    LDA.B #$FF                                                 ;858D5E|A9FF    |      ;
    STA.L $7F0F00,X                                            ;858D60|9F000F7F|7F0F00;
    PLX                                                        ;858D64|FA      |      ;
 
  + REP #$20                                                   ;858D65|C220    |      ;
    LDA.B $C1                                                  ;858D67|A5C1    |0000C1;
    STA.L $7EA322,X                                            ;858D69|9F22A37E|7EA322;
    LDA.B $C3                                                  ;858D6D|A5C3    |0000C3;
    LSR A                                                      ;858D6F|4A      |      ;
    LSR A                                                      ;858D70|4A      |      ;
    SEP #$20                                                   ;858D71|E220    |      ;
    LDX.B $C1                                                  ;858D73|A6C1    |0000C1;
    STA.L $7F0F00,X                                            ;858D75|9F000F7F|7F0F00;
    REP #$20                                                   ;858D79|C220    |      ;
    LDA.B $C1                                                  ;858D7B|A5C1    |0000C1;
    AND.W #$FFC0                                               ;858D7D|29C0FF  |      ;
    STA.B strcVariables.n16Temp1                               ;858D80|857E    |00007E;
    LSR A                                                      ;858D82|4A      |      ;
    LSR A                                                      ;858D83|4A      |      ;
    LSR A                                                      ;858D84|4A      |      ;
    LSR A                                                      ;858D85|4A      |      ;
    LSR A                                                      ;858D86|4A      |      ;
    LSR A                                                      ;858D87|4A      |      ;
    STA.B $C3                                                  ;858D88|85C3    |0000C3;
    LDA.B $C1                                                  ;858D8A|A5C1    |0000C1;
    SEC                                                        ;858D8C|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;858D8D|E57E    |00007E;
    STA.B $C1                                                  ;858D8F|85C1    |0000C1;
    LDA.B $C3                                                  ;858D91|A5C3    |0000C3;
    LSR A                                                      ;858D93|4A      |      ;
    LSR A                                                      ;858D94|4A      |      ;
    STA.B strcVariables.n16Temp1                               ;858D95|857E    |00007E;
    CLC                                                        ;858D97|18      |      ;
    ADC.W #$0088                                               ;858D98|698800  |      ;
    STA.B $C5                                                  ;858D9B|85C5    |0000C5;
    LDA.B strcVariables.n16Temp1                               ;858D9D|A57E    |00007E;
    ASL A                                                      ;858D9F|0A      |      ;
    ASL A                                                      ;858DA0|0A      |      ;
    STA.B strcVariables.n16Temp1                               ;858DA1|857E    |00007E;
    LDA.B $C3                                                  ;858DA3|A5C3    |0000C3;
    SEC                                                        ;858DA5|38      |      ;
    SBC.B strcVariables.n16Temp1                               ;858DA6|E57E    |00007E;
    STA.B $C3                                                  ;858DA8|85C3    |0000C3;
    LDA.B $C3                                                  ;858DAA|A5C3    |0000C3;
    ASL A                                                      ;858DAC|0A      |      ;
    TAX                                                        ;858DAD|AA      |      ;
    LDA.L aObject_TileBlockSourceOffsets,X                                    ;858DAE|BF478E85|858E47;
    STA.B $C3                                                  ;858DB2|85C3    |0000C3;
    LDA.B $C1                                                  ;858DB4|A5C1    |0000C1;
    ASL A                                                      ;858DB6|0A      |      ;
    TAX                                                        ;858DB7|AA      |      ;
    LDA.L aObjSlotOamTile_868000,X                          ;858DB8|BF008086|868000;
    SEP #$20                                                   ;858DBC|E220    |      ;
    STA.W SNES_WRMPYA                                          ;858DBE|8D0242  |004202;
    LDA.B #$20                                                 ;858DC1|A920    |      ;
    STA.W SNES_WRMPYB                                          ;858DC3|8D0342  |004203;
    REP #$20                                                   ;858DC6|C220    |      ;
    NOP                                                        ;858DC8|EA      |      ;
    NOP                                                        ;858DC9|EA      |      ;
    NOP                                                        ;858DCA|EA      |      ;
    NOP                                                        ;858DCB|EA      |      ;
    NOP                                                        ;858DCC|EA      |      ;
    NOP                                                        ;858DCD|EA      |      ;
    NOP                                                        ;858DCE|EA      |      ;
    LDA.W SNES_RDMPYL                                          ;858DCF|AD1642  |004216;
    STA.B $C1                                                  ;858DD2|85C1    |0000C1;
    CLC                                                        ;858DD4|18      |      ;
    ADC.B $C3                                                  ;858DD5|65C3    |0000C3;
    CLC                                                        ;858DD7|18      |      ;
    ADC.W #$8000                                               ;858DD8|690080  |      ;
    STA.B $C3                                                  ;858DDB|85C3    |0000C3;
    LDA.B ptrUnknown0x75                                       ;858DDD|A575    |000075;
    ASL A                                                      ;858DDF|0A      |      ;
    TAX                                                        ;858DE0|AA      |      ;
    LDA.L aObjSlotOamTile_868000,X                          ;858DE1|BF008086|868000;
    SEP #$20                                                   ;858DE5|E220    |      ;
    STA.W SNES_WRMPYA                                          ;858DE7|8D0242  |004202;
    LDA.B #$10                                                 ;858DEA|A910    |      ;
    STA.W SNES_WRMPYB                                          ;858DEC|8D0342  |004203;
    REP #$20                                                   ;858DEF|C220    |      ;
    NOP                                                        ;858DF1|EA      |      ;
    NOP                                                        ;858DF2|EA      |      ;
    NOP                                                        ;858DF3|EA      |      ;
    NOP                                                        ;858DF4|EA      |      ;
    NOP                                                        ;858DF5|EA      |      ;
    NOP                                                        ;858DF6|EA      |      ;
    NOP                                                        ;858DF7|EA      |      ;
    LDA.W SNES_RDMPYL                                          ;858DF8|AD1642  |004216;
    STA.B ptrUnknown0x75                                       ;858DFB|8575    |000075;
    LDX.B $BF                                                  ;858DFD|A6BF    |0000BF;
    LDA.B $C3                                                  ;858DFF|A5C3    |0000C3;
    STA.L DMAtoVRAMData,X                                      ;858E01|9F20A47E|7EA420;
    LDA.B $C5                                                  ;858E05|A5C5    |0000C5;
    STA.L $7EA422,X                                            ;858E07|9F22A47E|7EA422;
    LDA.B ptrUnknown0x75                                       ;858E0B|A575    |000075;
    STA.L $7EA424,X                                            ;858E0D|9F24A47E|7EA424;
    LDA.W #$FFFF                                               ;858E11|A9FFFF  |      ;
    STA.L $7EA426,X                                            ;858E14|9F26A47E|7EA426;
    LDA.B $BF                                                  ;858E18|A5BF    |0000BF;
    CLC                                                        ;858E1A|18      |      ;
    ADC.W #$0006                                               ;858E1B|690600  |      ;
 
  - CMP.W #$00C0                                               ;858E1E|C9C000  |      ;
    BEQ -                                                      ;858E21|F0FB    |858E1E;
    STA.B $BF                                                  ;858E23|85BF    |0000BF;
    JMP.W $8CBC                                                ;858E25|4CBC8C  |858CBC;
 
 
.return:
    SEP #$20                                                   ;858E28|E220    |      ;
    LDA.B $BB                                                  ;858E2A|A5BB    |0000BB;
    CMP.B $BD                                                  ;858E2C|C5BD    |0000BD;
    BCS .equal                                                 ;858E2E|B007    |858E37;
    LDA.B $BD                                                  ;858E30|A5BD    |0000BD;
    SEC                                                        ;858E32|38      |      ;
    SBC.B $BB                                                  ;858E33|E5BB    |0000BB;
    BRA +                                                      ;858E35|8005    |858E3C;
 
 
.equal:
    LDA.B $BB                                                  ;858E37|A5BB    |0000BB;
    SEC                                                        ;858E39|38      |      ;
    SBC.B $BD                                                  ;858E3A|E5BD    |0000BD;
 
  + LSR A                                                      ;858E3C|4A      |      ;
    LSR A                                                      ;858E3D|4A      |      ;
    STA.W strcUnknown740.unk742                                ;858E3E|8D4207  |000742;
    STZ.W strcUnknown740.unk743                                ;858E41|9C4307  |000743;
    REP #$20                                                   ;858E44|C220    |      ;
    RTL                                                        ;858E46|6B      |      ;
 
 
;;
; @brief   Offset of each 8 KB sprite block inside a graphics bank.
; @format  8 words $0000,$2000,...,$E000.
; @index   ((tile id >> 6) & 3) * 2 (only the first four are reachable for ids < $1000... see ProcessTileLoadQueue)
; @used_by fObject_ProcessTileLoadQueue
; @note    confidence: medium - the index expression is derived from the code (tile id >> 6 modulo 4) but all 8 entries are listed.
;;
aObject_TileBlockSourceOffsets:
    dw $0000,$2000,$4000,$6000,$8000,$A000                     ;858E47|        |      ; 0x08 * [n16]
    dw $C000,$E000                                             ;858E53|        |      ;
 
;;
; @brief   NMI/VBlank: executes the DMA list built by fObject_ProcessTileLoadQueue (channel 0 to VRAM).
; @details For each 6-byte entry [source address, source bank, VRAM word address] two transfers of $40 bytes are made: the
;          upper half of the 16x16 sprite to VRAM address and the lower half ($200 bytes further in ROM) to VRAM + $100 words.
;          Stops at a $FFFF source.
; @clobbers A X
; @mode    M8 -> M16X16
; @calls   (hardware DMA registers)
;;
fObject_ExecuteTileDmaQueue:
    SEP #$20                                                   ;858E57|E220    |      ;
    LDA.B #$80                                                 ;858E59|A980    |      ;
    STA.W SNES_VMAIN                                           ;858E5B|8D1521  |002115;
    LDA.B #$01                                                 ;858E5E|A901    |      ;
    STA.W SNES_DMAP0                                           ;858E60|8D0043  |004300;
    LDA.B #$18                                                 ;858E63|A918    |      ;
    STA.W SNES_BBAD0                                           ;858E65|8D0143  |004301;
    REP #$30                                                   ;858E68|C230    |      ;
    LDX.W #$0000                                               ;858E6A|A20000  |      ;
    STX.B $BF                                                  ;858E6D|86BF    |0000BF;
 
  - LDX.B $BF                                                  ;858E6F|A6BF    |0000BF;
    LDA.L DMAtoVRAMData,X                                      ;858E71|BF20A47E|7EA420;
    CMP.W #$FFFF                                               ;858E75|C9FFFF  |      ;
    BEQ .return                                                ;858E78|F05C    |858ED6;
    LDA.L $7EA424,X                                            ;858E7A|BF24A47E|7EA424;
    STA.W SNES_VMADDL                                          ;858E7E|8D1621  |002116;
    LDA.L DMAtoVRAMData,X                                      ;858E81|BF20A47E|7EA420;
    STA.W SNES_A1T0L                                           ;858E85|8D0243  |004302;
    LDA.W #$0040                                               ;858E88|A94000  |      ;
    STA.W SNES_DAS0L                                           ;858E8B|8D0543  |004305;
    SEP #$20                                                   ;858E8E|E220    |      ;
    LDA.L $7EA422,X                                            ;858E90|BF22A47E|7EA422;
    STA.W SNES_A1B0                                            ;858E94|8D0443  |004304;
    LDA.B #$01                                                 ;858E97|A901    |      ;
    STA.W SNES_MDMAEN                                          ;858E99|8D0B42  |00420B;
    REP #$30                                                   ;858E9C|C230    |      ;
    LDX.B $BF                                                  ;858E9E|A6BF    |0000BF;
    LDA.L $7EA424,X                                            ;858EA0|BF24A47E|7EA424;
    CLC                                                        ;858EA4|18      |      ;
    ADC.W #$0100                                               ;858EA5|690001  |      ;
    STA.W SNES_VMADDL                                          ;858EA8|8D1621  |002116;
    LDA.L DMAtoVRAMData,X                                      ;858EAB|BF20A47E|7EA420;
    CLC                                                        ;858EAF|18      |      ;
    ADC.W #$0200                                               ;858EB0|690002  |      ;
    STA.W SNES_A1T0L                                           ;858EB3|8D0243  |004302;
    LDA.W #$0040                                               ;858EB6|A94000  |      ;
    STA.W SNES_DAS0L                                           ;858EB9|8D0543  |004305;
    SEP #$20                                                   ;858EBC|E220    |      ;
    LDA.L $7EA422,X                                            ;858EBE|BF22A47E|7EA422;
    STA.W SNES_A1B0                                            ;858EC2|8D0443  |004304;
    LDA.B #$01                                                 ;858EC5|A901    |      ;
    STA.W SNES_MDMAEN                                          ;858EC7|8D0B42  |00420B;
    REP #$30                                                   ;858ECA|C230    |      ;
    LDA.B $BF                                                  ;858ECC|A5BF    |0000BF;
    CLC                                                        ;858ECE|18      |      ;
    ADC.W #$0006                                               ;858ECF|690600  |      ;
    STA.B $BF                                                  ;858ED2|85BF    |0000BF;
    BRA -                                                      ;858ED4|8099    |858E6F;
 
 
.return:
    RTL                                                        ;858ED6|6B      |      ;
 
 
;;
; @brief   Empties the sprite tile cache: queue pointers, reference counts, owner table and the id-to-slot table.
; @details DMA list terminated; $BB = $BD = 0; for all 64 slots reference count 0 and owner/queue words $FFFF; $7F0F00..$7F0FFF filled
;          with $FF (the loop writes $1000 bytes, i.e. up to $7F1EFF); $0846 = $0848 = 0.
; @modifies DMAtoVRAMData
; @note    Also clears $7EA220, $7EA320, $7F0F00, $BB, $BD, $0846, $0848.
; @clobbers A X Y
; @mode    M16X16
;;
fObject_InitTileCache:
    REP #$30                                                   ;858ED7|C230    |      ;
    LDA.W #$FFFF                                               ;858ED9|A9FFFF  |      ;
    STA.L DMAtoVRAMData                                        ;858EDC|8F20A47E|7EA420;
    STZ.B $BB                                                  ;858EE0|64BB    |0000BB;
    STZ.B $BD                                                  ;858EE2|64BD    |0000BD;
    LDX.W #$0000                                               ;858EE4|A20000  |      ;
    LDY.W #$0000                                               ;858EE7|A00000  |      ;
 
  - LDA.W #$0000                                               ;858EEA|A90000  |      ; loop
    STA.L $7EA320,X                                            ;858EED|9F20A37E|7EA320;
    LDA.W #$FFFF                                               ;858EF1|A9FFFF  |      ;
    STA.L $7EA322,X                                            ;858EF4|9F22A37E|7EA322;
    STA.L $7EA220,X                                            ;858EF8|9F20A27E|7EA220;
    INX                                                        ;858EFC|E8      |      ;
    INX                                                        ;858EFD|E8      |      ;
    INX                                                        ;858EFE|E8      |      ;
    INX                                                        ;858EFF|E8      |      ;
    INY                                                        ;858F00|C8      |      ;
    CPY.W #$0040                                               ;858F01|C04000  |      ;
    BNE -                                                      ;858F04|D0E4    |858EEA;
    REP #$30                                                   ;858F06|C230    |      ;
    LDX.W #$0000                                               ;858F08|A20000  |      ;
    LDA.W #$FFFF                                               ;858F0B|A9FFFF  |      ;
 
  - STA.L $7F0F00,X                                            ;858F0E|9F000F7F|7F0F00; loop
    INX                                                        ;858F12|E8      |      ;
    INX                                                        ;858F13|E8      |      ;
    CPX.W #$1000                                               ;858F14|E00010  |      ;
    BNE -                                                      ;858F17|D0F5    |858F0E;
    STZ.W $0846                                                ;858F19|9C4608  |000846;
    STZ.W $0848                                                ;858F1C|9C4808  |000848;
    RTL                                                        ;858F1F|6B      |      ;
 
 
    pad $85FFFF
