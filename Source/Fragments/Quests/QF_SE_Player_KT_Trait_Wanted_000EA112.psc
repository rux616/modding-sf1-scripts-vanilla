;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_KT_Trait_Wanted_000EA112 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
TraitWanted.Start()
Alias_PatrolShip04.GetShipRef().SetValue(Aggression, 0)
Alias_PatrolShip05.GetShipRef().SetValue(Aggression, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0000_Item_01
Function Fragment_Stage_0000_Item_01()
;BEGIN CODE
SE_Player_ChanceTraitWantedGlobal.SetValue(OddsStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Utility.Wait(5)
SE_Player_Trait_Wanted_HailStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Alias_PatrolShip01.GetShipRef().EnableWithGravJump()
Alias_PatrolShip02.GetShipRef().EnableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
Alias_PatrolShip03.GetShipRef().EnableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_02
Function Fragment_Stage_0010_Item_02()
;BEGIN CODE
Alias_PatrolShip04.GetShipRef().EnableWithGravJump()
Alias_PatrolShip05.GetShipRef().EnableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_Patrollers.RemovefromFaction(PlayerFriendFaction)
Alias_Patrollers.AddtoFaction(PlayerEnemyFaction)
Alias_Patrollers.SetValue(Aggression, 1)
Alias_Patrollers.StartCombatAll(Alias_Player.GetShipRef())

Alias_PatrolShip01.GetShipRef().AddAliasedItem(Trait_Wanted_DataSlate01, Alias_BountyNote01)
SE_Player_Trait_Wanted_HailStart.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, Trait_Credit_ExtortionSmall.GetValueInt())
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, Trait_Credit_ExtortionMedium.GetValueInt())
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SE_Player_Trait_Wanted_HailStart.Stop()
TraitWanted.SetStage(20)

Utility.Wait(1.0)
Alias_MapMarker.GetRef().DisableNoWait()

ObjectReference[] ShipRef = Alias_Patrollers.GetArray()
int i = 0
while i < ShipRef.Length
    (ShipRef[i] as SpaceshipReference).DisableWithGravJump()
    i += 1
endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
TraitWanted.SetStage(10)
int ChanceValue = Trait_Wanted_KillGlobal.GetValueInt()
Trait_Wanted_KillGlobal.SetValue(ChanceValue + 1)

if !GetStageDone(80)
    int BountyIncrease = Trait_Credit_ValueIncrease.GetValueInt()
    int CurrentBountyValue = Trait_Credit_WantedMedium.GetValueInt() + BountyIncrease
    Trait_Credit_WantedMedium.SetValue(CurrentBountyValue)
endif

float expiry = Utility.ExpiryDay(Trait_Wanted_SE_CooldownDays.GetValue())
Game.GetPlayer().SetValue(Trait_Wanted_SE_Cooldown_AVIF, expiry)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN CODE
int ChanceValue = SE_Player_ChanceTraitWantedGlobal.GetValueInt()
SE_Player_ChanceTraitWantedGlobal.SetValue(ChanceValue + 1)
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

RefCollectionAlias Property Alias_Patrollers Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Quest Property TraitWanted Auto Const Mandatory

GlobalVariable Property Trait_Wanted_KillGlobal Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

SpaceshipBase Property BountyHunterShip Auto Const Mandatory

SpaceshipBase Property BountyHunterShipBoss Auto Const Mandatory

ReferenceAlias Property Alias_BountyNote01 Auto Const Mandatory

ReferenceAlias Property Alias_PatrolShip01 Auto Const Mandatory

Book Property Trait_Wanted_DataSlate01 Auto Const Mandatory

Scene Property SE_Player_Trait_Wanted_HailCombat Auto Const Mandatory

Scene Property SE_Player_Trait_Wanted_HailStart Auto Const Mandatory

ReferenceAlias Property Alias_PatrolShip02 Auto Const Mandatory

ReferenceAlias Property Alias_PatrolShip03 Auto Const Mandatory

ReferenceAlias Property Alias_PatrolShip04 Auto Const Mandatory

GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const Mandatory

GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

ReferenceAlias Property Alias_PatrolShip05 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

SpaceshipBase Property BountyHunterUnaggressive Auto Const Mandatory

GlobalVariable Property Trait_Credit_ValueIncrease Auto Const Mandatory

GlobalVariable Property Trait_Credit_WantedMedium Auto Const Mandatory

GlobalVariable Property Trait_Wanted_SE_CooldownDays Auto Const Mandatory

ActorValue Property Trait_Wanted_SE_Cooldown_AVIF Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory

GlobalVariable Property SE_Player_ChanceTraitWantedGlobal Auto Const Mandatory

Int Property OddsStart Auto Const Mandatory
