;PRG ROM $4C000-$4FFFF
;background art

SECTION "bank 13", ROMX, BANK[$13]

PointerWithSize BackgroundGFX_1_13_4050
PointerWithSize BackgroundTilemap_1_13_4470

PointerWithSize BackgroundGFX_BurgerJoint_13_4510
PointerWithSize BackgroundTilemap_BurgerJoint_13_4A50

PointerWithSize BackgroundGFX_Planetarium_13_4AF0
PointerWithSize BackgroundTilemap_Planetarium_13_5030

PointerWithSize BackgroundGFX_MovieTheater_13_50D0 ;honestly looks more like an underground area, like a metro or something
PointerWithSize BackgroundTilemap_MovieTheater_13_5230

PointerWithSize BackgroundGFX_MovieTheaterEntrance_13_52D0
PointerWithSize BackgroundTilemap_MovieTheaterEntrance_13_57C0

PointerWithSize BackgroundGFX_AmusementParkEntrance_13_5860
PointerWithSize BackgroundTilemap_AmusementParkEntrance_13_5D90

PointerWithSize BackgroundGFX_AmusementPark_13_5E30
PointerWithSize BackgroundTilemap_AmusementPark_13_63F0

PointerWithSize BackgroundGFX_Beach_13_6490
PointerWithSize BackgroundTilemap_Beach_13_6A20

PointerWithSize BackgroundGFX_Pool_13_6AC0
PointerWithSize BackgroundTilemap_Pool_13_7080

PointerWithSize BackgroundGFX_ScenicRoad_13_7120
PointerWithSize BackgroundTilemap_ScenicRoad_13_76A0

;I currently have no clue what to name this one. something that ends with ulb?
BackgroundGFX_1_13_4050:
incbin "GFX/Backgrounds/BG_13_1.bin"
.end

BackgroundTilemap_1_13_4470:
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A2,$A3,$A4,$A5,$A6,$A3,$A4,$A5,$A6,$A3,$A4
db $A7,$A8,$A7,$A8,$A7,$A8,$A7,$A8,$A9,$AA,$AB,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC
db $AD,$AE,$AF,$B0,$B1,$B2,$B3,$B4,$B5,$AA,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BD,$BE
db $BF,$C0,$AF,$C1,$C2,$C3,$C4,$C5,$B5,$AA,$C6,$C7,$C4,$C2,$C8,$C9,$CA,$CB,$CC,$CD
db $CE,$CF,$AF,$D0,$C8,$D1,$D2,$D3,$B5,$AA,$C6,$D4,$C2,$C8,$C9,$CA,$CB,$CC,$CD,$C4
db $AD,$AE,$AF,$D5,$CB,$D6,$D7,$D8,$B5,$AA,$C6,$D9,$C8,$C9,$CA,$CB,$CC,$CD,$C4,$C2
db $AD,$AE,$AF,$C1,$DA,$DB,$C4,$DC,$B5,$AA,$C6,$DD,$C9,$CA,$CB,$CC,$CD,$C4,$C2,$C8
db $AD,$AE,$AF,$DE,$DF,$E0,$C2,$E1,$B5,$AA,$AB,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC
.end

BackgroundGFX_BurgerJoint_13_4510:
incbin "GFX/Backgrounds/BG_BurgerJoint.bin"
.end

BackgroundTilemap_BurgerJoint_13_4A50:
db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$B0,$B1,$B2,$B3,$B4
db $B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0,$A9,$AA,$C1,$C2,$C3,$C4,$AF,$B0
db $A0,$B6,$B7,$B8,$C5,$C6,$C7,$A1,$A2,$C8,$A3,$C9,$BD,$BE,$CA,$CB,$CC,$CD,$C1,$C2
db $CE,$CF,$B7,$B8,$D0,$B5,$CE,$B5,$B6,$B7,$D1,$D2,$D3,$C8,$A3,$C9,$BD,$D4,$CA,$CB
db $D5,$CF,$B7,$B8,$D6,$CE,$B5,$A0,$B6,$B7,$D7,$D8,$D9,$B7,$D1,$D2,$D3,$C8,$A3,$C9
db $DA,$CF,$B7,$B8,$DB,$B5,$A0,$CE,$CF,$B7,$DC,$DD,$DE,$B7,$DF,$D5,$B5,$B7,$D1,$D2
db $E0,$E1,$B7,$B8,$E2,$E3,$E4,$E5,$E6,$B7,$E7,$E8,$E9,$B7,$B7,$B5,$CE,$B7,$D7,$D8
db $EA,$EB,$B7,$B8,$EC,$ED,$A0,$A0,$EB,$B7,$EE,$EF,$F0,$F1,$F1,$F1,$F2,$F3,$DC,$DD
.end

