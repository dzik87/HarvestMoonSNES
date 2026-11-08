;;
; @file   structures.asm
; @brief  WRAM structures (asar `struct`) of the direct page and low WRAM, flag masks (!AFLAGS_*, !DFLAGS_*, !AIFLAGS_*,
;         !COWSTATUS_*, !CHICKENSTATUS_*, strcFlags bit names) and the joypad masks.
;         Field comments read `; <address range>  meaning | W: writers | R: readers` (+N = N further routines). Fields
;         still called `unk*` have no settled meaning; the comment states what is observed (docs/naming/open-questions.md).
; @see    src/common/ram.asm, src/common/enums.asm, docs/naming/P_common_renames.csv
;;
;
; 1-3       ptrCurrentDialog            ptr24
;


;
; 4-5       ptrPaletteNext              ptr24
;


;
; 7-9       ptrObjectSlot              ptr24
;


;
; A-C       ptrAudioData                ptr24
;


;
; Size and start OK
;
struct strcMap              $7E000D
    .pSelected              : skip 3                ; D-F      ptr24 map data record of the selected area  | W: fObjectMap_LoadData | R: fMap_ScreenTransitionHandler, fItemCarried_Begin, fObjectEngine_GetObjectPropertyByDirSeason, fPlayer_InteractWithFrontObject +3
    .unk10                  : skip 2                ; 10-11    BG tilemap VRAM column position for streaming ($0410 at map load; +1 per streamed column, wraps $20 -> $400 and $420 -> 0): fMap_StreamColumnRight/Left  | W: fMap_StreamColumnRight, fMap_StreamColumnLeft, fTileMap_LoadAreaGraphics | R: fMap_StreamColumnRight, fMap_StreamColumnLeft
    .unk12                  : skip 2                ; 12-13    byte offset of the current column in the source map (init 0, +2 per column); also read by fMap_StreamRowDown/Up (?)  | W: fMap_StreamColumnRight, fMap_StreamColumnLeft, fTileMap_LoadAreaGraphics | R: fMap_StreamRowDown, fMap_StreamRowUp, fMap_StreamColumnRight, fMap_StreamColumnLeft
    .unk14                  : skip 2                ; 14-15    BG tilemap VRAM row position for streaming ($0A00 at map load), twin of unk10 for fMap_StreamRowDown/Up (?)  | W: fMap_StreamRowDown, fMap_StreamRowUp, fTileMap_LoadAreaGraphics | R: fMap_StreamRowDown, fMap_StreamRowUp
    .unk16                  : skip 2                ; 16-17    byte offset of the current row in the source map (init 0); read by the column streamers, advanced by the row streamers (?)  | W: fMap_StreamRowDown, fMap_StreamRowUp, fTileMap_LoadAreaGraphics | R: fMap_StreamRowDown, fMap_StreamRowUp, fMap_StreamColumnRight, fMap_StreamColumnLeft
    .pCurrent               : skip 4                ; 18-1B    ptr24 - 1B not used, end of struct ?  | W: fTileMap_GetAreaDescriptorByte, fTileMap_LoadAreaGraphics | R: fMap_StreamRowDown, fMap_StreamRowUp, fTileMap_GetAreaDescriptorByte, fTileMap_LoadAreaGraphics
    .unk1C                  : skip 2                ; 1C-1D    room size value from nMapRoomSizeTable (set by fTileMap_MapChangeHandler); limit for the row streamers (?)  | W: fTileMap_LoadAreaGraphics | R: fMap_StreamRowDown, fMap_StreamRowUp
    .unk1E                  : skip 2                ; 1E-1F    scroll step in pixels per frame: set to 8 by fTileMap_MapChangeHandler, changed by the walk/run actions (fPlayerAction_Walk/Run) and added to the scroll accumulators (?)  | W: fMap_SetupArea, fCamera_UpdateBG2Scroll, fCamera_ScrollDownStep, fCamera_ScrollUpStep +11 | R: fCamera_UpdateBG2Scroll, fCamera_ScrollDownStep, fCamera_ScrollUpStep, fCamera_ScrollRightStep +3
    .scrollAccumX                  : skip 1         ; 20       horizontal scroll accumulator (+unk1E per frame while mapFlags bit 0 is set); every 8 px one BG tile column is streamed  | W: fCamera_UpdateFromPlayerPos, fCamera_ScrollRightStep, fCamera_ScrollLeftStep, fTileMap_LoadAreaGraphics | R: fCamera_ScrollRightStep, fCamera_ScrollLeftStep
    .scrollAccumY                  : skip 1         ; 21       vertical scroll accumulator, twin of scrollAccumX (row streaming)  | W: fCamera_UpdateFromPlayerPos, fCamera_ScrollDownStep, fCamera_ScrollUpStep, fTileMap_LoadAreaGraphics | R: fCamera_ScrollDownStep, fCamera_ScrollUpStep
    .loadAreaId             : skip 1                ; 22       area id (!AREA_*) of the area currently loaded; read by every area event routine  | W: fCore_GameStart, fAudioEngine_MapChangeHandler, fMap_ResetAndLoadDestinationArea, fMap_SetupArea +12 | R: fPalette_LoadMapPallete, fPalette_ChangeTimePallete, fPalette_PrepareSpritePalette, fPalette_LoadSpritePallete +35
endstruct align 22


;
; Size and start OK - System stuff - require more attention to actually figure out what is what
;
struct strcSystem           $7E0023
    .unk23                  : skip 1                ; 23       joypad read scratch byte (fCore_ReadJoypad only)  | W: fCore_ReadJoypad | R: fCore_ReadJoypad
    .INIDISP                : skip 1                ; 24       shadow of SNES_INIDISP ($2100) written during NMI (?)  | W: fCore_InitializeScreenStatus, fCore_SetForceBlank, fCore_ResetForceBlank, fCore_SetBrightness | R: fCore_ApplyGraphicsPreset, fCore_SetForceBlank, fCore_ResetForceBlank, fCore_SetBrightness
    .nBrightness            : skip 1                ; 25       target screen brightness 0-15 (fade level) (?)  | W: fCore_ScreenFadein, fCore_ScreenFadeout | R: fCore_ScreenFadein, fCore_ScreenFadeout
    .nBrightnessStep        : skip 1                ; 26       brightness change per frame while fading (?)  | W: fCore_ScreenFadein, fCore_ScreenFadeout | R: fCore_ScreenFadein, fCore_ScreenFadeout
    .arrayIndex             : skip 1                ; 27       DMA channel/transfer index used by the DMA queue builders (40 uses in 27 routines, e.g. the VRAM transfer setup) (?)  | W: fPalette_ProcessColorAnimSlots, fPalette_FadeToNextPalette, fMap_SetupArea, fMap_StreamRowDown +20 | R: fCore_PrepareTransfer, fCore_RemoveTransfer, fCore_StartPreparedTransfer
    .DMAchannelFlags        : skip 1                ; 28       bit mask of DMA channels to start (shadow of SNES_MDMAEN, $9A is written to the register) (?)  | W: fCore_PrepareTransfer, fCore_RemoveTransfer, fCore_StartPreparedTransfer, fCore_StartTransfer +1 | R: fCore_PrepareTransfer, fCore_RemoveTransfer, fCore_StartTransfer
    .destinationRegister    : skip 1                ; 29       B-bus destination register of the next DMA ($18 = VRAM data, $22 = CGRAM data ...); SNES_BBAD0 shadow  | W: fPalette_ProcessColorAnimSlots, fPalette_FadeToNextPalette, fMap_SetupArea, fMap_StreamRowDown +20 | R: fCore_PrepareTransfer
    .array2A                : skip 1*8              ; 2A-31    8 bytes, one per DMA channel (parameters: transfer mode) (?)  | W: fCore_PrepareTransfer | R: fCore_StartPreparedTransfer, fCore_StartTransfer
    .array32                : skip 2*8              ; 32-41    8 words, one per DMA channel (source address / size) (?)  | W: fCore_PrepareTransfer | R: fCore_StartPreparedTransfer, fCore_StartTransfer
endstruct align 31


;
; 42-71     ptrPaletteAnimScripts              16 * ptr24
;


;
; 72-74     ptrUnknown0x72              ptr24
;


;
; 75-77     ptrTemp0x75              ptr24
;


;
; 78-7A     ptrObjectData               ptr24
;


;
; 7B-7D not used
;


