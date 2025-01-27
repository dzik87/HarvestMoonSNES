!CONSTANT                   =   $20
!SPEED_FASTROM              =   $10
!SPEED_SLOWROM              =   $00
!MODE_LoROM                 =   $00
!MODE_HiROM                 =   $01
!MODE_ExHiROM               =   $05

; source: https://wiki.superfamicom.org/registers#inidisp-screen-display-186

;INIDISP - Screen Display
;$2100  wb++++
;         x---bbbb
;         x        = Force blank on when set.
;             bbbb = Screen brightness, F=max, 0="off".

SNES_INIDISP                = $2100

!INIDISP_FORCEBLANK         =   $80
!INIDISP_BRIGHTNESS0        =   $00
!INIDISP_BRIGHTNESS1        =   $01
!INIDISP_BRIGHTNESS2        =   $02
!INIDISP_BRIGHTNESS3        =   $03
!INIDISP_BRIGHTNESS4        =   $04
!INIDISP_BRIGHTNESS5        =   $05
!INIDISP_BRIGHTNESS6        =   $06
!INIDISP_BRIGHTNESS7        =   $07
!INIDISP_BRIGHTNESS8        =   $08
!INIDISP_BRIGHTNESS9        =   $09
!INIDISP_BRIGHTNESS10       =   $0A
!INIDISP_BRIGHTNESS11       =   $0B
!INIDISP_BRIGHTNESS12       =   $0C
!INIDISP_BRIGHTNESS13       =   $0D
!INIDISP_BRIGHTNESS14       =   $0E
!INIDISP_BRIGHTNESS15       =   $0F


;OBSEL - Object Size and Character Address
;$2101  wb++?- 
;         sssnnbbb
;         sss       = Object size:
;               000 =  8x8  and 16x16 sprites
;               001 =  8x8  and 32x32 sprites
;               010 =  8x8  and 64x64 sprites
;               011 = 16x16 and 32x32 sprites
;               100 = 16x16 and 64x64 sprites
;               101 = 32x32 and 64x64 sprites
;               110 = 16x32 and 32x64 sprites ('undocumented')
;               111 = 16x32 and 32x32 sprites ('undocumented')
;            nn     = Name Select
;              bbb  = Name Base Select (Addr>>14)

SNES_OBSEL                  = $2101



SNES_OAMADDL                = $2102
SNES_OAMADDH                = $2103
SNES_OAMDATA                = $2104
SNES_BGMODE                 = $2105
SNES_MOSAIC                 = $2106
SNES_BG1SC                  = $2107
SNES_BG2SC                  = $2108
SNES_BG3SC                  = $2109
SNES_BG4SC                  = $210A
SNES_BG12NBA                = $210B
SNES_BG34NBA                = $210C
SNES_BG1HOFS                = $210D
SNES_BG1VOFS                = $210E
SNES_BG2HOFS                = $210F
SNES_BG2VOFS                = $2110
SNES_BG3HOFS                = $2111
SNES_BG3VOFS                = $2112
SNES_BG4HOFS                = $2113
SNES_BG4VOFS                = $2114
SNES_VMAIN                  = $2115
SNES_VMADDL                 = $2116
SNES_VMADDH                 = $2117
SNES_VMDATAL                = $2118
SNES_VMDATAH                = $2119
SNES_M7SEL                  = $211A
SNES_M7A                    = $211B
SNES_M7B                    = $211C
SNES_M7C                    = $211D
SNES_M7D                    = $211E
SNES_M7X                    = $211F
SNES_M7Y                    = $2120
SNES_CGADD                  = $2121
SNES_CGDATA                 = $2122
SNES_W12SEL                 = $2123
SNES_W34SEL                 = $2124
SNES_WOBJSEL                = $2125
SNES_WH0                    = $2126
SNES_WH1                    = $2127
SNES_WH2                    = $2128
SNES_WH3                    = $2129
SNES_WBGLOG                 = $212A
SNES_WOBJLOG                = $212B
SNES_TM                     = $212C
SNES_TS                     = $212D
SNES_TMW                    = $212E
SNES_TSW                    = $212F
SNES_CGWSEL                 = $2130
SNES_CGADSUB                = $2131
SNES_COLDATA                = $2132
SNES_SETINI                 = $2133
SNES_MPYL                   = $2134
SNES_MPYM                   = $2135
SNES_MPYH                   = $2136
SNES_SLHV                   = $2137
SNES_OAMDATAREAD            = $2138
SNES_VMDATALREAD            = $2139
SNES_VMDATAHREAD            = $213A
SNES_CGDATAREAD             = $213B
SNES_OPHCT                  = $213C
SNES_OPVCT                  = $213D
SNES_STAT77                 = $213E
SNES_STAT78                 = $213F
SNES_APUIO0                 = $2140
SNES_APUIO1                 = $2141
SNES_APUIO2                 = $2142
SNES_APUIO3                 = $2143
SNES_WMDATA                 = $2180
SNES_WMADDL                 = $2181
SNES_WMADDM                 = $2182
SNES_WMADDH                 = $2183
SNES_JOYSER0                = $4016
SNES_JOYSER1                = $4017
SNES_NMITIMEN               = $4200
SNES_WRIO                   = $4201
SNES_WRMPYA                 = $4202
SNES_WRMPYB                 = $4203
SNES_WRDIVL                 = $4204
SNES_WRDIVH                 = $4205
SNES_WRDIVB                 = $4206
SNES_HTIMEL                 = $4207
SNES_HTIMEH                 = $4208
SNES_VTIMEL                 = $4209
SNES_VTIMEH                 = $420A
SNES_MDMAEN                 = $420B
SNES_HDMAEN                 = $420C
SNES_MEMSEL                 = $420D
SNES_RDNMI                  = $4210
SNES_TIMEUP                 = $4211
SNES_HVBJOY                 = $4212
SNES_RDIO                   = $4213
SNES_RDDIVL                 = $4214
SNES_RDDIVH                 = $4215
SNES_RDMPYL                 = $4216
SNES_RDMPYH                 = $4217
SNES_JOY1L                  = $4218
SNES_JOY1H                  = $4219
SNES_JOY2L                  = $421A
SNES_JOY2H                  = $421B
SNES_JOY3L                  = $421C
SNES_JOY3H                  = $421D
SNES_JOY4L                  = $421E
SNES_JOY4H                  = $421F
SNES_DMAP0                  = $4300
SNES_BBAD0                  = $4301
SNES_A1T0L                  = $4302
SNES_A1T0H                  = $4303
SNES_A1B0                   = $4304
SNES_DAS0L                  = $4305
SNES_DAS0H                  = $4306
SNES_DASB0                  = $4307
SNES_A2A0L                  = $4308
SNES_A2A0H                  = $4309
SNES_NTLR0                  = $430A
SNES_DMAP1                  = $4310
SNES_BBAD1                  = $4311
SNES_A1T1L                  = $4312
SNES_A1T1H                  = $4313
SNES_A1B1                   = $4314
SNES_DAS1L                  = $4315
SNES_DAS1H                  = $4316
SNES_DASB1                  = $4317
SNES_A2A1L                  = $4318
SNES_A2A1H                  = $4319
SNES_NTLR1                  = $431A
SNES_DMAP2                  = $4320
SNES_BBAD2                  = $4321
SNES_A1T2L                  = $4322
SNES_A1T2H                  = $4323
SNES_A1B2                   = $4324
SNES_DAS2L                  = $4325
SNES_DAS2H                  = $4326
SNES_DASB2                  = $4327
SNES_A2A2L                  = $4328
SNES_A2A2H                  = $4329
SNES_NTLR2                  = $432A
SNES_DMAP3                  = $4330
SNES_BBAD3                  = $4331
SNES_A1T3L                  = $4332
SNES_A1T3H                  = $4333
SNES_A1B3                   = $4334
SNES_DAS3L                  = $4335
SNES_DAS3H                  = $4336
SNES_DASB3                  = $4337
SNES_A2A3L                  = $4338
SNES_A2A3H                  = $4339
SNES_NTLR3                  = $433A
SNES_DMAP4                  = $4340
SNES_BBAD4                  = $4341
SNES_A1T4L                  = $4342
SNES_A1T4H                  = $4343
SNES_A1B4                   = $4344
SNES_DAS4L                  = $4345
SNES_DAS4H                  = $4346
SNES_DASB4                  = $4347
SNES_A2A4L                  = $4348
SNES_A2A4H                  = $4349
SNES_NTLR4                  = $434A
SNES_DMAP5                  = $4350
SNES_BBAD5                  = $4351
SNES_A1T5L                  = $4352
SNES_A1T5H                  = $4353
SNES_A1B5                   = $4354
SNES_DAS5L                  = $4355
SNES_DAS5H                  = $4356
SNES_DASB5                  = $4357
SNES_A2A5L                  = $4358
SNES_A2A5H                  = $4359
SNES_NTLR5                  = $435A
SNES_DMAP6                  = $4360
SNES_BBAD6                  = $4361
SNES_A1T6L                  = $4362
SNES_A1T6H                  = $4363
SNES_A1B6                   = $4364
SNES_DAS6L                  = $4365
SNES_DAS6H                  = $4366
SNES_DASB6                  = $4367
SNES_A2A6L                  = $4368
SNES_A2A6H                  = $4369
SNES_NTLR6                  = $436A
SNES_DMAP7                  = $4370
SNES_BBAD7                  = $4371
SNES_A1T7L                  = $4372
SNES_A1T7H                  = $4373
SNES_A1B7                   = $4374
SNES_DAS7L                  = $4375
SNES_DAS7H                  = $4376
SNES_DASB7                  = $4377
SNES_A2A7L                  = $4378
SNES_A2A7H                  = $4379
SNES_NTLR7                  = $437A