BackgroundGFX_Planetarium_13_4AF0:
incbin "GFX/Backgrounds/BG_Planetarium.bin"
.end

BackgroundTilemap_Planetarium_13_5030:
db $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9
db $AA,$A8,$A9,$AB,$A0,$A0,$A0,$A0,$A0,$A0,$AC,$AD,$A0,$A0,$A0,$AE,$AF,$B0,$B1,$A0
db $B2,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$B3,$A0,$A0,$A0,$A0,$B4,$AF,$B5,$B6,$A0
db $B7,$B8,$A0,$A0,$A0,$A0,$B9,$A0,$BA,$BB,$BB,$BB,$BB,$BB,$BB,$BB,$BB,$BB,$BC,$BD
db $BE,$BF,$C0,$C1,$C2,$C3,$C4,$C2,$C5,$C6,$C7,$C8,$C9,$C7,$CA,$CB,$C7,$CC,$CD,$CE
db $CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$D9,$DC,$DD,$DE,$DF,$E0,$E1
db $CF,$D0,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$BB,$BB,$BB,$BB,$BB,$BB,$BB,$E9,$EA,$EB,$EC
db $CF,$D0,$E2,$ED,$EE,$EE,$EE,$EE,$EF,$C6,$C7,$C8,$C9,$C7,$CA,$CB,$F0,$F1,$F2,$F3
.end

BackgroundGFX_MovieTheater_13_50D0:
incbin "GFX/Backgrounds/BG_MovieTheater.bin"
.end

BackgroundTilemap_MovieTheater_13_5230:
db $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1
db $A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2,$A2
db $A3,$A4,$A3,$A4,$A3,$A4,$A5,$A6,$A4,$A4,$A3,$A4,$A3,$A4,$A3,$A4,$A5,$A6,$A4,$A4
db $A7,$A8,$A7,$A8,$A7,$A8,$A9,$AA,$AB,$A8,$A7,$A8,$A7,$A8,$A7,$A8,$A9,$AA,$AB,$A8
db $AC,$AD,$AC,$AD,$AC,$AD,$AE,$AA,$AF,$AD,$AC,$AD,$AC,$AD,$AC,$AD,$AE,$AA,$AF,$AD
db $A7,$A8,$A7,$A8,$A7,$A8,$AE,$AA,$AB,$A8,$A7,$A8,$A7,$A8,$A7,$A8,$AE,$AA,$AB,$A8
db $AC,$B0,$B1,$AD,$AC,$AD,$AE,$AA,$AF,$AD,$AC,$B0,$B1,$AD,$AC,$AD,$AE,$AA,$AF,$AD
db $B2,$B3,$B4,$B5,$A7,$A8,$AE,$AA,$AB,$A8,$B2,$B3,$B4,$B5,$A7,$A8,$AE,$AA,$AB,$A8
.end

BackgroundGFX_MovieTheaterEntrance_13_52D0:
incbin "GFX/Backgrounds/BG_MovieTheaterEntrance.bin"
.end

