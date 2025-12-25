;PRG ROM $54000-$57FFF
;background art

SECTION "bank 15", ROMX, BANK[$15]

POINTERS_15_4000:
PointerWithSize BackgroundGFX_Festival_15_4068
PointerWithSize BackgroundTilemap_Festival_15_4638

PointerWithSize BackgroundGFX_GhostHouseEntrance_15_46D8
PointerWithSize BackgroundTilemap_GhostHouseEntrance_15_4AA8

PointerWithSize BackgroundGFX_GhostHouse_15_4B48
PointerWithSize BackgroundTilemap_GhostHouse_15_4FB8

PointerWithSize BackgroundGFX_Fireworks_15_5058
PointerWithSize BackgroundTilemap_Fireworks_15_5548

PointerWithSize BackgroundGFX_BaseballCompetition_15_55E8
PointerWithSize BackgroundTilemap_BaseballCompetition_15_5A98

PointerWithSize BackgroundGFX_NoticeBoard_SportsTeamWin_15_5B38
PointerWithSize BackgroundTilemap_NoticeBoard_SportsTeamWin_15_5E18

PointerWithSize BackgroundGFX_NoticeBoard_SportsTeamLose_15_5EB8
PointerWithSize BackgroundTilemap_NoticeBoard_SportsTeamLose_15_6198

PointerWithSize BackgroundGFX_BasketballCompetition_15_6238
PointerWithSize BackgroundTilemap_BasketballCompetition_15_6628

PointerWithSize BackgroundGFX_SoccerCompetition_15_66C8
PointerWithSize BackgroundTilemap_SoccerCompetition_15_6C18

PointerWithSize BackgroundGFX_HandHolding_15_6CB8
PointerWithSize BackgroundTilemap_HandHolding_15_6F68

PointerWithSize BackgroundGFX_ShoulderRuruna_15_7008
PointerWithSize BackgroundTilemap_ShoulderRuruna_15_7428

PointerWithSize BackgroundGFX_ShoulderMizuki_15_74C8
PointerWithSize BackgroundTilemap_ShoulderMizuki_15_78D8

PointerWithSize BackgroundGFX_ShoulderYumi_15_7978
PointerWithSize BackgroundTilemap_ShoulderYumi_15_7D88

BackgroundGFX_Festival_15_4068:
incbin "GFX/Backgrounds/BG_Festival.bin"
.end

BackgroundTilemap_Festival_15_4638:
db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A8,$A7,$A8,$A9,$A8,$A8,$A9,$AA,$AB,$AC,$AD,$AE
db $AF,$B0,$B1,$B2,$B3,$B4,$A9,$A8,$A7,$A8,$A8,$A7,$A6,$A7,$B5,$B6,$B7,$B8,$B0,$AF
db $B9,$BA,$BB,$BC,$BD,$BE,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$A8,$BF,$C0,$C1,$C2,$BA,$B9
db $C3,$BA,$BB,$C4,$C4,$C5,$C6,$C6,$C6,$C6,$C6,$C6,$C6,$C6,$C7,$C8,$C9,$C2,$BA,$B9
db $CA,$BA,$CB,$CC,$CD,$CE,$CF,$D0,$D0,$D0,$D0,$D0,$D0,$D1,$D2,$B9,$D3,$C2,$BA,$B9
db $D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DB,$DB,$DB,$DB,$DB,$DC,$DD,$DE,$DF,$C2,$BA,$B9
db $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E7,$E7,$E7,$E7,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE
db $EF,$F0,$F1,$F2,$F3,$F4,$F5,$F5,$F5,$F5,$F5,$F5,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC
.end

BackgroundGFX_GhostHouseEntrance_15_46D8:
incbin "GFX/Backgrounds/BG_GhostHouseEntrance.bin"
.end

