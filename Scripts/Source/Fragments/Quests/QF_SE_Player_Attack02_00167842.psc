;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_Attack02_00167842 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_AttackersRC.RefillAlias()
Alias_DefendersRC.RefillAlias()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_HailingShip.RefillAlias()
Attack01_100a_DefenderHailStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
Alias_PlayerShip.GetShipRef().AddItem(LL_Loot_ShipRepairKit)
SE_ShipPartsAdded.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_01_Small)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property Attack01_100a_DefenderHailStart Auto Const Mandatory

MiscObject Property InorgCommonHelium3 Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

RefCollectionAlias Property Alias_AttackersRC Auto Const Mandatory

RefCollectionAlias Property Alias_DefendersRC Auto Const Mandatory

LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const Mandatory

LeveledItem Property LL_Loot_ShipRepairKit Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Message Property SE_ShipPartsAdded Auto Const Mandatory
