;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_JP01_00134BE8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
HailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetStage(400)
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

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE Utility_FAB_Script
Quest __temp = self as Quest
Utility_FAB_Script kmyQuest = __temp as Utility_FAB_Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.ShipAttackPlayer(Alias_HailingShip.GetShipReference())

Alias_AttackingShip01.GetShipReference().EnableWithGravJump()
Alias_AttackingShip01.GetShipReference().StartCombat(Alias_PlayerShip.GetShipReference())

Alias_AttackingShip02.GetShipReference().EnableWithGravJump()
Alias_AttackingShip02.GetShipReference().StartCombat(Alias_PlayerShip.GetShipReference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ActorValue Property Aggression Auto Const

ReferenceAlias Property Alias_AttackingShip01 Auto Const Mandatory

ReferenceAlias Property Alias_AttackingShip02 Auto Const Mandatory

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory
