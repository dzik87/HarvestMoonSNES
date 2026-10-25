; AI command 0x00 - Sets the requested music track in strcAudio.trackId. [confirmed]
macro AICMD0x00_SetMusic(nMusicTrackId, nUnused)
    db $00
    db <nMusicTrackId>
    db <nUnused>
    
endmacro

; AI command 0x01 - Resumes the passage of in-game time (nTimeState = 1). [confirmed]
macro AICMD0x01_UnfreezeTime()
    db $01
    
endmacro

; AI command 0x02 - Stops the passage of in-game time (nTimeState = 0). [confirmed]
macro AICMD0x02_FreezeTime()
    db $02
    
endmacro

; AI command 0x03 - Sets nCurrentTimeID to the given value. [probable]
macro AICMD0x03_SetHour(nCurrentTimeId)
    db $03
    db <nCurrentTimeId>
    
endmacro

; AI command 0x04 - Empty command (NOP) - only advances the pointer by 1 byte. [confirmed]
macro AICMD0x04_Nop()
    db $04
    
endmacro

; AI command 0x05 - Sets the player position and the map transfer destination position to (X, Y). [confirmed]
macro AICMD0x05_SetTransferPosition(nDestinationX, nDestinationY)
    db $05
    dw <nDestinationX>
    dw <nDestinationY>
    
endmacro

; AI command 0x06 - Sets the destination area (map) and the script yields for 1 frame. [confirmed]
macro AICMD0x06_SetDestinationArea(nAreaId)
    db $06
    db <nAreaId>
    
endmacro

; AI command 0x07 - Sets the direction the player is facing. [confirmed]
macro AICMD0x07_SetPlayerDirection(nPlayerDirection)
    db $07
    db <nPlayerDirection>
    
endmacro

; AI command 0x08 - Takes control away from the player (clears PFLAGS_USERCONTROL) and zeroes the AI-driven input. [confirmed]
macro AICMD0x08_EnableAIControl()
    db $08
    
endmacro

; AI command 0x09 - Starts a parallel script in another slot (nDataIndex), beginning at pNextAction; the current script continues. [confirmed]
macro AICMD0x09_StartScript(nDataIndex, pNextAction)
    db $09
    db <nDataIndex>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x0A - Smoothly brightens the screen (fade-in) from brightness 3 to 15; blocks until finished. [confirmed]
macro AICMD0x0A_ScreenFadein(nUnused)
    db $0A
    db <nUnused>
    
endmacro

; AI command 0x0B - Sets bit nFlagBit in the global script flag field $7F:1F7A (synchronization between slots). [confirmed]
macro AICMD0x0B_SetScriptFlag(nFlagBit)
    db $0B
    db <nFlagBit>
    
endmacro

; AI command 0x0C - Waits (frame by frame) until bit nFlagBit in $7F:1F7A is set, then continues. [confirmed]
macro AICMD0x0C_WaitForScriptFlag(nFlagBit)
    db $0C
    db <nFlagBit>
    
endmacro

; AI command 0x0D - Sets the movement vector (dx, dy) of the script object together with its speed and duration, and waits for it to finish. [probable]
macro AICMD0x0D(nUnknown1, nUnknown2, nUnknown3, nUnknown4)
    db $0D
    db <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    db <nUnknown4>
    
endmacro

; AI command 0x0E - Calls fAudio_FadeOutOnTrackChangeSlow: if the requested trackId differs from the one being played, sends a track change command to the APU. [probable]
macro AICMD0x0E(nUnknown1)
    db $0E
    db <nUnknown1>
    
endmacro

; AI command 0x0F - Smoothly darkens the screen (fade-out) from brightness 15 to 0; blocks until finished. [confirmed]
macro AICMD0x0F_ScreenFadeout(nUnused)
    db $0F
    db <nUnused>
    
endmacro

; AI command 0x10 - Ends the script of the current slot (slot becomes inactive) without advancing the pointer. [confirmed]
macro AICMD0x10_End()
    db $10
    
endmacro

; AI command 0x11 - Gives control back to the player (sets PFLAGS_USERCONTROL). [confirmed]
macro AICMD0x11_EnableUserControl()
    db $11
    
endmacro

; AI command 0x12 - Unconditional jump to command pNextAction in the current script bank. [confirmed]
macro AICMD0x12_Jump(pNextAction)
    db $12
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x13 - Suspends execution of the script of the given AI object for nTime frames. [confirmed]
macro AICMD0x13_Wait(nTime)
    db $13
    dw <nTime>
    
endmacro

; AI command 0x14 - Jumps to pNextAction if bit nIndex in the 16-bit word at nAddress is set. [confirmed]
macro AICMD0x14_JumpIfFlagSet(nAddress, nIndex, pNextAction)
    db $14
    dl <nAddress>
    db <nIndex>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x15 - Jumps to pNextAction if the byte at nAddress equals nValue. [confirmed]
macro AICMD0x15_JumpIfEquals8(nAddress, nValue, pNextAction)
    db $15
    dl <nAddress>
    db <nValue>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x16 - Jumps to pNextAction if nMin <= [nAddress] <= nMax (8-bit unsigned comparison). [confirmed]
macro AICMD0x16_JumpIfBetween8(nAddress, nMin, nMax, pNextAction)
    db $16
    dl <nAddress>
    db <nMin>
    db <nMax>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x17 - Rolls a number 0..nMax-1 and stores it in field +$0D of the current AI object. [confirmed]
macro AICMD0x17_RollRandom(nMax)
    db $17
    db <nMax>
    
endmacro

; AI command 0x18 - Jumps to pNextAction if the object's last rolled (0x17) value equals nValue. [confirmed]
macro AICMD0x18_JumpIfRandomEquals(nValue, pNextAction)
    db $18
    db <nValue>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x19 - Forces a specific sprite and flip for the player and sets the PFLAGS_KNEEING flag. [probable]
macro AICMD0x19(nUnknown1, nUnknown2)
    db $19
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1A - Creates/places an NPC object at the given position with a sprite table and an initial direction. [probable]
macro AICMD0x1A(nUnknown1, nUnknown2, pPointerB3, nUnknown4)
    db $1A
    dw <nUnknown1>
    dw <nUnknown2>
    dw <pPointerB3>&$FFFF
    db <nUnknown4>
    
endmacro

; AI command 0x1B - Directly sets the sprite and flip of the current AI object (NPC) and requests a sprite refresh. [probable]
macro AICMD0x1B(nUnknown1, nUnknown2)
    db $1B
    dw <nUnknown1>
    db <nUnknown2>
    
endmacro

; AI command 0x1C - Displays dialog nDialogId and suspends the script for one frame (the AI loop continues to be skipped for the duration of the dialog). [confirmed]
macro AICMD0x1C_ShowDialog(nDialogId, nPosition)
    db $1C
    dw <nDialogId>
    db <nPosition>
    
endmacro

; AI command 0x1D - Functionally identical to 0x1C (ShowDialog); in scripts it is used for dialogs with choices, followed by a series of 0x20. [confirmed]
macro AICMD0x1D_ShowDialog(nDialogId, nPosition)
    db $1D
    dw <nDialogId>
    db <nPosition>
    
endmacro

; AI command 0x1E - Alias of 0x1F - the 0x1E entry in the aAIActions table points to the same handler fAIAction0x1F; it does not occur in any script. [probable]
macro AICMD0x1E(pNextAction)
    db $1E
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x1F - Checks whether the player is standing next to the NPC and pressed A; if so - turns the NPC toward the player, locks the player in an interaction and jumps to pNextAction, otherwise waits one frame and continues. [probable]
macro AICMD0x1F(pNextAction)
    db $1F
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x20 - Jumps to pNextAction if the player chose option nAnswer in the last dialog. [confirmed]
macro AICMD0x20_JumpIfChoice(nAnswer, pNextAction)
    db $20
    db <nAnswer>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x21 - Adds n8Value (signed) to the byte at pAddress, saturating to the range 0..255. [confirmed]
macro AICMD0x21_AddValue8(pAddress, n8Value)
    db $21
    dl <pAddress>
    db <n8Value>
    
endmacro

; AI command 0x22 - Enables random wandering for the current NPC within a rectangular area around its current position. [probable]
macro AICMD0x22(nUnknown1, nUnknown2, nUnknown3, pNextAction, nUnknown5)
    db $22
    db <nUnknown1>
    db <nUnknown2>
    db <nUnknown3>
    dw <pNextAction>&$FFFF
    db <nUnknown5>
    
endmacro

; AI command 0x23 - Sets bit nIndex in the 16-bit word at nAddress (OR with aAISetMask[nIndex]). [confirmed]
macro AICMD0x23_OrWithIndexedValue(nAddress, nIndex)
    db $23
    dl <nAddress>
    db <nIndex>
    
endmacro

; AI command 0x24 - Sets the target color palette (smooth transition) to the set with the given index, unless it is already evening. [confirmed]
macro AICMD0x24_NextHourPalette(nNextHourPalette)
    db $24
    db <nNextHourPalette>
    
