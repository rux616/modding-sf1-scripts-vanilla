;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KMK_HostileHumans_002308A3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.LandShip()

; check if any sandboxers - if not, set stage 200 (count them as already "dead")
if Alias_NPCs_Sandboxers.GetCount() == 0
  SetStage(200)
endif
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

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
; roll to see if ships take off when boarded
if Game.GetDieRollSuccess(OE_HostileShipTakeoffChance.GetValueInt())
  setstage(500)
endif
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

RefCollectionAlias Property Alias_NPCs_Sandboxers Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

RefCollectionAlias Property Alias_NPCs_ShipC Auto Const Mandatory

Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const Mandatory

LocationAlias Property Alias_OE_Location Auto Const Mandatory

GlobalVariable Property OE_HostileShipTakeoffChance Auto Const Mandatory
