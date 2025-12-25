#extract all graphics from PocketLove for the game boy.
#simply run it with "Pocket Love (J) [S].gb" file in the same folder. all generated graphics data will be in the output folder named "GFX".
#move the "GFX" folder to the same folder as the main project (same folder where you can find "PocketLoveDisassembled.asm" or "Compile.bat", etc)

import os
import hashlib

ROM = "Pocket Love (J) [S].gb" #game's ROM
OutputFolderBase = "GFX"
OutputFolder_BGs = "Backgrounds/"
OutputFolder_Sprite = "CharacterSprites/"

def extract_byteToInt(byte):
    byte_to_int = int.from_bytes(byte, byteorder='little')
    return byte_to_int

hash_func = hashlib.new('sha256')

with open(ROM, 'rb') as file:
    while chunk := file.read(8192):
        hash_func.update(chunk)
        
hashVal = hash_func.hexdigest()

#check if what we're looking at is Pocket Love.
if hashVal != "0ad10696e24bdc996e395928919d49ad736685babe5cb9b191a9e863becf926a":
    raise ValueError("The ROM you have provided is not a clean unmodified version of Pocket Love. Cannot extract graphics.")
    
GraphicsPointers = (
[0x96D2, 0x0FE0,"SGBBorder.bin"], #SGB Border GFX (4BPP)
[0xA6B2, 0x0800,"Font.bin"],#Font
[0x40060,0x0100,OutputFolder_BGs+"BG_Chalkboard.bin"],#backgrounds from bank $10 start here
[0x40200,0x0510,OutputFolder_BGs+"BG_Classroom.bin"],
[0x407B0,0x0550,OutputFolder_BGs+"BG_ClassroomTest.bin"],
[0x40DA0,0x05C0,OutputFolder_BGs+"BG_SchoolHallway.bin"],
[0x41400,0x03E0,OutputFolder_BGs+"BG_Library.bin"],
[0x41880,0x0240,OutputFolder_BGs+"BG_SchoolRooftop.bin"],
[0x41B60,0x0580,OutputFolder_BGs+"BG_SchoolNurseOffice.bin"],
[0x42180,0x0360,OutputFolder_BGs+"BG_SchoolTerritory.bin"],
[0x42580,0x02F0,OutputFolder_BGs+"BG_SchoolEvent.bin"],
[0x42910,0x0590,OutputFolder_BGs+"BG_Schoolyard.bin"],
[0x42F40,0x0430,OutputFolder_BGs+"BG_Street.bin"],
[0x43410,0x02E0,OutputFolder_BGs+"BG_SchoolEntrance.bin"],
[0x44058,0x0570,OutputFolder_BGs+"BG_SchoolSoccerfield.bin"],#backgrounds from bank $11 start here
[0x44668,0x0450,OutputFolder_BGs+"BG_SchoolBasketballCourt.bin"],
[0x44B58,0x0590,OutputFolder_BGs+"BG_SchoolClubroom.bin"],
[0x45188,0x0080,OutputFolder_BGs+"BG_Spotlight.bin"],
[0x452A8,0x0500,OutputFolder_BGs+"BG_Bonfire.bin"],
[0x45848,0x0510,OutputFolder_BGs+"BG_SchoolTheater.bin"],
[0x45DF8,0x0490,OutputFolder_BGs+"BG_Neighborhood.bin"],
[0x46328,0x0540,OutputFolder_BGs+"BG_Park.bin"],
[0x46908,0x0560,OutputFolder_BGs+"BG_River.bin"],
[0x46F08,0x0280,OutputFolder_BGs+"BG_NightRiver.bin"],
[0x47228,0x0460,OutputFolder_BGs+"BG_ArcadeEntrance.bin"],
[0x48058,0x04B0,OutputFolder_BGs+"BG_Arcade.bin"],#backgrounds from bank $12 start here
[0x485A8,0x04F0,OutputFolder_BGs+"BG_KaraokeEntrance.bin"],
[0x48B38,0x0590,OutputFolder_BGs+"BG_Karaoke.bin"],
[0x49168,0x05A0,OutputFolder_BGs+"BG_ShoppingDistrict.bin"],
[0x497A8,0x0550,OutputFolder_BGs+"BG_CafeEntrance.bin"],
[0x49D98,0x0430,OutputFolder_BGs+"BG_Cafe.bin"],
[0x4A268,0x0570,OutputFolder_BGs+"BG_ToyStore.bin"],
[0x4A878,0x03C0,OutputFolder_BGs+"BG_GeneralStore.bin"],
[0x4ACD8,0x0350,OutputFolder_BGs+"BG_PetStore.bin"],
[0x4B0C8,0x0580,OutputFolder_BGs+"BG_MediaStore.bin"],
[0x4B6E8,0x03B0,OutputFolder_BGs+"BG_SportsStore.bin"],
[0x4C050,0x0420,OutputFolder_BGs+"BG_13_1.bin"],#backgrounds from bank $13 start here
[0x4C510,0x0540,OutputFolder_BGs+"BG_BurgerJoint.bin"],
[0x4CAF0,0x0540,OutputFolder_BGs+"BG_Planetarium.bin"],
[0x4D0D0,0x0160,OutputFolder_BGs+"BG_MovieTheater.bin"],
[0x4D2D0,0x04F0,OutputFolder_BGs+"BG_MovieTheaterEntrance.bin"],
[0x4D860,0x0530,OutputFolder_BGs+"BG_AmusementParkEntrance.bin"],
[0x4DE30,0x05C0,OutputFolder_BGs+"BG_AmusementPark.bin"],
[0x4E490,0x0590,OutputFolder_BGs+"BG_Beach.bin"],
[0x4EAC0,0x05C0,OutputFolder_BGs+"BG_Pool.bin"],
[0x4F120,0x0580,OutputFolder_BGs+"BG_ScenicRoad.bin"],
[0x50050,0x05A0,OutputFolder_BGs+"BG_ScenicRoadWithered.bin"],#backgrounde from bank $14 start here
[0x50690,0x0270,OutputFolder_BGs+"BG_BoatRide.bin"],
[0x509A0,0x0580,OutputFolder_BGs+"BG_Monkeys.bin"],
[0x50FC0,0x0590,OutputFolder_BGs+"BG_TallBuildings.bin"],
[0x515F0,0x0600,OutputFolder_BGs+"BG_UrbanStreet.bin"],
[0x51C90,0x05A0,OutputFolder_BGs+"BG_Room.bin"],
[0x522D0,0x04C0,OutputFolder_BGs+"BG_ShrinePhoto.bin"],
[0x52830,0x0580,OutputFolder_BGs+"BG_HalloweenParty.bin"],
[0x52E50,0x04E0,OutputFolder_BGs+"BG_BirthdayParty.bin"],
[0x533D0,0x0540,OutputFolder_BGs+"BG_SakuraWoods.bin"],
[0x54068,0x05D0,OutputFolder_BGs+"BG_Festival.bin"],#backgrounds from bank $15 start here
[0x546D8,0x03D0,OutputFolder_BGs+"BG_GhostHouseEntrance.bin"],
[0x54B48,0x0470,OutputFolder_BGs+"BG_GhostHouse.bin"],
[0x55058,0x04F0,OutputFolder_BGs+"BG_Fireworks.bin"],
[0x555E8,0x04B0,OutputFolder_BGs+"BG_BaseballCompetition.bin"],
[0x55B38,0x02E0,OutputFolder_BGs+"BG_NoticeBoard_SportsTeamWin.bin"],
[0x55EB8,0x02E0,OutputFolder_BGs+"BG_NoticeBoard_SportsTeamLose.bin"],
[0x56238,0x03F0,OutputFolder_BGs+"BG_BasketballCompetition.bin"],
[0x566C8,0x0550,OutputFolder_BGs+"BG_SoccerCompetition.bin"],
[0x56CB8,0x02B0,OutputFolder_BGs+"BG_HandHolding.bin"],
[0x57008,0x0420,OutputFolder_BGs+"BG_ShoulderRuruna.bin"],
[0x574C8,0x0410,OutputFolder_BGs+"BG_ShoulderMizuki.bin"],
[0x57978,0x0410,OutputFolder_BGs+"BG_ShoulderYumi.bin"],
[0x58020,0x0700,OutputFolder_Sprite+"Ruruna_School.bin"],#character graphics from bank $16 start here
[0x58720,0x0680,OutputFolder_Sprite+"Ruruna_Casual.bin"],
[0x58DA0,0x06E0,OutputFolder_Sprite+"Ruruna_WarmClothes.bin"],
[0x59480,0x0700,OutputFolder_Sprite+"Mizuki_School.bin"],
[0x59B80,0x0680,OutputFolder_Sprite+"Mizuki_Casual.bin"],
[0x5A200,0x0560,OutputFolder_Sprite+"Mizuki_WarmClothes.bin"],
[0x5A760,0x0660,OutputFolder_Sprite+"Yumi_School.bin"],
[0x5ADC0,0x06C0,OutputFolder_Sprite+"Yumi_Casual.bin"],
[0x5C028,0x06A0,OutputFolder_Sprite+"Yumi_WarmClothes.bin"],
[0x5C6C8,0x06A0,OutputFolder_Sprite+"Mari_School.bin"],
[0x5CD68,0x06C0,OutputFolder_Sprite+"Mari_Casual.bin"],
[0x5D428,0x0640,OutputFolder_Sprite+"Mari_WarmClothes.bin"],
[0x5DA68,0x0660,OutputFolder_Sprite+"Miri_School.bin"],
[0x5E0C8,0x05E0,OutputFolder_Sprite+"Miri_Casual.bin"],
[0x5E6A8,0x0680,OutputFolder_Sprite+"Miri_WarmClothes.bin"],
[0x5ED28,0x0620,OutputFolder_Sprite+"Suzune_School.bin"],
[0x5F348,0x0600,OutputFolder_Sprite+"Suzune_Casual.bin"],
[0x5F948,0x05A0,OutputFolder_Sprite+"Suzune_WarmClothes.bin"],
[0x60024,0x0760,OutputFolder_Sprite+"Momoyo_School.bin"],
[0x60784,0x06A0,OutputFolder_Sprite+"Momoyo_Casual.bin"],
[0x60E24,0x0740,OutputFolder_Sprite+"Momoyo_WarmClothes.bin"],
[0x61564,0x0700,OutputFolder_Sprite+"Ruruna_Swimsuit.bin"],
[0x61C64,0x0660,OutputFolder_Sprite+"Mizuki_Swimsuit.bin"],
[0x622C4,0x0680,OutputFolder_Sprite+"Miri_Swimsuit.bin"],
[0x62944,0x0580,OutputFolder_Sprite+"Suzune_Swimsuit.bin"],
[0x62EC4,0x0740,OutputFolder_Sprite+"Momoyo_Swimsuit.bin"],
[0x63604,0x0640,OutputFolder_Sprite+"Mari_Swimsuit.bin"],
[0x64024,0x06A0,OutputFolder_Sprite+"Yumi_Swimsuit.bin"],
[0x646C4,0x0640,OutputFolder_Sprite+"Ruruna_Special.bin"],
[0x64D04,0x0540,OutputFolder_Sprite+"Hand1.bin"],
[0x65244,0x02A0,OutputFolder_Sprite+"Hand2.bin"],
[0x654E4,0x0640,OutputFolder_Sprite+"Ruruna_SideView.bin"],
[0x65B24,0x0680,OutputFolder_Sprite+"Mizuki_SideView.bin"],
[0x661A4,0x0660,OutputFolder_Sprite+"Yumi_SideView.bin"],
[0x66804,0x05C0,OutputFolder_Sprite+"Miri_SideView.bin"],
[0x66DC4,0x0680,OutputFolder_Sprite+"Mari_SideView.bin"],
[0x68024,0x06A0,OutputFolder_Sprite+"Suzune_SideView.bin"],
[0x686C4,0x0700,OutputFolder_Sprite+"Momoyo_SideView.bin"],
[0x68DC4,0x04E0,OutputFolder_Sprite+"Ruruna_Intro.bin"],
[0x692A4,0x04E0,OutputFolder_Sprite+"Mizuki_Intro.bin"],
[0x69784,0x04C0,OutputFolder_Sprite+"Yumi_Intro.bin"],
[0x69C44,0x04C0,OutputFolder_Sprite+"Miri_Intro.bin"],
[0x6A104,0x0500,OutputFolder_Sprite+"Mari_Intro.bin"],
[0x6A604,0x0440,OutputFolder_Sprite+"Suzune_Intro.bin"],
[0x6AA44,0x0480,OutputFolder_Sprite+"Momoyo_Intro.bin"],
[0x6C058,0x04F0,OutputFolder_BGs+"BG_ShoulderMiri.bin"], #bacjgrounds from bank $1B are here
[0x6C5E8,0x0380,OutputFolder_BGs+"BG_ShoulderMari.bin"],
[0x6CA08,0x0420,OutputFolder_BGs+"BG_ShoulderSuzune.bin"],
[0x6CEC8,0x04A0,OutputFolder_BGs+"BG_ShoulderMomoyo.bin"],
[0x6D408,0x0400,OutputFolder_BGs+"BG_IntroAmusementPark.bin"],
[0x6D8A8,0x03B0,OutputFolder_BGs+"BG_IntroSchoolTerritory.bin"],
[0x6DCF8,0x0340,OutputFolder_BGs+"BG_IntroCityscape.bin"],
[0x6E0D8,0x03B0,OutputFolder_BGs+"BG_IntroLibrary.bin"],
[0x6E528,0x0540,OutputFolder_BGs+"BG_IntroBar.bin"],
[0x6EB08,0x04A0,OutputFolder_BGs+"BG_IntroBedroom.bin"],
[0x6F048,0x0460,OutputFolder_BGs+"BG_IntroArcade.bin"],
[0x7C000,0x0400,"TimePassingWindow_Spring.bin"], #4 seasons
[0x7C400,0x0400,"TimePassingWindow_Summer.bin"],
[0x7C800,0x0400,"TimePassingWindow_Fall.bin"],
[0x7CC00,0x0400,"TimePassingWindow_Winter.bin"],
[0x7D000,0x0400,"ScheduleIcons.bin"],
[0x7D400,0x0640,"Calendar.bin"], #schedule icons
[0x7DA40,0x07A0,"ScheduleSprites.bin"],
[0x7E1E0,0x0600,"RelationshipBGTiles.bin"],
[0x7E7E0,0x0600,"RelationshipSprites.bin"],
[0x7EDE0,0x0010,"Underscore.bin"],
[0x7EDF0,0x0570,"TitleScreenBGTiles.bin"],
[0x7F360,0x0100,"TitleScreenSprites.bin"],
[0x7F460,0x0800,"Map.bin"]
)

try:
    os.mkdir(OutputFolderBase)
except:
    pass
 
#I don't know if there's a better way to do this. OH WELL. 
try:
    os.mkdir(OutputFolderBase+"/"+OutputFolder_BGs)
except:
    pass

#create character sprite folder
try:
    os.mkdir(OutputFolderBase+"/"+OutputFolder_Sprite)
except:
    pass

with open(ROM, "rb") as inFile:
    for i in range(0, len(GraphicsPointers)):
        inFile.seek(GraphicsPointers[i][0])
        b = 0
        with open(OutputFolderBase+"/"+GraphicsPointers[i][2], "wb") as outFile:
            while b < GraphicsPointers[i][1]:
                outFile.write(inFile.read(1))
                b+=1
                
#print("done")