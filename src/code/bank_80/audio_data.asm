; Bank $80 module "audio_data" - starts at $80B8CD
 
; Tool sound table and per-area map music (generated from assets/tables/tool_sounds.json and assets/areas/, docs/formats/area-data.md)
    incsrc "../../../build/gen/tables/tool_sounds.asm"
    incsrc "../../../build/gen/maps/area_music.asm"
