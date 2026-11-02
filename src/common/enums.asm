;;
; @file   enums.asm
; @brief  Symbolic constants: item, weather, season, weekday, area ids, player flags/actions/directions, sound effects, name entry targets.
; @see    src/common/structures.asm, docs/audio.md (sound effects), docs/formats/area-data.md
;;
;;
; @brief  Tool / seed / feed ids of the equipped (selected) item, stored in strcPlayerData.toolEquipped ($0921).
; @format 8-bit id; $01-$04 normal tools, $05-$08 seed bags (corn, tomato, potato, turnip), $09-$10 consumables and tools,
;         $11-$14 golden tools, $15-$1B special items; $57-$5A are fence / perfume pseudo-items.
; @note   used by the tool routines of bank $82 (tools.asm); strcShedItems rows 1-4 hold one bit per id-1
;;
; Equipped items            $000921
!EITEM_NONE                 =   $00             ; equipped item id $00: none
!EITEM_SICKLE               =   $01             ; equipped item id $01: sickle
!EITEM_HOE                  =   $02             ; equipped item id $02: hoe
!EITEM_HAMMER               =   $03             ; equipped item id $03: hammer
!EITEM_AXE                  =   $04             ; equipped item id $04: axe
!EITEM_CORNSEED             =   $05             ; equipped item id $05: cornseed
!EITEM_TOMATOSEED           =   $06             ; equipped item id $06: tomatoseed
!EITEM_POTATOSEED           =   $07             ; equipped item id $07: potatoseed
!EITEM_TURNIPSEED           =   $08             ; equipped item id $08: turnipseed
!EITEM_MEDICIDE             =   $09             ; equipped item id $09: medicide
!EITEM_MIRACLEPOTION        =   $0A             ; equipped item id $0A: miraclepotion
!EITEM_BELL                 =   $0B             ; equipped item id $0B: bell
!EITEM_GRASSSEED            =   $0C             ; equipped item id $0C: grassseed
!EITEM_PAINT                =   $0D             ; equipped item id $0D: paint
!EITEM_MILKER               =   $0E             ; equipped item id $0E: milker
!EITEM_BRUSH                =   $0F             ; equipped item id $0F: brush
!EITEM_WATERINGCAN          =   $10             ; equipped item id $10: wateringcan
!EITEM_GOLDSICKLE           =   $11             ; equipped item id $11: goldsickle
!EITEM_GOLDHOE              =   $12             ; equipped item id $12: goldhoe
!EITEM_GOLDHAMMER           =   $13             ; equipped item id $13: goldhammer
!EITEM_GOLDAXE              =   $14             ; equipped item id $14: goldaxe
!EITEM_SPRINKLER            =   $15             ; equipped item id $15: sprinkler
!EITEM_BEANSTALKSEED        =   $16             ; equipped item id $16: beanstalkseed
!EITEM_BLUEDIAMOND          =   $17             ; equipped item id $17: bluediamond
!EITEM_BLUEFEATHER          =   $18             ; equipped item id $18: bluefeather
!EITEM_CHICKENFEED          =   $19             ; equipped item id $19: chickenfeed
!EITEM_COWFEED              =   $1A             ; equipped item id $1A: cowfeed
!EITEM_FISHINGPOLE          =   $1B             ; equipped item id $1B: fishingpole

!EITEM_WOODFENCE            =   $57             ; equipped item id $57: woodfence
!EITEM_PERFUMEGREEN         =   $58             ; equipped item id $58: perfumegreen
!EITEM_PERFUMERED           =   $59             ; equipped item id $59: perfumered
!EITEM_PERFUMEBLUE          =   $5A             ; equipped item id $5A: perfumeblue

;;
; @brief  Carried-object ids (strcPlayerData.carryItemId at $091D); the full list is the row index of aInteractionItemTable
;         (assets/tables/data/carried_items.csv). Only the ids named in code are listed here.
;;
; Carry items               $00091D
!CITEM_NONE                 =   $00             ; carried object id $00: none
!CITEM_FISH                 =   $07             ; carried object id $07: fish
!CITEM_EGG                  =   $14             ; carried object id $14: egg


;;
; @brief  Weather / festival of the day, stored in nWeatherForecast and rolled by fWeatherRandomizer.
; @format 8-bit value; $06-$0B are festival days, !WEATHER_COUNT is the number of values.
;;
; Weather forecast          $00098C
!WEATHER_SUN                =   $00             ; weather / festival $00: sun
!WEATHER_RAIN               =   $01             ; weather / festival $01: rain
!WEATHER_SNOW               =   $02             ; weather / festival $02: snow
!WEATHER_HURRICANE          =   $03             ; weather / festival $03: hurricane
!WEATHER_FAIR               =   $04             ; weather / festival $04: fair
!WEATHER_CALM               =   $05             ; weather / festival $05: calm
!WEATHER_FLOWERFESTIVAL     =   $06             ; weather / festival $06: flowerfestival
!WEATHER_HARVESTFESTIVAL    =   $07             ; weather / festival $07: harvestfestival
!WEATHER_THANKSGIVING       =   $08             ; weather / festival $08: thanksgiving
!WEATHER_STARNIGHTFESTIVAL  =   $09             ; weather / festival $09: starnightfestival
!WEATHER_NEWYEARFESTIVAL    =   $0A             ; weather / festival $0A: newyearfestival
!WEATHER_EGGFESTIVAL        =   $0B             ; weather / festival $0B: eggfestival
!WEATHER_COUNT              =   $0C             ; weather / festival $0C: count


;; @brief Weekday ids of nCurrentWeekdayID (0 = Sunday).
; Days of week              $7F1F1A
!DAY_SUNDAY                 =   $00             ; weekday $00: sunday
!DAY_MONDAY                 =   $01             ; weekday $01: monday
!DAY_TUESDAY                =   $02             ; weekday $02: tuesday
!DAY_WEDNESDAY              =   $03             ; weekday $03: wednesday
!DAY_THURSDAY               =   $04             ; weekday $04: thursday
!DAY_FRIDAY                 =   $05             ; weekday $05: friday
!DAY_SATURDAY               =   $06             ; weekday $06: saturday


;; @brief Season ids of nCurrentSeasonID.
; Seasons                   $7F1F19
!SEASON_SPRING              =   $00             ; season $00: spring
!SEASON_SUMMER              =   $01             ; season $01: summer
!SEASON_FALL                =   $02             ; season $02: fall
!SEASON_WINTER              =   $03             ; season $03: winter


;;
; @brief  Area (map) ids: nDestinationAreaId, strcMap.loadAreaId. Four consecutive ids are the seasonal variants of one place.
; @format 8-bit id $00-$5F, indexes the area descriptor table (defs/areas, docs/formats/area-data.md).
;         Ids $51-$5E were renamed from AREA_UNKNOWNxx (see docs/naming/O_unk_renames.csv).
;;
; Areas/Maps                $00098B
!AREA_FARMSPRING            =   $00             ; area id $00: farmspring
!AREA_FARMSUMMER            =   $01             ; area id $01: farmsummer
!AREA_FARMFALL              =   $02             ; area id $02: farmfall
!AREA_FARMWINTER            =   $03             ; area id $03: farmwinter
!AREA_TOWNSPRING            =   $04             ; area id $04: townspring
!AREA_TOWNSUMMER            =   $05             ; area id $05: townsummer
!AREA_TOWNFALL              =   $06             ; area id $06: townfall
!AREA_TOWNWINTER            =   $07             ; area id $07: townwinter
!AREA_DANCINGS1             =   $08             ; area id $08: dancings1
!AREA_DANCINGS2             =   $09             ; area id $09: dancings2
!AREA_NY_PUBLICSQUARE       =   $0A             ; area id $0A: ny publicsquare
!AREA_EGGFESTIVAL           =   $0B             ; area id $0B: eggfestival
!AREA_CROSSROADSPRING       =   $0C             ; area id $0C: crossroadspring
!AREA_CROSSROADSUMMER       =   $0D             ; area id $0D: crossroadsummer
!AREA_CROSSROADFALL         =   $0E             ; area id $0E: crossroadfall
!AREA_CROSSROADWINTER       =   $0F             ; area id $0F: crossroadwinter
!AREA_WOODSSPRING           =   $10             ; area id $10: woodsspring
!AREA_WOODSSUMMER           =   $11             ; area id $11: woodssummer
!AREA_WOODSFALL             =   $12             ; area id $12: woodsfall
!AREA_WOODSWINTER           =   $13             ; area id $13: woodswinter
!AREA_NY_SPA                =   $14             ; area id $14: ny spa
!AREA_HOUSE1                =   $15 ; farm house level 0 (no upgrade)
!AREA_HOUSE2                =   $16 ; farm house level 1 (first upgrade)
!AREA_HOUSE3                =   $17 ; farm house level 2 (second upgrade)
!AREA_MAJORHOUSE            =   $18             ; area id $18: majorhouse
!AREA_MAJORCORRIDOR         =   $19             ; area id $19: majorcorridor
!AREA_MAJORBEDROOM          =   $1A             ; area id $1A: majorbedroom
!AREA_CHURCH                =   $1B             ; area id $1B: church
!AREA_FLORIST               =   $1C             ; area id $1C: florist
!AREA_FLORISTBEDROOM        =   $1D             ; area id $1D: floristbedroom
!AREA_BAR                   =   $1E             ; area id $1E: bar
!AREA_BARBEDROOM            =   $1F             ; area id $1F: barbedroom
!AREA_RESTAURANT            =   $20             ; area id $20: restaurant
!AREA_RESTAURANTBEDROOM     =   $21             ; area id $21: restaurantbedroom
!AREA_TOOLSSHOP             =   $22             ; area id $22: toolsshop
!AREA_TOOLSSHOPBEDROOM      =   $23             ; area id $23: toolsshopbedroom
!AREA_ANIMALSHOP            =   $24             ; area id $24: animalshop
!AREA_FORTUNETELLER         =   $25             ; area id $25: fortuneteller
!AREA_SHED                  =   $26             ; area id $26: shed
!AREA_COWBARN               =   $27             ; area id $27: cowbarn
!AREA_COOP                  =   $28             ; area id $28: coop
!AREA_WOODSCAVE             =   $29             ; area id $29: woodscave
!AREA_IMPUNDERGROUND        =   $2A             ; area id $2A: impunderground
!AREA_WORKSMANHOUSE         =   $2B             ; area id $2B: worksmanhouse
!AREA_GOLDCHICKEN           =   $2C             ; area id $2C: goldchicken
!AREA_WEDDINGSPRING         =   $2D             ; area id $2D: weddingspring
!AREA_WEDDINGSUMMER         =   $2E             ; area id $2E: weddingsummer
!AREA_WEDDINGFALL           =   $2F             ; area id $2F: weddingfall
!AREA_WEDDINGWINTER         =   $30             ; area id $30: weddingwinter
!AREA_MOUNTAINTOPSPRING     =   $31             ; area id $31: mountaintopspring
!AREA_MOUNTAINTOPSUMMER     =   $32             ; area id $32: mountaintopsummer
!AREA_MOUNTAINTOPFALL       =   $33             ; area id $33: mountaintopfall
!AREA_MOUNTAINTOPWINTER     =   $34             ; area id $34: mountaintopwinter
!AREA_MOUNTAINTOP2SPRING    =   $35             ; area id $35: mountaintop2spring
!AREA_MNTTOPENDINGSUMMER    =   $36 ; name kept from the first analysis; it is the summer variant of MOUNTAINTOP2
!AREA_MOUNTAINTOP2FALL      =   $37             ; area id $37: mountaintop2fall
!AREA_MOUNTAINTOP2WINTER    =   $38             ; area id $38: mountaintop2winter
!AREA_NY_MOUNTAINTOP        =   $39             ; area id $39: ny mountaintop
!AREA_MOUNTAINTOPSUNRISE    =   $3A             ; area id $3A: mountaintopsunrise
!AREA_MOUNTAINTOPBEAN       =   $3B             ; area id $3B: mountaintopbean
!AREA_INTRO                 =   $3C ; ??? since start to main menu also how to play ?
!AREA_ENDING00              =   $3D             ; area id $3D: ending00
!AREA_ENDING01              =   $3E             ; area id $3E: ending01
!AREA_ENDING02              =   $3F             ; area id $3F: ending02
!AREA_ENDING03              =   $40             ; area id $40: ending03
!AREA_ENDING04              =   $41             ; area id $41: ending04
!AREA_ENDING05              =   $42             ; area id $42: ending05
!AREA_ENDING06              =   $43             ; area id $43: ending06
!AREA_ENDING07              =   $44             ; area id $44: ending07
!AREA_ENDING08              =   $45             ; area id $45: ending08
!AREA_ENDING09              =   $46             ; area id $46: ending09
!AREA_ENDING10              =   $47             ; area id $47: ending10
!AREA_ENDING11              =   $48             ; area id $48: ending11
!AREA_ENDING12              =   $49             ; area id $49: ending12
!AREA_ENDING13              =   $4A             ; area id $4A: ending13
!AREA_CREDITS0              =   $4B             ; area id $4B: credits0
!AREA_CREDITS1              =   $4C             ; area id $4C: credits1
!AREA_CREDITS2              =   $4D             ; area id $4D: credits2
!AREA_CREDITS3              =   $4E             ; area id $4E: credits3
!AREA_CREDITS4              =   $4F             ; area id $4F: credits4
!AREA_DRIVETOTOWN           =   $50             ; area id $50: drivetotown
!AREA_CREDITS4_BL             =   $51           ; area id $51: credits4 bl
!AREA_CREDITS4_BR             =   $52           ; area id $52: credits4 br
!AREA_STAFFROLLJP_TL             =   $53        ; area id $53: staffrolljp tl
!AREA_STAFFROLLJP_TR             =   $54        ; area id $54: staffrolljp tr
!AREA_STAFFROLLJP_BL             =   $55        ; area id $55: staffrolljp bl
!AREA_STAFFROLLJP_BR             =   $56        ; area id $56: staffrolljp br
!AREA_RAINOVERLAY             =   $57           ; area id $57: rainoverlay
!AREA_CLOUDSOVERLAY             =   $58         ; area id $58: cloudsoverlay
!AREA_SNOWOVERLAY             =   $59           ; area id $59: snowoverlay
!AREA_HEAVYSNOWOVERLAY             =   $5A      ; area id $5A: heavysnowoverlay
!AREA_INTROFARMSCROLL             =   $5B       ; area id $5B: introfarmscroll
!AREA_HARVESTMOONLOGO             =   $5C       ; area id $5C: harvestmoonlogo
!AREA_NATSUMELOGO           =   $5D             ; area id $5D: natsumelogo
!AREA_MENUSCREENBACKGROUNDS             =   $5E ; area id $5E: menuscreenbackgrounds
!AREA_NAMEINPUT             =   $5F             ; area id $5F: nameinput


