;PRG ROM $68000-$6BFFF
;character art

SECTION "bank 1A", ROMX, BANK[$1A]

POINTERS_1A_4000:
PointerWithSize CharacterGFX_Suzune_SideView_1A_4024
PointerWithSize CharacterGFX_Momoyo_SideView_1A_46C4

PointerWithSize CharacterGFX_Ruruna_Intro_1A_4DC4
PointerWithSize CharacterGFX_Mizuki_Intro_1A_52A4
PointerWithSize CharacterGFX_Yumi_Intro_1A_5784
PointerWithSize CharacterGFX_Miri_Intro_1A_5C44
PointerWithSize CharacterGFX_Mari_Intro_1A_6104
PointerWithSize CharacterGFX_Suzune_Intro_1A_6604
PointerWithSize CharacterGFX_Momoyo_Intro_1A_6A44

CharacterGFX_Suzune_SideView_1A_4024:
incbin "GFX/CharacterSprites/Suzune_SideView.bin"
.end

CharacterGFX_Momoyo_SideView_1A_46C4:
incbin "GFX/CharacterSprites/Momoyo_SideView.bin"
.end

CharacterGFX_Ruruna_Intro_1A_4DC4:
incbin "GFX/CharacterSprites/Ruruna_Intro.bin"
.end

CharacterGFX_Mizuki_Intro_1A_52A4:
incbin "GFX/CharacterSprites/Mizuki_Intro.bin"
.end

CharacterGFX_Yumi_Intro_1A_5784:
incbin "GFX/CharacterSprites/Yumi_Intro.bin"
.end

CharacterGFX_Miri_Intro_1A_5C44:
incbin "GFX/CharacterSprites/Miri_Intro.bin"
.end

CharacterGFX_Mari_Intro_1A_6104:
incbin "GFX/CharacterSprites/Mari_Intro.bin"
.end

CharacterGFX_Suzune_Intro_1A_6604:
incbin "GFX/CharacterSprites/Suzune_Intro.bin"
.end

CharacterGFX_Momoyo_Intro_1A_6A44:
incbin "GFX/CharacterSprites/Momoyo_Intro.bin"
.end