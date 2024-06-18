;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_KT_Trait_Wanted_000E9E2A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
TraitWanted.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
Alias_DefendersRC.RemoveFromFaction(PlayerFriendFaction)
Alias_DefendersRC.AddtoFaction(PlayerEnemyFaction)
Alias_DefendersRC.StartCombatAll(Alias_PlayerShip.GetShipRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
Utility.Wait(7.0)
SpaceshipReference pDefender01 = Alias_HailingShip.GetShipRef()
SpaceshipReference pDefender02 = Alias_SpacerShip02.GetShipRef()
SpaceshipReference pDefender03 = Alias_SpacerShip03.GetShipRef()

SpaceshipReference pAttacker = Alias_AttackerShip01.GetShipRef()

pDefender01.MoveNear(pAttacker)
pDefender02.MoveNear(pAttacker)
pDefender03.MoveNear(pAttacker)
pDefender01.EnableWithGravJump()
pDefender02.EnableWithGravJump()
pDefender03.EnableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SpaceshipReference pAttacker01 = Alias_AttackerShip01.GetShipRef()
SpaceshipReference pAttacker02 = Alias_AttackerShip02.GetShipRef()
SpaceshipReference pAttacker03 = Alias_AttackerShip03.GetShipRef()
SpaceshipReference playerShip = Alias_PlayerShip.GetShipRef()
pAttacker01.MoveNear(playerShip)
pAttacker02.MoveNear(playerShip)
pAttacker03.MoveNear(playerShip)
pAttacker01.EnableWithGravJump()
pAttacker02.EnableWithGravJump()
pAttacker03.EnableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Attack01_100a_DefenderHailStart.Start()

int ChanceValue = Trait_Wanted_KillGlobal.GetValueInt()
Trait_Wanted_KillGlobal.SetValue(ChanceValue + 1)

int BountyIncrease = Trait_Credit_ValueIncrease.GetValueInt()
int CurrentBountyValue = Trait_Credit_WantedMedium.GetValueInt() + BountyIncrease

Trait_Credit_WantedMedium.SetValue(CurrentBountyValue)

float expiry = Utility.ExpiryDay(Trait_Wanted_SE_CooldownDays.GetValue())
Game.GetPlayer().SetValue(Trait_Wanted_SE_Cooldown_AVIF, expiry)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
int ChanceValue = SE_Player_ChanceTraitWantedGlobal.GetValueInt()
SE_Player_ChanceTraitWantedGlobal.SetValue(ChanceValue + 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Utility.Wait(3.0)

ObjectReference[] ShipsRef = Alias_DefendersRC.GetArray()

int i = 0
while i < ShipsRef.Length
    (ShipsRef[i] as SpaceshipReference).DisableWithGravJump()
    i += 1
endWhile
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

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property Attack01_100a_DefenderHailStart Auto Const Mandatory

RefCollectionAlias Property Alias_DefendersRC Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

Quest Property TraitWanted Auto Const Mandatory

ReferenceAlias Property Alias_AttackerShip01 Auto Const Mandatory

ReferenceAlias Property Alias_SpacerShip02 Auto Const Mandatory

ReferenceAlias Property Alias_SpacerShip03 Auto Const Mandatory

ReferenceAlias Property Alias_AttackerShip02 Auto Const Mandatory

ReferenceAlias Property Alias_AttackerShip03 Auto Const Mandatory

GlobalVariable Property Trait_Credit_ValueIncrease Auto Const Mandatory

GlobalVariable Property Trait_Credit_WantedMedium Auto Const Mandatory

GlobalVariable Property Trait_Wanted_SE_CooldownDays Auto Const Mandatory

ActorValue Property Trait_Wanted_SE_Cooldown_AVIF Auto Const Mandatory

GlobalVariable Property Trait_Wanted_KillGlobal Auto Const Mandatory

GlobalVariable Property SE_Player_ChanceTraitWantedGlobal Auto Const Mandatory
