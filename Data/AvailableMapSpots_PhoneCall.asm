AmountOfAvailableSpots_PhoneCall_1E_5390:
GetTableSize AvailableSpots_PhoneCall_April_1E_53B4
GetTableSize AvailableSpots_PhoneCall_April_1E_53B4
GetTableSize AvailableSpots_PhoneCall_April_1E_53B4
GetTableSize AvailableSpots_PhoneCall_April_1E_53B4
GetTableSize AvailableSpots_PhoneCall_May_1E_53C7
GetTableSize AvailableSpots_PhoneCall_June_1E_53DA
GetTableSize AvailableSpots_PhoneCall_July_1E_53ED
GetTableSize AvailableSpots_PhoneCall_August_1E_5403
GetTableSize AvailableSpots_PhoneCall_September_1E_5419
GetTableSize AvailableSpots_PhoneCall_October_1E_542C
GetTableSize AvailableSpots_PhoneCall_November_1E_543F
GetTableSize AvailableSpots_PhoneCall_December_1E_5452

;date spots available for each month, used during phone call
AvailableSpotsPerMonth_PhoneCall_1E_539C:
dw AvailableSpots_PhoneCall_April_1E_53B4                   ;unused duplicates
dw AvailableSpots_PhoneCall_April_1E_53B4                   ;
dw AvailableSpots_PhoneCall_April_1E_53B4                   ;january through march are not playable
dw AvailableSpots_PhoneCall_April_1E_53B4
dw AvailableSpots_PhoneCall_May_1E_53C7
dw AvailableSpots_PhoneCall_June_1E_53DA
dw AvailableSpots_PhoneCall_July_1E_53ED
dw AvailableSpots_PhoneCall_August_1E_5403
dw AvailableSpots_PhoneCall_September_1E_5419
dw AvailableSpots_PhoneCall_October_1E_542C
dw AvailableSpots_PhoneCall_November_1E_543F
dw AvailableSpots_PhoneCall_December_1E_5452

AvailableSpots_PhoneCall_April_1E_53B4:
db MapSpot_School
db MapSpot_Arcade
db MapSpot_Karaoke
db MapSpot_Park
db MapSpot_River
db MapSpot_ToyStore
db MapSpot_GeneralStore
db MapSpot_PetStore
db MapSpot_BookShop
db MapSpot_SportsShop
db MapSpot_ToyStore2
db MapSpot_MediaStore
db MapSpot_Library
db MapSpot_BurgerJoint
db MapSpot_Planetarium
db MapSpot_MovieTheater
db MapSpot_AmusementPark
db MapSpot_ScenicRoad
db MapSpot_SakuraWoods
.end

AvailableSpots_PhoneCall_May_1E_53C7:
db MapSpot_School
db MapSpot_Arcade
db MapSpot_Karaoke
db MapSpot_Park
db MapSpot_River
db MapSpot_ToyStore
db MapSpot_GeneralStore
db MapSpot_PetStore
db MapSpot_BookShop
db MapSpot_SportsShop
db MapSpot_ToyStore2
db MapSpot_MediaStore
db MapSpot_Library
db MapSpot_BurgerJoint
db MapSpot_Planetarium
db MapSpot_MovieTheater
db MapSpot_AmusementPark
db MapSpot_ScenicRoad
db MapSpot_SakuraWoods
.end

AvailableSpots_PhoneCall_June_1E_53DA:
db MapSpot_School
db MapSpot_Arcade
db MapSpot_Karaoke
db MapSpot_Park
db MapSpot_River
db MapSpot_ToyStore
db MapSpot_GeneralStore
db MapSpot_PetStore
db MapSpot_BookShop
db MapSpot_SportsShop
db MapSpot_ToyStore2
db MapSpot_MediaStore
db MapSpot_Library
db MapSpot_BurgerJoint
db MapSpot_Planetarium
db MapSpot_MovieTheater
db MapSpot_AmusementPark
db MapSpot_ScenicRoad
db MapSpot_Cafe
.end

