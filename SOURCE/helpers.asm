; Bank 84 - Move forward ptrAIActionData by value
macro AIMoveAction(nValue)
    REP #$30
    LDA.B ptrAIActionData
    CLC
    ADC.W #<nValue>
    STA.B ptrAIActionData
endmacro