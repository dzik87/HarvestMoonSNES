# Object / sprite animation data (banks $86 and $87)

Status legend: **[C]** confirmed from the engine code (routine + address given),
**[D]** confirmed from the data (checked by `tools/objects/objdata.py`, 100 % of
both banks parse without exceptions), **[I]** inferred / interpretation, not proven by code.

Tooling: `tools/objects/objdata.py` (`build`, `check`, `extract`, `analyze`), tests in
`tests/test_objdata.py`; the editable sources are described in section 10; how components map to pixels and the exported frame images: `docs/formats/sprite-assembly.md`, the label renames that were applied during the migration are listed in `docs/naming/H_objects_86_87.csv`.
All offsets below are 16-bit offsets inside the bank unless a full `$BBAAAA` address is given.

## 1. Overview

The two banks hold the animation data of every "game object" (the 40 sprite objects handled by
`src/code/bank_85/objects.asm`). An object is created with an **object index** (`spriteTableIdx`,
`strcObject.spriteTableIdx` $A1, stored in the slot at $019E). The index selects an **animation
list**; a list is a sequence of **steps** (frame pointer + duration); a **frame** is a set of
16x16 hardware sprites (**components**) positioned relative to the object.

```
object index --(x2)--> pointer table --> animation list --> step --> frame --> component
   u16                    u16 offset      3-byte steps       ptr16+timer   count + 5-byte components
```

Both banks have the **same layout** (section 2). Object indices `$0000-$0261` live in bank $86,
`$0262-$044F` live in bank $87 (index minus `$262` is used for the bank $87 table).

## 2. Bank layout [C][D]

| Offset (both banks) | Size | Content |
|---|---|---|
| `$8000` | `$80` | Slot table: 64 x u16, OAM tile number per sprite tile slot |
| `$8080` | `2*N` | Animation list pointer table, one u16 per object index |
| after table | var. | Animation lists, contiguous, in object-index order |
| after lists | var. | Frames, contiguous (no alignment) |
| after frames | to `$FFFF` | Zero padding |

| | Bank $86 | Bank $87 |
|---|---|---|
| N (object indices) | `$262` = 610 | `$1EE` = 494 |
| Pointer table | `$8080-$8543` | `$8080-$845B` |
| Animation lists | `$8544-$A4AD` (610 lists, 2274 steps) | `$845C-$99CB` (494 lists, 1500 steps) |
| Frames | `$A4AE-$E13F` (1181 frames, 2865 components) | `$99CC-$B8A4` (856 frames, 1408 components) |
| Zero padding | `$E140-$FFFF` (7872 bytes) | `$B8A5-$FFFF` (18267 bytes) |

Total object indices: `$450` = 1104. There is no upper-bound check on the index in the engine [C].
The lists are laid out in object-index order (the table is strictly ascending in both banks [D]) and the
frames follow in ascending address order (not in first-use order); the engine does not depend on either.

## 3. Entry points: tables the code indexes [C]

All consumers are in `src/code/bank_85/objects.asm`; no code outside bank $85 touches banks
$86/$87 directly (grep of `src/` for `$86xxxx`/`$87xxxx` and the labels finds only this file).

| Table | Address | Element | Index | Read by |
|---|---|---|---|---|
| `aObjectsList1` (bank $86 list pointer table) | `$868080` | u16 offset in bank $86 | `spriteTableIdx * 2` (index < `$262`) | `fObject_Create` `$858075`, `fObject_Replace` `$858160` |
| `aObjectsList2` (bank $87 list pointer table) | `$878080` | u16 offset in bank $87 | `(spriteTableIdx - $262) * 2` | `fObject_Create` `$858086`, `fObject_Replace` `$858171` |
| `aMultiplicantValue_868000` (slot table) | `$868000` | u16 (only low byte used for OAM) | tile slot `* 2` (0-63) | `fObject_RenderAll` `$8585C3`, `fObject_ProcessTileLoadQueue` `$858DB8` and `$858DE1` |
| `Data_878000` (copy of slot table) | `$878000` | - | **never read** | - (byte-identical to `$868000`) [D] |

