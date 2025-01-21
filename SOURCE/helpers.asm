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