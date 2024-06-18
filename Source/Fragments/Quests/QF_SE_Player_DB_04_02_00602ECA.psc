;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_DB_04_02_00602ECA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SpaceshipReference HailingShip1 = Alias_HailingShip.GetRef() as SpaceshipReference 
HailingShip1.AddToFaction(PlayerFriendFaction)

SpaceshipReference HailingShip2 = Alias_HailingShip2.GetRef() as SpaceshipReference 
HailingShip2.AddToFaction(PlayerFriendFaction)

SpaceshipReference HailingShip3 = Alias_HailingShip3.GetRef() as SpaceshipReference 
HailingShip3.AddToFaction(PlayerFriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; When the hailing ship reaches its orbit destination (currently CenterMarker)
; it fast travels away.
SpaceshipReference HailingShip = Alias_HailingShip.GetRef() as SpaceshipReference 
HailingShip.DisableWithGravJump()

SpaceshipReference HailingShip2 = Alias_HailingShip2.GetRef() as SpaceshipReference 
HailingShip2.DisableWithGravJump()

SpaceshipReference HailingShip3 = Alias_HailingShip3.GetRef() as SpaceshipReference 
HailingShip3.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.AddToFaction(PlayerEnemyFaction)
oTarg.RemoveFromFaction(PlayerFriendFaction)

SpaceshipReference HailingShip2 = Alias_HailingShip.GetRef() as SpaceshipReference 
HailingShip2.AddToFaction(PlayerEnemyFaction)
HailingShip2.RemoveFromFaction(PlayerFriendFaction)

SpaceshipReference HailingShip3 = Alias_HailingShip.GetRef() as SpaceshipReference 
HailingShip3.AddToFaction(PlayerEnemyFaction)
HailingShip3.RemoveFromFaction(PlayerFriendFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const

Faction Property PlayerFriendFaction Auto Const

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip2 Auto Const

ReferenceAlias Property Alias_HailingShip3 Auto Const
