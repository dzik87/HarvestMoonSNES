#!/usr/bin/env python3
"""Names for the 1104 animation objects of banks $86/$87 (object index = engine identity, see docs/naming/README.md).

  python3 tools/migration/obj_names.py csv      write docs/naming/K5_objects.csv (index,old,new,family,confidence,reason)
  python3 tools/migration/obj_names.py apply    write the names into assets/objects/bank_*/objects/NNNN.json ("name" field)
                                                and rename assets/gfx/png/frames/obj_XXXX -> obj_XXXX_<Name> (git mv)

Evidence, strongest first:
  1. carried item table (assets/tables/data/carried_items.csv): every carried item lists the objects it uses
     (icon, held / arc animations, dropped state, thrown arc); the item names come from the table labels and the enum order. high
  2. NPC sprite tables (assets/ai/npc_sprite_tables.txt): per direction objects (0 down, 1 up, 2 right, 3 left); with the
     rendered frames (build/sprites_assembled) they give the walk / idle / direction suffix. medium
  3. rendered frames grouped into families (player poses, tools, animals, NPC appearances); ranges below. medium / low
  4. code: love variables (nLove_*) in the NPC scripts 19-1D, the ending script text objects. high / medium
Uncertain names are descriptive and carry `Unk`: Npc_Unk_<Look>_<id>, Obj_Unk_<id>.
"""
import csv
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
CSV = ROOT / "docs" / "naming" / "K5_objects.csv"
OBJ = ROOT / "assets" / "objects"
FRAMES = ROOT / "assets" / "gfx" / "png" / "frames"
TOTAL = 0x450

# carried item id -> (name, confidence, reason); tools follow the order of the EITEM enum (carried id = EITEM + $29)
ITEMS = {
    0x01: ("Mushroom", "high", "table label"), 0x02: ("PoisonMushroom", "high", "table label"),
    0x03: ("WildGrape", "high", "table label"), 0x04: ("BerryStrongSmell", "high", "table label"),
    0x05: ("MoonFlower", "high", "table label"), 0x06: ("Cake", "high", "table label"), 0x07: ("Fish", "high", "table label"),
    0x08: ("PowerBerry", "high", "table label"),
    0x09: ("GrassBig", "medium", "leaf-pile icon, remains = leaf object $00B7"),
    0x0A: ("GrassSmall", "medium", "leaf icon, remains = leaf object $00B7"),
    0x0D: ("StoneGrey", "medium", "rock icon, remains = rubble object $00C8"),
    0x0E: ("StoneMossy", "medium", "mossy rock icon, remains = rubble object $00C8"),
    0x0F: ("Lumber", "medium", "log icon"),
    0x10: ("Corn", "high", "table label"), 0x11: ("Tomato", "high", "table label"), 0x12: ("Potato", "high", "table label"),
    0x13: ("Turnip", "high", "table label"), 0x14: ("Egg", "high", "table label; enum CITEM_EGG"),
    0x15: ("MilkSmall", "high", "table label"), 0x16: ("MilkMedium", "high", "table label"), 0x17: ("MilkLarge", "high", "table label"),
    0x18: ("Herb", "high", "table label"), 0x19: ("Flower", "high", "table label"), 0x1A: ("Feed", "high", "table label"),
    0x1B: ("PerfumeGreen", "high", "table label; enum EITEM_PERFUMEGREEN"), 0x1C: ("PerfumeRed", "high", "table label"),
    0x1D: ("PerfumeBlue", "high", "table label"), 0x1E: ("EggRed", "high", "table label"), 0x1F: ("EggLightPurple", "high", "table label"),
    0x20: ("EggBlue", "high", "table label"), 0x21: ("EggPurple", "high", "table label"), 0x22: ("EggGreen", "high", "table label"),
    0x23: ("EggYellow", "high", "table label"), 0x24: ("ChickenWindMeasured", "medium", "table label (sic), icon = chicken"),
    0x25: ("Chicken", "high", "table label"), 0x26: ("Chick", "high", "table label"), 0x27: ("Dog", "medium", "icon = dog"),
    0x28: ("Gem", "low", "shares icon and arcs with the diamond (item $40)"), 0x29: ("Mole", "high", "table label"),
    0x2A: ("Sickle", "high", "EITEM_SICKLE + $29"), 0x2B: ("Hoe", "high", "EITEM_HOE + $29"), 0x2C: ("Hammer", "high", "EITEM_HAMMER + $29"),
    0x2D: ("Axe", "high", "EITEM_AXE + $29"), 0x2E: ("SeedBagCorn", "high", "EITEM_CORNSEED + $29"),
    0x2F: ("SeedBagTomato", "high", "EITEM_TOMATOSEED + $29"), 0x30: ("SeedBagPotato", "high", "EITEM_POTATOSEED + $29"),
    0x31: ("SeedBagTurnip", "high", "EITEM_TURNIPSEED + $29"), 0x32: ("Medicide", "high", "EITEM_MEDICIDE + $29"),
    0x33: ("MiraclePotion", "high", "EITEM_MIRACLEPOTION + $29"), 0x34: ("Bell", "high", "EITEM_BELL + $29"),
    0x35: ("SeedBagGrass", "high", "EITEM_GRASSSEED + $29"), 0x36: ("Paint", "high", "EITEM_PAINT + $29"),
    0x37: ("Milker", "high", "EITEM_MILKER + $29"), 0x38: ("Brush", "high", "EITEM_BRUSH + $29"),
    0x39: ("WateringCan", "high", "EITEM_WATERINGCAN + $29"), 0x3A: ("GoldSickle", "high", "EITEM_GOLDSICKLE + $29"),
    0x3B: ("GoldHoe", "high", "EITEM_GOLDHOE + $29"), 0x3C: ("GoldHammer", "high", "EITEM_GOLDHAMMER + $29"),
    0x3D: ("GoldAxe", "high", "EITEM_GOLDAXE + $29"), 0x3E: ("Sprinkler", "high", "EITEM_SPRINKLER + $29"),
    0x3F: ("BeanstalkSeed", "high", "EITEM_BEANSTALKSEED + $29"), 0x40: ("BlueDiamond", "high", "EITEM_BLUEDIAMOND + $29"),
    0x41: ("BlueFeather", "high", "EITEM_BLUEFEATHER + $29"), 0x42: ("ChickenFeed", "high", "EITEM_CHICKENFEED + $29"),
    0x43: ("CowFeed", "high", "EITEM_COWFEED + $29"),
}
ITEM_ORDER = [i for i in ITEMS if i >= 0x2A] + [i for i in ITEMS if i < 0x2A]   # tools first: shared sprites go to the tool

# explicit names (index -> (name, confidence, reason))
EXPLICIT = {
    0x0000: ("Player_Idle_Down", "medium", "AI table L001 direction 0, 16-tick loop"),
    0x0001: ("Player_Idle_Up", "medium", "AI table L001 direction 1"),
    0x0002: ("Player_Idle_Side", "medium", "AI table L001 directions 2/3 (flipped)"),
    0x0003: ("Player_Walk_Down", "medium", "AI table L001 second set, 8-tick loop"),
    0x0004: ("Player_Walk_Up", "medium", "AI table L001 second set, 8-tick loop"),
    0x000E: ("Player_Walk_Side", "medium", "AI table L001 second set (side)"),
    0x0005: ("Player_Stand_Down", "medium", "single frame, equals the idle frame; AI table direction 0"),
    0x0006: ("Player_Stand_Up", "medium", "single frame; AI table direction 1"),
    0x0007: ("Player_Stand_Side", "medium", "single frame; AI table direction 2/3"),
    0x044B: ("Ending_Text_O", "high", "ending script object, hiragana o"),
    0x044C: ("Ending_Text_Shi", "high", "ending script object, hiragana shi"),
    0x044D: ("Ending_Text_Ma", "high", "ending script object, hiragana ma"),
    0x044E: ("Ending_Text_I", "high", "ending script object, hiragana i"),
    0x044F: ("Ending_Heart", "high", "ending script object, heart after the text"),
    0x034A: ("Fx_HeartPink", "medium", "pink heart (AI tables L205)"),
    0x0348: ("Item_GoldPot", "low", "golden pot (AI table L212)"),
    0x00BF: ("Fx_CoinSpin", "medium", "gold coin spinning (AI table L140)"),
    0x00C7: ("Item_FeatherWhite", "low", "white feather"),
    0x00C5: ("Item_BootRed", "low", "red boot"),
    0x00CA: ("Fx_Splash", "medium", "water splash frames"),
    0x00CB: ("Fx_Stars", "medium", "star sparkles"),
    0x00B7: ("Fx_Leaves", "medium", "leaf pieces (remains of grass items)"),
    0x00C8: ("Fx_RubbleA", "medium", "rubble (remains of stone items)"),
    0x00C9: ("Fx_RubbleB", "medium", "rubble"),
    0x00C1: ("Item_FodderGrass", "low", "green fodder"), 0x00C2: ("Item_FodderHay", "low", "yellow fodder"),
    0x034E: ("Cart_Shipping", "low", "cart / bin with 4 frames (AI table L128)"),
    0x00B5: ("Player_Sparkle_Stand", "low", "player with sparkles"),
}

# (first, last, prefix, confidence, reason); applied to objects without a name from above.
# a prefix ending in '*' names by AI-table direction when known, else <prefix>_<id>.
R = []


def rng(a, b, prefix, conf, why):
    R.append((a, b, prefix, conf, why))


# ---- player -----------------------------------------------------------------------------------------------------
rng(0x0008, 0x0014, "Player_Pose", "low", "player cut-scene poses")
for a in (0x0015, 0x0016, 0x0018, 0x0019, 0x001B, 0x001C, 0x001E, 0x001F, 0x0021, 0x0022, 0x0024, 0x0025):
    rng(a, a, "Player_Jump", "medium", "hop arc with shadow")
rng(0x0017, 0x0017, "Player_Pose", "low", "sweat pose")
rng(0x001A, 0x001A, "Player_Pose", "low", "pose")
rng(0x001D, 0x001D, "Player_Pose", "low", "sweat pose")
rng(0x0020, 0x0020, "Player_Sparkle", "medium", "player with sparkles")
rng(0x0026, 0x0026, "Player_Sparkle", "medium", "player with sparkles")
rng(0x0023, 0x0023, "Player_Pose", "low", "sweat pose")
rng(0x0027, 0x0032, "Player_CarryWalk", "medium", "4-frame walk with an item in the hand (item icon beside the player)")
rng(0x0033, 0x0038, "Player_Pose", "low", "cheer / lift poses")
rng(0x0039, 0x003E, "Player_Dog", "medium", "player with the yellow dog (PFLAGS_DOGHUGGING)")
rng(0x003F, 0x0040, "Player_Pose", "low", "pose")
rng(0x0041, 0x0043, "Player_Dog", "medium", "player with the yellow dog")
rng(0x0044, 0x005B, "Player_Tool", "medium", "tool swing / use animations")
rng(0x005C, 0x0066, "Player_Pose", "low", "crouch / lift poses")
rng(0x0067, 0x0071, "Player_Tool", "medium", "tool use animations (small frames)")
rng(0x0072, 0x0078, "Player_Fishing", "medium", "fishing rod frames (code: fPlayerAction_Fishing / FishingBite / Reeling)")
rng(0x0079, 0x007E, "Player_Pose", "low", "pose")
rng(0x007F, 0x0083, "Player_Head", "medium", "head close-ups")
rng(0x0085, 0x0085, "Player_Head", "medium", "head close-up")
rng(0x0084, 0x0084, "Player_Pose", "low", "bath / spring pose")
rng(0x0086, 0x008E, "Player_Pose", "low", "pose")
rng(0x008F, 0x0097, "Player_Horse", "medium", "player riding the horse")
rng(0x0098, 0x0099, "Player_Pose", "low", "pose")
SHOW = ["", "Syringe", "Emblem", "Bell", "BagGreen", "BagGold", "BagRed", "BagBrown", "BagCream", "Axe", "Hammer", "Hoe", "Sickle",
        "WateringCan", "Paint", "Milker", "MilkPail", "Feather", "BoxEmblem", "BoxChick", "Sprout", "GoldSickle", "GoldHoe",
        "GoldAxe", "GoldHammer", "GemGreen", "GemBlue"]