endmacro

; AI command 0x25 - Deactivates the AI slot with the given number and removes its game object (sprite) from the map. [confirmed]
macro AICMD0x25_RemoveActor(nActorIndex)
    db $25
    db <nActorIndex>
    
endmacro

; AI command 0x26 - Alias of opcode 0x28 (clear bit) - in the aAIActions table the entry 0x26 points to fAIAction0x28. [confirmed]
macro AICMD0x26_ClearBitAs0x28(pAddress, nBitIndex)
    db $28
    dl <pAddress>
    db <nBitIndex>
    
endmacro

; AI command 0x27 - Alias of opcode 0x28 (clear bit) - in the aAIActions table the entry 0x27 points to fAIAction0x28. [confirmed]
macro AICMD0x27_ClearBitAs0x28(pAddress, nBitIndex)
    db $28
    dl <pAddress>
    db <nBitIndex>
    
endmacro

; AI command 0x28 - Clears a single bit (0-15) in the 16-bit word at the given RAM address. [confirmed]
macro AICMD0x28_ClearBit(pAddress, nBitIndex)
    db $28
    dl <pAddress>
    db <nBitIndex>
    
endmacro

; AI command 0x29 - Starts automatic camera scrolling at the given X/Y speed for the given number of frames. [confirmed]
macro AICMD0x29_SetMapScrooling(nMapSpeedX, nMapSpeedY, nMapTimer)
    db $29
    dw <nMapSpeedX>
    dw <nMapSpeedY>
    db <nMapTimer>
    
endmacro

; AI command 0x2A - Starts a sequence of map tile changes (pointer ptrUnknown0xCF) and ends the current script frame. [probable]
macro AICMD0x2A(nUnknown1)
    db $2A
    dw <nUnknown1>
    
endmacro

; AI command 0x2B - Sets the appearance (sprite table from bank $B3 and direction) of the current AI slot and marks it for game object creation. [probable]
macro AICMD0x2B(pPointerB3, nDataIndex)
    db $2B
    dw <pPointerB3>&$FFFF
    db <nDataIndex>
    
endmacro

; AI command 0x2C - Plays a sound effect (audio registers 114/115), waits the given number of frames and restores the tool sound. [probable]
macro AICMD0x2C(nUnknown1, nUnknown2, nUnknown3)
    db $2C
    db <nUnknown1>
    dw <nUnknown2>
    dw <nUnknown3>
    
endmacro

; AI command 0x2D - Single-frame interaction test: if the player pressed A near this character, jumps to one of two addresses, otherwise proceeds to the next command. [confirmed]
macro AICMD0x2D_JumpOnInteract(pNextAction1, pNextAction2)
    db $2D
    dw <pNextAction1>&$FFFF
    dw <pNextAction2>&$FFFF
endmacro

; AI command 0x2E - Enables random wandering (animals/NPCs) for the current AI slot around its current position, which becomes the home point. [probable]
macro AICMD0x2E(nUnknown1, pPointerB3, nUnknown3)
    db $2E
    db <nUnknown1>
    dw <pPointerB3>&$FFFF
    db <nUnknown3>
    
endmacro

; AI command 0x2F - Changes the sprite table (animation) of the current AI slot while preserving the current direction, and marks the sprite for refresh. [probable]
macro AICMD0x2F(pPointerB3)
    db $2F
    dw <pPointerB3>&$FFFF
endmacro

; AI command 0x30 - One tick of the chicken logic: synchronizes the position with the chicken structure, handles being picked up by the player and random behaviors. [probable]
macro AICMD0x30_UpdateChicken()
    db $30
    
endmacro

; AI command 0x31 - One tick of the cow logic: synchronizes the position with the cow structure, handles feeding, milking, picking up and dialogs. [probable]
macro AICMD0x31_UpdateCow()
    db $31
    
endmacro

; AI command 0x32 - Writes a 16-bit constant to an arbitrary RAM address (the word counterpart of 0x47 SetValue8). [confirmed]
macro AICMD0x32_SetValue16(pAddress, nValue)
    db $32
    dl <pAddress>
    dw <nValue>
    
endmacro

; AI command 0x33 - One tick of the mole logic: lets the player pick it up, otherwise periodically starts its appearance subscript at random. [probable]
macro AICMD0x33()
    db $33
    
endmacro

; AI command 0x34 - One tick of a simple item actor: after A is pressed, a player not holding an item picks it up (carryItemId = 7) and the actor disappears. [probable]
macro AICMD0x34()
    db $34
    
endmacro

; AI command 0x35 - One tick of the horse logic: periodic random behaviors of the foal or adult horse, mounting, following the player. [probable]
macro AICMD0x35_UpdateHorse()
    db $35
    
endmacro

; AI command 0x36 - One tick of the dog logic: copies the AI slot position to nDogX/nDogY, handles hugging/picking up the dog, random idle behaviors and running to the player after a whistle. [probable]
macro AICMD0x36_UpdateDog()
    db $36
    
endmacro

; AI command 0x37 - Removes/deactivates the game object associated with the AI slot (index from slot field +0x12). [probable]
macro AICMD0x37()
    db $37
    
endmacro

; AI command 0x38 - Blocks the script until the flag daily1 $8000 is set (screen fully brightened after fade-in). [confirmed]
macro AICMD0x38_WaitForFadeIn()
    db $38
    
endmacro

; AI command 0x39 - Simulates pressing a direction (pad) for the given number of frames and waits until it elapses; the player walks. [confirmed]
macro AICMD0x39_WalkForTime(nInputIndex, nAmount)
    db $39
    db <nInputIndex>
    dw <nAmount>
    
endmacro

; AI command 0x3A - Like 0x39, but additionally presses B (run). [confirmed]
macro AICMD0x3A_RunForTime(nInputIndex, nAmount)
    db $3A
    db <nInputIndex>
    dw <nAmount>
    
endmacro

; AI command 0x3B - Sets the carried item and the PFLAGS_HOLDINGITEM flag (the player carries an item without a pick-up animation). [probable]
macro AICMD0x3B(nUnknown1)
    db $3B
    db <nUnknown1>
    
endmacro

; AI command 0x3C - Teleports the player home (nDestinationAreaId=$15=AREA_HOUSE1) with the forced teleport flag and sets the flag daily4 $0020. [probable]
macro AICMD0x3C()
    db $3C
    
endmacro

; AI command 0x3D - Sets the destination area and forces a teleport (AFLAGS_FORCETELEPORT). [confirmed]
macro AICMD0x3D_TeleportToArea(nAreaId)
    db $3D
    db <nAreaId>
    
endmacro

; AI command 0x3E - Sets the carried item and starts the player action PACTION_ITEMONHAND (pose/picking up an item). [probable]
macro AICMD0x3E_SetCarryItem(nCarryItemId)
    db $3E
    db <nCarryItemId>
    
endmacro

; AI command 0x3F - Sets the player action PACTION_DROPITEM (throwing/putting down the carried item). [confirmed]
macro AICMD0x3F_ThrowCarriedItem()
    db $3F
    
endmacro

; AI command 0x40 - Sets the flag strcFlags.daily2 $0008, which disables checking the object/tile under the player. [probable]
macro AICMD0x40_DisableTileInteractions()
    db $40
    
endmacro

; AI command 0x41 - Adds n16Value to the word at pAddress, saturating to the range 0..999. [confirmed]
macro AICMD0x41_AddValue16(pAddress, n16Value)
    db $41
    dl <pAddress>
    dw <n16Value>
    
endmacro

; AI command 0x42 - Adds n24Value to nMoney ($7F1F04) via fGameEngine_AddProfit; if the result is negative, sets the money to zero. [confirmed]
macro AICMD0x42_AddValue24(pAddress, n24Value)
    db $42
    dl <pAddress>
    dl <n24Value>
    
endmacro

; AI command 0x43 - Jumps to pNextAction if the 16-bit word at pAddress equals n16Value. [confirmed]
macro AICMD0x43_JumpIfEqual16(pAddress, n16Value, pNextAction)
    db $43
    dl <pAddress>
    dw <n16Value>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x44 - Jumps to pNextAction if the 24-bit value at pAddress equals n24Value. [confirmed]
macro AICMD0x44_JumpIfEqual24(pAddress, n24Value, pNextAction)
    db $44
    dl <pAddress>
    dl <n24Value>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x45 - Jumps to pNextAction if nMin <= [pAddress] <= nMax (16-bit unsigned). [confirmed]
macro AICMD0x45_JumpIfBetween16(pAddress, nMin, nMax, pNextAction)
    db $45
    dl <pAddress>
    dw <nMin>
    dw <nMax>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x46 - Jumps to pNextAction if nMin <= value24[pAddress] <= nMax. [confirmed]
macro AICMD0x46_JumpIfBetween24(pAddress, nMin, nMax, pNextAction)
    db $46
    dl <pAddress>
    dl <nMin>
    dl <nMax>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x47 - Writes the byte n8Value to the address pAddress. [confirmed]
macro AICMD0x47_SetValue8(pAddress, n8Value)
    db $47
    dl <pAddress>
    db <n8Value>
    
