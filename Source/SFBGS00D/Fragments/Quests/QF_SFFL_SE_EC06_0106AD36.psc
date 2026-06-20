;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_EC06_0106AD36 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Setup Fake Distress Beacon
SpaceshipReference satelliteShip = Alias_Satellite.GetShipRef()
satelliteShip.SetValue(Aggression,0)
satelliteShip.SetValue(SpaceshipCrew,0)

;Change beacon's name
ObjectReference satelliteObject = Alias_Satellite.GetRef()
int altNameCount = Alt_Satellite_Names.Length
int nameIndex = Utility.RandomInt(0, altNameCount - 1)
Message satelliteName = Alt_Satellite_Names[nameIndex]
satelliteObject.SetOverrideName(satelliteName)

ObjectReference randomMarker = SatelliteSpawnPoints[Utility.RandomInt(0,SatelliteSpawnPoints.Length - 1)].GetRef()
satelliteShip.MoveTo(randomMarker)

;Set SE Location Alias
Location currentLocation = Alias_CenterMarker.GetRef().GetCurrentLocation()
SELocation.ForceLocationTo(currentLocation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SSFL_SE_EC06_QuestScript
Quest __temp = self as Quest
SFBGS00D:SSFL_SE_EC06_QuestScript kmyQuest = __temp as SFBGS00D:SSFL_SE_EC06_QuestScript
;END AUTOCAST
;BEGIN CODE
;Refill pirate ship collection alias
kmyQuest.FillPirateShipsAlias()
Alias_PirateShips.DisableAll()

;Setup space mines, if any
if (Alias_SpaceMines.GetCount() > 0)
    Alias_SpaceMines.EnableAll()
endif

;Safety to stop satellite from moving
SpaceshipReference satellite = Alias_Satellite.GetShipRef()
Utility.Wait(0.1)
satellite.SetForwardVelocity(0)

;Start companion scene
if Alias_ActiveCompanion.IsFilled()
    Scene_10_CompanionInterjection.Start()
endif

;Start pre-Hail scene
Scene_10_PreHail.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SpaceshipReference satellite = Alias_Satellite.GetShipRef()
satellite.SetValue(SpaceshipCrew,1)
satellite.SetEssential(false)

;Start Hailing scene
Utility.Wait(1.5)
Scene_50_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
Alias_Satellite.GetRef().Disable()
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SSFL_SE_EC06_QuestScript
Quest __temp = self as Quest
SFBGS00D:SSFL_SE_EC06_QuestScript kmyQuest = __temp as SFBGS00D:SSFL_SE_EC06_QuestScript
;END AUTOCAST
;BEGIN CODE
SpaceshipReference pirate01 = Alias_PirateShip01.GetShipRef()
SpaceshipReference pirate02 = Alias_PirateShip02.GetShipRef()
SpaceshipReference PlayerShip = Alias_PlayerShip.GetShipRef()

pirate01.Disable()
if (pirate01.IsDisabled() || PlayerShip.GetDistance(pirate01) > 10000)
    pirate01.Disable()
    pirate01.MoveNear(PlayerShip,PlayerShip.CONST_NearPosition_ForwardWide,PlayerShip.CONST_NearDistance_Moderate,PlayerShip.CONST_NearFacing_TowardSmall)
    pirate02.MoveNear(PlayerShip,PlayerShip.CONST_NearPosition_Random,PlayerShip.CONST_NearDistance_Moderate,PlayerShip.CONST_NearFacing_TowardSmall)
    Utility.Wait(3.0)
    Debug.Trace("First pirate ship spawned.")
    pirate01.EnableWithGravJump()
    kmyQuest.PirateShipCount = 1
    Utility.Wait(0.3)
    if (Utility.RandomFloat() < 0.5)
        Debug.Trace("Second pirate ship spawned.")
        pirate02.EnableWithGravJump()
        kmyQuest.PirateShipCount += 1
    endif
    Utility.Wait(0.3)
    Pirate01_Scene.Start()
else
    SetStage(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
float pirateSpawnRoll = Utility.RandomFloat()

if (!IsStageDone(100) && !IsStageDone(150) && pirateSpawnRoll < 0.5)
    Debug.Trace("Ship comes to check on Beacon")
    ;First wait 10 to 20 seconds before spawning ship
    float randomTime = Utility.RandomFloat(10.0,20.0)
    Utility.Wait(randomTime)
    
    ;Spawn single pirate ship
    SpaceshipReference pirate01 = Alias_PirateShip01.GetShipRef()
    pirate01.MoveTo(Alias_GeneralMarker06.GetRef())
    ;pirate01.SetAlert(false)
    pirate01.StopCombatAlarm()
    pirate01.EnableWithGravJump()

    ;Start "checking on beacon" scene
    Scene_140_PirateCheckinOnBeacon.Start()
else
    Debug.Trace("No ship checking on Beacon")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN CODE
Alias_PirateShip01.GetShipRef().EvaluatePackage()
float randomTime = Utility.RandomFloat(10.0,20.0)
Utility.Wait(randomTime)
SFFL_SE_EC06_135_PirateShipLeaves.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0135_Item_00
Function Fragment_Stage_0135_Item_00()
;BEGIN CODE
SpaceshipReference pirate01 = Alias_Pirateship01.GetShipRef() as SpaceshipReference
pirate01.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
Alias_PirateShip01.GetShipRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SpaceshipReference pirate01 = Alias_PirateShip01.GetShipRef()
SpaceshipReference pirate02 = Alias_PirateShip02.GetShipRef()

pirate01.EvaluatePackage()
pirate02.EvaluatePackage()

Scene_150_CompanionInterjection.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SSFL_SE_EC06_QuestScript
Quest __temp = self as Quest
SFBGS00D:SSFL_SE_EC06_QuestScript kmyQuest = __temp as SFBGS00D:SSFL_SE_EC06_QuestScript
;END AUTOCAST
;BEGIN CODE
if (!IsStageDone(200))
    SetStage(200)
else
    kmyQuest.CheckPirateDeaths()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SSFL_SE_EC06_QuestScript
Quest __temp = self as Quest
SFBGS00D:SSFL_SE_EC06_QuestScript kmyQuest = __temp as SFBGS00D:SSFL_SE_EC06_QuestScript
;END AUTOCAST
;BEGIN CODE
if (!IsStageDone(200))
    SetStage(200)
else
    kmyQuest.CheckPirateDeaths()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SSFL_SE_EC06_QuestScript
Quest __temp = self as Quest
SFBGS00D:SSFL_SE_EC06_QuestScript kmyQuest = __temp as SFBGS00D:SSFL_SE_EC06_QuestScript
;END AUTOCAST
;BEGIN CODE
;Another pirate ship has a chance to arrive after one has been destroyed
if (Utility.RandomFloat() < 0.75)
    Debug.Trace("Another pirate ship comes after a first was destroyed.")
    SpaceshipReference pirate03 = Alias_PirateShip03.GetShipRef()
    pirate03.EnableWithGravJump()
    kmyQuest.PirateShipCount += 1
    Utility.Wait(0.2)
    Pirate03_Scene.Start()
else
    kmyQuest.CheckPirateDeaths()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SpaceshipReference pirate03 = Alias_PirateShip03.GetShipRef()
pirate03.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SSFL_SE_EC06_QuestScript
Quest __temp = self as Quest
SFBGS00D:SSFL_SE_EC06_QuestScript kmyQuest = __temp as SFBGS00D:SSFL_SE_EC06_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CheckPirateDeaths()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
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

ReferenceAlias Property Alias_PirateShip01 Auto Const Mandatory

ReferenceAlias Property Alias_PirateShip02 Auto Const Mandatory

Scene Property Pirate01_Scene Auto Const Mandatory

ReferenceAlias Property Alias_PirateShip03 Auto Const Mandatory

Scene Property Pirate03_Scene Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Scene Property Scene_50_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_GeneralMarker06 Auto Const Mandatory

ReferenceAlias Property Alias_GeneralMarker07 Auto Const Mandatory

ReferenceAlias Property Alias_GeneralMarker08 Auto Const Mandatory

RefCollectionAlias Property Alias_GeneralMarkers Auto Const Mandatory

ReferenceAlias Property Alias_Satellite Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Scene Property Scene_10_CompanionInterjection Auto Const Mandatory

Scene Property Scene_150_CompanionInterjection Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Scene Property Scene_140_PirateCheckinOnBeacon Auto Const Mandatory

RefCollectionAlias Property Alias_SpaceMines Auto Const Mandatory

Scene Property SFFL_SE_EC06_135_PirateShipLeaves Auto Const Mandatory

ReferenceAlias Property Alias_ActiveCompanion Auto Const Mandatory

Message[] Property Alt_Satellite_Names Auto Const Mandatory

Scene Property Scene_10_PreHail Auto Const Mandatory

ReferenceAlias[] Property SatelliteSpawnPoints Auto Const Mandatory

RefCollectionAlias Property Alias_PirateShips Auto Const Mandatory

LocationAlias Property SELocation Auto Const

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory
