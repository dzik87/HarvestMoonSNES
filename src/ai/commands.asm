;;
; @file   commands.asm
; @brief  The AI script command set: one asar macro `%AICMD0xNN_Name(...)` per opcode of the byte-code interpreter.
; @details Every macro emits the opcode byte followed by its operands (`db` = byte, `dw` = word, `dl` = long address). Operands
;         named `p...` ending in `&$FFFF` are 16-bit jump targets inside the current script bank ($B3/$B4/$B5); `pAddress` /
;         `nAddress` operands are 24-bit RAM addresses (low WRAM is written as `wram80(label)` so the EU/DE/JP RAM shifts
;         apply, see region.asm). The scripts in src/ai/us/scripts/ are sequences of these macro calls; the interpreter is
;         fAI_HowToPlaySetup / fAI_ExecuteAiAction in src/code/bank_84/ai_engine.asm (handlers `fAIAction0xNN_*`, dispatch
;         table aAIActions). The 90 commands are described in more detail in docs/ai/commands.md (generated from
;         docs/ai/commands/*.yml); a macro name ending in a plain opcode (`AICMD0x26_ClearBitAs0x28`) marks an alias
;         whose table entry shares the handler of another opcode.
; @bank   $B3-$B5   @range $B38000-$B5FFFF
; @see    docs/ai/commands.md, docs/regions-ai.md, src/code/bank_84/ai_engine.asm, tools/analysis/aidiff.py
;;

;;
; @brief      Sets the requested music track in strcAudio.trackId.
; @details    The handler advances ptrAIActionData by 1, reads a byte and stores it to strcAudio.trackId, then
;             advances the pointer by another 2 (3 bytes in total). It does not call any audio routines and does not
;             block - the track change itself only happens once the audio engine compares trackId with trackIdCopy
;             ($7E:0117), e.g. in fAudio_PlayTrackThenResumeMapMusic / fAudio_StartPendingTrack or after command 0x0E.
; @case       $00; 3 byte(s) including the opcode
; @param      nMusicTrackId  byte: Track id stored to strcAudio.trackId ($7E:0110).
; @param      nUnused  byte: Ignored by the handler (the pointer is only advanced).
; @see        fAIAction0x00_SetMusicTrack
; @confidence high
; @modifies   strcAudio.trackId, ptrAIActionData
; @note       The second argument is ignored; the value $B4 looks like a leftover of the script bank number. There is
;             no enum for the track ids.
;;
macro AICMD0x00_SetMusic(nMusicTrackId, nUnused)
    db $00
    db <nMusicTrackId>
    db <nUnused>
    
endmacro

;;
; @brief      Resumes the passage of in-game time (nTimeState = 1).
; @details    Writes 1 to nTimeState ($7E:0973; 00 = stopped, 01 = running), clears bit $0001 in strcFlags.daily2 and
;             sets bit $0020 in strcDialogDisplay.mapFlags ($7E:0196). Paired with command 0x02 (inverse operations).
; @case       $01; 1 byte(s) including the opcode
; @see        fAIAction0x01_UnfreezeTime
; @confidence high
; @modifies   nTimeState, strcFlags.daily2, strcDialogDisplay.mapFlags, ptrAIActionData
; @note       The exact meaning of bit $0020 in mapFlags (AFLAGS_UNK0020) and bit $0001 in daily2 is not determined -
;             it is only known that they are toggled together with nTimeState.
;;
macro AICMD0x01_UnfreezeTime()
    db $01
    
endmacro

;;
; @brief      Stops the passage of in-game time (nTimeState = 0).
; @details    Writes 0 to nTimeState, sets bit $0001 in strcFlags.daily2 and clears bit $0020 in
;             strcDialogDisplay.mapFlags. Inverse of command 0x01.
; @case       $02; 1 byte(s) including the opcode
; @see        fAIAction0x02_FreezeTime
; @confidence high
; @modifies   nTimeState, strcFlags.daily2, strcDialogDisplay.mapFlags, ptrAIActionData
; @note       Same as 0x01 - the semantics of daily2 bit $0001 and mapFlags bit $0020.
;;
macro AICMD0x02_FreezeTime()
    db $02
    
endmacro

;;
; @brief      Sets nCurrentTimeID to the given value.
; @details    Writes the argument byte (long addressing, 8-bit) to nCurrentTimeID. Does not touch nInGameHourCounter
;             or nInGameMinuteCounter, calls no routines, does not block.
; @case       $03; 2 byte(s) including the opcode
; @param      nCurrentTimeId  byte: Value stored to nCurrentTimeID ($7F:1F1C).
; @see        fAIAction0x03_SetHour
; @confidence medium
; @modifies   nCurrentTimeID, ptrAIActionData
; @note       Whether nCurrentTimeID is exactly the hour or a time-of-day index is unknown - the macro name SetHour is
;             a guess; the handler only shows a write to nCurrentTimeID.
;;
macro AICMD0x03_SetHour(nCurrentTimeId)
    db $03
    db <nCurrentTimeId>
    
endmacro

;;
; @brief      Empty command (NOP) - only advances the pointer by 1 byte.
; @details    The handler performs only ptrAIActionData += 1. No other effects.
; @case       $04; 1 byte(s) including the opcode
; @see        fAIAction0x04_Nop
; @confidence high
; @modifies   ptrAIActionData
;;
macro AICMD0x04_Nop()
    db $04
    
endmacro

;;
; @brief      Sets the player position and the map transfer destination position to (X, Y).
; @details    The handler (16-bit A) reads two words in sequence and stores each to a pair: the mapDest* field in
;             strcDialogDisplay and the current player position strcPlayer.posX/posY. Does not block.
; @case       $05; 5 byte(s) including the opcode
; @param      nDestinationX  word: X coordinate (map pixels) - stored to strcDialogDisplay.mapDestX ($7E:017D) and
;             strcPlayer.posX ($D6).
; @param      nDestinationY  word: Y coordinate - stored to strcDialogDisplay.mapDestY ($7E:017F) and strcPlayer.posY
;             ($D8).
; @see        fAIAction0x05_SetTransferPosition
; @confidence high
; @modifies   strcDialogDisplay.mapDestX, strcDialogDisplay.mapDestY, strcPlayer.posX, strcPlayer.posY,
;             ptrAIActionData
; @note       Unit (pixel vs. tile): values in scripts, e.g. 264,312 / 128,440, point to pixels, but this was not
;             verified in the rendering code.
;;
macro AICMD0x05_SetTransferPosition(nDestinationX, nDestinationY)
    db $05
    dw <nDestinationX>
    dw <nDestinationY>
    
endmacro

;;
; @brief      Sets the destination area (map) and the script yields for 1 frame.
; @details    Writes the byte to nDestinationAreaId. Additionally increments the 16-bit wait counter of the script
;             slot (offset +$10 in the 64-byte structure at ptrAIUnknown0xCC) by 1, so the script loop holds this slot
;             for the next frame (wait 1).
; @case       $06; 2 byte(s) including the opcode
; @param      nAreaId  byte: Area id (!AREA_* enums from enums.asm, e.g. !AREA_COOP, !AREA_COWBARN, !AREA_ENDINGxx)
;             stored to nDestinationAreaId ($7E:098B).
; @see        fAIAction0x06_SetDestinationArea
; @confidence high
; @modifies   nDestinationAreaId, ptrAIActionData
;;
macro AICMD0x06_SetDestinationArea(nAreaId)
    db $06
    db <nAreaId>
    
endmacro

;;
; @brief      Sets the direction the player is facing.
; @details    The argument byte (with the high byte zeroed) goes to strcPlayer.direction ($DA),
;             strcObjectData.direction ($7E:0911) and strcObjectData.spriteIdx ($7E:0901), i.e. it also sets the
;             sprite index of the player object to the direction value. Does not block.
; @case       $07; 2 byte(s) including the opcode
; @param      nPlayerDirection  byte: Player direction, !PDIR_* enum (DOWN=0, UP=1, LEFT=2, RIGHT=3).
; @see        fAIAction0x07_SetPlayerDirection
; @confidence high
; @modifies   strcPlayer.direction, strcObjectData.direction, strcObjectData.spriteIdx, ptrAIActionData
;;
macro AICMD0x07_SetPlayerDirection(nPlayerDirection)
    db $07
    db <nPlayerDirection>
    
endmacro

;;
; @brief      Takes control away from the player (clears PFLAGS_USERCONTROL) and zeroes the AI-driven input.
; @details    Clears the flag !PFLAGS_USERCONTROL ($4000) in strcPlayer.flags and zeroes strcAiControlData.input
;             ($7E:08FD) and strcAiControlData.counter ($7E:08FF), so that the script can then drive the player with
;             commands such as 0x39/0x3A (walk/run for time). Inverse of command 0x11.
; @case       $08; 1 byte(s) including the opcode
; @see        fAIAction0x08_EnableAIControl
; @confidence high
; @modifies   strcPlayer.flags, strcAiControlData.input, strcAiControlData.counter, ptrAIActionData
;;
macro AICMD0x08_EnableAIControl()
    db $08
    
endmacro

;;
; @brief      Starts a parallel script in another slot (nDataIndex), beginning at pNextAction; the current script
;             continues.
; @details    Remembers the current slot (ptrAIUnknown0xCC -> ptrTemp0x72), switches ptrAIUnknown0xCC to slot
;             nDataIndex through fAI_SelectSlot, copies the bank into it (+$32), stores the 16-bit pointer to +$30,
;             calls fAI_ResetSlotFull (slot initialization: active=1, flags=0, counters, position 0, etc.), stores
;             nDataIndex in +$3F and restores the previous slot. Then ptrAIActionData += 4 in total.
; @case       $09; 4 byte(s) including the opcode
; @param      nDataIndex  byte: Index of the target script slot (64-byte structure at $7E:B586 + idx*64, 49 slots).
; @param      pNextAction  word: 16-bit address of the script start in the same bank as the current script (the bank
;             is copied from offset +$32 of the current slot).
; @see        fAIAction0x09_StartScript
; @confidence high
; @modifies   ptrAIUnknown0xCC, ptrTemp0x72, ptrAIActionData
; @note       The meaning of all slot fields reset in fAI_ResetSlotFull (strcAIUnknown.unkXX) is not fully described;
;             what happens when the target slot is already active was not checked (it is overwritten without a check).
;;
macro AICMD0x09_StartScript(nDataIndex, pNextAction)
    db $09
    db <nDataIndex>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Smoothly brightens the screen (fade-in) from brightness 3 to 15; blocks until finished.
; @details    Sets n8Temp1=3 (start brightness), n8Temp2=3 (frames per step), n8Temp3=$0F (target brightness) and
;             calls fCore_ScreenFadein, which waits for NMI in a loop (about 12 steps of 3 frames) and finally sets
;             daily1 flag $8000. Blocks all execution until the fade ends.
; @case       $0A; 2 byte(s) including the opcode
; @param      nUnused  byte: Ignored by the handler (the pointer is only advanced).
; @see        fAIAction0x0A_ScreenFadein
; @confidence high
; @modifies   strcVariables.n8Temp1, strcVariables.n8Temp2, strcVariables.n8Temp3, strcSystem.nBrightness,
;             strcSystem.nBrightnessStep, strcFlags.daily1
; @note       The meaning of daily1 bit $8000 (probably 'screen visible') - it is only known that fade-in sets it and
;             fade-out clears it.
;;
macro AICMD0x0A_ScreenFadein(nUnused)
    db $0A
    db <nUnused>
    
endmacro

;;
; @brief      Sets bit nFlagBit in the global script flag field $7F:1F7A (synchronization between slots).
; @details    Fetches the mask 1<<n from aAISetMask and ORs it into $7F:1F7A. The field is zeroed on a new game
;             (83ACC8) and on map load (809927).
; @case       $0B; 2 byte(s) including the opcode
; @param      nFlagBit  byte: Bit number 0-15 in the 16-bit global script flag field $7F:1F7A (mask taken from the
;             aAISetMask table).
; @see        fAIAction0x0B_SetScriptFlag
; @confidence high
; @modifies   ptrAIActionData
; @note       There is no RAM symbol for $7F:1F7A - it should be added to ram.asm (e.g. nAIScriptFlags). A value of n
;             > 15 reads outside the aAISetMask table.
;;
macro AICMD0x0B_SetScriptFlag(nFlagBit)
    db $0B
    db <nFlagBit>
    
endmacro

;;
; @brief      Waits (frame by frame) until bit nFlagBit in $7F:1F7A is set, then continues.
; @details    Tests AND mask,$7F:1F7A. If the bit is set: ptrAIActionData += 1 (2 bytes in total) and the script
;             continues.
; @case       $0C; 2 byte(s) including the opcode
; @param      nFlagBit  byte: Bit number 0-15 in $7F:1F7A (as in 0x0B).
; @see        fAIAction0x0C_WaitForScriptFlag
; @confidence high
; @modifies   ptrAIActionData
;;
macro AICMD0x0C_WaitForScriptFlag(nFlagBit)
    db $0C
    db <nFlagBit>
    
endmacro

;;
; @brief      Sets the movement vector (dx, dy) of the script object together with its speed and duration, and waits
;             for it to finish.
; @details    Stores four bytes to the slot: +3 (dx), +4 (dy), +$10 (duration), +5 and +6 (step period, +6 is the
;             current counter), then sets bit $20 in slot+1 (movement flag).
; @case       $0D; 5 byte(s) including the opcode
; @param      nDeltaX  byte: Signed (e.g.
; @param      nDeltaY  byte: Signed: Y displacement per step.
; @param      nDuration  byte: Stored (8-bit) to slot+$10 = slot wait counter: the number of frames the script waits
;             (e.g.
; @param      nStepFrames  byte: Number of frames between steps (stored to slot+$05 and slot+$06). 1 = move every
;             frame, larger = slower.
; @see        fAIAction0x0D_MoveObject
; @confidence medium
; @modifies   ptrAIActionData
; @note       The interpretation is based on fAI_UpdateSlotStepMove and on usage in scripts (e.g. (1,0,$10,1)); the
;             unit of the slot position (pixels) is not verified; it is not established whether this applies only to
;             NPCs or also to the player, nor whether the high byte +$11 is always 0.
;;
macro AICMD0x0D_MoveObject(nDeltaX, nDeltaY, nDuration, nStepFrames)
    db $0D
    db <nDeltaX>
    db <nDeltaY>
    db <nDuration>
    db <nStepFrames>
    
endmacro

;;
; @brief      Calls fAudio_FadeOutOnTrackChangeSlow: if the requested trackId differs from the one being played, sends
;             a track change command to the APU.
; @details    Advances ptrAIActionData by 2 and calls fAudio_FadeOutOnTrackChangeSlow: it compares strcAudio.trackId
;             with trackIdCopy ($7E:0117); when they differ and trackIdCopy != 0, it sets strcAudio.unk112=1,
;             unk113=$40 and calls fAudio_SendFadeOutCommand, which sends a command (1, parameter $40 - probably
;             fade/track change) to the SPC through the APUIO0-3 ports. May block on the handshake with the APU.
; @case       $0E; 2 byte(s) including the opcode
; @param      nUnused  byte: Ignored by the handler (ptr += 2).
; @see        fAIAction0x0E_ApplyMusicChange
; @confidence medium
; @modifies   strcAudio.trackId, strcAudio.trackIdCopy, strcAudio.unk112, strcAudio.unk113, ptrAIActionData
; @note       The exact semantics of the APU command (1/$40) and of fAudio_SendFadeOutCommand were not analyzed
;             (fade-out only? start of a new track?); the command is not used in US scripts, so it cannot be confirmed
;             from context. The name is a hypothesis.
;;
macro AICMD0x0E_ApplyMusicChange(nUnused)
    db $0E
    db <nUnused>
    
endmacro

;;
; @brief      Smoothly darkens the screen (fade-out) from brightness 15 to 0; blocks until finished.
; @details    Sets n8Temp1=$0F (start), n8Temp2=3 (frames per step), n8Temp3=0 (target) and calls fCore_ScreenFadeout
;             (a loop waiting for NMI), which finally clears daily1 flag $8000. Blocks execution until the fade ends.
; @case       $0F; 2 byte(s) including the opcode
; @param      nUnused  byte: Ignored by the handler (the pointer is only advanced).
; @see        fAIAction0x0F_ScreenFadeout
; @confidence high
; @modifies   strcVariables.n8Temp1, strcVariables.n8Temp2, strcVariables.n8Temp3, strcSystem.nBrightness,
;             strcSystem.nBrightnessStep, strcFlags.daily1
;;
macro AICMD0x0F_ScreenFadeout(nUnused)
    db $0F
    db <nUnused>
    
endmacro

;;
; @brief      Ends the script of the current slot (slot becomes inactive) without advancing the pointer.
; @details    Writes 0 to slot+$00 (active flag) and increments the wait counter slot+$10 by 1. ptrAIActionData is not
;             changed. The slot is no longer executed by the slot loop.
; @case       $10; 1 byte(s) including the opcode
; @see        fAIAction0x10_End
; @confidence high
;;
macro AICMD0x10_End()
    db $10
    
endmacro

;;
; @brief      Gives control back to the player (sets PFLAGS_USERCONTROL).
; @details    Sets the flag !PFLAGS_USERCONTROL ($4000) in strcPlayer.flags. Inverse of command 0x08.
; @case       $11; 1 byte(s) including the opcode
; @see        fAIAction0x11_EnableUserControl
; @confidence high
; @modifies   strcPlayer.flags, ptrAIActionData
;;
macro AICMD0x11_EnableUserControl()
    db $11
    
endmacro

;;
; @brief      Unconditional jump to command pNextAction in the current script bank.
; @details    The handler advances ptrAIActionData by 1 (to the argument), reads a 16-bit word and stores it to
;             ptrAIActionData (only the 2 low bytes, the bank byte is untouched). It does not change the object's +$10
;             counter, so the fAI_RunSlots loop executes the next command in the same frame (does not block).
; @case       $12; 3 byte(s) including the opcode
; @param      pNextAction  word: Low 16 bits of the address of the next command.
; @see        fAIAction0x12_Jump
; @confidence high
; @modifies   ptrAIActionData
;;
macro AICMD0x12_Jump(pNextAction)
    db $12
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Suspends execution of the script of the given AI object for nTime frames.
; @details    Stores nTime (16-bit) to field +$10 of the AI object structure pointed to by ptrAIUnknown0xCC
;             (strcAIUnknown.unk10, wait counter). On each call, the fAI_RunSlots loop decrements +$10 for active
;             objects and executes commands while +$10 = 0; after a command is executed with +$10 != 0, the object is
;             no longer processed in that frame.
; @case       $13; 3 byte(s) including the opcode
; @param      nTime  word: Number of calls of the AI loop (fAI_RunSlots, called once per frame from the main loop) for
;             which the script of this object waits.
; @see        fAIAction0x13_Wait
; @confidence high
; @modifies   ptrAIActionData
; @note       The time unit is AI loop calls; it is not confirmed that the loop is called exactly once per frame at
;             all 10 call sites of fAI_RunSlots (core.asm, routines.asm, main_loop.asm, interaction_data.asm).
;;
macro AICMD0x13_Wait(nTime)
    db $13
    dw <nTime>
    
endmacro

;;
; @brief      Jumps to pNextAction if bit nIndex in the 16-bit word at nAddress is set.
; @details    The handler assembles a 24-bit pointer in $72-$74 (ptrTemp0x72), fetches the mask from
;             aAISetMask[nIndex], and performs a 16-bit LDA [ptrTemp0x72] AND mask. Result != 0 -> ptrAIActionData =
;             pNextAction (16 bit).
; @case       $14; 7 byte(s) including the opcode
; @param      nAddress  long: 24-bit address of a 16-bit word in memory (in scripts almost always strcFlags.* at
;             $7F:1F5A..., i.e. daily1-5, event1-7, unknown1, etc.).
; @param      nIndex  byte: Bit number 0-15.
; @param      pNextAction  word: Low 16 bits of the address of the command to jump to when the bit is set (bank
;             unchanged).
; @see        fAIAction0x14_JumpIfFlagSet
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n16Temp1
; @note       The comment in the macro says 'button mask ???' - this is incorrect, it has nothing to do with buttons;
;             these are game (bit) flags. The macro name JumpIfFlagSet is correct, but it could be made more precise
;             as JumpIfBitSet.
;;
macro AICMD0x14_JumpIfFlagSet(nAddress, nIndex, pNextAction)
    db $14
    dl <nAddress>
    db <nIndex>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Jumps to pNextAction if the byte at nAddress equals nValue.
; @details    The handler stores nAddress to ptrTemp0x72 and nValue to strcVariables.n8Temp1 ($92), then in 8-bit mode
;             compares [ptrTemp0x72] with n8Temp1 (CMP, BNE). Equal -> ptrAIActionData = pNextAction (16 bit), not
;             equal -> pointer past the command (7 bytes).
; @case       $15; 7 byte(s) including the opcode
; @param      nAddress  long: 24-bit address of the byte to compare (RAM or ROM; in scripts, among others,
;             nCurrentSeasonID, nCurrentTimeID, strcPlayerData.*).
; @param      nValue  byte: Value (8-bit) compared with the byte at nAddress.
; @param      pNextAction  word: Low 16 bits of the address of the command to jump to when the byte == nValue.
; @see        fAIAction0x15_JumpIfEquals8
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n8Temp1
;;
macro AICMD0x15_JumpIfEquals8(nAddress, nValue, pNextAction)
    db $15
    dl <nAddress>
    db <nValue>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Jumps to pNextAction if nMin <= [nAddress] <= nMax (8-bit unsigned comparison).
; @details    The handler stores nMin to n8Temp1 ($92) and nMax+1 to n8Temp2 ($93). Jump condition: [addr] >= n8Temp1
;             (BCC skips) and [addr] < n8Temp2 (BCS skips).
; @case       $16; 8 byte(s) including the opcode
; @param      nAddress  long: 24-bit address of the byte being tested.
; @param      nMin  byte: Lower bound (inclusive), unsigned comparison.
; @param      nMax  byte: Upper bound (inclusive).
; @param      pNextAction  word: Low 16 bits of the address of the command to jump to when nMin <= byte <= nMax.
; @see        fAIAction0x16_JumpIfBetween8
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n8Temp1, strcVariables.n8Temp2
; @note       Edge case: nMax = $FF gives nMax+1 = 0 and the jump is never taken (incorrect result). This use was not
;             observed in scripts.
;;
macro AICMD0x16_JumpIfBetween8(nAddress, nMin, nMax, pNextAction)
    db $16
    dl <nAddress>
    db <nMin>
    db <nMax>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Rolls a number 0..nMax-1 and stores it in field +$0D of the current AI object.
; @details    Calls fCore_GetRandomNumber (A = nMax) and stores the result to byte +$0D of the AI object structure
;             (ptrAIUnknownCC). Does not block.
; @case       $17; 2 byte(s) including the opcode
; @param      nMax  byte: Number of possible outcomes.
; @see        fAIAction0x17_RollRandom
; @confidence high
; @modifies   ptrAIActionData
; @note       The comment at fCore_GetRandomNumber says 0x00-nMax, but the code (the loop ends at X == nMax-1) implies
;             the range 0..nMax-1; this is consistent with the usage in scripts (0x17($02) + 0x18($00)/0x18($01)). The
;             other users of field +$0D are not determined.
;;
macro AICMD0x17_RollRandom(nMax)
    db $17
    db <nMax>
    
endmacro

;;
; @brief      Jumps to pNextAction if the object's last rolled (0x17) value equals nValue.
; @details    Compares byte +$0D of the AI object with nValue; equal -> ptrAIActionData = pNextAction (16 bit), not
;             equal -> advance past the command (4 bytes), which allows a chain of several 0x18 after a single 0x17
;             (jump table). Does not block.
; @case       $18; 4 byte(s) including the opcode
; @param      nValue  byte: Value compared with field +$0D of the current AI object (the result of the previous 0x17).
; @param      pNextAction  word: Low 16 bits of the address of the command to jump to when +$0D == nValue.
; @see        fAIAction0x18_JumpIfRandomEquals
; @confidence high
; @modifies   ptrAIActionData, strcVariables.n8Temp1, strcVariables.n8Temp2
; @note       The side effect on n8Temp2 is probably unintended (16-bit read/write); harmless as long as $93 is not
;             used between commands.
;;
macro AICMD0x18_JumpIfRandomEquals(nValue, pNextAction)
    db $18
    db <nValue>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Forces a specific sprite and flip for the player and sets the PFLAGS_KNEEING flag.
; @details    Stores nSpriteIdx to strcObjectData.spriteIdx and (nFlip << 6) to strcObjectData.flip, then sets
;             strcPlayer.flags |= PFLAGS_KNEEING ($2000). The KNEEING flag is checked in player_actions.asm
;             (fPlayerAction_Run, fPlayerAction_IdleHandler), where, when it is set, the normal movement/animation
;             handling is skipped - so the forced sprite is not overwritten.
; @case       $19; 4 byte(s) including the opcode
; @param      nSpriteIdx  word: Sprite index (16-bit) stored to strcObjectData.spriteIdx ($7E:0901) - the player
;             object.
; @param      nFlip  byte: Flip flags, shifted left by 6 bits and stored to strcObjectData.flip ($7E:090F): bit0 ->
;             $0040 (horizontal flip), bit1 -> $0080 (vertical), like OAM attributes. 0 or 1 in scripts.
; @see        fAIAction0x19_SetPlayerSprite
; @confidence medium
; @modifies   ptrAIActionData, strcObjectData.spriteIdx, strcObjectData.flip, strcPlayer.flags
; @note       Object $7E:0901 is identified as the player only from the field names in strcObjectData
;             (playerX/playerY); this was not confirmed in the rendering code. The name of the KNEEING flag seems
;             misleading - in fact it is more of a 'pose forced by the script'.
;;
macro AICMD0x19_SetPlayerSprite(nSpriteIdx, nFlip)
    db $19
    dw <nSpriteIdx>
    db <nFlip>
    
endmacro

;;
; @brief      Creates/places an NPC object at the given position with a sprite table and an initial direction.
; @details    Stores nPosX -> +$1A, nPosY -> +$1C, pAnimTable -> +$33, nDirection -> +$02 in the AI object structure.
;             Sets the object flags (+$01) |= $03: bit $01 marks the object as active
;             (fAI_UpdateSlotMovementAndObject/AI loop), bit $02 causes fObject_Create to be called on the next
;             processing (creation of the game object, index stored in +$12).
; @case       $1A; 8 byte(s) including the opcode
; @param      nPosX  word: X position of the object (16-bit, signed - scripts contain values such as $FF80, i.e.
;             off-screen to the left) stored to +$1A (posX) of the AI object.
; @param      nPosY  word: Y position of the object stored to +$1C (posY).
; @param      pPointerB3  word: Low 16 bits of the pointer to the sprite table in bank $B3 (aAIScriptingData_Lxxx, the
;             pointer is stored to +$33, bank $B3 is hardcoded).
; @param      nDirection  byte: Initial direction 0-3 (stored to +$02), selects the entry from pAnimTable.
; @see        fAIAction0x1A_SpawnNpc
; @confidence medium
; @modifies   ptrAIActionData, ptrTemp0x72
; @note       The exact coordinate units (world pixels vs. map pixels) are unconfirmed - the same pair goes to
;             strcObject.posX/posY.
;;
macro AICMD0x1A_SpawnNpc(nPosX, nPosY, pPointerB3, nDirection)
    db $1A
    dw <nPosX>
    dw <nPosY>
    dw <pPointerB3>&$FFFF
    db <nDirection>
    
endmacro

;;
; @brief      Directly sets the sprite and flip of the current AI object (NPC) and requests a sprite refresh.
; @details    Stores nSpriteIdx to +$16 and (nFlip << 6) to +$14 of the AI object, then sets the flag +$01 |= $04
;             (sprite update request). In fAI_UpdateSlotMovementAndObject, when flag $04 is set, fObject_Replace is
;             called, which changes the sprite only when +$16 differs from the previous +$18; the flag is cleared
;             (mask $E9) at the end of processing.
; @case       $1B; 4 byte(s) including the opcode
; @param      nSpriteIdx  word: Sprite index stored to +$16 (spriteTableIdx) of the current AI object.
; @param      nFlip  byte: Flip flags, value << 6 stored to +$14 (flip): bit0 -> $0040 (horizontal), bit1 -> $0080
;             (vertical). 0 or 1 in scripts.
; @see        fAIAction0x1B_SetSprite
; @confidence medium
; @modifies   ptrAIActionData
; @note       The function fObject_Replace was only read superficially (comparison of spriteTableIdx with $18 and
;             selection of bank $86/$87 by the threshold $0262); its full effect on OAM was not analyzed.
;;
macro AICMD0x1B_SetSprite(nSpriteIdx, nFlip)
    db $1B
    dw <nSpriteIdx>
    db <nFlip>
    
endmacro

;;
; @brief      Displays dialog nDialogId and suspends the script for one frame (the AI loop continues to be skipped for
;             the duration of the dialog).
; @details    Loads nDialogId into X, stores the nPosition byte to dialogUnk191, sets strcDialogDisplay.mapUnk19A = 2
;             and calls fDialog_DialogHandler (sets dialogId, dialogFlags |= DFLAGS_PROCESSDIALOG, zeroes the
;             option/answer counters, selects the text pointer from aDialogPointers, sets the BG3 offset and
;             nTimeState = 0, daily1 |= $4000). Then +$10 += 1 (one frame).
; @case       $1C; 4 byte(s) including the opcode
; @param      nDialogId  word: Dialog index (index into aDialogPointers, 3 bytes per entry); goes to X, and in
;             fDialog_DialogHandler to strcDialogDisplay.dialogId.
; @param      nPosition  byte: Stored to strcDialogDisplay.dialogUnk191 ($7E:0191).
; @see        fAIAction0x1C_ShowDialog
; @confidence high
; @modifies   ptrAIActionData, strcDialogDisplay.dialogUnk191, strcDialogDisplay.mapUnk19A,
;             strcDialogDisplay.dialogId, strcDialogDisplay.dialogFlags, strcDialogDisplay.dialogOptionsAnswer
; @note       The exact meaning of nPosition (top/bottom) is unconfirmed; the code that resets mapUnk19A after the
;             dialog is closed was not checked.
;;
macro AICMD0x1C_ShowDialog(nDialogId, nPosition)
    db $1C
    dw <nDialogId>
    db <nPosition>
    
endmacro

;;
; @brief      Functionally identical to 0x1C (ShowDialog); in scripts it is used for dialogs with choices, followed by
;             a series of 0x20.
; @details    The handler code is identical to 0x1C instruction by instruction (only the address differs). Convention
;             observed in scripts: 0x1D is called before a chain of 0x20 JumpIfChoice (a dialog with a question), and
;             0x1C for ordinary lines - the distinction is purely conventional (by the game's authors), with no effect
;             on behavior.
; @case       $1D; 4 byte(s) including the opcode
; @param      nDialogId  word: As in 0x1C: dialog index.
; @param      nPosition  byte: As in 0x1C: goes to strcDialogDisplay.dialogUnk191.
; @see        fAIAction0x1D_ShowDialogWithChoice
; @confidence high
; @modifies   ptrAIActionData, strcDialogDisplay.dialogUnk191, strcDialogDisplay.mapUnk19A,
;             strcDialogDisplay.dialogId, strcDialogDisplay.dialogFlags
; @note       None - the difference between 0x1C and 0x1D exists only in usage convention (there are no differences in
;             the handler code).
;;
macro AICMD0x1D_ShowDialog(nDialogId, nPosition)
    db $1D
    dw <nDialogId>
    db <nPosition>
    
endmacro

;;
; @brief      Alias of 0x1F - the 0x1E entry in the aAIActions table points to the same handler
;             fAIAction0x1F_JumpIfTalkedTo; it does not occur in any script.
; @details    In aAIActions (849455) the entries for opcodes 0x1E and 0x1F point to fAIAction0x1F_JumpIfTalkedTo
;             ($849079). Behavior is identical to 0x1F.
; @case       $1E; 3 byte(s) including the opcode
; @param      pNextAction  word: As in 0x1F: low 16 bits of the address of the command to jump to after the
;             conversation starts.
; @see        fAIAction0x1F_JumpIfTalkedTo
; @confidence medium
; @modifies   ptrAIActionData
; @note       Whether 0x1E was intended as a separate command (e.g. a different condition) - in the US ROM it points
;             to the same handler. See the description of 0x1F for details.
;;
macro AICMD0x1E_JumpIfTalkedToAlias(pNextAction)
    db $1E
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Checks whether the player is standing next to the NPC and pressed A; if so - turns the NPC toward the
;             player, locks the player in an interaction and jumps to pNextAction, otherwise waits one frame and
;             continues.
; @details    This is a polling command: in scripts it is always 'AICMD0x1F_JumpIfTalkedTo(target); Jump(same_command)'.
; @case       $1F; 3 byte(s) including the opcode
; @param      pNextAction  word: Low 16 bits of the address of the command (conversation handler) to jump to when the
;             player starts a conversation with the NPC (bank unchanged).
; @see        fAIAction0x1F_JumpIfTalkedTo
; @confidence medium
; @modifies   ptrAIActionData, strcPlayer.flags, strcPlayer.action, strcPlayer.direction, strcJoypad1.newInput,
;             strcFlags.daily4
; @note       The meaning of bits $0002/$0004 in strcFlags.daily4 (they block conversation) is not determined. Field
;             +$0C = 'player nearby' was inferred from game_engine.asm:~83AE26-83AE68 (probable).
;;
macro AICMD0x1F_JumpIfTalkedTo(pNextAction)
    db $1F
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Jumps to pNextAction if the player chose option nAnswer in the last dialog.
; @details    Compares the byte dialogOptionsAnswer with nAnswer (8-bit). Equal -> ptrAIActionData = pNextAction (16
;             bit), not equal -> advance past the command (4 bytes), so several consecutive 0x20 form a jump table
;             after 0x1D. dialogOptionsAnswer is zeroed in fDialog_DialogHandler at the start of a dialog (hence the
;             result 0 for dialogs without options).
; @case       $20; 4 byte(s) including the opcode
; @param      nAnswer  byte: Option number (from 0) compared with strcDialogDisplay.dialogOptionsAnswer ($7E:018F) -
;             the answer chosen in the last dialog with options. 0..4 in scripts.
; @param      pNextAction  word: Low 16 bits of the address of the command to jump to when the chosen option ==
;             nAnswer.
; @see        fAIAction0x20_JumpIfChoice
; @confidence high
; @modifies   ptrAIActionData, strcDialogDisplay.dialogOptionsAnswer, strcVariables.n8Temp1
;;
macro AICMD0x20_JumpIfChoice(nAnswer, pNextAction)
    db $20
    db <nAnswer>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Adds n8Value (signed) to the byte at pAddress, saturating to the range 0..255.
; @details    Loads the byte [pAddress] as 0..255, adds the sign-extended 16-bit n8Value; when the result is negative
;             (bit 15) it stores 0, when >= $FF it stores $FF, otherwise the result. 8-bit write to [pAddress]. Does
;             not block.
; @case       $21; 5 byte(s) including the opcode
; @param      pAddress  long: 24-bit address of the byte being modified (in scripts e.g. nPowerBerryEaten, $800917 =
;             strcPlayerData.stamina, $8009A2).
; @param      n8Value  byte: SIGNED value (-128..127) added to the byte: the handler sign-extends it to 16 bits
;             (BPL/ORA $FF00).
; @see        fAIAction0x21_AddValue8
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n16Temp1
; @note       The macro describes the argument as n8Value without noting that it is signed - this should be added to
;             the comment in commands.asm.
;;
macro AICMD0x21_AddValue8(pAddress, n8Value)
    db $21
    dl <pAddress>
    db <n8Value>
    
endmacro

;;
; @brief      Enables random wandering for the current NPC within a rectangular area around its current position.
; @details    Stores the arguments to fields +$09,+$0A,+$0B,+$05,+$06,+$36,+$07,+$08 of the AI object. Sets +$01 |=
;             $28: bit $08 enables wandering (fAI_UpdateSlotWander), bit $20 enables automatic movement
;             (fAI_UpdateSlotStepMove adds the velocity +$03/+$04 to posX/posY every +$05 frames).
; @case       $22; 7 byte(s) including the opcode
; @param      nRangeX  byte: Maximum horizontal deviation from the starting point (stored to +$09).
; @param      nRangeY  byte: Maximum vertical deviation from the starting point (stored to +$0A), used for directions
;             0/1.
; @param      nStepDelay  byte: Number of frames between consecutive 1 px steps (stored to +$0B, +$05 and +$06 -
;             period and counter in fAI_UpdateSlotStepMove).
; @param      pNextAction  word: Low 16 bits of the pointer to the sprite table in bank $B3 (stored to +$36, bank $B3
;             hardcoded) - the walking animation sprite table, used after a direction is chosen (label12 in
;             fAI_UpdateSlotWander).
; @param      nSegmentLen  byte: Number of steps taken in one chosen direction before a new choice is made (stored to
;             +$07 and +$08; +$07 = reload value, +$08 = counter).
; @see        fAIAction0x22_StartRandomWalk
; @confidence medium
; @modifies   ptrAIActionData
; @note       The interpretation of the arguments comes from analysis of the fields in
;             fAI_UpdateSlotMovementAndObject/8483CC/848331 (probable, not tested in emulation). The exact role of
;             +$0F (preferred direction 1/2/4/8) and of flag bit $80 (skips the bounds check) is not determined.
;;
macro AICMD0x22_StartRandomWalk(nRangeX, nRangeY, nStepDelay, pNextAction, nSegmentLen)
    db $22
    db <nRangeX>
    db <nRangeY>
    db <nStepDelay>
    dw <pNextAction>&$FFFF
    db <nSegmentLen>
    
endmacro

;;
; @brief      Sets bit nIndex in the 16-bit word at nAddress (OR with aAISetMask[nIndex]).
; @details    The handler assembles a 24-bit pointer in $72-$74, fetches the mask from aAISetMask[nIndex*2] into
;             n16Temp1, and performs a 16-bit [addr] |= mask. Does not block.
; @case       $23; 5 byte(s) including the opcode
; @param      nAddress  long: 24-bit address of a 16-bit word (in scripts strcFlags.daily1-5, event*, unknown1, etc.).
; @param      nIndex  byte: Bit number 0-15 to set (index into aAISetMask: mask = 1<<nIndex).
; @see        fAIAction0x23_OrWithIndexedValue
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n16Temp1
;;
macro AICMD0x23_OrWithIndexedValue(nAddress, nIndex)
    db $23
    dl <nAddress>
    db <nIndex>
    
endmacro

;;
; @brief      Sets the target color palette (smooth transition) to the set with the given index, unless it is already
;             evening.
; @details    The handler advances ptrAIActionData by 1, reads a byte and calls fPalette_SetNextHourPalette, then
;             advances the pointer by 1 (2 bytes in total). The routine stores the index in strcPalette.nextHourIdx,
;             clears strcPalette.countDown and sets ptrPaletteNext ($7E:0004, ptr24): if nCurrentTimeID >= $12 (18:00
;             or later) it points to the constant night palette in RAM $7F:0B00, otherwise to aPalettes[index].
; @case       $24; 2 byte(s) including the opcode
; @param      nNextHourPalette  byte: Index of the target palette set, passed in A to fPalette_SetNextHourPalette and
;             stored in strcPalette.nextHourIdx ($7E:017C).
; @see        fAIAction0x24_NextHourPalette
; @confidence high
; @modifies   strcPalette.nextHourIdx, strcPalette.countDown, ptrPaletteNext, nCurrentTimeID, ptrAIActionData
; @note       What exactly the value $74 (an entry in aPalettes) is used for - the table contents were not checked.
;             The field name nextHourIdx suggests a 'next hour' palette, but the code uses it only as an index when
;             nCurrentTimeID < $12.
;;
macro AICMD0x24_NextHourPalette(nNextHourPalette)
    db $24
    db <nNextHourPalette>
    
endmacro

;;
; @brief      Deactivates the AI slot with the given number and removes its game object (sprite) from the map.
; @details    The handler saves the current ptrAIUnknown0xCC in ptrTemp0x72, advances ptrAIActionData by 1, reads a
;             byte and calls fAI_SelectSlot (ptrAIUnknown0xCC = $7E:B586 + n*64).
; @case       $25; 2 byte(s) including the opcode
; @param      nActorIndex  byte: Number of the AI slot (64-byte strcAIUnknown structures at $7E:B586 + n*64) to be
;             removed.
; @see        fAIAction0x25_RemoveActor
; @confidence high
; @modifies   ptrAIUnknown0xCC, ptrTemp0x72, strcObject.gameObjectIdx, strcGameObject.initailized, ptrAIActionData
; @note       The call to fObject_Destroy contains a known bug (a jump to fObject_ReturnLong instead of RTL) - it does
;             not affect the command. It was not checked what happens to the other slot fields (they are not cleared).
;;
macro AICMD0x25_RemoveActor(nActorIndex)
    db $25
    db <nActorIndex>
    
endmacro

;;
; @brief      Alias of opcode 0x28 (clear bit) - in the aAIActions table the entry 0x26 points to
;             fAIAction0x28_ClearBit.
; @details    The aAIActions table entries for 0x26 and 0x27 are identical to the one for 0x28 (84946B-84946F:
;             fAIAction0x28_ClearBit three times), so a $26 byte would execute exactly ClearBit. However, the macro
;             AICMD0x26 emits the byte $28, not $26, and is not used anywhere in the US scripts.
; @case       $26 (the macro emits $28: the table entry for $26 points to the same handler); 5 byte(s) including the
;             opcode
; @param      pAddress  long: 24-bit address of a 16-bit word in RAM in which a bit is cleared (the macro calls it
;             nUnknown1).
; @param      nBitIndex  byte: Bit number 0-15 (index into aAIResetMask, the macro calls it nUnknown2).
; @see        fAIAction0x28_ClearBit
; @confidence high
; @modifies   ptrTemp0x72, strcVariables.n16Temp1, ptrAIActionData
; @note       The macro AICMD0x26 should emit db $26 (or be removed/made an alias of 0x28). The original game most
;             likely does not use this opcode.
;;
macro AICMD0x26_ClearBitAs0x28(pAddress, nBitIndex)
    db $28
    dl <pAddress>
    db <nBitIndex>
    
endmacro

;;
; @brief      Alias of opcode 0x28 (clear bit) - in the aAIActions table the entry 0x27 points to
;             fAIAction0x28_ClearBit.
; @details    Like 0x26: the table entry points to fAIAction0x28_ClearBit, the macro AICMD0x27 emits the byte $28
;             instead of $27 and there are no uses in the US scripts.
; @case       $27 (the macro emits $28: the table entry for $27 points to the same handler); 5 byte(s) including the
;             opcode
; @param      pAddress  long: 24-bit address of a 16-bit word in RAM in which a bit is cleared (the macro calls it
;             nUnknown1).
; @param      nBitIndex  byte: Bit number 0-15 (index into aAIResetMask, the macro calls it nUnknown2).
; @see        fAIAction0x28_ClearBit
; @confidence high
; @modifies   ptrTemp0x72, strcVariables.n16Temp1, ptrAIActionData
; @note       The macro AICMD0x27 should emit db $27 (or be removed). The original game most likely does not use this
;             opcode.
;;
macro AICMD0x27_ClearBitAs0x28(pAddress, nBitIndex)
    db $28
    dl <pAddress>
    db <nBitIndex>
    
endmacro

;;
; @brief      Clears a single bit (0-15) in the 16-bit word at the given RAM address.
; @details    The handler reads the 16-bit address and the bank byte into ptrTemp0x72 (ptr24), then the index byte,
;             fetches the mask from aAIResetMask and performs [ptrTemp0x72] = [ptrTemp0x72] AND mask (16-bit). It
;             advances ptrAIActionData by 5 bytes in total.
; @case       $28; 5 byte(s) including the opcode
; @param      pAddress  long: 24-bit address of a 16-bit word in RAM (in scripts e.g. strcFlags.unknown1 or $8000D2 =
;             strcPlayer.flags via the bank $80 mirror).
; @param      nBitIndex  byte: Bit number 0-15 to clear; the handler indexes aAIResetMask ($84:94F3, words
;             $FFFE,$FFFD,...,$7FFF) by nBitIndex*2.
; @see        fAIAction0x28_ClearBit
; @confidence high
; @modifies   ptrTemp0x72, strcVariables.n16Temp1, ptrAIActionData
; @note       No remarks about the format. The macro should have the arguments pAddress, nBitIndex (currently
;             nUnknown2).
;;
macro AICMD0x28_ClearBit(pAddress, nBitIndex)
    db $28
    dl <pAddress>
    db <nBitIndex>
    
endmacro

;;
; @brief      Starts automatic camera scrolling at the given X/Y speed for the given number of frames.
; @details    The handler stores three values in strcMapScrool (speedX, speedY, timer) and advances the pointer by 6
;             bytes. It does not block - the script usually calls Wait(n) of the same length afterwards.
; @case       $29; 6 byte(s) including the opcode
; @param      nMapSpeedX  word: Horizontal camera scroll speed (signed 16-bit number, added to strcCamera.cameraX
;             every frame).
; @param      nMapSpeedY  word: Vertical camera scroll speed (signed, added to strcCamera.cameraY every frame).
; @param      nMapTimer  byte: Number of scroll frames (strcMapScrool.timer, $7E:0880). 16, 48, 64, 240 in scripts.
; @see        fAIAction0x29_SetMapScroll
; @confidence high
; @modifies   strcMapScrool.speedX, strcMapScrool.speedY, strcMapScrool.timer, ptrAIActionData
;;
macro AICMD0x29_SetMapScrolling(nMapSpeedX, nMapSpeedY, nMapTimer)
    db $29
    dw <nMapSpeedX>
    dw <nMapSpeedY>
    db <nMapTimer>
    
endmacro

;;
; @brief      Starts a sequence of map tile changes (pointer ptrUnknown0xCF) and ends the current script frame.
; @details    The handler reads a word and calls fTileScript_Start ($81:A5E1): ptrUnknown0xCF ($7E:00CF) =
;             pTileScriptTable[index], and clears the delay counter $7E:0989. It advances ptrAIActionData by 3 and
;             increments the slot's strcAIUnknown+$10 counter by 1, which ends script execution in this frame (resumed
;             in the next one).
; @case       $2A; 3 byte(s) including the opcode
; @param      nSequenceIndex  word: Index into the table of 24-bit pointers pTileScriptTable ($81:B963, 3 bytes per
;             entry); it points to a sequence of map tile changes.
; @see        fAIAction0x2A_StartTileSequence
; @confidence medium
; @modifies   ptrUnknown0xCF, ptrAIActionData
; @note       It was not determined what exactly the sequences $41/$43/$45 change (the contents of pTileScriptTable
;             and fSetTileAtCoords were not analyzed). The name is based on the behavior of the records (tile X/Y), so
;             only probable.
;;
macro AICMD0x2A_StartTileSequence(nSequenceIndex)
    db $2A
    dw <nSequenceIndex>
    
endmacro

;;
; @brief      Sets the appearance (sprite table from bank $B3 and direction) of the current AI slot and marks it for
;             game object creation.
; @details    The handler stores the pointer in slot +$33, the byte in slot +$02, sets bits $03 in the slot flag +$01
;             (bit $01 active, bit $02 = create object), calls fAI_LoadSlotSpriteFromDirTable with ptrTemp0x72 =
;             $B3:pointer, which selects the entry nDataIndex*3: word -> +$16 (sprite table index), byte*64 -> +$14.
;             It increments the +$10 counter (end of script frame) and advances the pointer by 4 bytes.
; @case       $2B; 4 byte(s) including the opcode
; @param      pPointerB3  word: Lower 16 bits of the address of the sprite data table in bank $B3 (the bank is
;             hardcoded to $B3).
; @param      nDataIndex  byte: Direction/index of the table entry (AI slot +$02, nDataIndex).
; @see        fAIAction0x2B_SpawnActor
; @confidence medium
; @modifies   ptrAIUnknown0xCC, ptrTemp0x72, ptrAIActionData
; @note       Full meaning of the values from the table (word +$16 and byte +$14*64) - probably the sprite table index
;             and attributes/flip, not verified in the data file.
;;
macro AICMD0x2B_SpawnActor(pPointerB3, nDataIndex)
    db $2B
    dw <pPointerB3>&$FFFF
    db <nDataIndex>
    
endmacro

;;
; @brief      Plays a sound effect (audio registers 114/115), waits the given number of frames and restores the tool
;             sound.
; @details    The handler advances the pointer by 1, pushes a byte and two words onto the stack, calls
;             fAudio_PlaySoundEffectAndWait: it stores reg114/reg115, sets strcAudio.index =
;             nSoundEffectSampleTable[strcAudio.unk118]+1, calls fAudio_PrepareSoundEffectSample (if
;             strcAudio.list[index] != 0 it sends data to the APU via fAudio_FreeSamplesFromSlot) and
;             fAudioSetRegister2to0A (reg116 = $0A), and then BLOCKS for nWaitFrames NMI frames (this wait halts the
;             whole engine, called from inside the handler).
; @case       $2C; 6 byte(s) including the opcode
; @param      nSoundId  byte: Goes to A in fAudio_PlaySoundEffectAndWait and to strcAudio.reg114 ($7E:0114) - probably
;             the sound effect id.
; @param      nSoundParam  word: Goes to X; only the low byte is stored in strcAudio.reg115 ($7E:0115) (6 or 7 in
;             scripts - the same values as the first byte of the entries in nToolSoundTable).
; @param      nWaitFrames  word: Goes to Y; fAudio_PlaySoundEffectAndWait waits this many NMI frames
;             (fCore_WaitForNMITimes).
; @see        fAIAction0x2C_PlaySoundWait
; @confidence medium
; @modifies   strcAudio.reg114, strcAudio.reg115, strcAudio.reg116, strcAudio.index, strcAudio.list, strcAudio.unk118
; @note       The exact meaning of reg114 vs reg115 (sound id / category) was not confirmed in the SPC code; the
;             function itself (sound effect + waiting) is certain. It is not known why the tool sound is played after
;             the sound (probably a reset of the strcAudio.toolId state).
;;
macro AICMD0x2C_PlaySoundWait(nSoundId, nSoundParam, nWaitFrames)
    db $2C
    db <nSoundId>
    dw <nSoundParam>
    dw <nWaitFrames>
    
endmacro

;;
; @brief      Single-frame interaction test: if the player pressed A near this character, jumps to one of two
;             addresses, otherwise proceeds to the next command.
; @details    Preconditions (any one failing => the no-jump path): slot AI byte +$0C != 0; the player action is not
;             USINGTOOL/SHOWTOOL/WHISTLEHORSE/WHISTLEDOG; no PFLAGS_EATINGMEAL; (strcFlags.daily4 AND $0006) == 0;
;             strcJoypad1.newInput has the A bit.
; @case       $2D; 5 byte(s) including the opcode
; @param      pNextAction1  word: Jump address (16-bit, same script bank) used when the player pressed A near this
;             slot and is NOT holding an item (or the player action != PACTION_DROPITEM).
; @param      pNextAction2  word: Jump address used when the player action == PACTION_DROPITEM ($05) and
;             strcPlayerData.carryItemId != 0 (the player is holding an item); in that case carryItemId is copied to
;             carryItemIdPrev ($7E:091E).
; @see        fAIAction0x2D_JumpOnInteract
; @confidence high
; @modifies   ptrAIUnknown0xCC, ptrAIActionData, strcPlayer.action, strcPlayer.flags, strcPlayer.direction,
;             strcFlags.daily4
; @note       The meaning of slot byte +$0C (probably a 'player is within interaction range' flag, set outside this
;             command - e.g. by command 0x4D) and of the daily4 bits $0002/$0004 was not determined. The value
;             nPlayerInteractionIndex $56 (dialog/NPC interaction handling) was not traced.
;;
macro AICMD0x2D_JumpOnInteract(pNextAction1, pNextAction2)
    db $2D
    dw <pNextAction1>&$FFFF
    dw <pNextAction2>&$FFFF
endmacro

;;
; @brief      Enables random wandering (animals/NPCs) for the current AI slot around its current position, which
;             becomes the home point.
; @details    The handler writes the arguments into the slot: nStepFrames -> +$0B/+$05/+$06, pointer -> +$36,
;             nStepLength -> +$07/+$08; sets bits $A8 ($80,$20,$08) in flag +$01 and copies the current position
;             (+$1A,+$1C) to the home point (+$1E,+$20). It advances ptrAIActionData by 5 bytes, does not block and
;             does not increment the +$10 counter.
; @case       $2E; 5 byte(s) including the opcode
; @param      nStepFrames  byte: Written to slot +$0B, +$05 and +$06: the period (in frames) of a movement step -
;             counter +$06 counts down in fAI_UpdateSlotStepMove and after reaching zero is reloaded from +$05.
; @param      pPointerB3  word: Lower 16 bits of the address of the sprite table in bank $B3, stored in slot +$36 -
;             the table used during movement (when stopped, the table from +$33 is used, set by 0x2B/0x2F).
; @param      nStepLength  byte: Written to slot +$07 and +$08: the length of one random walk in steps (reloaded from
;             +$07 to +$08).
; @see        fAIAction0x2E_StartWander
; @confidence medium
; @modifies   ptrAIUnknown0xCC, ptrAIActionData
; @note       Certain: the field writes and the setting of the $A8 flags.
;;
macro AICMD0x2E_StartWander(nStepFrames, pPointerB3, nStepLength)
    db $2E
    db <nStepFrames>
    dw <pPointerB3>&$FFFF
    db <nStepLength>
    
endmacro

;;
; @brief      Changes the sprite table (animation) of the current AI slot while preserving the current direction, and
;             marks the sprite for refresh.
; @details    The handler stores the pointer in slot +$33, calls fAI_LoadSlotSpriteFromDirTable with ptrTemp0x72 =
;             $B3:pointer (selects the entry according to the direction from +$02: word -> +$16, byte*64 -> +$14) and
;             sets bit $04 in flag +$01, which at the next fAI_UpdateSlotMovementAndObject calls fObject_Replace
;             (sprite refresh, if +$16 != +$18).
; @case       $2F; 3 byte(s) including the opcode
; @param      pPointerB3  word: Lower 16 bits of the address of the sprite table in bank $B3 (the bank is hardcoded to
;             $B3).
; @see        fAIAction0x2F_SetActorSpriteTable
; @confidence medium
; @modifies   ptrAIUnknown0xCC, ptrTemp0x72, ptrAIActionData
; @note       The contents of the aAIScriptingData_L* tables were not verified. The name follows from the operation on
;             fields +$33/+$16/+$14.
;;
macro AICMD0x2F_SetActorSpriteTable(pPointerB3)
    db $2F
    dw <pPointerB3>&$FFFF
endmacro

;;
; @brief      One tick of the chicken logic: synchronizes the position with the chicken structure, handles being
;             picked up by the player and random behaviors.
; @details    The handler advances ptrAIActionData by 1 (the next command is usually a Jump back - a loop, one frame
;             per pass). The chicken index = slot byte +$3F (nArg) minus $24; fGameEngine_GetChickenData returns a
;             ptr24 to the chicken data ($7E:C286 + n*8) and the slot X/Y positions (+$1A/+$1C) are copied to its
;             fields +4/+6.
; @case       $30; 1 byte(s) including the opcode
; @see        fAIAction0x30_UpdateChicken
; @confidence medium
; @modifies   strcStockData.unkEachChicken, strcPlayerData.carryItemId, strcPlayerData.nAiArg,
;             nPlayerInteractionIndex, nCowSalePrice, strcFlags.daily1
; @note       Full meaning of the chicken flag bits ($40,$20,$08,$04,$02) and of the value $E0 in +$0E; the meaning of
;             carryItemId $25/$26 (missing from the CITEM enum; probably chick and chicken). The role of subscripts
;             $5C/$5D (general list 0) was not checked.
;;
macro AICMD0x30_UpdateChicken()
    db $30
    
endmacro

;;
; @brief      One tick of the cow logic: synchronizes the position with the cow structure, handles feeding, milking,
;             picking up and dialogs.
; @details    The handler advances ptrAIActionData by 1 (the command appears in a loop with Jump). The cow index =
;             slot byte +$3F minus $18; fGameEngine_GetCowData returns a ptr24 to the cow data ($7E:C1C6 + n*16), and
;             the slot X/Y positions are copied to fields +8/+$0A.
; @case       $31; 1 byte(s) including the opcode
; @see        fAIAction0x31_UpdateCow
; @confidence medium
; @modifies   strcStockData.unkEachCow, strcNames.wCurrentCow, strcMap.loadAreaId, strcPlayerData.carryItemId,
;             nPlayerInteractionIndex, strcFlags.daily1
; @note       The procedure is approx. 1900 lines long and was not traced in full: the exact meaning of the individual
;             day flags daily1, the cow data bits and the +$0E values ($C2,$E0,$E1) is uncertain. The description
;             covers only the main paths, hence probable.
;;
macro AICMD0x31_UpdateCow()
    db $31
    
endmacro

;;
; @brief      Writes a 16-bit constant to an arbitrary RAM address (the word counterpart of 0x47 SetValue8).
; @details    The handler loads the lower 16 bits of the address and the bank into ptrTemp0x72, then the value word,
;             and performs STA [ptrTemp0x72]. It advances ptrAIActionData by 6 bytes.
; @case       $32; 6 byte(s) including the opcode
; @param      pAddress  long: 24-bit address of a 16-bit word in RAM ($8000D4 = strcPlayer.action via the bank $80
;             mirror, or strcFlags.unknown1, in scripts).
; @param      nValue  word: 16-bit value written to the address (e.g.
; @see        fAIAction0x32_SetValue16
; @confidence high
; @modifies   ptrTemp0x72, ptrAIActionData
; @note       None - the format fully matches the macro. For strcFlags.unknown1 the values $F7FF/$FFDF look like
;             masks, but the command simply stores them (not AND), so the script probably sets the whole word.
;;
macro AICMD0x32_SetValue16(pAddress, nValue)
    db $32
    dl <pAddress>
    dw <nValue>
    
endmacro

;;
; @brief      One tick of the mole logic: lets the player pick it up, otherwise periodically starts its appearance
;             subscript at random.
; @details    The handler advances ptrAIActionData by 1 (usually a loop with Jump).
; @case       $33; 1 byte(s) including the opcode
; @see        fAIAction0x33_UpdateMole
; @confidence medium
; @modifies   strcStockData.unkMole, strcPlayerData.carryItemId, strcPlayerData.nAiArg, strcPlayer.action,
;             strcPlayer.flags, strcPlayer.lastRandomNumber
; @note       No CITEM enum entry for $29 (judging by the handler name probably a mole). The role of subscript $81 in
;             slot $11 was not traced (probably the mole emerging/hiding).
;;
macro AICMD0x33_UpdateMole()
    db $33
    
endmacro

;;
; @brief      One tick of a simple item actor: after A is pressed, a player not holding an item picks it up
;             (carryItemId = 7) and the actor disappears.
; @details    The handler advances ptrAIActionData by 1 (in its only use, B38FFD, it sits in a Jump loop).
; @case       $34; 1 byte(s) including the opcode
; @see        fAIAction0x34_PickUpFish
; @confidence medium
; @modifies   strcPlayerData.carryItemId, strcPlayerData.nAiArg, strcPlayer.action, strcFlags.daily4,
;             strcJoypad1.newInput, ptrAIActionData
; @note       The code uses the name !EITEM_POTATOSEED (from the equipped items enum) but writes to carryItemId, where
;             $07 is CITEM_FISH - most likely a naming error in the source and the actor is a fish (the only use: an
;             actor created by command 0x1A at (0x268,0x178) with aAIScriptingData_L127, probably a fish).
;;
macro AICMD0x34_UpdatePickup()
    db $34
    
endmacro

;;
; @brief      One tick of the horse logic: periodic random behaviors of the foal or adult horse, mounting, following
;             the player.
; @details    The handler advances ptrAIActionData by 1 (a loop with Jump, 3 uses in B3), clears strcFlags.daily2
;             $0010. If nHorseAge ($7F:1F32) != $15: the counter strcStockData.unkHorse ($7E:0939) grows to $78, then
;             is cleared and calls fAI_SetSlotScript(A=$17, X=0, Y=$80) - the foal subscript; the rest is skipped.
; @case       $35; 1 byte(s) including the opcode
; @see        fAIAction0x35_UpdateHorse
; @confidence medium
; @modifies   nHorseAge, strcStockData.unkHorse, strcFlags.daily2, strcFlags.daily4, strcPlayer.action,
;             strcPlayer.flags
; @note       Only the main paths of the procedure are described (approx. 500 lines of spaghetti). Uncertain: the
;             exact meaning of the daily2 flags ($0020 - mounting, $0040, $0400 - call, $0800) and of the value
;             nHorseAge == $15 (probably 'adult'; nHorseAge is 16-bit according to ram.asm, while the code reads 8
;             bits).
;;
macro AICMD0x35_UpdateHorse()
    db $35
    
endmacro

;;
; @brief      One tick of the dog logic: copies the AI slot position to nDogX/nDogY, handles hugging/picking up the
;             dog, random idle behaviors and running to the player after a whistle.
; @details    The handler advances ptrAIActionData by 1 (the next command is usually a Jump back to UpdateDog - see
;             B38DAC/B38DAD, so a loop). It copies the AI slot words ([ptrAIUnknown0xCC]+0x1A and +0x1C) to
;             nDogX/nDogY.
; @case       $36; 1 byte(s) including the opcode
; @see        fAIAction0x36_UpdateDog
; @confidence medium
; @modifies   ptrAIActionData, ptrAIUnknown0xCC, nDogX, nDogY, nDogHugs, strcStockData.unkDog
; @note       The meaning of the bits of state $7F1F58 (probably: 1=standing, 2=sitting/lying etc.), of the subscript
;             indices $3C-$49, $3F and of slot bytes +0x08/+0x0C/+0x0F is not determined without analyzing the
;             subscripts in B38xxx. It is not known whether byte +0x0C means 'the dog can be picked up' (inference
;             only).
;;
macro AICMD0x36_UpdateDog()
    db $36
    
endmacro

;;
; @brief      Removes/deactivates the game object associated with the AI slot (index from slot field +0x12).
; @details    Advances the pointer by 1, loads the word [ptrAIUnknown0xCC]+0x12 into strcObject.gameObjectIdx and
;             calls fObject_Destroy. That routine determines the object offset from aGameObjectIndexOffsets, checks
;             the components (fObject_CheckComponentsPending), releases them (fObject_ReleaseSpriteTiles ->
;             fObject_ReleaseTileSlot decrements the counter at $7EA320+idx*4) and clears strcGameObject.initailized.
; @case       $37; 1 byte(s) including the opcode
; @see        fAIAction0x37_RemoveObject
; @confidence medium
; @modifies   ptrAIActionData, ptrAIUnknown0xCC, strcObject.gameObjectIdx, strcObject.gameObjectIdxOffs,
;             strcObject.bankAddress, strcGameObject.initailized
; @note       The exact semantics of fObject_Destroy (e.g. the path with strcObject.bankAddress != 0 jumps to a
;             different RTL - a comment in the code points to a bug) and what type of object is in slot +0x12
;             (NPC/animal sprite).
;;
macro AICMD0x37_RemoveObject()
    db $37
    
endmacro

;;
; @brief      Blocks the script until the flag daily1 $8000 is set (screen fully brightened after fade-in).
; @details    If strcFlags.daily1 & $8000 != 0, it advances the pointer by 1 and finishes (the script proceeds).
;             Otherwise it does NOT advance the pointer (the command is executed again in the next frame) and only
;             increments the byte/word [ptrAIUnknown0xCC]+0x10.
; @case       $38; 1 byte(s) including the opcode
; @see        fAIAction0x38_WaitForFadeIn
; @confidence high
; @modifies   strcFlags.daily1, ptrAIActionData, ptrAIUnknown0xCC
; @note       The name of slot field +0x10 (script frame counter?) is not confirmed.
;;
macro AICMD0x38_WaitForFadeIn()
    db $38
    
endmacro

;;
; @brief      Simulates pressing a direction (pad) for the given number of frames and waits until it elapses; the
;             player walks.
; @details    Input 1 (when PFLAGS_AISTEERING in strcPlayer.flags is clear): ORs the pad mask from the table into
;             strcAiControlData.input, writes nAmount to strcAiControlData.counter, moves the pointer back to the
;             start of the command (the command repeats), increments [+0x10] of the slot and sets PFLAGS_AISTEERING
;             (fInput_AIJoypadHandler reads strcAiControlData.input).
; @case       $39; 4 byte(s) including the opcode
; @param      nInputIndex  byte: Index into aAIJoypadInput ($84B4D2): 0=DOWN($0400), 1=UP($0800), 2=RIGHT($0100),
;             3=LEFT($0200), 4=B($8000); enums !AIINPUT_*.
; @param      nAmount  word: Duration in frames (counter strcAiControlData.counter); the input is active for approx.
;             nAmount+1 handler calls.
; @see        fAIAction0x39_WalkForTime
; @confidence high
; @modifies   ptrAIActionData, ptrAIUnknown0xCC, strcAiControlData.input, strcAiControlData.counter, strcPlayer.flags,
;             strcPlayer.action
; @note       Whether the input is taken into account in the initialization frame depends on the order in the main
;             loop (not investigated). There is no validation of nInputIndex.
;;
macro AICMD0x39_WalkForTime(nInputIndex, nAmount)
    db $39
    db <nInputIndex>
    dw <nAmount>
    
endmacro

;;
; @brief      Like 0x39, but additionally presses B (run).
; @details    Identical logic to 0x39, with the difference that during initialization the mask from table index 4 (X=8
;             -> $8000 = JOYPAD_B) is also ORed into strcAiControlData.input. The same PFLAGS_AISTEERING + counter
;             mechanism; on completion the input is cleared, action=PACTION_NONE and the pointer is advanced by 4.
; @case       $3A; 4 byte(s) including the opcode
; @param      nInputIndex  byte: As in 0x39: direction index into aAIJoypadInput (!AIINPUT_*).
; @param      nAmount  word: Duration in frames (strcAiControlData.counter).
; @see        fAIAction0x3A_RunForTime
; @confidence high
; @modifies   ptrAIActionData, ptrAIUnknown0xCC, strcAiControlData.input, strcAiControlData.counter, strcPlayer.flags,
;             strcPlayer.action
;;
macro AICMD0x3A_RunForTime(nInputIndex, nAmount)
    db $3A
    db <nInputIndex>
    dw <nAmount>
    
endmacro

;;
; @brief      Sets the carried item and the PFLAGS_HOLDINGITEM flag (the player carries an item without a pick-up
;             animation).
; @details    Loads the argument byte into strcPlayerData.carryItemId, advances the pointer by 2 and sets the bit
;             PFLAGS_HOLDINGITEM ($0002) in strcPlayer.flags. Unlike 0x3E it does not change strcPlayer.action.
; @case       $3B; 2 byte(s) including the opcode
; @param      nCarryItemId  byte: Id of the carried item stored in strcPlayerData.carryItemId ($091D).
; @see        fAIAction0x3B_SetCarryItemHolding
; @confidence medium
; @modifies   ptrAIActionData, strcPlayerData.carryItemId, strcPlayer.flags
; @note       No names for carried item ids other than NONE/FISH. The name 'without animation' is an inference from
;             the difference relative to 0x3E (action ITEMONHAND).
;;
macro AICMD0x3B_SetCarryItemHolding(nCarryItemId)
    db $3B
    db <nCarryItemId>
    
endmacro

;;
; @brief      Teleports the player home (nDestinationAreaId=$15=AREA_HOUSE1) with the forced teleport flag and sets
;             the flag daily4 $0020.
; @details    Advances the pointer by 1, writes $15 (AREA_HOUSE1) to nDestinationAreaId ($098B), ORs $4000
;             (AFLAGS_FORCETELEPORT) into strcDialogDisplay.mapFlags and sets strcFlags.daily4 |= $0020. The flag
;             daily4 $0020 is read in bank_83 code when selecting an AI script (%AIExecute($0000,$000A,3) vs another
;             one) - it indicates 'day ended / returned home from an event'.
; @case       $3C; 1 byte(s) including the opcode
; @see        fAIAction0x3C_TeleportToHouse
; @confidence medium
; @modifies   ptrAIActionData, nDestinationAreaId, strcDialogDisplay.mapFlags, strcFlags.daily4
; @note       The exact meaning of daily4 $0020 (the only reader: script selection in game_engine/map_engine around
;             83E30C) - the name 'TeleportToHouse' applies only to area $15.
;;
macro AICMD0x3C_TeleportToHouse()
    db $3C
    
endmacro

;;
; @brief      Sets the destination area and forces a teleport (AFLAGS_FORCETELEPORT).
; @details    Loads the byte into nDestinationAreaId, advances the pointer by 2 and ORs $4000 (AFLAGS_FORCETELEPORT)
;             into strcDialogDisplay.mapFlags; the actual map change happens in the map engine. It does not block.
; @case       $3D; 2 byte(s) including the opcode
; @param      nAreaId  byte: Map/area id (enum !AREA_*) stored in nDestinationAreaId ($098B).
; @see        fAIAction0x3D_TeleportToArea
; @confidence high
; @modifies   ptrAIActionData, nDestinationAreaId, strcDialogDisplay.mapFlags
;;
macro AICMD0x3D_TeleportToArea(nAreaId)
    db $3D
    db <nAreaId>
    
endmacro

;;
; @brief      Sets the carried item and starts the player action PACTION_ITEMONHAND (pose/picking up an item).
; @details    Loads the byte into strcPlayerData.carryItemId, advances the pointer by 2 and sets strcPlayer.action =
;             PACTION_ITEMONHAND ($0004). Differs from 0x3B in that it starts an action instead of setting
;             PFLAGS_HOLDINGITEM.
; @case       $3E; 2 byte(s) including the opcode
; @param      nCarryItemId  byte: Id of the carried item stored in strcPlayerData.carryItemId ($091D); values used
;             include $23,$06,$16,$14,$25,$17,$10,$11,$12,$13,$2D,$2C,$09.
; @see        fAIAction0x3E_PickUpCarryItem
; @confidence medium
; @modifies   ptrAIActionData, strcPlayerData.carryItemId, strcPlayer.action
; @note       The visual effect of PACTION_ITEMONHAND is inferred from the enum name, not from analysis of
;             fPlayerAction.
;;
macro AICMD0x3E_SetCarryItem(nCarryItemId)
    db $3E
    db <nCarryItemId>
    
endmacro

;;
; @brief      Sets the player action PACTION_DROPITEM (throwing/putting down the carried item).
; @details    Advances the pointer by 1 and writes strcPlayer.action = PACTION_DROPITEM ($0005). It does not clear
;             carryItemId itself - the player action engine does that.
; @case       $3F; 1 byte(s) including the opcode
; @see        fAIAction0x3F_ThrowHeldItem
; @confidence high
; @modifies   ptrAIActionData, strcPlayer.action
;;
macro AICMD0x3F_ThrowCarriedItem()
    db $3F
    
endmacro

;;
; @brief      Sets the flag strcFlags.daily2 $0008, which disables checking the object/tile under the player.
; @details    Advances the pointer by 1 and ORs $0008 into strcFlags.daily2. The flag is read e.g. in
;             fObjectEngine_GetObjectPropertyByDirSeason (before fObjectEngine_GetObjectAtCoords - when set, it skips
;             the object lookup at the coordinates).
; @case       $40; 1 byte(s) including the opcode
; @see        fAIAction0x40_DisableTileInteractions
; @confidence medium
; @modifies   ptrAIActionData, strcFlags.daily2
; @note       Not all readers of the flag nor the place where it is cleared were determined (the clearing fAI_*
;             routines only clear $0400 in daily2). The full list of effects is unknown.
;;
macro AICMD0x40_DisableTileInteractions()
    db $40
    
endmacro

;;
; @brief      Adds n16Value to the word at pAddress, saturating to the range 0..999.
; @details    Loads the address into ptrTemp0x72 (3 bytes) and the value into strcVariables.n16Temp1, performs [addr]
;             += value (16-bit). If the result is negative (bit 15) it stores 0; if >= $03E7 it stores $03E7 (999).
; @case       $41; 6 byte(s) including the opcode
; @param      pAddress  long: 24-bit address of a 16-bit word in memory (e.g. nLove_Ann, $80xxxx = WRAM mirror).
; @param      n16Value  word: Value to add (interpreted as signed, e.g. -2 = $FFFE).
; @see        fAIAction0x41_AddValue16
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n16Temp1
;;
macro AICMD0x41_AddValue16(pAddress, n16Value)
    db $41
    dl <pAddress>
    dw <n16Value>
    
endmacro

;;
; @brief      Adds n24Value to nMoney ($7F1F04) via fGameEngine_AddProfit; if the result is negative, sets the money
;             to zero.
; @details    The handler loads the address into ptrTemp0x72 and then loads the value into the same ptrTemp0x72
;             (24-bit), so the address from the command has no effect - the target is always nMoney. It calls
;             fGameEngine_AddProfit (83B1C9): adds the 24-bit value, upper limit 999999 ($0F423F), and on a negative
;             result returns A=1 without storing.
; @case       $42; 7 byte(s) including the opcode
; @param      pAddress  long: Read but ignored by the handler (ptrTemp0x72 is immediately overwritten with the value).
; @param      n24Value  long: Signed 24-bit amount added to the player's money (e.g. -2000, 1000, 2).
; @see        fAIAction0x42_AddValue24
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, nMoney
; @note       The interpretation of BEQ after JSL relies on REP #$20 not changing the Z flag (A=1 from AddProfit ->
;             clearing).
;;
macro AICMD0x42_AddValue24(pAddress, n24Value)
    db $42
    dl <pAddress>
    dl <n24Value>
    
endmacro

;;
; @brief      Jumps to pNextAction if the 16-bit word at pAddress equals n16Value.
; @details    Reads the address and the value, compares the 16-bit [pAddress] with the value. Equal: ptrAIActionData
;             (16-bit) = pNextAction.
; @case       $43; 8 byte(s) including the opcode
; @param      pAddress  long: 24-bit address of a 16-bit word to compare (e.g.
; @param      n16Value  word: Value to compare against (equality).
; @param      pNextAction  word: 16-bit jump target address in the current script bank (the bank is taken from
;             ptrAIActionData+2).
; @see        fAIAction0x43_JumpIfEqual16
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n16Temp1
;;
macro AICMD0x43_JumpIfEqual16(pAddress, n16Value, pNextAction)
    db $43
    dl <pAddress>
    dw <n16Value>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Jumps to pNextAction if the 24-bit value at pAddress equals n24Value.
; @details    Compares the 16-bit [pAddress] with the lower half, and then the byte [pAddress+2] with the highest
;             byte. Both equal: ptrAIActionData = pNextAction; otherwise advance by 2 (length 9).
; @case       $44; 9 byte(s) including the opcode
; @param      pAddress  long: 24-bit address of a 24-bit value (3 bytes in memory).
; @param      n24Value  long: Value to compare against (equality, bytes: word + bank).
; @param      pNextAction  word: 16-bit jump target address in the current script bank.
; @see        fAIAction0x44_JumpIfEqual24
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n16Temp1, strcVariables.n16Temp2
;;
macro AICMD0x44_JumpIfEqual24(pAddress, n24Value, pNextAction)
    db $44
    dl <pAddress>
    dl <n24Value>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Jumps to pNextAction if nMin <= [pAddress] <= nMax (16-bit unsigned).
; @details    Condition: [addr] >= nMin (BCC skips) and [addr] < nMax+1 (BCS skips). Satisfied: ptrAIActionData =
;             pNextAction; not satisfied: advance by 2 (length 10).
; @case       $45; 10 byte(s) including the opcode
; @param      pAddress  long: 24-bit address of a 16-bit word.
; @param      nMin  word: Lower bound, inclusive (unsigned comparison).
; @param      nMax  word: Upper bound, inclusive (the handler computes nMax+1 and tests value < nMax+1).
; @param      pNextAction  word: 16-bit jump target address in the current script bank.
; @see        fAIAction0x45_JumpIfBetween16
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n16Temp1, strcVariables.n16Temp2
; @note       With nMax = $FFFF, nMax+1 overflows to 0 and the jump never happens (edge case).
;;
macro AICMD0x45_JumpIfBetween16(pAddress, nMin, nMax, pNextAction)
    db $45
    dl <pAddress>
    dw <nMin>
    dw <nMax>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Jumps to pNextAction if nMin <= value24[pAddress] <= nMax.
; @details    24-bit comparison via CMP (word) + SBC (bank) with carry propagation, for the lower bound (BCC = less)
;             and for nMax+1 (BCS = greater/equal = no jump). Satisfied: ptrAIActionData = pNextAction; otherwise +2
;             (length 12).
; @case       $46; 12 byte(s) including the opcode
; @param      pAddress  long: 24-bit address of a 24-bit value (e.g. nMoney).
; @param      nMin  long: Lower bound, inclusive (24-bit unsigned comparison).
; @param      nMax  long: Upper bound, inclusive (the handler computes nMax+1).
; @param      pNextAction  word: 16-bit jump target address in the current script bank.
; @see        fAIAction0x46_JumpIfBetween24
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n16Temp1, strcVariables.n16Temp2, strcVariables.n16Temp3,
;             strcVariables.n16Temp4
; @note       With nMax = $FFFFFF, nMax+1 overflows (edge case, unused in scripts).
;;
macro AICMD0x46_JumpIfBetween24(pAddress, nMin, nMax, pNextAction)
    db $46
    dl <pAddress>
    dl <nMin>
    dl <nMax>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Writes the byte n8Value to the address pAddress.
; @details    Loads the address into ptrTemp0x72 (3 bytes), writes the argument byte with an 8-bit store via STA
;             [ptrTemp0x72], advances the pointer by 5. No limits/saturation.
; @case       $47; 5 byte(s) including the opcode
; @param      pAddress  long: 24-bit address of the target byte (e.g. nCurrentSeasonID, $80019A, $800921).
; @param      n8Value  byte: Value to store.
; @see        fAIAction0x47_SetValue8
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72
;;
macro AICMD0x47_SetValue8(pAddress, n8Value)
    db $47
    dl <pAddress>
    db <n8Value>
    
endmacro

;;
; @brief      Writes a 24-bit value to a 24-bit address (the n24 counterpart of 0x47 SetValue8).
; @details    The handler reads the address into ptrTemp0x72 (word + bank), then writes the value word with STA
;             [ptrTemp0x72] (16-bit) and the value bank byte with STA [ptrTemp0x72],Y with Y=2. It advances
;             ptrAIActionData by 1+2+1+2+1 = 7.
; @case       $48; 7 byte(s) including the opcode
; @param      pAddress  long: 24-bit target address (little endian, bank in the 3rd byte)
; @param      n24Value  long: 24-bit value written to [pAddress]: bytes 0-1 as a word, byte 2 as a byte at pAddress+2
; @see        fAIAction0x48_SetValue24
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72
; @note       The macro names both arguments nUnknown1/nUnknown2 - it should be (pAddress, n24Value). Not used in
;             scripts, so there is no practical confirmation.
;;
macro AICMD0x48_SetValue24(pAddress, n24Value)
    db $48
    dl <pAddress>
    dl <n24Value>
    
endmacro

;;
; @brief      Sets the sprite data table of the AI object and immediately selects the entry matching the player's
;             current direction (the 0x2B variant with index = strcPlayer.direction).
; @details    Writes pPointerB3 to the AI object +0x33. Writes the low byte of strcPlayer.direction to the object
;             +0x02 (nDataIndex).
; @case       $49; 3 byte(s) including the opcode
; @param      pPointerB3  word: 16-bit pointer (bank $B3) to a sprite/flip data table indexed by direction; stored in
;             the AI object +0x33 (pDataAddress)
; @see        fAIAction0x49_SetSpriteTableFacingPlayer
; @confidence medium
; @modifies   ptrAIActionData, ptrAIUnknown0xCC, strcPlayer.direction, ptrTemp0x72
; @note       The exact meaning of the +0x01 flag bits (0x03) is not fully established -
;             fAI_UpdateSlotMovementAndObject indicates that bit0 = object drawn/active, bit1/bit2 select the object
;             update variant. The name is a descriptive proposal.
;;
macro AICMD0x49_SetSpriteTableFacingPlayer(pPointerB3)
    db $49
    dw <pPointerB3>&$FFFF
endmacro

;;
; @brief      If the player stands next to the object and presses A (with empty hands), picks the object up -
;             deactivates it and gives the player the carried item id 8.
; @details    Advances the pointer by 1 and checks the conditions (any unmet condition exits with obj+0x10 += 1, i.e.
;             yields the frame): proximity flag obj+0x0C != 0 (set by fGameEngine_DirectionHandler83AD91 when the
;             player is within a radius of 0x19 px), the player action is not
;             USINGTOOL/SHOWTOOL/WHISTLEHORSE/WHISTLEDOG/17, strcPlayer.flags does not have bit 0x0004 (EATINGMEAL) or
;             DOGHUGGING, daily4 bits 0x0006 are cleared, strcJoypad1.newInput has A, strcPlayerData.carryItemId == 0.
; @case       $4A; 1 byte(s) including the opcode
; @see        fAIAction0x4A_PickUpObjectOnButtonA
; @confidence medium
; @modifies   ptrAIActionData, ptrAIUnknown0xCC, strcPlayer.action, strcPlayer.flags, strcFlags.daily4,
;             strcJoypad1.newInput
; @note       Item id 8 in carryItemId has no name in CITEM_* (only CITEM_FISH=7 exists); the macro uses
;             !EITEM_TURNIPSEED from a different space - should be fixed to a CITEM constant. What is physically
;             picked up (scripts B4 0x12 / WaterImp) has not been established.
;;
macro AICMD0x4A_PickUpObjectOnButtonA()
    db $4A
    
endmacro

;;
; @brief      Replaces a tile in the current object map (sCurrentObjectMap) at the given coordinates.
; @details    The handler pushes the tile, X, Y onto the stack, restores them to A/X/Y and calls
;             fMap_UpdateCurrentTilemap, which uses fObjectEngine_ConvertCoordsToOffset to compute the offset
;             (dependent on strcDialogDisplay.mapMultiWidth) and writes the byte to sCurrentObjectMap ($0009B6 +
;             offset). Does not block.
; @case       $4B; 6 byte(s) including the opcode
; @param      nTileId  byte: id of the tile written to the object map of the current area (e.g.
; @param      nPosX  word: X position in pixels (tile = 16 px, X>>4)
; @param      nPosY  word: Y position in pixels (Y & $FFF0 as the row)
; @see        fAIAction0x4B_ReplaceMapTile
; @confidence medium
; @modifies   ptrAIActionData, sCurrentObjectMap, strcDialogDisplay.mapMultiWidth
; @note       The exact semantics of sCurrentObjectMap (which layer/map) were not checked; the result depends on
;             mapMultiWidth set earlier (0x58 sets it to 4 and does not restore it).
;;
macro AICMD0x4B_ReplaceMapTile(nTileId, nPosX, nPosY)
    db $4B
    db <nTileId>
    dw <nPosX>
    dw <nPosY>
    
endmacro

;;
; @brief      Sets bit 0x02 in the AI object state byte (+0x00); the object no longer blocks the player in collision
;             detection.
; @details    Executes obj+0x00 |= 0x02. In fGameEngine_DirectionHandler83AD91 (player collision with AI objects) an
;             object with this bit still receives the proximity flag +0x0C = 1, but does not set n16Unk8C (movement
;             block marker), so the player can pass through it.
; @case       $4C; 1 byte(s) including the opcode
; @see        fAIAction0x4C_SetPassable
; @confidence medium
; @modifies   ptrAIActionData, ptrAIUnknown0xCC
; @note       The conclusion that it is 'non-blocking' comes from analysis of the fragment 83AE5B-83AE7F; other places
;             reading bit 0x02 of obj+0x00 were not verified.
;;
macro AICMD0x4C_SetPassable()
    db $4C
    
endmacro

;;
; @brief      Conditional jump: if the player is next to the object and used the Blue Feather (flag daily3 0x0040),
;             the object turns to face the player and the script jumps to pNextAction.
; @details    Conditions: obj+0x0C != 0 (player nearby), strcPlayer.action != USINGTOOL, strcFlags.daily3 & 0x0040
;             (set only by fToolUsedAction0x18_BlueFeather, cleared every frame in the AI loop). If not met - advances
;             the pointer by 3 (skips the address) and continues without yielding the frame.
; @case       $4D; 3 byte(s) including the opcode
; @param      pNextAction  word: jump address (same bank as the script), executed when the player used the Blue
;             Feather next to the object
; @see        fAIAction0x4D_JumpIfBlueFeatherUsed
; @confidence high
; @modifies   ptrAIActionData, ptrAIUnknown0xCC, strcPlayer.action, strcPlayer.direction, strcFlags.daily3
; @note       The meaning of the object bytes +0x03/+0x04/+0x07/+0x08 (probably NPC movement counters/direction) has
;             not been established.
;;
macro AICMD0x4D_JumpIfBlueFeatherUsed(pNextAction)
    db $4D
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      Clears flag daily2 0x0008 - restores tile interactions disabled by 0x40.
; @details    Executes UnsetFlag(daily2, 0x0008). This flag is set by 0x40 DisableTileInteractions and checked, among
;             others, in fObjectEngine_GetObjectPropertyByDirSeason (bank 82, handling of objects/tiles under the
;             cursor) and in sound.asm.
; @case       $4E; 1 byte(s) including the opcode
; @see        fAIAction0x4E_EnableTileInteractions
; @confidence high
; @modifies   ptrAIActionData, strcFlags.daily2
;;
macro AICMD0x4E_EnableTileInteractions()
    db $4E
    
endmacro

;;
; @brief      Sets flag daily4 0x8000, which blocks tool use with the Y button.
; @details    Executes SetFlag(daily4, 0x8000). The only consumer: fInput_SetPlayerAction0x0A (input.asm, 84CDBF) -
;             when the flag is set, pressing Y does not start the USINGTOOL action.
; @case       $4F; 1 byte(s) including the opcode
; @see        fAIAction0x4F_DisableToolUse
; @confidence high
; @modifies   ptrAIActionData, strcFlags.daily4
; @note       No place that clears bit 0x8000 of daily4 was found (probably a day/area reset).
;;
macro AICMD0x4F_DisableToolUse()
    db $4F
    
endmacro

;;
; @brief      Puts down whatever the player is carrying or hugging (item, chicken, dog) and resets the player sprite
;             to the direction.
; @details    When carryItemId == 0x25 or 0x26 (chicken): fetches the chicken data with index = nAiArg - 0x24
;             (fGameEngine_GetChickenData), sets chicken.mapID = 0x28, clears CHICKENSTATUS_HELDBYPLAYER (0x20),
;             writes the position from aGameEngine_AddChickenPositionsData[idx*4] (X, +0x10) and [idx*4+2] (Y), zeroes
;             carryItemId. For any other carried item: only zeroes carryItemId.
; @case       $50; 1 byte(s) including the opcode
; @see        fAIAction0x50_ReleaseCarried
; @confidence medium
; @modifies   ptrAIActionData, strcPlayerData.carryItemId, strcPlayerData.nAiArg, strcPlayer.flags,
;             strcPlayer.direction, strcObjectData.spriteIdx
; @note       nDogAreaId is filled with the byte from nCurrentSeasonID ($7F1F19) - either the RAM label is wrong, or
;             this is indeed an unusual assignment; to be verified. The chicken mapID value 0x28 is assumed to be the
;             chicken coop area id (not checked in the enums).
;;
macro AICMD0x50_ReleaseCarried()
    db $50
    
endmacro

;;
; @brief      Variant of 0x50: returns the chicken to the coop, removes carry 0x29 and lets go of the dog, but does
;             not touch other items and does not reset the player sprite.
; @details    carryItemId 0x25/0x26: same chicken handling as in 0x50 (mapID 0x28, clears flag 0x20, position from the
;             table, carryItemId = 0). carryItemId == 0x29: only zeroes carryItemId. Any other carried item: does
;             nothing. carryItemId == 0 and PFLAGS_DOGHUGGING: clears the flag, sets nDogAreaId/nDogX/nDogY as in
;             0x50.
; @case       $51; 1 byte(s) including the opcode
; @see        fAIAction0x51_ReleaseCarriedAnimal
; @confidence medium
; @modifies   ptrAIActionData, strcPlayerData.carryItemId, strcPlayerData.nAiArg, strcPlayer.flags, nDogAreaId, nDogX
; @note       What carryItemId 0x29 means (it is not in the CITEM enums) and why it is zeroed without changing the
;             sprite - not established. The name is a proposal.
;;
macro AICMD0x51_ReleaseCarriedAnimal()
    db $51
    
endmacro

;;
; @brief      Like 0x4A (picking up an object with the A button next to it), but instead of granting an item it sets
;             flag daily4 0x0002, which triggers an event after the pick-up animation.
; @details    The same entry conditions as in 0x4A with two differences: it does not check PACTION_17, it requires
;             PFLAGS_EATINGMEAL=0, DOGHUGGING=0, carryItemId == 0, daily4 & 0x0006 == 0, A pressed, obj+0x0C != 0.
;             When met: obj+0x00 = 0, obj+0x01 |= 0x40 (the object disappears), obj+0x10 += 1, daily4 |= 0x0002.
; @case       $52; 1 byte(s) including the opcode
; @see        fAIAction0x52_PickUpObjectForEventA
; @confidence medium
; @modifies   ptrAIActionData, ptrAIUnknown0xCC, strcPlayer.action, strcPlayer.flags, strcFlags.daily4,
;             strcJoypad1.newInput
; @note       It was not established what the player physically picks up in script 0x45, nor who sets action 0x1A
;             after this command. The name is a descriptive proposal.
;;
macro AICMD0x52_PickUpObjectForEventA()
    db $52
    
endmacro

;;
; @brief      Like 0x52, but sets flag daily4 0x0004 (selects the second event variant after the pick-up).
; @details    Identical conditions to 0x52. When met: obj+0x00 = 0, obj+0x01 |= 0x40, obj+0x10 += 1, daily4 |= 0x0004.
; @case       $53; 1 byte(s) including the opcode
; @see        fAIAction0x53_PickUpObjectForEventB
; @confidence medium
; @modifies   ptrAIActionData, ptrAIUnknown0xCC, strcPlayer.action, strcPlayer.flags, strcFlags.daily4,
;             strcJoypad1.newInput
; @note       As in 0x52 - the event content of script 0x45 sub 3 has not been analyzed.
;;
macro AICMD0x53_PickUpObjectForEventB()
    db $53
    
endmacro

;;
; @brief      Shows a dialog in input handler mode 6 (closes by itself when finished, without player input) - a
;             variant of 0x1C/0x1D.
; @details    Identical to 0x1C/0x1D except: strcDialogDisplay.mapUnk19A = 6 (instead of 2) and additionally zeroing
;             of $09B1 (16-bit). In fInput_Handler mode 6 (fInput_Handler_case06): after the ENDDIALOG flag is set, it
;             counts frames in $09B1 up to 0x78 (120), calls fDialog_EndDialogRestoreScroll, sets mapUnk19A and masks
;             the A button - so the dialog closes by itself after about 2 s.
; @case       $54; 4 byte(s) including the opcode
; @param      nDialogId  word: dialog index passed in X to fDialog_DialogHandler
; @param      nUnknown2  byte: stored to strcDialogDisplay.dialogUnk191 (always $01 in scripts)
; @see        fAIAction0x54_ShowDialogAutoClose
; @confidence medium
; @modifies   ptrAIActionData, strcDialogDisplay.dialogUnk191, strcDialogDisplay.mapUnk19A,
;             strcDialogDisplay.dialogId, strcDialogDisplay.dialogFlags
; @note       The meaning of nUnknown2 (dialogUnk191) is still unknown - it is modified in several places in
;             dialog.asm. The name 'AutoClose' comes from analysis of case06 in input.asm; not confirmed in game.
;;
macro AICMD0x54_ShowDialog(nDialogId, nUnknown2)
    db $54
    dw <nDialogId>
    db <nUnknown2>
    
endmacro

;;
; @brief      Jumps to pNextAction if bit nFlagsIndex in the word at pAddress is NOT set (negation of 0x14
;             JumpIfFlagSet).
; @details    Reads the address into ptrTemp0x72, the bit index via the aAICheckFlags table (identical to aAISetMask
;             used by 0x14), executes LDA [ptrTemp0x72] AND mask. If the result != 0 - advances the pointer by 7
;             (skips the jump address, next command); if == 0 - ptrAIActionData = pNextAction.
; @case       $55; 7 byte(s) including the opcode
; @param      pAddress  long: 24-bit address of a 16-bit flag word (e.g. strcFlags.event6)
; @param      nFlagsIndex  byte: bit number 0-15 (mask from aAICheckFlags: 1<<n)
; @param      pNextAction  word: jump address (same bank as the script), when the bit is cleared
; @see        fAIAction0x55_JumpIfFlagNotSet
; @confidence high
; @modifies   ptrAIActionData, ptrTemp0x72, strcVariables.n16Temp1
;;
macro AICMD0x55_JumpIfFlagNotSet(pAddress, nFlagsIndex, pNextAction)
    db $55
    dl <pAddress>
    db <nFlagsIndex>
    dw <pNextAction>&$FFFF
endmacro

;;
; @brief      If the player has a tool equipped, starts its use (animation and effect), as after pressing Y.
; @details    When strcPlayerData.toolEquipped != 0: player action = PACTION_USINGTOOL and JSL
;             fToolUsedAnimationHandler. The animation handler checks PFLAGS_OUTOFSTAMINA (if set - sprite 0x4D and
;             PACTION_TIRED), otherwise it calls the routine for the current tool via aToolUsedAnimationTable.
; @case       $56; 1 byte(s) including the opcode
; @see        fAIAction0x56_UseEquippedItem
; @confidence high
; @modifies   ptrAIActionData, strcPlayerData.toolEquipped, strcPlayer.action, strcPlayerData.unkCounter91B
;;
macro AICMD0x56_UseEquippedItem()
    db $56
    
endmacro

;;
; @brief      Changes the player's energy by the given signed value via fPlayerEnergyHandler.
; @details    The value goes in A to fPlayerEnergyHandler (sign-extended). Procedure: skipped when daily4 & 0x0008;
;             energy ($918) += value; <= 0 - energy = 0, PFLAGS_OUTOFSTAMINA, sprite 0x4D, PACTION_TIRED; >= stamina
;             ($917, maximum) - energy = stamina and OUTOFSTAMINA is cleared; otherwise a plain addition.
; @case       $57; 2 byte(s) including the opcode
; @param      nStamina  byte: signed value (int8) added to the player's current energy; a negative value decreases it,
;             scripts use positive 20 and 30
; @see        fAIAction0x57_UpdateStamina
; @confidence high
; @modifies   ptrAIActionData, strcPlayerData.energy, strcPlayerData.stamina, strcPlayer.flags, strcPlayer.action,
;             strcObjectData.spriteIdx
;;
macro AICMD0x57_UpdateStamina(nStamina)
    db $57
    db <nStamina>
    
endmacro

;;
; @brief      Replaces a tile in sFarmTilemap ($7EA4E6) at the given coordinates.
; @details    Pushes the arguments onto the stack and restores them as A/X/Y, calls fMap_UpdateFarmTilemapCoords: sets
;             strcDialogDisplay.mapMultiWidth = 4, computes the offset via fObjectEngine_ConvertCoordsToOffset and
;             writes the tile to sFarmTilemap,X. Does not block.
; @case       $58; 6 byte(s) including the opcode
; @param      nTileId  byte: id of the tile written to the farm map
; @param      nPosX  word: X position in pixels (X>>4 = tile column)
; @param      nPosY  word: Y position in pixels (Y & $FFF0 = row)
; @see        fAIAction0x58_ReplaceFarmTile
; @confidence high
; @modifies   ptrAIActionData, sFarmTilemap, strcDialogDisplay.mapMultiWidth
;;
macro AICMD0x58_ReplaceFarmTile(nTileId, nPosX, nPosY)
    db $58
    db <nTileId>
    dw <nPosX>
    dw <nPosY>
    
endmacro

;;
; @brief      Sets the player action PACTION_SWAPTOOL - swaps the current tool with the second one.
; @details    Advances the pointer by 1 and sets strcPlayer.action = PACTION_SWAPTOOL (0x1C). fPlayerAction0x1C
;             (81C061), after the animation finishes (PFLAGS_ANIMATING), swaps toolEquipped <-> toolSecond, calls
;             fToolUsedSound_PlayOnToolChange and returns to PACTION_NONE. Does not yield the frame within the command
;             itself; the effect happens in subsequent frames of the player action.
; @case       $59; 1 byte(s) including the opcode
; @see        fAIAction0x59_SwapEquippedItems
; @confidence high
; @modifies   ptrAIActionData, strcPlayer.action, strcPlayerData.toolEquipped, strcPlayerData.toolSecond
;;
macro AICMD0x59_SwapEquippedItems()
    db $59
    
endmacro