;
; 7E - 91 Variables used everywhere
;
struct strcVariables        $7E007E
    .n16Temp1               : skip 2                ; 7E-7F    general scratch word #1 (never valid across routines)  | W: fCore_GetRandomNumber, fPalette_StartColorAnimSlot, fPalette_ProcessColorAnimSlots, fPalette_StopColorAnimSlot +99 | R: fCore_SetBrightness, fPalette_StartColorAnimSlot, fPalette_ProcessColorAnimSlots, fPalette_StopColorAnimSlot +99
    .n16Temp2               : skip 2                ; 80-81    general scratch word #2  | W: fCore_GetRandomNumber, fPalette_FadeToNextPalette, fPalette_WriteColorToBuffer, fPalette_ModifyPalette +51 | R: fPalette_FadeToNextPalette, fPalette_WriteColorToBuffer, fPalette_ModifyPalette, fPalette_LoadMapPallete +43
    .n16Temp3               : skip 2                ; 82-83    general scratch word #3  | W: fPalette_FadeToNextPalette, fPalette_WriteColorToBuffer, fPalette_ModifyPalette, fPalette_LoadSpritePallete +31 | R: fPalette_FadeToNextPalette, fPalette_WriteColorToBuffer, fPalette_ModifyPalette, fPalette_LoadSpritePallete +25
    .n16Temp4               : skip 2                ; 84-85    general scratch word #4  | W: fPalette_FadeToNextPalette, fMap_StreamRowDown, fMap_StreamRowUp, fMap_StreamColumnRight +21 | R: fPalette_FadeToNextPalette, fMap_StreamRowDown, fMap_StreamRowUp, fMap_StreamColumnRight +15
    .n16Temp5               : skip 2                ; 86-87    | W: fMap_StreamRowDown, fMap_StreamRowUp, fSetTileAtCoords, fMap_QueueTilePatternVRAMUpload +11 | R: fMap_StreamRowDown, fMap_StreamRowUp, fMap_QueueTilePatternVRAMUpload, fMap_CopyTilePatternToTilemapBuffer +10
    .n16Temp6               : skip 2                ; 88-89    | W: fSetTileAtCoords, fMap_DrawTilePatternAt, fMap_CopyTilePatternToTilemapBuffer, fObjectMap_HurricaneDamage +4 | R: fMap_CopyTilePatternToTilemapBuffer, fMap_FillCurrentTilemapRect, fObjectMap_HurricaneDamage, fScreen_NameInput_DrawNameBox +2
    .n16Temp7               : skip 2                ; 8A-8B    | W: fTileMap_LoadAreaGraphics, fObjectMap_HurricaneDamage, fGameEngine_CheckTileCollision | R: fTileMap_LoadAreaGraphics, fObjectMap_HurricaneDamage, fGameEngine_CheckTileCollisionDir
    .n16Temp8               : skip 2                ; 8C-8D    | W: fGameEngine_CheckAISlotCollision, fGameEngine_CheckTileCollision | R: fGameEngine_CheckAISlotCollision, fGameEngine_CheckTileCollisionDir
    .n16Temp9               : skip 2                ; 8E-8F    | W: fMap_CopyTilePatternToTilemapBuffer, fMap_FillCurrentTilemapRect, fMap_StampTemplateToCurrentTilemap, fGameEngine_CheckTileCollisionDir +1 | R: fMap_CopyTilePatternToTilemapBuffer, fMap_FillCurrentTilemapRect, fMap_StampTemplateToCurrentTilemap, fGameEngine_CheckTileCollisionDir
    .n16Temp10               : skip 2               ; 90-91    | W: fMap_CopyTilePatternToTilemapBuffer, fMainMenu_StartHowToPlayDemo, fMainMenu_PrepareHowToPlay, fMainMenu_SetStateReturnToTitle +9 | R: fMap_CopyTilePatternToTilemapBuffer, fMainMenu_EndFrame, fMap_FillCurrentTilemapRect, fMap_StampTemplateToCurrentTilemap +1
    .n8Temp1                : skip 1                ; 92       general scratch byte #1  | W: fCore_GameStart, fCore_SetPlayerName, fCore_SetBoughtCowName, fCore_SetBornCowName +57 | R: fCore_ScreenFadein, fCore_ScreenFadeout, fCore_GetRandomNumber, fPalette_FadeToNextPalette +24
    .n8Temp2                : skip 1                ; 93       general scratch byte #2  | W: fCore_GameStart, fCore_SetPlayerName, fCore_SetBoughtCowName, fCore_SetBornCowName +41 | R: fCore_ScreenFadein, fCore_ScreenFadeout, fCore_GetRandomNumber, fPalette_ProcessColorAnimSlots +17
    .n8Temp3                : skip 1                ; 94       general scratch byte #3  | W: fCore_GameStart, fCore_SetPlayerName, fCore_SetBoughtCowName, fCore_SetBornCowName +36 | R: fCore_ScreenFadein, fCore_ScreenFadeout, fMainMenu_StateLogoScrollHorizontal, fMainMenu_StateLogoScrollDiagonal +10
    .n8Temp4                : skip 1                ; 95       general scratch byte #4  | W: fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fMainMenu_SetStateReturnToTitle, fMainMenu_StateInitialDelay +9 | R: fMainMenu_StateLoop, fMainMenu_StateOpeningDemo, fAreaEvents_Town, fInput_Mode_TitleScreen
    .u8Unk96                : skip 1                ; 96       frame state byte of the main menu / name input (reset to 0 when a menu state starts, tested in the *_FrameTail routines) (?)  | W: fMainMenu_StateOpeningDemo, fMainMenu_StateLogoScrollHorizontal, fMainMenu_NewGameSlotSelect_FadeIn, fMainMenu_NewGameSlotSelect_FrameTail +3 | R: fMainMenu_StateLogoScrollHorizontal, fMainMenu_NewGameSlotSelect_FrameTail, fMainMenu_LoadGameSlotSelect_FrameTail, fScreen_NameInput
    .u8Unk97                : skip 1                ; 97       short-lived choice/phase flag of the title, slot select and name input screens (0/1; fInput_Case04_State* write it) (?)  | W: fMainMenu_TitleScreenInit, fMainMenu_NewGameSlotSelect_FadeIn, fMainMenu_StateLoadGameSlotSelect, fScreen_NameInput +3 | R: fMainMenu_StateTitleMenuInput, fMainMenu_NewGameSlotSelect_WaitFrame, fMainMenu_LoadGameSlotSelect_WaitFrame
endstruct align 26


;
; 98 not used
;


;
; 99 - ???
; 9A - written to SNES_MDMAEN (DMA Enable)
;


;
; Size and start OK
;
struct strcObject           $7E009B
    .posX                   : skip 2                ; 9B-9C    object X position (pixels), argument of fObject_Create/UpdatePositionAndFlip  | W: fObjectSlots_UpdateAll, fObjectSlots_Allocate, fPlayer_InitSpriteObject, fPlayer_UpdateSpriteObject +4 | R: fObject_Create, fObject_UpdatePositionAndFlip, fObject_Replace, fObject_RenderAll
    .posY                   : skip 2                ; 9D-9E    object Y position (pixels)  | W: fObjectSlots_UpdateAll, fObjectSlots_Allocate, fPlayer_InitSpriteObject, fPlayer_UpdateSpriteObject +4 | R: fObject_Create, fObject_UpdatePositionAndFlip, fObject_Replace, fObject_RenderAll
    .flip                   : skip 2                ; 9F-A0    sprite flip bits  | W: fObjectSlots_UpdateAll, fObjectSlots_Allocate, fPlayer_InitSpriteObject, fPlayer_UpdateSpriteObject +4 | R: fObject_Create, fObject_UpdatePositionAndFlip, fObject_Replace, fObject_RenderAll +2
    .spriteTableIdx         : skip 2                ; A1-A2    object animation/sprite table index (banks $86/$87)  | W: fObjectSlots_UpdateAll, fObjectSlots_Allocate, fPlayer_InitSpriteObject, fPlayer_UpdateSpriteObject +3 | R: fObject_Create, fObject_UpdatePositionAndFlip, fObject_Replace, fObject_ClearGameObject +1
    .unkA3                  : skip 2                ; A3-A4    object parameter word set by fObject_GetSingleObjectData and fObjectSlots_Allocate, read by fObject_Create/Replace  | W: fObjectSlots_Allocate, fPlayer_InitSpriteObject, fScreen_NameInput, fObject_GetSingleObjectData | R: fObject_Create, fObject_Replace
    .gameObjectIdx          : skip 2                ; A5-A6    index of the game object (strcGameObject slot) the call works on  | W: fEggFestival_DiscardEgg, fEggFestival_WrongEggDialog, fItemCarriedTool_EquipFromShed, fItemBuy_ReturnItemToShelf +20 | R: fObjectSlots_Allocate, fPlayer_InitSpriteObject, fScreen_NameInput, fAI_UpdateSlotMovementAndObject +4
    .exists                 : skip 2                ; A7-A8    0 if the object exists, $FFFF (-1) if it does not; $FFFD seen as "pending" marker in fObjectSlots_UpdateAll (?)  | W: fObject_Create, fObject_UpdatePositionAndFlip, fObject_Replace, fObject_GetSingleObjectData | R: fItemCarried_CarryLoop_NoSell, fItemCarried_CarryLoop_Jumping, fItemCarriedAnimal_CarryLoop, fObjectSlots_UpdateAll +1
    .gameObjectIdxOffs      : skip 2                ; A9-AA    aGameObjectIndexOffsets[gameObjectIdx]  | W: fObject_Create, fObject_UpdatePositionAndFlip, fObject_Replace, fObject_Destroy +4 | R: fObject_Create, fObject_Replace, fObject_Destroy, fObject_UpdateAllAnimations +5
    .unkAB                  : skip 2                ; AB-AC    working word of fObject_UpdateAllAnimations / fObject_RenderAll (current animation frame pointer offset ?) (?)  | W: fObject_UpdateAllAnimations, fObject_RenderAll | R: fObject_UpdateAllAnimations, fObject_RenderAll
    .totalComponents        : skip 2                ; AD-AE    number of sprite components of the object (?)  | W: fObject_BuildDrawOrderByY, fObject_RenderAll, fObject_ParseObjectData | R: fObject_BuildDrawOrderByY, fObject_RenderAll, fObject_ParseObjectData
    .bankAddress            : skip 2                ; AF-B0    bank/offset of the object data (?)  | W: fMainMenu_TitleScreenInit, fObject_BuildDrawOrderByY, fObject_RenderAll, fObject_ParseObjectData +1 | R: fCore_Unused8088C3, fObject_Replace, fObject_Destroy, fObject_UpdateAllAnimations +4
    .unkB1                  : skip 1                ; B1       render scratch byte (fObject_RenderAll only)  | W: fObject_RenderAll | R: fObject_RenderAll
    .unkB2                  : skip 1                ; B2       render scratch byte (fObject_RenderAll only)  | W: fObject_RenderAll | R: fObject_RenderAll
    .pData                  : skip 3                ; B3-B5    ptr24 object data being parsed  | W: fObject_ParseObjectData, fObject_ReleaseSpriteTiles, fObject_AcquireTileSlot | R: fObject_ParseObjectData, fObject_AcquireTileSlot, fObject_ReleaseTileSlot
endstruct align 27


;
; B6 not used
;


;
; B7-B8 ???
;


;
; B9-BA not used
;


;
; BB-BC
; BD-BE
; BF-C0 X - something with camera
; C1-C2 Y - something with camera
; C3-C4 flags
; C5-C6
; C7-C8
; C9-CB ptrAIActionData     ptr24
; CC-CE ptrAISlot    prt24
; CF-D1 ptrTileScript      ptr24
;


