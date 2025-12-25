;PRG ROM $6C000-$6FFFF
;background art

SECTION "bank 1B", ROMX, BANK[$1B]

POINTERS_1B_4000:
PointerWithSize BackgroundGFX_ShoulderMiri_1B_4058
PointerWithSize BackgroundTilemap_ShoulderMiri_1B_4548

PointerWithSize BackgroundGFX_ShoulderMari_1B_45E8
PointerWithSize BackgroundTilemap_ShoulderMari_1B_4968

PointerWithSize BackgroundGFX_ShoulderSuzune_1B_4A08
PointerWithSize BackgroundTilemap_ShoulderSuzune_1B_4E28

PointerWithSize BackgroundGFX_ShoulderMomoyo_1B_4EC8
PointerWithSize BackgroundTilemap_ShoulderMomoyo_1B_5368

PointerWithSize BackgroundGFX_IntroAmusementPark_1B_5408
PointerWithSize BackgroundTilemap_IntroAmusementPark_1B_5808

PointerWithSize BackgroundGFX_IntroSchoolTerritory_1B_58A8
PointerWithSize BackgroundTilemap_IntroSchoolTerritory_1B_5C58

PointerWithSize BackgroundGFX_IntroCityscape_1B_5CF8
PointerWithSize BackgroundTilemap_IntroCityscape_1B_6038

PointerWithSize BackgroundGFX_IntroLibrary_1B_60D8
PointerWithSize BackgroundTilemap_IntroLibrary_1B_6488

PointerWithSize BackgroundGFX_IntroBar_1B_6528 ;or maybe it's the same funky karaoke club
PointerWithSize BackgroundTilemap_IntroBar_1B_6A68

PointerWithSize BackgroundGFX_IntroBedroom_1B_6B0B
PointerWithSize BackgroundTilemap_IntroBedroom_1B_6FA8

PointerWithSize BackgroundGFX_IntroArcade_1B_7048
PointerWithSize BackgroundTilemap_IntroArcade_1B_74A8

BackgroundGFX_ShoulderMiri_1B_4058:
incbin "GFX/Backgrounds/BG_ShoulderMiri.bin"
.end

BackgroundTilemap_ShoulderMiri_1B_4548:
db $A1,$A1,$A2,$A3,$A4,$A4,$A5,$A6,$A7,$A8,$A0,$A9,$AA,$AB,$AC,$AC,$AD,$AE,$A1,$A1
db $A1,$A2,$A3,$A6,$A0,$A6,$A0,$AF,$B0,$B1,$B2,$B3,$B4,$B5,$B6,$A6,$A6,$AD,$AE,$A1
db $A1,$A3,$A6,$A0,$A0,$A0,$A0,$B7,$B8,$B9,$BA,$BB,$B4,$BC,$BD,$A0,$A0,$A6,$AD,$A1
db $A1,$BE,$A0,$A0,$A0,$A0,$BF,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$A0,$A0,$A6,$C8,$A1
db $A1,$BE,$A6,$A0,$A6,$A0,$C9,$CA,$CB,$B4,$CC,$CD,$CE,$CF,$D0,$A0,$A6,$A0,$C8,$A1
db $A1,$D1,$A6,$A0,$A0,$A6,$A0,$D2,$D3,$B4,$D4,$D5,$D6,$D7,$D8,$A6,$A0,$A6,$D9,$A1
db $A1,$DA,$D1,$A6,$A0,$A0,$A0,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$E2,$A0,$A6,$D9,$E3,$A1
db $A1,$A1,$DA,$D1,$E4,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$D9,$E3,$A1,$A1
.end

BackgroundGFX_ShoulderMari_1B_45E8:
incbin "GFX/Backgrounds/BG_ShoulderMari.bin"
.end

