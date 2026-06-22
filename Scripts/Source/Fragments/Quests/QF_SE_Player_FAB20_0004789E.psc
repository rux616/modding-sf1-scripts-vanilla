;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB20_0004789E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Spawn in Mathis's wingmen
ObjectReference oMarker = Alias_GeneralMarker01.GetRef()
SpaceshipReference sShip

; Have to wire up the offsets for spawning the ships
float[] offset = new float[6]
offset[0] = 221  ;Right(positive) and Left(negative)
offset[1] = -333 ;front(positive) and behind(negative)
offset[2] = 0    ;up(positive) and down(negative)
offset[5] = 23    ;heading/yaw in degrees

sShip = oMarker.PlaceShipAtMe(EncShip_CrimsonFleet_F, akOffsetValues=offset)
Alias_MathisAllies.AddRef(sShip)

offset[0] = -100  ;Right(positive) and Left(negative)
sShip = oMarker.PlaceShipAtMe(EncShip_CrimsonFleet_F, akOffsetValues=offset)
Alias_MathisAllies.AddRef(sShip)

offset[1] = -200 ;front(positive) and behind(negative)
sShip = oMarker.PlaceShipAtMe(EncShip_CrimsonFleet_F, akOffsetValues=offset)
Alias_MathisAllies.AddRef(sShip)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
Utility.wait(6)
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
; Mathis goes hostile
SpaceshipReference sShip = Alias_HailingShip.GetRef() as SpaceshipReference
SpaceshipReference sPlayer = Alias_PlayerShip.GetRef() as SpaceshipReference
sShip.RemoveFromFaction(PlayerFriendFaction)
sShip.AddToFaction(PlayerEnemyFaction)
sShip.SetValue(Aggression, 1)
sShip.StartCombat(sPlayer)

; His allies go hostile
int i = 0
int iCount = Alias_MathisAllies.GetCount()

while i < iCount
  sShip = Alias_MathisAllies.GetShipAt(i)
  if sShip 
    sShip.RemoveFromFaction(PlayerFriendFaction)
    sShip.AddToFaction(PlayerEnemyFaction)
    sShip.SetValue(Aggression, 1)
    sShip.StartCombat(sPlayer)
  endif

  i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
SE_Player_FAB20_RunOnce.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

RefCollectionAlias Property Alias_MathisAllies Auto Const Mandatory

ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const Mandatory
Form Property EncShip_CrimsonFleet_F Auto Const

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ReferenceAlias Property Alias_GeneralMarker03 Auto Const Mandatory

ReferenceAlias Property Alias_GeneralMarker01 Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory

Faction Property PlayerFriendFaction Auto Const Mandatory

GlobalVariable Property SE_Player_FAB20_RunOnce Auto Const Mandatory
