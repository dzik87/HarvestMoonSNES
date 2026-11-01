;;
; @file   object_data.asm
; @brief  Tile-object map access: write/read single tiles and rectangles of the current area's object map (sCurrentObjectMap)
;         or of the farm map (sFarmTilemap), plus the generated per-area object map / object property pointer tables.
; @details The object map of an area is a grid of bytes ($1000 bytes copied, one byte per 16x16 pixel object tile; the id is the
;          index into the property table pointed to by strcMap.pSelected, 4 bytes per id). The row stride depends on
;          strcDialogDisplay.mapMultiWidth (1 = 16 columns, 2 = 32, other = 64); the farm uses width 4 (64 x 64 tiles = $1000 bytes).
;          Positions are pixel coordinates, converted by fObjectEngine_ConvertCoordsToOffset.
; @bank   $82   @range $82B03A-$82CFB3
; @see    object_map.asm, sound.asm, docs/formats/area-data.md
;;
; Bank $82 module "object_data" - starts at $82B03A
 
;;
; @brief   Store one object id into the current area's object map.
; @param   A   object (tile) id
; @param   X   pixel X
; @param   Y   pixel Y
; @modifies sCurrentObjectMap
; @mode    M8X16
; @calls   fObjectEngine_ConvertCoordsToOffset
;;
fMap_UpdateCurrentTilemap:
    SEP #$20                                                   ;82B03A|E220    |      ; A: nTileId, X: nPosX, Y: nPosY
    REP #$10                                                   ;82B03C|C210    |      ;
    PHA                                                        ;82B03E|48      |      ;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82B03F|203CB1  |82B13C;
    SEP #$20                                                   ;82B042|E220    |      ;
    PLA                                                        ;82B044|68      |      ;
    STA.W sCurrentObjectMap,X                                  ;82B045|9DB609  |0009B6;
    RTL                                                        ;82B048|6B      |      ;
 
 
;;
; @brief   Store one object id into the farm map (sFarmTilemap), forcing the farm row stride (mapMultiWidth = 4).
; @param   A   object (tile) id
; @param   X   pixel X
; @param   Y   pixel Y
; @modifies sFarmTilemap, strcDialogDisplay.mapMultiWidth
; @mode    M8X16
; @calls   fObjectEngine_ConvertCoordsToOffset
; @callers fAIAction0x58_ReplaceFarmTile, fAreaEvents_House
;;
fMap_UpdateFarmTilemapCoords:
    SEP #$20                                                   ;82B049|E220    |      ; A: nTileId, X: nPosX, Y: nPosY
    REP #$10                                                   ;82B04B|C210    |      ;
    PHA                                                        ;82B04D|48      |      ;
    LDA.B #$04                                                 ;82B04E|A904    |      ;
    STA.W strcDialogDisplay.mapMultiWidth                      ;82B050|8D8101  |000181;
    PLA                                                        ;82B053|68      |      ;
    PHA                                                        ;82B054|48      |      ;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82B055|203CB1  |82B13C;
    SEP #$20                                                   ;82B058|E220    |      ;
    PLA                                                        ;82B05A|68      |      ;
    STA.L sFarmTilemap,X                                       ;82B05B|9FE6A47E|7EA4E6;
    RTL                                                        ;82B05F|6B      |      ;
 
 
;;
; @brief   Fill a rectangle of the current object map with one object id.
; @param   A   object id (kept in $99)
; @param   X   pixel X of the top-left corner (strcVariables.n16Temp3)
; @param   Y   pixel Y of the top-left corner (strcVariables.n16Temp4)
; @param   strcVariables.n16Unk86   width in tiles
; @param   strcVariables.n16Unk88   height in tiles
; @modifies sCurrentObjectMap, strcVariables.n16Unk8E, strcVariables.n16Unk90
; @mode    M8X16
; @calls   fObjectEngine_ConvertCoordsToOffset
; @callers fMap_DrawTilePatternAt, fSetTileAtCoords
;;
fMap_FillCurrentTilemapRect:
    SEP #$20                                                   ;82B060|E220    |      ; A: nArg1, X: nArg2, Y: nArg3
    REP #$10                                                   ;82B062|C210    |      ;
    STA.B $99                                                  ;82B064|8599    |000099;
    STX.B strcVariables.n16Temp3                               ;82B066|8682    |000082;
    STY.B strcVariables.n16Temp4                               ;82B068|8484    |000084;
    LDY.W #$0000                                               ;82B06A|A00000  |      ;
 
 -- PHY                                                        ;82B06D|5A      |      ;
    TYA                                                        ;82B06E|98      |      ;
    ASL A                                                      ;82B06F|0A      |      ;
    ASL A                                                      ;82B070|0A      |      ;
    ASL A                                                      ;82B071|0A      |      ;
    ASL A                                                      ;82B072|0A      |      ;
    STA.B strcVariables.n16Unk8E                               ;82B073|858E    |00008E;
    LDX.W #$0000                                               ;82B075|A20000  |      ;
 
  - PHX                                                        ;82B078|DA      |      ;
    TXA                                                        ;82B079|8A      |      ;
    ASL A                                                      ;82B07A|0A      |      ;
    ASL A                                                      ;82B07B|0A      |      ;
    ASL A                                                      ;82B07C|0A      |      ;
    ASL A                                                      ;82B07D|0A      |      ;
    STA.B strcVariables.n16Unk90                               ;82B07E|8590    |000090;
    REP #$30                                                   ;82B080|C230    |      ;
    LDA.B strcVariables.n16Temp3                               ;82B082|A582    |000082;
    CLC                                                        ;82B084|18      |      ;
    ADC.B strcVariables.n16Unk8E                               ;82B085|658E    |00008E;
    TAX                                                        ;82B087|AA      |      ;
    LDA.B strcVariables.n16Temp4                               ;82B088|A584    |000084;
    CLC                                                        ;82B08A|18      |      ;
    ADC.B strcVariables.n16Unk90                               ;82B08B|6590    |000090;
    TAY                                                        ;82B08D|A8      |      ;
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82B08E|203CB1  |82B13C;
    SEP #$20                                                   ;82B091|E220    |      ;
    REP #$10                                                   ;82B093|C210    |      ;
    LDA.B $99                                                  ;82B095|A599    |000099;
    STA.W sCurrentObjectMap,X                                  ;82B097|9DB609  |0009B6;
    PLX                                                        ;82B09A|FA      |      ;
    INX                                                        ;82B09B|E8      |      ;
    CPX.B strcVariables.n16Unk86                               ;82B09C|E486    |000086;
    BNE -                                                      ;82B09E|D0D8    |82B078;
    PLY                                                        ;82B0A0|7A      |      ;
    INY                                                        ;82B0A1|C8      |      ;
    CPY.B strcVariables.n16Unk88                               ;82B0A2|C488    |000088;
    BNE --                                                     ;82B0A4|D0C7    |82B06D;
    RTL                                                        ;82B0A6|6B      |      ;
 
 
