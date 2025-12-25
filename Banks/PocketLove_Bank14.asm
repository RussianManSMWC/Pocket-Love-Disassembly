;PRG ROM $50000-$53FFF
;background art

SECTION "bank 14", ROMX, BANK[$14]

PointerWithSize BackgroundGFX_ScenicRoadWithered_14_4050 ;autumn and winter
PointerWithSize BackgroundTilemap_ScenicRoadWithered_14_45F0

PointerWithSize BackgroundGFX_BoatRide_14_4690
PointerWithSize BackgroundTilemap_BoatRide_14_4900

PointerWithSize BackgroundGFX_Monkeys_14_49A0
PointerWithSize BackgroundTilemap_Monkeys_14_4F20

PointerWithSize BackgroundGFX_TallBuildings_14_4FC0
PointerWithSize BackgroundTilemap_TallBuildings_14_5550

PointerWithSize BackgroundGFX_UrbanStreet_14_55F0 ;some kind of urban street?
PointerWithSize BackgroundTilemap_UrbanStreet_14_5BF0

PointerWithSize BackgroundGFX_Room_14_5C90 ;some kind of room with a table and cushions.
PointerWithSize BackgroundTilemap_Room_14_6230

PointerWithSize BackgroundGFX_ShrinePhoto_14_62D0
PointerWithSize BackgroundTilemap_ShrinePhoto_14_6790

PointerWithSize BackgroundGFX_HalloweenParty_14_6830
PointerWithSize BackgroundTilemap_HalloweenParty_14_6DB0

PointerWithSize BackgroundGFX_BirthdayParty_14_6E50 ;I think, I mean there are cakes with what appear to be candles and gifts
PointerWithSize BackgroundTilemap_BirthdayParty_14_7330

PointerWithSize BackgroundGFX_SakuraWoods_14_73D0
PointerWithSize BackgroundTilemap_SakuraWoods_14_7910

BackgroundGFX_ScenicRoadWithered_14_4050:
incbin "GFX/Backgrounds/BG_ScenicRoadWithered.bin"
.end

BackgroundTilemap_ScenicRoadWithered_14_45F0:
db $A1,$A2,$A3,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A5,$A6,$A7,$A8
db $A9,$AA,$AB,$AC,$AD,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$AE,$AF,$A2,$B0,$B1
db $A1,$B2,$A3,$A4,$B3,$B4,$B5,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$AE,$B6,$A5,$A6,$B7,$A8
db $A9,$AA,$AB,$AC,$B8,$B9,$BA,$BB,$A0,$A0,$A0,$A0,$A0,$BC,$BD,$BE,$AF,$BF,$C0,$B1
db $C1,$C2,$A7,$C3,$C4,$C5,$C6,$C7,$A0,$A0,$A0,$A0,$C8,$C9,$CA,$BE,$A5,$A2,$CB,$CC
db $C1,$C2,$CD,$CE,$CF,$CF,$D0,$D1,$D2,$D3,$D3,$D4,$D5,$D6,$CE,$CE,$CF,$D7,$CB,$CC
db $D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA
db $EB,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$E1,$E1,$E1,$F2,$E1,$F3,$F4,$F5,$F6,$F7,$F8,$F9
.end

BackgroundGFX_BoatRide_14_4690:
incbin "GFX/Backgrounds/BG_BoatRide.bin"
.end

BackgroundTilemap_BoatRide_14_4900:
db $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A1,$A2,$A3,$A0,$A0,$A0,$A0
db $A2,$A3,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
db $A0,$A0,$A0,$A0,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A1
db $A5,$A6,$A7,$A8,$A9,$A7,$A8,$A7,$AA,$A9,$A7,$A8,$A5,$A6,$A7,$A8,$A9,$A5,$A9,$A7
db $AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB,$AB
db $AC,$AD,$AE,$AF,$B0,$B0,$B0,$B0,$B0,$B0,$B0,$B0,$B0,$B0,$B0,$B0,$B1,$B2,$B3,$B3
db $B4,$A0,$A0,$A0,$B5,$B6,$B7,$B7,$B7,$B7,$B7,$B7,$B7,$B7,$B8,$B9,$BA,$BB,$BC,$B3
db $BB,$BD,$BE,$BF,$C0,$C1,$C2,$C2,$C2,$C2,$C2,$C2,$C2,$C2,$C3,$C4,$C5,$C6,$B3,$B3
.end