;
; Size to be checkd and start OK
;
struct strcPlayer           $7E00D2
    .flags                  : skip 2                ; D2-D3    player state bits !PFLAGS_*  | W: fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_ResetSessionState +2
    .action                 : skip 2                ; D4-D5    current player action !PACTION_*  | W: fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fAreaEvents_Intro +1 | R: fPlayerAction_Handler, fAIAction0x30_UpdateChicken, fInput_Mode_Gameplay
    .posX                   : skip 2                ; D6-D7    player X position (pixels)  | W: fTileMap_LoadAreaGraphics, fPlayer_MoveInDirection, fMainMenu_StateReinitTitleScreen, fMainMenu_ShowTitleScreen +3 | R: fMap_SetupArea, fCamera_UpdateFromPlayerPos, fTileMap_LoadAreaGraphics, fItemCarried_Begin +19
    .posY                   : skip 2                ; D8-D9    player Y position (pixels)  | W: fTileMap_LoadAreaGraphics, fPlayer_MoveInDirection, fMainMenu_StateReinitTitleScreen, fMainMenu_ShowTitleScreen +3 | R: fMap_SetupArea, fCamera_UpdateFromPlayerPos, fTileMap_LoadAreaGraphics, fItemCarried_Begin +20
    .direction              : skip 2                ; DA-DB    facing direction !PDIR_*  | W: fPlayerAction_Finish, fPlayerAction_MountHorse, fPlayerAction_DismountHorse, fAIAction0x07_SetPlayerDirection +1 | R: fMap_SetupArea, fMap_ScreenTransitionHandler, fCamera_UpdateBG2Scroll, fItemCarried_Begin +45
    .gameObjectSlotLimit    : skip 2                ; DC-DD    object slots in use / search limit (max $28)  | W: fGameEngine_ResetSessionState, fObject_Create, fObject_ClearGameObject | R: fObject_Create, fObject_UpdateAllAnimations, fObject_BuildDrawOrderByY, fObject_RenderAll
    .lastRandomNumber       : skip 1                ; DE       last random byte (also advanced by fAI_HowToPlaySetup: +$33 per slot); used for animal movement choices  | W: fAI_RunSlots | R: fAI_RunSlots, fAI_UpdateSlotWander, fAIAction0x30_UpdateChicken, fAIAction0x31_CowDefaultPath +3
    .lastX                  : skip 2                ; DF-E0    X position before the last move (?)  | W: fItemCarried_CarryLoop_NoSell, fItemCarried_HandleDropAction, fItemCarriedAnimal_CarryLoop, fPlayer_MoveInDirection +6 | R: fGameEngine_CheckAISlotCollision, fGameEngine_CheckPlayerOverlap, fGameEngine_CheckTileCollisionDir
    .lastY                  : skip 2                ; E1-E2    Y position before the last move (?)  | W: fItemCarried_CarryLoop_NoSell, fItemCarried_HandleDropAction, fItemCarriedAnimal_CarryLoop, fPlayer_MoveInDirection +6 | R: fGameEngine_CheckAISlotCollision, fGameEngine_CheckPlayerOverlap, fGameEngine_CheckTileCollisionDir
    .unkE3                  : skip 2                ; E3-E4    speed? move increment? rounding?  | W: fItemCarried_CarryLoop_NoSell, fItemCarried_HandleDropAction, fItemCarriedAnimal_CarryLoop, fPlayer_MoveInDirection +6 | R: fGameEngine_CheckAISlotCollision, fGameEngine_CheckTileCollisionDir
    .newX                   : skip 2                ; E5-E6    X position after the move being tested (?)  | W: fItemCarried_CarryLoop_NoSell, fItemCarried_HandleDropAction, fItemCarriedAnimal_CarryLoop, fPlayer_MoveInDirection +6 | R: fGameEngine_CheckAISlotCollision, fGameEngine_CheckPlayerOverlap, fGameEngine_CheckTileCollisionDir, fGameEngine_CheckTileCollision
    .newY                   : skip 2                ; E7-E8    Y position after the move being tested (?)  | W: fItemCarried_CarryLoop_NoSell, fItemCarried_HandleDropAction, fItemCarriedAnimal_CarryLoop, fPlayer_MoveInDirection +6 | R: fGameEngine_CheckAISlotCollision, fGameEngine_CheckPlayerOverlap, fGameEngine_CheckTileCollisionDir, fGameEngine_CheckTileCollision
    .unkPosX                : skip 2                ; E9-EA    X of the tile/position being checked for collision (fGameEngine_CheckTileCollision writes it; fPlayer_MoveInDirection reads it) (?)  | W: fGameEngine_ResetSessionState, fGameEngine_Unused83B0E6, fGameEngine_CheckTileCollision | R: fPlayer_MoveInDirection, fAI_UpdateSlotWander
    .unkPosY                : skip 2                ; EB-EC    Y twin of unkPosX (?)  | W: fGameEngine_ResetSessionState, fGameEngine_Unused83B0E6, fGameEngine_CheckTileCollision | R: fPlayer_MoveInDirection, fAI_UpdateSlotWander
    .offsetCamX             : skip 2                ; ED-EE    camera X target derived from the player position (?)  | W: fTileMap_LoadAreaGraphics | R: fCamera_UpdateFromPlayerPos, fCamera_UpdateBG2Scroll, fCamera_ScrollRightStep, fCamera_ScrollLeftStep
    .offsetCamY             : skip 2                ; EF-F0    camera Y target derived from the player position (?)  | W: fTileMap_LoadAreaGraphics | R: fCamera_UpdateFromPlayerPos, fCamera_UpdateBG2Scroll, fCamera_ScrollDownStep, fCamera_ScrollUpStep
endstruct


;
; some of prevoius structs might be part if this structure
;
struct strcCamera           $7E00F1
    .offsetCamX             : skip 2                ; F1-F2    camera X offset (target) (?)  | W: fTileMap_LoadAreaGraphics | R: fCamera_UpdateFromPlayerPos, fCamera_UpdateBG2Scroll, fCamera_ScrollRightStep, fCamera_ScrollLeftStep
    .offsetCamY             : skip 2                ; F3-F4    camera Y offset (target) (?)  | W: fTileMap_LoadAreaGraphics | R: fCamera_UpdateFromPlayerPos, fCamera_UpdateBG2Scroll, fCamera_ScrollDownStep, fCamera_ScrollUpStep
    .cameraX                : skip 2                ; F5-F6    camera X (BG scroll source) (?)  | W: fGraphics_MapScrool, fCamera_UpdateFromPlayerPos, fTileMap_LoadAreaGraphics | R: fGraphics_MapScrool, fMap_SetupArea, fCamera_UpdateBG2Scroll, fCamera_ScrollRightStep +2
    .cameraY                : skip 2                ; F7-F8    camera Y (BG scroll source) (?)  | W: fGraphics_MapScrool, fCamera_UpdateFromPlayerPos, fTileMap_LoadAreaGraphics | R: fGraphics_MapScrool, fMap_SetupArea, fCamera_UpdateBG2Scroll, fCamera_ScrollDownStep +2
endstruct align 8


;
; F9 - FF not used
;


;
; Size and start OK
;
struct strcRandom           $7E0100
    .a                      : skip 1                ; 100      RNG state byte a (fGetRandomNumber) (?)  | W: fGetRandomNumber | R: fGetRandomNumber
    .b                      : skip 1                ; 101      RNG state byte b (?)  | R: fGetRandomNumber
    .c                      : skip 1                ; 102      RNG state byte c (?)  | W: fGetRandomNumber | R: fGetRandomNumber
endstruct


;
; Size and start OK
;
struct strcAudio            $7E0103
    .index                  : skip 1                ; 103      write index into the audio command list (?)  | W: fPlayerInteraction_RingBell, fToolUsedSound_PlayOnToolChange, fAudio_PlaySoundEffectAndWait, fAudio_IncrementSampleIndexUnused +3 | R: fAudio_PrepareSoundEffectSample, fAudio_IncrementSampleIndexUnused, fAudio_LoadSfxSample
    .list                   : skip 10               ; 104-10D  10 byte queue of pending audio commands (?)  | W: fAudio_LoadTrackSamples, fAudio_FreeSamplesFromSlot, fAudio_LoadSfxSample | R: fAudio_PrepareSoundEffectSample
    .unk10E                 : skip 1                ; 10E      not accessed by any code (unused)
    .unk10F                 : skip 1                ; 10F      number of entries queued by fAudio_LoadTrackSamples (reset with index) (?)  | W: fAudio_LoadTrackSamples
    .trackId                : skip 1                ; 110      music track requested ($FF = stop); written by AI action 0x00 and the area music selection  | W: fAudioEngine_SelectMapMusic, fAudioEngine_TurnOffMusic, fGame_TimeHandler, fAudio_PlayTrackThenResumeMapMusic +3 | R: fMap_SetupArea, fMainMenu_StateOpeningDemo, fMainMenu_ShowTitleScreen, fMainMenu_ReturnToTitleFromSlotSelect +10
    .startFadeFlag          : skip 1                ; 111      p0 of SPC cmd 8: 1 = fade in the new track  | W: fAudio_StartPendingTrack | R: fAudio_SendStartTrackCommand
    .fadeOutFlag            : skip 1                ; 112      p0 of SPC cmd 9: 1 = fade out, 0 = stop at once  | W: fAudio_FadeOutOnTrackChangeSlow, fAudio_FadeOutOnTrackChangeFast | R: fAudio_SendFadeOutCommand
    .fadeTicks              : skip 1                ; 113      p1 of SPC cmds 8/9: fade length ($40 slow, $10 fast)  | W: fAudio_StartPendingTrack, fAudio_FadeOutOnTrackChangeSlow, fAudio_FadeOutOnTrackChangeFast | R: fAudio_SendStartTrackCommand, fAudio_SendFadeOutCommand
    .sfxId                  : skip 1                ; 114      SFX id (!SFX_*) for SPC cmd $0A  | W: fItemCarried_Begin, fPlayerAction_Run_StepSound, fPlayerAction_Jump, fPlayerAction_DropItem +34 | R: fAudio_PrepareSoundEffectSample, fAudio_LoadSfxSample, fAudio_SendPlaySfxCommand
    .sfxVoice               : skip 1                ; 115      SPC voice 0-7 (game uses 6)  | W: fItemCarried_Begin, fPlayerAction_Run_StepSound, fPlayerAction_Jump, fPlayerAction_DropItem +33 | R: fAudio_SendPlaySfxCommand
    .sfxPan                 : skip 1                ; 116      pan, $0A = centre  | W: fAudio_PlaySoundEffect | R: fAudio_SendPlaySfxCommand
    .trackIdCopy            : skip 1                ; 117      copy of trackId currently playing; compared with trackId to detect a track change  | W: fMap_SetupArea, fGame_TimeHandler, fNextDayHandler, fMainMenu_StateOpeningDemo +7 | R: fAudio_StartPendingTrack, fAudio_LoadPendingTrack, fAudio_FadeOutOnTrackChangeSlow, fAudio_FadeOutOnTrackChangeFast
    .sampleTableTrackId     : skip 1                ; 118      trackId copy ($FF -> 0), index of nSoundEffectSampleTable  | W: fAudio_LoadPendingTrack, fGameEngine_ResetSessionState | R: fPlayerInteraction_RingBell, fToolUsedSound_PlayOnToolChange, fAudio_PlaySoundEffectAndWait
    .toolId                 : skip 1                ; 119      tool/sfx id being played (cleared when the track changes) (?)  | W: fPlayerInteraction_RingBell, fPlayerInteraction_PlaySoundAndWait, fToolUsedSound_PlayOnToolChange, fAudio_StartPendingTrack +1 | R: fToolUsedSound_PlayOnToolChange
    .mulFactorA            : skip 1                 ; 11A      byte factor A of the hardware multiplier (SNES_WRMPYA)  | W: fMathMultiply_7EbyA | R: fMathMultiply
    .mulFactorB            : skip 1                 ; 11B      byte factor B of the hardware multiplier (SNES_WRMPYB)  | W: fMathMultiply_7EbyA | R: fMathMultiply
    .mulInputA            : skip 2                  ; 11C-11D  16-bit input A of fMathMultiply_7EbyA  | W: fMathMultiply_7EbyA | R: fMathMultiply_7EbyA
    .mulPartLoLo            : skip 2                ; 11E-11F  partial product low(A) * low(B)  | W: fMathMultiply_7EbyA
    .mulPartHiLo            : skip 2                ; 120-121  partial product high(A) * low(B), shifted by 8  | W: fMathMultiply_7EbyA | R: fMathMultiply_7EbyA
    .mulPartLoHi            : skip 2                ; 122-123  partial product low(A) * high(B), shifted by 8  | W: fMathMultiply_7EbyA | R: fMathMultiply_7EbyA
