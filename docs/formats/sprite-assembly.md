# Assembled sprites (object frames -> pixels)

Status legend as in `object-data.md`: **[C]** confirmed from engine code (routine + address), **[D]** confirmed from the data or by
the tool, **[I]** inferred, **[V]** confirmed visually (rendered output looks like the expected sprite).

This note explains how a frame *component* of the object data (banks $86/$87, `object-data.md` section 6) turns into pixels of the
sprite tile banks `$88-$91` and documents the assembled frames. The assembled frames **are the editable sprite sources**: `assets/gfx/png/frames/obj_XXXX_<Name>/f_PPPP.png`
(one per distinct frame address of an object), written and read by `tools/gfx/pngsync.py` (`composed.py`); `import` splits an edited frame back into the 16x16
blocks of the banks `$88-$91`. `tools/objects/spriteexport.py` renders contact sheets / an index of all frames into `build/sprites_assembled/` (derived output, never committed).

## 1. From tile id to pixels [C]

Component = `u16 tile_id, s8 x, s8 y, u8 attr`. Every component is **one 16x16 hardware sprite**.

### 1.1 Source block in the ROM

`fObject_ProcessTileLoadQueue` (`$858CB2`, objects.asm) turns a tile id into a DMA job when the sprite is not yet resident
in VRAM (`$858D6D-$858E1B`):

| Step | Code | Result |
|---|---|---|
| bank | `AND #$FFC0 / LSR x6 / LSR x2 / ADC #$0088` (`$858D7D-$858D9B`) | source bank = `$88 + (id >> 8)` (ids `$0000-$09FE` -> banks `$88-$91`) |
| 8 KB block | `(id >> 6) & 3` indexes `aObject_TileBlockSourceOffsets` (`$858E47`, `$0000,$2000,$4000,...`; only entries 0-3 are reachable) | offset `$2000 * ((id >> 6) & 3)` inside the bank |
| slot in block | `id & $3F` indexes the slot table `aObjSlotOamTile_868000` (`$868000`, `LDA.L $868000,X` at `$858DB8`) | value `T = ((n & 7) * 2) + (n >> 3) * $20`, `n = id & $3F` |
| byte offset | `T * $20` (hardware multiplier `WRMPYA/B`, `$858DBE-$858DD2`) `+ $8000` (`$858DD8`) | address of the first 8x8 tile of the sprite |
| DMA | `fObject_ExecuteTileDmaQueue` (`$858E57`): two transfers of `$40` bytes, from `src` and `src + $200` (`$858E88`, `$858EB0`) to VRAM word `V` and `V + $100` (`$858EA5`) | tiles `T`, `T+1` (top half) and `T+16`, `T+17` (bottom half) of the 16-tiles-per-row sheet |

So in the sprite bank sheet (128 px wide, 16 tiles per row, 512 px high; `docs/formats/graphics-png.md`) the component's 16x16 block is at

```
sheet  = Sprites_{$88 + (id >> 8)}8000
blk    = (id >> 6) & 3
n      = id & $3F
pixel x = (n & 7) * 16
pixel y = blk * 128 + (n >> 3) * 16          (blk = 8 KB block = 16 tile rows = 128 px)
```

### 1.1b Frame image -> blocks (the import direction)

Frame image = the render below (section 1.4, section 2). The build / `import` reverse it per component: the 16x16 area at the component position
is un-flipped (attribute bit 5 = H, bit 4 = V) and written to `sheet / block / n` of the formulas above. Rules (details and limits:
`graphics-png.md`):

* **Determined pixels.** A pixel covered by exactly one component of the frame fixes the block pixel (including transparent = 0). Pixels covered by
  two or more components are *not* determined by the frame (which component owns the visible colour is unknown); they come from the remainder sheet
  `assets/gfx/png/sprites/Sprites_{sheet}8000.png`, which also holds the blocks no frame uses.
* **Shared blocks.** Many frames use the same tile id. All images claiming the same block pixel must agree; `check`/`build` report disagreements,
  `import` compares the images with the render of the current banks and treats only changed pixels as edits (contradicting edits are an error),
  then re-renders every frame so that frames using the changed block follow.
* **Overlap edits.** A changed visible pixel goes to the topmost component with a set block pixel there (else the topmost covering component).
* **Palette row** (`attr & 7`) is not part of the image: a pixel with another row than its component's is refused.
* Not changeable from images: tile ids, offsets, flips and attributes of components, frame structure (`assets/objects/`); bank sizes are fixed.

