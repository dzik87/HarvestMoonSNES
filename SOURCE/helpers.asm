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
    LDA.B nPlayerFlags
    ORA.W #<nFlag>
    STA.B nPlayerFlags
endmacro


macro UnsetPlayerFlag(nFlag)
    REP #$30
    LDA.W #<nFlag>
    EOR.W #$FFFF
    AND.B nPlayerFlags
    STA.B nPlayerFlags
endmacro

; used in some places without setting MX
macro CheckPlayerFlagsNoReg(nFlag)
    LDA.B nPlayerFlags
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
    STA.B nPlayerAction
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
    STA.W nCarryItem_Current
endmacro

macro SetCurrentCarriedItemDirect(nItem)
    SEP #$20
    LDA.B #<nItem>
    STA.W nCarryItem_Current
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