endstruct align 33


;
; Size and start OK - Joypad 1 controls
;
struct strcJoypad1          $7E0124
    .current                : skip 2                ; 124-125  buttons held this frame (!JOYPAD_*)  | W: fCore_Reset, fCore_ReadJoypad | R: fCore_ReadJoypad, fPlayerInteraction_LivestockDealerMenu, fPlayerInteraction0x40_LessonsOfLove, fPlayerInteraction0x54_FloristNotebook +6
    .lastFrame              : skip 2                ; 126-127  buttons held in the previous frame  | W: fCore_Reset, fCore_ReadJoypad | R: fCore_ReadJoypad
    .newInput               : skip 2                ; 128-129  buttons newly pressed this frame  | W: fCore_Reset, fCore_ReadJoypad, fPlayerInteraction_LivestockDealerMenu, fPlayerInteraction0x40_LessonsOfLove +4 | R: fPlayerInteraction_LivestockDealerMenu, fPlayerInteraction0x40_LessonsOfLove, fPlayerInteraction0x54_FloristNotebook, fPlayerInteraction0x55_AnimalNotebook +22
    .newUnpressed           : skip 2                ; 12A-12B  buttons released this frame  | W: fCore_Reset, fCore_ReadJoypad | R: fInput_Unused84C852
    .autorepeat             : skip 2                ; 12C-12D  auto-repeat buttons (held long enough)  | W: fCore_ReadJoypad | R: fNameInput_ControlsHandler, fInput_Mode_HelpMenu
    .unused0A               : skip 2                ; 12E-12F  word not accessed by any code except the clear loop  | W: fCore_ReadJoypad | R: fCore_ReadJoypad
endstruct align 12


;
; Size and start OK - Joypad 2 controls
;
struct strcJoypad2          $7E0130
    .current                : skip 2                ; 130-131  controller 2 buttons held  | W: fCore_Reset, fCore_ReadJoypad | R: fCore_ReadJoypad
    .lastFrame              : skip 2                ; 132-133  controller 2 previous frame  | W: fCore_Reset, fCore_ReadJoypad | R: fCore_ReadJoypad
    .newInput               : skip 2                ; 134-135  controller 2 newly pressed  | W: fCore_Reset, fCore_ReadJoypad
    .newUnpressed           : skip 2                ; 136-137  controller 2 released  | W: fCore_Reset, fCore_ReadJoypad
    .autorepeat             : skip 2                ; 138-139  controller 2 auto-repeat  | W: fCore_ReadJoypad
    .unused0A               : skip 2                ; 13A-13B  word not accessed by any code except the clear loop  | W: fCore_ReadJoypad | R: fCore_ReadJoypad
endstruct align 12


;
; Size not sure and start OK - Gfx BG scrool Data
;
struct strcBGScrool         $7E013C
    .BG1HorOffs             : skip 2                ; 13C-13D  BG1 horizontal scroll (shadow of SNES_BG1HOFS)  | W: fGraphics_MapScrool, fCamera_ScrollRightStep, fCamera_ScrollLeftStep, fMainMenu_TitleScreenInit +12 | R: fCore_VBlankUpdate, fMainMenu_StateLogoScrollHorizontal
    .BG1VerOffs             : skip 2                ; 13E-13F  BG1 vertical scroll  | W: fGraphics_MapScrool, fCamera_ScrollDownStep, fCamera_ScrollUpStep, fMainMenu_TitleScreenInit +10 | R: fCore_VBlankUpdate, fMainMenu_StateLogoScrollDiagonal
    .BG2HorOffs             : skip 2                ; 140-141  BG2 horizontal scroll  | W: fMap_SetupArea, fCamera_UpdateBG2Scroll, fMainMenu_TitleScreenInit, fMainMenu_StateOpeningDemo +11 | R: fCore_VBlankUpdate, fCamera_UpdateBG2Scroll, fMainMenu_StateLogoScrollHorizontal, fMainMenu_StateLogoScrollDiagonal +2
    .BG2VerOffs             : skip 2                ; 142-143  BG2 vertical scroll  | W: fMap_SetupArea, fCamera_UpdateBG2Scroll, fPlayerInteraction0x14, fMainMenu_TitleScreenInit +10 | R: fCore_VBlankUpdate, fCamera_UpdateBG2Scroll, fMainMenu_StateLogoScrollDiagonal
    .BG3HorOffs             : skip 2                ; 144-145  BG3 horizontal scroll (dialog / text layer)  | W: fMainMenu_StateNewGameSlotSelect, fMainMenu_StateLoadGameSlotSelect, fScreen_NameInput | R: fCore_VBlankUpdate
    .BG3VerOffs             : skip 2                ; 146-147  BG3 vertical scroll  | W: fCore_GameStart, fCore_SetPlayerName, fCore_SetBoughtCowName, fCore_SetBornCowName +12 | R: fCore_VBlankUpdate, fDialog_DialogHandler, fDialog_EndDialogRestoreScroll
    .unk148                 : skip 1                ; 148      cleared by fCore_InterruptIRQ5 only; no other access (unused byte) (?)
endstruct


;
; 149 not used
;


;
; Size and start OK
;
struct strcPalette          $7E014A
    .animTimer                 : skip 16            ; 14A-159  palette animation: frame timer per slot  | W: fPalette_StartColorAnimSlot, fPalette_ProcessColorAnimSlots | R: fPalette_ProcessColorAnimSlots
    .animColorIndex                 : skip 16       ; 15A-169  palette animation: colour index per slot  | W: fPalette_StartColorAnimSlot | R: fPalette_ProcessColorAnimSlots
    .animPaletteRow                 : skip 16       ; 16A-179  palette animation: palette row per slot  | W: fPalette_StartColorAnimSlot | R: fPalette_ProcessColorAnimSlots
    .countDown              : skip 1                ; 17A      palette fade countdown (?)  | W: fPalette_SetNextHourPalette, fPalette_FadeToNextPalette | R: fPalette_FadeToNextPalette
    .nextIdx                : skip 1                ; 17B      index of the time-of-day palette set to fade to (fPalette_AdjustTimePalette) (?)  | W: fPalette_FadeToNextPalette, fPalette_ChangeTimePallete, fPalette_AdjustTimePalette | R: fPalette_AdjustTimePalette, fGame_TimeHandler
    .nextHourIdx            : skip 1                ; 17C      hour index at which the next palette change happens (?)  | W: fPalette_SetNextHourPalette | R: fPalette_FadeToNextPalette
endstruct


;
; Size and start OK - name to be reconsidered
;
struct strcDialogDisplay    $7E017D
    .mapDestX               : skip 2                ; 17D-17E  X position the player gets after the map load (transfer position)  | W: fCore_GameStart, fMap_ScreenTransitionHandler, fNextDayHandler, fMainMenu_StateReinitTitleScreen +3 | R: fTileMap_LoadAreaGraphics
    .mapDestY               : skip 2                ; 17F-180  Y position the player gets after the map load  | W: fCore_GameStart, fMap_ScreenTransitionHandler, fNextDayHandler, fMainMenu_StateReinitTitleScreen +3 | R: fTileMap_LoadAreaGraphics
    .mapMultiWidth          : skip 1                ; 181      width multiplier of multi-screen maps (?)  | W: fTileMap_LoadAreaGraphics, fMap_UpdateFarmTilemapCoords, fObjectMap_WinterWitherFarm, fObjectMap_HurricaneDamage +3 | R: fTileMap_LoadAreaGraphics, fMap_CopyTilePatternToTilemapBuffer, fObjectEngine_ConvertCoordsToOffset
    .mapMultiHeight         : skip 1                ; 182      height multiplier of multi-screen maps (?)  | W: fTileMap_LoadAreaGraphics
    .dialogId               : skip 2                ; 183-184  id of the dialog to show (index into the dialog pointer tables)  | W: fDialog_DialogHandler, fGameEngine_ResetSessionState | R: fDialog_DialogHandler
    .glyphVramAddr          : skip 2                ; 185-186  VRAM word address of the next text glyph cell ($5010 = cell 0)  | W: fMainMenu_DrawSaveSlotInfo, fScreen_NameInput_DrawLetterAtCursor, fScreen_NameInput_DrawEmptyNameSlots, fDialog_DialogHandler +4 | R: fMainMenu_DrawSaveSlotInfo, fDialog_TransferGlyph, fDialog_AdvanceGlyphDestination
    .dialogCurrentOffset    : skip 2                ; 187-188  current offset in current dialog / index  | W: fDialog_DialogHandler, fDialog_IterateText, fGameEngine_ResetSessionState, fInput_DialogNextScreen | R: fDialog_IterateText, fInput_DialogNextScreen
    .glyphTimer             : skip 1                ; 189      0-4 frame counter, a glyph is drawn at 4  | W: fDialog_DialogHandler, fDialog_IterateText, fInput_DialogHoldAFastText, fInput_DialogNextScreen | R: fDialog_IterateText
    .helpCursor             : skip 1                ; 18A      tool help menu cursor 0-10 (left) / 11-21 (right)  | W: fPlayerInteraction0x14, fInput_HelpMenu_CursorDown, fInput_HelpMenu_CursorUp, fInput_HelpMenu_CursorRight +1 | R: fDialog_DrawBlinkIconFrame, fInput_HelpMenu_Confirm, fInput_HelpMenu_CursorDown, fInput_HelpMenu_CursorUp +2
    .dialogBlinkTimer       : skip 1                ; 18B      time used for blinking effect for next screen sign  | W: fPlayerInteraction0x14, fScreen_NameInput, fScreen_NameInput_BlinkCursor, fDialog_DialogHandler +12 | R: fScreen_NameInput_BlinkCursor, fDialog_AnimateBlinkIcon, fDialog_NextScreenHandler
    .dialogVarSize          : skip 1                ; 18C      length of the inserted variable text (?)  | W: fMainMenu_DrawSaveSlotInfo, fDialog_DialogHandler, fDialog_IterateText | R: fDialog_IterateText, fDialog_DrawNumericVarDigit
    .dialogNameVarSize      : skip 1                ; 18D      length of the inserted name (?)  | W: fDialog_IterateText | R: fDialog_IterateText
    .dialogOptionsCount     : skip 1                ; 18E      stores how many options there was for current dialog  | W: fDialog_DialogHandler, fDialog_IterateText | R: fInput_DialogOptions_Down, fInput_DialogOptions_Up, fInput_DialogOptions_Right, fInput_DialogOptions_Left
    .dialogOptionsAnswer    : skip 1                ; 18F      id of the selected option  | W: fDialog_DialogHandler, fInput_DialogOptions_Down, fInput_DialogOptions_Up, fInput_DialogOptions_Right +1 | R: fPlayerInteraction0x10_PlayerDiary, fPlayerInteraction_SellCow, fPlayerInteraction_SellChicken, fPlayerInteraction_HouseExpansion +8
    .fontGlyphType          : skip 1                ; 190      1 = wide, 0 = thin font (?)  | W: fDialog_DialogHandler, fDialog_IterateText | R: fDialog_IterateText
    .boxPosition            : skip 1                ; 191      dialog box position 0 auto / 1 / 2 (BG3 scroll offset (n-1)*$80)  | W: fEggFestival_WrongEggDialog, fItemBuy_ShowPurchaseDialog, fItemBuy_HandleAnswer, fItemBuy_ShowDeclineDialog +38 | R: fDialog_DialogHandler, fDialog_EndDialogRestoreScroll
    .dialogNumericVarSize   : skip 3                ; 192-194  used to store dialog numeric value - sizes 0-3  | W: fMainMenu_DrawSaveSlotInfo, fDialog_IterateText, fDialog_DrawNumericVarDigit | R: fDialog_DrawNumericVarDigit
    .mapCurrentPresetId     : skip 1                ; 195      graphics preset id of the loaded map (?)  | W: fTileMap_LoadAreaGraphics | R: fObject_RenderAll
    .mapFlags               : skip 2                ; 196-197  area/engine flags !AFLAGS_*: bit 0 scrolling enabled (camera step routines), bit $20 time running, $2000 name input request, $4000 force teleport, $8000 raw charmap  | W: fCore_MainLoop, fCore_SetPlayerName, fCore_SetBoughtCowName, fCore_SetBornCowName +22 | R: fCore_MainLoop, fCore_SetPlayerName, fCore_SetBoughtCowName, fCore_SetBornCowName +54
    .mapFlagsBackup         : skip 2                ; 198-199  copy of mapFlags saved while a text screen is shown (?)  | W: fScreen_NameInput | R: fScreen_NameInput
    .inputMode              : skip 1                ; 19A      fInput_Handler mode: 1 game, 2 dialog, 3 help menu, 4 title, 5 name entry, 6 cutscene dialog  | W: fCore_GameStart, fCore_SetPlayerName, fCore_SetBoughtCowName, fCore_SetBornCowName +53 | R: fItemBuy_HandleAnswer, fItemBuy_WaitDialogClose, fItemBuy_FinishPurchase, fItemFound_Consume +28
    .dialogFlags            : skip 1                ; 19B      dialog state bits !DFLAGS_*  | W: fPlayerInteraction0x14, fMainMenu_DrawSaveSlotInfo, fDialog_DialogHandler, fDialog_EndDialogRestoreScroll +5 | R: fPlayerInteraction0x14, fMainMenu_DrawSaveSlotInfo, fDialog_DialogHandler, fDialog_IterateText +4