### 1.2 VRAM placement, OAM tile number, OBSEL

* The resident copy lives in a **tile cache slot** `s` (0-63; `fObject_AcquireTileSlot` `$858C39`, cache table `$7F0F00 + id`).
  VRAM destination = `slotTable[s] * $10` words (`$858DDD-$858DFB`), the OAM tile number written for the component is the
  low byte of the same `slotTable[s]` (`LDA.L $868000,X / STA.L $7EA002,X`, `$8585C3-$8585CB`). `slotTable[s] * $10` is exactly
  the VRAM address of 4bpp tile number `T` when the sprite character base is word `$0000`, so OAM tile `T` shows tiles
  `T, T+1, T+16, T+17` (the 16x16 sprite arrangement of the PPU) [C].
* OBSEL (`$2101`) is set by `fCore_ManageGraphicsPresets` (`$808C59`) from `Table_OBSEL_Presets` (`$808B44`:
  `$60,$60,$60,$60,$60,$60,$03,$03,$03,$03,$63`). Presets 0-5 (and 10): `$60` = size select 3 (**small 16x16**, large 32x32),
  name base 0 (`$0000`), name select 0. The routine is called from `fTileMap_MapChangeHandler` (`$80A7C6`, area id `< $57`) with the first byte of the map
  header; all 68 entries of `aTileMapData` (`$80AA7C`) whose header could be read (`s*Map` labels in `src/code/bank_80/tilemaps.asm`, comment
  "Graphic Preset") have preset 0 (56 maps), 1 (11) or 2 (1) [D], so objects in map scenes are drawn with OBSEL `$60`.
* The OAM size bit is **never set** for object sprites: the only bit the renderer ORs into the OAM high table is the X bit 8
  (`Table_858BD0` `$858BD0` = `$0001,$0004,$0010,...` i.e. bit 0 of each 2-bit pair; `$85852F`). Every object sprite is therefore a
  "small" sprite = 16x16 under OBSEL `$60`. [C]
* Presets 6-9 (`$03`) would make "small" 8x8; none of those 68 maps uses them (they belong to the non-map screens that call
  `fCore_ManageGraphicsPresets` directly), so objects are never drawn that way in map scenes [I].

### 1.3 Attributes and flips [C]

`fObject_RenderAll` (`$8583E0`) builds the OAM attribute byte at `$858582-$8585AF`:

| Component `attr` bit | OAM attribute | Note |
|---|---|---|
| 0-2 | bits 1-3 = **palette** (OBJ palette 0-7, CGRAM `$80 + 16*p`) | `ASL / AND #$0E` |
| 4 | bit 7 = **vertical flip** | (verified by tracing the shifts at `$858589-$858598`: `$10 << 2 = $40`, `>> 1`, `<< 2`, `AND #$C0` gives `$80`) |
| 5 | bit 6 = **horizontal flip** | (`$20 << 2 = $80 -> $40` after `LSR`; the second `ASL ASL` drops it, `AND #$C0` keeps `$40`) |
| 3, 6, 7 | unused | always 0 in the data [D] |
| - | bits 4-5 = priority `$20` (always set), then `EOR object.flip low byte` (`$40` H / `$80` V), then `ORA mapCurrentPresetId << 4` (`$8585A4-$8585AF`; preset 0/1/2 -> priority 0/1/2, no flips) | |

A flip applies to the whole 16x16 block (hardware flip of a 16x16 sprite mirrors the 2x2 tile arrangement as well as the pixels),
which is what the tool does. [C]

`attr` values that occur in the data: `$00-$07` (palette only), `$14` and `$16` (vertical flip; only objects `$0067` and `$00C9`) and
`$20-$27` (horizontal flip, 60 objects) [D]; in the index JSON `hflip`/`vflip` are listed per component.

### 1.4 Position, draw order, what is not applied

* Screen position = object position + sign-extended offsets - camera (`$8584C1-$8584FE`). The exported images are in **object space**: the origin
  (x = 0, y = 0) is the object position, `origin` in the JSON is where it sits inside the PNG. As on the hardware, OAM y is
  displayed one scanline lower; the tool ignores that.