BackgroundTilemap_ShoulderMari_1B_4968:
db $A1,$A1,$A2,$A3,$A4,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$A5,$AC,$AC,$AD,$AE,$A1,$A1
db $A1,$A2,$A3,$AF,$A0,$AF,$B0,$B1,$B2,$B3,$B3,$B3,$B4,$B5,$AF,$A0,$AF,$AD,$AE,$A1
db $A1,$A3,$AF,$A0,$A0,$A0,$B6,$B7,$B8,$B3,$B3,$B3,$B3,$B9,$A0,$A0,$A0,$AF,$AD,$A1
db $A1,$BA,$A0,$A0,$A0,$A0,$AF,$BB,$BC,$B3,$B3,$B3,$B3,$BD,$A0,$AF,$A0,$AF,$BE,$A1
db $A1,$BA,$AF,$A0,$AF,$A0,$A0,$A0,$BF,$C0,$B3,$B3,$B3,$C1,$A0,$A0,$AF,$A0,$BE,$A1
db $A1,$C2,$AF,$A0,$A0,$AF,$A0,$A0,$C3,$C4,$B3,$B3,$C5,$C6,$AF,$A0,$A0,$AF,$C7,$A1
db $A1,$C8,$C2,$AF,$A0,$A0,$A0,$C9,$CA,$CB,$B3,$B3,$CC,$CD,$CE,$A0,$AF,$C7,$CF,$A1
db $A1,$A1,$C8,$C2,$D0,$D0,$D1,$D2,$D3,$D4,$B3,$B3,$B3,$D5,$D6,$D7,$C7,$CF,$A1,$A1
.end

BackgroundGFX_ShoulderSuzune_1B_4A08:
incbin "GFX/Backgrounds/BG_ShoulderSuzune.bin"
.end

BackgroundTilemap_ShoulderSuzune_1B_4E28:
db $A1,$A1,$A2,$A3,$A4,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$A6,$A5,$AB,$AB,$AC,$AD,$A1,$A1
db $A1,$A2,$A3,$A6,$A0,$A6,$A0,$A0,$AE,$AF,$B0,$B1,$B2,$A0,$A6,$A0,$A6,$AC,$AD,$A1
db $A1,$A3,$A6,$A0,$A0,$A0,$A0,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$A0,$A0,$A0,$A6,$AC,$A1
db $A1,$BA,$A0,$A0,$A0,$A0,$BB,$BC,$BD,$BE,$BF,$B6,$C0,$C1,$A0,$A6,$A0,$A6,$C2,$A1
db $A1,$BA,$A6,$A0,$A6,$A0,$C3,$C4,$C5,$B6,$B6,$B6,$B6,$C6,$C7,$A0,$A6,$A0,$C2,$A1
db $A1,$C8,$A6,$A0,$A0,$A6,$A0,$C9,$CA,$B6,$B6,$B6,$CB,$B6,$CC,$A0,$A0,$A6,$CD,$A1
db $A1,$CE,$C8,$A6,$A0,$A0,$A6,$CF,$D0,$D1,$B6,$D2,$D3,$D4,$D5,$A0,$A6,$CD,$D6,$A1
db $A1,$A1,$CE,$C8,$D7,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$CD,$D6,$A1,$A1
.end

BackgroundGFX_ShoulderMomoyo_1B_4EC8:
incbin "GFX/Backgrounds/BG_ShoulderMomoyo.bin"
.end

BackgroundTilemap_ShoulderMomoyo_1B_5368:
db $A1,$A1,$A2,$A3,$A4,$A4,$A5,$A6,$A0,$A5,$A7,$A8,$A9,$AA,$AB,$AB,$AC,$AD,$A1,$A1
db $A1,$A2,$A3,$A6,$A0,$A6,$A0,$AE,$AF,$B0,$B1,$B2,$B3,$B4,$B5,$A0,$A6,$AC,$AD,$A1
db $A1,$A3,$A6,$A0,$A0,$A0,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$A0,$A0,$A6,$AC,$A1
db $A1,$BF,$A0,$A0,$A0,$A0,$C0,$C1,$C2,$C3,$C4,$BB,$C5,$C6,$C7,$A0,$A0,$A6,$C8,$A1
db $A1,$BF,$A6,$A0,$A6,$A0,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$A0,$A0,$A6,$A0,$C8,$A1
db $A1,$D1,$A6,$A0,$A0,$A6,$D2,$D3,$D4,$D5,$BB,$BB,$BB,$D6,$A6,$A0,$A0,$A6,$D7,$A1
db $A1,$D8,$D1,$A6,$A0,$A0,$A0,$D9,$DA,$DB,$DC,$BB,$DD,$DE,$A0,$A0,$A6,$D7,$DF,$A1
db $A1,$A1,$D8,$D1,$E0,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$E9,$D7,$DF,$A1,$A1
.end

