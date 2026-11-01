# Open naming questions

Identifiers that still carry `Unk` / `unk` (or an address) because the code and data give no evidence for a better name.
For every entry: what is known, and which test would settle it. Renames that were possible are recorded in `O_unk_renames.csv`.

## Sound effects (`Sfx_Unk*`, `!SFX_UNK*`)

Evidence available: the callers (`docs/audio.md` section 13.2) and the SPC700 stream / sample of each effect. Evidence missing: which in-game
situation plays them. Effects `$09-$0E, $1A, $1C-$1F, $21, $25-$27, $29-$31` have **no caller** in any of the four releases (checked: the immediate loads
before `fAudio_PlaySoundEffectAndWait` and the `strcAudio.reg114` stores only ever use ids `$00-$08, $19, $20, $22, $24` and the tool table values; the AI command
`AICMD0x2C` only uses `$04, $19, $23`). They are probably unused leftovers, so no game situation can ever name them.

Settling test: render each stream with `python3 tools/audio/audioconv.py` (listening format) and name it by what it sounds like (`Sfx_Chime`, `Sfx_Splash`); this is
a subjective name, so it would be recorded as confidence `low`. Not done here because no listening review is possible in the build environment.

The three effects that have a caller but an unknown purpose:

| Name | Known | Settles it |
|---|---|---|
| `Sfx_HouseEventUnk20` | played by `fAreaEvents_House` when `event6` bit `$0020` is set; the bit is set in `fGameEngine_AnimalsDailyUpdate` for a chicken when `mapFlags & $0410` and the chicken state byte 1 is < 4 | emulator: breakpoint on `$83E05B`, note which chicken state / farm situation is on screen |
| `Sfx_HouseEventUnk22` | played twice (20 and 30 frame gaps) when `event6` bit `$0200` is set; set with `mapFlags |= $0400` in `fObjectMap_UpdateFarmTilesNewDay` when a random 1/8 roll hits for farm tile `$06` | emulator: breakpoint on `$83E030`, check what happens on the farm that morning |
| `Sfx_CutsceneUnk23` | first action of AI script `0x23`, voice 7, 60 frames, right after the fade-in | emulator: identify the cutscene that starts script `0x23` (dialogs of the script) |
| `Sfx_InteractionUnk24` | `fPlayerInteraction0x35`, voice 7, 120 frames | emulator: find the object whose interaction type is `0x35` |

## Graphics blobs

- `ScreenRaw_Unk_A6A096` (low): a raw 64x32 BG name table that no code references (found under the padding of bank `$A6`). Tile ids stay below `$2FE`. Settling test: render it with every
  tile set combination of the 96 areas (`pngsync.py preview`-style composition) and look for a screen that matches; likely a cut map or credits screen.
- `Palette_Unk_14`, `Palette_Unk_71`-`Palette_Unk_74` (low): no area or code references them. `71`-`73` equal `Palette_Obj_Day` except for 14 colours in sub-palette 3 (indices 48-63), i.e. they are alternative object
  palettes (colour swapped variants of the sprites that use that sub-palette). Which sprites use sub-palette 3 would give the names (`Palette_Obj_Day_Alt1..3`); `74` and `14` share no 129+ colours with anything.
  Settling test: apply each palette to the sprite sheets that use object palette row 3 (`pngsync.py sheet`) and see which looks intentional.
- `Tiles_Credits4_BL_3`, `Tiles_Credits_3`, `Tiles_DriveToTown_3` (medium/low): slot `$5000` tile sets that no name table cell shows. They are named after the loading area only.

## Code and data

- `day_event_tables` rows `.e_Unknown1` (`$06,$0A,$0A,$00`) and `.e_Unknown2` (`$00,$00,$00,$03`): event tables without a known consumer meaning; test: watch the table reads in an emulator on the day events.
- `strcMap.unk1C` (room width multiplier target) and `strcAudio.unk118` (sound sample index): named by use in the table docs only.
- `Table_Unk_858C8E` (`src/common/ram.asm`): an unreferenced constant that points into the middle of `aObjectBitMask16Unused`.
- `aDialogUnused_83944D`: 10 unreferenced bytes (`$10,$50,$70,$51,...`) between dialog routines; probably a leftover tile / attribute list.
- `aObjSlotOamTile_868000`: address in the name because the label is the start of a bank (`$868000`) and is the only reference of that kind.
- `strcDialogDisplay.mapUnk19A`, `dialogUnk191`, `dialogUnk185`, `strcVariables.n16Unk86..90`, `strcMap.unk10..21`, `strcPlayer.unkDC/unkE3`, `strcStockData.unk*`, `strcAIUnknown.unk*`, `strcAudio.unk*`, `PFLAGS_UNK0400`, `DFLAGS_UNK*`
  (about 1500 uses in `src/`): structure members whose meaning needs a per-field data-flow study (each is used in many routines). They are the next naming backlog;
  settling test: watchpoints on the field in an emulator (`mapUnk19A` is read as a dialog state: `2` = finished dialog in all `fItemBuy_*` / `fPlayerInteraction*` users, which suggests `dialogState`).
- `Npc_Unk_<Look>_<id>` / `Obj_Unk_<id>` animation objects (see `K5_objects.csv`): no NPC table or code reference identifies the character; test: play the game with a breakpoint on the object id.
- Address-named area descriptors `sMap_80Bxxx` (96 labels): named after their ROM address. They could take the area name (`sMap_<AreaName>`), but several areas share a descriptor
  (seasons), so this needs a mapping decision first.
- `aPaletteAnim_Row<r>Col<c>_<address>` (40 colour scripts): the address disambiguates scripts with the same row / column; kept on purpose.
