;PRG ROM $5C000-$5FFFF
;character art

SECTION "bank 17", ROMX, BANK[$17]

POINTERS_17_4000:
PointerWithSize CharacterGFX_Yumi_WarmClothes_17_4028

PointerWithSize CharacterGFX_Mari_School_17_46C8
PointerWithSize CharacterGFX_Mari_Casual_17_4D68
PointerWithSize CharacterGFX_Mari_WarmClothes_17_5428

PointerWithSize CharacterGFX_Miri_School_17_5A68
PointerWithSize CharacterGFX_Miri_Casual_17_60C8
PointerWithSize CharacterGFX_Miri_WarmClothes_17_66A8

PointerWithSize CharacterGFX_Suzune_School_17_6D28
PointerWithSize CharacterGFX_Suzune_Casual_17_7348
PointerWithSize CharacterGFX_Suzune_WarmClothes_17_7948

CharacterGFX_Yumi_WarmClothes_17_4028:
incbin "GFX/CharacterSprites/Yumi_WarmClothes.bin"
.end

;Mari is next, even though it should be Miri if we go by her character ID. consistency!
CharacterGFX_Mari_School_17_46C8:
incbin "GFX/CharacterSprites/Mari_School.bin"
.end

CharacterGFX_Mari_Casual_17_4D68:
incbin "GFX/CharacterSprites/Mari_Casual.bin"
.end

CharacterGFX_Mari_WarmClothes_17_5428:
incbin "GFX/CharacterSprites/Mari_WarmClothes.bin"
.end

CharacterGFX_Miri_School_17_5A68:
incbin "GFX/CharacterSprites/Miri_School.bin"
.end

CharacterGFX_Miri_Casual_17_60C8:
incbin "GFX/CharacterSprites/Miri_Casual.bin"
.end

CharacterGFX_Miri_WarmClothes_17_66A8:
incbin "GFX/CharacterSprites/Miri_WarmClothes.bin"
.end

CharacterGFX_Suzune_School_17_6D28:
incbin "GFX/CharacterSprites/Suzune_School.bin"
.end

CharacterGFX_Suzune_Casual_17_7348:
incbin "GFX/CharacterSprites/Suzune_Casual.bin"
.end

CharacterGFX_Suzune_WarmClothes_17_7948:
incbin "GFX/CharacterSprites/Suzune_WarmClothes.bin"
.end