endstruct

; mapFlags
!AFLAGS_NONE                = $0000             ; no map flag set
!AFLAGS_UNK0001             = $0001             ; scrolling enabled: tested by fCamera_Scroll*Step before the scroll accumulators run; set by fTileMap_MapChangeHandler
!AFLAGS_UNK0002             = $0002             ; tested by the building area event handlers (shops, church, florist, fortune teller, house); exact meaning not decoded (?)
!AFLAGS_FOR0004             = $0004             ; tested by fCamera_UpdateBG2Scroll, fMap_SetupArea and fPallete_ChangeHandler (second background layer active) (?)
!AFLAGS_UNK0008             = $0008             ; tested by the building area handlers (indoor area bit) (?)
!AFLAGS_UNK0010             = $0010             ; tested by fAudioEngine_SelectMapMusic and the animal daily update (outdoor farm area bit) (?)
!AFLAGS_UNK0020             = $0020             ; time is running: set by fAIAction0x01_UnfreezeTime, cleared by fAIAction0x02_FreezeTime; tested by fDialog_EndDialogRestoreScroll
!AFLAGS_FOR0040             = $0040             ; no direct reader found; always combined with other bits in the area descriptors (?)
!AFLAGS_UNK0080             = $0080             ; no reader found in the code; set by area descriptors only (?)
!AFLAGS_UNK0100             = $0100             ; tested by fNextDayHandler and fObjectMap_ApplyHuricaneDamageByMapFlags (area exposed to weather) (?)
!AFLAGS_UNK0200             = $0200             ; tested by the building area handlers (?)
!AFLAGS_FOR0400             = $0400             ; set by fObjectMap_UpdateFarmTilesNewDay; tested by fGameEngine_AnimalsDailyUpdate (?)
!AFLAGS_UNK0800             = $0800             ; no reader found; set by area descriptors only (?)
!AFLAGS_UNK1000             = $1000             ; no reader found; set by area descriptors only (?)
!AFLAGS_NAMEINPUTREQUEST    = $2000             ; a name entry screen was requested; fCore_MainLoop starts it and clears the bit
!AFLAGS_FORCETELEPORT       = $4000             ; set by the name setters and AI teleport actions: forces a map reload at the transfer position
!AFLAGS_RAWCHARMAP          = $8000             ; tested by fTileMap_MapChangeHandler: the area uses the raw (uncompressed) character map

; dialogFlags
!DFLAGS_PROCESSDIALOG       =   $01     ; set when there is dialog to process
!DFLAGS_UNK02               =   $02             ; set by fDialog code and tested by fInput_* while a dialog runs (exact meaning not decoded) (?)
!DFLAGS_ENDDIALOG           =   $04     ; set when end of dialog is detected
!DFLAGS_NEXTSCREEN          =   $08     ; set when next screeen character is detected
!DFLAGS_OPTIONS             =   $10     ; set when FFFE is detected
!DFLAGS_UNK20               =   $20             ; set by fPlayerInteraction cases, tested by fDialog and fInput while a dialog runs (?)
!DFLAGS_UNK40               =   $30             ; declared but never referenced (note: value $30 in the source, not $40)
!DFLAGS_NUMERICVAR          =   $80     ; set when FFFC is detected

;
; Size and start OK - Game Objects x 40 entries (19C - 73B)
;
struct strcGameObject       $7E019C
    .initailized            : skip 2                ; 19C-19D  $7777 if initialized, 0 if not  | W: fObject_Create, fObject_Destroy, fObject_ClearGameObject, fObject_UpdateAllAnimations | R: fObject_Create, fObject_UpdatePositionAndFlip, fObject_GetSingleObjectData, fObject_UpdateAllAnimations +1
    .spriteTableIdx         : skip 2                ; 19E-19F  used as index to get sprite metadata from banks $86/$87  | W: fObject_Create, fObject_Replace, fObject_ClearGameObject | R: fObject_Create, fObject_Replace, fObject_GetSingleObjectData, fObject_UpdateAllAnimations +1
    .flip                   : skip 2                ; 1A0-1A1  sprite flip bits  | W: fObject_Create, fObject_UpdatePositionAndFlip, fObject_Replace, fObject_ClearGameObject | R: fObject_GetSingleObjectData, fObject_RenderAll
    .unknown6               : skip 2                ; 1A2-1A3  word written by fObject_Create/Replace/ClearGameObject and read by fObject_GetSingleObjectData (copy of strcObject.unkA3) (?)  | W: fObject_Create, fObject_Replace, fObject_ClearGameObject | R: fObject_GetSingleObjectData
    .positionX              : skip 2                ; 1A4-1A5  X position  | W: fObject_Create, fObject_UpdatePositionAndFlip, fObject_Replace, fObject_ClearGameObject | R: fObject_GetSingleObjectData, fObject_RenderAll
    .positionY              : skip 2                ; 1A6-1A7  Y position  | W: fObject_Create, fObject_UpdatePositionAndFlip, fObject_Replace, fObject_ClearGameObject | R: fObject_GetSingleObjectData, fObject_BuildDrawOrderByY, fObject_RenderAll
    .objectListPointer      : skip 4                ; 1A8-1AB  value of table 8X8080, pointer to sprite_table_address  | W: fObject_Create, fObject_Replace, fObject_ClearGameObject, fObject_UpdateAllAnimations | R: fObject_Destroy, fObject_UpdateAllAnimations
    .objectDataPointer      : skip 3                ; 1AC-1AE  ptr24 object data pointer (?)  | W: fObject_Create, fObject_Replace, fObject_ClearGameObject, fObject_UpdateAllAnimations | R: fObject_GetSingleObjectData, fObject_UpdateAllAnimations, fObject_RenderAll, fObject_ParseObjectData
    .totalComponents        : skip 1                ; 1AF      the ammount of SOBJ composing the GOBJ  | W: fObject_ParseObjectData | R: fObject_RenderAll, fObject_ReleaseSpriteTiles, fObject_CheckComponentsPending
    .components             : skip 1                ; 1B0      the components, $FF means unused  | W: fObject_ClearGameObject, fObject_ParseObjectData, fObject_ReleaseSpriteTiles | R: fObject_RenderAll, fObject_ReleaseSpriteTiles, fObject_CheckComponentsPending
    .component1             : skip 1                ; 1B1  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .component2             : skip 1                ; 1B2  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .component3             : skip 1                ; 1B3  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .component4             : skip 1                ; 1B4  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .component5             : skip 1                ; 1B5  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .component6             : skip 1                ; 1B6  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .component7             : skip 1                ; 1B7  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .component8             : skip 1                ; 1B8  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .component9             : skip 1                ; 1B9  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .componentA             : skip 1                ; 1BA  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .componentB             : skip 1                ; 1BB  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .componentC             : skip 1                ; 1BC  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .componentD             : skip 1                ; 1BD  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .componentE             : skip 1                ; 1BE  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
    .componentF             : skip 1                ; 1BF  sprite component slot (see .components): $FF = unused  | W: fObject_ClearGameObject
endstruct align 36


;
; 73C - 73F not used
;


;
; Sprite tile loader statistics (objects.asm)
;
struct strcTileLoadStats       $7E0740
    .tileRefusals                 : skip 2                ; 740-741  frames in which an object was refused rendering because a tile was not resident yet (counter)  | W: fObject_CheckComponentsPending
    .pendingLoads                 : skip 1                ; 742  tile load requests still queued after the frame budget was used  | W: fObject_ProcessTileLoadQueue
    .unk743                 : skip 1                ; 743  cleared together with pendingLoads at the end of the tile loader; never read (padding ?)  | W: fObject_ProcessTileLoadQueue
endstruct


;
; Size and start OK - Map scrool
;
struct strcMapScrool        $7E087C
    .speedX                 : skip 2                ; 87C-87D  | W: fGameEngine_ResetSessionState, fAIAction0x29_SetMapScroll | R: fGraphics_MapScrool
    .speedY                 : skip 2                ; 87E-87F  | W: fGameEngine_ResetSessionState, fAIAction0x29_SetMapScroll | R: fGraphics_MapScrool
    .timer                  : skip 1                ; 880      | W: fGraphics_MapScrool, fGameEngine_ResetSessionState, fAIAction0x29_SetMapScroll | R: fGraphics_MapScrool
endstruct align 5


