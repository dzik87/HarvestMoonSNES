#!/usr/bin/env python3
"""Meaningful names for the graphics blobs (old label = address-based -> new label), see docs/naming/README.md.

  python3 tools/migration/gfx_names.py csv     write docs/naming/K3_gfx_names.csv and K4_sprites_objects_palettes.csv (old,new,confidence,reason,address)
  python3 tools/migration/gfx_names.py apply   rename labels in src/, docs/ai, tools/, tests/, docs/, assets/gfx (files and text)

Convention: Tiles_<Place>[_<Season>][_<slot>]   tile graphics; <slot> = VRAM slot 0-3 ($2000/$3000/$4000/$5000 words)
            Screen_<Place>[_<Layer>]            compressed BG name table; ScreenRaw_<Place> uncompressed name table
            Overlay_ in the place part = weather overlay; Unk + address when the purpose is not known.
Names come from the map entries that load a blob (src/code/bank_80/tilemaps.asm) and the area names of the enum.
"""
import csv
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
CSV = ROOT / "docs" / "naming" / "K3_gfx_names.csv"
CSV4 = ROOT / "docs" / "naming" / "K4_sprites_objects_palettes.csv"
T, M, C = "sCompressedTiles_", "sCompressedTilemap_", "sCharactermap_"

# (old id, new name, confidence, reason)
TILES = {
    "928000": ("Tiles_Overlay_Rain", "high", "only loaded by sRainOverlay (area $57)"),
    "97B11A": ("Tiles_Overlay_Clouds", "high", "only loaded by sCloudsOverlay"),
    "9B8441": ("Tiles_Overlay_HeavySnow", "high", "only loaded by sHeavySnowOverlay"),
    "9E9C6D": ("Tiles_Overlay_Snow", "high", "only loaded by sSnowOverlay"),
    "92D3AB": ("Tiles_Farm_SpringSummer_0", "high", "slot $2000 of sFarmSpringMap / sFarmSummerMap (and the ending maps)"),
    "938000": ("Tiles_Farm_SpringSummer_1", "high", "slot $3000 of sFarmSpringMap / sFarmSummerMap"),
    "939E8E": ("Tiles_Farm_SpringSummer_2", "high", "slot $4000 of sFarmSpringMap / sFarmSummerMap"),
    "9282CB": ("Tiles_Farm_Fall_0", "high", "slot $2000 of sFarmFallMap"),
    "929D10": ("Tiles_Farm_Fall_1", "high", "slot $3000 of sFarmFallMap"),
    "92BB03": ("Tiles_Farm_Fall_2", "high", "slot $4000 of sFarmFallMap"),
    "93B736": ("Tiles_Farm_Winter_0", "high", "slot $2000 of sFarmWinterMap"),
    "93D049": ("Tiles_Farm_Winter_1", "high", "slot $3000 of sFarmWinterMap"),
    "93E12B": ("Tiles_Farm_Winter_2", "high", "slot $4000 of sFarmWinterMap"),
    "948000": ("Tiles_MountainCave", "high", "sMountainCaveMap and sElfTunnelMap"),
    "95C000": ("Tiles_House_0", "high", "slot $2000 of sHouseMap and both upgrades"),
    "95D6E2": ("Tiles_House_1", "high", "slot $3000 of sHouseMap and both upgrades"),
    "95E8A3": ("Tiles_MayorHouse", "high", "sMayorHouseMap, hall and Maria's room"),
    "968000": ("Tiles_Church", "high", "sChurchMap"),
    "969437": ("Tiles_FlowerShop", "high", "sFlowerShopMap / room"),
    "96AD11": ("Tiles_Bar", "high", "sBarMap / room"),
    "96C489": ("Tiles_Restaurant", "high", "sRestaurantMap / room"),
    "96DC6D": ("Tiles_GeneralStore", "high", "sGeneralStoreMap / room"),
    "978000": ("Tiles_AnimalShop", "high", "sAnimalShopMap"),
    "979A88": ("Tiles_FortuneTellerHouse", "high", "sFortuneTellerHouseMap"),
    "97B45F": ("Tiles_Town_SpringToFall_0", "high", "slot $2000 of the spring / summer / fall town and the town festivals"),
    "998000": ("Tiles_Town_Spring_1", "high", "slot $3000 of sTownSpringMap, flower festival, wedding spring"),
    "999A74": ("Tiles_Town_Spring_2", "high", "slot $4000 of sTownSpringMap"),
    "97CD20": ("Tiles_Town_Summer_1", "high", "slot $3000 of sTownSummerMap"),
    "97E7A2": ("Tiles_Town_Summer_2", "high", "slot $4000 of sTownSummerMap"),
    "988000": ("Tiles_Town_Fall_1", "high", "slot $3000 of sTownFallMap, harvest and egg festival"),
    "989A52": ("Tiles_Town_Fall_2", "high", "slot $4000 of sTownFallMap"),
    "99DCBD": ("Tiles_Town_Winter_0", "high", "slot $2000 of sTownWinterMap and the star night square"),
    "9A8000": ("Tiles_Town_Winter_1", "high", "slot $3000 of sTownWinterMap"),
    "9A9921": ("Tiles_Town_Winter_2", "high", "slot $4000 of sTownWinterMap"),
    "98AEDB": ("Tiles_HarvestFestival_2", "high", "slot $4000 of sHarvestFestivalMap"),
    "99AEC3": ("Tiles_FlowerFestival_2", "high", "slot $4000 of sFlowerFestivalMap"),
    "99C3F2": ("Tiles_EggFestival_2", "high", "slot $4000 of sEggFestivalMap"),
    "9AAEAB": ("Tiles_StarNightFestivalSquare_2", "high", "slot $4000 of sStarNightFestivalSquareMap"),
    "98CC6B": ("Tiles_Road_SpringToFall", "high", "sRoadSpring / Summer / Fall (and the intro map)"),
    "98E41D": ("Tiles_Road_Winter", "high", "sRoadWinterMap"),
    "9DE7CE": ("Tiles_Mountain_Spring_0", "high", "slot $2000 of sMountainSpring"),
    "9E8000": ("Tiles_Mountain_Spring_1", "high", "slot $3000 of sMountainSpring"),
    "9D8000": ("Tiles_Mountain_SpringSummer_2", "high", "slot $4000 of sMountainSpring / Summer"),
    "9CCBA3": ("Tiles_Mountain_Summer_0", "high", "slot $2000 of sMountainSummerMap (also ending 11)"),
    "9CE37D": ("Tiles_Mountain_Summer_1", "high", "slot $3000 of sMountainSummerMap"),
    "9D991C": ("Tiles_Mountain_Fall_0", "high", "slot $2000 of sMountainFallMap"),
    "9DB15E": ("Tiles_Mountain_Fall_1", "high", "slot $3000 of sMountainFallMap"),
    "9DCE31": ("Tiles_Mountain_Fall_2", "high", "slot $4000 of sMountainFallMap"),
    "9E9EDC": ("Tiles_Mountain_Winter_0", "high", "slot $2000 of sMountainWinterMap and the star night spa"),
    "9EB75D": ("Tiles_Mountain_Winter_1", "high", "slot $3000 of sMountainWinterMap"),
    "9ED208": ("Tiles_Mountain_Winter_2", "high", "slot $4000 of sMountainWinterMap"),
    "9BB76D": ("Tiles_Summit_SpringToFall_0", "high", "slot $2000 of the summit maps spring / summer / fall"),
    "9C8000": ("Tiles_Summit_SpringToFall_1", "high", "slot $3000 of the summit maps spring / summer / fall"),
    "9BCF8F": ("Tiles_Summit_Winter_0", "high", "slot $2000 of sSummitWinterMap"),
    "9C965F": ("Tiles_Summit_Winter_1", "high", "slot $3000 of sSummitWinterMap"),
    "9AE02D": ("Tiles_ToolShed_0", "high", "slot $2000 of sToolShedMap"),
    "9B8000": ("Tiles_ToolShed_1", "high", "slot $3000 of sToolShedMap"),
    "9CA40C": ("Tiles_BarnCoop", "high", "sBarnMap and sCoopMap"),
    "9B86AD": ("Tiles_GoldChicken", "high", "area GOLDCHICKEN (sMap_80B04B)"),
    "9B9F53": ("Tiles_WorksmanHouse", "high", "area WORKSMANHOUSE (sMap_80B032)"),
    "9ABF97": ("Tiles_Menu_0", "high", "slot $2000 of the menu screens (area $5E/$5F)"),
    "9AC489": ("Tiles_Menu_1", "high", "slot $3000 of the menu screens"),
    "9ACB41": ("Tiles_Menu_2", "high", "slot $4000 of the menu screens"),
    "9AD357": ("Tiles_Menu_3", "high", "slot $5000 of the menu screens"),
    "9F8000": ("Tiles_IntroFarmScroll_0", "high", "slot $2000 of sIntroFarmScrool (area $5B)"),
    "9F946C": ("Tiles_IntroFarmScroll_1", "high", "slot $3000 of sIntroFarmScrool"),
    "9FAA75": ("Tiles_IntroFarmScroll_2", "high", "slot $4000 of sIntroFarmScrool"),
    "9FC04C": ("Tiles_IntroFarmScroll_3", "high", "slot $5000 of sIntroFarmScrool"),
    "9FEF97": ("Tiles_NatsumeLogo", "high", "sNatsumeLogo (area $5D)"),
    "9FD4DA": ("Tiles_Unused_TitleLogoJapanese", "medium", "no map and no code loads it; Japanese logo graphics left in the US ROM"),
    "9EEB3D": ("Tiles_Credits_0", "high", "slot $2000 of the credits maps (areas $4B-$4F), drive to town, unk $51-$56"),
    "A08000": ("Tiles_Credits_1", "high", "slot $3000 of the same maps"),
    "A088E9": ("Tiles_Credits_2", "high", "slot $4000 of the same maps"),
    "A09232": ("Tiles_Credits_3", "high", "slot $5000 of credits 0-3 and area $52"),
    "A0AB1E": ("Tiles_Unk51_3", "medium", "slot $5000 of sMap_80B55F (area UNKNOWN51); no name table cell uses it"),
    "A0CAAF": ("Tiles_Unk56_3", "medium", "slot $5000 of sMap_80B618 (area UNKNOWN56)"),
    "A0E682": ("Tiles_DriveToTown_3", "medium", "slot $5000 of sMap_80B537 (area DRIVETOTOWN); no name table cell uses it"),
}
MAPS = {
    "A48000": ("Screen_Overlay_Rain", "high", "BG2 name table of sRainOverlay"),
    "A4C3E2": ("Screen_Overlay_Clouds", "high", "BG2 name table of sCloudsOverlay"),
    "A5A3D5": ("Screen_Overlay_HeavySnow", "high", "BG2 name table of sHeavySnowOverlay"),
    "A5C955": ("Screen_Overlay_Snow", "high", "BG2 name table of sSnowOverlay"),
    "A481AE": ("Screen_ElfTunnel", "high", "sElfTunnelMap"),
    "A48A2D": ("Screen_MountainCave", "high", "sMountainCaveMap"),
    "A4945C": ("Screen_House_Upgrade1", "high", "sHouseUpgrade1Map"),
    "A49745": ("Screen_House_Upgrade2", "high", "sHouseUpgrade2Map"),
    "A49B84": ("Screen_House", "high", "sHouseMap"),
    "A49E2E": ("Screen_MayorHouse", "high", "mayor house, hall, Maria's room (one 64x64 table)"),
    "A4A597": ("Screen_Church", "high", "sChurchMap"),
    "A4AA99": ("Screen_FlowerShop", "high", "sFlowerShopMap / room"),
    "A4AE95": ("Screen_Bar", "high", "sBarMap / room"),
    "A4B3D1": ("Screen_Restaurant", "high", "sRestaurantMap / room"),
    "A4B8E0": ("Screen_GeneralStore", "high", "sGeneralStoreMap / room"),
    "A4BCC1": ("Screen_AnimalShop", "high", "sAnimalShopMap"),
    "A4C065": ("Screen_FortuneTellerHouse", "high", "sFortuneTellerHouseMap"),
    "A4C5DE": ("Screen_HarvestFestival", "high", "sHarvestFestivalMap"),
    "A4CFAB": ("Screen_Road", "high", "four seasons of the road"),
    "A4D379": ("Screen_FlowerFestival", "high", "sFlowerFestivalMap"),
    "A4DC7E": ("Screen_EggFestival", "high", "sEggFestivalMap"),
    "A58000": ("Screen_Menu_Backgrounds", "high", "BG at $1000 of sMenuScreenBackgrounds"),
    "A58327": ("Screen_StarNightFestivalSquare", "high", "sStarNightFestivalSquareMap"),
    "A58B49": ("Screen_ToolShed", "high", "sToolShedMap BG1"),
    "A58D8E": ("Screen_Menu_Characters", "high", "BG at $1000 of sMenuCharacters"),
    "A5970F": ("Screen_Menu_BackgroundPattern", "medium", "BG at $6000 of both menu maps: repeating pattern with the logo"),
    "A59C08": ("Screen_ToolShed_Layer2", "high", "sToolShedMap BG2 ($7000)"),
    "A59E0B": ("Screen_StarNightFestivalSpa", "high", "sStarNightFestivalSpaMap"),
    "A5A6A0": ("Screen_GoldChicken", "high", "area GOLDCHICKEN"),
    "A5AD17": ("Screen_Summit_Layer2", "high", "BG2 ($7000) of the summit maps"),
    "A5B042": ("Screen_MountainTop2_Layer2", "high", "BG2 ($7000) of the MOUNTAINTOP2 maps"),
    "A5B361": ("Screen_StarNightFestivalMountainTop_Layer2", "high", "BG2 of sStarNightFestivalMountainTopMap"),
    "A5B63B": ("Screen_WorksmanHouse", "high", "area WORKSMANHOUSE"),
    "A5B943": ("Screen_Summit", "high", "BG1 of the summit maps"),
    "A5BD8A": ("Screen_MountainTopBean", "high", "area MOUNTAINTOPBEAN"),
    "A5C258": ("Screen_Coop", "high", "sCoopMap"),
    "A5C4CD": ("Screen_Barn", "high", "sBarnMap"),
    "A5CB05": ("Screen_DialogBox", "high", "decompressed to $7E2000 and DMA'd to VRAM $7800 by fDialog_LoadDialogBoxGraphics"),
    "A5CD88": ("Screen_IntroFarmScroll_BG1", "high", "sIntroFarmScrool $6000"),
    "A5D44C": ("Screen_IntroFarmScroll_BG2", "high", "sIntroFarmScrool $7000"),
    "A5D94A": ("Screen_Title_HarvestMoonLogo", "high", "sHarvestMoonLogo (area $5C)"),
    "A5DE84": ("Screen_Title_NatsumeLogo", "high", "sNatsumeLogo (area $5D)"),
    "A5E253": ("Screen_Ending00", "high", "area ENDING00 (sMap_80B28A)"),
    "A5E5CE": ("Screen_Ending01", "high", "area ENDING01"),
    "A5E977": ("Screen_Ending02", "high", "area ENDING02"),
    "A5ECFB": ("Screen_Ending03", "high", "area ENDING03"),
    "A5F671": ("Screen_Ending04", "high", "area ENDING04"),
    "A5F95C": ("Screen_Ending05", "high", "area ENDING05"),
    "A5FBCE": ("Screen_Ending06", "high", "area ENDING06"),
    "A68000": ("Screen_Ending07", "high", "area ENDING07"),
    "A68229": ("Screen_Ending08", "high", "area ENDING08"),
    "A68433": ("Screen_Ending09", "high", "area ENDING09"),
    "A6867E": ("Screen_Ending10", "high", "area ENDING10"),
    "A68864": ("Screen_Ending11", "high", "area ENDING11"),
    "A5F059": ("Screen_Ending12", "high", "area ENDING12"),
    "A5F45A": ("Screen_Ending13", "high", "area ENDING13"),
    "A68DCF": ("Screen_Intro", "high", "area INTRO"),
    "A690A6": ("Screen_Credits_0to3", "high", "areas CREDITS0-3"),
    "A694EE": ("Screen_Credits4_DriveToTown", "medium", "areas CREDITS4, DRIVETOTOWN, UNKNOWN51/52"),
    "A69996": ("Screen_Unk53to56", "medium", "areas UNKNOWN53-56"),
}
RAW = {
    "A18000": ("ScreenRaw_Farm", "high", "128x128 world map of the farm, all seasons"),
    "A28000": ("ScreenRaw_Mountain", "high", "128x96 world map of the mountain"),
    "A38000": ("ScreenRaw_Town", "high", "128x128 world map of the town (and wedding maps)"),
    "A6A096": ("ScreenRaw_Unk_A6A096", "low", "raw 64x32 name table no code references (found hidden under bank padding)"),
}


