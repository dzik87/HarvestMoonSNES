"""Sprite (OBJ graphics) banks: engine identity is bank = $88 + (sprite id >> 8); the label carries the content name."""
FIRST_BANK = 0x88
NAMES = ["Sprites_Player_0", "Sprites_Player_1", "Sprites_Player_2", "Sprites_Player_3", "Sprites_ItemsCrops",
         "Sprites_Cattle", "Sprites_DogChickensHorse", "Sprites_Npc_0", "Sprites_Npc_1", "Sprites_Npc_2_Ui"]


def label(bank):
    """ROM bank number ($88..$91) -> blob label."""
    return NAMES[bank - FIRST_BANK]


def bank(lab):
    """Blob label (with or without extension) -> ROM bank number."""
    return FIRST_BANK + NAMES.index(lab.split(".")[0])
