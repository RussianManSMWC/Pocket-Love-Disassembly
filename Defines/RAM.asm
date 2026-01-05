;ram addresses

def OAM_Y = $C000
def OAM_X = $C001
def OAM_Tile = $C002
def OAM_Prop = $C003

def JoypadInputHolding = $C0A0
def JoypadInputPress = $C0A1
def CurrentProgramBank = $C0A2
def SoundQueue = $C0A3
def SuperGameBoyFlag = $C0A4                                ;if set, indicates that the game is played via Super Game Boy
def VBlankHitFlag = $C0A5                                   ;indicates that we have gone through vblank
def FrameCounter8Bit = $C0A6
def InterruptDisablerMirror = $C0A7                         ;only used in LCD disable routine to preserve interrupts
def JoypadInputEnabler = $C0A8                              ;non-zero - inputs enabled

def ScriptEntryID = $C0B0                                   ;script ID that gets executed ($FFFF - event pool end)

def EventConditionDataPointer = $C0B2                       ;a 16-bit pointer to the table of event conditions
def EventConditionDataBank = $C0B4                          ;in which bank the event conditions' table is

def EventPoolDataStart = $C0B5                              ;16-bit pointer that is used to keep track of where the current pool of events begins. Used for when inviting a character on a date so that the dating event can happen.

def EventPoolDataPointer = $C0B7                            ;a 16-bit pointer to the current script entry in the event pool
def EventPoolDataBank = $C0B9

def CalendarCountdownUninterruptedFlag = $C0BA              ;set to 0 if calendar countdown has been interrupted by an event

def EventOccuranceChances = $C0BB                           ;an array that contains the table of event likelyhoods

def TextBufferPointer_Read = $C0CC                          ;used to get compressed data from RAM to decompress
def TextParsingState = $C0CE
def TextDrawing_VRAMColumn = $C0CF                          ;which on-screen column is the message inside
def TextDrawing_VRAMRow = $C0D0                             ;on which row on-screen the text in the message box is
def TextDrawing_CharactersPerLine = $C0D1                   ;maximum amount of text characters on a single line
def TextDrawing_LineMaximum = $C0D2                         ;maximum amount of text lines a message box can have
def TextDrawing_CurrentCharacterInLine = $C0D3              ;where are we on current text line
def TextDrawing_CurrentLine = $C0D4                         ;what line we're on
def TextDrawing_Timer = $C0D5                               ;decrements until 0, after which prints a character
def TextParsing_CharactersToParseCounter = $C0D6            ;used for a parse loop to print more than 1 character in case TextDrawing_ProcessingAmount > 1.

def TextDataPointer = $C0D7
def TextBanks = $C0D9                                       ;an array of program banks that contain the game's text, 7 bytes

;$C0E0-$C0E2 - leftover bytes from storing to TextBanks, unused

def DictionaryTablePointer = $C0E3                          ;16-bit pointer to dictionary entries
def DictionaryBank = $C0E5                                  ;where said dictionary is located

;these are stored to alongside similar defines from before, but functionally unused
def TextDrawing_CurrentVRAMColumn = $C0E6
def TextDrawing_CurrentVRAMRow = $C0E7
def TextDrawing_CurrentCharactersPerLine = $C0E8
def TextDrawing_CurrentLineMaximum = $C0E9

def TextBufferStorage = $C0EA
def TextBufferPointer_Write = $C144                         ;16-bit, used to store text in RAM to decompress later

def TextAdvance_SymbolEnabledFlag = $C146
def TextAdvance_SymbolBlinkingCounter = $C147
def TextAdvance_SymbolVRAMLoc = $C149

def ChoiceOptions_PlayerInputEnableFlag = $C14B             ;if set, player can press buttons and stuff when presented with options
def ChoiceOptions_CursorBlinkingCounter = $C14C
;$C14D - unused?
def ChoiceOptions_CursorBaseVRAMLoc = $C14E                 ;16-bit

def ChoiceOptions_ChosenOptionHorz = $C150                  ;I don't think this is actually used functionally?
def ChoiceOptions_ChosenOptionVert = $C151
def ChoiceOptions_CurrentOption = $C152
def ChoiceOptions_OptionPositionOffset = $C153              ;16-bit

