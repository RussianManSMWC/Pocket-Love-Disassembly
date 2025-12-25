;I ❤ ENUMS!!

;character-related enums
RSRESET
def CharProp_Character_Ruruna rb 1
def CharProp_Character_Mizuki rb 1
def CharProp_Character_Yumi rb 1
def CharProp_Character_Miri rb 1
def CharProp_Character_Mari rb 1
def CharProp_Character_Suzune rb 1
def CharProp_Character_Momoyo rb 1

RSRESET
def CharProp_Appearance_School rb 1
def CharProp_Appearance_Casual rb 1
def CharProp_Appearance_Warm rb 1                           ;as in wearing warm clothing. this is what the character will wear from fall onward
def CharProp_Appearance_Swimsuit rb 1
def CharProp_Appearance_Sideview rb 1
def CharProp_Appearance_Intro rb 1
def CharProp_Appearance_Special rb 1                        ;only first three girls have this appearance, and only Ruruna has a special look (other two are hand sprites)

;essentially the same as above, but with a small difference. the game's scripting generally uses these values (albeit only the first 4 values, if using FixedLoadCharacter)
RSRESET
def CharProp_Display_School rb 1
def CharProp_Display_Outdoors rb 1                          ;combines casual and warm
def CharProp_Display_Swimsuit rb 1
def CharProp_Display_Sideview rb 1
def CharProp_Display_Intro rb 1
def CharProp_Display_Special rb 1

RSRESET
def CharProp_Emotion_Normal rb 1
def CharProp_Emotion_Upset rb 1
def CharProp_Emotion_Happy rb 1
def CharProp_Emotion_Blush rb 1
def CharProp_Emotion_Sad rb 1

;player-related enums

RSRESET
def PlayerString_SecondName rb 1
def PlayerString_Name rb 1
def PlayerString_NickName rb 1

RSRESET
def BloodType_A rb 1
def BloodType_B rb 1
def BloodType_AB rb 1
def BloodType_O rb 1

RSRESET
def BirthSign_Aries rb 1
def BirthSign_Taurus rb 1
def BirthSign_Gemini rb 1
def BirthSign_Cancer rb 1
def BirthSign_Leo rb 1
def BirthSign_Virgo rb 1
def BirthSign_Libra rb 1
def BirthSign_Scorpio rb 1
def BirthSign_Sagittarius rb 1
def BirthSign_Capricorn rb 1
def BirthSign_Aquarius rb 1
def BirthSign_Pisces rb 1

RSRESET
def ClubOrJob_None rb 1                                     ;didn't apply to anything
def ClubOrJob_GoClub rb 1                                   ;board game
def ClubOrJob_HandicraftsClub rb 1
def ClubOrJob_EnglishClub rb 1
def ClubOrJob_BaseballClub rb 1
def ClubOrJob_BasketballClub rb 1
def ClubOrJob_SoccerClub rb 1
def ClubOrJob_PartTimeJob rb 1

;scheduled activities
RSRESET
def ScheduleOption_Study rb 1
def ScheduleOption_Grooming rb 1                            ;or in simpler terms, make yourself look like the prettiest boy around
def ScheduleOption_Club rb 1
def ScheduleOption_Karaoke rb 1
def ScheduleOption_Game rb 1
def ScheduleOption_Job rb 1
def ScheduleOption_Relax rb 1
def ScheduleOption_GoingOut rb 1
def ScheduleOption_PhoneCall rb 1
def ScheduleOption_Relationships rb 1
def ScheduleOption_Info rb 1
def ScheduleOption_Calendar rb 1
def ScheduleOption_Save rb 1
def ScheduleOption_Options rb 1
def ScheduleOption_Exit rb 1
def ScheduleOption_DayOff rb 1                              ;obviously not an option for the player, displays on the schedule screen to mark some days as holidays
def ScheduleOption_Empty rb 1                               ;empty spot (only needed for icon "display")

def ScheduleOption_None = $FF                               ;Not a part of enums, but I think it makes sense to put this here. indicates unused slots on schedule

;sound enums

