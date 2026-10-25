    ; HarvestMoon is LOROM
    lorom
    
    ; Region selection. The US build is the default; `-DREGION_EU=1`, `-DREGION_DE=1` or `-DREGION_JP=1`
    ; (tools/build.py --region EU|DE|JP) switch the `if !REGION_xx` patch blocks in banks $80-$85 to the code of
    ; that release. See docs/regions.md.
    incsrc "common/region.asm"

    ; Default padding value
    padbyte $00
    
    ; SNES
    incsrc "common/snes.asm"
    
    ; DiztinGUIsh generated labels
    incsrc "common/ram.asm"
    
    ; Structures
    incsrc "common/structures.asm"
    incsrc "common/enums.asm"
    
    ; ROM header
    incsrc "code/header.asm"
    
    ; Objects data
    incsrc "data/objects/bank_86.asm"
    incsrc "data/objects/bank_87.asm"
    
    ; Sprites GFX
    incsrc "data/gfx/sprites/bank_88.asm"
    incsrc "data/gfx/sprites/bank_89.asm"
    incsrc "data/gfx/sprites/bank_8A.asm"
    incsrc "data/gfx/sprites/bank_8B.asm"
    incsrc "data/gfx/sprites/bank_8C.asm"
    incsrc "data/gfx/sprites/bank_8D.asm"
    incsrc "data/gfx/sprites/bank_8E.asm"
    incsrc "data/gfx/sprites/bank_8F.asm"
    incsrc "data/gfx/sprites/bank_90.asm"
    incsrc "data/gfx/sprites/bank_91.asm"
    
    ; Tiles GFX
    incsrc "data/gfx/tiles/bank_92.asm"
    incsrc "data/gfx/tiles/bank_93.asm"
    incsrc "data/gfx/tiles/bank_94.asm"
    incsrc "data/gfx/tiles/bank_95.asm"
    incsrc "data/gfx/tiles/bank_96.asm"
    incsrc "data/gfx/tiles/bank_97.asm"
    incsrc "data/gfx/tiles/bank_98.asm"
    incsrc "data/gfx/tiles/bank_99.asm"
    incsrc "data/gfx/tiles/bank_9A.asm"
    incsrc "data/gfx/tiles/bank_9B.asm"
    incsrc "data/gfx/tiles/bank_9C.asm"
    incsrc "data/gfx/tiles/bank_9D.asm"
    incsrc "data/gfx/tiles/bank_9E.asm"
    incsrc "data/gfx/tiles/bank_9F.asm"
    incsrc "data/gfx/tiles/bank_A0.asm"
    
    ; Characters GFX
    incsrc "data/gfx/characters/bank_A1.asm"
    incsrc "data/gfx/characters/bank_A2.asm"
    incsrc "data/gfx/characters/bank_A3.asm"
    incsrc "data/gfx/characters/bank_A4.asm"
    incsrc "data/gfx/characters/bank_A5.asm"
    incsrc "data/gfx/characters/bank_A6.asm"
    
    ; Tilemap data
    incsrc "data/tilemaps/bank_A7.asm"
    
    ; Palettes
    incsrc "data/gfx/palettes/bank_A8.asm"
    incsrc "data/gfx/palettes/bank_A9.asm"
    
    ; JP dialogs (empty in US/EU/DE versions)
    ;incsrc "data/dialogs/jp/bank_AA.asm"
    ;incsrc "data/dialogs/jp/bank_AB.asm"
    ;incsrc "data/dialogs/jp/bank_AC.asm"
    
    ; Audio
    incsrc "data/audio/bank_AD.asm"
    incsrc "data/audio/bank_AE.asm"
    incsrc "data/audio/bank_AF.asm"
    incsrc "data/audio/bank_B0.asm"
    incsrc "data/audio/bank_B1.asm"
    incsrc "data/audio/bank_B2.asm"
    
    ; AI
    incsrc "ai/region.asm"
    incsrc "ai/commands.asm"
    incsrc "ai/us/scripts.asm"
    
    ; US/EU/DE dialogs
    incsrc "data/dialogs/macros.asm"
    incsrc "data/dialogs/us/bank_B6.asm"
    incsrc "data/dialogs/us/bank_B7.asm"
    incsrc "data/dialogs/us/bank_B8.asm"
    incsrc "data/dialogs/us/bank_B9.asm"
    incsrc "data/dialogs/us/bank_BA.asm"
    incsrc "data/dialogs/us/bank_BB.asm"
    
    ; Unused
    ;incsrc "data/padding/bank_BC.asm"
    ;incsrc "data/padding/bank_BD.asm"
    ;incsrc "data/padding/bank_BE.asm"
    ;incsrc "data/padding/bank_BF.asm"
    
    ; Source Code
    incsrc "common/macros.asm"
    incsrc "code/bank_80/core.asm"
    incsrc "code/bank_80/palette.asm"
    incsrc "code/bank_80/routines.asm"
    incsrc "code/bank_80/tilemaps.asm"
    incsrc "code/bank_80/audio_data.asm"
    incsrc "code/bank_80/data_tables.asm"
    incsrc "code/bank_81/item_actions.asm"
    incsrc "code/bank_81/items_misc.asm"
    incsrc "code/bank_81/player_actions.asm"
    incsrc "code/bank_81/player_update.asm"
    incsrc "code/bank_82/game_events.asm"
    incsrc "code/bank_82/tools.asm"
    incsrc "code/bank_82/object_map.asm"
    incsrc "code/bank_82/sound.asm"
    incsrc "code/bank_82/object_data.asm"
    incsrc "code/bank_82/interaction_data.asm"
    incsrc "code/bank_82/main_loop.asm"
    incsrc "code/bank_82/system.asm"
    incsrc "code/bank_82/screen_text.asm"
    incsrc "code/bank_82/menu.asm"
    incsrc "code/bank_83/math.asm"
    incsrc "code/bank_83/random.asm"
    incsrc "code/bank_83/graphics.asm"
    incsrc "code/bank_83/audio.asm"
    incsrc "code/bank_83/dialog.asm"
    incsrc "code/bank_83/game_engine.asm"
    incsrc "code/bank_83/map_engine.asm"
    incsrc "code/bank_84/ai_engine.asm"
    incsrc "code/bank_84/input.asm"
    incsrc "code/bank_85/objects.asm"
    incsrc "code/region_targets.asm"