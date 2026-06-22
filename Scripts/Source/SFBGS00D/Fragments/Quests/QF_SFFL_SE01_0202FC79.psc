;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE01_0202FC79 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set SE Location Alias
Location currentLocation = Alias_CenterMarker.GetRef().GetCurrentLocation()
Alias_SELocation.ForceLocationTo(currentLocation)

;block activation on food activator initially 
Alias_GrandmasFood.GetRef().BlockActivation(true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
;encounter is essentially done, set stage 500
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0006_Item_00
Function Fragment_Stage_0006_Item_00()
;BEGIN CODE
SpaceshipReference GrandmaRef = Alias_HailingShip.GetShipRef()

GrandmaRef.SetValue(SpaceshipCrew, 0)
GrandmaRef.SetValue(Aggression, 0)
GrandmaRef.StopCombat()

;set completion global if you killed grandma before eating food or refusing
; and set stage 500
if GetStageDone(270) == 0 && GetStageDone(280) == 0 
  SE01_Completed.Mod(1)
  SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
;start the hailing scene if for some reason the changelocation was not able to set the hailing stage
if getstagedone(50) == 0
 setstage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
;get rid of objectives if you fight grandma before eating/declining the food
if isobjectivedisplayed(250) == 1 || isobjectivedisplayed(255) == 1
  if isobjectivedisplayed(250) == 1 && isobjectivedisplayed(255) == 1
    setobjectivedisplayed(250,0)
    setobjectivedisplayed(255,0)
  elseif isobjectivedisplayed(250) == 1
    setobjectivedisplayed(250,0)
  elseif isobjectivedisplayed(255) == 1  
    setobjectivedisplayed(255,0)
  endif
endif

;handle grandma aggro
Actor GrandmaRef = Alias_Grandma.GetActorRef()
SpaceshipReference GrandmaShipRef = Alias_HailingShip.GetShipRef()
ObjectReference PlayerRef = Game.GetPlayer()

GrandmaRef.AddtoFaction(PlayerEnemyFaction)
GrandmaRef.SetValue(Aggression, 1)
GrandmaShipRef.AddtoFaction(PlayerEnemyFaction)
GrandmaShipRef.SetValue(Aggression, 1)

if GrandmaRef.GetParentCell() == PlayerRef.GetParentCell()
    GrandmaRef.StartCombat(Game.GetPlayer())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0225_Item_00
Function Fragment_Stage_0225_Item_00()
;BEGIN CODE
;shut off granny's engines
Alias_HailingShip.GetShipRef().SetPartPower(1, -1, 0)
Alias_HailingShip.GetShipRef().LockPowerAllocation(1,-1)

;stop hailing scene if it's still running
HailTemplate_100a_Hailing.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
;have grandma evaluate packages
Alias_Grandma.GetActorRef().EvaluatePackage()

;handle objectives
SetObjectiveDisplayed(250)
SetObjectiveDisplayed(255)

;unblock activation on food 
Alias_GrandmasFood.GetRef().BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
DeclinedFood_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
;have player eat the food and play the food effect
Game.GetPlayer().EquipItem(Food, abSilent = true)
Alias_GrandmasFood.GetRef().Disable()

AteFood_Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0270_Item_00
Function Fragment_Stage_0270_Item_00()
;BEGIN CODE
SetObjectiveCompleted(250)
SetObjectiveDisplayed(255,0)

Actor GrandmaRef = Alias_Grandma.GetActorRef()
GrandmaRef.AddtoFaction(PlayerEnemyFaction)
GrandmaRef.SetValue(Aggression, 1)
GrandmaRef.StartCombat(Game.GetPlayer())

SE01_Completed.Mod(1)

;encounter is essentially done, set stage 500
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0280_Item_00
Function Fragment_Stage_0280_Item_00()
;BEGIN CODE
Actor GrandmaRef = Alias_Grandma.GetActorRef()
GrandmaRef.AddtoFaction(PlayerEnemyFaction)
GrandmaRef.SetValue(Aggression, 1)
GrandmaRef.StartCombat(Game.GetPlayer())

SetObjectiveCompleted(255)
SetObjectiveFailed(250)

SE01_Completed.Mod(1)

;encounter is essentially done, set stage 500
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
if Self.IsRunning() == True
 Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;disable ship
Alias_HailingShip.GetShipRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_Grandma Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory

Scene Property AteFood_Scene Auto Const Mandatory

Scene Property DeclinedFood_Scene Auto Const Mandatory

Potion Property Food Auto Const Mandatory

ReferenceAlias Property Alias_GrandmasFood Auto Const Mandatory

GlobalVariable Property SE01_Completed Auto Const Mandatory

ReferenceAlias Property Alias_CenterMarker Auto Const Mandatory

LocationAlias Property Alias_SELocation Auto Const Mandatory