RSRESET
def Music_Silence rb 1
def Music_MainTheme rb 1                                    ;plays at the title screen and character intros
def Music_NewGame rb 1
def Music_03 rb 1                                           ;placeholder song names, proper names to be added
def Music_04 rb 1
def Music_05 rb 1
def Music_06 rb 1
def Music_07 rb 1
def Music_ScheduleScreenWorkWeek rb 1                       ;schedule theme work week
def Music_ScheduleScreenOffDay rb 1                         ;schedule theme off day
def Music_0A rb 1
def Music_0B rb 1
def Music_0C rb 1
def Music_0D rb 1
;$0E, $0F - unused

;sound data starts from $10 onward, skipping over music entries
RSSET $10
def SFX_ChangeOption rb 1
def SFX_Confirm rb 1
def SFX_PhoneRing rb 1
def SFX_Cancel rb 1

;time-related enums
RSRESET
def Event_Christmas rb 1                                    ;marks the end of the game
def Event_OffDay rb 1                                       ;holiday or whatever
def Event_WorkDay rb 1                                      ;a day when you can do club or work at a job
def Event_TestDay rb 1                                      ;test your knowledge!
def Event_SchoolTrip rb 1                                   ;
def Event_SportsEvent rb 1                                  ;where you meet Suzune
def Event_RurunaSpecial rb 1
def Event_SportsClub rb 1
def Event_RandomCharStatCheck rb 1                          ;event where a character can admire your stat or lack therof
def Event_RandomEvent1 rb 1
def Event_RandomEvent2 rb 1
def Event_BeachEpisode rb 1
def Event_RurunaSchoolEvent rb 1 
def Event_MizukiSchoolEvent rb 1
def Event_YumiSchoolEvent rb 1
def Event_MiriSchoolEvent rb 1
def Event_MariSchoolEvent rb 1
def Event_SuzuneSchoolEvent rb 1
def Event_MomoyoSchoolEvent rb 1
def Event_13 rb 1 ;unfortunately I don't have the creative juices to think of names for the rest, especially since they mix many different events
def Event_14 rb 1
def Event_15 rb 1
def Event_16 rb 1
def Event_17 rb 1
def Event_18 rb 1
def Event_19 rb 1
def Event_1A rb 1
def Event_1B rb 1
def Event_1C rb 1
def Event_1D rb 1
def Event_1E rb 1
def Event_1F rb 1
def Event_20 rb 1
def Event_21 rb 1

RSRESET
def Weekday_Monday rb 1
def Weekday_Tuesday rb 1
def Weekday_Wednesday rb 1
def Weekday_Thursday rb 1
def Weekday_Friday rb 1
def Weekday_Saturday rb 1
def Weekday_Sunday rb 1

RSRESET
def Month_January rb 1
def Month_February rb 1
def Month_March rb 1
def Month_April rb 1
def Month_May rb 1
def Month_June rb 1
def Month_July rb 1
def Month_August rb 1
def Month_September rb 1
def Month_October rb 1
def Month_November rb 1
def Month_December rb 1

RSRESET
def Season_Spring rb 1
def Season_Summer rb 1
def Season_Fall rb 1
def Season_Winter rb 1

;Backgrounds
RSRESET
def BG_Dummy rb 1 ;loads chalkboard, but this value is never used
def BG_Chalkboard rb 1
def BG_Classroom rb 1
def BG_ClassroomTest rb 1
def BG_SchoolHallway rb 1
def BG_Library rb 1
def BG_SchoolRooftop rb 1
def BG_SchoolNurseOffice rb 1
def BG_SchoolTerritory rb 1
def BG_SchoolEvent rb 1
def BG_Schoolyard rb 1
def BG_Street rb 1
def BG_SchoolEntrance rb 1
def BG_SchoolSoccerfield rb 1
def BG_SchoolBasketballCourt rb 1
def BG_SchoolClubroom rb 1
def BG_Hand rb 1
def BG_Spotlight rb 1
def BG_Bonfire rb 1
def BG_SchoolTheater rb 1
def BG_Neighborhood rb 1
def BG_Park rb 1
def BG_River rb 1
def BG_NightRiver rb 1
def BG_ArcadeEntrance rb 1
def BG_Arcade rb 1
def BG_KaraokeEntrance rb 1
def BG_Karaoke rb 1
def BG_ShoppingDistrict rb 1
def BG_CafeEntrance rb 1
def BG_Cafe rb 1
def BG_ToyStore rb 1
def BG_GeneralStore rb 1
def BG_PetStore rb 1
def BG_SoftwareStore rb 1
def BG_ClothesStore rb 1
def BG_13_1 rb 1 ;Normally not used in any of the scenes, but can appear randomly in the credits
def BG_BurgerJoint rb 1
def BG_Planetarium rb 1
def BG_MovieTheater rb 1
def BG_MovieTheaterEntrance rb 1
def BG_AmusementParkEntrance rb 1
def BG_AmusementPark rb 1
def BG_Beach rb 1
def BG_Pool rb 1
def BG_ScenicRoad rb 1
def BG_ScenicRoadWithered rb 1
def BG_BoatRide rb 1
def BG_Monkeys rb 1
def BG_TallBuildings rb 1
def BG_UrbanStreet rb 1
def BG_Room rb 1
def BG_ShrinePhoto rb 1
def BG_HalloweenParty rb 1
def BG_BirthdayParty rb 1
def BG_SakuraWoods rb 1
def BG_Festival rb 1
def BG_GhostHouseEntrance rb 1
def BG_GhostHouse rb 1
def BG_Fireworks rb 1
def BG_BaseballCompetition rb 1
def BG_Noticeboard_SportsTeamWin rb 1
def BG_Noticeboard_SportsTeamLose rb 1
def BG_BasketballCompetition rb 1
def BG_SoccerCompetition rb 1
def BG_ShoulderRuruna rb 1
def BG_ShoulderMizuki rb 1
def BG_ShoulderYumi rb 1
def BG_ShoulderMiri rb 1
def BG_ShoulderMari rb 1
def BG_ShoulderSuzune rb 1
def BG_ShoulderMomoyo rb 1

;intro backgrounds use separate values and tables

;Spots/locations the player can visit
RSRESET
def MapSpot_NONE rb 1                                       ;invalid
def MapSpot_School rb 1
def MapSpot_Arcade rb 1
def MapSpot_Karaoke rb 1
def MapSpot_Park rb 1
def MapSpot_River rb 1
def MapSpot_ShoppingCenter rb 1
def MapSpot_07 rb 1                                         ;"Pure Coffee Shop"? Inaccessible area. seems it was meant to be in shopping center
def MapSpot_ToyStore rb 1                                   ;I guess this one is about stuffed toys...
def MapSpot_GeneralStore rb 1
def MapSpot_PetStore rb 1
def MapSpot_BookStore rb 1
def MapSpot_SportsStore rb 1
def MapSpot_ToyStore2 rb 1                                  ;and this one is about... just toys...?
def MapSpot_MediaStore rb 1
def MapSpot_Library rb 1
def MapSpot_BurgerJoint rb 1
def MapSpot_Planetarium rb 1
def MapSpot_MovieTheater rb 1
def MapSpot_AmusementPark rb 1
def MapSpot_Beach rb 1
def MapSpot_Pool rb 1
def MapSpot_ScenicRoad rb 1
def MapSpot_17 rb 1
def MapSpot_SakuraWoods rb 1
def MapSpot_Cafe rb 1
def MapSpot_1A rb 1                                         ;available in very specific time frame
def MapSpot_GhostHouse rb 1                                 ;inaccessible area
def MapSpot_GhostHouse2 rb 1                                ;If Ghost House was such a good inaccessible area, why isn't there a Ghost House 2? oh....
def MapSpot_Fireworks rb 1                                  ;available in very specific time frame