;;
; @brief  Bits of strcPlayer.flags ($D2, 16 bit). Tested through %CheckPlayerFlags and changed through %SetPlayerFlag / %UnsetPlayerFlag.
;;
; Player flags              $0000D2
!PFLAGS_ACTIVE              = $0001 ; player is controllable / on screen
!PFLAGS_HOLDINGITEM         = $0002 ; carrying an item
!PFLAGS_EATINGMEAL          = $0004 ; noon meal animation running (set by fEvents_NoonMealCheck)
!PFLAGS_OUTOFSTAMINA        = $0008 ; energy at zero (tired animation)
!PFLAGS_RIDINGHORSE         = $0010 ; riding the horse
!PFLAGS_INSPRINGS           = $0020 ; bathing in the hot springs
!PFLAGS_INTERACTING         = $0040 ;   interacting with stuff - like diary, tv and some others
!PFLAGS_INTRANSITION        = $0080 ;   set on area transition
!PFLAGS_SITTING             = $0100 ;   sitting next to TV watching weather forecast
!PFLAGS_FALLING             = $0200 ;   like in woods when you go down jumping from edge
!PFLAGS_UNK0400             = $0400 ;   set by fEvents_NoonMealCheck together with EATINGMEAL and by fEvents_ShippingScene; tested with INSPRINGS|RIDINGHORSE before the noon meal (state "busy", exact meaning unknown)
!PFLAGS_DOGHUGGING          = $0800 ;   set when we hug dog
!PFLAGS_AISTEERING          = $1000 ; player is moved by an AI script
!PFLAGS_KNEEING             = $2000 ; kneeling pose (e.g. picking up / petting)
!PFLAGS_USERCONTROL         = $4000 ;   seems to be always set when player can take control
!PFLAGS_ANIMATING           = $8000 ;   any player animation