def AButtonRequest_Press = $C155                            ;used to check for A button press. set to wait for player to press A, then it gets cleared.
def AButtonRequest_Hold = $C156                             ;similar to above, but waits for player to HOLD A. functionally pointless (because hold and press are set at the same time) and never properly utilized.

def FadeTimer = $C157                                       ;used for transition
def FadeSpeed = $C158                                       ;how fast does the screen fade
def FadeCounter = $C159                                     ;used for fading
def FadeDirection = $C15A                                   ;$01 - fade in, $FF - fade out
def FadePaletteIndex = $C15B                                ;used to apply correct colors when fading in or out

def CharacterDisplay_DisplayOnFlag = $C15C                  ;if set, a character's sprite should be displayed during events.
def CharacterDisplay_DataPointer = $C15D                    ;points to data used to construct the character's display
def CharacterDisplay_DataBank = $C15F
def CharacterDisplay_BaseX = $C160
def CharacterDisplay_BaseY = $C161
def CharacterDisplay_BaseProp = $C162                       ;bits 5 and 6 set entire image's x and y-flips, respectively. normally unused in this game.

;these are used during actual drawing of the character display, copied from above defined and maybe slightly modified
def CharacterDisplay_DrawingProp = $C163
def CharacterDisplay_DrawingY = $C164
def CharacterDisplay_DrawingX = $C165

def LatestOAMSlot = $C166                                   ;used to keep track of OAM slots that have been used
def OAMDMALockCheckFlag = $C167                             ;if this flag is set, will check for LockOAMDMAUpdates to prevent vblank from updating OAM. otherwise, always update.
def UNKNOWN_C168 = $C168                                    ;appears to be set in a few instances, but never referenced. must've been OAM manipulation-related
def CharacterDisplay_UpdateFlag = $C169                     ;redraws character display. note that this flag is not related to changing character expression

