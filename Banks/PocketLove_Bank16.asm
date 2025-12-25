;PRG ROM $58000-$5BFFF
;character art

SECTION "bank 16", ROMX, BANK[$16]

POINTERS_16_4000:
PointerWithSize CharacterGFX_Ruruna_School_16_4020
PointerWithSize CharacterGFX_Ruruna_Casual_16_4720
PointerWithSize CharacterGFX_Ruruna_WarmClothes_16_4DA0

PointerWithSize CharacterGFX_Mizuki_School_16_5480
PointerWithSize CharacterGFX_Mizuki_Casual_16_5B80
PointerWithSize CharacterGFX_Mizuki_WarmClothes_16_6200

PointerWithSize CharacterGFX_Yumi_School_16_6760
PointerWithSize CharacterGFX_Yumi_Casual_16_6DC0

CharacterGFX_Ruruna_School_16_4020:
incbin "GFX/CharacterSprites/Ruruna_School.bin"
.end

CharacterGFX_Ruruna_Casual_16_4720:
incbin "GFX/CharacterSprites/Ruruna_Casual.bin"
.end

CharacterGFX_Ruruna_WarmClothes_16_4DA0:
incbin "GFX/CharacterSprites/Ruruna_WarmClothes.bin"
.end

CharacterGFX_Mizuki_School_16_5480:
incbin "GFX/CharacterSprites/Mizuki_School.bin"
.end

CharacterGFX_Mizuki_Casual_16_5B80:
incbin "GFX/CharacterSprites/Mizuki_Casual.bin"
.end

CharacterGFX_Mizuki_WarmClothes_16_6200:
incbin "GFX/CharacterSprites/Mizuki_WarmClothes.bin"
.end

CharacterGFX_Yumi_School_16_6760:
incbin "GFX/CharacterSprites/Yumi_School.bin"
.end

CharacterGFX_Yumi_Casual_16_6DC0:
incbin "GFX/CharacterSprites/Yumi_Casual.bin"
.end