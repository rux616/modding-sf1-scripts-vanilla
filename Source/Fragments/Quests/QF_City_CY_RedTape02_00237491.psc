;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_CY_RedTape02_00237491 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.MoveTo(Alias_Peter.GetRef())
myPlayer.AddPerk(BackgroundIndustrialist)
myPlayer.AddPerk(FactionCrimsonFleetPerk)
myPlayer.AddPerk(BackgroundBountyHunter)
myPlayer.AddPerk(BackgroundSpaceCowboy)
myPlayer.AddPerk(StarshipEngineering)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
;Enable Hurst's Ship
Alias_PirateShip.GetRef().Enable()

;Grant a ship to the player
Frontier_ModularREF.MoveTo(CydoniaShipLandingMarker)
Frontier_ModularREF.SetLinkedRef(CydoniaShipLandingMarker, SpaceshipEnabledLandingLink)
Frontier_ModularREF.Enable()
(SQ_PlayerShip as SQ_PlayerShipScript).ResetHomeShip(Frontier_ModularREF as SpaceshipReference)

;Move the player to the proper location in space
Frontier_ModularREF.SetlinkedRef(none, SpaceshipEnabledLandingLink)
Frontier_ModularREF.MoveTo(Alias_SpaceMarker.GetRef())
Frontier_ModularREF.Enable()
Game.GetPlayer().MoveTo(Frontier_ModularREF)

; Force a short wait so the fade out request isn't made while the loading menu is up
; (which would cause it to be bashed when the loading menu goes away and tells the
; fade menu to fade in)
Debug.Trace(self + "Wait 0.1 seconds")
Utility.Wait(0.1)
Debug.Trace(self + "Finish waiting. Fade the game in.")

; fade the game in
Game.FadeOutGame(False, True, 0.0, 5.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(300)
SetStage(400)
SetStage(500)
SetStage(600)
SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
SetActive()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SetObjectiveCompleted(300)
SetObjectiveDisplayed(400)

;Enable Hurst's Ship
Alias_PirateShip.GetRef().Enable()

;Enable the map marker so players can travel there.
Alias_MapMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetObjectiveCompleted(400)
SetObjectiveDisplayed(500)

;Start the hailing scene:
Utility.Wait(5)
City_CY_RedTape02_0500_InitiateHailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0550_Item_00
Function Fragment_Stage_0550_Item_00()
;BEGIN CODE
;/
;Spawn in the other Pirate ships
Int i = 0
Int iCount = Alias_PirateShips.GetCount()
While i < iCount
	SpaceshipReference myShip = Alias_PirateShips.GetAt(i) as SpaceshipReference
	myShip.EnableWithGravJump()
	i += 1
EndWhile
/;

;Change the faction on Hurst's ship, and make it attackable
SpaceshipReference myHurstShip = Alias_PirateShip.GetShipReference()
myHurstShip.SetValue(DockingPermission, 4)
myHurstShip.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction)
myHurstShip.RemoveFromFaction(CityCYRedTape02CrimsonFleetFriendFaction)
myHurstShip.AddToFaction(CrimsonFleetFaction)


SetObjectiveCompleted(500)
If !IsObjectiveCompleted(610) && IsObjectiveDisplayed(610)
	SetObjectiveFailed(500)
EndIf
If IsObjectiveDisplayed(620)
	SetObjectiveCompleted(620)
EndIf

If !GetStageDone(650)
	SetObjectiveDisplayed(550)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SpaceshipReference myHurstShip = Alias_PirateShip.GetShipReference()
myHurstShip.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction)
myHurstShip.AddtoFaction(CityCYRedTape02CrimsonFleetFriendFaction)
myHurstShip.SetValue(DockingPermission, 1)

SetObjectiveCompleted(500)
SetObjectiveDisplayed(600)
SetObjectiveDisplayed(650)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0610_Item_00
Function Fragment_Stage_0610_Item_00()
;BEGIN CODE
SetObjectiveCompleted(600)
SetObjectiveDisplayed(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0615_Item_00
Function Fragment_Stage_0615_Item_00()
;BEGIN CODE
SetObjectiveCompleted(610)
If !GetStageDone(620)
	SetObjectiveDisplayed(620)
	SetStage(650)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0616_Item_00
Function Fragment_Stage_0616_Item_00()
;BEGIN CODE
SetObjectiveCompleted(610)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0620_Item_00
Function Fragment_Stage_0620_Item_00()
;BEGIN CODE
If !GetStageDone(615)
	SetObjectiveDisplayed(620)
	SetStage(650)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0630_Item_00
Function Fragment_Stage_0630_Item_00()
;BEGIN CODE
If GetStageDone(640)
	SetStage(645)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0640_Item_00
Function Fragment_Stage_0640_Item_00()
;BEGIN CODE
If GetStageDone(630)
	SetStage(645)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0645_Item_00
Function Fragment_Stage_0645_Item_00()
;BEGIN CODE
SetObjectiveCompleted(620)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(550, False)
SetObjectiveDisplayed(650)
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0660_Item_00
Function Fragment_Stage_0660_Item_00()
;BEGIN CODE
If !IsObjectiveCompleted(500) && IsObjectiveDisplayed(500)
	SetObjectiveFailed(500)
	SetStage(700)
EndIf

;Sets the objective to complete if the player chose to destroy the ship without boarding
If !IsObjectiveCompleted(550) && IsObjectiveDisplayed(550)
	SetObjectiveCompleted(550)
	SetStage(700)
EndIf

;Sets the optional objective to complete, if the player boarded the ship
If !IsObjectiveCompleted(650) && IsObjectiveDisplayed(650)
	SetObjectiveCompleted(650)
EndIf

If !IsObjectiveCompleted(620) && IsObjectiveDisplayed(620)
	SetObjectiveFailed(620)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
If !IsObjectiveCompleted(550) && IsObjectiveDisplayed(550)
	SetObjectiveCompleted(550)
EndIf
If !IsObjectiveCompleted(600) && IsObjectiveDisplayed(600)
	SetObjectiveFailed(600)
EndIf
If !IsObjectiveCompleted(610) && IsObjectiveDisplayed(610)
	SetObjectiveFailed(610)
EndIf
SetObjectiveDisplayed(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0703_Item_00
Function Fragment_Stage_0703_Item_00()
;BEGIN CODE
;Fail the optional objectives if the player did not get what they needed by now

;Optional Clues Objective
If !IsObjectiveCompleted(620) && IsObjectiveDisplayed(620)
	SetObjectiveFailed(620)
EndIf

;Optional Destroy Ship Objective
If !IsObjectiveCompleted(650) && IsObjectiveDisplayed(650)
	SetObjectiveFailed(650)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0704_Item_00
Function Fragment_Stage_0704_Item_00()
;BEGIN CODE
If IsObjectiveDisplayed(550)
	SetObjectiveFailed(550)
EndIf
If IsObjectiveDisplayed(650)
	SetObjectiveFailed(650)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0720_Item_00
Function Fragment_Stage_0720_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(City_CY_RedTape02_HurstNote)
SetStage(900)
City_CY_RedTape02_Blackmail.SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, City_CY_RedTape02HurstBribe.GetValue() as Int)
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
Game.GetPlayer().AddAliasedItem(City_CY_RedTape02_Package, Alias_Package, 1, False)

;Disable the orbital map marker so players can no longer travel there.
Alias_MapMarker.GetRef().Disable()

SetObjectiveCompleted(700)
SetObjectiveDisplayed(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
City_CY_RedTape03.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Actor myPlayer = Game.GetPlayer()
myPlayer.RemoveItem(City_CY_RedTape02_Package)
myPlayer.AddItem(City_CY_RedTape02_PeterPassword)
SetObjectiveCompleted(900)
SetObjectiveDisplayed(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Game.GetPlayer().SetValue(City_CY_RedTape02_ForeknowledgeAV, 1)
SetObjectiveCompleted(1000)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property City_CY_RedTape03 Auto Const Mandatory

MiscObject Property City_CY_RedTape02_Package Auto Const Mandatory

ReferenceAlias Property Alias_Package Auto Const Mandatory

Book Property City_CY_RedTape02_HurstNote Auto Const Mandatory

ReferenceAlias Property Alias_Peter Auto Const Mandatory

Key Property City_CY_RedTape02_PeterPassword Auto Const Mandatory

ReferenceAlias Property Alias_PirateShip Auto Const Mandatory

Faction Property CityCYRedTape02PirateNeutralFaction Auto Const Mandatory

Faction Property PirateFaction Auto Const Mandatory

ObjectReference Property Frontier_ModularREF Auto Const Mandatory

ObjectReference Property CydoniaShipLandingMarker Auto Const Mandatory

Keyword Property SpaceshipEnabledLandingLink Auto Const Mandatory

Quest Property SQ_PlayerShip Auto Const Mandatory

ReferenceAlias Property Alias_SpaceMarker Auto Const Mandatory

RefCollectionAlias Property Alias_PirateShips Auto Const Mandatory

Faction Property CityCYRedTape02CrimsonFleetNeutralFaction Auto Const Mandatory

Faction Property CrimsonFleetFaction Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Faction Property CityCYRedTape02CrimsonFleetFriendFaction Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory

GlobalVariable Property City_CY_RedTape02HurstBribe Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Perk Property FactionCrimsonFleetPerk Auto Const Mandatory

Perk Property BackgroundBountyHunter Auto Const Mandatory

Perk Property BackgroundSpaceCowboy Auto Const Mandatory

Perk Property BackgroundIndustrialist Auto Const Mandatory

Perk Property Chemistry Auto Const Mandatory

Quest Property City_CY_RedTape02_Blackmail Auto Const Mandatory

ActorValue Property City_CY_RedTape02_ForeknowledgeAV Auto Const Mandatory

Scene Property City_CY_RedTape02_0500_InitiateHailingScene Auto Const Mandatory

Perk Property StarshipEngineering Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