* **Object flip** (`flip` bit `$40` / `$80` in the object slot, `fObject_FlipOffsetX/Y` `$858BB0/$858BBC`) is not applied: the offsets become
  `-o - 16` *and* the sprite flip bit is toggled by the `EOR`, so a flipped object is the exact mirror image of the exported frame about the
  object origin [C]. Exported frames are the unflipped ones (as stored in the data).
* **Draw order** [C]: the engine walks the components from the last to the first (`$858483-$858494` start pointer = last component;
  `$8585D9-$8585DF` steps back) and appends OAM entries (`bankAddress += 4`, `$8585D1`), so the **last component has the lowest OAM
  index and is drawn in front** (all components have the same priority). The tool paints components first to last, so the last one ends on
  top. 139 of 2614 frames differ if the order is reversed (`render_frame` is order sensitive); the order is the engine's, not an artefact of the tool.
  Between objects the engine sorts by Y first (`fObject_BuildDrawOrderByY` `$858377`); not modelled.
* Components of a frame whose tile cache slot is `$FF` (not yet resident) are skipped by the engine for that frame; screen-edge culling
  (`$85853B-$858556`) is not modelled.

## 2. Exported files

`python3 tools/objects/spriteexport.py export` writes (default `build/sprites_assembled/`, about 6 MB, 4832 files; git-ignored, rendered from the generated banks and the object data; the committed per-frame sources are `assets/gfx/png/frames/`):

```
build/sprites_assembled/
  index.json                     all objects: index, directory, bank, steps / frames / images
  obj_XXXX_<Name>/               one directory per object index $0000-$044F (1104)
    index.json                   steps (frame + timer), frames (components), images
    l0_f00.png, l0_f01.png ...   one PNG per distinct frame image (l<list>_f<image>)
    contact.png                  all distinct images, aligned on the object origin, 2x, labelled f00, f01, ...
  unreferenced/                  the 7 frames that no step references (dead data, object-data.md section 8), same layout
```

* **list**: every object index has exactly one animation list (`object-data.md` section 5), so the `<list>` part is always `l0`; the field
  exists so that a future list-sharing model fits.
* **frame images** are de-duplicated per object by content (size, origin, pixels): two steps that point to different frame addresses
  but compose to the same image share one PNG (`images[n]` in the JSON, `image` in each step/frame). 3774 steps -> 2614 distinct frames -> 2614 images
  (1327 distinct pixel blocks across all objects; not shared between objects to keep every folder self-contained).