;
; Size and start OK - Names
;
struct strcNames            $7E0881
    .sPlayer                : skip 4                ; 881-884  | W: fCore_SetPlayerName, fGameEngine_SetDefaults, fGameEngine_LoadGame, fGameEngine_PeekSaveSlot | R: fMainMenu_DrawSaveSlotInfo, fGameEngine_SaveGame
    .sTemp                  : skip 4                ; 885-888  | W: fScreen_NameInput, fNameInput_BButton, fNameInput_AButton | R: fCore_SetPlayerName, fCore_SetBoughtCowName, fCore_SetBornCowName, fCore_SetDogName +3
    .wCurrentCow            : skip 8                ; 889-890  | W: fAreaEvents_House, fAreaEvents_House_PrepareEnding, fAIAction0x31_CowDefaultPath
    .wUnused891             : skip 8                ; 891-898  (no access found in src/)
    .sDog                   : skip 4                ; 899-89C  | W: fCore_SetDogName, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .sHorse                 : skip 4                ; 89D-8A0  | W: fCore_SetHorseName, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .wMostLovedGirl         : skip !NAME_GIRL_SIZE  ; 8A1-8AA  (JP: 8 bytes)  | W: fEvents_FindMostLovedGirl
    .wUnused8AB             : skip 8                ; 8AB-8B2  (no access found in src/)
    .wSeason                : skip !NAME_SEASON_SIZE; 8B3-8BE  (JP: 2 bytes)  | W: fEvents_WriteDateStrings | R: fMainMenu_DrawSaveSlotInfo
    .wWeekday               : skip !NAME_WEEKDAY_SIZE; 8BF-8D0  (DE: 24 bytes, JP: 2 bytes)  | W: fWeather_ApplyForecast
    .wDayOrdinal            : skip !NAME_ORDINAL_SIZE; 8D1-8D4  (JP: none)  | W: fWeather_ApplyForecast
    .wPlayer                : skip 8                ; 8D5-8DC  | W: fCore_SetPlayerName, fGameEngine_SetDefaults, fGameEngine_LoadGame
    .wDog                   : skip 8                ; 8DD-8E4  | W: fCore_SetDogName, fGameEngine_SetDefaults, fGameEngine_LoadGame
    .wHorse                 : skip 8                ; 8E5-8EC  | W: fCore_SetHorseName, fGameEngine_SetDefaults, fGameEngine_LoadGame
    .wFirstChild            : skip 8                ; 8ED-8F4  | W: fCore_SetFirstChildName, fGameEngine_LoadGame
    .wSecondChild           : skip 8                ; 8F5-8FC  | W: fCore_SetSecondChildName, fGameEngine_LoadGame
endstruct align 124


;
; strcAiControlData 8FD-900
;
struct strcAiControlData    $7E08FD+!RAM_SHIFT
    .input                  : skip 2                ; 8FD-8FE  | W: fMap_SetupArea, fMainMenu_AutoHowToPlay, fAIAction0x08_EnableAIControl, fAIAction0x39_WalkForTime +1 | R: fAIAction0x39_WalkForTime, fAIAction0x3A_RunForTime, fInput_AIJoypadHandler, fInput_AiControl
    .counter                : skip 2                ; 8FF-900  | W: fMap_SetupArea, fMainMenu_AutoHowToPlay, fAIAction0x08_EnableAIControl, fAIAction0x39_WalkForTime +1 | R: fAIAction0x39_WalkForTime, fAIAction0x3A_RunForTime
endstruct align 4


;
; Size and start OK - Object data
;
struct strcObjectData       $7E0901+!RAM_SHIFT
    .spriteIdx              : skip 2                ; 901-902  | W: fMap_SetupArea, fPlayerAction_SwapTool, fPlayerAction0x1A, fPlayerAction_MountHorse +64 | R: fPlayerAction_FishingReel, fPlayerAction_IdleHandler, fPlayer_InitSpriteObject, fPlayer_UpdateSpriteObject
    .spriteIdxOld           : skip 2                ; 903-904  | W: fPlayer_InitSpriteObject, fPlayer_UpdateSpriteObject | R: fPlayer_UpdateSpriteObject
    .gameObjectIdx          : skip 2                ; 905-906  | W: fPlayer_InitSpriteObject, fScreen_NameInput | R: fPlayer_UpdateSpriteObject, fPlayer_RefreshObjectExists, fObject_BuildDrawOrderByY
    .playerX                : skip 2                ; 907-908  | W: fMap_SetupArea, fPlayer_MoveInDirection, fGameEngine_ResetSessionState | R: fPlayer_LeaveSnowFootprint
    .playerY                : skip 2                ; 909-90A  | W: fMap_SetupArea, fPlayer_MoveInDirection, fGameEngine_ResetSessionState | R: fPlayer_LeaveSnowFootprint
    .camX                   : skip 2                ; 90B-90C  | W: fCamera_UpdateFromPlayerPos | R: fMap_SetupArea, fItemSell_ResumeCarry
    .camY                   : skip 2                ; 90D-90E  | W: fCamera_UpdateFromPlayerPos | R: fMap_SetupArea, fItemSell_ResumeCarry, fDialog_DialogHandler
    .flip                   : skip 2                ; 90F-910  | W: fPlayer_InitSpriteObject, fPlayer_UpdateSpriteObject, fAIAction0x19_SetPlayerSprite | R: fPlayer_UpdateSpriteObject
    .direction              : skip 2                ; 911-912  | W: fPlayerAction_MountHorse, fAIAction0x07_SetPlayerDirection, fInput_PlayerButtonA_Interact | R: fPlayerAction_Finish, fPlayerAction_DismountHorse, fInput_Unused84C852, fAiInput_PressDown +4
    .directionNew           : skip 2                ; 913-914  | W: fPlayerAction_Finish | R: fPlayerAction_MountHorse, fAIAction0x35_UpdateHorse
    .exist                  : skip 2                ; 915-916  | W: fPlayer_RefreshObjectExists, fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay +3 | R: fPlayerAction_SwapTool, fPlayerAction0x1A, fPlayerAction_MountHorse, fPlayerAction_DismountHorse +17
endstruct align 22


;
; size and start OK - Player data
;
struct strcPlayerData       $7E0917+!RAM_SHIFT
    .stamina                : skip 1                ; 917      | W: fPlayerAction_ConsumeItem, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fPlayerAction_ConsumeItem, fPlayerEnergyHandler, fNextDayHandler, fGameEngine_ResetSessionState +3
    .energy                 : skip 1                ; 918      | W: fPlayerEnergyHandler, fNextDayHandler, fGameEngine_ResetSessionState, fAreaEvents_Intro +1 | R: fPlayerEnergyHandler
    .unkCounter919          : skip 1                ; 919      | W: fMap_SetupArea, fPlayer_MoveInDirection, fGameEngine_ResetSessionState | R: fPlayer_MoveInDirection
    .unkCounter91A          : skip 1                ; 91A      | W: fPlayerAction_Run_StepSound, fGameEngine_ResetSessionState | R: fPlayerAction_Run_StepSound
    .unkCounter91B          : skip 1                ; 91B      | W: fPlayerAction_UseTool, fToolUsedAnimationHandler, fGameEngine_ResetSessionState | R: fPlayerAction_UseTool
    .unkCounter91C          : skip 1                ; 91C      | W: fMap_SetupArea, fCamera_UpdateBG2Scroll | R: fCamera_UpdateBG2Scroll
    .carryItemId            : skip 1                ; 91D      | W: fMap_SetupArea, subItemCarried_ShelfPerfumeGreen, subItemCarried_ShelfPerfumeRed, subItemCarried_ShelfPerfumeBlue +32 | R: fMap_SetupArea, fItemCarried_Begin, fItemCarriedAnimal_PutDown, fItemCarried_PlaceEggInIncubator +12
    .carryItemIdPrev        : skip 1                ; 91E      | W: fPlayerAction_PickUpItem, fGameEngine_ResetSessionState, fAIAction0x2D_JumpOnInteract
    .unkMap91F              : skip 1                ; 91F      | W: fPlayer_InteractWithFrontObject, fGameEngine_ResetSessionState
    .nAiArg                 : skip 1                ; 920      | W: fGameEngine_ResetSessionState, fAIAction0x30_UpdateChicken, fAIAction0x33_UpdateMole, fAIAction0x34_PickUpFish | R: fItemCarriedAnimal_PutDown, fAIAction0x50_ReleaseCarried, fAIAction0x51_ReleaseCarriedAnimal
    .toolEquipped           : skip 1                ; 921  equipped tool / seed / feed id (!EITEM_*), the item used by the Y button  | W: subItemCarried_ShelfGrassSeeds, subItemCarried_ShelfCornSeeds, subItemCarried_ShelfTomatoSeeds, subItemCarried_ShelfPotatoSeeds +26 | R: subItemCarried_ShelfGrassSeeds, subItemCarried_ShelfCornSeeds, subItemCarried_ShelfTomatoSeeds, subItemCarried_ShelfPotatoSeeds +24
    .toolSound              : skip 1                ; 922      | W: fToolUsed_StoreSoundForFrontTile, fGameEngine_ResetSessionState | R: fToolUsedSound_PlayToolHit
    .toolSecond             : skip 1                ; 923  second tool slot: item to restore after a temporary tool swap (cleared when consumed)  | W: subItemCarried_ShelfGrassSeeds, subItemCarried_ShelfCornSeeds, subItemCarried_ShelfTomatoSeeds, subItemCarried_ShelfPotatoSeeds +15 | R: subItemCarried_ShelfGrassSeeds, subItemCarried_ShelfCornSeeds, subItemCarried_ShelfTomatoSeeds, subItemCarried_ShelfPotatoSeeds +14
    .eatFood                : skip 1                ; 924      | W: fCore_GameStart, fEvents_NoonMealCheck, fNextDayHandler | R: fPlayerAction_EatMeal
    .lastExcercise          : skip 1                ; 925      | W: fPlayerAction_Autopilot, fPlayerAction_IdleHandler, fPlayerInteraction_Handler, fNextDayHandler +3 | R: fPlayerAction_IdleHandler
    .leftWater              : skip 1                ; 926      | W: fToolUsedAnimation0x10_WateringCan, fToolUsedAction0x10_WateringCan, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fToolUsedAnimation0x10_WateringCan, fToolUsedAction0x10_WateringCan, fGameEngine_SaveGame
    .leftGrassSeeds         : skip 1                ; 927      | W: subItemCarried_ShelfGrassSeeds, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_SetDefaults +1 | R: subItemCarried_ShelfGrassSeeds, fGameEngine_SaveGame
    .leftCornSeeds          : skip 1                ; 928      | W: subItemCarried_ShelfCornSeeds, fMainMenu_StartHowToPlayDemo, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: subItemCarried_ShelfCornSeeds, fGameEngine_SaveGame
    .leftTomatoSeeds        : skip 1                ; 929      | W: subItemCarried_ShelfTomatoSeeds, fMainMenu_StartHowToPlayDemo, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: subItemCarried_ShelfTomatoSeeds, fGameEngine_SaveGame
    .leftPotatoSeeds        : skip 1                ; 92A      | W: subItemCarried_ShelfPotatoSeeds, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: subItemCarried_ShelfPotatoSeeds, fGameEngine_SaveGame
    .leftTurnipSeeds        : skip 1                ; 92B      | W: subItemCarried_ShelfTurnipSeeds, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_SetDefaults +1 | R: subItemCarried_ShelfTurnipSeeds, fGameEngine_SaveGame
    .leftCowFood            : skip 1                ; 92C      | W: subItemCarried_ShelfCowFeed, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .leftChickenFood        : skip 1                ; 92D      | W: subItemCarried_ShelfChickenFeed, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .leftGrassToCut         : skip 2                ; 92E-92F  | W: fObjectMap_HurricaneDamage, fObjectMap_CowEatGrassTile, fToolUsedAction0x01_Sickle, fToolUsedAction0x11_GoldenSickle | R: fObjectMap_HurricaneDamage, fObjectMap_CowEatGrassTile, fToolUsedAction0x01_Sickle, fToolUsedAction0x11_GoldenSickle +1
    .placedCowFeed          : skip 1                ; 930      | W: fItemCarriedFeed_PutDown, fNextDayHandler, fToolUsedAction0x1A_CowFeed, fGameEngine_ResetSessionState | R: fItemCarriedFeed_PutDown, fToolUsedAction0x1A_CowFeed
    .placedChickenFeed      : skip 1                ; 931      | W: fItemCarriedFeed_PutDown, fNextDayHandler, fToolUsedAction0x19_ChickenFeed, fGameEngine_ResetSessionState +1 | R: fItemCarriedFeed_PutDown, fToolUsedAction0x19_ChickenFeed, fGameEngine_AnimalsDailyUpdate
    .placedCowFeedFlags     : skip 2                ; 932-933  | W: fItemCarriedFeed_PutDown, fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay +2 | R: fItemCarriedFeed_PutDown, fAreaItemSub_CowBarn, fToolUsedAction0x1A_CowFeed, fGameEngine_AnimalsDailyUpdate
    .placedChickenFeedFlags : skip 2                ; 934-935  | W: fItemCarriedFeed_PutDown, fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay +2 | R: fItemCarriedFeed_PutDown, fAreaItemSub_Coop, fToolUsedAction0x19_ChickenFeed