for k, nm in enumerate(SHOW):
    a = 0x009A + k
    if nm:
        EXPLICIT.setdefault(a, ("Player_ShowItem_" + nm, "medium", "player holds up the item (PACTION_SHOWTOOL), shape of the held item"))
    else:
        EXPLICIT.setdefault(a, ("Player_ShowItem_Empty", "low", "player raises the hand without an item"))

# ---- items / effects --------------------------------------------------------------------------------------------
rng(0x00B6, 0x00B6, "Fx_Particles", "low", "small particles")
rng(0x00B8, 0x00B8, "Fx_Dust", "low", "brown particles")
rng(0x00B9, 0x00BB, "Fx_FishLeap", "medium", "leaping fish")
rng(0x00BE, 0x00BE, "Fx_Streak", "low", "blue streak")
rng(0x00C0, 0x00C0, "Fx_MoneyBag", "low", "money pouch frames")
rng(0x00C6, 0x00C6, "Item_Unk", "low", "teal pail / helmet shape")
rng(0x00E6, 0x00E6, "Item_Unk", "low", "plant sprig")
rng(0x0116, 0x011A, "Item_Unk", "low", "single item icons without carried-item entry")

# ---- animals ----------------------------------------------------------------------------------------------------
rng(0x018B, 0x01D8, "Cow*", "medium", "cow sprites (AI tables of the animal scripts, direction from the table)")
rng(0x01D9, 0x01F8, "Dog*", "medium", "yellow dog sprites (AI tables L004-L007, L165-L177)")
rng(0x01F9, 0x0208, "Horse*", "medium", "horse sprites (AI tables L006, L007, L178-L182)")
rng(0x0209, 0x0211, "Foal*", "medium", "small golden horse (AI tables L129-L131)")
rng(0x0212, 0x0216, "Chicken*", "medium", "white chicken (AI tables L008, L164)")
rng(0x0217, 0x0219, "Chick*", "medium", "chick (AI table L009)")
rng(0x021A, 0x021D, "ChickenGold*", "medium", "yellow chicken (AI table L103)")
rng(0x0302, 0x0303, "Rabbit*", "medium", "rabbit (AI table L132)")
rng(0x0304, 0x0305, "Fox*", "medium", "fox (AI table L133)")
rng(0x0306, 0x0307, "Squirrel*", "medium", "squirrel (AI table L134)")
rng(0x0308, 0x0308, "Sprite_Green*", "low", "green-hat gnome (AI table L092)")
rng(0x0309, 0x0311, "Sprite_Pink*", "low", "pink-hat gnomes (AI tables L080-L082)")
rng(0x0312, 0x0312, "Bird_Flap", "low", "small flapping shapes (AI table L083)")
rng(0x0313, 0x0313, "Frog*", "low", "green frog (AI table L084)")
rng(0x0314, 0x0314, "Fairy_Blue*", "medium", "blue fairy (AI table L087)")
rng(0x0318, 0x0318, "Fairy_Blue*", "medium", "blue fairy")
rng(0x0315, 0x0317, "GoddessGreen*", "low", "green-haired woman with sparkles (AI table L088)")
rng(0x0319, 0x031A, "Monkey*", "low", "brown shaggy animal face (AI table L089)")
rng(0x031B, 0x031D, "BirdWhite*", "low", "pale bird (AI table L090)")
rng(0x031E, 0x0320, "BirdBlue*", "medium", "blue bird; $031F = bird in a cage (script 1C table L091)")
rng(0x0321, 0x0325, "Mole*", "medium", "mole / burrow frames (AI tables L085, L086), icon $0326 = carried Mole")
rng(0x0327, 0x032A, "BirdBrown*", "low", "brown bird (AI table L093)")
rng(0x032B, 0x032B, "Fx_FishLeap", "medium", "leaping fish")