BackgroundGFX_Monkeys_14_49A0:
incbin "GFX/Backgrounds/BG_Monkeys.bin"
.end

BackgroundTilemap_Monkeys_14_4F20:
db $A1,$A2,$A3,$A4,$A0,$A5,$A6,$A1,$A7,$A1,$A2,$A3,$A4,$A0,$A8,$A9,$A0,$A0,$A0,$A0
db $AA,$AB,$AC,$AD,$AE,$AF,$B0,$B0,$B0,$AA,$AB,$AC,$AD,$AE,$B1,$B2,$B3,$AE,$B4,$B5
db $B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$B6,$B7,$B8,$B9,$BF,$C0,$BF,$B9,$BA,$BB,$C1
db $C2,$C3,$C4,$C5,$C6,$C4,$C7,$C8,$C9,$CA,$C3,$C4,$C5,$CB,$C5,$CB,$C5,$C6,$C4,$C7
db $CC,$CD,$CE,$CF,$CF,$CF,$CF,$D0,$D1,$D2,$A0,$A0,$A0,$CD,$D3,$D4,$A0,$A0,$A0,$D3
db $CC,$D5,$D6,$D7,$D7,$D7,$D7,$D8,$D9,$DA,$A0,$A0,$A0,$A0,$DB,$DC,$DD,$DE,$DF,$DB
db $E0,$E1,$E2,$E3,$E3,$E3,$E3,$E2,$E4,$E5,$E6,$E7,$E6,$E8,$E9,$E7,$EA,$EB,$EC,$E6
db $ED,$EE,$EF,$F0,$F0,$F0,$F0,$EF,$F1,$F2,$F3,$F3,$F4,$F5,$F6,$F7,$F7,$F7,$F7,$F7
.end

BackgroundGFX_TallBuildings_14_4FC0:
incbin "GFX/Backgrounds/BG_TallBuildings.bin"
.end

BackgroundTilemap_TallBuildings_14_5550:
db $A1,$A1,$A1,$A1,$A2,$A3,$A4,$A0,$A0,$A0,$A0,$A0,$A0,$A5,$A6,$A0,$A0,$A0,$A0,$A0
db $A7,$A7,$A7,$A7,$A8,$A9,$AA,$A0,$A0,$A0,$A0,$A0,$AB,$AC,$AD,$AE,$A0,$A0,$A0,$A0
db $AF,$AF,$AF,$AF,$B0,$B1,$B2,$A0,$A0,$A0,$A0,$A0,$B3,$B4,$B5,$B6,$A0,$A0,$B7,$B8
db $B9,$B9,$B9,$B9,$BA,$BB,$BC,$A0,$A0,$A0,$A0,$A0,$BD,$BE,$BF,$C0,$A0,$C1,$C2,$C3
db $C4,$C4,$C4,$C4,$C5,$C6,$C7,$A0,$A0,$A0,$A0,$A0,$A0,$C8,$C9,$A0,$A0,$CA,$CB,$CC
db $CD,$CE,$CE,$CE,$CF,$D0,$D1,$D2,$D3,$A0,$A0,$A0,$A0,$D4,$D5,$A0,$A0,$D6,$D7,$D8
db $D9,$DA,$DB,$DB,$DC,$DD,$DE,$DF,$E0,$A0,$A0,$A0,$E1,$E2,$E3,$E4,$A0,$E5,$E6,$E7
db $E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF,$F0,$A0,$A0,$A0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8
.end

BackgroundGFX_UrbanStreet_14_55F0:
incbin "GFX/Backgrounds/BG_UrbanStreet.bin"
.end

