;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KMK_NPCsVsCreatures01_0008AEDE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.LandShip()
Alias_MapMarker.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_NPC_Group00 Auto Const Mandatory

Keyword Property BEDisembarkerLink Auto Const Mandatory

ReferenceAlias Property Alias_ShipA Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