BackgroundTilemap_MovieTheaterEntrance_13_57C0:
db $A1,$A1,$A1,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$B0,$B0
db $A2,$A3,$A4,$A5,$A6,$A7,$B1,$B2,$B3,$B2,$B4,$B5,$B2,$B3,$B2,$B6,$AA,$AB,$AC,$AD
db $A6,$B7,$B8,$B9,$BA,$BA,$BA,$BA,$BA,$BA,$B4,$B5,$BA,$BA,$BA,$BA,$BA,$BA,$BB,$BC
db $BD,$BE,$BE,$BF,$C0,$C1,$C2,$C1,$C2,$C1,$B4,$B5,$C2,$C1,$C2,$C1,$C2,$C1,$C3,$B0
db $C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$B4,$B5,$CC,$CD,$CE,$CF,$D0,$CC,$D1,$B0
db $D2,$D3,$C6,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$B4,$B5,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$B0
db $DA,$E0,$C6,$E1,$E2,$E3,$E4,$E5,$DA,$D9,$B4,$B5,$DA,$D9,$E6,$E7,$E8,$DA,$E9,$B0
db $D9,$EA,$C6,$EB,$EC,$ED,$EE,$D8,$D9,$DA,$B4,$B5,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$B0
.end

BackgroundGFX_AmusementParkEntrance_13_5860:
incbin "GFX/Backgrounds/BG_AmusementParkEntrance.bin"
.end

BackgroundTilemap_AmusementParkEntrance_13_5D90:
db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$A7,$A8,$A0,$A9,$AA,$AB,$A0,$A0,$AC,$AD,$AE,$AF,$A0
db $B0,$B1,$B2,$B3,$B4,$B5,$B6,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$C0,$C1,$C2
db $C3,$C4,$C4,$C3,$C4,$C4,$C3,$C5,$C6,$C7,$C8,$C9,$C6,$C7,$CA,$CB,$CC,$C7,$CA,$CB
db $CD,$CE,$CF,$CD,$CE,$CF,$CD,$D0,$D1,$D2,$D3,$D4,$D1,$D2,$D5,$D6,$D7,$D2,$D5,$D6
db $D8,$D9,$DA,$D8,$D9,$DA,$D8,$D0,$DB,$DC,$DB,$DD,$DE,$DC,$DE,$DE,$DE,$DC,$DE,$DE
db $DF,$E0,$E1,$DF,$E0,$E1,$DF,$D0,$E2,$DC,$E3,$E4,$E5,$DC,$E6,$E5,$E5,$DC,$E6,$E5
db $E7,$E8,$E8,$E7,$E8,$E8,$E7,$E9,$EA,$DC,$EB,$EC,$EA,$DC,$EB,$ED,$EA,$DC,$EB,$ED
db $EE,$A0,$A0,$EE,$A0,$A0,$EE,$EF,$F0,$DC,$EB,$F1,$F0,$DC,$EB,$F2,$F0,$DC,$EB,$F2
.end

BackgroundGFX_AmusementPark_13_5E30:
incbin "GFX/Backgrounds/BG_AmusementPark.bin"
.end

BackgroundTilemap_AmusementPark_13_63F0:
db $A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A0,$A1,$A9,$A9,$A9,$A9,$AA,$AB,$AC,$AD,$AE
db $AF,$B0,$A0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$A9,$B9,$BA,$A9,$BB,$BC,$A0,$BD,$BE
db $BF,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$A9,$C9,$CA,$CB,$C9,$CC,$CD,$AF,$B0,$A1
db $CE,$CF,$CE,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$D8,$DB,$DC,$BF,$C0,$C1
db $DD,$DD,$DD,$DD,$DE,$DF,$DF,$DF,$E0,$E1,$C0,$BF,$C0,$BF,$E2,$E3,$E4,$DD,$DD,$DD
db $E5,$E5,$E5,$E5,$E6,$E7,$E7,$E7,$E8,$E9,$CF,$CE,$CF,$CE,$EA,$EB,$EC,$E5,$E5,$E5
db $ED,$ED,$ED,$ED,$EE,$EF,$F0,$EF,$F1,$F2,$F3,$F4,$F5,$F1,$F2,$F3,$F4,$F5,$F1,$F2
db $F6,$F6,$F6,$F6,$F6,$F6,$F6,$F6,$F7,$F8,$F9,$FA,$FB,$F7,$F8,$F9,$FA,$FB,$F7,$F8
.end

