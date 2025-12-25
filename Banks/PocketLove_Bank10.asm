;PRG ROM $40000-$43FFF
;background art

SECTION "bank 10", ROMX, BANK[$10]

PointerWithSize BackgroundGFX_Chalkboard_10_4060
PointerWithSize BackgroundTilemap_Chalkboard_10_4160

PointerWithSize BackgroundGFX_Classroom_10_4200
PointerWithSize BackgroundTilemap_Classroom_10_4710

PointerWithSize BackgroundGFX_ClassroomTest_10_47B0
PointerWithSize BackgroundTilemap_ClassroomTest_10_4D00

PointerWithSize BackgroundGFX_SchoolHallway_10_4DA0
PointerWithSize BackgroundTilemap_SchoolHallway_10_5360

PointerWithSize BackgroundGFX_Library_10_5400
PointerWithSize BackgroundTilemap_Library_10_57E0

PointerWithSize BackgroundGFX_SchoolRooftop_10_5880
PointerWithSize BackgroundTilemap_SchoolRooftop_10_5AC0

PointerWithSize BackgroundGFX_SchoolNurseOffice_10_5B60
PointerWithSize BackgroundTilemap_SchoolNurseOffice_10_60E0

PointerWithSize BackgroundGFX_SchoolTerritory_10_6180
PointerWithSize BackgroundTilemap_SchoolTerritory_10_64E0

PointerWithSize BackgroundGFX_SchoolEvent_10_6580
PointerWithSize BackgroundTilemap_SchoolEvent_10_6870

PointerWithSize BackgroundGFX_Schoolyard_10_6910
PointerWithSize BackgroundTilemap_Schoolyard_10_6EA0

PointerWithSize BackgroundGFX_Street_10_6F40
PointerWithSize BackgroundTilemap_Street_10_7370

PointerWithSize BackgroundGFX_SchoolEntrance_10_7410
PointerWithSize BackgroundTilemap_SchoolEntrance_10_76F0

BackgroundGFX_Chalkboard_10_4060:
incbin "GFX/Backgrounds/BG_Chalkboard.bin"
.end

BackgroundTilemap_Chalkboard_10_4160:
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A2
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A3
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A4
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A5
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A6,$A7,$A1,$A1,$A1
db $A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$A9,$AA,$A8,$A8,$A8
db $AB,$AB,$AB,$AB,$AB,$AC,$AD,$AE,$AF,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB
.end

BackgroundGFX_Classroom_10_4200:
incbin "GFX/Backgrounds/BG_Classroom.bin"
.end

BackgroundTilemap_Classroom_10_4710:
db $A1,$A2,$A3,$A4,$A2,$A3,$A1,$A5,$A6,$A7,$A8,$A1,$A9,$AA,$A0,$A0,$AB,$AC,$AD,$A6
db $A2,$A3,$A1,$A4,$A3,$A1,$A2,$AE,$A6,$A7,$AF,$B0,$B1,$AA,$B2,$B2,$B3,$AC,$AD,$A6
db $A3,$A1,$A2,$B4,$A1,$A2,$A3,$B5,$A6,$A7,$A2,$A2,$A2,$AA,$B6,$B6,$B6,$AC,$B7,$B8
db $B9,$B9,$B9,$BA,$B9,$B9,$B9,$BB,$A6,$BC,$A2,$A2,$A2,$AA,$B6,$B6,$B6,$BD,$BE,$BF
db $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$A6,$A7,$A2,$A2,$A2,$AA,$B6,$B6,$B6,$C8,$A0,$C9
db $CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$AA,$D7,$D7,$D7,$C8,$A0,$A0
db $D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$D8,$D9,$DA,$DB,$DC,$E0,$A2,$A2,$E1,$E2,$E3,$A0
db $E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EC,$ED,$EE,$EF,$F0
.end

BackgroundGFX_ClassroomTest_10_47B0:
incbin "GFX/Backgrounds/BG_ClassroomTest.bin"
.end

BackgroundTilemap_ClassroomTest_10_4D00:
db $A1,$A2,$A3,$A4,$A5,$A1,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$A6,$A7,$AD,$AE,$AF,$A1,$A1
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$B0,$B1,$A1,$A1,$A1
db $B2,$B3,$B4,$B4,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BB,$BC,$B4,$B4,$B4,$B4,$B4,$B9
db $BD,$BE,$A0,$A0,$A0,$BF,$C0,$C1,$C2,$C3,$C4,$C5,$C1,$C6,$A0,$A0,$A0,$A0,$C7,$C3
db $C8,$C9,$CA,$A0,$A0,$A0,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$A0,$A0,$A0,$A0,$D3,$CE
db $D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$D4,$D5,$DE,$DF,$E0,$E1,$D7,$E2,$DC,$DD
db $E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$E3,$ED,$EE,$EF,$F0,$F1,$F2,$F3,$F4,$EC
.end

BackgroundGFX_SchoolHallway_10_4DA0:
incbin "GFX/Backgrounds/BG_SchoolHallway.bin"
.end

BackgroundTilemap_SchoolHallway_10_5360:
db $A0,$A1,$A2,$A0,$A3,$A4,$A5,$A6,$A6,$A6,$A6,$A6,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$A0
db $A0,$A1,$AD,$AE,$AF,$B0,$B1,$B2,$B3,$B3,$B3,$B3,$B4,$B5,$B6,$AB,$B7,$B8,$AC,$A0
db $A0,$A1,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$BF,$BF,$BF,$C0,$C1,$C2,$C3,$A0,$C4,$AC,$A0
db $A0,$A1,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CB,$CE,$CF,$D0,$D1,$A0,$C4,$AC,$A0
db $A0,$A1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$D0,$D1,$A0,$C4,$AC,$A0
db $A0,$A1,$DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$DD,$E9,$EA,$A0,$C4,$AC,$A0
db $A0,$A1,$EB,$EC,$A0,$ED,$EE,$EF,$F0,$F0,$F0,$F0,$F1,$F2,$D0,$D1,$F3,$F4,$AC,$A0
db $A0,$A1,$A0,$A0,$A0,$F5,$F6,$F7,$F7,$F7,$F7,$F7,$F7,$F8,$F9,$D1,$FA,$FB,$AC,$A0
.end

BackgroundGFX_Library_10_5400:
incbin "GFX/Backgrounds/BG_Library.bin"
.end

BackgroundTilemap_Library_10_57E0:
db $A1,$A1,$A1,$A1,$A2,$A0,$A3,$A1,$A1,$A1,$A1,$A4,$A0,$A0,$A5,$A1,$A1,$A1,$A6,$A7
db $A8,$A9,$A9,$AA,$AB,$AB,$A8,$A9,$A9,$AA,$AB,$AB,$A8,$A9,$A9,$AC,$AD,$AE,$AF,$B0
db $B1,$B2,$B3,$B4,$B5,$B6,$B1,$B2,$B3,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB
db $BC,$BD,$BE,$BF,$C0,$C1,$BC,$BD,$BE,$BC,$BD,$BE,$BF,$C0,$C1,$B7,$C2,$C3,$C4,$C5
db $C6,$C7,$C8,$C7,$C6,$C9,$C6,$C7,$C8,$C6,$C7,$C8,$C7,$C6,$C9,$B7,$CA,$CB,$CC,$CD
db $B4,$B5,$B6,$B1,$B2,$B3,$B4,$B5,$B6,$B1,$B2,$B3,$B1,$B2,$B3,$B7,$CE,$CF,$D0,$D1
db $BF,$C0,$C1,$BC,$BD,$BE,$BF,$C0,$C1,$BC,$BD,$BE,$BC,$BD,$BE,$B7,$D2,$D3,$D4,$BB
db $D5,$D6,$D7,$D6,$D8,$C8,$C7,$D9,$D7,$D5,$D6,$D7,$D6,$D8,$C8,$B7,$DA,$DB,$DC,$DD
.end

BackgroundGFX_SchoolRooftop_10_5880:
incbin "GFX/Backgrounds/BG_SchoolRooftop.bin"
.end

BackgroundTilemap_SchoolRooftop_10_5AC0:
db $A0,$A1,$A2,$A3,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A4,$A0,$A0,$A0,$A1,$A5,$A0
db $A0,$A0,$A0,$A0,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A1,$A2,$A3,$A6,$A7
db $A3,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A8,$A9
db $AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$AA,$A8,$A9
db $AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$A8,$A9
db $AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AD,$AE
db $AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$AF,$B0,$A9
db $B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0,$C1,$C2,$C3,$A9
.end

BackgroundGFX_SchoolNurseOffice_10_5B60:
incbin "GFX/Backgrounds/BG_SchoolNurseOffice.bin"
.end

BackgroundTilemap_SchoolNurseOffice_10_60E0:
db $A1,$A2,$A2,$A1,$A2,$A2,$A1,$A2,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$A8,$A9,$AA
db $AB,$A0,$A0,$AB,$A0,$A0,$AB,$A0,$A0,$AC,$A0,$AD,$AE,$AF,$B0,$B1,$B2,$B3,$B4,$B2
db $B5,$B5,$B6,$AB,$B7,$B8,$AB,$A0,$A0,$AC,$A0,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$BD,$BE
db $C0,$C0,$C1,$AB,$C2,$C3,$AB,$A0,$B7,$AC,$A0,$C4,$C5,$C6,$BC,$C7,$A9,$C8,$C7,$A9
db $C9,$C9,$CA,$AB,$A0,$A0,$AB,$A0,$C2,$CB,$CC,$CD,$CE,$CF,$D0,$AA,$C7,$C8,$D1,$D2
db $D3,$D3,$D4,$D5,$D6,$D6,$D7,$D8,$D9,$AC,$A0,$DA,$DB,$DC,$BC,$DD,$DD,$DE,$DF,$DF
db $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$AC,$A0,$DA,$DB,$E9,$EA,$EB,$EB,$EC,$ED,$ED
db $A0,$EE,$EF,$F0,$F1,$F2,$F3,$F4,$F5,$AC,$A0,$DA,$DB,$F6,$F7,$F7,$F7,$F7,$F7,$F7
.end

BackgroundGFX_SchoolTerritory_10_6180:
incbin "GFX/Backgrounds/BG_SchoolTerritory.bin"
.end

BackgroundTilemap_SchoolTerritory_10_64E0:
db $A0,$A0,$A0,$A0,$A0,$A1,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A2,$A3,$A4,$A0,$A0,$A1,$A0
db $A5,$A3,$A4,$A0,$A6,$A7,$A8,$A0,$A0,$A0,$A0,$A0,$A9,$AA,$AA,$AB,$AC,$AC,$AC,$AC
db $AD,$AA,$AA,$AA,$AE,$AA,$AD,$AA,$AA,$AA,$AA,$AF,$AC,$B0,$B1,$B2,$B3,$B4,$B5,$B6
db $B7,$B7,$B7,$B8,$B7,$B7,$B7,$B8,$B7,$B7,$B7,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0,$C1
db $B7,$B7,$B7,$C2,$B7,$B7,$B7,$C2,$B7,$B7,$B7,$C3,$BA,$BB,$BC,$BD,$C4,$C5,$C4,$C5
db $C6,$C7,$C6,$C8,$C6,$C7,$C6,$C8,$C6,$C7,$C6,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$CE,$CF
db $D0,$D1,$D0,$D1,$D0,$D1,$D0,$D1,$D0,$D1,$D0,$D1,$D2,$D2,$D2,$D2,$D3,$D4,$D3,$D4
db $D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5,$D5
.end

BackgroundGFX_SchoolEvent_10_6580:
incbin "GFX/Backgrounds/BG_SchoolEvent.bin"
.end

BackgroundTilemap_SchoolEvent_10_6870:
db $A0,$A1,$A2,$A3,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A1,$A2,$A5,$A0,$A0,$A0,$A6,$A3
db $A6,$A7,$A8,$A0,$A0,$A0,$A0,$A0,$A9,$AA,$AA,$AA,$A7,$A8,$AB,$AA,$AA,$AA,$AA,$AA
db $AC,$A1,$A2,$AD,$AE,$AF,$B0,$AC,$B1,$B2,$B2,$B2,$A1,$A2,$B3,$B4,$B5,$B2,$B3,$B4
db $B6,$A7,$A8,$B7,$B8,$B9,$BA,$B6,$BB,$B2,$B2,$B2,$A7,$A8,$BC,$BD,$BE,$B2,$BC,$BD
db $BF,$A1,$A2,$BF,$C0,$BF,$C0,$BF,$BB,$C1,$C2,$C1,$A1,$A2,$C2,$C1,$C3,$C4,$C5,$C1
db $C6,$A7,$A8,$C6,$C7,$C6,$C7,$C6,$C8,$C9,$C8,$C9,$A7,$A8,$C8,$C9,$CA,$CB,$CC,$C9
db $CD,$A1,$A2,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$A1,$A2,$CD,$CD,$CD,$CD,$CD,$CD
db $CE,$A7,$A8,$CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE,$CE,$A7,$A8,$CE,$CE,$CE,$CE,$CE,$CE
.end