* **PNG format**: indexed, size = bounding box of the components (so the image is *not* trimmed to its content, which keeps it reversible).
  Pixel value = `(OBJ palette number << 4) | colour index`, 128 palette entries, **every value whose colour index is 0 is transparent** (tRNS).
  The embedded palette is the real **day OBJ palette** `Palette_Obj_Day` (rows 0-7, `aMapPalettesId` `$6B`; see `docs/formats/graphics-palettes.md` section 4:
  the code takes the OBJ row from bits 0-2 of the component attribute, which is what the pixel value's high nibble keeps), provided by `palette_map.sprite_palettes()`.
  Not applied: the night palette (`Palette_Obj_Evening`), the event palettes `0x71-0x73` and the run-time patches of OBJ row 7 (colours 10-12, season) and row 3 (colours 8-10, wife's dress).
  The provider is pluggable: `--palette-module FILE` with `sprite_palettes(object_index)` returning 8 lists of 16 `(r, g, b)` tuples. The palette of a PNG never influences `check`.
* **index.json** (per object):

| Key | Meaning |
|---|---|
| `object`, `bank`, `list` | object index, bank (`$86`/`$87`), 24-bit address of the animation list |
| `lists[0].steps[]` | `step`, `frame` (24-bit address), `timer` (raw byte; `$FF` = hold forever, see object-data.md section 5), `image`, `png` |
| `images[]` | `png`, `size [w, h]`, `origin [x, y]` (object origin inside the image) |
| `frames[]` | `addr`, `image`, `png`, `origin`, `size`, `components[]` |
| `components[]` | **source data**: `tile`, `x`, `y` (signed), `attr`; **derived** (for readers, recomputed by `check`): `sheet`, `sx`, `sy` (position of the 16x16 block in the 128x512 sprite bank sheet; the same block is the remainder sheet / frame pixels described in 1.1b), `palette`, `hflip`, `vflip` |

## 3. Commands and checks

```
python3 tools/objects/spriteexport.py export [--object N]... [--out DIR] [--no-frames] [--palette-module FILE]
python3 tools/objects/spriteexport.py check  [--object N]... [--out DIR]
python3 tools/objects/spriteexport.py show   OBJECT [--frame N] [--scale S] [--out FILE]
python3 tests/test_spriteexport.py
```

`check` (CI step "Check asset sources"; run it on a fresh `export`, or let `tests/test_spriteexport.py` do both in a temp dir) re-parses every `index.json` and requires: the steps/timers equal the animation list read from
`assets/objects/bank_86`/`bank_87` (the sources of the object data, `docs/formats/object-data.md` section 10); every frame's components equal the data bank (including derived fields); the image
list equals a fresh render; every frame PNG and every `contact.png` equals a fresh re-render pixel for pixel (palette ignored); no stray
files; the top-level index lists all 1104 objects. It never writes. The contact sheet labels use a built-in 3x5 pixel font so that the
output does not depend on the Pillow version.

**Reverse direction.** The ROM bytes are *not* generated from this folder: editing an exported PNG or JSON does nothing to the build, and `check` will
report the difference (the folder is derived output, like `pngsync.py preview`). To change a sprite, edit its frame image
(`assets/gfx/png/frames/obj_XXXX_<Name>/f_PPPP.png`, `docs/formats/graphics-png.md`) and run `pngsync.py import`; to change the layout of a frame edit `assets/objects/bank_8x/frames.txt`.
A PNG -> component re-import (finding tile ids for edited pixels, allocating unused blocks, re-pointing frames) is future work; the JSON already
carries everything that is needed (`tile`, `x`, `y`, `attr`, and the sheet position of each tile). To regenerate after any change of
the sprite sources or the object data: re-run `export` (nothing is committed).

`export --no-frames` writes only `index.json` + `contact.png` (about 3.3 MB); `show OBJECT` renders one object's contact sheet or frame to `build/`.

## 4. Visual verification [V]

Grayscale renders were inspected (overview sheets of all 1104 objects plus enlarged contact sheets). These objects assemble into proper,
coherent sprites (limbs, heads, tools and shadows line up; multi-component animals are not torn):

| Objects | What they show |
|---|---|
| `$0000-$0007` (and the rest of `$0000-$007D`) | the player: walking/standing frames for the four directions, then the player with tool and item animations (hoe/axe/hammer/sickle/watering can swings with effects `$0067`, `$0068-$0079`, item carrying `$002A-$0033`, ...), hammer with stars (`$0067`, uses horizontal and vertical flipped components) |
| `$0095-$0097`, `$0200-$0208` | player on a horse, horse and pony |
| `$00B7-$0179` | held/dropped items, tools, crops, eggs, ingredients (single and double component) |
| `$018B-$01B9` | cows (multi-component bodies; e.g. `$018B` has 3 frames) |
| `$01D9-$01F7` | black-and-white animal frames (look like a dog or calf; not identified with certainty) |
| `$0212-$021D` | chickens/ducks/birds |
| `$02F6`, `$02F7`, `$0304`, `$0305` | black-and-white dog-like animal (sitting with an exclamation bubble; running) - the dog event object, name not verified |

The names are visual impressions: no code or label in the repository names these object indices, so no `docs/naming/object_names.csv`
exists. The directory names `obj_XXXX_<Name>` take the name from the `"name"` field of `assets/objects/bank_XX/objects/NNNN.json` (`docs/naming/K5_objects.csv`).
Objects with an empty (all-transparent) frame image, effects, particles and small items were only skimmed.

## 5. Open points

* **Colours**: day OBJ palette `Palette_Obj_Day` for every object (all areas that have objects use `$6B` by day / `$6C` by night in `aMapPalettesId`); one palette per
  component (`attr & 7`) is preserved in the pixel values, so another provider can colour a frame exactly (night, events, seasonal patches of rows 7 and 3).
* `mapCurrentPresetId << 4` is ORed into the OAM attribute (`$8585A4`). With the map presets 0-2 it only changes priority; any preset >= 4
  (non-map screens) would set flip bits, so objects presumably are not used there (not verified).
* Presets 6-10 select an 8x8 "small" size (OBSEL `$03`/`$63`) but are never selected by any map header or call (`docs/formats/graphics-palettes.md` section 3).
* The 7 unreferenced frames are exported (`unreferenced/`) but their purpose is unknown. Ids beyond bank `$91` do not occur (the tool would render them empty).