Bank selection: every routine compares the index with `#$0262` (`CMP.W #$0262` at `$858004`,
`$85806B`, `$8580BD`, `$858106`, `$858154`, `$858215`, `$8582EC`, `$8583E6`) and loads bank byte
`$86` (below) or `$87` (>=) into the long pointer (`$85800B`/`$858015`). The frame pointers inside
animation lists and the list pointers inside the table are therefore **16-bit offsets that are
completed with the bank byte chosen from the object index** [C]; a list in bank $86 can only point to
frames in bank $86. All 4,878 pointers in the two banks (1,104 table entries + 3,774 step pointers) resolve inside their own bank [D]; there are
no 24-bit pointers in these banks.

Index producers (who chooses the object index): `fObject_Create`/`fObject_Replace` callers
`81A4AE`, `81A57D` (carried items, index from `$097A` table `pItemCarriedTable_8196AF`),
`81CFDA`/`81D035` (`sSmallSpriteData` at `$81D210`, 3-byte entries whose first word is the index),
`82E8DC` (constant `$0219` menu sprite, `$82E8BA`), `8482DF`/`848304` (AI engine: word at AI slot
offset `+$16`, `$8482B9`). [C]

## 4. Object slot (runtime state) [C]

`$24` bytes per slot, 40 slots (`CMP #$0028` at `$858027`, `CPY #$0028` at `$8582B7`), WRAM `$7E019C-$7E073B`;
slot offset table `aGameObjectIndexOffsets` (`$858BE0`; note the known wrong entry at index 36).

| Slot offset | Field (structures.asm) | Real meaning |
|---|---|---|
| `+$00` | `initailized` | `$7777` in use, `$0000` free |
| `+$02` | `spriteTableIdx` | object index |
| `+$04` | `flip` | bit `$40` = horizontal flip, bit `$80` = vertical flip |
| `+$08/+$0A` | `positionX/Y` | world position |
| `+$0C` | `objectListPointer` (word) | **start of the animation list** (16-bit offset) |
| `+$0E` | `objectListPointer+2` (word) | **offset of the next step** to read (current step + 3) |
| `+$10` | `objectDataPointer` (word) | **current frame pointer** (16-bit offset) |
| `+$12` | `objectDataPointer+2` (byte) | **frame timer** (the field name says "pointer" but it is the timer byte) |
| `+$13` | `totalComponents` | component count of the current frame |
| `+$14..+$23` | `components` (16 bytes) | tile-cache slot (0-63) per component, `$FF` = not resident |

`fObject_Create`: `+$0C` <- list pointer (`$858090`), `+$0E` <- list pointer + 3 (`$858094-$858097`),
`+$10` <- word at list+0 (`$85809D-$85809F`), `+$12` <- byte at list+2 (`$8580A4-$8580A9`), then
`fObject_ParseObjectData`. At most 16 components can be tracked per object, which bounds the
component count of a frame (max in data: 10 in bank $86, 12 in bank $87 [D]).

## 5. Animation list [C][D]

```
list   := step* , $0000
step   := u16 frame_ptr   ; offset of a frame in the same bank, never 0
          u8  timer       ; duration, see below
```

* A step is **3 bytes** (`ADC #$0003` at `$858094`, `$85833C`) [C].
* The list is terminated by a **u16 `$0000` in the frame-pointer position**. When the engine reads
  a step whose first word is 0 it **reloads the list start from slot `+$0C` and reads the first step again**
  in the same update (`fObject_UpdateAllAnimations` `.loop3` `$85831F-$858328`): the terminator means
  "loop", there is no "stop" opcode [C]. An empty list would hang that loop; none exists [D].
* Lists have 1-16 steps; 165 lists in bank $86 and 157 in bank $87 have a single step [D].
* No list is shared between object indices: each table entry points to its own list [D].

### Timer byte [C] (`fObject_UpdateAllAnimations` `$8582C7`)

* Update tick, `timer == 0` (`$858305`): advance to the next step: read the next step (looping at
  `$0000`), store frame pointer and timer (`$85832A`, `$858334`), `+$0E += 3` (`$85833C`), parse the
  new frame (`$858342`).
* `timer != 0`: if `timer == $FE` the object is destroyed (`$85834E-$85835F`: tiles released,
  `initailized = 0`).
