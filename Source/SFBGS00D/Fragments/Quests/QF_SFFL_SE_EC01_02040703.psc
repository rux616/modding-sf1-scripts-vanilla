;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_EC01_02040703 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SpaceshipReference CargoShipRef = Alias_cargoShip.GetShipRef() as SpaceshipReference

float shipDamage = CargoShipRef.GetValue(ShipHealth) * 0.5
float engineDamage = CargoShipRef.GetValue(ShipSystemEngineHealth)

CargoShipRef.DamageValue(ShipHealth,shipDamage)
CargoShipRef.EnablePartRepair(ShipHealth,false)

CargoShipRef.DamageValue(ShipSystemEngineHealth,engineDamage)
CargoShipRef.EnablePartRepair(ShipSystemEngineHealth,false)

CargoShipRef.SetIgnoreFriendlyHits(true)
CargoShipRef.SetValue(SpaceshipCrew,0)

;Set SE Location Alias
Location currentLocation = Alias_MapMarker.GetRef().GetCurrentLocation()
Alias_SELocation.ForceLocationTo(currentLocation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_cargoShip.GetShipRef().SetValue(SpaceshipCrew,1)
SFFL_SE_EC01_10_Approaching.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Start the hailing scene
;Utility.Wait(5.0)
;Alias_cargoShip.GetShipRef().SetValue(SpaceshipCrew,1)
if (!Stage_50_Scene.IsPlaying())
    Stage_50_Scene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
Utility.Wait(0.4)
Stage_95_Scene.Start()
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Utility.Wait(3.5)
Scene_100_CompanionInterjection.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Utility.Wait(2.0)
SetStage(350)

;Cargo ship no longer needs to be Essential
Alias_cargoShip.GetShipRef().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
; Necessary to make sure we can add Gloria to the Passengers list
SQ_Followers.SetRoleInactive(Alias_Gloria.GetActorRef(),false,false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
Actor Gloria = Alias_Gloria.GetActorRef() as Actor
Location playerShipInterior = Alias_PlayerShipInteriorLocation.GetLocation()

if (playerShipInterior == Gloria.GetCurrentLocation())
    SetStage(450)
else
    SetStage(420)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0420_Item_00
Function Fragment_Stage_0420_Item_00()
;BEGIN CODE
;Stop quest if you leave space cell without Gloria
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
;Assume player has left spacecell with Gloria and landed at New Atlantis
if (!IsStageDone(400))
    SetStage(400)
endif

if (!IsStageDone(500))
    SetStage(500)
endif

Actor Gloria = Alias_Gloria.GetActorRef() as Actor
Gloria.MoveTo(Alias_Player.GetRef())
SetStage(550)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0530_Item_00
Function Fragment_Stage_0530_Item_00()
;BEGIN CODE
;Location playerShipInterior = Alias_PlayerShipInteriorLocation.GetLocation()
;Actor Gloria = Alias_Gloria.GetActorRef() as Actor
;
;if (playerShipInterior == Gloria.GetCurrentLocation())
;    Gloria.MoveTo(Alias_PassengerDestinationMarker.GetRef())
;endif

Utility.Wait(1.5)
Glora_Dialogue_Stage530.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
Gloria_Dialogue_Stage560.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0555_Item_00
Function Fragment_Stage_0555_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
if (IsStageDone(520) || IsStageDone(530))
    SetStage(600)
else
    kmyquest.AddPassenger(Alias_Gloria)
    Utility.Wait(0.25)
    kmyquest.ShipArriving(Alias_PlayerShip,true)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Location playerShipInterior = Alias_PlayerShipInteriorLocation.GetLocation()
Actor Gloria = Alias_Gloria.GetActorRef() as Actor

;Teleport Gloria outside of ship if she's still inside
if (playerShipInterior == Gloria.GetCurrentLocation())
    Gloria.MoveTo(Alias_PassengerDestinationMarker.GetRef())
endif

;Quest completed, but don't stop it in case Gloria needs to walk away
SetObjectiveCompleted(300)
CompleteQuest()

;If arrived to this stage because you took off without saying goodbye to Gloria, then Stop quest.
;Otherwise have her start walking towards Athena Tower
if (IsStageDone(530))
    Stop()
else
    Gloria.EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
if (BoardingEncounter.IsRunning() || BoardingEncounter.IsActive())
    if (BoardingEncounter.IsStageDone(100))
        BoardingEncounter.CompleteQuest()
    endif
        BoardingEncounter.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_cargoShip Auto Const Mandatory

ActorValue Property ShipSystemEngineHealth Auto Const Mandatory

ActorValue Property ShipHealth Auto Const Mandatory

Scene Property SFFL_SE_EC01_50_HailingShip Auto Const
Scene Property Stage_50_Scene Auto Const Mandatory

Scene Property Stage_95_Scene Auto Const Mandatory

ReferenceAlias Property Alias_Gloria Auto Const Mandatory

LocationAlias Property Alias_playerShipInteriorLocation Auto Const Mandatory

Quest Property BoardingEncounter Auto Const Mandatory

ActorValue Property cargoShipDockingPermission Auto Const Mandatory

RefCollectionAlias Property Alias_Passengers Auto Const Mandatory

Scene Property Gloria_Dialogue_Stage560 Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Keyword Property LocTypeSettlement Auto Const Mandatory

ReferenceAlias Property Alias_PassengerDestinationMarker Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

Scene Property Glora_Dialogue_Stage530 Auto Const Mandatory

Scene Property Scene_100_CompanionInterjection Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Scene Property SFFL_SE_EC01_10_Approaching Auto Const Mandatory

SQ_FollowersScript Property SQ_Followers Mandatory Const Auto

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

LocationAlias Property Alias_SELocation Auto Const Mandatory