endstruct align 31


;
; 936 not used
;


;
; Size and start OK - Animal data ? but also any seed is last
;
struct strcStockData        $7E0937+!RAM_SHIFT
    .unkCow                 : skip 1                ; 937      | W: fGameEngine_SetDefaults, fGameEngine_LoadGame, fGameEngine_AnimalsDailyUpdate | R: fGameEngine_SaveGame, fAreaEvents_House
    .unkDog                 : skip 1                ; 938      | W: fPlayerAction_PutDownDog, fGameEngine_SpawnChickensOnMap, fAIAction0x36_UpdateDog | R: fAIAction0x36_UpdateDog
    .unkHorse               : skip 1                ; 939      | W: fGameEngine_SpawnChickensOnMap, fAIAction0x35_UpdateHorse, fInput_PlayerButtonA_Interact | R: fAIAction0x35_UpdateHorse
    .unkMole                : skip 1                ; 93A      | W: fToolUsedAction0x02_Plow, fAIAction0x33_UpdateMole | R: fAIAction0x33_UpdateMole
    .unkEachChicken         : skip 12*2             ; 93B-952  | W: fGameEngine_SpawnChickensOnMap, fAIAction0x30_UpdateChicken | R: fAIAction0x30_UpdateChicken
    .unkEachCow             : skip 12*2             ; 953-96A  | W: fGameEngine_SpawnChickensOnMap, fAIAction0x31_CowDefaultPath, fAIAction0x31_CowAnimThenFacePlayerDir, fAIAction0x31_CowAnimThenSteerToPlayer | R: fAIAction0x31_CowDefaultPath
    .toolUseStep             : skip 1               ; 96B      | W: fToolUsedAction0x05_CornSeedBag, fToolUsedAction0x06_TomatoSeedBag, fToolUsedAction0x07_PotatoSeedBag, fToolUsedAction0x08_TurnipSeedBag +5 | R: fToolUsedAction0x05_CornSeedBag, fToolUsedAction0x06_TomatoSeedBag, fToolUsedAction0x07_PotatoSeedBag, fToolUsedAction0x08_TurnipSeedBag +4
endstruct align 53


;
; 96C - 990 ???
;
;struct strcInteractionData  $7E096C+!RAM_SHIFT
;    .unk96C                 : skip 1    ; 96C
;    .breakCounter           : skip 1    ; 96D
;    .index                  : skip 1    ; 96E
;    .arg1                   : skip 1    ; 96F
;    .arg2                   : skip 1    ; 970 
;    .unk971                 : skip 1    ; 971
;endstruct



;
; Size and start to be confirmed
;
struct strcMenuData         $7E0991+!RAM_SHIFT
    .menuIdx                : skip 2                ; 991-992  | W: fScreen_NameInput, fGameEngine_ResetSessionState, fNameInput_SelectCharTable0, fNameInput_SelectCharTable1 +5 | R: fMenu_LoadNameInputCursorPos, fMenu_GetNameInputCellField
    .tableSelector          : skip 1                ; 993      | W: fScreen_NameInput, fGameEngine_ResetSessionState, fNameInput_SelectCharTable0, fNameInput_SelectCharTable1 +2 | R: fMenu_LoadNameInputCursorPos, fMenu_GetNameInputCellField, fScreen_NameInput
    .nameEntryIdx           : skip 1                ; 994      | W: fScreen_NameInput, fGameEngine_ResetSessionState, fNameInput_BButton, fNameInput_AButton | R: fScreen_NameInput_BlinkCursor, fScreen_NameInput_DrawLetterAtCursor, fNameInput_BButton, fNameInput_AButton +1
    .gameObjectIdx          : skip 2                ; 995-996  | W: fScreen_NameInput | R: fScreen_NameInput
    .spriteTableIdx         : skip 2                ; 997-998  | W: fScreen_NameInput | R: fScreen_NameInput
    .flip                   : skip 2                ; 999-99A  | W: fScreen_NameInput | R: fScreen_NameInput
    .posX                   : skip 2                ; 99B-99C  | W: fMenu_LoadNameInputCursorPos, fScreen_NameInput | R: fScreen_NameInput
    .posY                   : skip 2                ; 99D-99E  | W: fMenu_LoadNameInputCursorPos, fScreen_NameInput | R: fScreen_NameInput
    .nameDestinationIdx     : skip 1                ; 99F      | W: fPlayerInteraction_DeliverBoughtCow, fPlayerInteraction_NameNewbornCalf, fUnreached_StartNameInput, fAreaEvents_Farm +2 | R: fScreen_NameInput
endstruct

;
; AI script slot: 49 records of 64 bytes at $7EB586-$7EF1xx (fAI_SelectSlot: ptrAISlot = $7EB586 + slot * 64).
; A slot runs one AI script (ptrAIActionData-style pointer in +$30), optionally owns a game object (+$12) and can move it
; (wander / constant step). Slot 0..48 are driven every frame by the slot loop of fAI_RunSlots.
; Offsets verified in fAI_ResetSlotFull, fAI_UpdateSlotWander, fAI_UpdateSlotStepMove, fAI_UpdateSlotMovementAndObject
; and fAI_StartSlotScript (see docs/ai/commands.md for the script side).
;
struct strcAISlot           $7EB586
    .active                 skip 1  ; +00 0 = free slot, 1 = script running
    .flags                  skip 1  ; +01 AIFLAGS_*: object/movement control bits (one-shot bits $02/$04/$10 are cleared every frame)
    .direction              skip 1  ; +02 facing / walk direction: 0 down, 1 up, 2 left, 3 right (set by the wander code)
    .stepDeltaX             skip 1  ; +03 signed X displacement per step (AI command 0x0D, wander: 0/1)
    .stepDeltaY             skip 1  ; +04 signed Y displacement per step
    .stepPeriod             skip 1  ; +05 frames between two steps (reload value of +06)
    .stepCounter            skip 1  ; +06 frame countdown to the next step; the wander logic only runs when it equals +05
    .wanderIdlePeriod       skip 1  ; +07 reload value of +08 (frames the walker stands still)
    .wanderIdleCounter      skip 1  ; +08 idle countdown; 0 = pick a new walk direction
    .wanderRangeX           skip 1  ; +09 allowed distance from the home X (+1E) while wandering
    .wanderRangeY           skip 1  ; +0A allowed distance from the home Y (+20) while wandering
    .wanderStepPeriod       skip 1  ; +0B step period copied to +05/+06 when a walk starts
    .unk0C                  skip 1  ; +0C cleared by fAI_ResetSlotFull; read by the cow/chicken/mole/horse updates (behaviour parameter ?)
    .unk0D                  skip 1  ; +0D written by fAIAction0x17_RollRandom, read by fAIAction0x18_JumpIfRandomEquals (script scratch byte)
    .animState              skip 1  ; +0E animal state byte (cow/chicken update actions write and test it)
    .wanderDirMask          skip 1  ; +0F allowed walk directions: 1 down, 2 up, 4 left, 8 right; 0 = random direction from strcPlayer.lastRandomNumber
    .waitCounter            skip 2  ; +10 frames the script must still wait; the slot loop runs the next command only when it is 0
    .gameObjectIdx          skip 2  ; +12 index of the game object owned by the slot (strcObject.gameObjectIdx)
    .flip                   skip 2  ; +14 sprite flip bits of the object
    .spriteTableIdx         skip 2  ; +16 current sprite (object animation) index
    .spriteTableIdxPrev     skip 2  ; +18 sprite index drawn last frame; compared to detect a sprite change (AIFLAGS_REPLACESPRITE)
    .posX                   skip 2  ; +1A object X position (pixels)
    .posY                   skip 2  ; +1C object Y position (pixels)
    .homeX                  skip 2  ; +1E centre X of the wander range
    .homeY                  skip 2  ; +20 centre Y of the wander range
    .unk22                  skip 14 ; +22-2F not accessed by any code seen so far
    .pScript                skip 3  ; +30 ptr24 current position of the script (ptrAIActionData is loaded from / stored to it)
    .unk33                  skip 1  ; +33 used by fAIAction0x1A_SpawnNpc/0x1F/0x2B/0x2D/0x2F/0x49 (interaction / talk state)
    .unk34                  skip 2  ; +34-35 not accessed
    .unk36                  skip 1  ; +36 wander related (fAIAction0x22_StartRandomWalk/0x2E write, fAI_UpdateSlotWander reads)
    .unk37                  skip 8  ; +37-3E not accessed
    .slotIndex              skip 1  ; +3F index of the slot itself (the A argument of fAI_StartSlotScript)
endstruct align 64

