; AI command 0x00 - Set music by id
macro AICMD0x00_SetMusic(nMusicTrackId, nUnused)
    db $00
    db <nMusicTrackId>
    db <nUnused>
    
endmacro

; AI command 0x01 - 
macro AICMD0x01_UnfreezeTime()
    db $01
    
endmacro

; AI command 0x02 - 
macro AICMD0x02_FreezeTime()
    db $02
    
endmacro

; AI command 0x03 - Sets new time
macro AICMD0x03_SetHour(nCurrentTimeId)
    db $03
    db <nCurrentTimeId>
    
endmacro

; AI command 0x04 - Does nothing, just increment action
macro AICMD0x04_Emtpy()
    db $04
    
endmacro

; AI command 0x05 - Set player's position X and Y
macro AICMD0x05_SetPosition(nDestinationX, nDestinationY)
    db $05
    dw <nDestinationX>
    dw <nDestinationY>
    
endmacro

; AI command 0x06 - Set destination
macro AICMD0x06_SetDestination(nDestinationId)
    db $06
    db <nDestinationId>
    
endmacro

; AI command 0x07 - Set player's direction
macro AICMD0x07_SetPlayerDirection(nPlayerDirection)
    db $07
    db <nPlayerDirection>
    
endmacro

; AI command 0x08 - 
macro AICMD0x08()
    db $08
    
endmacro

; AI command 0x09 - 
macro AICMD0x09(nUnknown1, nUnknown2)
    db $09
    db <nUnknown1>
    dw <nUnknown2>
    
endmacro

; AI command 0x0A - 
macro AICMD0x0A(nUnknown1)
    db $0A
    db <nUnknown1>
    
endmacro

; AI command 0x0B - 
macro AICMD0x0B(nUnknown1)
    db $0B
    db <nUnknown1>
    
endmacro

; AI command 0x0C - 
macro AICMD0x0C(nUnknown1)
    db $0C
    db <nUnknown1>
    
endmacro

; AI command 0x0D - 
macro AICMD0x0D(nUnknown1, nUnknown2, nUnknown3, nUnknown4)
    db $0D
    db <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    db <nUnknown4>
    
endmacro

; AI command 0x0E - 
macro AICMD0x0E(nUnknown1)
    db $0E
    db <nUnknown1>
    
endmacro

; AI command 0x0F - 
macro AICMD0x0F(nUnknown1)
    db $0F
    db <nUnknown1>
    
endmacro

; AI command 0x10 - End. Does not increment to next command
macro AICMD0x10_End()
    db $10
    
endmacro

; AI command 0x11 - 
macro AICMD0x11()
    db $11
    
endmacro

; AI command 0x12 - Always jump
macro AICMD0x12_Jump(pNextAction)
    db $12
    dw <pNextAction>
    
endmacro

; AI command 0x13 - 
macro AICMD0x13(nUnknown1)
    db $13
    dw <nUnknown1>
    
endmacro

; AI command 0x14 - Jump to pNextAction if value at nAddress = aAISetMask[nIndex *2] (button mask ???)
macro AICMD0x14_JumpIfEqualsToIdxValue(nAddress, nIndex, pNextAction)
    db $14
    dl <nAddress>
    db <nIndex>
    dw <pNextAction>
    
endmacro

; AI command 0x15 - 
macro AICMD0x15(nAddress, nUnknown2, pNextAction)
    db $15
    dl <nAddress>
    db <nUnknown2>
    dw <pNextAction>
    
endmacro

; AI command 0x16 - 
macro AICMD0x16(nAddress, nUnknown2, nUnknown3, pNextAction)
    db $16
    dl <nAddress>
    db <nUnknown2>
    db <nUnknown3>
    dw <pNextAction>
    
endmacro

; AI command 0x17 - 
macro AICMD0x17(nUnknown1)
    db $17
    db <nUnknown1>
    
endmacro

; AI command 0x18 - 
macro AICMD0x18(nUnknown1, pNextAction)
    db $18
    db <nUnknown1>
    dw <pNextAction>
    
endmacro

; AI command 0x19 - 
macro AICMD0x19(nUnknown1, nUnknown2)
    db $19
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1A - 
macro AICMD0x1A(nUnknown1, nUnknown2, pPointerB3, nUnknown4)
    db $1A
    dw <nUnknown1>
    dw <nUnknown2>
    dw <pPointerB3>
    db <nUnknown4>
    
endmacro

; AI command 0x1B - 
macro AICMD0x1B(nUnknown1, nUnknown2)
    db $1B
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1C - 
macro AICMD0x1C(nUnknown1, nUnknown2)
    db $1C
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1D - 
macro AICMD0x1D(nDialogId, nUnknown2)
    db $1D
    dw <nDialogId>
    db <nUnknown2>
    
endmacro

; AI command 0x1E - 
macro AICMD0x1E(pNextAction)
    db $1E
    dw <pNextAction>
    
endmacro

; AI command 0x1F - does not exists, pointer to 0x1E
macro AICMD0x1F(pNextAction)
    db $1F
    dw <pNextAction>
    
endmacro

; AI command 0x20 - 
macro AICMD0x20(nUnknown1, pNextAction)
    db $20
    db <nUnknown1>
    dw <pNextAction>
    
endmacro

; AI command 0x21 - 
macro AICMD0x21(nUnknown1, nUnknown2)
    db $21
    dl <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x22 - 
macro AICMD0x22(nUnknown1, nUnknown2, nUnknown3, nUnknown4, nUnknown5)
    db $22
    db <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    dw <nUnknown4>
    db <nUnknown5>
    
endmacro

; AI command 0x23 - OR value at nAddress with aAISetMask[nIndex *2]
macro AICMD0x23_OrWithIndexedValue(nAddress, nIndex)
    db $23
    dl <nAddress>
    db <nIndex>
    
endmacro

; AI command 0x24 - 
macro AICMD0x24(nUnknown1)
    db $24
    db <nUnknown1>
    
endmacro

; AI command 0x25 - 
macro AICMD0x25(nUnknown1)
    db $25
    db <nUnknown1>
    
endmacro

; AI command 0x26 - 
macro AICMD0x26(nUnknown1, nUnknown2, nUnknown3)
    db $26
    dw <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x27 - does not exists, pointer to 0x26
macro AICMD0x27(nUnknown1, nUnknown2, nUnknown3)
    db $27
    dw <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x28 - does not exists, pointer to 0x26
macro AICMD0x28(nUnknown1, nUnknown2)
    db $28
    dl <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x29 - 
macro AICMD0x29(nUnknown1, nUnknown2, nUnknown3)
    db $29
    dw <nUnknown1>
    dw <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x2A - 
macro AICMD0x2A(nUnknown1)
    db $2A
    dw <nUnknown1>
    
endmacro

; AI command 0x2B - 
macro AICMD0x2B(nUnknown1, nUnknown2)
    db $2B
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x2C - 
macro AICMD0x2C(nUnknown1, nUnknown2, nUnknown3)
    db $2C
    db <nUnknown1>
    dw <nUnknown2>
    dw <nUnknown3>
    
endmacro

; AI command 0x2D - 
macro AICMD0x2D(pNextAction1, pNextAction2)
    db $2D
    dw <pNextAction1>
    dw <pNextAction2>
    
endmacro

; AI command 0x2E - 
macro AICMD0x2E(nUnknown1, nUnknown2, nUnknown3)
    db $2E
    db <nUnknown1>
    dw <nUnknown2>
    db <nUnknown3>
    
endmacro

; AI command 0x2F - 
macro AICMD0x2F(nUnknown1)
    db $2F
    dw <nUnknown1>
    
endmacro

; AI command 0x30 - 
macro AICMD0x30_UpdateChicken()
    db $30
    
endmacro

; AI command 0x31 - 
macro AICMD0x31_UpdateCow()
    db $31
    
endmacro

; AI command 0x32 - 
macro AICMD0x32(nUnknown1, nUnknown2)
    db $32
    dl <nUnknown1>
    dw <nUnknown2>
    
endmacro

; AI command 0x33 - 
macro AICMD0x33()
    db $33
    
endmacro

; AI command 0x34 - 
macro AICMD0x34()
    db $34
    
endmacro

; AI command 0x35 - 
macro AICMD0x35_UpdateHorse()
    db $35
    
endmacro

; AI command 0x36 - 
macro AICMD0x36_UpdateDog()
    db $36
    
endmacro

; AI command 0x37 - 
macro AICMD0x37()
    db $37
    
endmacro

; AI command 0x38 - 
macro AICMD0x38()
    db $38
    
endmacro

; AI command 0x39 - 
macro AICMD0x39(nIndex, nUnknown2)
    db $39
    db <nIndex>
    dw <nUnknown2>
    
endmacro

; AI command 0x3A - 
macro AICMD0x3A(nUnknown1, nUnknown2)
    db $3A
    db <nUnknown1>
    dw <nUnknown2>
    
endmacro

; AI command 0x3B - 
macro AICMD0x3B(nUnknown1)
    db $3B
    db <nUnknown1>
    
endmacro

; AI command 0x3C - 
macro AICMD0x3C()
    db $3C
    
endmacro

; AI command 0x3D - 
macro AICMD0x3D(nUnknown1)
    db $3D
    db <nUnknown1>
    
endmacro

; AI command 0x3E - 
macro AICMD0x3E(nUnknown1)
    db $3E
    db <nUnknown1>
    
endmacro

; AI command 0x3F - 
macro AICMD0x3F()
    db $3F
    
endmacro

; AI command 0x40 - 
macro AICMD0x40()
    db $40
    
endmacro

; AI command 0x41 - Adds nValue to [pAddress]
macro AICMD0x41_ModifyVariable(pAddress, nValue)
    db $41
    dl <pAddress>
    dw <nValue>
    
endmacro

; AI command 0x42 - 
macro AICMD0x42(nUnknown1, nMoney)
    db $42
    dl <nUnknown1>
    dl <nMoney>
    
endmacro

; AI command 0x43 - 
macro AICMD0x43(nUnknown1, nUnknown2, pNextAction)
    db $43
    dl <nUnknown1>
    dw <nUnknown2>
    dw <pNextAction>
    
endmacro

; AI command 0x44 - 
macro AICMD0x44(nUnknown1, nConditionPointer, pNextAction)
    db $44
    dl <nUnknown1>
    dl <nConditionPointer>
    dw <pNextAction>
    
endmacro

; AI command 0x45 - 
macro AICMD0x45(nUnknown1, nUnknown2, nUnknown3, pNextAction)
    db $45
    dl <nUnknown1>
    dw <nUnknown2>
    dw <nUnknown3>
    dw <pNextAction>
    
endmacro

; AI command 0x46 - 
macro AICMD0x46(nUnknown1, nUnknown2, nUnknown3, pNextAction)
    db $46
    dl <nUnknown1>
    dl <nUnknown2>
    dl <nUnknown3>
    dw <pNextAction>
    
endmacro

; AI command 0x47 - 
macro AICMD0x47(nUnknown1, nUnknown2)
    db $47
    dl <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x48 - 
macro AICMD0x48(pDestination, nValue)
    db $48
    dl <pDestination>
    dl <nValue>
    
endmacro

; AI command 0x49 - 
macro AICMD0x49(nUnknown1)
    db $49
    dw <nUnknown1>
    
endmacro

; AI command 0x4A - 
macro AICMD0x4A()
    db $4A
    
endmacro

; AI command 0x4B - 
macro AICMD0x4B(nArg1, nArg2, nArg3)
    db $4B
    db <nArg1>
    dw <nArg2>
    dw <nArg3>
    
endmacro

; AI command 0x4C - 
macro AICMD0x4C()
    db $4C
    
endmacro

; AI command 0x4D - 
macro AICMD0x4D(pNextAction)
    db $4D
    dw <pNextAction>
    
endmacro

; AI command 0x4E - 
macro AICMD0x4E()
    db $4E
    
endmacro

; AI command 0x4F - 
macro AICMD0x4F()
    db $4F
    
endmacro

; AI command 0x50 - 
macro AICMD0x50()
    db $50
    
endmacro

; AI command 0x51 - 
macro AICMD0x51()
    db $51
    
endmacro

; AI command 0x52 - 
macro AICMD0x52()
    db $52
    
endmacro

; AI command 0x53 - 
macro AICMD0x53()
    db $53
    
endmacro

; AI command 0x54 - 
macro AICMD0x54(nUnknown1, nUnknown2)
    db $54
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x55 - 
macro AICMD0x55(pAddress, nFlagsIndex, pNextAction)
    db $55
    dl <pAddress>
    db <nFlagsIndex>
    dw <pNextAction>
    
endmacro

; AI command 0x56 - 
macro AICMD0x56_UseEquippedItem()
    db $56
    
endmacro

; AI command 0x57 - Update stamina (increase or decrease) by value
macro AICMD0x57_UpdateStamina(nStamina)
    db $57
    db <nStamina>
    
endmacro

; AI command 0x58 - Replace Farm tile at X,Y
macro AICMD0x58_ReplaceFarmTile(nTileId, nPosX, nPosY)
    db $58
    db <nTileId>
    dw <nPosX>
    dw <nPosY>
    
endmacro

; AI command 0x59 - 
macro AICMD0x59()
    db $59
    
endmacro