;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_CY_StartUp01_00222E40 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Gustavo.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Jane.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
Alias_Ship.GetRef().Enable()
Alias_SCMapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(250)

SpaceshipReference myJaneShip = Alias_Ship.GetShipReference()
myJaneShip.RemoveFromFaction(CityCYStartup01NeutralFaction)
myJaneShip.AddtoFaction(CityCYStartup01FriendFaction)
myJaneShip.SetValue(DockingPermission, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
If !IsObjectiveCompleted(200)
	SetObjectiveFailed(200)
EndIf
SetObjectiveCompleted(250)
SetObjectiveDisplayed(300)

Actor ErickRef = Alias_Erick.GetActorRef()
ErickRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0301_Item_00
Function Fragment_Stage_0301_Item_00()
;BEGIN CODE
If !GetStageDone(350)
	Alias_Gustavo.GetActorRef().EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
Alias_Gustavo.GetActorRef().EvaluatePackage()
SetStage(400)
Game.GetPlayer().SetValue(City_CY_Startup01_Convince_Foreknowledge_AV, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0340_Item_00
Function Fragment_Stage_0340_Item_00()
;BEGIN CODE
Alias_Gustavo.GetActorRef().EvaluatePackage()
SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
If GetStageDone(301)
	SetObjectiveCompleted(300)
Else
	SetObjectiveFailed(300)
EndIf
SetObjectiveDisplayed(350)

;Make The Mercs hostile to the player
Actor myPlayer = Game.GetPlayer()
Actor myGustavo = Alias_Gustavo.GetActorRef()
myGustavo.RemoveFromFaction(CityCYStartup01NeutralFaction)
myGustavo.RemoveFromFaction(CityCYStartup01FriendFaction)
myGustavo.AddToFaction(CityCYStartup01HostileFaction)
myGustavo.EvaluatePackage()
myGustavo.StartCombat(myPlayer)

Alias_Mercs.RemoveFromFaction(CityCYStartup01NeutralFaction)
Alias_Mercs.RemoveFromFaction(CityCYStartup01FriendFaction)
Alias_Mercs.AddToFaction(CityCYStartup01HostileFaction)
Alias_Mercs.EvaluateAll()
Alias_Mercs.StartCombatAll(myPlayer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
If GetStageDone(370)
	SetObjectiveCompleted(350)
	SetStage(400)
	Alias_Ship.GetShipRef().SetValue(SpaceshipCrew, 0)
	If GetStageDone(410)
		kmyQuest.RemovePassengerActor(Alias_Erick.GetActorRef())
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0370_Item_00
Function Fragment_Stage_0370_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
If GetStageDone(360)
	SetObjectiveCompleted(350)
	SetStage(400)
	Alias_Ship.GetShipRef().SetValue(SpaceshipCrew, 0)
	If GetStageDone(410)
		kmyQuest.RemovePassengerActor(Alias_Erick.GetActorRef())
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(300)
	SetObjectiveCompleted(300)
EndIf
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0410_Item_00
Function Fragment_Stage_0410_Item_00()
;BEGIN AUTOCAST TYPE defaultpassengerquestscript
Quest __temp = self as Quest
defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript
;END AUTOCAST
;BEGIN CODE
Actor ErickRef = Alias_Erick.GetActorRef()
ErickRef.EvaluatePackage()

;If the player failed to negotiate for the ship, 
;send Erick back with the player
If GetStageDone(340)
	ErickRef.EvaluatePackage()
	kmyQuest.AddPassenger(Alias_Erick)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
Alias_Erick.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
If !GetStageDone(340) && !GetStageDone(360)
	Alias_Erick.GetRef().MoveTo(Alias_ErickCydoniaMarker.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0520_Item_00
Function Fragment_Stage_0520_Item_00()
;BEGIN CODE
Alias_Erick.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Game.GetPlayer().AddPerk(City_CY_Startup01_VendorDiscount)
(Alias_Jane.GetRef()).SetLinkedRef(Alias_JaneContainer02.GetRef(), VendorContainerKeyword01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SetObjectiveCompleted(500)
Alias_SCMapMarker.GetRef().Disable()

If GetStageDone(340)
	ErickEliteCrewQuest.SetStage(1)
EndIf

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Gustavo Auto Const Mandatory

RefCollectionAlias Property Alias_Mercs Auto Const Mandatory

Faction Property CityCYStartup01HostileFaction Auto Const Mandatory

ReferenceAlias Property Alias_ErickCydoniaMarker Auto Const Mandatory

ReferenceAlias Property Alias_Erick Auto Const Mandatory

ReferenceAlias Property Alias_Jane Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_Ship Auto Const Mandatory

Quest Property ErickEliteCrewQuest Auto Const

ReferenceAlias Property Alias_SCMapMarker Auto Const Mandatory

Faction Property CityCYStartup01NeutralFaction Auto Const Mandatory

Faction Property CityCYStartup01FriendFaction Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

ActorValue Property City_CY_Startup01_Convince_Foreknowledge_AV Auto Const Mandatory

Faction Property Vendor_City_CY_JanesFaction01 Auto Const Mandatory

Faction Property Vendor_City_CY_JanesFaction02 Auto Const Mandatory

ReferenceAlias Property Alias_JaneContainer02 Auto Const Mandatory

Keyword Property VendorContainerKeyword01 Auto Const Mandatory

Perk Property City_CY_Startup01_VendorDiscount Auto Const Mandatory

ActorValue Property SpaceshipCrew Auto Const Mandatory