;;
; @brief  Sound effect ids (SPC SFX block, command $0A). Ids without a caller in any release are probably unused (docs/naming/open-questions.md).
;         names = assets/audio/audio.json sfx_names, table in docs/audio.md section 13
;;
!SFX_SILENCE                      = $00         ; sound effect $00: silence
!SFX_MENUCONFIRM                  = $01         ; sound effect $01: menuconfirm
!SFX_MENUCANCEL                   = $02         ; sound effect $02: menucancel
!SFX_MENUCURSOR                   = $03         ; sound effect $03: menucursor
!SFX_EGGFESTIVALTIMEUP            = $04         ; sound effect $04: eggfestivaltimeup
!SFX_PLAYERSTEP                   = $05         ; sound effect $05: playerstep
!SFX_PLAYERJUMP                   = $06         ; sound effect $06: playerjump
!SFX_ITEMDROP                     = $07         ; sound effect $07: itemdrop
!SFX_ITEMPICKUP                   = $08         ; sound effect $08: itempickup
!SFX_UNK09                        = $09         ; sound effect $09: no caller in any release (unused ?)
!SFX_UNK0A                        = $0A         ; sound effect $0A: no caller in any release (unused ?)
!SFX_UNK0B                        = $0B         ; sound effect $0B: no caller in any release (unused ?)
!SFX_UNK0C                        = $0C         ; sound effect $0C: no caller in any release (unused ?)
!SFX_UNK0D                        = $0D         ; sound effect $0D: no caller in any release (unused ?)
!SFX_UNK0E                        = $0E         ; sound effect $0E: no caller in any release (unused ?)
!SFX_PLOWHITOBJECT                = $0F         ; sound effect $0F: plowhitobject
!SFX_GOLDPLOWHITOBJECT            = $10         ; sound effect $10: goldplowhitobject
!SFX_TOOLHITGROUND                = $11         ; sound effect $11: toolhitground
!SFX_SICKLECUT                    = $12         ; sound effect $12: sicklecut
!SFX_GOLDSICKLECUT                = $13         ; sound effect $13: goldsicklecut
!SFX_SICKLESWING                  = $14         ; sound effect $14: sickleswing
!SFX_AXEHITOBJECT                 = $15         ; sound effect $15: axehitobject
!SFX_GOLDAXEHITOBJECT             = $16         ; sound effect $16: goldaxehitobject
!SFX_HAMMERHIT                    = $17         ; sound effect $17: hammerhit
!SFX_GOLDHAMMERHIT                = $18         ; sound effect $18: goldhammerhit
!SFX_BELL                         = $19         ; sound effect $19: bell
!SFX_UNK1A                        = $1A         ; sound effect $1A: no caller in any release (unused ?)
!SFX_SEEDSOW                      = $1B         ; sound effect $1B: seedsow
!SFX_UNK1C                        = $1C         ; sound effect $1C: no caller in any release (unused ?)
!SFX_UNK1D                        = $1D         ; sound effect $1D: no caller in any release (unused ?)
!SFX_UNK1E                        = $1E         ; sound effect $1E: no caller in any release (unused ?)
!SFX_UNK1F                        = $1F         ; sound effect $1F: no caller in any release (unused ?)
!SFX_HOUSEEVENTUNK20              = $20         ; sound effect $20: houseeventunk20
!SFX_UNK21                        = $21         ; sound effect $21: no caller in any release (unused ?)
!SFX_HOUSEEVENTUNK22              = $22         ; sound effect $22: houseeventunk22
!SFX_CUTSCENEUNK23                = $23         ; sound effect $23: cutsceneunk23
!SFX_INTERACTIONUNK24             = $24         ; sound effect $24: interactionunk24
!SFX_UNK25                        = $25         ; sound effect $25: no caller in any release (unused ?)
!SFX_UNK26                        = $26         ; sound effect $26: no caller in any release (unused ?)
!SFX_UNK27                        = $27         ; sound effect $27: no caller in any release (unused ?)
!SFX_WATERPOUR                    = $28         ; sound effect $28: waterpour
!SFX_UNK29                        = $29         ; sound effect $29: no caller in any release (unused ?)
!SFX_UNK2A                        = $2A         ; sound effect $2A: no caller in any release (unused ?)
!SFX_UNK2B                        = $2B         ; sound effect $2B: no caller in any release (unused ?)
!SFX_UNK2C                        = $2C         ; sound effect $2C: no caller in any release (unused ?)
!SFX_UNK2D                        = $2D         ; sound effect $2D: no caller in any release (unused ?)
!SFX_UNK2E                        = $2E         ; sound effect $2E: no caller in any release (unused ?)
!SFX_UNK2F                        = $2F         ; sound effect $2F: no caller in any release (unused ?)
!SFX_UNK30                        = $30         ; sound effect $30: no caller in any release (unused ?)
!SFX_UNK31                        = $31         ; sound effect $31: no caller in any release (unused ?)