BackgroundTilemap_GhostHouseEntrance_15_4AA8:
db $A1,$A2,$A3,$A4,$A1,$A5,$A6,$A7,$A1,$A8,$A9,$A4,$A1,$AA,$AB,$A4,$AC,$AD,$AE,$A4
db $AF,$B0,$B1,$B2,$AF,$B3,$B4,$B2,$AF,$B5,$B6,$B2,$B7,$B8,$B9,$B2,$BA,$BB,$BC,$B2
db $BD,$BE,$BF,$C0,$BD,$BE,$C1,$C0,$BD,$BE,$C2,$C0,$BD,$BE,$C2,$C0,$BD,$BE,$C1,$C0
db $C3,$C4,$C3,$C4,$C3,$C4,$C3,$C4,$C3,$C4,$C3,$C4,$C3,$C4,$C3,$C4,$C3,$C4,$C3,$C4
db $C5,$C6,$C7,$C8,$C7,$C8,$C7,$C8,$C7,$C8,$C7,$C8,$C7,$C8,$C7,$C8,$C7,$C8,$C9,$C5
db $A0,$CA,$CB,$CC,$CD,$CE,$CB,$CC,$CD,$CE,$CB,$CC,$CD,$CE,$CB,$CC,$CB,$CC,$CF,$A0
db $A0,$CA,$D0,$D0,$D0,$D1,$D2,$D0,$D0,$D1,$D0,$D0,$D2,$D1,$D3,$D4,$D5,$D1,$CF,$A0
db $A0,$CA,$D6,$D7,$D8,$D9,$DA,$D0,$D0,$D9,$D0,$D0,$DA,$D9,$DB,$D0,$DC,$D9,$CF,$A0
.end

BackgroundGFX_GhostHouse_15_4B48:
incbin "GFX/Backgrounds/BG_GhostHouse.bin"
.end

BackgroundTilemap_GhostHouse_15_4FB8:
db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8,$A6,$A6,$A6,$A6,$A6,$A6,$A9,$AA,$AB,$AC,$AD,$A1
db $A1,$A2,$AE,$AF,$B0,$A6,$B1,$B2,$A6,$A6,$A6,$A6,$A6,$A6,$B3,$B4,$AC,$B5,$B6,$B7
db $A1,$A2,$B8,$B9,$BA,$BB,$BC,$BD,$A6,$A6,$A6,$A6,$A6,$A6,$BE,$BF,$C0,$C1,$C1,$C1
db $A1,$A2,$C2,$C3,$C4,$C5,$A6,$A6,$A6,$A6,$A6,$A6,$A7,$A8,$C6,$C7,$C8,$C9,$C9,$C9
db $CA,$CB,$CC,$CD,$CE,$CF,$A9,$A6,$A6,$A6,$A6,$A6,$B1,$B2,$D0,$C7,$C8,$C9,$C9,$C9
db $D1,$D2,$D3,$D4,$CE,$CF,$A6,$A6,$A6,$A6,$A6,$A6,$BC,$BD,$D0,$C7,$C8,$C9,$C9,$C9
db $D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$A9,$A6,$A6,$A6,$DB,$D0,$C7,$C8,$C9,$C9,$C9
db $DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$A6,$A6,$A6,$A6,$E4,$D0,$C7,$C8,$C9,$C9,$C9
.end

BackgroundGFX_Fireworks_15_5058:
incbin "GFX/Backgrounds/BG_Fireworks.bin"
.end

BackgroundTilemap_Fireworks_15_5548:
db $A1,$A1,$A2,$A3,$A4,$A5,$A1,$A1,$A1,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$A1,$A1,$A1
db $A1,$AE,$AF,$B0,$B1,$B2,$A1,$A1,$A1,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$A1,$A1,$A1
db $BB,$BC,$BD,$BE,$BF,$C0,$A1,$A1,$A1,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$A1,$C9,$CA
db $CB,$A1,$CC,$CD,$CE,$CF,$A1,$A1,$A1,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$A1,$D8,$D9
db $A1,$A1,$DA,$DB,$DC,$DD,$A1,$A1,$A1,$DE,$DF,$E0,$E1,$E2,$E3,$E4,$A1,$BB,$E5,$E6
db $A1,$A1,$A1,$E7,$A1,$A1,$BB,$A1,$A1,$A1,$A1,$E8,$E7,$E9,$EA,$A1,$A1,$CB,$A1,$A1
db $EB,$EB,$EB,$EC,$EB,$EB,$ED,$EB,$EB,$EB,$EB,$EC,$EB,$EB,$EB,$EB,$EB,$EB,$EB,$EB
db $EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE
.end

BackgroundGFX_BaseballCompetition_15_55E8:
incbin "GFX/Backgrounds/BG_BaseballCompetition.bin"
.end