* After either branch the timer is decremented **unless it is `$FF`** (`$858369-$85836E`).
* Consequences:
  * `1..$FD`: the frame is shown for exactly that many update ticks [C].
  * `$FF`: frame is shown **forever** (timer never changes; the list never advances) [C].
  * `$00` would wrap to `$FF` (forever) after the first decrement; the value never occurs in data [D].
  * `$FE` as the timer of a *later* step cannot trigger the destroy test, because the step's own
    tick decrements it to `$FD` before the next test; it therefore behaves as a 254-tick hold and then
    the list wraps to the first step. The destroy test only fires when an object is created (or
    replaced) with a first-step timer of `$FE` (nothing in the data does that) [C].
  * **Open question [I]**: all 34 (bank $86) + 5 (bank $87) lists that use `$FE` have it only on their last
    step, which repeats the final frame of a blink sequence (e.g. `(frame, 2),(frame', 4)...(frame, $FE)`),
    which suggests the authors intended "vanish after the blink". The code as written does not do that;
    possibly the removal is performed by game logic elsewhere. Keep the value as data.
* 465 (bank $86) and 367 (bank $87) lists end with a `$FF` step (static end pose); the remaining
  lists end with a finite or `$FE` timer and therefore loop [D]. `$FF` never appears on a non-final
  step [D].

Timer distribution: bank $86 has 37 distinct values (finite maximum 253); bank $87 has 25 (maximum 240) [D].

## 6. Frame and component [C][D]

```
frame     := u8 count (1..16), component[count]
component := u16 tile_id      ; +0, little endian
             s8  x_offset     ; +2
             s8  y_offset     ; +3
             u8  attr         ; +4
```

Size `1 + 5*count`; frames are packed back to back (`ADC #$0005` at `$858B34`, `$8585DC`) [C].

* **count**: read in `fObject_ParseObjectData` (`$858AF3`) and copied to slot `+$13`. 0 is not used by
  the data [D]. Maximum 16 (slot component array) [C]; data maximum 10/12 [D].
* **tile_id** (12 bits used; tile cache table `$7F0F00` has `$1000` byte entries, `$858F0E-$858F14`;
  data range `$0000-$09FE` [D]). It identifies a 16x16 sprite in the graphics banks `$88+`
  [C]: `fObject_ProcessTileLoadQueue` (`$858CB2`) loads it with source bank `$88 + (id >> 8)`
  (`$858D91-$858D9B`), block offset `$2000 * ((id >> 6) & 3)` (`aObject_TileBlockSourceOffsets`
  `$858E47`), inside the block `slotTable[id & $3F] * $20` (`$858DB4-$858DD2`), plus `$8000`. Two DMA
  transfers of `$40` bytes (rows `+0` and `+$200`) fill the sprite's four 8x8 4bpp tiles
  (`fObject_ExecuteTileDmaQueue` `$858E57`). The sprite is therefore 16x16 [C]. Tile ids resolve to a cache slot
  via `$7F0F00+id` (`fObject_AcquireTileSlot` `$858C39`), the slot number is what `fObject_RenderAll` uses.
* **x_offset / y_offset**: sign-extended 8-bit (`$8584C1-$8584D1`, `$8584E2-$8584F2`), added to the object
  position minus the camera. With the object flip bits `$40` (x) / `$80` (y) the offset `o` is replaced by
  `-o - 16` (`fObject_FlipOffsetX/Y` `$858BB0`, `$858BBC`, `fObject_NegateOffsetMinus16` `$858BC4`), i.e. the sprite
  is mirrored about the object origin assuming a 16-pixel sprite [C]. Data range: x -72..23, y -80..48 [D].
* **attr** (`$858582-$8585AF`) [C]:
  * bits 0-2 -> OAM palette bits (OAM bits 1-3),
  * bit 4 -> OAM vertical flip (bit 7), bit 5 -> OAM horizontal flip (bit 6),
  * bits 3, 6, 7 are not used by the engine and are always 0 in the data [D],
  * the engine adds OAM priority `$20`, XORs the object `flip` low byte into the OAM attribute and ORs
    `mapCurrentPresetId << 4` (`$8585A4-$8585AF`). Values seen [D]: `00-07` (palette only), `14` and `16` (V flip, bank $86 only), `20-27` (H flip).
* **Draw order** [C]: components are emitted from the **last to the first** (`$858483-$858494`,
  `$8585D9-$8585DF`), so the last component gets the lowest OAM index. [I] The last component of a frame
  is therefore drawn in front of the earlier ones.
* **Culling** [C]: components whose screen X is in `$0100..$FFEF` or screen Y in `$00F0..$FFEF` are skipped
  (`$85853B-$858556`); only bit 8 of X is kept in the OAM high table (`Table_858BD0`).
* A component whose cache slot is `$FF` (tile still queued for DMA) is skipped for that frame
  (`$8584B3-$8584B7`) [C].

