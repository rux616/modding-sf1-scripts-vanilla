;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_KT_FalseContact_0007D4CF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SpaceshipReference HailerRef = Alias_HailingShip.GetShipRef()
SpaceshipReference HailerRef01 = Alias_HailingShip01.GetShipRef()
SpaceshipReference HailerRef02 = Alias_HailingShip02.GetShipRef()

Alias_ShipFighters.AddRef(HailerRef)
Alias_ShipFighters.AddRef(HailerRef01)
Alias_ShipFighters.AddRef(HailerRef02)

HailerRef.EnableWithGravJump()
;HailerRef01.MoveNear(HailerRef)
;HailerRef02.MoveNear(HailerRef01)

HailerRef01.EnableWithGravJump()
HailerRef02.EnableWithGravJump()

Alias_ShipFighters.SetValue(DockingPermission, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Utility.Wait(4)
SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
PHailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, OE_Credit_FalseContactCredits.GetValueInt())
OE_FalseContact_Global.SetValue(0)
Utility.Wait(2)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_ShipFighters.AddtoFaction(PlayerEnemyFaction)
Alias_ShipFighters.SetValue(Aggression, 1)
Alias_ShipFighters.StartCombatAll(Alias_playerShip.GetShipRef())
OE_FalseContact_Global.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_HailingShip.GetShipRef().DisableWithGravJump()
Utility.Wait(1)
Alias_HailingShip01.GetShipRef().DisableWithGravJump()
Alias_HailingShip02.GetShipRef().DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory

GlobalVariable Property OE_FalseContact_Global Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

RefCollectionAlias Property Alias_ShipFighters Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip01 Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip02 Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

GlobalVariable Property OE_Credit_FalseContactCredits Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory
