;PRG ROM $48000-$4BFFF
;background art

SECTION "bank 12", ROMX, BANK[$12]

POINTERS_12_4000:
PointerWithSize BackgroundGFX_Arcade_12_4058
PointerWithSize BackgroundTilemap_Arcade_12_4508

PointerWithSize BackgroundGFX_KaraokeEntrance_12_45A8
PointerWithSize BackgroundTilemap_KaraokeEntrance_12_4A98

PointerWithSize BackgroundGFX_Karaoke_12_4B38
PointerWithSize BackgroundTilemap_Karaoke_12_50C8

PointerWithSize BackgroundGFX_ShoppingDistrict_12_5168
PointerWithSize BackgroundTilemap_ShoppingDistrict_12_5708

PointerWithSize BackgroundGFX_CafeEntrance_12_57A8
PointerWithSize BackgroundTilemap_CafeEntrance_12_5CF8

PointerWithSize BackgroundGFX_Cafe_12_5D98
PointerWithSize BackgroundTilemap_Cafe_12_61C8

PointerWithSize BackgroundGFX_ToyStore_12_6268
PointerWithSize BackgroundTilemap_ToyStore_12_67D8

PointerWithSize BackgroundGFX_GeneralStore_12_6878
PointerWithSize BackgroundTilemap_GeneralStore_12_6C38

PointerWithSize BackgroundGFX_PetStore_12_6CD8
PointerWithSize BackgroundTilemap_PetStore_12_7028

PointerWithSize BackgroundGFX_MediaStore_12_70C8
PointerWithSize BackgroundTilemap_MediaStore_12_7648

PointerWithSize BackgroundGFX_SportsStore_12_76E8
PointerWithSize BackgroundTilemap_SportsStore_12_7A98

BackgroundGFX_Arcade_12_4058:
incbin "GFX/Backgrounds/BG_Arcade.bin"
.end

BackgroundTilemap_Arcade_12_4508:
db $A1,$A2,$A3,$A1,$A4,$A5,$A6,$A7,$A8,$A8,$A8,$A8,$A8,$A8,$A2,$A3,$A1,$A2,$A3,$A1
db $A9,$AA,$AB,$A9,$AC,$AD,$AE,$AF,$B0,$B1,$B1,$B2,$B3,$B4,$AE,$AF,$B0,$B1,$B1,$B2
db $B5,$B6,$B7,$B5,$B8,$B9,$BA,$BB,$BC,$BD,$BD,$BE,$BF,$C0,$BA,$BB,$BC,$BD,$BD,$BE
db $C1,$C2,$C3,$C1,$C4,$C5,$C6,$C7,$C7,$C7,$C7,$C7,$C7,$C8,$C6,$C7,$C7,$C7,$C7,$C7
db $C9,$CA,$CB,$C9,$CC,$CD,$CE,$CF,$D0,$D0,$D0,$D0,$D1,$D2,$CE,$CF,$D0,$D0,$D0,$D0
db $D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DD,$DE,$DF,$D9,$DA,$DB,$DC,$DD,$DD
db $E0,$E1,$E2,$E3,$E4,$E5,$D9,$E6,$DD,$DD,$DD,$DD,$E7,$DF,$D9,$E6,$DD,$DD,$DD,$DD
db $E1,$E8,$E9,$E8,$EA,$E8,$D9,$E6,$DD,$DD,$DD,$DD,$E7,$DF,$D9,$E6,$DD,$DD,$DD,$DD
.end

BackgroundGFX_KaraokeEntrance_12_45A8:
incbin "GFX/Backgrounds/BG_KaraokeEntrance.bin"
.end

BackgroundTilemap_KaraokeEntrance_12_4A98:
db $A1,$A2,$A3,$A1,$A4,$A5,$A6,$A7,$A8,$A7,$A9,$AA,$A7,$AB,$AA,$A7,$A6,$AC,$A0,$A0
db $AD,$AE,$AF,$B0,$B1,$A5,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$A6,$AC,$B2,$A0
db $A0,$A0,$B3,$B4,$B5,$A5,$B6,$B7,$B8,$B9,$B8,$B8,$BA,$B8,$B8,$BB,$B6,$BC,$B2,$BD
db $BE,$BF,$C0,$A1,$A4,$A5,$C1,$C2,$C3,$C4,$C3,$C5,$C6,$C7,$C5,$C8,$C1,$C9,$CA,$CB
db $CC,$CD,$CE,$B0,$B1,$A5,$C1,$CF,$D0,$C4,$D0,$D1,$D2,$D3,$D1,$D4,$C1,$C9,$D5,$D6
db $CC,$CD,$B3,$B4,$B5,$A5,$C1,$D7,$D1,$C4,$D1,$D8,$D9,$DA,$DB,$DC,$C1,$C9,$DD,$DD
db $DE,$DF,$E0,$A1,$A4,$A5,$C1,$E1,$DB,$C4,$DB,$E2,$E3,$E4,$E5,$E6,$C1,$C9,$DD,$DD
db $B0,$E7,$E8,$B0,$B1,$A5,$C1,$D7,$D1,$C4,$E9,$EA,$E3,$EB,$D0,$DC,$C1,$EC,$ED,$EE
.end

BackgroundGFX_Karaoke_12_4B38:
incbin "GFX/Backgrounds/BG_Karaoke.bin"
.end

BackgroundTilemap_Karaoke_12_50C8:
db $A1,$A2,$A3,$A4,$A5,$A6,$A3,$A7,$A8,$A9,$AA,$AB,$AC,$A3,$AD,$A5,$AE,$A3,$AF,$B0
db $B1,$B2,$B3,$B4,$B5,$B6,$B4,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BD,$BD,$BD,$BE,$BF,$A0
db $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$A0,$A0,$A0,$A0,$A0,$C2,$A0,$A0
db $C0,$CC,$C2,$CD,$CE,$C5,$CD,$CE,$C5,$A0,$A0,$A0,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$A0
db $C0,$D6,$C2,$D7,$D8,$D9,$D7,$D8,$D9,$A0,$A0,$A0,$CF,$DA,$DB,$DC,$DD,$DE,$DF,$A0
db $C0,$CC,$C2,$CF,$E0,$E1,$E1,$E2,$E3,$A0,$A0,$A0,$CF,$E4,$E5,$E6,$E5,$DE,$DF,$A0
db $C0,$CC,$C2,$CF,$E7,$E8,$E8,$E9,$E3,$A0,$A0,$A0,$CF,$EA,$EB,$EC,$EB,$ED,$DF,$A0
db $C0,$D6,$EE,$EF,$F0,$F1,$F2,$F3,$F4,$A3,$A3,$A3,$A3,$F5,$F6,$F7,$F7,$F8,$DF,$A0
.end

BackgroundGFX_ShoppingDistrict_12_5168:
incbin "GFX/Backgrounds/BG_ShoppingDistrict.bin"
.end

BackgroundTilemap_ShoppingDistrict_12_5708:
db $A1,$A1,$A1,$A2,$A3,$A4,$A5,$A6,$A0,$A0,$A0,$A0,$A7,$A8,$A9,$AA,$AB,$AC,$AC,$AC
db $AD,$AD,$AD,$AE,$A3,$A4,$A5,$A6,$AF,$A0,$A0,$B0,$B1,$B2,$A9,$A0,$AB,$B3,$B3,$B3
db $B4,$B4,$B4,$B5,$B6,$A4,$A5,$A6,$B7,$A0,$A0,$B0,$A7,$B2,$A9,$A0,$AB,$A0,$B8,$B9
db $B3,$B3,$B3,$BA,$BB,$BC,$BD,$BE,$B7,$A0,$A0,$B0,$B1,$B2,$A9,$A0,$AB,$A0,$BF,$C0
db $C1,$C1,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$A0,$C9,$A7,$CA,$CB,$CC,$CD,$CE,$CE,$CE
db $CF,$D0,$CF,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$AB,$CF,$CF,$D0
db $CF,$DE,$CF,$D1,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$DD,$EA,$EB,$CF,$DE
db $EC,$ED,$EC,$EE,$EF,$F0,$F1,$F2,$F3,$F3,$F3,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$EC,$ED
.end

