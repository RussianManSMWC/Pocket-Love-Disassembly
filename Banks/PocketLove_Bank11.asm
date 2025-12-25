;PRG ROM $44000-$47FFF
;background art

SECTION "bank 11", ROMX, BANK[$11]

PointerWithSize BackgroundGFX_SchoolSoccerfield_11_4058 ;soccer or football for not americans
PointerWithSize BackgroundTilemap_SchoolSoccerfield_11_45C8

PointerWithSize BackgroundGFX_SchoolBasketballCourt_11_4668
PointerWithSize BackgroundTilemap_SchoolBasketballCourt_11_4AB8

PointerWithSize BackgroundGFX_SchoolClubroom_11_4B58
PointerWithSize BackgroundTilemap_SchoolClubroom_11_50E8

PointerWithSize BackgroundGFX_Spotlight_11_5188
PointerWithSize BackgroundTilemap_Spotlight_11_5208

PointerWithSize BackgroundGFX_Bonfire_11_52A8
PointerWithSize BackgroundTilemap_Bonfire_11_57A8

PointerWithSize BackgroundGFX_SchoolTheater_11_5848
PointerWithSize BackgroundTilemap_SchoolTheater_11_5D58

PointerWithSize BackgroundGFX_Neighborhood_11_5DF8
PointerWithSize BackgroundTilemap_Neighborhood_11_6288

PointerWithSize BackgroundGFX_Park_11_6328
PointerWithSize BackgroundTilemap_Park_11_6868

PointerWithSize BackgroundGFX_River_11_6908
PointerWithSize BackgroundTilemap_River_11_6E68

PointerWithSize BackgroundGFX_NightRiver_11_6F08
PointerWithSize BackgroundTilemap_NightRiver_11_7188

PointerWithSize BackgroundGFX_ArcadeEntrance_11_7228
PointerWithSize BackgroundTilemap_ArcadeEntrance_11_7688

BackgroundGFX_SchoolSoccerfield_11_4058:
incbin "GFX/Backgrounds/BG_SchoolSoccerfield.bin"
.end

BackgroundTilemap_SchoolSoccerfield_11_45C8:
db $A1,$A2,$A3,$A0,$A4,$A0,$A0,$A0,$A0,$A0,$A1,$A3,$A0,$A4,$A0,$A0,$A5,$A6,$A7,$A8
db $A0,$A0,$A9,$AA,$A9,$AA,$A0,$A4,$AB,$A0,$A0,$A0,$AB,$A0,$A1,$A2,$AC,$AD,$AE,$AF
db $B0,$B1,$B2,$B3,$B2,$B3,$B0,$A0,$B4,$B5,$B6,$B6,$B6,$B6,$B6,$B6,$B7,$B8,$B9,$BA
db $BB,$BC,$BB,$BC,$BB,$BC,$BB,$BD,$B4,$B4,$BE,$BF,$BE,$BF,$BE,$BF,$C0,$C1,$C2,$C3
db $C4,$C5,$C4,$C5,$C4,$C5,$C6,$C7,$C7,$C7,$C8,$C9,$C8,$C9,$C8,$C9,$CA,$CB,$CC,$CD
db $CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D5,$D7,$D8,$D9,$D8,$D9,$DA,$DB,$DC,$DD,$DE
db $DF,$E0,$E0,$E1,$E2,$E1,$E3,$E4,$E5,$E4,$B4,$E6,$E7,$E6,$E7,$E8,$E9,$EA,$EB,$EC
db $ED,$EE,$B4,$B4,$EF,$B4,$B4,$B4,$F0,$B4,$B4,$B4,$B4,$B4,$F1,$F2,$F3,$F4,$F5,$F6
.end

BackgroundGFX_SchoolBasketballCourt_11_4668:
incbin "GFX/Backgrounds/BG_SchoolBasketballCourt.bin"
.end

