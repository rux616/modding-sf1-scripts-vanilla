;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE_EC02_0106482B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;Set SE Location Alias
Location currentLocation = Alias_GeneralMarker01.GetRef().GetCurrentLocation()
Alias_SELocation.ForceLocationTo(currentLocation)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SpaceshipReference derelict = Alias_DerelictShip.GetShipRef()
derelict.SetValue(DockingPermission,0)
derelict.SetValue(ShipSpeedMult,0.0)
derelict.SetValue(Aggression,0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Scene_50_CompanionComment.Start()

SpaceshipReference derelict = Alias_DerelictShip.GetShipRef()
derelict.SetValue(DockingPermission,0)
derelict.SetValue(ShipSpeedMult,0.0)
derelict.SetValue(Aggression,0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SpaceshipReference derelict = Alias_DerelictShip.GetShipRef()
derelict.SetValue(Aggression,2)
derelict.SetValue(DockingPermission,3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_DaxBurroughs.GetActorRef().SetLookAt(Game.GetPlayer(),true)
Alias_DaxBurroughs.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
SFFL_SE_EC02_160_SelfDestruct.Start()
BoardingEncounter.SetStage(370)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
BoardingEncounter.SetStage(380)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
Alias_DerelictShip.GetShipRef().SetValue(SpaceshipCrew,0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;If Dax engaged in combat and is still aboard his ship, have it attack us

SpaceshipReference derelict = Alias_DerelictShip.GetShipRef()
if (!Alias_DaxBurroughs.GetRef().IsInLocation(Alias_playerShipInteriorLocation.GetLocation()))
    derelict.SetValue(Aggression,2)
    derelict.SetValue(DockingPermission,3)
    derelict.InstantUndock()
    derelict.StartCombat(Alias_PlayerShip.GetShipRef())
else
    derelict.SetValue(SpaceshipCrew,0)    
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddPassenger(Alias_DaxBurroughs)
SpaceshipReference derelict = Alias_DerelictShip.GetShipRef()
derelict.SetValue(SpaceshipCrew,0)
;derelict.SetValue(DockingPermission,4)
;derelict.InstantUndock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SpaceshipReference derelictShip = Alias_DerelictShip.GetShipRef()
derelictShip.PlaceAtMe(SelfDestruct,1,false,false,true,None,Alias_SelfDestructCharge,false)
derelictShip.KillEssential()
Utility.Wait(0.2)
Alias_SelfDestructCharge.GetRef().DamageObject(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;Make sure stage 300 is set if Dax Burroughs is inside the ship
if (Alias_DaxBurroughs.GetRef().IsInLocation(Alias_PlayerShipInteriorLocation.GetLocation()))
    Debug.Trace("Set stage 300 on SFFL_SE_EC02")
    SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
Actor Dax = Alias_DaxBurroughs.GetActorRef()
kmyQuest.RemovePassengerActor(Dax)

SetObjectiveCompleted(300)
CompleteQuest()

if (!IsStageDone(820))
    if (IsStageDone(660))
        Dax.MoveTo(Game.GetPlayer())
    else
        Dax.MoveTo(Alias_PassengerDestinationMarker.GetRef(),0.5,3.0,0.0)
        ;Dax will wait for you a bit before leaving
        Utility.Wait(12.0)
        if (!IsStageDone(700))
            SetStage(670)
        endif
    endif
else
    Dax.MoveTo(Alias_DaxDestination.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
Game.FadeOutGame(false, true, 2.0, 1.0)
;Check to see if player has exited ship before Dax
if (IsStageDone(600) && !IsStageDone(650))
    SetStage(650)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0670_Item_00
Function Fragment_Stage_0670_Item_00()
;BEGIN CODE
Alias_DaxBurroughs.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Alias_DaxBurroughs.GetActorRef().EvaluatePackage()
Scene_650_Goodbye.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
Alias_DaxBurroughs.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0820_Item_00
Function Fragment_Stage_0820_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
if (!IsStageDone(650))
    SetStage(650)
endif
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0830_Item_00
Function Fragment_Stage_0830_Item_00()
;BEGIN CODE
Alias_DaxBurroughs.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0855_Item_00
Function Fragment_Stage_0855_Item_00()
;BEGIN CODE
Alias_DaxBurroughs.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0865_Item_00
Function Fragment_Stage_0865_Item_00()
;BEGIN CODE
Alias_DaxBurroughs.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0870_Item_00
Function Fragment_Stage_0870_Item_00()
;BEGIN CODE
Actor Dax = Alias_DaxBurroughs.GetActorRef()
Dax.EvaluatePackage()
Dax.StartCombat(Game.GetPlayer())
SetObjectiveSkipped(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0890_Item_00
Function Fragment_Stage_0890_Item_00()
;BEGIN CODE
;Make sure the ship no longer shoots back after you leave
Alias_DerelictShip.GetShipRef().SetValue(SpaceshipCrew,0)

if (IsObjectiveDisplayed(300))
    SetObjectiveFailedIfNotCompleted(300)
endif

;Stop the quest if we're no longer on the derelict ship.
;If not delay until we leave.

if (!Game.GetPlayer().IsInLocation(Alias_DerelictShipInterior.GetLocation()))
    Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0895_Item_00
Function Fragment_Stage_0895_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
if (BoardingEncounter.IsRunning() || BoardingEncounter.IsActive())
    BoardingEncounter.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DerelictShip Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ReferenceAlias Property Alias_DaxBurroughs Auto Const Mandatory

ReferenceAlias Property Alias_DerelictCockpitDoor Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Quest Property BoardingEncounter Auto Const Mandatory

Scene Property Scene_50_CompanionComment Auto Const Mandatory

Scene Property Scene_650_Goodbye Auto Const Mandatory

Scene Property Scene_850_FirstWarning Auto Const Mandatory

Scene Property Scene_860_SecondWarning Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Scene Property SFFL_SE_EC02_160_SelfDestruct Auto Const Mandatory

LocationAlias Property Alias_DerelictShipInterior Auto Const Mandatory

ReferenceAlias Property Alias_SelfDestructCharge Auto Const Mandatory

MovableStatic Property SelfDestruct Auto Const Mandatory

ActorValue Property ShipSpeedMult Auto Const Mandatory

ReferenceAlias Property Alias_GeneralMarker01 Auto Const Mandatory

LocationAlias Property Alias_SELocation Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

LocationAlias Property Alias_playerShipInteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_PassengerDestinationMarker Auto Const Mandatory

ReferenceAlias Property Alias_DaxDestination Auto Const Mandatory
