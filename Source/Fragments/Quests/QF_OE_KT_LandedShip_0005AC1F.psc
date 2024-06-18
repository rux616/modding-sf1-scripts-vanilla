;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_LandedShip_0005AC1F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_Container.RefillAlias()
Alias_Container01.RefillAlias()

ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef()
mySeat.BlockActivation(true, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_NPC_Group00.EvaluateAll()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
OE_KT_LandedShip_SceneFlavor.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef()

mySeat.BlockActivation(false, false)
Alias_ShipA_PilotSeat.Clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_ShipCockpit.Clear()
Alias_NPC_Group00.AddtoFaction(PlayerEnemyFaction)
Alias_NPC_Group00.SetValue(Aggression, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Alias_ShipA.RefillDependentAliases()

Alias_ShipA.GetShipRef().SetExteriorLoadDoorInaccessible(False)
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
;kmyQuest.LaunchAllShips()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN AUTOCAST TYPE oe_shipsaddonscript
Quest __temp = self as Quest
oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript
;END AUTOCAST
;BEGIN CODE
;kmyQuest.LandShip(2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

RefCollectionAlias Property Alias_NPC_Group00 Auto Const Mandatory

ReferenceAlias Property Alias_NPC00 Auto Const Mandatory

Scene Property OE_KT_LandedShip_SceneFlavor Auto Const Mandatory

ReferenceAlias Property Alias_ShipLandingMarker Auto Const Mandatory

ReferenceAlias Property Alias_ShipCockpit Auto Const Mandatory

LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const Mandatory

LocationAlias Property Alias_ShipA_InteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const Mandatory

ReferenceAlias Property Alias_ShipA Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Container Auto Const Mandatory

ReferenceAlias Property Alias_Container01 Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_PilotSeat Auto Const Mandatory