BackgroundGFX_Schoolyard_10_6910:
incbin "GFX/Backgrounds/BG_Schoolyard.bin"
.end

BackgroundTilemap_Schoolyard_10_6EA0:
db $A0,$A0,$A0,$A1,$A0,$A0,$A2,$A3,$A3,$A3,$A4,$A5,$A6,$A7,$A0,$A8,$A9,$AA,$AB,$AC
db $AD,$AD,$AD,$AE,$AF,$AF,$AF,$AF,$AF,$AF,$B0,$B1,$A0,$B2,$B3,$B4,$A9,$AA,$B5,$B6
db $A0,$A0,$A0,$A1,$B7,$B8,$B9,$B7,$BA,$BB,$BC,$A5,$BD,$BE,$BF,$C0,$A9,$AA,$B5,$C1
db $A0,$A0,$A0,$A1,$A0,$C2,$C3,$A0,$C4,$C5,$C6,$A5,$C7,$C8,$C9,$CA,$A9,$AA,$CB,$CC
db $CD,$CE,$A0,$A1,$CF,$C2,$C3,$A0,$C4,$C5,$C6,$A5,$C7,$C8,$BF,$D0,$A9,$AA,$D1,$D2
db $D3,$D4,$D5,$A1,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$A5,$DD,$DE,$DF,$C0,$A9,$AA,$E0,$B6
db $E1,$E1,$E2,$A1,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$A5,$A0,$A0,$EA,$EB,$A9,$AA,$B5,$C1
db $EC,$ED,$D4,$EE,$EF,$F0,$F1,$F1,$F1,$F2,$F3,$F4,$F5,$A0,$A0,$F6,$A9,$AA,$F7,$F8
.end

BackgroundGFX_Street_10_6F40:
incbin "GFX/Backgrounds/BG_Street.bin"
.end

BackgroundTilemap_Street_10_7370:
db $A0,$A1,$A2,$A3,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A4
db $A5,$A6,$A0,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A7,$A8,$A9
db $AA,$AB,$AC,$AC,$AD,$AE,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A1,$A2,$AF,$B0,$B1
db $AA,$AB,$B2,$B3,$B4,$B5,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$B6,$B7,$B7,$B8,$B9,$BA,$BB
db $AA,$AB,$BC,$BD,$BE,$BF,$C0,$C1,$C2,$C3,$C1,$C2,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB
db $AA,$AB,$AC,$AC,$AC,$CC,$CD,$CE,$CF,$D0,$CE,$CF,$D1,$D2,$D3,$D4,$C8,$C9,$CA,$CB
db $AA,$AB,$D5,$D6,$D7,$D8,$CF,$D9,$DA,$D8,$DB,$DC,$DD,$DE,$DE,$DF,$C8,$C9,$CA,$CB
db $AA,$AB,$E0,$E1,$E2,$E0,$E0,$E0,$E1,$E2,$E0,$E0,$E0,$E1,$E2,$E0,$C8,$C9,$CA,$CB
.end

BackgroundGFX_SchoolEntrance_10_7410:
incbin "GFX/Backgrounds/BG_SchoolEntrance.bin"
.end

BackgroundTilemap_SchoolEntrance_10_76F0:
db $A1,$A1,$A2,$A3,$A4,$A5,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A6,$A7,$A8,$A0,$A0
db $A9,$A9,$A9,$AA,$AB,$AC,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A5
db $AD,$AE,$AD,$AF,$B0,$B1,$A0,$A0,$A0,$A0,$A0,$A6,$A7,$A8,$A0,$A0,$A0,$A0,$A0,$A0
db $B2,$B2,$B3,$AE,$B4,$B5,$A2,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A6,$B6
db $B7,$B8,$B9,$AF,$BA,$B5,$BB,$BC,$BD,$BE,$BE,$BE,$BF,$C0,$C1,$BE,$BE,$BE,$BE,$C2
db $AD,$AD,$AD,$AE,$B4,$B5,$C3,$C4,$C5,$C6,$C6,$C6,$C7,$C6,$C6,$C6,$C7,$C6,$C6,$C8
db $AD,$AE,$AD,$AF,$BA,$B5,$C3,$C4,$C9,$CA,$CA,$CA,$CB,$CA,$CA,$CA,$CB,$CA,$CA,$CC
db $AD,$AD,$AD,$AE,$B4,$B5,$C3,$C4,$CD,$CA,$CA,$CA,$CB,$CA,$CA,$CA,$CB,$CA,$CA,$CC
.end