endmacro

; AI command 0x48 - Writes a 24-bit value to a 24-bit address (the n24 counterpart of 0x47 SetValue8). [confirmed]
macro AICMD0x48_SetValue24(pAddress, n24Value)
    db $48
    dl <pAddress>
    dl <n24Value>
    
endmacro

; AI command 0x49 - Sets the sprite data table of the AI object and immediately selects the entry matching the player's current direction (the 0x2B variant with index = strcPlayer.direction). [probable]
macro AICMD0x49(pPointerB3)
    db $49
    dw <pPointerB3>&$FFFF
endmacro

; AI command 0x4A - If the player stands next to the object and presses A (with empty hands), picks the object up - deactivates it and gives the player the carried item id 8. [probable]
macro AICMD0x4A()
    db $4A
    
endmacro

; AI command 0x4B - Replaces a tile in the current object map (sCurrentObjectMap) at the given coordinates. [probable]
macro AICMD0x4B(nArg1, nArg2, nArg3)
    db $4B
    db <nArg1>
    dw <nArg2>
    dw <nArg3>
    
endmacro

; AI command 0x4C - Sets bit 0x02 in the AI object state byte (+0x00); the object no longer blocks the player in collision detection. [probable]
macro AICMD0x4C()
    db $4C
    
endmacro

; AI command 0x4D - Conditional jump: if the player is next to the object and used the Blue Feather (flag daily3 0x0040), the object turns to face the player and the script jumps to pNextAction. [confirmed]
macro AICMD0x4D_JumpIfBlueFeatherUsed(pNextAction)
    db $4D
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x4E - Clears flag daily2 0x0008 - restores tile interactions disabled by 0x40. [confirmed]
macro AICMD0x4E_EnableTileInteractions()
    db $4E
    
endmacro

; AI command 0x4F - Sets flag daily4 0x8000, which blocks tool use with the Y button. [confirmed]
macro AICMD0x4F_DisableToolUse()
    db $4F
    
endmacro

; AI command 0x50 - Puts down whatever the player is carrying or hugging (item, chicken, dog) and resets the player sprite to the direction. [probable]
macro AICMD0x50()
    db $50
    
endmacro

; AI command 0x51 - Variant of 0x50: returns the chicken to the coop, removes carry 0x29 and lets go of the dog, but does not touch other items and does not reset the player sprite. [probable]
macro AICMD0x51()
    db $51
    
endmacro

; AI command 0x52 - Like 0x4A (picking up an object with the A button next to it), but instead of granting an item it sets flag daily4 0x0002, which triggers an event after the pick-up animation. [probable]
macro AICMD0x52()
    db $52
    
endmacro

; AI command 0x53 - Like 0x52, but sets flag daily4 0x0004 (selects the second event variant after the pick-up). [probable]
macro AICMD0x53()
    db $53
    
endmacro

; AI command 0x54 - Shows a dialog in input handler mode 6 (closes by itself when finished, without player input) - a variant of 0x1C/0x1D. [probable]
macro AICMD0x54_ShowDialog(nDialogId, nUnknown2)
    db $54
    dw <nDialogId>
    db <nUnknown2>
    
endmacro

; AI command 0x55 - Jumps to pNextAction if bit nFlagsIndex in the word at pAddress is NOT set (negation of 0x14 JumpIfFlagSet). [confirmed]
macro AICMD0x55_JumpIfFlagNotSet(pAddress, nFlagsIndex, pNextAction)
    db $55
    dl <pAddress>
    db <nFlagsIndex>
    dw <pNextAction>&$FFFF
endmacro

; AI command 0x56 - If the player has a tool equipped, starts its use (animation and effect), as after pressing Y. [confirmed]
macro AICMD0x56_UseEquippedItem()
    db $56
    
endmacro

; AI command 0x57 - Changes the player's energy by the given signed value via fPlayerEnergyHandler. [confirmed]
macro AICMD0x57_UpdateStamina(nStamina)
    db $57
    db <nStamina>
    
endmacro

; AI command 0x58 - Replaces a tile in sFarmTilemap ($7EA4E6) at the given coordinates. [confirmed]
macro AICMD0x58_ReplaceFarmTile(nTileId, nPosX, nPosY)
    db $58
    db <nTileId>
    dw <nPosX>
    dw <nPosY>
    
endmacro

; AI command 0x59 - Sets the player action PACTION_SWAPTOOL - swaps the current tool with the second one. [confirmed]
macro AICMD0x59_SwapEquippedItems()
    db $59
    
endmacro