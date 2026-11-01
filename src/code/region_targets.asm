;;
; @file     region_targets.asm
; @brief    Symbol definitions (`name = $BBAAAA`) for branch targets, data pointers and labels inside the regional `if !REGION_*` patch blocks of banks $80-$85 that have no label in the US sources, plus US labels that sit at another address in a region.
; @details  Only EU, DE and JP get entries (the US build does not read the file). The generated list is split by region; names follow the US label of the containing routine plus a suffix (_RowLoop, _WaitFrame, ...).
;           Evidence for each: the original ROM address in that release (tools/dev/region_patch.py). Recorded in docs/naming/M_labels_bank80-82.csv and described in docs/regions.md.
; @bank     $80-$85
; @see      docs/regions.md, tools/dev/region_patch.py
;;
; Branch targets, data pointers and labels of the regional patch blocks (if !REGION_xx ... endif in
; banks $80-$85) that have no label in the US sources, plus US labels that sit at another address in a region.
; Each line is `name = $BBAAAA` (the address in that release); names are described in docs/regions.md and recorded
; in docs/naming/M_labels_bank80-82.csv. The US build does not read them. Generated once by tools/dev/region_patch.py.
if !REGION_DE
    subItemCarried_Corn_Return = $81814E
    subItemCarried_Tomato_Return = $81816B
    subItemCarried_Potato_Return = $818188
    subItemCarried_Turnip_Return = $8181A5
    fMap_CopyTilePatternToTilemapBuffer_OuterLoop = $81A8D4
    fPlayerInteraction0x42_ShowDialog = $81E768
    fPlayerInteraction0x42_RequestNameInput = $81E7BB
    aDayOrdinalString_DE = $828C63
    aToolUsedActionTable = $82A748
    fObjectMap_HuricaneDamage_RowLoop = $82A8E4
    fObjectMap_HuricaneDamage_TileLoop = $82A8E7
    fObjectMap_EatingGrass_RowLoop = $82AB6E
    fObjectMap_EatingGrass_TileLoop = $82AB71
    fObjectMap_CalculateRanchDev_RowLoop = $82ABDE
    fObjectMap_CalculateRanchDev_TileLoop = $82ABE1
    fMainMenu_StartHowToPlayDemo_WaitFrame = $82D504
    fMainMenu_PrepareHowToPlay_WaitFrame = $82D886
    fMainMenu_StateOpeningDemo_WaitFrame = $82DA9A
    fMainMenu_StateTitleStartCursorAnim_Finish = $82DEDB
    nSystemTransferTilemapTable_Set2 = $82E79B
    aSystemTransferArgument = $82E8B7
    fMainMenu_DrawSaveSlotFrames_Loop = $82E8C4
    fScreen_NameInput_WaitFrame = $82EADC
    fInput_Case04_StartPressedTarget = $84C2F4
elseif !REGION_EU
    subItemCarried_Corn_Return = $81814E
    subItemCarried_Tomato_Return = $81816B
    subItemCarried_Potato_Return = $818188
    subItemCarried_Turnip_Return = $8181A5
    fMap_CopyTilePatternToTilemapBuffer_OuterLoop = $81A8D4
    fPlayerInteraction0x42_ShowDialog = $81E768
    fPlayerInteraction0x42_RequestNameInput = $81E7BB
    fObjectMap_HuricaneDamage_RowLoop = $82A772
    fObjectMap_HuricaneDamage_TileLoop = $82A775
    fObjectMap_EatingGrass_RowLoop = $82A9FC
    fObjectMap_EatingGrass_TileLoop = $82A9FF
    fObjectMap_CalculateRanchDev_RowLoop = $82AA6C
    fObjectMap_CalculateRanchDev_TileLoop = $82AA6F
    fMainMenu_StartHowToPlayDemo_WaitFrame = $82D392
    fMainMenu_PrepareHowToPlay_WaitFrame = $82D714
    fMainMenu_StateOpeningDemo_WaitFrame = $82D928
    fMainMenu_StateTitleStartCursorAnim_Finish = $82DD69
    fMainMenu_NewGameSlotSelect_MoveCursorSlot2 = $82E18F
    fMainMenu_DrawSaveSlotFrames_Loop = $82E730
    fScreen_NameInput_WaitFrame = $82E948
    fInput_Case04_StartPressedTarget = $84C2F4
