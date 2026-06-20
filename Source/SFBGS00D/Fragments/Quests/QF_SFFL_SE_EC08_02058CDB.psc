;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_EC08_02058CDB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Set SE Location Alias
Location currentLocation = Alias_CenterMarker.GetRef().GetCurrentLocation()
Alias_SELocation.ForceLocationTo(currentLocation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_SE_EC08_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_SE_EC08_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_SE_EC08_QuestScript
;END AUTOCAST
;BEGIN CODE
;Determine number of ships to keep out of total number
int NumberOfShipsToSpawn = Utility.RandomInt(0,3)
kmyQuest.SpawnShips(NumberOfShipsToSpawn)

;There is a 50% chance that one of the ships will not be destroyed
if (NumberOfShipsToSpawn > 0)
    int intactShip = Utility.RandomInt(0,1)
    kmyQuest.SetupDerelict(intactShip)
else
    SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_SE_EC08_QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_SE_EC08_QuestScript kmyQuest = __temp as SFBGS00D:SFFL_SE_EC08_QuestScript
;END AUTOCAST
;BEGIN CODE
;Determine number of ships to keep out of total number
int NumberOfShipsToSpawn = Utility.RandomInt(1,3)
kmyQuest.SpawnShips(NumberOfShipsToSpawn)

;Keep one ship as boardable derelict
int intactShip = 1
kmyQuest.SetupDerelict(intactShip)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_02
Function Fragment_Stage_0010_Item_02()
;BEGIN CODE
;Enable Space Mines, if they are not already
Alias_SpaceMines.EnableAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if Alias_ActiveCompanion.IsFilled()
    Scene_10_CompanionInterjection.Start()
else
    ObjectReference closestCompanion = Game.FindClosestReferenceOfAnyTypeInListFromRef(Default_CompanionsList, Game.GetPlayer(), 200.0)
    if (closestCompanion)
        Debug.Trace("Companion found.")
        Alias_ClosestInactiveCompanion.ForceRefTo(closestCompanion)
        Scene_10_InactiveCompanionInterjection.Start()
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Scene_100_CompanionInterjection_Hit.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Quest BoardingEncounter

if (isStageDone(40))
    BoardingEncounter = BE_EC08_Corpses
elseif (isStageDone(50))
    BoardingEncounter = BE_EC08_Hazards
elseif (isStageDone(60))
    BoardingEncounter = BE_EC08_Leeches
else
    BoardingEncounter = BE_EC08_Generic
endif

Alias derelictAlias_lockableDoors = BoardingEncounter.GetAlias(14)
derelictAlias_lockableDoors.CopyIntoAlias(Alias_BoardableDerelict_Doors)

Alias derelictAlias_CockpitDoor = BoardingEncounter.GetAlias(10)
derelictAlias_CockpitDoor.CopyIntoAlias(Alias_BoardableDerelict_CockpitDoor)

if (Alias_ActiveCompanion.IsFilled())
    SFFL_SE_EC08_150_BoardingCompanionInterjection.Start()
    ;Debug.Trace("Companion commented on Derelict ship.")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
if IsStageDone(30)
    BE_EC08_Generic.SetStage(200)
elseif IsStageDone(40)
    BE_EC08_Corpses.SetStage(200)
elseif IsStageDone(50)
    BE_EC08_Hazards.SetStage(200)
elseif IsStageDone(60)
    BE_EC08_Leeches.SetStage(200)
endif

if (Alias_ActiveCompanion.IsFilled())
    SFFL_SE_EC08_200_SelfDestructCompanion.Start()
else
    SFFL_SE_EC08_200_SelfDestruct.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SpaceshipReference boardableDerelict = Alias_BoardableDerelict.GetShipRef()
boardableDerelict.PlaceAtMe(SelfDestruct,1,false,false,true,None,Alias_SelfDestructCharge,false)
boardableDerelict.KillEssential()
Utility.Wait(0.2)
Alias_SelfDestructCharge.GetRef().DamageObject(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
if IsStageDone(30)
    BE_EC08_Generic.SetStage(300)
elseif IsStageDone(40)
    BE_EC08_Corpses.SetStage(300)
elseif IsStageDone(50)
    BE_EC08_Hazards.SetStage(300)
elseif IsStageDone(60)
    BE_EC08_Leeches.SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Reset()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_SpaceMines Auto Const Mandatory

RefCollectionAlias Property Alias_DerelictShips Auto Const Mandatory

Scene Property Scene_10_CompanionInterjection Auto Const Mandatory

Scene Property Scene_100_CompanionInterjection_Hit Auto Const Mandatory

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

Quest Property thisQuest Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

Keyword Property DerelictShip_Corpses_Keyword Auto Const Mandatory

Keyword Property DerelictShip_Hazards_Keyword Auto Const Mandatory

Keyword Property DerelictShip_HeatLeeches_Keyword Auto Const Mandatory

Scene Property Scene_10_InactiveCompanionInterjection Auto Const Mandatory

ReferenceAlias Property Alias_ActiveCompanion Auto Const Mandatory

FormList Property Default_CompanionsList Auto Const Mandatory

ReferenceAlias Property Alias_ClosestInactiveCompanion Auto Const Mandatory

ReferenceAlias Property Alias_BoardableDerelict Auto Const Mandatory

ReferenceAlias Property Alias_TravelMarkerB03 Auto Const Mandatory

Quest Property BE_EC08_Generic Auto Const Mandatory

Quest Property BE_EC08_Corpses Auto Const Mandatory

Quest Property BE_EC08_Hazards Auto Const Mandatory

Quest Property BE_EC08_Leeches Auto Const Mandatory

RefCollectionAlias Property Alias_BoardableDerelict_Doors Auto Const Mandatory

ReferenceAlias Property Alias_BoardableDerelict_CockpitDoor Auto Const Mandatory

Scene Property SFFL_SE_EC08_200_SelfDestruct Auto Const Mandatory

Scene Property SFFL_SE_EC08_200_SelfDestructCompanion Auto Const Mandatory

Scene Property SFFL_SE_EC08_150_BoardingCompanionInterjection Auto Const Mandatory

GlobalVariable Property BE_EC08_SelfDestructDist Auto Const Mandatory

GlobalVariable Property BE_EC08_SelfDestructDistRandom Auto Const Mandatory

ReferenceAlias Property Alias_SelfDestructCharge Auto Const Mandatory

MovableStatic Property SelfDestruct Auto Const Mandatory

LocationAlias Property Alias_SELocation Auto Const Mandatory