!AIFLAGS_HASOBJECT              =  $01          ; slot drives a game object: fAI_RunSlots calls fAI_UpdateSlotMovementAndObject only when set
!AIFLAGS_CREATEOBJECT              =  $02       ; one-shot: fObject_Create is called and the new game object index is stored in the slot
!AIFLAGS_REPLACESPRITE              =  $04      ; one-shot: fObject_Replace when the slot sprite index differs from the previous one
!AIFLAGS_WANDER              =  $08             ; enables fAI_UpdateSlotWander (random walk inside the home range)
!AIFLAGS_SKIPMOVE              =  $10           ; one-shot: skips the wander and step move update for this frame
!AIFLAGS_STEPMOVE              =  $20           ; enables fAI_UpdateSlotStepMove (constant velocity from AI command 0x0D)
!AIFLAGS_DESTROYOBJECT              =  $40      ; one-shot: fObject_Destroy is called for the slot object
!AIFLAGS_WANDERNOLIMIT              =  $80      ; wander ignores the home range limit while set


; Cow Data x 12 entries (7EC1C6 - 7EC285)
struct strcCowData          $7EC1C6
    .statusFlags            : skip 1                ; C1C6     (no access found in src/)
    .interactions           : skip 1                ; C1C7     (no access found in src/)
    .mapID                  : skip 1                ; C1C8     (no access found in src/)
    .age                    : skip 1                ; C1C9     also pregancy, crankyness, sickness
    .happiness              : skip 1                ; C1CA     (no access found in src/)
    .unknown5               : skip 1                ; C1CB     (no access found in src/)
    .unknown6               : skip 1                ; C1CC     (no access found in src/)
    .unknown7               : skip 1                ; C1CD     (no access found in src/)
    .positionX              : skip 2                ; C1CE-C1CF (no access found in src/)
    .positionY              : skip 2                ; C1D0-C1D1 (no access found in src/)
    .name                   : skip 4                ; C1D2-C1D5 4 short bytes as name
endstruct align 16

!COWSTATUS_EXISTS           =   $01             ; cow status bit $01: exists
!COWSTATUS_BABY             =   $02             ; cow status bit $02: baby
!COWSTATUS_CHILD            =   $04             ; cow status bit $04: child
!COWSTATUS_ADULT            =   $08             ; cow status bit $08: adult
!COWSTATUS_CRANKY           =   $10             ; cow status bit $10: cranky
!COWSTATUS_SICK             =   $20             ; cow status bit $20: sick
!COWSTATUS_PREGNANT         =   $40             ; cow status bit $40: pregnant
!COWSTATUS_BIRTHINGTODAY    =   $80             ; cow status bit $80: birthingtoday


; Chicken Data x 12 entries (7EC286 - 7EC2E5)
struct strcChickenData      $7EC286
    .statusFlags            : skip 1                ; C286     (no access found in src/)
    .mapID                  : skip 1                ; C287     (no access found in src/)
    .age                    : skip 1                ; C288     (no access found in src/)
    .unknown3               : skip 1                ; C289     (no access found in src/)
    .positionX              : skip 2                ; C28A-C28B (no access found in src/)
    .positionY              : skip 2                ; C28C-C28D (no access found in src/)
endstruct align 8

!CHICKENSTATUS_EXISTS       =   $01             ; chicken status bit $01: exists
!CHICKENSTATUS_ISEGG        =   $02             ; chicken status bit $02: isegg
!CHICKENSTATUS_CHILD        =   $04             ; chicken status bit $04: child
!CHICKENSTATUS_ADULT        =   $08             ; chicken status bit $08: adult
!CHICKENSTATUS_CRANKY       =   $10             ; chicken status bit $10: cranky
!CHICKENSTATUS_HELDBYPLAYER =   $20             ; chicken status bit $20: heldbyplayer
!CHICKENSTATUS_ININCUBATOR  =   $40             ; chicken status bit $40: inincubator
!CHICKENSTATUS_UNK80        =   $80             ; chicken status bit $80: unk80


; Shed Items
struct strcShedItems        $7F1F00
    .row1                   : skip 1                ; 1F00     0x01: sickle,         0x02: hoe,              0x04: hammer,           0x08: axe,              0x10: cornSeed,         0x20: tomatoSeed,       0x40: potatoSeed,       0x80: turnipSeed  | W: subItemCarried_ShelfCornSeeds, subItemCarried_ShelfTomatoSeeds, subItemCarried_ShelfPotatoSeeds, subItemCarried_ShelfTurnipSeeds +13 | R: subItemCarried_ShelfCornSeeds, subItemCarried_ShelfTomatoSeeds, subItemCarried_ShelfPotatoSeeds, subItemCarried_ShelfTurnipSeeds +10
    .row2                   : skip 1                ; 1F01     0x01: medicine,       0x02: miraclePotion,    0x04: bell,             0x08: grassSeed,        0x10: paint,            0x20: milker,           0x40: brush,            0x80: wateringCan  | W: subItemCarried_ShelfGrassSeeds, subItemCarried_ShelfPaint, subItemCarried_ShelfMilker, subItemCarried_ShelfBrush +9 | R: subItemCarried_ShelfGrassSeeds, subItemCarried_ShelfPaint, subItemCarried_ShelfMilker, subItemCarried_ShelfBrush +5
    .row3                   : skip 1                ; 1F02     0x01: goldSickle,     0x02: goldHoe,          0x04: goldHammer,       0x08: goldAxe,          0x10: sprinkler,        0x20: beanstalkSeed,    0x40: blueDiamond,      0x80: blueFeather  | W: subItemCarried_ShelfSuperSickle, subItemCarried_ShelfSuperHoe, subItemCarried_ShelfSuperHammer, subItemCarried_ShelfSuperAxe +8 | R: subItemCarried_ShelfSuperSickle, subItemCarried_ShelfSuperHoe, subItemCarried_ShelfSuperHammer, subItemCarried_ShelfSuperAxe +4
    .row4                   : skip 1                ; 1F03     0x01: chickenFeed,    0x02: cowFeed  | W: subItemCarried_ShelfChickenFeed, subItemCarried_ShelfCowFeed, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay +3 | R: subItemCarried_ShelfChickenFeed, subItemCarried_ShelfCowFeed, fGameEngine_SaveGame
endstruct align 4


; Flags
struct strcFlags            $7F1F5A
    ; daily
    .daily1                 : skip 2                ; 1F5A-1F5B | W: fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_ResetSessionState
    .daily2                 : skip 2                ; 1F5C-1F5D | W: fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_ResetSessionState
    .daily3                 : skip 2                ; 1F5E-1F5F | W: fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_ResetSessionState
    .daily4                 : skip 2                ; 1F60-1F61 | W: fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_ResetSessionState
    .daily5                 : skip 2                ; 1F62-1F63 | W: fNextDayHandler, fGameEngine_ResetSessionState
    ; events
    .event1                 : skip 2                ; 1F64-1F65 | W: fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .event2                 : skip 2                ; 1F66-1F67 | W: fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .event3                 : skip 2                ; 1F68-1F69 | W: fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .event4                 : skip 2                ; 1F6A-1F6B | W: fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .event5                 : skip 2                ; 1F6C-1F6D | W: fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .event6                 : skip 2                ; 1F6E-1F6F | W: fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .event7                 : skip 2                ; 1F70-1F71 | W: fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    .event8                 : skip 2                ; 1F72-1F73 | W: fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_SetDefaults, fGameEngine_LoadGame | R: fGameEngine_SaveGame
    ; unknown
    .unknown1               : skip 2                ; 1F74-1F75 | W: fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_ResetSessionState
    .unknown2               : skip 2                ; 1F76-1F77 | W: fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_ResetSessionState
    .unknown3               : skip 2                ; 1F78-1F79 | W: fNextDayHandler, fMainMenu_StartHowToPlayDemo, fMainMenu_AutoHowToPlay, fGameEngine_ResetSessionState | R: fPlayerInteraction_EggHuntResolveSpot
endstruct


; daily1

; daily2
!DFLAGS2_BROKECHICKENSTATUE = $0080             ; daily2 story flag $80: brokechickenstatue
!DFLAGS2_DUGUPMONEY         = $0200             ; daily2 story flag $0200: dugupmoney

; daily3

; daily4

; daily5

; event1

; event2
!EFLAGS2_MARRIEDMARIA       = $0001             ; event2 story flag $01: marriedmaria
!EFLAGS2_MARRIEDANN         = $0002             ; event2 story flag $02: marriedann
!EFLAGS2_MARRIEDNINA        = $0004             ; event2 story flag $04: marriednina
!EFLAGS2_MARRIEDELLEN       = $0008             ; event2 story flag $08: marriedellen
!EFLAGS2_MARRIEDEVE         = $0010             ; event2 story flag $10: marriedeve
!EFLAGS2_MARRIED            = !EFLAGS2_MARRIEDMARIA|!EFLAGS2_MARRIEDANN|!EFLAGS2_MARRIEDNINA|!EFLAGS2_MARRIEDELLEN|!EFLAGS2_MARRIEDEVE; married (combination of the bits above)
!EFLAGS2_PAINTEDHOUSEDOOR   = $0200             ; event2 story flag $0200: paintedhousedoor
!EFLAGS2_PAINTEDHOUSELEFT   = $0400             ; event2 story flag $0400: paintedhouseleft
!EFLAGS2_PAINTEDHOUSECENTER = $0800             ; event2 story flag $0800: paintedhousecenter
!EFLAGS2_PAINTEDHOUSERIGHT  = $1000             ; event2 story flag $1000: paintedhouseright
!EFLAGS2_FREEDIMPFISH       = $2000             ; event2 story flag $2000: freedimpfish

; event3

; event4

; event5

; event6

; event7

; event8

; unknown1

; unknown2

; unknown3

!JOYPAD_UNUSED1             = $0001             ; joypad button bit: unused1
!JOYPAD_UNUSED2             = $0002             ; joypad button bit: unused2
!JOYPAD_UNUSED3             = $0004             ; joypad button bit: unused3
!JOYPAD_UNUSED4             = $0008             ; joypad button bit: unused4
!JOYPAD_R                   = $0010             ; joypad button bit: r
!JOYPAD_L                   = $0020             ; joypad button bit: l
!JOYPAD_X                   = $0040             ; joypad button bit: x
!JOYPAD_A                   = $0080             ; joypad button bit: a
!JOYPAD_RIGHT               = $0100             ; joypad button bit: right
!JOYPAD_LEFT                = $0200             ; joypad button bit: left
!JOYPAD_DOWN                = $0400             ; joypad button bit: down
!JOYPAD_UP                  = $0800             ; joypad button bit: up
!JOYPAD_START               = $1000             ; joypad button bit: start
!JOYPAD_SELECT              = $2000             ; joypad button bit: select
!JOYPAD_Y                   = $4000             ; joypad button bit: y
!JOYPAD_B                   = $8000             ; joypad button bit: b