BackgroundTilemap_UrbanStreet_14_5BF0:
db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A0,$A0,$A0,$A0,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$B0
db $B1,$B2,$A3,$B3,$B4,$B5,$B6,$B7,$A0,$A0,$A0,$A0,$B8,$B9,$BA,$BB,$BC,$BD,$BE,$BF
db $C0,$C1,$A3,$C2,$C3,$C4,$C5,$B7,$A0,$A0,$A0,$A0,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD
db $CE,$CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$CE,$CE
db $DE,$DE,$DF,$E0,$DE,$DF,$E1,$E2,$A0,$A0,$A0,$A0,$E3,$E4,$E5,$DE,$E6,$E5,$DE,$DE
db $DE,$DE,$E7,$E8,$E9,$EA,$EB,$A0,$A0,$A0,$A0,$A0,$EC,$ED,$EE,$EF,$F0,$F1,$DE,$DE
db $DE,$F2,$F3,$F4,$F5,$F6,$F7,$F6,$F7,$F6,$F7,$F6,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$DE
db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
.end

BackgroundGFX_Room_14_5C90:
incbin "GFX/Backgrounds/BG_Room.bin"
.end

BackgroundTilemap_Room_14_6230:
db $A1,$A2,$A3,$A4,$A4,$A5,$A5,$A5,$A5,$A4,$A4,$A5,$A5,$A5,$A5,$A4,$A4,$A6,$A7,$A8
db $A9,$AA,$AB,$AC,$AD,$AD,$AE,$AF,$AF,$AF,$AF,$B0,$AF,$AF,$AF,$AF,$B0,$B1,$B2,$B2
db $B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BB,$BB,$BC,$BD,$BE,$BF,$BE,$C0,$C1,$B2,$B2
db $B3,$C2,$C3,$B6,$C4,$C5,$B9,$C6,$B2,$B2,$B2,$C7,$C8,$A0,$C9,$A0,$CA,$C1,$B2,$B2
db $B3,$C2,$CB,$B6,$CC,$CD,$B9,$CE,$CF,$D0,$CF,$D1,$D2,$A0,$C9,$A0,$D3,$C1,$B2,$B2
db $D4,$D5,$D6,$B6,$D7,$D8,$D9,$D2,$A0,$C9,$A0,$D3,$DA,$DB,$DC,$DB,$DD,$C1,$B2,$B2
db $DE,$DF,$E0,$E1,$E2,$E3,$E4,$E4,$E4,$E4,$E4,$E4,$E5,$E6,$E7,$E6,$E8,$E9,$EA,$B2
db $EB,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$F2,$F2,$F2,$F3,$F4,$F5,$EE,$F6,$A0,$F7,$F8,$F9
.end

BackgroundGFX_ShrinePhoto_14_62D0:
incbin "GFX/Backgrounds/BG_ShrinePhoto.bin"
.end

BackgroundTilemap_ShrinePhoto_14_6790:
db $A0,$A0,$A0,$A0,$A1,$A2,$A3,$A4,$A0,$A5,$A6,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
db $A0,$A0,$A0,$A7,$A8,$A9,$A9,$AA,$AB,$AC,$AC,$AD,$AE,$AE,$AE,$AE,$AF,$A0,$A0,$A0
db $B0,$B1,$B0,$B2,$B3,$B4,$A9,$B5,$B6,$B7,$B8,$AC,$B9,$BA,$BA,$BA,$BB,$B1,$B0,$B1
db $A9,$A9,$BC,$BD,$BE,$BF,$C0,$C1,$C2,$C3,$C3,$C4,$C5,$C6,$C7,$C8,$BA,$C9,$A9,$A9
db $A9,$CA,$CB,$CB,$CC,$CD,$CE,$CF,$D0,$CB,$CB,$D1,$D2,$D1,$D3,$D4,$CB,$CB,$D5,$A9
db $A9,$A9,$D6,$D6,$D7,$D8,$D9,$DA,$DB,$D6,$D6,$DB,$DC,$DB,$D3,$D6,$D6,$D6,$A9,$A9
db $A9,$DD,$DD,$DD,$DD,$DE,$DF,$E0,$E1,$E1,$E1,$E1,$DD,$DD,$DD,$DD,$DD,$DD,$DD,$A9
db $E2,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EB,$E2,$E2,$E2,$E2,$E2,$E2,$E2,$E2
.end

BackgroundGFX_HalloweenParty_14_6830:
incbin "GFX/Backgrounds/BG_HalloweenParty.bin"
.end

