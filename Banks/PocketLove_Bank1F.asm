;PRG ROM $7C000-$7FFFF

SECTION "bank 1F", ROMX, BANK[$1F]

GFX_TimePassingWindow_Spring_1F_4000:
incbin "GFX/TimePassingWindow_Spring.bin"

GFX_TimePassingWindow_Summer_1F_4400:
incbin "GFX/TimePassingWindow_Summer.bin"

GFX_TimePassingWindow_Autumn_1F_4800:
incbin "GFX/TimePassingWindow_Fall.bin"

GFX_TimePassingWindow_Winter_1F_4C00:
incbin "GFX/TimePassingWindow_Winter.bin"

GFX_ScheduleIcons_1F_5000:
incbin "GFX/ScheduleIcons.bin"

GFX_Calendar_1F_5400:
incbin "GFX/Calendar.bin"

GFX_ScheduleSprites_1F_5A40:
incbin "GFX/ScheduleSprites.bin"

GFX_RelationshipViewerBGTiles_1F_61E0:
incbin "GFX/RelationshipBGTiles.bin"

GFX_RelationshipViewerSpriteTiles_1F_67E0:
incbin "GFX/RelationshipSprites.bin"

GFX_Underscore_1F_6DE0:
incbin "GFX/Underscore.bin"                                 ;a single 8x8 tile used for new game name and etc. entry

GFX_TitleScreenBGTiles_1F_6DF0:
incbin "GFX/TitleScreenBGTiles.bin"

GFX_TitleScreenSpriteTiles_1F_7360:
incbin "GFX/TitleScreenSprites.bin"

GFX_Map_1F_7460:
incbin "GFX/Map.bin"