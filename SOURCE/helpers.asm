; Bank 84 - Move forward ptrAIActionData by value
macro AIMoveAction(nValue)
    REP #$30
    LDA.B ptrAIActionData
    CLC
    ADC.W #<nValue>
    STA.B ptrAIActionData
endmacro


macro AIExecute(nArg, nIndex, nSubIndex)
    LDA.W #<nArg>
    LDX.W #<nIndex>
    LDY.W #<nSubIndex>
    JSL.L fAI_SetupAreaScripting
endmacro


;
; nPlayerFlags helpers
;
macro SetPlayerFlag(nFlag)
    REP #$30
    LDA.B strcPlayer.flags
    ORA.W #<nFlag>
    STA.B strcPlayer.flags
endmacro


macro UnsetPlayerFlag(nFlag)
    REP #$30
    LDA.W #<nFlag>
    EOR.W #$FFFF
    AND.B strcPlayer.flags
    STA.B strcPlayer.flags
endmacro

; used in some places without setting MX
macro CheckPlayerFlagsNoReg(nFlag)
    LDA.B strcPlayer.flags
    AND.W #<nFlag>
endmacro


macro CheckPlayerFlags(nFlag)
    REP #$30
    %CheckPlayerFlagsNoReg(<nFlag>)
endmacro


;
; nPlayerAction helpers
;
macro SetPlayerAction(nAction)
    REP #$30
    LDA.W #<nAction>
    STA.B strcPlayer.action
endmacro

;
;
;
macro CheckPlayerAction(nAction)
    REP #$30
    LDA.B strcPlayer.action
    CMP.W #<nAction>
endmacro


;
;
;
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

macro SetCurrentCarriedItemDirect(nItem)
    SEP #$20
    LDA.B #<nItem>
    STA.W strcPlayerData.carryItemId
endmacro


;
; Flags helpers
;
macro SetFlag(nTable, nFlag)
    LDA.L strcFlags.<nTable>
    ORA.W #<nFlag>
    STA.L strcFlags.<nTable>
endmacro

macro UnsetFlag(nTable, nFlag)
    LDA.L strcFlags.<nTable>
    AND.W #~<nFlag>
    STA.L strcFlags.<nTable>
endmacro

macro CheckFlag(nTable, nFlag)
    LDA.L strcFlags.<nTable>
    AND.W #<nFlag>
endmacro


;
; Palette helpers
;
; I don't like this one but what better can I do ?
macro PaletteModify(nValue, nRegister, nIndex, nOffset)
    LDA.L <nValue>,<nRegister>
    LDX.W #<nIndex>
    LDY.W #<nOffset>
    JSL.L fPalette_ModifyPalette
endmacro


macro SetPlayerDirection(eDirection)
    REP #$30
    LDA.W #<eDirection>
    STA.B strcPlayer.direction
endmacro


macro SetObjectDirection(eDirection)
    REP #$30
    LDA.W #<eDirection>
    STA.W strcObjectData.direction
endmacro


macro UpdateStamina(nAmmount)
    SEP #$20
    LDA.B #<nAmmount>
    JSL.L fPlayerEnergyHandler
endmacro


macro DecreaseStock(nStock)
    SEP #$20
    LDA.W strcPlayerData.<nStock>
    DEC A
    STA.W strcPlayerData.<nStock>
endmacro