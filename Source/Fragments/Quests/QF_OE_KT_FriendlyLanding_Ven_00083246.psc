;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_OE_KT_FriendlyLanding_Ven_00083246 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
ObjectReference RobotRef = Alias_NPC_Robot.GetRef()
ObjectReference TraderRef = Alias_NPC_Trader.GetRef()

RobotRef.EnableNoWait()
Alias_NPC_Group01.AddRef(TraderRef)
Alias_NPC_Group01.AddRef(RobotRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Actor MercRef = Alias_NPC_Merc.GetActorRef()
ObjectReference TraderRef = Alias_NPC_Trader.GetRef()

MercRef.EquipItem(LL_Weapon_Ranged_Any)
Alias_NPC_Group01.AddRef(MercRef)
Alias_NPC_Group01.AddRef(TraderRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
OE_KT_FriendlyVendorsGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
ObjectReference OwnerRef = Alias_NPC_PetOwner.GetRef()
ObjectReference PetRef = Alias_NPC_Pet.GetRef()

PetRef.EnableNoWait()
OwnerRef.EnableNoWait()
Alias_NPC_Group01.AddRef(PetRef)
Alias_NPC_Group01.AddRef(OwnerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
OE_KT_ParkerMetOnceGlobal.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend)
Alias_NPC_Group01.SetValue(Aggression, 1)
Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction)
Alias_NPC_Group01.StartCombatAll(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0066_Item_00
Function Fragment_Stage_0066_Item_00()
;BEGIN CODE
OE_KT_ParkerGrumbleDeathStatus.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
int random = Utility.RandomInt()

if random > 50
    SetStage(25)
elseif random > 0
    SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_01
Function Fragment_Stage_0090_Item_01()
;BEGIN CODE
SetStage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_02
Function Fragment_Stage_0090_Item_02()
;BEGIN CODE
alias_mapmarker.TryToEnable()

Alias_ShipA.GetShipRef().SetFactionOwner(OE_KT_FriendlyVendorsFaction)
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

ReferenceAlias Property Alias_NPC_Merc Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Robot Auto Const Mandatory

ReferenceAlias Property Alias_NPC_Pet Auto Const Mandatory

ReferenceAlias Property Alias_NPC_PetOwner Auto Const Mandatory

RefCollectionAlias Property Alias_NPC_Group01 Auto Const Mandatory

Faction Property REPlayerFriend Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_Marker_TravelB03 Auto Const Mandatory

GlobalVariable Property OE_KT_FriendlyVendorsGlobal Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

GlobalVariable Property OE_KT_ParkerGrumbleDeathStatus Auto Const Mandatory

GlobalVariable Property OE_KT_ParkerMetOnceGlobal Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

Faction Property OE_KT_FriendlyVendorsFaction Auto Const Mandatory

ReferenceAlias Property Alias_ShipA Auto Const Mandatory
