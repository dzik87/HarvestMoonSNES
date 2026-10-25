# Reverse-engineering findings

Notes gathered while naming code and data (confidence: derived from reading code, not emulator-tested).
Label names refer to the current sources; see `docs/naming/*.csv` for old -> new mappings.

## Palette colour-cycle animation (bank 80)
- Updater: `fCore_Unknown808E69` (called from the main loop at $8080AF); walks 16 slots.
- Slot i: 24-bit script pointer at `ptrPaletteAnimScripts + 3*i`, frame timer `strcPalette.animTimer`,
  colour index `strcPalette.animColorIndex`, palette row `strcPalette.animPaletteRow`.
- Script format: repeated `dw BGR555 colour` + `db duration (frames)`; `dw $FFFE` followed by a `dl` jumps (loops);
  `dw $FFFF` ends the script. Colour is written to `sPalette_7F0900 + row*32 + index*2` via `fPalette_Unknown80916F`;
  if anything changed, a 0x100-byte CGRAM DMA is queued.
- Slots are started with `fCore_Store0x72To0x42AtIndex` (A = colour index, X = slot, Y = palette row, $72 = script pointer).
- `pSubrutineTable_80BEEC`: 0x60 entries (one per `strcMap.loadAreaId`) x 6 words: 5 routine pointers (time-of-day slots,
  chosen from `nCurrentTimeID`: <7, <0xF, <0x11, <0x12, else) and a condition word ($FFFF = always,
  $0001 = only from autumn on).

## AI slots (bank 84)
- 49 slots x 64 bytes at $7E:B586 (`strcAIUnknown`). +00 active, +01 flags ($01 exists, $02 create object, $04 sprite update,
  $08 wander, $10 skip movement, $20 step move), +02 data index, +03/+04 dx/dy, +0F direction bit (1 down, 2 up, 4 left, 8 right),
  +10 frame-yield timer, +12 game object index, +1A/+1C position, +30/+32 script pointer (24-bit), +3F type / cow id.
- See `docs/ai/commands.md` for the 90 interpreter commands.

## Carried items (bank 81)
- State byte `$0976` = phase: 0 start/pickup, 1 prompt/consume, 2 carry loop, 3 put down, 4 clear slot, 5 sell prompt,
  6 sell answer, 7 wait for script end, 8 finish.
- `pItemCarriedTable_8196AF`: ptr24 per carried-item id -> frame list of 3-byte entries (`dw sprite`, `db flip`).
- Buy table `aDialogsData_BuyItems`: 12-byte entries; sell table: 3-byte entries (dialog word + price byte);
  shipping table: 2-byte entries (tile + profit).
- Carried-item ids are a different enum from the `!EITEM_*` tool ids (see issues below).

## Objects and sprites (bank 85)
- 40 object slots of $24 bytes; animation lists of 3-byte entries (data pointer + frame timer); components are 5 bytes
  (tile id, x, y, attribute). Sprite tiles are ref-counted (lookup $7F0F00, counts $7EA320, load ring buffer $7EA220).
- `fObject_RenderAll`: clear OAM shadow, sort by Y, emit OAM ($7EA000 / high table $7EA200), DMA $220 bytes.

## Audio / SPC700 protocol (bank 83)
- Commands go through APUIO0-3 with a handshake in `fAudio_SendSpcCommand` (waits for port 3 = $04).
- Command ids as used by the code: 1 upload block ($3F2 bytes from $B2D120), 2 load common samples, 3 load one sample,
  4 free sample slots, 5 upload track data (3-byte chunks), 8 start track, 9 fade out ($40 slow / $10 fast), $0A play SFX,
  $0B stereo/mono switch (0 = stereo), $0C pause toggle on the SPC side (stubbed on the 65816 side).
  Details, track format and sample layout: `docs/audio.md`.
- `aAudioTrackDataSizeTable`: 26 words; `aAudioSfxSampleIdTable`: sample id per SFX id; track table entries are 14 bytes
  (ptr24 + 11 sample ids).

## Title / menu (bank 82)
- Title state machine on `strcVariables.n8Temp4`: 0 delay, 1 opening demo, 2-3 logo scroll, 4 cursor palette init, 5 menu input,
  6 skip, 7 slot select -> new game, 8 slot select -> load game, 9 reinit, $0A how-to-play. Idle 600 frames starts how-to-play.
- Save slots at $70:0000 and $70:1000; a slot is valid when the header contains "FARM" at offset $3C; name at $80.

## Suspected issues in the original data or in earlier annotations
- `AICMD0x26`/`0x27` emit `$28` (aliases of 0x28); unused in US scripts.
- `AICMD0x42` ignores its address operand and always adds to `nMoney`; `0x41` clamps to 0..999.
- `0x14`/`0x23`: `aAISetMask` is a `1<<n` mask on game flags, not a button mask.
- `0x34` wrote `!EITEM_POTATOSEED` ($07) although carried-item id $07 is a fish; fixed in source by using `!CITEM_FISH` (same value).
- Carried-item id $14 is the egg; the egg code used `!EITEM_GOLDAXE`. Fixed in source with the new `!CITEM_EGG` (same value).
- `0x50`/`0x51` store the season byte into `nDogAreaId`; `0x58` leaves `mapMultiWidth` = 4.
- Dead code after the `0x4F` handler's RTS ($84BB65-$84BBD9).
- `!PDIR_LEFT`/`!PDIR_RIGHT` ($02/$03) may be swapped relative to the actual input handling (to be confirmed).
- `aGameObjectIndexOffsets` carries a "BUG should be $510" note in the source.
- Three identical 16-entry `1<<n` word tables exist (`aEngineUnknown_83CA78`, `aUnusedTable_83E74D`, `Table_858C7F`).

## Graphics compression (banks $92-$A0, $A4-$A6)
- Okumura-style LZSS (2048-byte ring, matches 3..34 bytes), 4-byte header; see `docs/formats/tilemap-compression.md`.
- `tools/gfx/tilemap_codec.py` decompresses and re-encodes all 137 labelled blobs byte-for-byte (`tests/test_tilemap_codec.py`).
- Former layout issues are fixed: the tail of `sCompressedTilemap_99DCBD` was moved out of `Padding_990000`, and the blobs at $A5CB05 and $9FD4DA have their own labels.
- Naming caveat: `sCompressedTilemap_*` blobs are tile graphics and `sCompressedCharactermap_*` blobs are BG name tables (see `docs/formats/tilemap-compression.md`).
- Remaining: `sCompressedCharactermap_A69996` is followed by ~4 KB of uncompressed data.