BackgroundTilemap_SchoolBasketballCourt_11_4AB8:
db $A1,$A1,$A1,$A1,$A1,$A2,$A3,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1
db $A4,$A5,$A5,$A4,$A5,$A6,$A7,$A4,$A5,$A4,$A5,$A5,$A4,$A5,$A5,$A4,$A5,$A5,$A4,$A5
db $A8,$A0,$A0,$A9,$AA,$AB,$AC,$A0,$A0,$AD,$A0,$A0,$AD,$A0,$A0,$AD,$A0,$A0,$AD,$A0
db $AE,$AF,$A0,$B0,$B1,$A0,$AD,$A0,$A0,$AD,$A0,$A0,$AD,$B2,$B3,$AD,$A0,$A0,$AD,$B4
db $AE,$B5,$B6,$B7,$B8,$A0,$AD,$A0,$A0,$AD,$A0,$A0,$AD,$B9,$BA,$AD,$BB,$A0,$AD,$BC
db $AE,$BD,$BE,$BF,$A0,$A0,$C0,$A0,$A0,$C0,$A0,$A0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8
db $C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$CE,$CE,$CE,$CE,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8
db $D9,$D9,$DA,$DB,$DC,$DD,$DE,$D9,$D9,$D9,$D9,$D9,$D9,$DF,$E0,$E1,$D9,$E2,$E3,$E4
.end

BackgroundGFX_SchoolClubroom_11_4B58:
incbin "GFX/Backgrounds/BG_SchoolClubroom.bin"
.end

BackgroundTilemap_SchoolClubroom_11_50E8:
db $A0,$A1,$A1,$A1,$A2,$A3,$A3,$A3,$A4,$A3,$A3,$A3,$A3,$A5,$A1,$A1,$A6,$A7,$A8,$A9
db $A0,$AA,$AB,$AC,$AD,$AE,$AE,$AE,$AE,$AE,$AE,$AE,$AE,$AF,$AC,$AC,$B0,$B1,$B2,$B3
db $A0,$AA,$AC,$AB,$AD,$AE,$AE,$AE,$AE,$AE,$AE,$AE,$AE,$AF,$AC,$AB,$B0,$A7,$B4,$B3
db $A0,$AA,$AB,$AC,$AD,$AE,$AE,$AE,$AE,$AE,$AE,$AE,$AE,$AF,$AC,$AB,$B0,$A7,$B5,$B3
db $A0,$B6,$B7,$B8,$B9,$BA,$BB,$BB,$BB,$BB,$BB,$BB,$BB,$BC,$B8,$B7,$BD,$A7,$BE,$BF
db $C0,$C1,$C2,$C3,$C4,$C5,$A0,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2
db $D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$E6
db $E7,$E8,$E9,$EA,$EB,$EC,$AC,$ED,$EE,$EF,$F0,$AC,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8
.end

BackgroundGFX_Spotlight_11_5188:
incbin "GFX/Backgrounds/BG_Spotlight.bin"
.end

BackgroundTilemap_Spotlight_11_5208:
db $A1,$A1,$A1,$A1,$A1,$A2,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A3,$A1,$A1,$A1,$A1,$A1
db $A1,$A1,$A1,$A1,$A1,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A5,$A1,$A1,$A1,$A1,$A1
db $A1,$A1,$A1,$A1,$A1,$A6,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A7,$A1,$A1,$A1,$A1,$A1
db $A1,$A1,$A1,$A1,$A2,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A3,$A1,$A1,$A1,$A1
db $A1,$A1,$A1,$A1,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A5,$A1,$A1,$A1,$A1
db $A1,$A1,$A1,$A1,$A6,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A7,$A1,$A1,$A1,$A1
db $A1,$A1,$A1,$A2,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A3,$A1,$A1,$A1
db $A1,$A1,$A1,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A5,$A1,$A1,$A1
.end

BackgroundGFX_Bonfire_11_52A8:
incbin "GFX/Backgrounds/BG_Bonfire.bin"
.end

BackgroundTilemap_Bonfire_11_57A8:
db $A1,$A2,$A3,$A3,$A4,$A1,$A5,$A6,$A7,$A8,$A1,$A4,$A3,$A4,$A4,$A2,$A1,$A2,$A3,$A2
db $A4,$A4,$A2,$A2,$A4,$A5,$A9,$AA,$AB,$AC,$AD,$A4,$A4,$A1,$A4,$A3,$A4,$A4,$A2,$A4
db $A4,$A4,$A4,$A4,$A4,$A6,$AE,$AF,$B0,$B1,$B2,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4
db $A4,$A4,$A4,$A4,$A5,$B3,$B4,$B5,$B6,$B7,$B4,$AD,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4
db $B8,$B9,$A4,$A4,$A9,$BA,$BB,$BC,$BD,$BE,$BB,$B2,$A4,$A4,$A4,$A4,$BF,$C0,$C1,$A4
db $C2,$C3,$C4,$C5,$C6,$B7,$C7,$C8,$C9,$CA,$C7,$CB,$A4,$CC,$CD,$A4,$CE,$CF,$D0,$A4
db $D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$D7,$DB,$DC,$DD,$DE,$A4,$DF,$E0,$A4,$A4
db $E1,$E2,$E3,$E4,$E5,$E6,$E7,$E6,$E8,$E8,$E7,$E9,$EA,$EB,$EC,$ED,$EE,$EF,$D0,$A4
.end