BackgroundTilemap_BaseballCompetition_15_5A98:
db $A1,$A0,$A2,$A3,$A0,$A0,$A0,$A0,$A1,$A0,$A0,$A0,$A0,$A2,$A3,$A4,$A0,$A1,$A0,$A0
db $A5,$A6,$A6,$A6,$A5,$A7,$A0,$A4,$A8,$A9,$A8,$AA,$A0,$A8,$A8,$A7,$A0,$A9,$AB,$A0
db $AC,$AD,$AD,$AD,$AE,$AF,$B0,$AF,$B0,$B1,$B0,$B0,$B2,$B2,$B3,$AF,$B3,$B4,$B5,$AF
db $B6,$B7,$B8,$B9,$BA,$BB,$B8,$BC,$BD,$BE,$B8,$BB,$BF,$C0,$C1,$BF,$BF,$C2,$C3,$C4
db $C5,$C6,$C5,$C7,$C8,$C5,$C5,$C5,$C9,$C5,$C5,$C5,$C5,$CA,$CB,$CC,$CD,$CE,$CF,$D0
db $B2,$B2,$D1,$D2,$D3,$D4,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$D5,$D6,$D7,$D8,$D9,$DA,$DB
db $B2,$B2,$B2,$B2,$DC,$DD,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$DE,$DF,$E0,$E1,$E2,$E3,$B2
db $B2,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$B2
.end

BackgroundGFX_NoticeBoard_SportsTeamWin_15_5B38:
incbin "GFX/Backgrounds/BG_NoticeBoard_SportsTeamWin.bin"
.end

BackgroundTilemap_NoticeBoard_SportsTeamWin_15_5E18:
db $A0,$A0,$A1,$A2,$A3,$A4,$A5,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AB,$A5,$AE,$A0
db $A0,$A0,$A1,$A3,$A4,$A3,$A5,$A5,$AF,$B0,$B0,$B1,$B2,$AB,$B3,$B4,$AB,$A5,$AE,$A0
db $A0,$A0,$A1,$B5,$B6,$B7,$A5,$A5,$AF,$B0,$B0,$B8,$B9,$AB,$BA,$BB,$AB,$A5,$AE,$A0
db $A0,$A0,$A1,$A5,$BC,$BD,$A5,$A5,$AF,$B0,$B0,$BE,$BF,$AB,$C0,$C1,$AB,$A5,$AE,$A0
db $A0,$A0,$A1,$A5,$C2,$C2,$A5,$A5,$A0,$C3,$C3,$C4,$C5,$AB,$C6,$C6,$A0,$A5,$AE,$A0
db $A0,$A0,$A1,$A5,$B5,$B7,$A5,$A5,$C7,$C8,$C9,$C9,$C9,$C9,$C9,$C8,$CA,$A5,$AE,$A0
db $A0,$A0,$CB,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CD,$A0
db $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
.end

BackgroundGFX_NoticeBoard_SportsTeamLose_15_5EB8:
incbin "GFX/Backgrounds/BG_NoticeBoard_SportsTeamLose.bin"
.end

BackgroundTilemap_NoticeBoard_SportsTeamLose_15_6198:
db $A0,$A0,$A1,$A2,$A3,$A4,$A2,$A2,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AA,$A2,$AD,$A0
db $A0,$A0,$A1,$A2,$AE,$AF,$A2,$A2,$B0,$B1,$B1,$B2,$B3,$AA,$B4,$B5,$AA,$A2,$AD,$A0
db $A0,$A0,$A1,$A2,$B6,$B7,$A2,$A2,$B0,$B1,$B1,$B8,$B9,$AA,$BA,$BB,$AA,$A2,$AD,$A0
db $A0,$A0,$A1,$A3,$AF,$B1,$A4,$A2,$B0,$B1,$B1,$BC,$BD,$AA,$BE,$BF,$AA,$A2,$AD,$A0
db $A0,$A0,$A1,$C0,$B1,$C0,$AA,$A2,$A0,$C1,$C1,$C2,$C3,$AA,$C4,$C5,$A0,$A2,$AD,$A0
db $A0,$A0,$A1,$B6,$C6,$C6,$B7,$A2,$C7,$C8,$C9,$C9,$C9,$C9,$C9,$C8,$CA,$A2,$AD,$A0
db $A0,$A0,$CB,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CD,$A0
db $A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
.end

BackgroundGFX_BasketballCompetition_15_6238:
incbin "GFX/Backgrounds/BG_BasketballCompetition.bin"
.end

BackgroundTilemap_BasketballCompetition_15_6628:
db $A1,$A1,$A2,$A1,$A1,$A2,$A2,$A3,$A2,$A3,$A2,$A1,$A1,$A3,$A3,$A2,$A1,$A3,$A1,$A3
db $A4,$A5,$A5,$A6,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A5,$A6,$A4,$A4,$A4
db $A7,$A8,$A9,$AA,$AB,$AC,$AD,$AD,$AE,$AD,$AD,$AE,$AD,$AD,$AE,$AD,$AD,$AE,$AD,$AD
db $AF,$B0,$B1,$B2,$B3,$B4,$A0,$A0,$B4,$A0,$A0,$B4,$A0,$A0,$B4,$A0,$A0,$B5,$B6,$A0
db $B7,$B8,$B9,$BA,$BB,$BC,$BD,$A0,$B4,$A0,$A0,$B4,$A0,$A0,$B4,$BE,$BF,$C0,$C1,$A0
db $A0,$C2,$C3,$C4,$C5,$C6,$C7,$A0,$C8,$A0,$A0,$C8,$A0,$A0,$C8,$A0,$C9,$CA,$CB,$A0
db $CC,$CD,$CE,$CF,$D0,$D1,$D2,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC,$D3,$D4,$D5,$D6,$CC
db $D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7,$D7
.end

BackgroundGFX_SoccerCompetition_15_66C8:
incbin "GFX/Backgrounds/BG_SoccerCompetition.bin"
.end

BackgroundTilemap_SoccerCompetition_15_6C18:
db $A1,$A1,$A1,$A2,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
db $A3,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$A9,$AA,$AB,$A8,$AB,$A8,$AB,$A8,$A9,$AA,$AB,$A8
db $AC,$AD,$A5,$AE,$AF,$B0,$AF,$B0,$AF,$B0,$AF,$B0,$AF,$B0,$AF,$B0,$B1,$B0,$AF,$B0
db $B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$B6,$B7,$B6,$B7,$BA,$B7,$B6,$BB,$BC,$BD,$BE,$BF
db $C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C4,$C5,$C4,$C8,$C9,$CA,$C4,$CB,$CC,$CD,$CE,$CF
db $D0,$D1,$D2,$D3,$D4,$D4,$D5,$D6,$D7,$D8,$A5,$A5,$D9,$DA,$A5,$A5,$DB,$DC,$DD,$DE
db $DF,$E0,$E1,$E2,$A5,$A5,$E3,$E4,$E5,$E6,$D8,$A5,$E7,$E8,$A5,$E9,$EA,$EB,$EC,$ED
db $A5,$EE,$EF,$A5,$A5,$A5,$F0,$A5,$A5,$A5,$E6,$D8,$A5,$A5,$A5,$F1,$F2,$F3,$F4,$A5
.end

BackgroundGFX_HandHolding_15_6CB8:
incbin "GFX/Backgrounds/BG_HandHolding.bin"
.end

BackgroundTilemap_HandHolding_15_6F68:
db $A1,$A2,$A3,$A4,$A3,$A4,$A3,$A4,$A3,$A4,$A5,$A6,$A7,$A8,$A3,$A4,$A7,$A4,$A1,$A2
db $A5,$A6,$A7,$A4,$A7,$A8,$A1,$A2,$A7,$A9,$AA,$AB,$AC,$AD,$A7,$A4,$A4,$A8,$A5,$A6
db $A3,$A4,$A3,$A4,$A4,$A7,$A5,$A6,$AE,$AF,$B0,$B1,$B2,$A4,$A1,$A2,$A4,$A4,$A3,$A4
db $A4,$A7,$A7,$A8,$A4,$A8,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$A8,$A5,$A6,$A7,$A4,$A7,$A8
db $A4,$A4,$A1,$A2,$A3,$A4,$A3,$BA,$A0,$A0,$BB,$BC,$A3,$A4,$A3,$A4,$A3,$A4,$A1,$A2
db $A7,$A8,$A5,$A6,$A7,$A8,$BD,$BE,$BF,$C0,$C1,$C2,$A4,$A7,$A7,$A8,$A4,$A8,$A5,$A6
db $A3,$A4,$A4,$A7,$A3,$C3,$C4,$C5,$C6,$A4,$A3,$A4,$A4,$A4,$A1,$A2,$A3,$A4,$A7,$A4
db $A1,$A2,$A4,$A4,$C7,$C8,$C9,$CA,$A8,$A8,$A1,$A2,$A7,$A8,$A5,$A6,$A7,$A4,$A4,$A8
.end

BackgroundGFX_ShoulderRuruna_15_7008:
incbin "GFX/Backgrounds/BG_ShoulderRuruna.bin"
.end