;;
; @brief  Player action state machine values (strcPlayer.action at $D4, 16 bit); dispatched by fPlayerAction_* handlers.
; @note   Values without a name ($06 $07 $0E $0F $10 $17 $18 $1A $1D-$1F) are used by code but the visible action is not identified:
;         $06/$07 only in the unused routine fInput_Unused84C852; $0E set by fPlayerInteraction0x11; $0F/$10 are set by the input
;         handler and tested by fMap_ScreenTransitionHandler and fEvents_NoonMealCheck (idle states during which the noon meal must wait);
;         $17 is set when the horse is mounted/called (fAIAction0x35_UpdateHorse) and tested by the animal AI; $18/$1A set by the A button
;         interaction (fInput_PlayerButtonA_Interact); $1D-$1F are never referenced.
;;
; Player actions            $0000D4
!PACTION_NONE               = $0000             ; player action $00: none
!PACTION_WALK               = $0001             ; player action $01: walk
!PACTION_RUN                = $0002             ; player action $02: run
!PACTION_JUMP               = $0003             ; player action $03: jump
!PACTION_ITEMONHAND         = $0004             ; player action $04: itemonhand
!PACTION_DROPITEM           = $0005             ; player action $05: dropitem
!PACTION_06                 = $0006             ; player action $06: purpose not identified (see header note)
!PACTION_07                 = $0007             ; player action $07: purpose not identified (see header note)
!PACTION_CONSUMEITEM        = $0008             ; player action $08: consumeitem
!PACTION_EXCERCISE          = $0009             ; player action $09: excercise
!PACTION_USINGTOOL          = $000A             ; player action $0A: usingtool
!PACTION_TIRED              = $000B             ; player action $0B: tired
!PACTION_SHOWTOOL           = $000C             ; player action $0C: showtool
!PACTION_WHISTLEHORSE       = $000D             ; player action $0D: whistlehorse
!PACTION_0E                 = $000E             ; player action $0E: purpose not identified (see header note)
!PACTION_0F                 = $000F             ; player action $0F: purpose not identified (see header note)
!PACTION_10                 = $0010             ; player action $10: purpose not identified (see header note)
!PACTION_FISHING            = $0011             ; player action $11: fishing
!PACTION_FISHINGBITE        = $0012             ; player action $12: fishingbite
!PACTION_REELING            = $0013             ; player action $13: reeling
!PACTION_DRUNK              = $0014             ; player action $14: drunk
!PACTION_DRINKING           = $0015             ; player action $15: drinking
!PACTION_DROPPINGDOG        = $0016             ; player action $16: droppingdog
!PACTION_17                 = $0017             ; player action $17: purpose not identified (see header note)
!PACTION_18                 = $0018             ; player action $18: purpose not identified (see header note)
!PACTION_AUTOPILOT          = $0019 ;   probably used by AI to make predefined moves also when we go to sleep
!PACTION_1A                 = $001A             ; player action $1A: purpose not identified (see header note)
!PACTION_WHISTLEDOG         = $001B             ; player action $1B: whistledog
!PACTION_SWAPTOOL           = $001C             ; player action $1C: swaptool
!PACTION_1D                 = $001D             ; player action $1D: purpose not identified (see header note)
!PACTION_1E                 = $001E             ; player action $1E: purpose not identified (see header note)
!PACTION_1F                 = $001F             ; player action $1F: purpose not identified (see header note)