BackgroundGFX_Beach_13_6490:
incbin "GFX/Backgrounds/BG_Beach.bin"
.end

BackgroundTilemap_Beach_13_6A20:
db $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
db $A0,$A0,$A0,$A0,$A0,$A0,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A0,$A0,$A0,$A0,$A0,$A0
db $A0,$A0,$A0,$A9,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$B0,$B1,$B2,$B3,$B4,$B5,$A0,$A0,$A0
db $B6,$B7,$B8,$B9,$B9,$BA,$BB,$BC,$BD,$BE,$BF,$BF,$C0,$C1,$C2,$C2,$C2,$C3,$C3,$C3
db $C4,$C5,$C6,$C7,$C8,$C5,$C4,$C9,$CA,$CB,$CB,$CC,$CC,$CB,$CC,$CB,$CD,$CE,$CF,$D0
db $C5,$D1,$C5,$C8,$C5,$D2,$C5,$C6,$C5,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD
db $DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EB,$EB,$EC,$ED,$EE,$EF
db $F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$F8
.end

BackgroundGFX_Pool_13_6AC0:
incbin "GFX/Backgrounds/BG_Pool.bin"
.end

BackgroundTilemap_Pool_13_7080:
db $A0,$A1,$A2,$A3,$A4,$A5,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$A7,$A8,$A9,$AA,$AB,$AC
db $A0,$AD,$AE,$AF,$B0,$B1,$B1,$B1,$B1,$B1,$B1,$B1,$B1,$B1,$B1,$B2,$B3,$B4,$B5,$AC
db $AD,$AE,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$A0,$A0,$AD,$BD,$BE,$BF,$C0,$C1,$C2,$C3,$AC
db $AE,$B6,$B7,$B8,$C4,$C5,$C6,$C7,$C8,$C9,$C9,$CA,$CB,$CC,$C2,$CD,$CE,$C3,$CF,$AC
db $B6,$B7,$B8,$C4,$C5,$D0,$D1,$D2,$D3,$D3,$D3,$D3,$D4,$D5,$CF,$D6,$D7,$CF,$D8,$AC
db $B7,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E0,$E0,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$C3,$AC
db $E7,$E8,$E9,$EA,$EB,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$F3
db $F4,$F5,$F6,$C3,$C3,$F7,$F8,$F7,$F8,$F7,$F8,$F7,$F9,$FA,$FB,$FB,$FB,$FB,$EF,$F0
.end

BackgroundGFX_ScenicRoad_13_7120:
incbin "GFX/Backgrounds/BG_ScenicRoad.bin"
.end

BackgroundTilemap_ScenicRoad_13_76A0:
db $A1,$A2,$A3,$A4,$A5,$A6,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A7,$A8,$A3,$A4,$A1,$A2
db $A4,$A9,$A1,$A3,$AA,$AB,$AC,$A0,$A0,$A0,$A0,$A0,$A0,$AD,$AE,$AF,$A1,$A3,$A4,$A9
db $B0,$B1,$A3,$B2,$B3,$B4,$B5,$A0,$A0,$A0,$A0,$A0,$A0,$B6,$B4,$B7,$A3,$B2,$B0,$B1
db $B8,$A9,$A1,$A2,$B9,$B4,$AE,$AC,$A0,$A0,$A0,$A0,$AD,$AE,$B4,$BA,$A1,$A2,$B8,$A9
db $BB,$BC,$BD,$BE,$B3,$BF,$AB,$C0,$C1,$A0,$A0,$AD,$C2,$AB,$C3,$B7,$C4,$C5,$C6,$C7
db $C8,$C9,$CA,$CB,$CC,$CC,$CD,$CE,$CF,$D0,$D0,$D1,$D2,$D3,$CB,$CB,$CC,$D4,$D5,$D6
db $D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9
db $EA,$EB,$EC,$ED,$EE,$EF,$F0,$E0,$E0,$E0,$E0,$E0,$E0,$F1,$F2,$F3,$F4,$F5,$F6,$F7
.end