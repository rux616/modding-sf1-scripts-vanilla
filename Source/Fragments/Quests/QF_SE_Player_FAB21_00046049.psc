;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB21_00046049 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Move the other ship to the lead Ecliptic guy
ObjectReference oTarg = Alias_PatrolStartMarker01.GetRef()
oTarg.PlaceShipAtMeOffset(Ecliptic_A_Fighter_Sparrow01, 100.0, -100.0, aiLevelMod = 1, akAliasToFill = Alias_EclipticBackup)
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
; The enemies now go hostile
SpaceshipReference sShip = Alias_HailingShip.GetRef() as SpaceshipReference
SpaceshipReference sPlayer = Alias_PlayerShip.GetRef() as SpaceshipReference
sShip.RemoveFromAllFactions()
sShip.AddToFaction(PlayerEnemyFaction)
sShip.StartCombat(sPlayer)

sShip = Alias_EclipticBackup.GetRef() as SpaceshipReference
sShip.RemoveFromAllFactions()
sShip.AddToFaction(PlayerEnemyFaction)
sShip.StartCombat(sPlayer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; When the hailing ship reaches its orbit destination (currently CenterMarker)
; it fast travels away.
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Faction Property PlayerEnemyFaction Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

ReferenceAlias Property Alias_EclipticBackup Auto Const Mandatory

Form Property Ecliptic_A_Fighter_Sparrow01 Auto Const

ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const Mandatory

ReferenceAlias Property Alias_GeneralMarker01 Auto Const Mandatory