BackgroundGFX_IntroAmusementPark_1B_5408:
incbin "GFX/Backgrounds/BG_IntroAmusementPark.bin"
.end

BackgroundTilemap_IntroAmusementPark_1B_5808:
db $A0,$A0,$A0,$A0,$A0,$A1,$A0,$A2,$A1,$A0,$A0,$A0,$A0,$A3,$A4,$A0,$A0,$A0,$A0,$A0
db $A4,$A0,$A5,$A0,$A0,$A6,$A7,$A8,$A6,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A9,$AA,$A0,$A3
db $A0,$A1,$AB,$A0,$A0,$AC,$AD,$AE,$AF,$A0,$B0,$B1,$B2,$A0,$A0,$B3,$B4,$B5,$B6,$A0
db $A2,$A6,$B7,$B8,$B9,$AC,$BA,$BB,$AF,$B9,$BC,$BD,$BE,$BF,$C0,$C1,$A6,$C2,$C3,$C4
db $C5,$C6,$C7,$C8,$AC,$C9,$CA,$CB,$C9,$AF,$C5,$C6,$C5,$C6,$C5,$C6,$C5,$C6,$C5,$C6
db $CC,$CC,$CD,$CC,$CC,$CE,$CF,$D0,$D1,$AF,$D2,$D3,$D2,$CC,$CC,$CC,$CC,$CC,$CC,$CC
db $D4,$D5,$D6,$D7,$D8,$D4,$D5,$D6,$D7,$D8,$D4,$D5,$D2,$D9,$D9,$D9,$D9,$D9,$D9,$D9
db $DA,$DB,$DC,$DD,$DE,$DA,$DB,$DC,$DD,$DE,$DA,$DB,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF
.end

BackgroundGFX_IntroSchoolTerritory_1B_58A8:
incbin "GFX/Backgrounds/BG_IntroSchoolTerritory.bin"
.end

BackgroundTilemap_IntroSchoolTerritory_1B_5C58:
db $A1,$A2,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A3,$A3,$A3,$A3,$A3
db $A4,$A5,$A3,$A3,$A3,$A6,$A7,$A8,$A3,$A3,$A3,$A3,$A3,$A3,$A9,$AA,$AB,$AB,$AB,$AB
db $AC,$AC,$AD,$AD,$AD,$AD,$AD,$AC,$AD,$AD,$AD,$AD,$AE,$AB,$AF,$B0,$B1,$B2,$B3,$B1
db $B4,$B4,$B4,$B4,$B5,$B4,$B4,$B4,$B5,$B4,$B4,$B4,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BA
db $BD,$BD,$BD,$BD,$BE,$BD,$BD,$BD,$BE,$BD,$BD,$BD,$BF,$B7,$C0,$C1,$C2,$C3,$C4,$C3
db $C5,$C5,$C5,$C5,$C6,$C5,$C5,$C5,$C6,$C5,$C5,$C5,$C7,$C8,$C9,$CA,$CB,$CC,$CB,$CC
db $CD,$CD,$CE,$CD,$CF,$CD,$CE,$CD,$CF,$CD,$CE,$CD,$D0,$D1,$D2,$D3,$D4,$D5,$D4,$D5
db $D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D7,$D8,$D9,$DA,$D9,$DA
.end

BackgroundGFX_IntroCityscape_1B_5CF8:
incbin "GFX/Backgrounds/BG_IntroCityscape.bin"
.end

