    ; HarvestMoon is LOROM
    lorom
    
    ; Default padding value
    padbyte $00
    
    ; SNES
    incsrc "snes.asm"
    
    ; DiztinGUIsh generated labels
    incsrc "labels.asm"
    
    ; Structures
    incsrc "structures.asm"
    incsrc "enums.asm"
    
    ; ROM header
    incsrc "SOURCE/header.asm"
    
    ; Objects data
    incsrc "DATA/objects/bank_86.asm"
    incsrc "DATA/objects/bank_87.asm"
    
    ; Sprites GFX
    incsrc "GFX/sprites/bank_88.asm"
    incsrc "GFX/sprites/bank_89.asm"
    incsrc "GFX/sprites/bank_8A.asm"
    incsrc "GFX/sprites/bank_8B.asm"
    incsrc "GFX/sprites/bank_8C.asm"
    incsrc "GFX/sprites/bank_8D.asm"
    incsrc "GFX/sprites/bank_8E.asm"
    incsrc "GFX/sprites/bank_8F.asm"
    incsrc "GFX/sprites/bank_90.asm"
    incsrc "GFX/sprites/bank_91.asm"
    
    ; Tiles GFX
    incsrc "GFX/tiles/bank_92.asm"
    incsrc "GFX/tiles/bank_93.asm"
    incsrc "GFX/tiles/bank_94.asm"
    incsrc "GFX/tiles/bank_95.asm"
    incsrc "GFX/tiles/bank_96.asm"
    incsrc "GFX/tiles/bank_97.asm"
    incsrc "GFX/tiles/bank_98.asm"
    incsrc "GFX/tiles/bank_99.asm"
    incsrc "GFX/tiles/bank_9A.asm"
    incsrc "GFX/tiles/bank_9B.asm"
    incsrc "GFX/tiles/bank_9C.asm"
    incsrc "GFX/tiles/bank_9D.asm"
    incsrc "GFX/tiles/bank_9E.asm"
    incsrc "GFX/tiles/bank_9F.asm"
    incsrc "GFX/tiles/bank_A0.asm"
    
    ; Characters GFX
    incsrc "GFX/characters/bank_A1.asm"
    incsrc "GFX/characters/bank_A2.asm"
    incsrc "GFX/characters/bank_A3.asm"
    incsrc "GFX/characters/bank_A4.asm"
    incsrc "GFX/characters/bank_A5.asm"
    incsrc "GFX/characters/bank_A6.asm"
    
    ; Tilemap data
    incsrc "DATA/tilemaps/bank_A7.asm"
    
    ; Palettes
    incsrc "GFX/palettes/bank_A8.asm"
    incsrc "GFX/palettes/bank_A9.asm"
    
    ; JP dialogs (empty in US/EU/DE versions)
    ;incsrc "DIALOGS/JP/bank_AA.asm"
    ;incsrc "DIALOGS/JP/bank_AB.asm"
    ;incsrc "DIALOGS/JP/bank_AC.asm"
    
    ; Audio
    incsrc "AUDIO/bank_AD.asm"
    incsrc "AUDIO/bank_AE.asm"
    incsrc "AUDIO/bank_AF.asm"
    incsrc "AUDIO/bank_B0.asm"
    incsrc "AUDIO/bank_B1.asm"
    incsrc "AUDIO/bank_B2.asm"
    
    ; AI
    incsrc "AI/helpers.asm"
    incsrc "AI/US/bank_B3.asm"
    incsrc "AI/US/bank_B4.asm"
    incsrc "AI/US/bank_B5.asm"
    
    ; US/EU/DE dialogs
    incsrc "DIALOGS/helpers.asm"
    incsrc "DIALOGS/US/bank_B6.asm"
    incsrc "DIALOGS/US/bank_B7.asm"
    incsrc "DIALOGS/US/bank_B8.asm"
    incsrc "DIALOGS/US/bank_B9.asm"
    incsrc "DIALOGS/US/bank_BA.asm"
    incsrc "DIALOGS/US/bank_BB.asm"
    
    ; Unused
    ;incsrc "DATA/padding/bank_BC.asm"
    ;incsrc "DATA/padding/bank_BD.asm"
    ;incsrc "DATA/padding/bank_BE.asm"
    ;incsrc "DATA/padding/bank_BF.asm"
    
    ; Source Code
    incsrc "SOURCE/helpers.asm"
    incsrc "SOURCE/bank_80.asm"
    incsrc "SOURCE/bank_81.asm"
    incsrc "SOURCE/bank_82.asm"
    incsrc "SOURCE/bank_83.asm"
    incsrc "SOURCE/bank_84.asm"
    incsrc "SOURCE/bank_85.asm"