BackgroundTilemap_HalloweenParty_14_6DB0:
db $A1,$A0,$A1,$A0,$A2,$A3,$A4,$A5,$A4,$A5,$A4,$A5,$A2,$A3,$A1,$A0,$A0,$A1,$A0,$A0
db $A0,$A0,$A0,$A1,$A2,$A3,$A6,$A7,$A6,$A7,$A6,$A7,$A2,$A3,$A0,$A1,$A0,$A8,$A9,$A1
db $AA,$AB,$AC,$AD,$A2,$A3,$AE,$AF,$AE,$AF,$AE,$AF,$A2,$A3,$A0,$B0,$B1,$B2,$B3,$A0
db $B4,$B5,$B6,$B7,$B8,$B9,$BA,$BA,$BA,$BA,$BA,$BA,$B8,$B9,$A0,$BB,$BC,$BD,$BE,$BF
db $C0,$C1,$C2,$C3,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$C4,$C5,$C6,$C7,$C8
db $C9,$CA,$CB,$CC,$A0,$A0,$CD,$CE,$CF,$D0,$D1,$D2,$D3,$D2,$D3,$D4,$D5,$D6,$D7,$D8
db $D9,$DA,$DB,$DC,$A0,$A0,$DD,$DE,$DF,$E0,$E1,$E2,$E3,$E2,$E4,$E5,$E6,$E7,$E8,$E9
db $EA,$DB,$DB,$EB,$EC,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$F1,$F1,$F3,$F4,$F5,$E6,$F6,$F7
.end

BackgroundGFX_BirthdayParty_14_6E50:
incbin "GFX/Backgrounds/BG_BirthdayParty.bin"
.end

BackgroundTilemap_BirthdayParty_14_7330:
db $A0,$A1,$A2,$A3,$A4,$A3,$A4,$A1,$A2,$A0,$A0,$A0,$A1,$A2,$A3,$A4,$A3,$A4,$A1,$A2
db $A0,$A1,$A2,$A5,$A6,$A5,$A6,$A1,$A2,$A0,$A0,$A0,$A1,$A2,$A5,$A6,$A5,$A6,$A1,$A2
db $A0,$A7,$A8,$A9,$A9,$A9,$A9,$A7,$A8,$A0,$A0,$A0,$A7,$A8,$A9,$A9,$A9,$A9,$A7,$A8
db $AA,$AB,$A0,$A0,$A0,$AC,$AD,$A0,$A0,$AE,$AF,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
db $B0,$B1,$A0,$B2,$B3,$B4,$B5,$B3,$B6,$B7,$B8,$B3,$B9,$A0,$A0,$A0,$A0,$A0,$A0,$BA
db $BB,$BC,$BD,$BE,$BF,$C0,$C1,$BF,$C2,$C0,$C1,$C3,$C4,$A0,$C5,$C6,$C7,$C8,$C9,$CA
db $CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DD
db $DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$E2,$E3,$E4,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$ED
.end

BackgroundGFX_SakuraWoods_14_73D0:
incbin "GFX/Backgrounds/BG_SakuraWoods.bin"
.end

BackgroundTilemap_SakuraWoods_14_7910:
db $A1,$A0,$A0,$A0,$A0,$A2,$A0,$A0,$A0,$A0,$A0,$A0,$A3,$A4,$A5,$A0,$A6,$A7,$A8,$A9
db $AA,$AB,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A2,$AC,$AD,$AE,$A6,$AF,$B0,$B1,$B2
db $B3,$B4,$B5,$B6,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$B7,$B8,$B9,$AF,$BA,$BB,$BC,$BD
db $BE,$BF,$C0,$A0,$A0,$A0,$AC,$A0,$A0,$A0,$A0,$A0,$A0,$A3,$B8,$C1,$C2,$C3,$C4,$C5
db $C6,$C7,$C8,$C9,$A2,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A1,$A0,$AC,$CA,$CB,$CC,$CD,$CE
db $CF,$D0,$D1,$D2,$D3,$B7,$D4,$D5,$D6,$D7,$A0,$A0,$A0,$A0,$D8,$B6,$D9,$DA,$DB,$DC
db $DD,$DE,$DF,$E0,$C0,$E1,$E2,$E3,$E4,$E5,$E6,$B7,$AC,$A0,$A0,$A0,$D4,$D5,$D6,$E7
db $E8,$E9,$C6,$C7,$C8,$EA,$BA,$EB,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$E1,$E2,$E3,$E4,$F3
.end