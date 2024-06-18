;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_ZW14_SpaceCell_0002B8D6_1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Alias_MapMarker.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SE_ZW14_01_HailingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_LegendaryShip.GetShipRef().RemoveFromFaction(PlayerFriendFaction)
Alias_Guardship01.GetShipRef().RemoveFromFaction(PlayerFriendFaction)
Alias_Guardship02.GetShipRef().RemoveFromFaction(PlayerFriendFaction)
Alias_Guardship03.GetShipRef().RemoveFromFaction(PlayerFriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

Scene Property SE_ZW14_01_HailingScene Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

ReferenceAlias Property Alias_LegendaryShip Auto Const Mandatory

ReferenceAlias Property Alias_GuardShip01 Auto Const Mandatory

ReferenceAlias Property Alias_GuardShip02 Auto Const Mandatory

ReferenceAlias Property Alias_GuardShip03 Auto Const Mandatory
