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
macro AICMD0x05_SetTransferPosition(nDestinationX, nDestinationY)
    db $05
    dw <nDestinationX>
    dw <nDestinationY>
    
endmacro

; AI command 0x06 - Set destination
macro AICMD0x06_SetDestinationArea(nAreaId)
    db $06
    db <nAreaId>
    
endmacro

; AI command 0x07 - Set player's direction
macro AICMD0x07_SetPlayerDirection(nPlayerDirection)
    db $07
    db <nPlayerDirection>
    
endmacro

; AI command 0x08 - Disable user input, unset flags nPlayerFlag !PFLAGS_USERCONTROL
macro AICMD0x08_EnableAIControl()
    db $08
    
endmacro

; AI command 0x09 - 
macro AICMD0x09(nDataIndex, pNextAction)
    db $09
    db <nDataIndex>
    dw <pNextAction>
    
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
macro AICMD0x0F_ScreenFadeout(nUnused)
    db $0F
    db <nUnused>
    
endmacro

; AI command 0x10 - End. Does not increment to next command
macro AICMD0x10_End()
    db $10
    
endmacro

; AI command 0x11 - 
macro AICMD0x11_EnableUserControl()
    db $11
    
endmacro

; AI command 0x12 - Always jump
macro AICMD0x12_Jump(pNextAction)
    db $12
    dw <pNextAction>
    
endmacro

; AI command 0x13 - Wait for nTime time/frames without doing nothing
macro AICMD0x13_Wait(nTime)
    db $13
    dw <nTime>
    
endmacro

; AI command 0x14 - Jump to pNextAction if value at nAddress = aAISetMask[nIndex *2] (button mask ???)
macro AICMD0x14_JumpIfFlagSet(nAddress, nIndex, pNextAction)
    db $14
    dl <nAddress>
    db <nIndex>
    dw <pNextAction>
    
endmacro

; AI command 0x15 - jump to pNextAction if [nAddress] = nValue
macro AICMD0x15_JumpIfEquals8(nAddress, nValue, pNextAction)
    db $15
    dl <nAddress>
    db <nValue>
    dw <pNextAction>
    
endmacro

; AI command 0x16 - Jump if [pAddress] is between nMin and nMax
macro AICMD0x16_JumpIfBetween8(nAddress, nMin, nMax, pNextAction)
    db $16
    dl <nAddress>
    db <nMin>
    db <nMax>
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

; AI command 0x1C - Show dialog
macro AICMD0x1C_ShowDialog(nDialogId, nUnknown2)
    db $1C
    dw <nDialogId>
    db <nUnknown2>
    
endmacro

; AI command 0x1D - Exactly same as 0x1C
macro AICMD0x1D_ShowDialog(nDialogId, nUnknown2)
    db $1D
    dw <nDialogId>
    db <nUnknown2>
    
endmacro

; AI command 0x1E - does not exists, pointer to 0x1F
macro AICMD0x1E(pNextAction)
    db $1E
    dw <pNextAction>
    
endmacro

; AI command 0x1F - 
macro AICMD0x1F(pNextAction)
    db $1F
    dw <pNextAction>
    
endmacro

; AI command 0x20 - Jumps if nSelectedOption is equal to nAnswer
macro AICMD0x20_JumpIfChoice(nAnswer, pNextAction)
    db $20
    db <nAnswer>
    dw <pNextAction>
    
endmacro

; AI command 0x21 - Adds n8Value to [pAddress]
macro AICMD0x21_AddValue8(pAddress, n8Value)
    db $21
    dl <pAddress>
    db <n8Value>
    
endmacro

; AI command 0x22 - 
macro AICMD0x22(nUnknown1, nUnknown2, nUnknown3, pNextAction, nUnknown5)
    db $22
    db <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    dw <pNextAction>
    db <nUnknown5>
    
endmacro

; AI command 0x23 - OR value at nAddress with aAISetMask[nIndex *2]
macro AICMD0x23_OrWithIndexedValue(nAddress, nIndex)
    db $23
    dl <nAddress>
    db <nIndex>
    
endmacro

; AI command 0x24 - 
macro AICMD0x24_NextHourPalette(nNextHourPalette)
    db $24
    db <nNextHourPalette>
    
endmacro

; AI command 0x25 - 
macro AICMD0x25(nUnknown1)
    db $25
    db <nUnknown1>
    
endmacro