;;
; @brief   Copy a rectangular template of object ids (from the pattern table at $A7F500) into the current object map.
; @details fMap_GetTilePatternInfo returns, for pattern index A, the template origin/size in strcVariables.n16Temp1-Temp3 (Temp1: bits 0-6 =
;          column offset in 4-tile units, high bits = row; Temp2/Temp3 = width and height; ?). Each template byte is written with
;          fMap_UpdateCurrentTilemap at X/Y + (column, row) * 16.
; @param   A   pattern index
; @param   X   pixel X of the top-left corner
; @param   Y   pixel Y of the top-left corner
; @modifies sCurrentObjectMap
; @mode    M16X16
; @calls   fMap_GetTilePatternInfo, fMap_UpdateCurrentTilemap
; @callers fAreaItemSub_Farm, fAreaItemSub_Woods, fAreaItemSub_Shed, fAreaItemSub_ImpUnderground
; @note    confidence: medium - the field layout of the pattern info (Temp1 bit usage) is inferred from the shifts.
;;
fMap_StampTemplateToCurrentTilemap:
    REP #$30                                                   ;82B0A7|C230    |      ;
    STX.B strcVariables.n16Unk8E                               ;82B0A9|868E    |00008E;
    STY.B strcVariables.n16Unk90                               ;82B0AB|8490    |000090;
    JSL.L fMap_GetTilePatternInfo                                      ;82B0AD|2201A881|81A801;
    REP #$30                                                   ;82B0B1|C230    |      ;
    LDA.W #$F500                                               ;82B0B3|A900F5  |      ;
    STA.B ptrTemp0x72                                          ;82B0B6|8572    |000072;
    SEP #$20                                                   ;82B0B8|E220    |      ;
    LDA.B #$A7                                                 ;82B0BA|A9A7    |      ;
    STA.B ptrTemp0x72+2                                        ;82B0BC|8574    |000074;
    REP #$20                                                   ;82B0BE|C220    |      ;
    LDA.B strcVariables.n16Temp1                               ;82B0C0|A57E    |00007E;
    AND.W #$007F                                               ;82B0C2|297F00  |      ;
    LSR A                                                      ;82B0C5|4A      |      ;
    LSR A                                                      ;82B0C6|4A      |      ;
    STA.B strcVariables.n16Unk86                               ;82B0C7|8586    |000086;
    LDA.B strcVariables.n16Temp1                               ;82B0C9|A57E    |00007E;
    LSR A                                                      ;82B0CB|4A      |      ;
    LSR A                                                      ;82B0CC|4A      |      ;
    LSR A                                                      ;82B0CD|4A      |      ;
    LSR A                                                      ;82B0CE|4A      |      ;
    LSR A                                                      ;82B0CF|4A      |      ;
    LSR A                                                      ;82B0D0|4A      |      ;
    LSR A                                                      ;82B0D1|4A      |      ;
    ASL A                                                      ;82B0D2|0A      |      ;
    ASL A                                                      ;82B0D3|0A      |      ;
    ASL A                                                      ;82B0D4|0A      |      ;
    ASL A                                                      ;82B0D5|0A      |      ;
    CLC                                                        ;82B0D6|18      |      ;
    ADC.B strcVariables.n16Unk86                               ;82B0D7|6586    |000086;
    STA.B strcVariables.n16Unk86                               ;82B0D9|8586    |000086;
    LDA.B strcVariables.n16Temp3                               ;82B0DB|A582    |000082;
    STA.B strcVariables.n16Temp4                               ;82B0DD|8584    |000084;
    LDA.B strcVariables.n16Temp2                               ;82B0DF|A580    |000080;
    STA.B strcVariables.n16Temp3                               ;82B0E1|8582    |000082;
    LDY.W #$0000                                               ;82B0E3|A00000  |      ;
 
 -- PHY                                                        ;82B0E6|5A      |      ;
    LDX.W #$0000                                               ;82B0E7|A20000  |      ;
 
  - REP #$30                                                   ;82B0EA|C230    |      ;
    PHX                                                        ;82B0EC|DA      |      ;
    PHY                                                        ;82B0ED|5A      |      ;
    LDY.B strcVariables.n16Unk86                               ;82B0EE|A486    |000086;
    INC.B strcVariables.n16Unk86                               ;82B0F0|E686    |000086;
    SEP #$20                                                   ;82B0F2|E220    |      ;
    LDA.B [ptrTemp0x72],Y                                      ;82B0F4|B772    |000072;
    PLY                                                        ;82B0F6|7A      |      ;
    PHY                                                        ;82B0F7|5A      |      ;
    PHA                                                        ;82B0F8|48      |      ;
    REP #$20                                                   ;82B0F9|C220    |      ;
    TXA                                                        ;82B0FB|8A      |      ;
    ASL A                                                      ;82B0FC|0A      |      ;
    ASL A                                                      ;82B0FD|0A      |      ;
    ASL A                                                      ;82B0FE|0A      |      ;
    ASL A                                                      ;82B0FF|0A      |      ;
    CLC                                                        ;82B100|18      |      ;
    ADC.B strcVariables.n16Unk8E                               ;82B101|658E    |00008E;
    TAX                                                        ;82B103|AA      |      ;
    TYA                                                        ;82B104|98      |      ;
    ASL A                                                      ;82B105|0A      |      ;
    ASL A                                                      ;82B106|0A      |      ;
    ASL A                                                      ;82B107|0A      |      ;
    ASL A                                                      ;82B108|0A      |      ;
    CLC                                                        ;82B109|18      |      ;
    ADC.B strcVariables.n16Unk90                               ;82B10A|6590    |000090;
    TAY                                                        ;82B10C|A8      |      ;
    SEP #$20                                                   ;82B10D|E220    |      ;
    PLA                                                        ;82B10F|68      |      ;
    JSL.L fMap_UpdateCurrentTilemap                            ;82B110|223AB082|82B03A;
    REP #$30                                                   ;82B114|C230    |      ;
    PLY                                                        ;82B116|7A      |      ;
    PLX                                                        ;82B117|FA      |      ;
    INX                                                        ;82B118|E8      |      ;
    CPX.B strcVariables.n16Temp3                               ;82B119|E482    |000082;
    BNE -                                                      ;82B11B|D0CD    |82B0EA;
    PLY                                                        ;82B11D|7A      |      ;
    INY                                                        ;82B11E|C8      |      ;
    CPY.B strcVariables.n16Temp4                               ;82B11F|C484    |000084;
    BNE --                                                     ;82B121|D0C3    |82B0E6;
    RTL                                                        ;82B123|6B      |      ;
 
 
;;
; @brief   Read the object id at a pixel position of the current object map.
; @param   X   pixel X
; @param   Y   pixel Y
; @return  A   object (tile) id (low byte)
; @mode    M16X16 -> M8
; @calls   fObjectEngine_ConvertCoordsToOffset
; @callers fObjectEngine_GetObjectPropertyByDirSeason
;;
fObjectEngine_GetObjectAtCoords:
    REP #$30                                                   ;82B124|C230    |      ; X: nPosX, Y: nPosY, return A: nObject
    JSR.W fObjectEngine_ConvertCoordsToOffset                  ;82B126|203CB1  |82B13C;
    SEP #$20                                                   ;82B129|E220    |      ;
    LDA.W sCurrentObjectMap,X                                  ;82B12B|BDB609  |0009B6;
    RTL                                                        ;82B12E|6B      |      ;
 
 
