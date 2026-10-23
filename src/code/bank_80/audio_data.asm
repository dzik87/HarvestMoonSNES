; Bank $80 module "audio_data" - starts at $80B8CD
 
nToolSoundData_80B8CD:
    dw $0400,$0502,$0303,$0403,$0103,$0302                     ;80B8CD|        |      ; 0x0D * [n16]
    dw $0303,$0401,$0303,$0104,$0301,$0101                     ;80B8D9|        |      ;
    dw $0201                                                   ;80B8E5|        |      ;
pAudioEngine_MapMusic:
    dw aAudioEngine_MapMusicId_0x00                            ;80B8E7|        |80B9A7; 0x60 * [ptr16]
    dw aAudioEngine_MapMusicId_0x00                            ;80B8E9|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B8EB|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B8ED|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x01                            ;80B8EF|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B8F1|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B8F3|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B8F5|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x03                            ;80B8F7|        |80B9B3;
    dw aAudioEngine_MapMusicId_0x03                            ;80B8F9|        |80B9B3;
    dw aAudioEngine_MapMusicId_0x04                            ;80B8FB|        |80B9B7;
    dw aAudioEngine_MapMusicId_0x05                            ;80B8FD|        |80B9BB;
    dw aAudioEngine_MapMusicId_0x00                            ;80B8FF|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B901|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B903|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B905|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x02                            ;80B907|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B909|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B90B|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B90D|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B90F|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x00                            ;80B911|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B913|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B915|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x01                            ;80B917|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B919|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B91B|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x06                            ;80B91D|        |80B9BF;
    dw aAudioEngine_MapMusicId_0x01                            ;80B91F|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B921|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x0B                            ;80B923|        |80B9D3;
    dw aAudioEngine_MapMusicId_0x01                            ;80B925|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B927|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B929|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B92B|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B92D|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B92F|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x01                            ;80B931|        |80B9AB;
    dw aAudioEngine_MapMusicId_0x00                            ;80B933|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B935|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B937|        |80B9A7;
    dw PTR16_80FFFF                                            ;80B939|        |80FFFF;
    dw aAudioEngine_MapMusicId_0x07                            ;80B93B|        |80B9C3;
    dw aAudioEngine_MapMusicId_0x02                            ;80B93D|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x08                            ;80B93F|        |80B9C7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B941|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B943|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B945|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x00                            ;80B947|        |80B9A7;
    dw aAudioEngine_MapMusicId_0x02                            ;80B949|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B94B|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B94D|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B94F|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B951|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B953|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B955|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B957|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B959|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B95B|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x02                            ;80B95D|        |80B9AF;
    dw aAudioEngine_MapMusicId_0x0A                            ;80B95F|        |80B9CF;
    dw PTR16_80FFFF                                            ;80B961|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B963|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B965|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B967|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B969|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B96B|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B96D|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B96F|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B971|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B973|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B975|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B977|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B979|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B97B|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B97D|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B97F|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B981|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B983|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B985|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B987|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B989|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B98B|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B98D|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B98F|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B991|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B993|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B995|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B997|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B999|        |80FFFF;
    dw PTR16_80FFFF                                            ;80B99B|        |80FFFF;
    dw aAudioEngine_MapMusicId_0x0A                            ;80B99D|        |80B9CF;
    dw aAudioEngine_MapMusicId_0x09                            ;80B99F|        |80B9CB;
    dw PTR16_80FFFF                                            ;80B9A1|        |80FFFF;
    dw aAudioEngine_MapMusicId_0x08                            ;80B9A3|        |80B9C7;
    dw aAudioEngine_MapMusicId_0x08                            ;80B9A5|        |80B9C7;
 
aAudioEngine_MapMusicId_0x00:
    db $01,$02,$07,$04                                         ;80B9A7|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x01:
    db $05,$05,$05,$05                                         ;80B9AB|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x02:
    db $06,$06,$06,$06                                         ;80B9AF|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x03:
    db $03,$03,$03,$03                                         ;80B9B3|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x04:
    db $0E,$0E,$0E,$0E                                         ;80B9B7|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x05:
    db $0D,$0D,$0D,$0D                                         ;80B9BB|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x06:
    db $09,$09,$09,$09                                         ;80B9BF|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x07:
    db $0F,$0F,$0F,$0F                                         ;80B9C3|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x08:
    db $0A,$0A,$0A,$0A                                         ;80B9C7|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x09:
    db $0B,$0B,$0B,$0B                                         ;80B9CB|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x0A:
    db $12,$12,$12,$12                                         ;80B9CF|        |      ; 0x04 * [n8][nSeasonId]
 
aAudioEngine_MapMusicId_0x0B:
    db $08,$08,$08,$08                                         ;80B9D3|        |      ; 0x04 * [n8][nSeasonId]