# ---- the five main girls (love variables nLove_Maria/Ann/Eve/Ellen/Nina; scripts 19-1D) -------------------------
rng(0x021E, 0x0225, "Maria*", "medium", "blue hair; AI table L011 starts script 19 (nLove_Maria)")
rng(0x0230, 0x0232, "Maria_Broom*", "medium", "blue hair with broom (AI table L014)")
rng(0x0226, 0x022D, "Ann*", "medium", "orange hair; AI table L015 starts script 1A (nLove_Ann)")
rng(0x0235, 0x0237, "Ann_Face", "low", "orange hair close-up (AI table L018)")
rng(0x0345, 0x0346, "Ann*", "medium", "orange hair, with smoke cloud in $0346")
rng(0x023A, 0x0243, "Ellen*", "medium", "brown hair; AI table L022 starts script 1C (nLove_Ellen)")
rng(0x0244, 0x024A, "Eve*", "medium", "blond hair; AI table L024 starts script 1D (nLove_Eve)")
rng(0x0255, 0x0257, "Eve_Face", "low", "blond hair close-up (AI table L026)")
rng(0x0350, 0x0350, "Eve_Heart", "low", "blond hair with heart")
rng(0x024B, 0x0252, "Nina*", "medium", "pink hair; by elimination of the other four, script 1B uses $0347 (kneeling)")
rng(0x0347, 0x0347, "Nina_Kneel", "medium", "pink hair, AI table L139 of script 1B (nLove_Nina)")
rng(0x0351, 0x0351, "Nina_Heart", "low", "pink hair with hearts")
# ---- other NPC looks (descriptive, Unk) --------------------------------------------------------------------------
LOOKS = [
    (0x022E, 0x022F, "LilacGirl"), (0x0233, 0x0233, "LilacGirl"), (0x0253, 0x0254, "LilacGirl"), (0x0258, 0x0259, "LilacGirl"),
    (0x025A, 0x0264, "BeardedManBlue"), (0x0265, 0x0268, "OldFarmerStrawHat"), (0x0269, 0x026F, "BlondBoyYellow"),
    (0x0270, 0x0275, "BlondManBrown"), (0x0276, 0x027B, "BlondBoyWhite"), (0x027C, 0x0284, "OldManWhiteBeard"),
    (0x0285, 0x0287, "BaldMan"), (0x0288, 0x028E, "RedWizardHat"), (0x028F, 0x0295, "BrownHairManBlue"),
    (0x0296, 0x029C, "BrownHairBoyBlue"), (0x029D, 0x02A2, "BigManApron"), (0x02A3, 0x02A4, "WildManStaff"),
    (0x02A5, 0x02AA, "PriestBlue"), (0x02AB, 0x02B1, "WhiteHairOldMan"), (0x02B2, 0x02B7, "OrangeGirlBlue"),
    (0x02B8, 0x02B9, "OldMonkBrown"), (0x02BA, 0x02C3, "Peddler"), (0x02C4, 0x02CB, "GreenDressGirl"),
    (0x02CC, 0x02D1, "PinkDressGirl"), (0x02D2, 0x02D8, "YellowHatBoy"), (0x02D9, 0x02DE, "BrownVestMan"),
    (0x02DF, 0x02E1, "ApronGirl"), (0x02E2, 0x02F1, "LilacBraidGirl"), (0x02F2, 0x0301, "CreamHoodBaby"),
    (0x032C, 0x032F, "PlayerWhiteOutfit"), (0x0330, 0x0343, "LilacVeilWoman"), (0x0448, 0x044A, "LilacBraidGirlHorse"),
    (0x0349, 0x0349, "BrownGirl"), (0x034B, 0x034B, "Unk"), (0x034C, 0x034D, "BlueHairOld"), (0x034F, 0x034F, "BrownGirlPair"),
    (0x0344, 0x0344, "PlayerSmoke"), (0x0234, 0x0234, "Bucket"), (0x0238, 0x0239, "Bucket"),
]
for a, b, nm in LOOKS:
    if nm == "PlayerWhiteOutfit":
        rng(a, b, "Player_WhiteOutfit*", "low", "player sprite in a white outfit (AI tables L131, L204)")
    elif nm == "PlayerSmoke":
        rng(a, b, "Player_Smoke", "low", "player with smoke cloud")
    elif nm == "Bucket":
        rng(a, b, "Item_Unk_Bucket", "low", "metal pail with water drops (AI table L201 / L200)")
    elif nm == "Unk":
        rng(a, b, "Obj_Unk", "low", "mixed animal group")
    else:
        rng(a, b, "Npc_Unk_" + nm + "*", "low", "NPC look without a name source (hair / clothes), AI-table direction where present")