def table():
    rows = []
    for pre, d in ((T, TILES), (M, MAPS), (C, RAW)):
        for a, (new, conf, why) in d.items():
            rows.append((pre + a, new, conf, why, "$" + a))
    return rows


# ---- K4: sprite banks, palettes ------------------------------------------------------------------------------------
SPRITES = {   # bank -> (name, confidence, reason from the rendered sheets)
    0x88: ("Sprites_Player_0", "medium", "farmer in all poses (walking, tools, carrying)"),
    0x89: ("Sprites_Player_1", "medium", "farmer poses, tool swings and impact effects"),
    0x8A: ("Sprites_Player_2", "medium", "farmer riding / using tools, effects"),
    0x8B: ("Sprites_Player_3", "medium", "farmer with horse, further tool effects"),
    0x8C: ("Sprites_ItemsCrops", "high", "crops, fruit, tools and items carried, sparkles, plus the horse rider heads"),
    0x8D: ("Sprites_Cattle", "high", "cows and calves in all poses"),
    0x8E: ("Sprites_DogChickensHorse", "medium", "a cow, the dog, chicks / chickens, horse and rabbit-like animals"),
    0x8F: ("Sprites_Npc_0", "medium", "villagers (adults, children), walking poses"),
    0x90: ("Sprites_Npc_1", "medium", "more villagers (carpenters, priest, merchants, bag carriers)"),
    0x91: ("Sprites_Npc_2_Ui", "medium", "remaining villagers, the truck, 'The End' text graphics"),
}
AREA_BASE = {"DANCINGS1": "FlowerFestival", "DANCINGS2": "HarvestFestival", "MAJORHOUSE": "MayorHouse"}
SLOTS = ("Early", "Day", "Evening", "Dusk", "Night")