BackgroundGFX_CafeEntrance_12_57A8:
incbin "GFX/Backgrounds/BG_CafeEntrance.bin"
.end

BackgroundTilemap_CafeEntrance_12_5CF8:
db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$A0,$AB,$AC,$AD,$AE,$AF,$B0,$B1,$B2,$B3
db $A5,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$AC,$BB,$BC,$BD,$BE,$BF,$C0,$C1,$C2,$C3,$C4,$C5
db $A9,$AA,$A0,$C6,$C7,$C7,$C8,$C9,$CA,$CB,$B1,$CC,$CD,$CE,$CF,$C5,$D0,$D1,$CC,$C0
db $AC,$D2,$D3,$D4,$D5,$D6,$D7,$B3,$D8,$D9,$CC,$CD,$A0,$DA,$C0,$DB,$DC,$CC,$CD,$C0
db $B0,$B1,$B2,$DD,$DE,$DF,$E0,$C5,$E1,$D9,$CD,$A0,$DC,$E2,$C0,$E3,$CC,$CD,$DC,$C0
db $C2,$C3,$C4,$E4,$E5,$E6,$E7,$C0,$E8,$E9,$A0,$EA,$CC,$EB,$C0,$C0,$CD,$DC,$B2,$C0
db $D0,$D1,$CD,$E3,$CC,$CD,$DC,$C0,$EC,$ED,$EE,$EF,$CD,$F0,$C0,$DB,$DC,$B2,$F1,$C0
db $DC,$CD,$DC,$C0,$CD,$DC,$B2,$C0,$EC,$F2,$F3,$F4,$DC,$E2,$C0,$E3,$B2,$F1,$CD,$C0
.end

BackgroundGFX_Cafe_12_5D98:
incbin "GFX/Backgrounds/BG_Cafe.bin"
.end

BackgroundTilemap_Cafe_12_61C8:
db $A1,$A2,$A3,$A4,$A5,$A6,$A0,$A0,$A1,$A2,$A0,$A0,$A0,$A0,$A0,$A7,$A8,$A9,$A1,$AA
db $A1,$A2,$AB,$AC,$AD,$AE,$AF,$B0,$B1,$B2,$B0,$B3,$AF,$B0,$B3,$B4,$B5,$B6,$A1,$AA
db $A1,$A2,$B7,$B8,$B8,$B9,$BA,$BB,$BC,$BA,$BB,$BC,$BA,$BB,$BC,$BA,$BB,$BC,$A1,$AA
db $BD,$BE,$BF,$C0,$C0,$C0,$C1,$C2,$C3,$C1,$C2,$C3,$C1,$C2,$C3,$C1,$C2,$C3,$A1,$AA
db $C4,$C5,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CA,$CB,$CC,$CA,$CB,$CC,$CA,$CB,$CC,$CD,$CE
db $CF,$D0,$D1,$D2,$D3,$D4,$D4,$D4,$D4,$D4,$D4,$D4,$D4,$D4,$D4,$D4,$D4,$D4,$D4,$D5
db $D6,$D7,$D8,$D9,$DA,$DB,$DC,$DC,$DC,$DC,$DC,$DC,$DC,$DC,$DC,$DC,$DC,$DC,$DD,$DE
db $DF,$DF,$DF,$DF,$E0,$E1,$E1,$E1,$E1,$E1,$E1,$E1,$E1,$E1,$E1,$E1,$E1,$E1,$E1,$E2
.end

BackgroundGFX_ToyStore_12_6268:
incbin "GFX/Backgrounds/BG_ToyStore.bin"
.end

