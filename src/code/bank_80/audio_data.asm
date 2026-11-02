;;
; @file     audio_data.asm
; @brief    Generated audio tables of bank $80: the tool sound sample table and the per-area map music pointers and sets.
; @details  nSoundEffectSampleTable: 26 bytes, sample index per strcAudio.unk118 value (read by fAudio_PlaySoundEffectAndWait).
;           pAudioEngine_MapMusic: 96 x ptr16 (one per area, $FFFF = none) to a 4 byte music set, one track id per season (read by fAudioEngine_SelectMapMusic).
; @bank     $80
; @range    $80B8CD-$80B9D6
; @see      docs/formats/area-data.md, assets/tables/tool_sounds.json, assets/areas/area_music.json
;;
; Bank $80 module "audio_data" - starts at $80B8CD
 
; brief    Generated audio tables included here: nSoundEffectSampleTable (tool sound sample index per sound effect), pAudioEngine_MapMusic and the 12 music sets aAudioEngine_MapMusicId_0x00..0x0B.
; format   nSoundEffectSampleTable: 26 bytes, sample index per strcAudio.unk118 value. pAudioEngine_MapMusic: 96 x ptr16 (one per area, $FFFF = none) to a music set; a set is 4 bytes, one track id per season.
; index    pAudioEngine_MapMusic[area*2] then [season]; nSoundEffectSampleTable[sound id].
; used_by  fAudioEngine_SelectMapMusic, fAudio_PlaySoundEffectAndWait
; note     Sources: assets/tables/tool_sounds.json, assets/areas/area_music.json (docs/formats/area-data.md).
; Tool sound table and per-area map music (generated from assets/tables/tool_sounds.json and assets/areas/, docs/formats/area-data.md)
    incsrc "../../../build/gen/tables/tool_sounds.asm"
    incsrc "../../../build/gen/maps/area_music.asm"