;;
; @brief   Round X and Y down to a multiple of 16 (tile alignment). Unused.
; @param   X   pixel X
; @param   Y   pixel Y
; @return  X, Y   aligned coordinates
; @mode    M16X16
;;
fObjectEngine_AlignCoordsTo16_Unused:
    REP #$30                                                   ;82B12F|C230    |      ; UNUSED
    TXA                                                        ;82B131|8A      |      ;
    AND.W #$FFF0                                               ;82B132|29F0FF  |      ;
    TAX                                                        ;82B135|AA      |      ;
    TYA                                                        ;82B136|98      |      ;
    AND.W #$FFF0                                               ;82B137|29F0FF  |      ;
    TAY                                                        ;82B13A|A8      |      ;
    RTL                                                        ;82B13B|6B      |      ;
 
 
;;
; @brief   Convert a pixel position to a byte offset in an object map.
; @details offset = (X >> 4) + (Y & $FFF0) * stride, where the stride factor is 1, 2 or 4 for strcDialogDisplay.mapMultiWidth
;          = 1, 2 or other (the Y term is already row * 16). Map width in tiles is therefore 16 / 32 / 64.
; @param   X   pixel X
; @param   Y   pixel Y
; @param   strcDialogDisplay.mapMultiWidth   room width in 16-tile screens
; @return  X   byte offset into the map
; @modifies strcVariables.n16Temp1, strcVariables.n16Temp2
; @mode    M16X16 -> M16X16
; @note    Called with JSR from inside bank $82 (RTS return), unlike the other routines of the module.
;;
fObjectEngine_ConvertCoordsToOffset:
    REP #$30                                                   ;82B13C|C230    |      ; X: nPosX, Y: nPosY, return X: nOffsetIndex
    TXA                                                        ;82B13E|8A      |      ;
    LSR A                                                      ;82B13F|4A      |      ;
    LSR A                                                      ;82B140|4A      |      ;
    LSR A                                                      ;82B141|4A      |      ;
    LSR A                                                      ;82B142|4A      |      ;
    STA.B strcVariables.n16Temp1                               ;82B143|857E    |00007E; n16TempVar1 = nPosX * 16
    TYA                                                        ;82B145|98      |      ;
    AND.W #$FFF0                                               ;82B146|29F0FF  |      ;
    STA.B strcVariables.n16Temp2                               ;82B149|8580    |000080;
    SEP #$20                                                   ;82B14B|E220    |      ;
    LDA.W strcDialogDisplay.mapMultiWidth                      ;82B14D|AD8101  |000181;
    CMP.B #$01                                                 ;82B150|C901    |      ;
    BEQ +                                                      ;82B152|F017    |82B16B;
    REP #$20                                                   ;82B154|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;82B156|A580    |000080;
    ASL A                                                      ;82B158|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;82B159|8580    |000080;
    SEP #$20                                                   ;82B15B|E220    |      ;
    LDA.W strcDialogDisplay.mapMultiWidth                      ;82B15D|AD8101  |000181;
    CMP.B #$02                                                 ;82B160|C902    |      ;
    BEQ +                                                      ;82B162|F007    |82B16B;
    REP #$20                                                   ;82B164|C220    |      ;
    LDA.B strcVariables.n16Temp2                               ;82B166|A580    |000080;
    ASL A                                                      ;82B168|0A      |      ;
    STA.B strcVariables.n16Temp2                               ;82B169|8580    |000080;
 
  + REP #$20                                                   ;82B16B|C220    |      ;
    LDA.B strcVariables.n16Temp1                               ;82B16D|A57E    |00007E;
    CLC                                                        ;82B16F|18      |      ;
    ADC.B strcVariables.n16Temp2                               ;82B170|6580    |000080;
    TAX                                                        ;82B172|AA      |      ;
    RTS                                                        ;82B173|60      |      ;

; Per-area object map / object property pointers and the property tables (generated from assets/areas/, docs/formats/area-data.md)
; @brief   Generated tables: pObjectMap / pObjectMap2 (per area id: ptr24 to the object map, ptr24 to the object property table)
;          and the object maps' property tables sObjectMap2_0x00..0x06 (256 rows x 4 bytes, index = object id).
; @format  see docs/formats/area-data.md ("object_props"); byte 0 of a row is the screen transition index / replacement tile / dialog id depending on the id range.
; @used_by fObjectMap_LoadData, fObjectEngine_GetObjectPropertyByDirSeason, fPlayer_InteractWithFrontObject
    incsrc "../../../build/gen/maps/object_tables.asm"