## 7. Slot table at `$8000` [C][D]

64 words, value `n` -> `((n & 7) * 2) + (n >> 3) * $20`. It is the OAM tile number of cache slot `n`
(low byte stored to OAM at `$8585CB`) **and** the offset multiplier into the source sheet (`* $20` bytes at
`$858DD2`) and the VRAM destination (`* $10` words, `$858DF8`), because the sprite sheets use the standard
16-tiles-per-row layout. The table is unchanged between banks.

## 8. Unreferenced and irregular data [D]

* Unreferenced frames (valid frame structure, no step points to them; none has an asm label, each sits inside the label span of
  the preceding frame):
  bank $86 `$C59A`, `$C5AF`, `$C5C4`, `$D346`; bank $87 `$A521`, `$AABC`, `$AAC7`. They are modelled as frames by structural
  inference [I]; they are dead data.
* Bank $87 `$A9C8`: one stray `$00` byte between the frames at `$A9B8` and `$A9C9` (not part of either frame). Not modelled.
* Bank $87: label `Padding_870000` is at `$87B8A4`, one byte before the real padding start `$87B8A5`: `$87B8A4` is the
  attribute byte of the final frame at `$87B89F` (the dump split `db $01,$C7,$09,$F8,$F8` / `$00`).
* 14 (bank $86) and 34 (bank $87) frames are byte-identical to another frame (not deduplicated by the original tool).
* 420 / 250 frames are shared by more than one step [D].

## 9. Model coverage (`objdata.py analyze`)

Bank $86: 100 % of 32768 bytes (24896 non-padding bytes all structural). Bank $87: 32767 of 32768 bytes
(99.997 %); the single unmodelled byte is the filler at `$A9C8`. Nothing is left as opaque bytes; the opaque
fallback exists in the tool (tested) for data that fails validation.
Counts (`objdata.py analyze`):

| | Bank $86 | Bank $87 | Total |
|---|---|---|---|
| Object indices / lists | 610 | 494 | 1104 |
| Steps | 2274 | 1500 | 3774 |
| Frames (referenced / unreferenced) | 1177 / 4 | 853 / 3 | 2030 / 7 |
| Components | 2865 | 1408 | 4273 |

## 10. Editable sources and build

The two banks are no longer committed as assembly. The source of truth is `assets/objects/bank_86/` and `assets/objects/bank_87/`:

| File | Content |
|---|---|
| `bank.json` | `first_object_index` (`0000` / `0262`) and the 64-entry `slot_table` (section 7) |
| `objects/NNNN.json` | one animation list per object index (4 hex digits, contiguous from `first_object_index`): `{"steps": [["<frame id>", timer], ...]}`, `"name"` (object name, `docs/naming/K5_objects.csv`; part of the generated label) |
| `frames.txt` | all frames **in ROM order**: `<id>: tile,x,y,attr tile,x,y,attr ...` (tile and attr in hex, x/y signed decimal); `raw <hex>` lines keep bytes that belong to no frame; `;` starts a comment |

Frame ids are the suffix of the label (`86A4AE` -> `aObjFrame_86A4AE`); they are just names, the real address is computed by the layout pass, so adding a
component, inserting a frame or reordering lines moves everything behind it and every pointer follows. Frames that no step uses (section 8) have ids starting
with `U` (`U86C59A`). Frames shared by several steps (or objects) are shared by using the same id. The bank is padded with zeros to `$FFFF`; a layout that exceeds the bank is an error.
The timer is a plain number (`255` = `$FF` = hold forever, section 5).

`python3 tools/objects/objdata.py build` (run by `tools/build_assets.py`) writes `build/gen/objects/bank_86.asm` and `bank_87.asm`, which `src/main.asm` includes.
Labels are generated from the sources and keep the names used by the code and docs: `aObjSlotOamTile_868000`, `aObjAnimListPtrs_86`, `aObjAnimList_XXXX_<Name>` (global object index, then the name),
`aObjFrame_<id>`, `aObjPadding_<end>`; pointers in the generated asm are symbolic (`dw aObjFrame_86A4AE`). `check [--rom US.sfc]` assembles the sources, re-parses the bytes into the structural model
and verifies the round trip (and, with a ROM dump, equality with the original banks); `extract --rom US.sfc` regenerates the sources from a dump (overwrites `assets/objects`).
Size: about 170 KB of sources (1,104 object files plus two `frames.txt`), against 1.37 MB of `db`/`dw` text before.
