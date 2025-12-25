;PRG ROM $64000-$67FFF
;character art

SECTION "bank 19", ROMX, BANK[$19]

POINTERS_19_4000:
PointerWithSize CharacterGFX_Yumi_Swimsuit_19_4024

PointerWithSize CharacterGFX_Ruruna_Special_19_46C4

PointerWithSize CharacterGFX_Hand1_19_4D04
PointerWithSize CharacterGFX_Hand2_19_5244

PointerWithSize CharacterGFX_Ruruna_SideView_18_54E4
PointerWithSize CharacterGFX_Mizuki_SideView_18_5B24
PointerWithSize CharacterGFX_Yumi_SideView_19_61A4
PointerWithSize CharacterGFX_Miri_SideView_18_6804
PointerWithSize CharacterGFX_Mari_SideView_18_6DC4

CharacterGFX_Yumi_Swimsuit_19_4024:
incbin "GFX/CharacterSprites/Yumi_Swimsuit.bin"
.end

CharacterGFX_Ruruna_Special_19_46C4:
incbin "GFX/CharacterSprites/Ruruna_Special.bin"
.end

CharacterGFX_Hand1_19_4D04:
incbin "GFX/CharacterSprites/Hand1.bin"
.end

CharacterGFX_Hand2_19_5244:
incbin "GFX/CharacterSprites/Hand2.bin"
.end

CharacterGFX_Ruruna_SideView_18_54E4:
incbin "GFX/CharacterSprites/Ruruna_SideView.bin"
.end

CharacterGFX_Mizuki_SideView_18_5B24:
incbin "GFX/CharacterSprites/Mizuki_SideView.bin"
.end

CharacterGFX_Yumi_SideView_19_61A4:
incbin "GFX/CharacterSprites/Yumi_SideView.bin"
.end

CharacterGFX_Miri_SideView_18_6804:
incbin "GFX/CharacterSprites/Miri_SideView.bin"
.end

CharacterGFX_Mari_SideView_18_6DC4:
incbin "GFX/CharacterSprites/Mari_SideView.bin"
.end