BackgroundGFX_SchoolTheater_11_5848:
incbin "GFX/Backgrounds/BG_SchoolTheater.bin"
.end

BackgroundTilemap_SchoolTheater_11_5D58:
db $A1,$A2,$A0,$A0,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$A0,$B0,$A1
db $A0,$A0,$A0,$A0,$A0,$B1,$B2,$B3,$B4,$A0,$B5,$AA,$B6,$B6,$B6,$AB,$B7,$B8,$B9,$BA
db $AF,$A0,$BB,$A0,$A0,$BC,$A0,$BD,$BE,$BF,$B5,$AA,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7
db $AC,$AD,$AE,$AF,$B0,$BC,$C8,$C9,$CA,$CB,$B5,$AA,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3
db $B6,$B6,$AB,$D4,$B8,$BC,$D5,$D6,$D7,$D7,$B5,$D8,$D9,$D1,$D2,$D3,$DA,$DB,$DC,$DD
db $C1,$C2,$C3,$C4,$C5,$BC,$DE,$DF,$E0,$E1,$B5,$E2,$E3,$DB,$DC,$DD,$E4,$E5,$E6,$E7
db $CD,$CE,$CF,$D0,$D1,$BC,$D5,$D6,$D7,$D7,$B5,$E2,$E3,$E5,$E6,$E7,$E8,$E9,$EA,$EB
db $D1,$EC,$ED,$EE,$EF,$BC,$DE,$DF,$E0,$E1,$B5,$E2,$F0,$E9,$EA,$EB,$D0,$D1,$D2,$D3
.end

BackgroundGFX_Neighborhood_11_5DF8:
incbin "GFX/Backgrounds/BG_Neighborhood.bin"
.end

BackgroundTilemap_Neighborhood_11_6288:
db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
db $AC,$AD,$A1,$A2,$A3,$AE,$AF,$A8,$B0,$B1,$A9,$AA,$B2,$A0,$A0,$A0,$A0,$A0,$A0,$A0
db $B3,$AC,$B0,$B1,$A1,$A2,$A3,$B4,$B5,$B6,$B0,$B1,$B7,$B2,$A0,$A0,$A0,$A0,$A0,$A0
db $B8,$B3,$B9,$BA,$B0,$B1,$A1,$A2,$BB,$BC,$BD,$BE,$B0,$BF,$A0,$A0,$A0,$A0,$A0,$A0
db $C0,$C1,$B8,$C2,$C3,$B6,$B0,$B1,$C4,$C5,$C6,$C7,$C8,$C9,$C9,$CA,$A0,$A0,$A0,$A0
db $CB,$CB,$C0,$CC,$CD,$CE,$CF,$BE,$B0,$D0,$D1,$D2,$D3,$D4,$D4,$D5,$D6,$D7,$A0,$A0
db $CB,$CB,$CB,$CB,$D8,$D9,$DA,$C7,$C8,$B0,$B1,$DB,$DC,$DD,$DD,$DE,$DF,$E0,$E1,$A0
db $CB,$CB,$CB,$CB,$D8,$E2,$E3,$D2,$D3,$BD,$B6,$B0,$B1,$E4,$E5,$AC,$B3,$E6,$E7,$E8
.end

BackgroundGFX_Park_11_6328:
incbin "GFX/Backgrounds/BG_Park.bin"
.end

BackgroundTilemap_Park_11_6868:
db $A0,$A1,$A2,$A3,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A4,$A0,$A0,$A0,$A0,$A0
db $A3,$A0,$A5,$A0,$A0,$A0,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A5,$A0,$A1,$A2
db $A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$A9,$AE,$AF,$A6,$A7,$AA,$AB,$B0,$A8,$A9,$AE,$AF
db $B1,$B1,$B2,$B3,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$B3,$B3,$B4,$B8,$BB,$B3,$B8,$B9
db $BC,$BD,$BE,$BE,$BE,$BF,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$C3,$C4
db $CC,$CD,$CE,$CF,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$D7,$DA,$D9,$D7,$D8
db $DB,$DC,$DD,$DE,$DE,$DF,$E0,$E1,$A0,$A0,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$B6
db $EB,$EC,$A0,$A0,$A0,$A0,$ED,$EE,$A0,$A0,$EF,$F0,$F0,$F0,$F1,$F2,$F3,$EF,$F0,$F0
.end

