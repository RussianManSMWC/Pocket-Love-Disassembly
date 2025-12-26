include "Defines/RAM.asm"
include "Defines/Constants.asm"
include "Defines/Registers.asm"
include "Defines/Enums.asm"
include "Macros.asm"
include "Data/Scripts/ScriptCommands.asm"
include "Data/Sound/SoundCommands.asm"

;ROM banks
include "Banks/PocketLove_Bank0.asm" ;The heart of the game, code for sound, script handling, text parsing, and much more
include "Banks/PocketLove_Bank1.asm" ;Sound data
include "Banks/PocketLove_Bank2.asm" ;Various data, including script coding/pointers, general graphics, Super Game Boy graphics and so on.
include "Banks/PocketLove_Bank3.asm" ;Scene data
include "Banks/PocketLove_Bank4.asm" ;Text data (see Data/Text for text)
include "Banks/PocketLove_Bank5.asm" ;Script data (see Data/Scripts for the scripts)
include "Banks/PocketLove_Bank6.asm" ;Script data
include "Banks/PocketLove_Bank7.asm" ;Script data
include "Banks/PocketLove_Bank8.asm" ;Text data
include "Banks/PocketLove_Bank9.asm" ;Text data
include "Banks/PocketLove_BankA.asm" ;Text data
include "Banks/PocketLove_BankB.asm" ;Text data
include "Banks/PocketLove_BankC.asm" ;Text data
include "Banks/PocketLove_BankD.asm" ;Text data
include "Banks/PocketLove_BankE.asm" ;Character display data (from Ruruna to Miri)
include "Banks/PocketLove_BankF.asm" ;Character display data (the remaining 3 characters)
include "Banks/PocketLove_Bank10.asm" ;Background graphics and data (see GFX for graphic binaries (after extracting them with a script))
include "Banks/PocketLove_Bank11.asm" ;Background graphics and data
include "Banks/PocketLove_Bank12.asm" ;Background graphics and data
include "Banks/PocketLove_Bank13.asm" ;Background graphics and data
include "Banks/PocketLove_Bank14.asm" ;Background graphics and data
include "Banks/PocketLove_Bank15.asm" ;Background graphics and data
include "Banks/PocketLove_Bank16.asm" ;Character graphics (Ruruna's School, Casual and Warm appearances, Mizuki, School, Casual and Warm appearances and Yumi's School and Casual appearances)
include "Banks/PocketLove_Bank17.asm" ;Character graphics (Yumi's Warm appearance, Mari, Miri and Suzune, all with School, Casual and Warm appearances)
include "Banks/PocketLove_Bank18.asm" ;Character graphics (Suzune's School, Casual and Warm appearances, then Swimsuit appearance for Ruruna, Mizuki, Miri, Suzune, Momoyo and Mari)
include "Banks/PocketLove_Bank19.asm" ;Character graphics (Yumi's Swimsuit appearance, hand "characters", then Sideways appearance for Ruruna, Mizuki, Yumi, Miri and Mari)
include "Banks/PocketLove_Bank1A.asm" ;Character graphics (Suzune and Momoyo's Sideways appearance, then Intro appearance for all characters)
include "Banks/PocketLove_Bank1B.asm" ;Background graphics and data (includes intro backgrounds)
include "Banks/PocketLove_Bank1C.asm" ;Script data
include "Banks/PocketLove_Bank1D.asm" ;Script data + Coding and data for title screen and new game screens
include "Banks/PocketLove_Bank1E.asm" ;Coding and data for schedule screen and related elements
include "Banks/PocketLove_Bank1F.asm" ;Various graphics