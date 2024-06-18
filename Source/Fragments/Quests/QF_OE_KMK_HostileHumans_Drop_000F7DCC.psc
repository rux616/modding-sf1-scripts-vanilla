;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KMK_HostileHumans_Drop_000F7DCC Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.LandShip()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_MapMarker.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
setstage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
setstage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.LaunchShip(0)
utility.wait(utility.RandomFloat(1.0, 3.0))
kmyQuest.LaunchShip(1)
utility.wait(utility.RandomFloat(1.0, 3.0))
kmyQuest.LaunchShip(2)
if Alias_OE_Location.GetLocation().HasKeyword(LocTypeOE_ThemeEmptyKeyword)
  Alias_MapMarker.TryToDisable()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_NPC_Group00 Auto Const Mandatory

Keyword Property BEDisembarkerLink Auto Const Mandatory

ReferenceAlias Property Alias_ShipA Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const Mandatory

LocationAlias Property Alias_OE_Location Auto Const Mandatory