BackgroundTilemap_IntroCityscape_1B_6038:
db $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
db $A1,$A2,$A0,$A0,$A0,$A0,$A3,$A0,$A0,$A0,$A0,$A3,$A1,$A2,$A0,$A0,$A0,$A0,$A3,$A0
db $A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$A9,$AA,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB
db $AE,$AF,$B0,$B1,$B2,$B3,$B4,$B5,$B1,$B1,$B2,$B6,$AE,$AF,$B0,$B1,$B2,$B3,$B4,$B5
db $B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0,$BB,$C1,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE
db $C2,$C3,$C4,$C5,$C6,$C7,$C2,$C3,$C4,$C5,$C6,$C7,$C2,$C3,$C4,$C5,$C6,$C7,$C2,$C3
db $C8,$C9,$CA,$CB,$CC,$CD,$C8,$C9,$CA,$CB,$CC,$CD,$C8,$C9,$CA,$CB,$CC,$CD,$C8,$C9
db $CE,$CF,$D0,$D1,$D2,$D3,$CE,$CF,$D0,$D1,$D2,$D3,$CE,$CF,$D0,$D1,$D2,$D3,$CE,$CF
.end

BackgroundGFX_IntroLibrary_1B_60D8:
incbin "GFX/Backgrounds/BG_IntroLibrary.bin"
.end

BackgroundTilemap_IntroLibrary_1B_6488:
db $A1,$A2,$A3,$A4,$A5,$A6,$A0,$A0,$A7,$A5,$A5,$A6,$A0,$A0,$A7,$A5,$A5,$A6,$A0,$A0
db $A8,$A8,$A8,$A9,$AA,$AB,$AC,$AA,$AD,$AC,$AA,$AD,$AE,$AF,$AB,$AC,$AA,$AD,$B0,$B1
db $B2,$B2,$B2,$B3,$B4,$B5,$B6,$B4,$B7,$B6,$B4,$B7,$B8,$B9,$B5,$B6,$B4,$B7,$BA,$BB
db $BC,$BC,$BC,$BD,$BE,$BF,$BE,$C0,$C1,$BE,$C0,$C1,$C0,$BE,$BF,$BE,$BE,$BF,$C2,$C3
db $C4,$C5,$C4,$C6,$AA,$AD,$AE,$AF,$AB,$AC,$AA,$AD,$AC,$AA,$AD,$AE,$AF,$AB,$C7,$C8
db $A3,$A2,$A3,$A4,$B4,$B7,$B8,$B9,$B5,$B6,$B4,$B7,$B6,$B4,$B7,$B8,$B9,$B5,$C9,$CA
db $A8,$A8,$A8,$A9,$CB,$C1,$C0,$CC,$CD,$CE,$CF,$CD,$CF,$D0,$C1,$C0,$BE,$BF,$D1,$D2
db $D3,$B2,$B2,$B3,$D4,$D5,$AE,$D6,$D7,$D7,$D7,$D7,$D7,$D7,$D8,$AE,$AA,$AD,$D9,$DA
.end

BackgroundGFX_IntroBar_1B_6528:
incbin "GFX/Backgrounds/BG_IntroBar.bin"
.end

BackgroundTilemap_IntroBar_1B_6A68:
db $A1,$A2,$A1,$A2,$A1,$A3,$A3,$A4,$A5,$A0,$A6,$A7,$A4,$A7,$A8,$A0,$A9,$A8,$A0,$A9
db $AA,$AB,$AC,$AD,$AA,$A3,$A3,$A5,$A0,$AE,$AF,$B0,$B1,$A7,$B2,$B3,$A0,$A9,$B4,$B5
db $A1,$B6,$B7,$A2,$A1,$A3,$B8,$A0,$A0,$A6,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0,$C1,$C2
db $AA,$C3,$C4,$AD,$AA,$B8,$C5,$A0,$AE,$A7,$A7,$C6,$C7,$A7,$C6,$A7,$C8,$C9,$A0,$CA
db $CB,$CB,$CB,$CB,$CB,$CB,$CB,$CC,$A6,$A4,$A7,$CD,$CE,$CF,$D0,$A7,$D1,$D2,$D3,$D4
db $D5,$D6,$D7,$D5,$D6,$D7,$D5,$D8,$A7,$D9,$DA,$DB,$DA,$DA,$DC,$DD,$A4,$B4,$DE,$A0
db $DF,$E0,$E1,$DF,$E0,$E1,$DF,$E2,$E3,$E4,$E3,$E5,$E6,$E7,$E8,$E9,$E9,$E9,$EA,$E9
db $EB,$EC,$ED,$EB,$A0,$ED,$EB,$A0,$A0,$EE,$EC,$EF,$F0,$F1,$F2,$F3,$F3,$F3,$F3,$F3
.end

