;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_FriendlyLanding_Aid_00085FAF Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(InorgCommonHelium3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(DrinkPouch_CrystalWater_Md, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_01
Function Fragment_Stage_0008_Item_01()
;BEGIN CODE
Game.GetPlayer().RemoveItem(DrinkPack_Water_Md, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0009_Item_00
Function Fragment_Stage_0009_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, OE_Credit_ExtortionMedium.GetValueInt())
if GetStageDone(1)
    SetStage(2)
elseif GetStageDone(3)
    SetStage(8)
else
    SetStage(12)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0012_Item_00
Function Fragment_Stage_0012_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(ShipRepairKit, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
Alias_ShipA.GetShipRef().PlayAnimation("to_ShipDamageState02")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_NPC_Group01.AddRef(Alias_NPC_Trader.GetRef())
Alias_NPC_Group01.AddRef(Alias_NPC_Patrol.GetRef())
Alias_NPC_Group01.AddRef(Alias_NPC_Search.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Alias_ShipA.RefillDependentAliases()
Alias_MapMarker.TryToEnable()
Alias_soundMarker.GetRef().EnableNoWait()
Utility.Wait(6)
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend)
Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction)
Alias_NPC_Group01.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

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

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property LL_Weapon_Ranged_Any Auto Const Mandatory

MiscObject Property InorgCommonHelium3 Auto Const Mandatory

Potion Property DrinkPack_Water_Md Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property OE_Credit_ExtortionMedium Auto Const Mandatory

FormList Property OnlyWaterList Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Trader Auto Const Mandatory

Potion Property ShipRepairKit Auto Const Mandatory

Potion Property DrinkPouch_CrystalWater_Md Auto Const Mandatory

ReferenceAlias Property Alias_NPC02 Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group01 Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Patrol Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Search Auto Const Mandatory

LocationAlias Property Alias_ShipA_InteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const Mandatory

LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const Mandatory

ReferenceAlias Property Alias_ShipA Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

ReferenceAlias Property Alias_soundMarker Auto Const Mandatory