BackgroundTilemap_ToyStore_12_67D8:
db $A1,$A2,$A3,$A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$A5,$A4,$AA,$A2,$AB,$AA,$A2,$AB
db $AC,$AD,$AE,$AC,$AD,$AE,$A4,$A5,$AF,$B0,$B1,$A9,$A5,$A4,$B2,$AD,$B3,$B2,$AD,$B3
db $B4,$B5,$B6,$B4,$B5,$B6,$A4,$A5,$B7,$B8,$B9,$A9,$A5,$A4,$BA,$BB,$BC,$BD,$BE,$BF
db $C0,$C1,$C2,$C0,$C1,$C2,$A4,$A5,$C3,$C3,$C3,$C4,$A5,$A4,$C5,$C1,$C6,$C7,$C8,$C9
db $CA,$CB,$CC,$CA,$CB,$CC,$A4,$A5,$A5,$A5,$A5,$A5,$A5,$A4,$CD,$CE,$CD,$CF,$D0,$D1
db $D2,$D3,$D4,$D5,$D6,$D7,$A4,$A5,$A5,$A5,$A5,$A5,$A5,$D8,$D9,$D2,$D2,$DA,$DB,$DC
db $DD,$DE,$DF,$E0,$E1,$E2,$A4,$A5,$A5,$A5,$A5,$A5,$A5,$E3,$E4,$E5,$E6,$E7,$E8,$E9
db $EA,$EB,$EC,$ED,$EE,$EF,$A4,$A5,$A5,$A5,$A5,$A5,$A5,$F0,$F1,$F2,$F3,$F4,$F5,$F6
.end

BackgroundGFX_GeneralStore_12_6878:
incbin "GFX/Backgrounds/BG_GeneralStore.bin"
.end

BackgroundTilemap_GeneralStore_12_6C38:
db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$A8,$A9,$A8,$AA,$AA,$AA,$AA,$AA,$AB,$AB,$AB
db $A3,$A4,$A5,$A6,$A7,$AC,$A1,$AD,$AE,$AF,$AE,$AF,$B0,$B0,$B1,$B2,$B0,$B3,$B3,$B3
db $A5,$A6,$A7,$AC,$A1,$A2,$A3,$B4,$B5,$B6,$B7,$B4,$B5,$B6,$B7,$B8,$B9,$B6,$B7,$B4
db $A7,$AC,$A1,$A2,$A3,$A4,$A5,$BA,$BB,$BC,$BD,$BA,$BB,$BC,$BD,$BE,$BF,$C0,$C1,$C2
db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$C3,$C4,$C5,$C6,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$CA,$C8
db $A3,$A4,$A5,$A6,$A7,$AC,$A1,$CB,$BB,$BC,$BD,$BA,$BB,$BC,$CC,$CD,$CE,$CF,$CD,$CE
db $A5,$A6,$A7,$AC,$A1,$A2,$A3,$D0,$D1,$D2,$D3,$D0,$D1,$D2,$D4,$D5,$C8,$D6,$D5,$C8
db $A7,$AC,$A1,$A2,$A3,$A4,$A5,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D8,$D9,$DA,$DB,$D9,$DA
.end

BackgroundGFX_PetStore_12_6CD8:
incbin "GFX/Backgrounds/BG_PetStore.bin"
.end

BackgroundTilemap_PetStore_12_7028:
db $A1,$A2,$A3,$A4,$A5,$A1,$A2,$A3,$A4,$A5,$A1,$A2,$A3,$A6,$A7,$A8,$A8,$A8,$A8,$A8
db $A9,$AA,$AB,$AC,$AD,$A9,$AA,$AB,$AC,$AD,$A9,$AA,$AB,$AE,$AF,$B0,$B0,$B1,$B2,$B3
db $B4,$B5,$B6,$B7,$B8,$B4,$B5,$B6,$B7,$B8,$B4,$B5,$B6,$B9,$BA,$A7,$A7,$BB,$BC,$BD
db $A1,$A2,$A3,$A4,$A5,$A1,$A2,$A3,$A4,$A5,$A1,$A2,$A3,$A6,$A7,$A7,$BE,$BF,$C0,$A7
db $A9,$AA,$AB,$AC,$AD,$A9,$AA,$AB,$AC,$AD,$A9,$AA,$AB,$AE,$AF,$A8,$C1,$C2,$C3,$A8
db $C4,$C4,$C5,$C5,$C5,$C6,$C7,$C6,$C7,$C5,$C5,$C4,$C4,$C5,$C8,$B0,$B0,$B0,$C9,$B3
db $CA,$CA,$CB,$CB,$CB,$CC,$CD,$CC,$CD,$CB,$CB,$CA,$CA,$CB,$CE,$A7,$CF,$D0,$D1,$BD
db $C4,$C4,$C4,$C4,$C4,$C5,$C5,$C6,$C7,$C6,$C7,$C6,$C7,$C5,$C8,$A7,$D2,$D3,$D4,$A7
.end