BackgroundTilemap_ShoulderRuruna_15_7428:
db $A1,$A1,$A2,$A3,$A4,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$A5,$AC,$AC,$AD,$AE,$A1,$A1
db $A1,$A2,$A3,$A6,$A0,$A6,$AF,$B0,$B1,$B2,$B3,$B4,$B5,$B6,$A0,$A0,$A6,$AD,$AE,$A1
db $A1,$A3,$A6,$A0,$A0,$A0,$B7,$B8,$B9,$BA,$B3,$B3,$BB,$BC,$A0,$A0,$A0,$A6,$AD,$A1
db $A1,$BD,$A0,$A0,$A0,$BE,$BF,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$A6,$A0,$A0,$A6,$C7,$A1
db $A1,$BD,$A6,$A0,$A6,$A0,$C8,$C9,$CA,$B3,$B3,$B3,$B3,$CB,$A0,$A0,$A6,$A0,$C7,$A1
db $A1,$CC,$A6,$A0,$A0,$A6,$CD,$CE,$CF,$B3,$B3,$B3,$D0,$D1,$A0,$A0,$A0,$A6,$D2,$A1
db $A1,$D3,$CC,$A6,$A0,$A0,$A0,$D4,$D5,$D6,$B3,$B3,$D7,$D8,$A6,$A0,$A6,$D2,$D9,$A1
db $A1,$A1,$D3,$CC,$DA,$DA,$DB,$DC,$DD,$DE,$B3,$B3,$B3,$DF,$E0,$E1,$D2,$D9,$A1,$A1
.end

BackgroundGFX_ShoulderMizuki_15_74C8:
incbin "GFX/Backgrounds/BG_ShoulderMizuki.bin"
.end

BackgroundTilemap_ShoulderMizuki_15_78D8:
db $A1,$A1,$A2,$A3,$A4,$A4,$A5,$A6,$A0,$A7,$A8,$A9,$A6,$A5,$AA,$AA,$AB,$AC,$A1,$A1
db $A1,$A2,$A3,$A6,$A0,$A6,$A0,$A0,$AD,$AE,$AF,$B0,$B1,$B2,$A0,$A0,$A6,$AB,$AC,$A1
db $A1,$A3,$A6,$A0,$A0,$A0,$B3,$B4,$B5,$B6,$B7,$B7,$B8,$B9,$A0,$A0,$A0,$A6,$AB,$A1
db $A1,$BA,$A0,$A0,$A0,$A0,$BB,$BC,$BD,$BE,$BF,$C0,$C1,$C2,$A6,$A0,$A0,$A6,$C3,$A1
db $A1,$BA,$A6,$A0,$A6,$A0,$A0,$C4,$C5,$C6,$C7,$C8,$B7,$C9,$A0,$A0,$A6,$A0,$C3,$A1
db $A1,$CA,$A6,$A0,$A0,$A6,$A0,$CB,$CC,$CD,$B7,$B7,$CE,$CF,$A0,$A0,$A0,$A6,$D0,$A1
db $A1,$D1,$CA,$A6,$A0,$A0,$A0,$A6,$D2,$D3,$B7,$B7,$D4,$D5,$A6,$A0,$A6,$D0,$D6,$A1
db $A1,$A1,$D1,$CA,$D7,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E0,$D0,$D6,$A1,$A1
.end

BackgroundGFX_ShoulderYumi_15_7978:
incbin "GFX/Backgrounds/BG_ShoulderYumi.bin"
.end

BackgroundTilemap_ShoulderYumi_15_7D88:
db $A1,$A1,$A2,$A3,$A4,$A4,$A5,$A6,$A7,$A8,$A9,$AA,$AB,$A5,$AC,$AC,$AD,$AE,$A1,$A1
db $A1,$A2,$A3,$A6,$A0,$A6,$A0,$A0,$AF,$B0,$B1,$B2,$B3,$A0,$A0,$A6,$A6,$AD,$AE,$A1
db $A1,$A3,$A6,$A0,$A0,$A0,$B4,$B5,$B6,$B7,$B1,$B1,$B8,$B9,$A0,$A0,$A0,$A6,$AD,$A1
db $A1,$BA,$A0,$A0,$A0,$A0,$BB,$BC,$BD,$BE,$BF,$C0,$B1,$C1,$A6,$A0,$A0,$A6,$C2,$A1
db $A1,$BA,$A6,$A0,$A6,$A0,$A0,$C3,$B1,$B1,$B1,$B1,$B1,$C4,$A0,$A0,$A6,$A0,$C2,$A1
db $A1,$C5,$A6,$A0,$A0,$A6,$A0,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$A0,$A0,$A0,$A6,$CD,$A1
db $A1,$CE,$C5,$A6,$A0,$A0,$A6,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$A6,$A0,$A6,$CD,$D6,$A1
db $A1,$A1,$CE,$C5,$D7,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$B1,$DE,$DF,$E0,$CD,$D6,$A1,$A1
.end