;; @brief Facing direction of the player / objects (strcPlayer.direction). NOTE: AI movement code treats 2 as +X, see docs/ai/commands.md.
; Direction
!PDIR_DOWN                  = $0000             ; direction $00: down
!PDIR_UP                    = $0001 ; direction $01: up (player faces north)
!PDIR_LEFT                  = $0002             ; direction $02: left
!PDIR_RIGHT                 = $0003             ; direction $03: right


;; @brief Index of a simulated button press in the AI input table (AI command that makes the player walk).
; AI input INDEXES          $84B4D2 - !JOYPAD_DOWN, !JOYPAD_UP, !JOYPAD_RIGHT, !JOYPAD_LEFT, !JOYPAD_B
!AIINPUT_DOWN               =   $00             ; AI input index $00: down
!AIINPUT_UP                 =   $01             ; AI input index $01: up
!AIINPUT_RIGHT              =   $02             ; AI input index $02: right
!AIINPUT_LEFT               =   $03             ; AI input index $03: left
!AIINPUT_B                  =   $04             ; AI input index $04: b


;; @brief Destination of the name entry screen (strcMenuData.nameDestinationIdx) = what is being named.
; Name input destination    $00099F
!NI_PLAYER                  =   $00             ; name entry target $00: player
!NI_COWBOUGHT               =   $01             ; name entry target $01: cowbought
!NI_COWBORN                 =   $02             ; name entry target $02: cowborn
!NI_DOG                     =   $03             ; name entry target $03: dog
!NI_HORSE                   =   $04             ; name entry target $04: horse
!NI_FIRSTHILD               =   $05             ; name entry target $05: firsthild
!NI_SECONDCHILD             =   $06             ; name entry target $06: secondchild


;; @brief Dialog control words and special glyph ids of the dialog word stream (src/code/bank_83/dialog.asm, docs/formats/dialog-tables.md); the text sources in translate/<lang>/ write them as <NEXT>, <NUM n i>, <VAR n i>, <OPT n>, <END>.
!DIALOG_NEXTSCREEN          = $00A2             ; dialog word $00A2: next text screen (wait for a button, clear the box)
!DIALOG_SPACE               = $00B1             ; glyph $00B1: blank cell
!DIALOG_NUMERICVARIABLE     = $FFFC             ; control word $FFFC: numeric variable (digit count, variable index)
!DIALOG_TEXTVARIABLE        = $FFFD             ; control word $FFFD: text variable (length, variable index)
!DIALOG_OPTIONS             = $FFFE             ; control word $FFFE: answer menu (option count), ends the text
!DIALOG_END                 = $FFFF             ; control word $FFFF: end of the dialog