def camel(map_label, area_name):
    m = map_label
    if m.startswith("sMap_"):
        base = area_name
        for k, v in (("DRIVETOTOWN", "DriveToTown"), ("WORKSMANHOUSE", "WorksmanHouse"), ("GOLDCHICKEN", "GoldChicken"),
                     ("MNTTOPENDINGSUMMER", "MountainTop2Summer"), ("MOUNTAINTOPBEAN", "MountainTopBean")):
            base = v if base == k else base
        if base.startswith(("ENDING", "CREDITS", "UNKNOWN")):
            base = base.title()
        elif base.startswith("WEDDING"):
            base = "Wedding" + base[7:].title()
        elif base.startswith("MOUNTAINTOP2"):
            base = "MountainTop2" + base[12:].title()
        else:
            base = base.title() if base.isupper() else base
        return base
    m = m[1:]
    for suf in ("Map",):
        if m.endswith(suf):
            m = m[:-3]
    return m.replace("Scrool", "Scroll")


def palette_rows():
    """(old label, new name, confidence, reason, address) for the 117 sPalette_0xNN: named after the first area and time-of-day slot that
    uses the palette (assets/gfx/palette_map.json); the two OBJ palettes and unreferenced ones by role."""
    import json
    pm = json.loads((ROOT / "assets/gfx/palette_map.json").read_text(encoding="utf-8"))
    first = {}
    for a, e in sorted(pm["areas"].items(), key=lambda x: int(x[0])):
        for i, p in enumerate(e["bg_palettes"]):
            if p and p not in first:
                first[p] = (int(a), i, e)
    rows = []
    for n in range(117):
        old = "sPalette_0x%02X" % n
        if old in first:
            a, i, e = first[old]
            nm = "Palette_" + camel(e["map"], e["name"]) + "_" + SLOTS[i]
            users = [x["name"] for x in pm["areas"].values() if old in x["bg_palettes"]]
            why = f"first used by area {e['name']} (${a:02X}), time slot {i} ({SLOTS[i]}); also {', '.join(users[1:4])}" if len(users) > 1 \
                else f"used only by area {e['name']} (${a:02X}), time slot {i} ({SLOTS[i]})"
            rows.append((old, nm, "high", why, f"index ${n:02X}"))
        elif n == 0x6F:
            rows.append((old, "Palette_Obj_Day", "high", "OBJ palette (aMapPalettesId, day) shared by all areas", f"index ${n:02X}"))
        elif n == 0x70:
            rows.append((old, "Palette_Obj_Evening", "high", "OBJ palette (aMapPalettesId, from 18:00)", f"index ${n:02X}"))
        else:
            rows.append((old, "Palette_Unk_%02X" % n, "low", "no area or code references it", f"index ${n:02X}"))
    return rows


def table4():
    rows = [("Sprites_%02X8000" % b, nm, c, why, "$%02X8000" % b) for b, (nm, c, why) in SPRITES.items()]
    return rows + palette_rows()


def rx(old):
    return re.compile(r"(?<![A-Za-z0-9_])" + re.escape(old) + r"(?![A-Za-z0-9])")


def write_csv(path, rows):
    with open(path, "w", newline="", encoding="utf-8") as f:
        w = csv.writer(f, lineterminator="\n")
        w.writerow(["old", "new", "confidence", "reason", "address"])
        w.writerows(rows)
    print(f"wrote {path.relative_to(ROOT)}: {len(rows)} names")


def main():
    rows = table()
    which = [r for r in sys.argv[1:] if r in ("k3", "k4")]
    if sys.argv[1:2] == ["csv"]:
        write_csv(CSV, rows)
        write_csv(CSV4, table4())
        return
    if "k4" in sys.argv[2:]:
        rows = table4()
    news = [r[1] for r in rows]
    assert len(set(news)) == len(news), "duplicate names"
    if sys.argv[1:2] != ["apply"]:
        sys.exit(__doc__)
    files = subprocess.run(["git", "ls-files", "src", "docs", "tools", "tests", "assets/gfx", ".github"], cwd=ROOT, capture_output=True,
                           text=True, check=True).stdout.split()
    files = [f for f in files if not f.endswith((".bin", ".png", ".pyc", ".pal")) and "docs/naming/K" not in f
             and f != "tools/migration/gfx_names.py"]
    pats = [(rx(o), n) for o, n, *_ in rows]
    changed = 0
    for f in files:
        p = ROOT / f
        try:
            t = p.read_text(encoding="utf-8")
        except (UnicodeDecodeError, FileNotFoundError):
            continue
        u = t
        for r, n in pats:
            u = r.sub(n, u)
        if u != t:
            p.write_text(u, encoding="utf-8", newline="")
            changed += 1
    print(f"text files changed: {changed}")
    moved = 0
    allf = subprocess.run(["git", "ls-files", "assets/gfx"], cwd=ROOT, capture_output=True, text=True, check=True).stdout.split()
    for f in allf:
        name = Path(f).name
        new = name
        for r, n in pats:
            new = r.sub(n, new)
        if new != name:
            subprocess.run(["git", "mv", f, str(Path(f).with_name(new))], cwd=ROOT, check=True)
            moved += 1
    for p in (ROOT / "assets/gfx").rglob("*"):                     # untracked generated files (.bin, .pal): drop, build_assets recreates them
        if p.suffix in (".bin", ".pal") and p.is_file() and any(r.search(p.name) for r, _ in pats):
            p.unlink()
    print(f"files renamed: {moved}")


if __name__ == "__main__":
    main()