; AI command 0x26 - does not exists, pointer to 0x28
macro AICMD0x26(nUnknown1, nUnknown2)
    db $28
    dl <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x27 - does not exists, pointer to 0x28
macro AICMD0x27(nUnknown1, nUnknown2)
    db $28
    dl <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x28 - 
macro AICMD0x28(pAddress, nUnknown2)
    db $28
    dl <pAddress>
    db <nUnknown2>
    
endmacro

; AI command 0x29 - Sets Horizontal and Vertical map scrooling speed and its timer
macro AICMD0x29_SetMapScrooling(nMapSpeedX, nMapSpeedY, nMapTimer)
    db $29
    dw <nMapSpeedX>
    dw <nMapSpeedY>
    db <nMapTimer>
    
endmacro

; AI command 0x2A - 
macro AICMD0x2A(nUnknown1)
    db $2A
    dw <nUnknown1>
    
endmacro

; AI command 0x2B - 
macro AICMD0x2B(pPointerB3, nDataIndex)
    db $2B
    dw <pPointerB3>
    db <nDataIndex>
    
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
macro AICMD0x2E(nUnknown1, pPointerB3, nUnknown3)
    db $2E
    db <nUnknown1>
    dw <pPointerB3>
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

; AI command 0x39 - Simulates input (taken from table) and keep it for nAmount of time/frames
macro AICMD0x39_WalkForTime(nInputIndex, nAmount)
    db $39
    db <nInputIndex>
    dw <nAmount>
    
endmacro

; AI command 0x3A - Simulates input (taken from table) and keep it for nAmount of time/frames also presses B button at the same time
macro AICMD0x3A_RunForTime(nInputIndex, nAmount)
    db $3A
    db <nInputIndex>
    dw <nAmount>
    
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

; AI command 0x3D - Teleports you to selected AreaId
macro AICMD0x3D_TeleportToArea(nAreaId)
    db $3D
    db <nAreaId>
    
endmacro

; AI command 0x3E - 
macro AICMD0x3E_SetCarryItem(nCarryItemId)
    db $3E
    db <nCarryItemId>
    
endmacro

; AI command 0x3F - 
macro AICMD0x3F_ThrowCarriedItem()
    db $3F
    
endmacro

; AI command 0x40 - 
macro AICMD0x40_DisableTileInteractions()
    db $40
    
endmacro

; AI command 0x41 - Adds n16Value to [pAddress]
macro AICMD0x41_AddValue16(pAddress, n16Value)
    db $41
    dl <pAddress>
    dw <n16Value>
    
endmacro

; AI command 0x42 - Adds n24Value to [pAddress]
macro AICMD0x42_AddValue24(pAddress, n24Value)
    db $42
    dl <pAddress>
    dl <n24Value>
    
endmacro

; AI command 0x43 - Jump if [pAddress] = n16Value
macro AICMD0x43_JumpIfEqual16(pAddress, n16Value, pNextAction)
    db $43
    dl <pAddress>
    dw <n16Value>
    dw <pNextAction>
    
endmacro

; AI command 0x44 - Jump if [pAddress] = n24Value
macro AICMD0x44_JumpIfEqual24(pAddress, n24Value, pNextAction)
    db $44
    dl <pAddress>
    dl <n24Value>
    dw <pNextAction>
    
endmacro

; AI command 0x45 - Jump if [pAddress] is between nMin and nMax
macro AICMD0x45_JumpIfBetween16(pAddress, nMin, nMax, pNextAction)
    db $45
    dl <pAddress>
    dw <nMin>
    dw <nMax>
    dw <pNextAction>
    
endmacro

; AI command 0x46 - Jump if [pAddress] is between nMin and nMax
macro AICMD0x46_JumpIfBetween24(pAddress, nMin, nMax, pNextAction)
    db $46
    dl <pAddress>
    dl <nMin>
    dl <nMax>
    dw <pNextAction>
    
endmacro

; AI command 0x47 - Sets [pAddress] to n8Value
macro AICMD0x47_SetValue8(pAddress, n8Value)
    db $47
    dl <pAddress>
    db <n8Value>
    
endmacro

; AI command 0x48 - Not used anywhere what it does ?
macro AICMD0x48(nUnknown1, nUnknown2)
    db $48
    dl <nUnknown1>
    dl <nUnknown2>
    
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
macro AICMD0x54_ShowDialog(nDialogId, nUnknown2)
    db $54
    dw <nDialogId>
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
macro AICMD0x59_SwapEquippedItems()
    db $59
    
endmacro