rng(0x0436, 0x043F, "Player_CarrySack", "medium", "player carrying a sack")
rng(0x0440, 0x0447, "Player_CarryWalk", "medium", "4-frame walk with an item in the hand")


def load_tables():
    tabs, cur = {}, None
    for line in (ROOT / "assets/ai/npc_sprite_tables.txt").read_text().splitlines():
        line = line.split(";")[0].rstrip()
        m = re.match(r"(\w+):", line)
        if m:
            cur = m.group(1)
            tabs[cur] = []
        elif cur and line.strip():
            tabs[cur] += [(int(a, 16), int(b)) for a, b in re.findall(r"([0-9A-F]{4}):(\d)", line)]
    return tabs


def direction_of(tabs):
    """object index -> direction word of its first appearance in an AI sprite table (Down / Up / Side / Right / Left)."""
    out = {}
    for t, ent in tabs.items():
        for s in range(0, len(ent) - 3, 4):
            d = ent[s:s + 4]
            side = d[2][0] == d[3][0]
            for k, (sp, _) in enumerate(d):
                nm = ["Down", "Up", "Side" if side else "Right", "Side" if side else "Left"][k]
                out.setdefault(sp, nm)
    return out


def carried():
    sys.path.insert(0, str(ROOT / "tools" / "data"))
    import tabledata
    res = {}
    for label, rows in tabledata.rows_of("carried_items", "US", ROOT).items():
        m = re.match(r"aItemCarriedFrames_([0-9A-F]{2})", label)
        if m:
            nums = [(int(r["sprite"][1:], 16), int(r["flip"][1:], 16)) for r in rows]
            res[int(m.group(1), 16)] = (nums[0][0] | nums[0][1] << 16, [sp for sp, _ in nums[1:]])
    return res


def steps_of():
    out = {}
    for bank in ("bank_86", "bank_87"):
        first = int(json.loads((OBJ / bank / "bank.json").read_text())["first_object_index"], 16)
        files = sorted((OBJ / bank / "objects").glob("*.json"))
        for k, f in enumerate(files):
            out[first + k] = len(json.loads(f.read_text())["steps"])
    return out