;Sprite displayables
RSRESET
def SpriteDisplayable_ScheduleSelector rb 1
def SpriteDisplayable_SidewayCursor rb 1
def SpriteDisplayable_SidewayCursorDupe rb 1
def SpriteDisplayable_ProfileRuruna rb 1 ;note: these are used in profile viewer (or theoretically any context outside of VN segments). displays normal emote and school uniform
def SpriteDisplayable_ProfileMizuki rb 1
def SpriteDisplayable_ProfileYumi rb 1
def SpriteDisplayable_ProfileMiri rb 1
def SpriteDisplayable_ProfileMari rb 1
def SpriteDisplayable_ProfileSuzune rb 1
def SpriteDisplayable_ProfileMomoyo rb 1
def SpriteDisplayable_LoveStage1 rb 1
def SpriteDisplayable_LoveStage2 rb 1
def SpriteDisplayable_LoveStage3 rb 1
def SpriteDisplayable_LoveStage4 rb 1
def SpriteDisplayable_LoveStage5 rb 1
def SpriteDisplayable_LoveStage6 rb 1
def SpriteDisplayable_LoveStage7 rb 1
def SpriteDisplayable_LoveStage8 rb 1
def SpriteDisplayable_FriendStage1 rb 1
def SpriteDisplayable_FriendStage2 rb 1
def SpriteDisplayable_FriendStage3 rb 1
def SpriteDisplayable_FriendStage4 rb 1
def SpriteDisplayable_FriendStage5 rb 1
def SpriteDisplayable_FriendStage6 rb 1
def SpriteDisplayable_FriendStage7 rb 1
def SpriteDisplayable_FriendStage8 rb 1
def SpriteDisplayable_InterestStage1 rb 1
def SpriteDisplayable_InterestStage2 rb 1
def SpriteDisplayable_InterestStage3 rb 1
def SpriteDisplayable_InterestStage4 rb 1
def SpriteDisplayable_InterestStage5 rb 1
def SpriteDisplayable_InterestStage6 rb 1
def SpriteDisplayable_InterestStage7 rb 1
def SpriteDisplayable_InterestStage8 rb 1
def SpriteDisplayable_MapWalkingSprite1 rb 1
def SpriteDisplayable_MapWalkingSprite2 rb 1
def SpriteDisplayable_MapWalkingSprite3 rb 1
def SpriteDisplayable_MapWalkingSprite4 rb 1
def SpriteDisplayable_CalendarBase1 rb 1
def SpriteDisplayable_CalendarBase2 rb 1
def SpriteDisplayable_CalendarBase3 rb 1
def SpriteDisplayable_CalendarBase4 rb 1
def SpriteDisplayable_CalendarDigit0 rb 1
def SpriteDisplayable_CalendarDigit1 rb 1
def SpriteDisplayable_CalendarDigit2 rb 1
def SpriteDisplayable_CalendarDigit3 rb 1
def SpriteDisplayable_CalendarDigit4 rb 1
def SpriteDisplayable_CalendarDigit5 rb 1
def SpriteDisplayable_CalendarDigit6 rb 1
def SpriteDisplayable_CalendarDigit7 rb 1
def SpriteDisplayable_CalendarDigit8 rb 1
def SpriteDisplayable_CalendarDigit9 rb 1
def SpriteDisplayable_TitleHeart rb 1
def SpriteDisplayable_35 rb 1
def SpriteDisplayable_36 rb 1
def SpriteDisplayable_37 rb 1
def SpriteDisplayable_38 rb 1
def SpriteDisplayable_39 rb 1
def SpriteDisplayable_3A rb 1
def SpriteDisplayable_3B rb 1
def SpriteDisplayable_3C rb 1
def SpriteDisplayable_3D rb 1
def SpriteDisplayable_3E rb 1

def SpriteDisplayable_None = $FF

;technical enums

RSRESET
def ScriptExecutionState_Execute rb 1
def ScriptExecutionState_EndExecution rb 1
def ScriptExecutionState_WaitForTimer rb 1
def ScriptExecutionState_WaitForTextParseEnd rb 1
def ScriptExecutionState_WaitForFade rb 1
def ScriptExecutionState_WaitForPlayerChoice rb 1

RSRESET
def ScriptVarCheck_Equals rb 1
def ScriptVarCheck_NotEquals rb 1
def ScriptVarCheck_MoreThanOrEquals rb 1
def ScriptVarCheck_MoreThan rb 1
def ScriptVarCheck_LessThanOrEquals rb 1
def ScriptVarCheck_LessThan rb 1

RSRESET
def EventVarCheck_MoreThanOrEquals rb 1
def EventVarCheck_LessThanOrEquals rb 1
def EventVarCheck_Equals rb 1
def EventVarCheck_NotEquals rb 1

RSRESET
def TextParsingState_Parse rb 1
def TextParsingState_EndParsing rb 1
def TextParsingState_WaitForPlayerAdvance rb 1
def TextParsingState_WaitForTimer rb 1

RSRESET
def GenericStateChange_Nothing rb 1
def GenericStateChange_Confirm rb 1
def GenericStateChange_Cancel rb 1
def GenericStateChange_Refresh rb 1                         ;an uncommon state change

RSRESET
def TextBank_08 rb 1
def TextBank_09 rb 1
def TextBank_0A rb 1
def TextBank_0B rb 1
def TextBank_0C rb 1
def TextBank_0D rb 1
def TextBank_04 rb 1