BackgroundGFX_IntroBedroom_1B_6B0B:
incbin "GFX/Backgrounds/BG_IntroBedroom.bin"
.end

BackgroundTilemap_IntroBedroom_1B_6FA8:
db $A1,$A2,$A3,$A4,$A5,$A5,$A2,$A3,$A1,$A6,$A0,$A7,$A8,$A9,$A0,$A0,$AA,$AB,$AC,$A0
db $A1,$A3,$A4,$A5,$A5,$A2,$A3,$A4,$A1,$A6,$A0,$AD,$AE,$AF,$A0,$A0,$AA,$B0,$AC,$A0
db $A1,$A4,$B1,$A5,$A2,$A3,$A4,$B2,$A1,$A6,$A0,$B3,$B4,$B5,$A0,$A0,$B6,$B7,$B8,$A0
db $B9,$B9,$BA,$BB,$BC,$BC,$BC,$BD,$BE,$BF,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
db $C0,$C0,$C1,$C2,$C3,$C3,$C3,$C3,$C3,$C4,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
db $C5,$C5,$C5,$C6,$C7,$C8,$C9,$C9,$C9,$CA,$A0,$A0,$CB,$A0,$A0,$A0,$A0,$CC,$CD,$CD
db $CE,$CE,$CE,$CF,$D0,$D1,$CE,$CE,$D2,$A0,$A0,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB
db $A0,$A0,$DC,$DD,$DE,$DF,$A0,$E0,$E1,$A0,$A0,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$A0
.end

BackgroundGFX_IntroArcade_1B_7048:
incbin "GFX/Backgrounds/BG_IntroArcade.bin"
.end

BackgroundTilemap_IntroArcade_1B_74A8:
db $A1,$A2,$A1,$A2,$A1,$A2,$A1,$A2,$A1,$A2,$A1,$A2,$A1,$A2,$A3,$A4,$A1,$A2,$A1,$A2
db $A5,$A6,$A7,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$A9,$AA,$AA,$AA,$A3,$A4,$AB,$A5,$A5,$A5
db $AC,$AD,$AE,$AF,$B0,$AF,$B0,$AF,$B0,$AF,$B1,$B2,$B2,$B3,$A3,$A4,$B4,$AC,$AC,$AC
db $B5,$B6,$B7,$B8,$B9,$B8,$B9,$B8,$B9,$B8,$BA,$A0,$A0,$BB,$A3,$A4,$BC,$B5,$BD,$BE
db $BF,$C0,$C1,$C2,$C3,$C4,$C2,$C3,$C4,$C2,$C5,$A0,$A0,$C6,$A3,$A4,$C7,$BF,$C8,$C9
db $CA,$CB,$CC,$CD,$CE,$CF,$CD,$CE,$CF,$CD,$D0,$D1,$D1,$D2,$A3,$A4,$D3,$CA,$D4,$D4
db $D5,$D6,$D7,$D8,$D9,$DA,$D8,$D9,$DA,$D8,$B1,$BD,$BE,$DB,$A3,$A4,$DC,$D5,$DD,$DE
db $DF,$E0,$AE,$E1,$E2,$E3,$E1,$E2,$E3,$E1,$BA,$BE,$DB,$BD,$A3,$A4,$E4,$DF,$E5,$E5
.end