BackgroundGFX_MediaStore_12_70C8:
incbin "GFX/Backgrounds/BG_MediaStore.bin"
.end

BackgroundTilemap_MediaStore_12_7648:
db $A1,$A2,$A3,$A4,$A2,$A5,$A1,$A2,$A6,$A7,$A8,$A9,$AA,$AA,$AB,$AC,$AD,$AE,$AF,$B0
db $B1,$B2,$B3,$B4,$B2,$B5,$B1,$B2,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$AC,$BD,$BE,$BF,$C0
db $C1,$C1,$C1,$C2,$C2,$C3,$C3,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$BC,$CA,$CB,$CC,$CD,$CE
db $CF,$CF,$CF,$D0,$D0,$D1,$D1,$D1,$D2,$D3,$D4,$C7,$C8,$C9,$BC,$D5,$D6,$D7,$D8,$D9
db $DA,$DA,$DB,$DC,$DA,$DA,$DD,$DD,$DE,$DF,$D4,$C7,$C8,$C9,$BC,$E0,$E1,$AE,$AF,$B0
db $E2,$E3,$E4,$E5,$E6,$E6,$E7,$E8,$E9,$EA,$EB,$C7,$C8,$C9,$BC,$AC,$BD,$BE,$BF,$C0
db $EC,$ED,$EE,$EF,$EC,$ED,$F0,$F1,$E9,$AA,$AA,$F2,$F3,$F4,$BC,$AC,$AD,$CC,$CD,$CE
db $F5,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F6,$AA,$AA,$AA,$AA,$AA,$F7,$AC,$BD,$D7,$D8,$D9
.end

BackgroundGFX_SportsStore_12_76E8:
incbin "GFX/Backgrounds/BG_SportsStore.bin"
.end

BackgroundTilemap_SportsStore_12_7A98:
db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$AC,$B0,$B1,$AF,$AC
db $B2,$B3,$B4,$A4,$A5,$B5,$A7,$A8,$B6,$B7,$B8,$B9,$B6,$BA,$BB,$B9,$BC,$BD,$BE,$B9
db $BF,$C0,$C1,$C2,$C3,$C4,$A7,$A8,$C5,$C6,$C7,$AC,$B0,$B1,$AF,$AC,$AD,$AE,$AF,$AC
db $A5,$C8,$C9,$CA,$CB,$A4,$A7,$A8,$B6,$BA,$BB,$B9,$BC,$CC,$CD,$B9,$B6,$B7,$B8,$B9
db $A5,$C8,$CE,$CF,$D0,$A4,$D1,$D2,$B0,$B1,$AF,$AC,$A9,$AA,$AB,$AC,$C5,$C6,$C7,$AC
db $D3,$D3,$D3,$D3,$D3,$D3,$D3,$D4,$BC,$CC,$CD,$B9,$BC,$BD,$BE,$B9,$B6,$BA,$BB,$B9
db $D5,$D5,$D5,$D5,$D5,$D6,$D7,$D4,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$AC,$B0,$B1,$AF,$AC
db $D8,$D8,$D8,$D8,$D8,$D9,$DA,$D4,$B6,$B7,$B8,$B9,$B6,$B7,$B8,$B9,$BC,$CC,$CD,$B9
.end