elseif !REGION_JP
    fPaletteAnim_TownFall_NYPublicSquare_T1 = $80CAA1
    fPaletteAnim_TownFall_T2 = $80CAA1
    fPaletteAnim_TownFall_T3 = $80CAA1
    fPaletteAnim_TownFall_T4 = $80CAA1
    fPaletteAnim_TownSpring_DancingS1_EggFestival_T1 = $80CAA1
    fPaletteAnim_TownSpring_T2 = $80CAA1
    fPaletteAnim_TownSpring_T3 = $80CAA1
    fPaletteAnim_TownSpring_T4 = $80CAA1
    fPaletteAnim_TownSummer_T1 = $80CAA1
    fPaletteAnim_TownSummer_T2 = $80CAA1
    fPaletteAnim_TownSummer_T3 = $80CAA1
    fPaletteAnim_TownSummer_T4 = $80CAA1
    fPaletteAnim_TownFall_T4_Part2 = $80CEE8
    fPaletteAnim_WoodsSpring_T2 = $80D0CD
    fPaletteAnim_WoodsSpring_T3 = $80D0CD
    fPaletteAnim_WoodsSpring_T4 = $80D0CD
    fPaletteAnim_WoodsSpring_T4_Part2 = $80D342
    fPaletteAnim_WoodsFall_T1 = $80D541
    fPaletteAnim_WoodsFall_T2 = $80D541
    fPaletteAnim_WoodsSummer_T1 = $80D541
    fPaletteAnim_WoodsSummer_T3 = $80D541
    fPaletteAnim_WoodsSummer_T4 = $80D541
    fPaletteAnim_MountainTopAllSeasonsAndNY_T4 = $80D63E
    fPaletteAnim_WoodsFall_T3 = $80D63E
    fPaletteAnim_WoodsFall_T4 = $80D63E
    fPaletteAnim_WoodsWinter_NYSpa_T1 = $80D63E
    fPaletteAnim_WoodsWinter_NYSpa_T2 = $80D63E
    fPaletteAnim_WoodsWinter_NYSpa_T3 = $80D63E
    fPaletteAnim_WoodsWinter_NYSpa_T4 = $80D63E
    pPaletteAnimRoutine_None = $80FFFF
    aDayOrdinalString = $8289F7
    aSeasonString = $8289F7
    aWeekdayString = $8289F7
    aDayOrdinalWordTable = $828A09
    aToolUsedActionTable = $82A372
    aToolUsedActionTable_JP = $82A3AA
    fObjectMap_HuricaneDamage_RowLoop = $82A50E
    fObjectMap_HuricaneDamage_TileLoop = $82A511
    fObjectMap_EatingGrass_RowLoop = $82A798
    fObjectMap_EatingGrass_TileLoop = $82A79B
    fObjectMap_CalculateRanchDev_RowLoop = $82A808
    fObjectMap_CalculateRanchDev_TileLoop = $82A80B
    fMainMenu_StartHowToPlayDemo_WaitFrame = $82D12E
    fMainMenu_PrepareHowToPlay_WaitFrame = $82D4B0
    fMainMenu_StateOpeningDemo_WaitFrame = $82D726
    fMainMenu_StateTitleStartCursorAnim_Finish = $82DB67
    fMainMenu_StateNewGameSlotSelect_CheckSlot2 = $82DE27
    fMainMenu_NewGameSlotSelect_WaitFrame_ResetScrollX = $82DF1A
    fMainMenu_NewGameSlotSelect_MoveCursorSlot2_ResetScrollX = $82DF76
    nSystemTransferTilemapTable_Set2 = $82E375
    fMainMenu_DrawSaveSlotFrames_Loop = $82E456
    fScreen_NameInput_WaitFrame = $82E66E
    aYearOrdinalString = $82EFCF
endif