AvailableSpots_PhoneCall_July_1E_53ED:
db MapSpot_School
db MapSpot_Arcade
db MapSpot_Karaoke
db MapSpot_Park
db MapSpot_River
db MapSpot_ToyStore
db MapSpot_GeneralStore
db MapSpot_PetStore
db MapSpot_BookShop
db MapSpot_SportsShop
db MapSpot_ToyStore2
db MapSpot_MediaStore
db MapSpot_Library
db MapSpot_BurgerJoint
db MapSpot_Planetarium
db MapSpot_MovieTheater
db MapSpot_AmusementPark
db MapSpot_Beach
db MapSpot_Pool
db MapSpot_ScenicRoad
db MapSpot_Cafe
.end

db MapSpot_1A                                               ;this is just shy of the range of available spots. this area is coded to appear as an option at a very specific time

AvailableSpots_PhoneCall_August_1E_5403:
db MapSpot_School
db MapSpot_Arcade
db MapSpot_Karaoke
db MapSpot_Park
db MapSpot_River
db MapSpot_ToyStore
db MapSpot_GeneralStore
db MapSpot_PetStore
db MapSpot_BookShop
db MapSpot_SportsShop
db MapSpot_ToyStore2
db MapSpot_MediaStore
db MapSpot_Library
db MapSpot_BurgerJoint
db MapSpot_Planetarium
db MapSpot_MovieTheater
db MapSpot_AmusementPark
db MapSpot_Beach
db MapSpot_Pool
db MapSpot_ScenicRoad
db MapSpot_Cafe
.end

db MapSpot_Fireworks                                        ;same thing here

AvailableSpots_PhoneCall_September_1E_5419:
db MapSpot_School
db MapSpot_Arcade
db MapSpot_Karaoke
db MapSpot_Park
db MapSpot_River
db MapSpot_ToyStore
db MapSpot_GeneralStore
db MapSpot_PetStore
db MapSpot_BookShop
db MapSpot_SportsShop
db MapSpot_ToyStore2
db MapSpot_MediaStore
db MapSpot_Library
db MapSpot_BurgerJoint
db MapSpot_Planetarium
db MapSpot_MovieTheater
db MapSpot_AmusementPark
db MapSpot_ScenicRoad
db MapSpot_Cafe
.end

AvailableSpots_PhoneCall_October_1E_542C:
db MapSpot_School
db MapSpot_Arcade
db MapSpot_Karaoke
db MapSpot_Park
db MapSpot_River
db MapSpot_ToyStore
db MapSpot_GeneralStore
db MapSpot_PetStore
db MapSpot_BookShop
db MapSpot_SportsShop
db MapSpot_ToyStore2
db MapSpot_MediaStore
db MapSpot_Library
db MapSpot_BurgerJoint
db MapSpot_Planetarium
db MapSpot_MovieTheater
db MapSpot_AmusementPark
db MapSpot_ScenicRoad
db MapSpot_Cafe
.end

AvailableSpots_PhoneCall_November_1E_543F:
db MapSpot_School
db MapSpot_Arcade
db MapSpot_Karaoke
db MapSpot_Park
db MapSpot_River
db MapSpot_ToyStore
db MapSpot_GeneralStore
db MapSpot_PetStore
db MapSpot_BookShop
db MapSpot_SportsShop
db MapSpot_ToyStore2
db MapSpot_MediaStore
db MapSpot_Library
db MapSpot_BurgerJoint
db MapSpot_Planetarium
db MapSpot_MovieTheater
db MapSpot_AmusementPark
db MapSpot_ScenicRoad
db MapSpot_Cafe
.end

AvailableSpots_PhoneCall_December_1E_5452:
db MapSpot_School
db MapSpot_Arcade
db MapSpot_Karaoke
db MapSpot_Park
db MapSpot_River
db MapSpot_ToyStore
db MapSpot_GeneralStore
db MapSpot_PetStore
db MapSpot_BookShop
db MapSpot_SportsShop
db MapSpot_ToyStore2
db MapSpot_MediaStore
db MapSpot_Library
db MapSpot_BurgerJoint
db MapSpot_Planetarium
db MapSpot_MovieTheater
db MapSpot_AmusementPark
db MapSpot_ScenicRoad
db MapSpot_Cafe
.end