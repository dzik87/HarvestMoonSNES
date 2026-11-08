;;
; @file   macros.asm
; @brief  Shared asar macros: AI script helpers, player flag/action helpers, story flag (strcFlags) helpers, palette, stock.
;         Each macro emits fixed instruction sequences (documented as routine blocks below); register widths are
;         set by the macro unless the @mode tag says otherwise.
; @see    src/common/structures.asm, src/common/enums.asm
;;
;;
; @brief   AI script helper: advance the script program counter ptrAIActionData by a constant.
; @param   nValue   number of bytes to skip (command byte + operands consumed)
; @modifies ptrAIActionData, A
; @clobbers A
; @mode    M16X16 (REP #$30 executed)
;;
macro AIMoveAction(nValue)
    REP #$30
    LDA.B ptrAIActionData
    CLC
    ADC.W #<nValue>
    STA.B ptrAIActionData
endmacro


;;
; @brief   Start an AI script in a slot: loads A/X/Y and calls fAI_StartSlotScript.
; @param   nArg       A = AI slot number (stored in the slot at +$3F)
; @param   nIndex     X = script group index (3-byte entries of pppAISelector)
; @param   nSubIndex  Y = script number inside the group
; @clobbers A X Y
; @calls   fAI_StartSlotScript
;;
macro AIExecute(nArg, nIndex, nSubIndex)
    LDA.W #<nArg>
    LDX.W #<nIndex>
    LDY.W #<nSubIndex>
    JSL.L fAI_StartSlotScript
endmacro


;;
; @brief   Set bits in strcPlayer.flags (read-modify-write with ORA).
; @param   nFlag   !PFLAGS_* mask (16 bit, may be OR-ed together)
; @modifies strcPlayer.flags
; @clobbers A
; @mode    M16X16
;;
macro SetPlayerFlag(nFlag)
    REP #$30
    LDA.B strcPlayer.flags
    ORA.W #<nFlag>
    STA.B strcPlayer.flags
endmacro


;;
; @brief   Clear bits in strcPlayer.flags (AND with the inverted mask).
; @param   nFlag   !PFLAGS_* mask to clear
; @modifies strcPlayer.flags
; @clobbers A
; @mode    M16X16
;;
macro UnsetPlayerFlag(nFlag)
    REP #$30
    LDA.W #<nFlag>
    EOR.W #$FFFF
    AND.B strcPlayer.flags
    STA.B strcPlayer.flags
endmacro

;;
; @brief   Test strcPlayer.flags against a mask without changing the register widths (caller guarantees M16).
; @param   nFlag   !PFLAGS_* mask
; @return  Z       set when none of the bits is set (BEQ = flag clear)
; @return  A       flags AND mask
; @clobbers A
; @mode    M16 (no REP/SEP)
;;
macro CheckPlayerFlagsNoReg(nFlag)
    LDA.B strcPlayer.flags
    AND.W #<nFlag>
endmacro


;;
; @brief   Test strcPlayer.flags against a mask (REP #$30 first), see CheckPlayerFlagsNoReg.
; @param   nFlag   !PFLAGS_* mask
; @return  Z       set when none of the bits is set
; @clobbers A
; @mode    M16X16
;;
macro CheckPlayerFlags(nFlag)
    REP #$30
    %CheckPlayerFlagsNoReg(<nFlag>)
endmacro


;;
; @brief   Set the current player action.
; @param   nAction   !PACTION_* value
; @modifies strcPlayer.action
; @clobbers A
; @mode    M16X16
;;
macro SetPlayerAction(nAction)
    REP #$30
    LDA.W #<nAction>
    STA.B strcPlayer.action
endmacro

;;
; @brief   Compare the current player action with a value.
; @param   nAction   !PACTION_* value
; @return  Z         set when strcPlayer.action equals nAction (BEQ = same action)
; @return  C         set when action >= nAction (CMP semantics)
; @clobbers A
; @mode    M16X16
;;
macro CheckPlayerAction(nAction)
    REP #$30
    LDA.B strcPlayer.action
    CMP.W #<nAction>
endmacro


;;
; @brief   Pick the carried item id from aInteractionItemTable (4-byte entries) and store it in strcPlayerData.carryItemId.
; @param   nIndex   row of aInteractionItemTable (first byte of the entry is the item id)
; @modifies strcPlayerData.carryItemId
; @clobbers A X
; @note    leaves M8 active (SEP #$20), X 16 bit
;;
macro SetCurrentCarriedItemIndex(nIndex)
    REP #$20
    LDA.W #<nIndex>
    ASL A
    ASL A
    TAX
    SEP #$20
    LDA.L aInteractionItemTable,X
    STA.W strcPlayerData.carryItemId
endmacro

;;
; @brief   Store a !CITEM_* / item id directly in strcPlayerData.carryItemId.
; @param   nItem   carried item id
; @modifies strcPlayerData.carryItemId
; @clobbers A
; @note    leaves M8 active (SEP #$20)
;;
macro SetCurrentCarriedItemDirect(nItem)
    SEP #$20
    LDA.B #<nItem>
    STA.W strcPlayerData.carryItemId
endmacro


;;
; @brief   Set bits in one of the 16-bit story flag words of strcFlags (daily1..5, event1..8, unknown1..3).
; @param   nTable   member of strcFlags (e.g. daily2, event2)
; @param   nFlag    bit mask (!DFLAGS2_*, !EFLAGS2_* ...)
; @note    modifies strcFlags.<nTable>
; @clobbers A
; @mode    M16 (caller sets REP #$20)
;;
macro SetFlag(nTable, nFlag)
    LDA.L strcFlags.<nTable>
    ORA.W #<nFlag>
    STA.L strcFlags.<nTable>
endmacro

;;
; @brief   Clear bits in a strcFlags word.
; @param   nTable   member of strcFlags
; @param   nFlag    bit mask to clear
; @note    modifies strcFlags.<nTable>
; @clobbers A
; @mode    M16
;;
macro UnsetFlag(nTable, nFlag)
    LDA.L strcFlags.<nTable>
    AND.W #~<nFlag>
    STA.L strcFlags.<nTable>
endmacro

;;
; @brief   Test bits of a strcFlags word.
; @param   nTable   member of strcFlags
; @param   nFlag    bit mask
; @return  Z        set when none of the bits is set (BEQ = clear)
; @clobbers A
; @mode    M16
;;
macro CheckFlag(nTable, nFlag)
    LDA.L strcFlags.<nTable>
    AND.W #<nFlag>
endmacro


;;
; @brief   Modify palette colours: A = table[nRegister], X = colour index, Y = offset; calls fPalette_ModifyPalette.
; @param   nValue      long address of the colour table
; @param   nRegister   index register used for the table lookup (X or Y)
; @param   nIndex      X argument of fPalette_ModifyPalette
; @param   nOffset     Y argument of fPalette_ModifyPalette
; @clobbers A X Y
; @calls   fPalette_ModifyPalette
;;
macro PaletteModify(nValue, nRegister, nIndex, nOffset)
    LDA.L <nValue>,<nRegister>
    LDX.W #<nIndex>
    LDY.W #<nOffset>
    JSL.L fPalette_ModifyPalette
endmacro


;;
; @brief   Set the facing direction of the player.
; @param   eDirection   !PDIR_*
; @modifies strcPlayer.direction
; @clobbers A
; @mode    M16X16
;;
macro SetPlayerDirection(eDirection)
    REP #$30
    LDA.W #<eDirection>
    STA.B strcPlayer.direction
endmacro


;;
; @brief   Set the facing direction of the player's sprite object.
; @param   eDirection   !PDIR_*
; @modifies strcObjectData.direction
; @clobbers A
; @mode    M16X16
;;
macro SetObjectDirection(eDirection)
    REP #$30
    LDA.W #<eDirection>
    STA.W strcObjectData.direction
endmacro


;;
; @brief   Change the player's energy by a constant through fPlayerEnergyHandler (skipped while daily4 bit $0008 is set).
; @param   nAmmount   signed 8-bit delta passed in A (negative = tires the player, e.g. 20 at noon)
; @note    leaves M8 active (SEP #$20)
; @calls   fPlayerEnergyHandler
;;
macro UpdateStamina(nAmmount)
    SEP #$20
    LDA.B #<nAmmount>
    JSL.L fPlayerEnergyHandler
endmacro


;;
; @brief   Decrease a stock counter of strcPlayerData (seeds, water, feed ...) by one.
; @param   nStock   member of strcPlayerData (leftWater, leftCornSeeds, ...)
; @note    modifies strcPlayerData.<nStock>
; @clobbers A
; @note    leaves M8 active (SEP #$20)
;;
macro DecreaseStock(nStock)
    SEP #$20
    LDA.W strcPlayerData.<nStock>
    DEC A
    STA.W strcPlayerData.<nStock>
endmacro