def table5():
    tabs = load_tables()
    dirs = direction_of(tabs)
    steps = steps_of()
    name, why = {}, {}

    def put(i, nm, conf, reason, fam):
        if i not in name and 0 <= i < TOTAL and i != 0:
            name[i] = (nm, conf, reason, fam)
        elif i == 0 and i not in name:
            name[i] = (nm, conf, reason, fam)

    car = carried()
    for it in ITEM_ORDER:
        if it not in car:
            continue
        nm, conf, why_ = ITEMS[it]
        icon, ent = car[it]
        base = "Item_" + nm
        fam = "Item_" + nm
        if icon:
            put(icon, base + "_Icon", conf, f"icon of carried item ${it:02X} ({why_})", fam)
        tool = it >= 0x2A
        seq = ent if not tool else ent[1:]
        seen = []
        for idx, sp in enumerate(seq):
            if sp and sp not in seen:
                seen.append(sp)
        k = 0
        for sp in seen:
            if tool:
                put(sp, f"{base}_Arc_{k}", "medium" if conf == "high" else conf, f"arc animation object {k} of carried item ${it:02X}", fam)
                k += 1
                continue
        if tool:
            continue
        # list layout: [0] big single, [1..3] arc A (3 frames) per table order, [4]=[3] flipped, [5..7] arc B (2 frames), [8]=[7], [9] dropped, [10] long arc
        e = ent + [0] * (11 - len(ent))
        parts = [(e[0], "Big"), (e[1], "ArcA_0"), (e[2], "ArcA_1"), (e[3], "ArcA_2"), (e[5], "ArcB_0"), (e[6], "ArcB_1"),
                 (e[7], "ArcB_2"), (e[9], "Dropped"), (e[10], "ArcLong")]
        for sp, nm2 in parts:
            if sp:
                put(sp, f"{base}_{nm2}", "medium" if conf == "high" else conf, f"{nm2} object of carried item ${it:02X} ({why_}), list position per fCarried layout", fam)
    for i, (nm, conf, reason) in EXPLICIT.items():
        if i not in name:
            name[i] = (nm, conf, reason, nm.split("_")[0])
    rangeof = {}
    for a, b, prefix, conf, rs in R:
        for i in range(a, b + 1):
            rangeof.setdefault(i, (prefix, conf, rs))
    for i in range(TOTAL):
        if i in name:
            continue
        if i in rangeof:
            prefix, conf, rs = rangeof[i]
            if prefix.endswith("*"):
                p = prefix[:-1]
                if i in dirs:
                    st = "Walk" if steps.get(i, 1) >= 3 else "Idle"
                    name[i] = (f"{p}_{st}_{dirs[i]}", conf, rs, p.split("_")[0])
                else:
                    name[i] = (f"{p}_Pose_{i:04X}", "low" if conf == "medium" else conf, rs + "; no table direction", p.split("_")[0])
            else:
                name[i] = (f"{prefix}_{i:04X}", conf, rs, prefix.split("_")[0])
        else:
            name[i] = (f"Obj_Unk_{i:04X}", "low", "no evidence", "Unk")
    # uniqueness: later duplicates get the index appended
    seen, out = {}, {}
    for i in range(TOTAL):
        nm, conf, rs, fam = name[i]
        if nm in seen:
            nm = f"{nm}_{i:04X}"
            conf = "low" if conf == "high" else conf
        seen[nm] = i
        out[i] = (nm, conf, rs, fam)
    return out


def write_csv():
    t = table5()
    with open(CSV, "w", newline="", encoding="utf-8") as f:
        w = csv.writer(f, lineterminator="\n")
        w.writerow(["index", "old", "new", "family", "confidence", "reason"])
        for i in range(TOTAL):
            nm, conf, rs, fam = t[i]
            w.writerow([f"{i:04X}", f"obj_{i:04X}", f"obj_{i:04X}_{nm}", fam, conf, rs])
    from collections import Counter
    print("wrote", CSV, dict(Counter(v[1] for v in t.values())))


def apply():
    t = table5()
    for bank in ("bank_86", "bank_87"):
        first = int(json.loads((OBJ / bank / "bank.json").read_text())["first_object_index"], 16)
        for k, f in enumerate(sorted((OBJ / bank / "objects").glob("*.json"))):
            i = first + k
            assert f.name == f"{i:04X}.json", f
            doc = json.loads(f.read_text())
            text = f.read_text()
            head = '{\n'
            assert text.startswith(head)
            body = text[len(head):]
            if body.startswith(' "name"'):
                body = body[body.index("\n") + 1:]
            f.write_text(head + ' "name": %s,\n' % json.dumps(t[i][0]) + body, newline="")
    for i in range(TOTAL):
        old = FRAMES / f"obj_{i:04X}"
        new = FRAMES / f"obj_{i:04X}_{t[i][0]}"
        if old.exists():
            subprocess.run(["git", "mv", str(old), str(new)], cwd=ROOT, check=True)
    print("applied")


if __name__ == "__main__":
    cmd = sys.argv[1:2]
    if cmd == ["csv"]:
        write_csv()
    elif cmd == ["apply"]:
        apply()
    else:
        sys.exit(__doc__)
