;PRG ROM $60000-$63FFF
;character art

SECTION "bank 18", ROMX, BANK[$18]

POINTERS_18_4000:
PointerWithSize CharacterGFX_Momoyo_School_18_4024
PointerWithSize CharacterGFX_Momoyo_Casual_18_4784
PointerWithSize CharacterGFX_Momoyo_WarmClothes_18_4E24

PointerWithSize CharacterGFX_Ruruna_Swimsuit_18_5564
PointerWithSize CharacterGFX_Mizuki_Swimsuit_18_5C64
PointerWithSize CharacterGFX_Miri_Swimsuit_18_62C4          ;I have no idea why Miri after Mizuki, you'd think Yumi would be next, but nope.
PointerWithSize CharacterGFX_Suzune_Swimsuit_18_6944        ;and then Suzune?
PointerWithSize CharacterGFX_Momoyo_Swimsuit_18_6EC4
PointerWithSize CharacterGFX_Mari_Swimsuit_18_7604

CharacterGFX_Momoyo_School_18_4024:
incbin "GFX/CharacterSprites/Momoyo_School.bin"
.end

CharacterGFX_Momoyo_Casual_18_4784:
incbin "GFX/CharacterSprites/Momoyo_Casual.bin"
.end

CharacterGFX_Momoyo_WarmClothes_18_4E24:
incbin "GFX/CharacterSprites/Momoyo_WarmClothes.bin"
.end

CharacterGFX_Ruruna_Swimsuit_18_5564:
incbin "GFX/CharacterSprites/Ruruna_Swimsuit.bin"
.end

CharacterGFX_Mizuki_Swimsuit_18_5C64:
incbin "GFX/CharacterSprites/Mizuki_Swimsuit.bin"
.end

CharacterGFX_Miri_Swimsuit_18_62C4:
incbin "GFX/CharacterSprites/Miri_Swimsuit.bin"
.end

CharacterGFX_Suzune_Swimsuit_18_6944:
incbin "GFX/CharacterSprites/Suzune_Swimsuit.bin"
.end

CharacterGFX_Momoyo_Swimsuit_18_6EC4:
incbin "GFX/CharacterSprites/Momoyo_Swimsuit.bin"
.end

CharacterGFX_Mari_Swimsuit_18_7604:
incbin "GFX/CharacterSprites/Mari_Swimsuit.bin"
.end