BackgroundGFX_River_11_6908:
incbin "GFX/Backgrounds/BG_River.bin"
.end

BackgroundTilemap_River_11_6E68:
db $A1,$A2,$A3,$A1,$A1,$A2,$A3,$A4,$A2,$A3,$A3,$A2,$A4,$A2,$A4,$A3,$A2,$A1,$A4,$A2
db $A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5,$A5
db $A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$B0,$AE,$B1,$B2,$A6,$A7,$A8,$A9,$AA,$AB
db $B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$A0,$BC,$BD,$BE,$BF,$C0,$C1,$C2,$C2,$B3,$B4
db $C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5
db $D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$E2,$E3,$E3,$E4
db $E3,$E5,$E3,$E3,$E3,$E6,$E3,$E3,$E3,$E3,$E3,$E3,$E3,$E7,$E8,$E9,$EA,$EB,$EC,$ED
db $EE,$EF,$F0,$E3,$F1,$F2,$E3,$E3,$E3,$E3,$E3,$E4,$F3,$EB,$EC,$ED,$F4,$F5,$A0,$A0
.end

BackgroundGFX_NightRiver_11_6F08:
incbin "GFX/Backgrounds/BG_NightRiver.bin"
.end

BackgroundTilemap_NightRiver_11_7188:
db $A1,$A2,$A3,$A2,$A2,$A2,$A3,$A2,$A2,$A3,$A4,$A3,$A5,$A2,$A5,$A2,$A2,$A2,$A3,$A2
db $A5,$A2,$A2,$A3,$A4,$A3,$A5,$A1,$A2,$A3,$A2,$A2,$A2,$A3,$A2,$A3,$A4,$A3,$A5,$A2
db $A2,$A4,$A2,$A5,$A2,$A2,$A3,$A3,$A2,$A2,$A2,$A5,$A2,$A2,$A2,$A3,$A2,$A2,$A2,$A1
db $A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2
db $A6,$A7,$A8,$A8,$A9,$A7,$A8,$A9,$A7,$A8,$A8,$A7,$A9,$A7,$A6,$A8,$A7,$A9,$A9,$A6
db $AA,$AA,$AB,$AB,$AB,$AB,$AB,$AB,$AA,$AB,$AB,$AB,$AA,$AB,$AA,$AB,$AB,$AB,$AB,$AA
db $AC,$AD,$AE,$AF,$B0,$AF,$B1,$B2,$B3,$B4,$B4,$B5,$B6,$B7,$AC,$AD,$AE,$AF,$B0,$AF
db $B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$B8,$B8,$B9,$BA
.end

BackgroundGFX_ArcadeEntrance_11_7228:
incbin "GFX/Backgrounds/BG_ArcadeEntrance.bin"
.end

BackgroundTilemap_ArcadeEntrance_11_7688:
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1
db $A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2
db $A3,$A4,$A3,$A4,$A3,$A4,$A3,$A4,$A3,$A4,$A3,$A4,$A3,$A4,$A5,$A6,$A3,$A4,$A3,$A4
db $A7,$A8,$A9,$AA,$AB,$AB,$AB,$AB,$AB,$AC,$AD,$AE,$AE,$AF,$B0,$B1,$B2,$B3,$B3,$B3
db $B4,$B5,$B6,$B7,$B8,$AB,$AB,$AB,$AB,$AC,$B9,$BA,$BB,$BC,$B0,$B1,$BD,$BE,$BF,$C0
db $C1,$C2,$C3,$C4,$C5,$C6,$C7,$C6,$C7,$C8,$C9,$CA,$CA,$CB,$B0,$B1,$CC,$CD,$CE,$CF
db $D0,$D1,$D2,$D3,$D4,$D5,$D6,$D5,$D6,$D7,$D8,$C1,$D0,$D1,$B0,$B1,$D9,$DA,$DB,$DC
db $DD,$DE,$DF,$AB,$AB,$E0,$E1,$E0,$E1,$E2,$E3,$D0,$DD,$DE,$B0,$B1,$E4,$E5,$E5,$E5
.end