# Tilemap / charactermap compression (LZSS, N=2048, F=34)

Status: fully understood, decoder and encoder verified against every blob in the
ROM. Implementation: `tools/gfx/tilemap_codec.py`, tests:
`tests/test_tilemap_codec.py`.

The format is a textbook LZSS (Haruhiko Okumura's `LZSS.C`) with a 2048-byte ring
buffer, 3..34 byte matches, LSB-first flag bytes where `1` means literal, a
4-byte header and no end marker (the output size in the header terminates the
stream). It is used for every `sCompressedTiles_*` and
`sCompressedTilemap_*` blob (banks $92-$A6, layout in `assets/gfx/banks.json`, generated asm in `build/gen/gfx/tiles/` and
`build/gen/gfx/characters/`). Despite the name, several of these blobs are plain
tile maps for BG layers, others are character (tile graphics) data; the codec
does not care.

## Routine: `fGraphicsDecompressTilemap` ($8381F8, `src/code/bank_83/graphics.asm`)

Call with `JSL`. No register arguments; everything is passed in direct page:

| DP    | Name               | Meaning                                              |
|-------|--------------------|------------------------------------------------------|
| $72-$74 | `ptrTemp0x72`    | 24-bit pointer to the compressed blob (input)        |
| $75-$77 | `ptrUnknown0x75` | 24-bit pointer to the destination buffer (output)    |

Register widths are irrelevant (the routine does `PHP` / `REP #$30` and restores
P on exit). On return: `A` = 0 (the final value of the remaining-byte counter),
`X` is clobbered, `$72` has advanced past the last byte consumed, `$75` past the
last byte written. Scratch DP used: `$7E` remaining count, `$80` current flag
byte, `$82` flag bit counter, `$84` ring write position, `$86` ring read
position, `$88` match length.

Work RAM used: the ring buffer lives at `$7F0000-$7F07FF` and is cleared to $00
at the start of every call (2048 bytes, word stores).

Output destination: always the caller-provided long pointer in `$75`. All three
call sites use `$7E2000` as destination:

* `src/code/bank_80/tilemaps.asm` map loader (`$80A883`, tile maps): the map
  header gives, per BG layer, a VRAM address and a 24-bit blob pointer. Each is
  decompressed to `$7E2000`, then `$2000` bytes are DMA'd to that VRAM address
  (`fCore_PrepareTransfer` / `fCore_StartPreparedTransfer`, channel setup
  `arrayIndex=0`, `destinationRegister=$18`, i.e. VMDATAL).
* same file (`$80A8EB`, character maps): decompressed to `$7E2000` unless
  `strcDialogDisplay.mapFlags` bit 15 is set, in which case the (uncompressed,
  `sCharactermap_*`) data is copied raw, `$8000` bytes, to `$7E2000`. The data is
  then uploaded row by row by `fTileMap_UploadRowToVRAM`.
* `src/code/bank_83/dialog.asm` `fDialog_LoadDialogBoxGraphics` ($8392D3): blob
  at `$A5CB05` to `$7E2000`, then DMA `$400` bytes to VRAM word `$7800`.

The destination buffer is `$7E2000`, so the maximum useful output is `$8000`
bytes (`$7E2000-$7EA000`); the routine itself performs no bounds check.

## Stream format

```
offset  size  field
0       2     output size, little endian ("n"); 0 means 65536
2       2     ignored by the routine (always $0000 in the game)
4       ...   groups: 1 flag byte followed by up to 8 items
```

Groups: the flag byte is consumed LSB first. Bit = 1: **literal**, followed by 1
byte. Bit = 0: **back-reference**, followed by 2 bytes `b0 b1`:

```
src    = b0 | ((b1 & 0xE0) << 3)    ; absolute position 0..2047 in the ring buffer
length = (b1 & 0x1F) + 3            ; 3..34
```

`src` is an absolute ring-buffer index, not a distance. Each flag byte holds 8
bits; a new flag byte is read when all 8 were used. Decoding stops the moment
the output counter reaches 0, in the middle of a group if necessary; there is no
terminator and the last flag byte may be partially used.

Ring buffer semantics (the part that is easy to get wrong):

* 2048 bytes, initially all $00, initial write position `$7DE` (= N - F).
* Every output byte (literal or copied) is also stored at the write position,
  which then advances modulo 2048.
* Back-reference copies read byte by byte from `src`, advancing `src` modulo
  2048, and each copied byte is stored into the ring as it is produced, so
  `src` may point at or just behind the write position and the copy can overlap
  its own output (run-length style). The initial zero fill is addressable: a
  reference with any `src` that is still untouched produces zeros.
* The final byte written (when the counter hits 0) is returned to the output but
  is not stored into the ring - irrelevant since decoding ends there.

Per-byte order in the code (`$838248`, `$83829x`): write output byte, `DEC`
counter, return if zero, then store into the ring. Instruction-level mapping:

| Asm                                             | Meaning                                  |
|-------------------------------------------------|------------------------------------------|
| `$83820C-$838216`                               | read size word, skip 4 header bytes      |
| `LDA #$07DE / STA $84`                          | ring write pos = $7DE                    |
| `DEC $82 / BPL` ... `LDA #$0007 / STA $82`      | flag byte reload, 8 bits per byte        |
| `LSR $80 / BCC`                                 | bit = 1 -> literal path                  |
| `AND #$00E0 / ASL x3 / ORA $86`                 | `src = b0 | ((b1&$E0)<<3)`               |
| `AND #$001F / INC x3`                           | `length = (b1&$1F)+3`                    |
| `AND #$07FF` on `$84` and `$86`                 | modulo-2048 wrap                         |

## Examples (real blobs)

`Tiles_Overlay_Rain` (`$928000`), start of stream:

```
00 20 00 00   header: n = $2000 (8192 bytes)
00            flags = 00000000: eight back-references
BC FF         src=$7BC len=34   (untouched ring: 34 zero bytes)
FF FF         src=$7FF len=34
21 1F         src=$021 len=34
43 1F         src=$043 len=34
...
```

`Tiles_Farm_Fall_2`:

```
00 20 00 00   n = $2000
FF            flags = 11111111: eight literals
FD 03 FF 01 D7 29 AA 55
4F ...        next flag byte
```

Mixed groups look like `BC` = `10111100`: refs for bits 0,1 (LSB first), then four
literals, a ref, a literal.

## Encoder

The ROM blobs were produced by the original Okumura `LZSS.C` (binary search tree
match finder, `N=2048`, `F=34`, `THRESHOLD=2`, ring buffer pre-filled with $00,
`r = N-F`). Because the tree determines which of several equal-length matches
is chosen, an encoder must reproduce that structure to be bit-identical.
`compress()` in `tilemap_codec.py` is a port of it and reproduces **all 135
labeled blobs, plus the 2 unlabeled ones, byte for byte**
(`compress(decompress(blob)) == blob`, header word 2 = 0). Encoding the blobs
from extracted data is therefore lossless with respect to the ROM checksum, and
`compress()` can be used in the build to produce them from `.bin` assets. (The
decoder also accepts streams from other encoders.)

## Known quirks

* Size 0 in the header means 65536 bytes, because the 16-bit counter is
  decremented before being tested (`$838250`). Not used in the game.
* Header word 2 is never read; it is always 0 in the game.
* No bounds checks: a corrupt/truncated stream reads past the blob; the
  Python decoder raises `DecompressError` instead.
* Back-references into the zero-initialised ring are used heavily to produce runs
  of zero bytes at the start of a blob.
* The bytes of a blob after the last token are not part of the stream. In the
  ROM they are bank-end padding (`$00`).
* **Formerly hidden blobs** are now labeled and stored as separate assets:
  `Screen_DialogBox` ($A5CB05, 4096 bytes, the dialog box graphics)
  and `Tiles_Unused_TitleLogoJapanese` ($9FD4DA, 8192 bytes; no label-based code
  reference found, presumably reached through a computed or raw pointer). The last
  2 bytes of `Tiles_Town_Winter_0` (`00 00`, a final back-reference) used to
  sit under `Padding_990000`; they now belong to the blob and the padding label
  starts 2 bytes later.
* The 4056 bytes that used to follow `Screen_Unk53to56` inside its label span (starting `44 56 44 56` at +1792)
  are a raw 64x32 BG name table, now the separate blob `ScreenRaw_Unk_A6A096` ($A6A096, 4096 bytes including 40 zero
  bytes that were hidden under `Padding_A60000`).

## Statistics

Counted by `tests/test_tilemap_codec.py` (source: the generated `assets/gfx/{tiles,characters}/*.bin` in the order of `assets/gfx/banks.json`):

| Item                                   | Value            |
|----------------------------------------|------------------|
| Labeled `sCompressed*` blobs           | 137 (77 Tiles, 60 Tilemap) |
| Additional unlabeled blobs             | 0                |
| Total blobs                            | 137              |
| Compressed bytes (streams only)        | 485,289          |
| Decompressed bytes                     | 921,600          |
| Overall ratio                          | 52.7%            |
| Byte-exact re-encodes                  | 135 / 135 (and 2/2 unlabeled) |

Output sizes (labeled blobs): 8192 B x 91 (76 Tiles + 15 Tilemap), 2048 B
x 24, 4096 B x 17 (1 Tiles, 16 Tilemap), 6144 B x 2, 32768 B x 1
(Tilemap).

## Using the tool

```
python3 tests/test_tilemap_codec.py
```

API: `decompress(data, offset=0) -> (output, consumed)`, `compress(data) -> bytes`,
`parse_asm_blobs(path, tail=0) -> {label: bytes}`.

## What the blobs contain

Inspection of the decompressed data (`tools/gfx/gfxpipe.py export --png`) showed that the
original labels used the opposite of the usual SNES terminology (tile graphics were called
"tilemaps", name tables "charactermaps"). The labels were corrected in
`docs/naming/K1_gfx_tiles.csv` and `docs/naming/K2_gfx_tilemaps.csv`:

| Prefix                 | Directory               | Count | Contents |
|------------------------|-------------------------|-------|----------|
| `sCompressedTiles_*`   | `assets/gfx/tiles`      | 77    | **tile graphics** (76 blobs of 8192 bytes, 1 of 4096). Rendering as 4bpp gives coherent images (checked e.g. on `9282CB`); as 2bpp it is noise. |
| `sCompressedTilemap_*` | `assets/gfx/characters` | 60    | **BG name tables**: 16-bit entries (tile bits 0-9, palette 10-12, priority 13, flips 14/15). Sizes 2048, 4096, 6144, 8192, 32768. |

The directory `assets/gfx/characters` (banks $A1-$A6) also holds non-compressed character graphics, so it keeps its name.
`gfxpipe.py export` writes name tables as readable `.map.txt` files (32, 64 or 128 entries per row, see `docs/formats/graphics-png.md`, "Name table width") and PNG
sheets only for tile blobs. The bitplane depth of individual tile blobs was verified visually on
samples only; the 4096-byte `Tiles_Overlay_Rain` (rain overlay, 83% zero 16-byte blocks) is
likely 2bpp.
