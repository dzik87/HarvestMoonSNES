# Naming of graphics blobs

Maps old -> new names (the graphics maps K1-K4 live in `defs/gfx/names/`, they are committed structure): `K1`/`K2` (Compressed*map -> tiles / tilemaps), `K3_gfx_names.csv` (address -> meaningful name, column `address` keeps
the ROM address of the US blob; sidecars have `legacy_label`), `K5_objects.csv` (1104 animation objects, `confidence` and `reason` per row, evidence ranking in the section "Evidence for the object names" below), `K4_sprites_objects_palettes.csv` (sprite banks `Sprites_<Content>` and the 117
`sPalette_0xNN` -> `Palette_<Area>_<Slot>`, `confidence` and `reason` per row). The CSV files are the record of the renames (the one-shot scripts that produced and applied them were removed; the names live in `src/`, `defs/`, `assets/`).
New renames of code labels are applied with `tools/dev/apply_renames.py` (see its docstring) and recorded in a CSV here.

| Prefix | Meaning |
|---|---|
| `Tiles_<Place>[_<Season>][_<n>]` | 4bpp tile graphics; `<n>` = VRAM slot (0-3 = $2000 / $3000 / $4000 / $5000 words) the map entry loads it to |
| `Screen_<Place>[_<Layer>]` | LZSS compressed BG name table; `_Layer2` = BG2 ($7000), `Overlay` = weather |
| `ScreenRaw_<Place>` | uncompressed name table (world maps) |
| `Sprites_<Content>` | OBJ graphics bank; engine identity is bank = $88 + (sprite id >> 8), in the order `tools/gfx/spritebanks.py` lists |
| `Palette_<Area>_<Slot>` | 256-colour palette, named after the first area and time-of-day slot (Early, Day, Evening, Dusk, Night) that uses it; `Palette_Obj_*` object palettes; `Palette_Unk_NN` unreferenced (NN = old index) |
| `Unk` | purpose not known; name keeps the area or address |

`Tiles_Overlay_*` / `Screen_Overlay_*` are the weather overlays, `Ending00-13`, `Credits`, `Intro*`, `Menu`, `Title` come from the area names of
`src/common/enums.asm`. Names are English, justified by the map entry that loads the blob (see `reason` in K3). Unchanged: `sFontGlyphs_*`.

Objects: `obj_XXXX_<Name>` frame folders, `"name"` in `assets/objects/bank_*/objects/NNNN.json` and the label `aObjAnimList_XXXX_<Name>`;
the index is the engine identity. Families: `Item_<Name>_{Icon,Big,ArcA_n,ArcB_n,Dropped,ArcLong}` (carried item table), `Player_*`, `Cow_*`,
`Dog_*`, `Horse_*`, `Chicken_*`, `Maria_*`/`Ann_*`/`Ellen_*`/`Eve_*`/`Nina_*`, `Npc_Unk_<Look>_*`, `Fx_*`, `Ending_*`, `Obj_Unk_<id>`.
Suffixes: `_Idle|_Walk` + `_Down|_Up|_Side` from the AI sprite tables (direction order 0 down, 1 up, 2/3 side).

### Evidence for the object names

Strongest first: (1) the carried item table (`assets/tables/data/carried_items.csv`): every carried item lists the objects it uses (icon, held / arc animations,
dropped state, thrown arc), item names come from the table labels and the enum order (high); (2) the NPC sprite tables (`assets/ai/npc_sprite_tables.txt`): per
direction objects (0 down, 1 up, 2 right, 3 left), together with the rendered frames they give the walk / idle / direction suffix (medium); (3) rendered frames grouped
into families (player poses, tools, animals, NPC appearances) (medium / low); (4) code: love variables (`nLove_*`) in the NPC scripts 19-1D and the ending script
text objects (high / medium). Uncertain names are descriptive and carry `Unk`: `Npc_Unk_<Look>_<id>`, `Obj_Unk_<id>` (see `open-questions.md`).

### Renames of `Unk` names and open questions

`O_unk_renames.csv` records the `Unk` / `unk` identifiers that could be named from evidence (area ids, the cow sale price variable, the table columns `release_tile` / `shelf_tile`, the credits graphics).
What is still unknown, and which emulator or listening test would settle it, is in [`open-questions.md`](open-questions.md).

## Audio

`J_audio.csv` (blob address -> `sAudioSpcDriver` / `sAudioTrack_<Song>` / `sAudioSample_Id<NN>`) and `L_sfx.csv` (`sfx_NN` -> `Sfx_<Description>`, the 50 sound effects; `Sfx_Unk<hex id>` where no
caller is known). Evidence and confidence per name: `docs/audio.md` section 13.

## Code labels (banks $83-$85)

`N_labels_bank83-85.csv` lists the renames of labels that embedded a ROM address in banks $83-$85 and the shared null pointer constants.
All anonymous local labels (`.labelN`) of the code banks are named after their role (`.loop`, `.next_slot`, `.check_down_limit`, ...) and are unique within the scope of the preceding global label.

## Code labels of banks $80-$82

`M_labels_bank80-82.csv` (old,new,confidence,reason) records the renames of address-suffixed global labels (`fReturn_818B6A`, `nTable_80AA68`, `L_82DD80` ...), the regional `.r_<address>_<n>` locals and the 371 anonymous `.labelN` locals of
`src/code/bank_80..82` (rows `<scope>.<old>` -> `<scope>.<new>`). Conventions: locals are `snake_case` named after the role of the branch target (`.loop`, `.next_tile`, `.check_saturday`, `.cancel_transition`), unique inside their global label and equal in every
`if !REGION_xx` block; shared returns are `<Routine>_Return`; loop heads of region patch targets are `<Routine>_RowLoop` / `_TileLoop` / `_WaitFrame`. Deliberately kept with their address: the 40 `aPaletteAnim_Row<r>Col<c>_<address>` colour scripts (the row / column pair is not unique, the
address disambiguates them), `sPalette_7F0900/0B00/0D00` (WRAM labels of `src/common/ram.asm`) and `fAudio_UploadSpcDataBlock_B2D120` (defined in bank $83).
