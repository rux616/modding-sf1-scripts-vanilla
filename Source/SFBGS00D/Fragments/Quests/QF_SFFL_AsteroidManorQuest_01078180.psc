;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_AsteroidManorQuest_01078180 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Function to grant ownership
((self as quest) as sq_PlayerHouseScript).PurchaseHouse(SFFL_AsteroidManorCostGlobal, SFFL_AsteroidManorHouseKey)

; Add player to docking faction
Game.GetPlayer().AddToFaction(SFFL_AsteroidManorDockingFaction)

; Objective to visit home
SetObjectiveDisplayed(10)

; Enable the map marker and add it to the map
SFFL_AsteroidManorMapMarker.Enable()
SFFL_AsteroidManorMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
; Set from the attached default location change script
; when the player arrives in the Asteroid Sanctuary space cell

; Used to condition the change in QT
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property SFFL_AsteroidManorHouseKey Auto Const Mandatory
GlobalVariable Property SFFL_AsteroidManorCostGlobal Auto Const Mandatory

ObjectReference Property SFFL_AsteroidManorMapMarker Auto Const Mandatory

Faction Property SFFL_AsteroidManorDockingFaction Auto Const Mandatory