def LockOAMDMAUpdates = $C16A                               ;used to prevent OAM DMA routine from running during vblank (in case of lag maybe so that sprites don't glitch out while being updated)
def CharacterDisplay_Expression = $C16B                     ;used to check if the expression changed, and character sprite needs redrawing

def BackgroundGraphicsID = $C16C                            ;used to load a background for visual novel portion
def BackgroundGraphicsSize = $C16D
def BackgroundGraphicsPointer = $C16F                       ;points to where the background is stored
def BackgroundGraphicsBank = $C171
def BackgroundTilemapPointer = $C172
def BackgroundTilemapBank = $C174

def CameraPositionY = $C175
def CameraPositionX = $C176
def CameraLock = $C177                                      ;if set, camera won't update (only concerns main layer and not window)
def RandomNumber = $C178                                    ;a pseudo-random number, 16-bit

def ScriptPointerOffset = $C17A                             ;16-bit, used to offset from script table pointer to get proper script data. hope that makes sense. (ScriptTablePointer+ScriptPointerOffset)
def ScriptBank = $C17C                                      ;contains a bank that points to the bank where current script is located in
def ScriptTablePointer = $C17D                              ;points to where the script pointer table is located in all banks
def ScriptExecutionState = $C17F

def ScriptSleepTimer = $C182                                ;a timer set up by a script, halts execution for a moment

;also used for debug!
def ScriptVariableCheck_FirstValue = $C184                  ;points to script variable
;$C185 - unused (actually used for debug!)
def ScriptVariableCheck_SecondValue = $C186                 ;16-bit, either a fixed value or a script variable
def ScriptVariableCheck_WhichCheck = $C188                  ;

def SubscriptStack = $C18E                                  ;64 bytes, used to keep track of every subscript we entered in currently processed script
def SubscriptStackPointer = $C1CE                           ;16-bit pointer to the latest subscript stack entry

def ContinueProcessingScriptFlag = $C1D0                    ;if set, will keep parsing commands
def LoadScriptFlag = $C1D1
def StopExecutingScriptFlag = $C1D2
def SequenceSkipFlag = $C1D3                                ;if this flag is disabled, player cannot skip some sequences with automatic text scroll like the intro. sorry bub, you're stuck in slow text hell
def SequenceSkippedFlag = $C1D4                             ;if player pressed a button, this is enabled to indicate we skipped the automatic text sequence
def FadedOutFromEventFlag = $C1D5                           ;check if VN segment faded out on its own (only set by character invite during walking out function, note that dedicated fade out script commands do NOT set this flag!)

def SkippedSequenceFadingFlag = $C1D6                       ;indicates the fading state if the player skipped a sequence
def UNKNOWN_C1D7 = $C1D7                                    ;set when enabling player choice, but doesn't have any use
def PlayerChoiceEntryOffset = $C1D8                         ;used to get relationship modifiers based on player choice

;C1D9 - ?

def SoundInitialDataPointer = $C1DA                         ;set when initializing sound engine, but not actually used
def SoundDataBank = $C1DC                                   ;which bank has sound-related data (and maybe code)
def SoundDataPointer = $C1DD                                ;set when initializing sound engine, but not actually used

def HexToDecInput = $C1DF                                   ;a generic 16-bit value that is used as an input for hex-to-dec routine

def CurrentMusic = $C1E1
def CurrentCharacter = $C1E2                                ;used to load graphics-related stuff
def CurrentCharacter_Appearance = $C1E3                     ;final appearance value for the character.

def ScriptCodeStorage = $C1E4                               ;whopping 3984 bytes (by default), eliminates the need of switching to bank 2 for scripting code

;used to store drawing attributes, depending on context it could be background tile data or sprite tile data.
def DrawingStack = $D1E4                                    ;64 bytes
def DrawingStackPointer = $D224                             ;16-bit

;$D226 - $D235 - can be used as temporary RAM for various purposes
def CurrentCharacterCount = $D226                           ;used when calculating the top 3 chracter relationships
def TransitionToGameFlag = $D226
def HolidayOrWeekendFlag = $D226                            ;during gameplay, this indicates if current day is a holiday or a weekend

def NewGame_TypedBirthMonth = $D226
def NewGame_TypedBirthDay = $D228
def NewGame_TypedBloodType = $D22A

;$D227 - cleared at title screen, but unused
;$D229 - cleared when bringing up save menu and calendar, but unused

def NewGameInfoInput_MonthDurationIndex = $D22E

def NewGameInfoInput_SelectedOtherBirthInfoFlag = $D22C

def CursorSpriteEnabler = $D22E                             ;set to FF if cursor should not show up, otherwise contains its ID
def AmountOfAvailableMapSpots = $D22F

def NewGame_CurrentBirthInfo = $D230                        ;refers to birth day, month and blood type

def BaseRelationshipSpriteDisplayable = $D230

def SelectedOption = $D230                                  ;a generic selected option RAM for multiple instances. it's either vertical or horizontal depending on context
def SelectedOption_Vertical = $D230
def SelectedOption_Horizontal = $D231
def Calendar_CurrentPage = $D231
def CharacterProfile_CurrentPage = $D231
def CurrentlySelectedMapSpot = $D231

def Calendar_DayAndEventBaseVRAM = $D22C                    ;16-bit
def Calendar_Month = $D22E
def Calendar_DayWithinMonth = $D230                         ;16-bit
def Calendar_Weekday = $D232
def Calendar_Day = $D233
def Calendar_MonthForNumber = $D234
def Calendar_Event = $D235

def SelectedClub = $D232
def ItemPrice = $D232
def ChangedSelectionPageFlag = $D233
def CurrentSelectionPage = $D234
def CurrentSelectionPageOption = $D235                      ;selected option on current page

def DatePlanner_DayCount = $D234                            ;used to look ahead for offdays where you can schedule a date with someone

def DatePlanner_EarlyOrLateDayChoice = $D234
def DatePlanner_CurrentSlotChoice = $D235

def TEMP_ARRAY = $D236                                      ;8 bytes generally used to contain an array of tiles for dynamic tilemaps
def NewGame_TypedInfo = TEMP_ARRAY
def DecimalDigitArray = TEMP_ARRAY

def TilemapDrawing_TilesPerLine = $D23E
def TilemapDrawing_LinesToDraw = $D23F
def TilemapDrawing_VRAMLoc = $D240

def NewGameInfoInput_HorizontalOption = $D242               ;doesn't seem to be used anywhere else as far as i can tell
def GenericVerticalOption = $D243                           ;used in new game save info selection screens and schedule select, maybe elsewhere
def TitleScreen_SelectedOption = GenericVerticalOption
def ScheduleScreen_SelectedOption = GenericVerticalOption
def NewGameInfoInput_VerticalOption = GenericVerticalOption
def LoadSaveWindow_SelectedSave = GenericVerticalOption

def ScheduleScreen_PickedOption = $D244                     ;confirmed option, not just one that was scrolled through

def ScheduleScreen_CurrentSelectionIndex = $D245

def NewGameInfoInput_CurrentCharacter = $D246
def GenericStateChangeIndicator = $D247                     ;generic RAM indicating state change. typically 0 - no state change, 1 - advance, 2 - cancel
def PlayerStringType = $D248                                ;this is used for getting and displaying player's name etc. 0 - second name, 1 - name, 2 - nickname
def PlayerNameMaxCharactersForInput = $D249                 ;used for name and etc entry. zero-non-inclusive (so a value of 4 = 4 characters)

;current session's time variables, 8-bit. for save file time variables specifically, look up CurrentSave_Month and so on
def CurrentMonth = $D24A                                    ;zero-inclusive (e.g. 0 = 1, 5 = 6)
def CurrentDayOfTheMonth = $D24B
def CurrentDayOfTheWeek = $D24C
def CurrentWeekOfTheMonth = $D24D
def CurrentYearHalf = $D24E                                 ;0 - first half of the year (spring and summer), 1 - second half (autumn and winter). decides the character's "outdoors" appearance
def CurrentSeason = $D24F                                   ;0 - spring, 1 - summer, 2 - Fall (or Autumn if you're British TRADEMARK), 3 - Winter

def SelectedScheduleOptionFlag = $D250                      ;set if player picked an option that can be scheduled, clear if player picked something else (e.g. relationship viewer, exit option, etc)
def CurrentDayScheduledOption_EarlyDay = $D250              ;store scheduled options to apply their effects at once
def CurrentDayScheduledOption_LaterDay = $D251

def DayOffFlag = $D252
def CurrentDayEvent = $D253                                 ;what event is supposed to happen on current day
def DayOffTime = $D254                                      ;0 - early day, 1 - later
def QuitGameFlag = $D255

def QuitClubOrJobFlag = $D256                               ;used to indicate that you quit the job or club, so it doesn't get marked as an acivity you did

def SportsClubIndex = $D257                                 ;index of the sports club the player is in

def PreviousDateSpot = $D258                                ;used to skip over the same spot where you already spent time with a character (if you agreed to go elsewhere)
def ScheduleScreenDrawBits = $D259
;D25A - ?
;D25B - ?
def CDLinkFlag = $D25C                                      ;used to save CD link flag from the intro option
def SpriteDisplayables_ID = $D25D                           ;a table of all sprite displays that are currently loaded, 10 bytes. $FF - no display. these are not used for character sprites.
def SpriteDisplayables_XPos = $D267
def SpriteDisplayables_YPos = $D271

def DynamicTilemapArray = $D27B                             ;stores tilemap location and tiles, variable size
def CalculatedRelationshipArray = $D27B                     ;used to calculate which characters have the highest relationship values
def CalculatedRelationship_TopCharacter1 = $D289
def CalculatedRelationship_TopCharacter2 = $D28A
def CalculatedRelationship_TopCharacter3 = $D28B
def CalculatedRelationship_Highest1 = $D28C
def CalculatedRelationship_Highest2 = $D28E
def CalculatedRelationship_Highest3 = $D290

def DateLocationTilemapArray = $D293                        ;stores tilemap location and tiles specific to date invitation via phone call

def TimePassingCounter = $D2AB
def CurrentScreen_AdvanceSymbolTimer = $D2AB                ;used to handle advance symbol animation
def CurrentScreen_AdvanceSymbolFlag = $D2AC

def SaveFileChecksum = $D2AD                                ;calculates the save file integrity I think

def RandomNumber_ActivityEffect = $D2AF                     ;a separate "RNG" value only rolled for activity effect

def TransitionToScheduleScreenFromTitleScreenFlag = $D2B0   ;a flag that triggers screen transition when loading into schedule screen from the title screen. "flag", because it stores a very specific values and checks it but can't be anything else.
def PlayerInventoryArray = $D2B1                            ;36 bytes, each byte corresponds to each in-game item, indicating if the player has it or not.
def DateSpotArray = $D2B1                                   ;also used for choosing a date spot for date plan phone call. takes 30 bytes

;$D2D5 - can be used as temporary RAM, has a few uses
def PlayerHasItemsFlag = $D2D5                              ;indicates that the player has at least one item in their inventory. never actually used for anything
def CurrentDayBackup = $D2D5                                ;backs up currently saved day value when calling someone for a date

def PlayerInventoryItemAmount = $D2D6                       ;a tally of items the player has
def InventoryObtainedItemsMaxPages = $D2D7

def UnobtainedItemCount = $D2D8
def InventoryUnobtainedItemsMaxPages = $D2D9

def DateSpotAmount = $D2D6
def DateSpotMaxPages = $D2D7

;$D2DA - a temporary array for various purposes
def SaveFileUnusedFlag = $D2DA                              ;3 bytes for each respective save file. false - save file used, true - save file not used.
def CurrentItemDisplayArray = $D2DA                         ;5 bytes

def SelectedCharacterForDateOrGift = $D2E0
def SelectedDateDaySlot = $D2E1
def SelectedDateDayTime = $D2E2                             ;does it happen early or later in the day?

def CurrentlyChosenGift = $D2E3
def CurrentlyChosenDateSpot = $D2E3

def MissedDateDueToExhastionFlag = $D2E4                    ;set when player misses a date due to becoming tired

def AvailableDaysForDateArray = $D2E5
def DateOccupiedEarlyDaySlotArray = AvailableDaysForDateArray+10
def DateOccupiedLateDaySlotArray = DateOccupiedEarlyDaySlotArray+10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;RAM stored to/from save file starts here

;these are actually 8 bytes each, but only a few are used
def CurrentSave_PlayerSecondName = $D303                    ;4 characters
def CurrentSave_PlayerName = $D30B                          ;4 characters
def CurrentSave_PlayerNickname = $D313                      ;6 characters

def ScriptTEMP_D31B = $D31B                                 ;scratch RAM for scripting.
def ScriptTEMP_D31D = $D31D
def ScriptTEMP_D31F = $D31F
def ScriptTEMP_D321 = $D321
def ScriptTEMP_D323 = $D323
def ScriptTEMP_D325 = $D325
def ScriptTEMP_D327 = $D327
def ScriptTEMP_D329 = $D329
def ScriptTEMP_D32B = $D32B
def ScriptTEMP_D32D = $D32D
def ScriptTEMP_D32F = $D32F
def ScriptTEMP_D331 = $D331

;there's probably more script TEMPs

def CurrentSave_LostMoney = $D355                           ;stores the amount of money lost when you lose a wallet in an event. It is added back when a character finds and returns it to you.
;D357 - script temp?
def DebugBits = $D359                                       ;Bits 1 and 2 enable respective debug scripts.

def CurrentSave_DaysPassed  = $D35B                         ;total amount of days that have passed

def CurrentSave_SmartStat = $D35D                           ;
def CurrentSave_FitStat = $D35F                             ;strength, "ability", power?
def CurrentSave_StyleStat = $D361                           ;
def CurrentSave_SkillStat = $D363                           ;
def CurrentSave_SenseStat = $D365                           ;this one is a clear cut due to using kanji for a loan word.
def CurrentSave_EnergyStat = $D367                          ;alternatively "health"
def CurrentSave_AttitudeStat = $D369                        ;a hidden stat. set when starting the game, decreases when missing a date, checked in scripts. you can never improve this stat.
def CurrentSave_Cash = $D36B                                ;

;each character get 3 relationship values
def CurrentSave_CharacterRelationship = $D36D

;def CurrentSave_RurunaRelationship = $D36D
def CurrentSave_RurunaFriendPoints = CurrentSave_CharacterRelationship
def CurrentSave_RurunaInterestPoints = CurrentSave_RurunaFriendPoints+2
def CurrentSave_RurunaLovePoints = CurrentSave_RurunaInterestPoints+2

;def CurrentSave_MizukiRelationship = $D373
def CurrentSave_MizukiFriendPoints = CurrentSave_RurunaLovePoints+2
def CurrentSave_MizukiInterestPoints = CurrentSave_MizukiFriendPoints+2
def CurrentSave_MizukiLovePoints = CurrentSave_MizukiInterestPoints+2

;def CurrentSave_YumiRelationship = $D379
def CurrentSave_YumiFriendPoints = CurrentSave_MizukiLovePoints+2
def CurrentSave_YumiInterestPoints = CurrentSave_YumiFriendPoints+2
def CurrentSave_YumiLovePoints = CurrentSave_YumiInterestPoints+2

;def CurrentSave_MiriRelationship = $D37F
def CurrentSave_MiriFriendPoints = CurrentSave_YumiLovePoints+2
def CurrentSave_MiriInterestPoints = CurrentSave_MiriFriendPoints+2
def CurrentSave_MiriLovePoints = CurrentSave_MiriInterestPoints+2

;def CurrentSave_MariRelationship = $D385
def CurrentSave_MariFriendPoints = CurrentSave_MiriLovePoints+2
def CurrentSave_MariInterestPoints = CurrentSave_MariFriendPoints+2
def CurrentSave_MariLovePoints = CurrentSave_MariInterestPoints+2

;def CurrentSave_SuzuneRelationship = $D38B
def CurrentSave_SuzuneFriendPoints = CurrentSave_MariLovePoints+2
def CurrentSave_SuzuneInterestPoints = CurrentSave_SuzuneFriendPoints+2
def CurrentSave_SuzuneLovePoints = CurrentSave_SuzuneInterestPoints+2

;def CurrentSave_MomoyoRelationship = $D391
def CurrentSave_MomoyoFriendPoints = CurrentSave_SuzuneLovePoints+2
def CurrentSave_MomoyoInterestPoints = CurrentSave_MomoyoFriendPoints+2
def CurrentSave_MomoyoLovePoints = CurrentSave_MomoyoInterestPoints+2

def CurrentSave_SelectedJobOrClub = $D397                   ;which club the player applied for, or part-time job

def CurrentSave_PlayerInventory = $D399                     ;5 bytes, bitwise, where each bit corresponds to specific item, if set, that item is in player's inventory
def CurrentSave_FoundItems = $D3A1                          ;items the player can find and return to rightful owners, bitwise, with each bit reserved by respective character (e.g. bit 0 is Ruruna's item)
def CurrentSave_AttendingParty = $D3A3                      ;Bits that are set when you agree to go to someone's party. Only bits 2 and 3 are used, for Ruruna and Suzune, respectively.
def CurrentSave_SportsClubTournamentBits = $D3A5            ;marks which club you're in will have the tournament bit set if you get it through some other sports event
def CurrentSave_StatProgressEventBits = $D3A7               ;used to see which stat-related events can happen

;D3A9 - something Romeo and Juliet play related
def CurrentSave_WalletStatus = $D3AB                        ;related to an event where you lost your wallet. Stores which character found it, then set to $FF so the event doesn't happen again. 
def CurrentSave_WristwatchStatus = $D3AD                    ;related to an event where you lost your wristwatch. Stores which character found it, then set to $FF so the event doesn't happen again.

def PreviousDateSpotStorage = $D3AF                         ;reserves a variable for each character, to remember the previous date spot
def PreviousDateSpot_Ruruna = PreviousDateSpotStorage
def PreviousDateSpot_Mizuki = PreviousDateSpot_Ruruna+2
def PreviousDateSpot_Yumi = PreviousDateSpot_Mizuki+2
def PreviousDateSpot_Miri = PreviousDateSpot_Yumi+2
def PreviousDateSpot_Mari = PreviousDateSpot_Miri+2
def PreviousDateSpot_Suzune = PreviousDateSpot_Mari+2
def PreviousDateSpot_Momoyo = PreviousDateSpot_Suzune+2

;an array containing planned date info.
;each entry is 6 bytes long:
;first is 16-bit value containing the character that was invited to a date
;second is 16-bit value containing the day of the planned date
;third is an 8-bit value containing which half of the day the date is planned to occur
;fourth is an 8-bit value containing the chosen location of the planned date
;there are 10 entries max, which means the size is 10 * 6 = 60 bytes
def CurrentSave_PlannedDatesArray = $D3BD

def SelectedCharacterForGift = $D405
def SelectedGift = $D407

def CurrentSave_MetCharacterBits = $D409                    ;sets specific bits for each character you met.
def CurrentSave_CDLinkFlag = $D40B                          ;some copies came with an audio CD that you could sync with the Game Boy for intro and ending. This flag makes text scroll slower to match.
def CurrentSave_ShrinePhotoCharacter = $D40D                ;$FF - didnt take a photo with a character, otherwise contains character's respective value. shows the photo in the ending.
def CurrentSave_BirthMonth = $D40F
def CurrentSave_BirthDay = $D411
def CurrentSave_BloodType = $D413

def WalkingHomeWithCharacterBits = $D41B                    ;bit 0 is set when a character agreed to walk home with you, with the rest of bits corresponding to each character

def SportsClubEventBits = $D41D
def SportsClubEventBits_Baseball = SportsClubEventBits
def SportsClubEventBits_Basketball = SportsClubEventBits_Baseball+2
def SportsClubEventBits_Soccer = SportsClubEventBits_Basketball+2

def ChosenMapSpot = $D423

def CurrentDateSpotStorage = $D425                          ;reserves a variable for each character. (7*2) bytes long
def CurrentDateSpot_Ruruna = CurrentDateSpotStorage
def CurrentDateSpot_Mizuki = CurrentDateSpot_Ruruna+2
def CurrentDateSpot_Yumi = CurrentDateSpot_Mizuki+2
def CurrentDateSpot_Miri = CurrentDateSpot_Yumi+2
def CurrentDateSpot_Mari = CurrentDateSpot_Miri+2
def CurrentDateSpot_Suzune = CurrentDateSpot_Mari+2
def CurrentDateSpot_Momoyo = CurrentDateSpot_Suzune+2

def SpecialDateEventBits = $D433                            ;used to enable specific dating events. in vanilla game, only for Miri.

def CurrentDateSpotStorageCopy = $D435                      ;used to trigger an event right after the current date spot event, to ask if the character wants to go somewhere else. stores the same value as CurrentDateSpotStorage
def CurrentDateSpotStorageCopy_Ruruna = CurrentDateSpotStorageCopy
def CurrentDateSpotStorageCopy_Mizuki = CurrentDateSpotStorageCopy_Ruruna+2
def CurrentDateSpotStorageCopy_Yumi = CurrentDateSpotStorageCopy_Mizuki+2
def CurrentDateSpotStorageCopy_Miri = CurrentDateSpotStorageCopy_Yumi+2
def CurrentDateSpotStorageCopy_Mari = CurrentDateSpotStorageCopy_Miri+2
def CurrentDateSpotStorageCopy_Suzune = CurrentDateSpotStorageCopy_Mari+2
def CurrentDateSpotStorageCopy_Momoyo = CurrentDateSpotStorageCopy_Suzune+2

def ShoulderTouchEventBits = $D443                          ;shoulder touch event bits, with each bit representing a specific character
def HandTouchEventBits = $D445                              ;hand touch event bits, with each bits representing a character
def CharacterOnADate = $D447                                ;the character you're currently on a date with. set to a respective character value, or $FF for no character.

def TopCharacterRelationships_FirstChar = $D449
def TopCharacterRelationships_SecondChar = $D44B
def TopCharacterRelationships_ThirdChar = $D44D

def CurrentSave_CurrentTimeOfDay = $D44F                    ;indicates if the current time of day is morning or not morning (only affects day off where you can save at any point in time)
def CurrentSave_PlayerTiredFlag = $D450

def NotGoingOutOnDateFlag = $D451                           ;clear if went out somewhere else after the first date, set if parting ways

;$D452 - D4A9 - ?

def DecisionVariable = $D4AB                                ;often used for script branching. also set when player makes a choice when presented with one

def CurrentSave_Month = $D4AD
def CurrentSave_DayOfTheMonth = $D4AF
def CurrentSave_WeekOfTheMonth = $D4B1
def CurrentSave_Season = $D4B3
def CurrentSave_YearHalf = $D4B5                            ;apparently there's an overlap in RAM, shared with the define below

def CurrentCharacter_Display = $D4B5                        ;used to determine appearance
def CurrentCharacter_Expression = $D4B7
def ChoiceOptions_DefaultOption = $D4B9
;$D4BA - completely unused, not even cleared as part of ChoiceOptions_DefaultOption
def Script16BitCounter = $D4BB                              ;some 16-bit timer that counts down. could be accessed by scripts, but doesn't seem to be used.
def FrameCounter16Bit = $D4BD                               ;
def Scripting_ParsingTextFlag = $D4BF                       ;set to false when ended text parsing
def TextDrawing_ProcessingTiming = $D4C1                    ;used to make text processing slower or faster. by default, text and text commands are processed every frame
def TextDrawing_ProcessingAmount = $D4C3                    ;this variable holds the amount of characters/text commands that can be processed at once. by default, it's 1 character at a time

;$D519 - last 16-bit variable that can be used/referenced by scripting.
def CurrentSave_DayOffFlag = $D51B
def CurrentSave_DayOffActivities = $D51D
def CurrentSave_ScheduledActivities = $D51F                 ;contains an array of chosen activities for the current week (14 bytes)

def CurrentSave_End = CurrentSave_ScheduledActivities+13    ;ends at the end of the last address.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;RAM stored to/from save file ends here

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SOUND RAM
;both music and sound pools are 1024 bytes (1KB) size
;each channel's dedicated RAM is 256 bytes apart
;$D800 - music RAM pool
;$DC00 - sound effect RAM pool

def Sound_CurrentChannelDataStack = $D800                   ;32 bytes for 16 possible entries for the same sound channel

def Sound_CurrentChannelDataStackOffset = $D820             ;8-bit, determines current position within data stack.
def Sound_CurrentChannelNoteDuration = $D821
def Sound_CurrentChannelDataPointer = $D822                 ;if high byte is set to $80, this channel is disabled. otherwise it's a 16-bit pointer to sound data for current channel

def Sound_CurrentChannelDataIndex = $D824                   ;if set to 80, the channel has either initialized data pointer or isn't supposed to play
def Sound_FirstNoteProp = $D825                             ;used to store the second data byte when encountering a normal note data pair. only used for noise properties
def Sound_CurrentChannelPredefinedVolumeArray = $D826       ;8 bytes that can be used to store different volume values and reference them with an index 
def Sound_CurrentChannelBaseFrequency = $D82E
def Sound_CurrentChannelNoteCounter = $D82F                 ;counts up until reaching the intended duration

def Sound_CurrentChannelLoopArray = $D830                   ;4 bytes, would've been used for conditional branching in sound data, but not used in vanilla game.

;$34 - pan related
def Sound_CurrentChannelPanDuration = $D834                 ;how long should it take to swap speakers. the counter counts up (its low nibble) until this value
def Sound_CurrentChannelPanCounter = $D835                  ;
;$36 - unknown, also pan related?
def Sound_CurrentChannelUpdateDisabler = $D837              ;if set, don't update channel properties. used by sound effects to tell the music data to not temper with the same channel
def Sound_CurrentChannel = $D838                            ;from 0 to 3, indicates the channel that is currently being worked with
def Sound_CurrentChannelRAMOffset = $D839                   ;contains high byte of the RAM offset for each channel. each channel RAM is 256 bytes apart

def Sound_ChannelSequenceID = $D83A                         ;an array that stores a sequence value for each channel, however it's never referenced

def Sound_SecondNoteProp = $D83E
def Sound_CurrentChannelPredefinedVolumeIndex = $D83F
;3F - current channel's volume argument?

def Sound_FrameCounter = $D840
def Sound_SpeakerVolume = $D842                             ;\these are stored after music is done (SFX can't affect these)
def Sound_SpeakerPan = $D843                                ;/

;first 6 bytes are general sound addresses that SFX and Music transfer their respective RAM to.
def Sound_Tempo = $D844
def Sound_NoiseDivisor = $D845
def Sound_Volume = $D846
def Sound_ChannelPan = $D847
;def $D848 - something volume related?
def Sound_Square1Sweep = $D849

def Sound_SFXTempo = $D84A                                  ;6 bytes of SFX-specific tempo, volume, etc

def Sound_MusicTempo = $D850                                ;6 bytes of music-specific tempo, volume, etc

def Sound_Square1DutyAndLengthBackup = $D856                ;used to preserve respective channel registers from SFX tampering
def Sound_Square2DutyAndLengthBackup = $D857

def Sound_SFX_CurrentChannelDataIndex = $DC24
def Sound_SFX_CurrentChannelUpdateDisabler = $DC37

def OAMUploadCode = $FF80