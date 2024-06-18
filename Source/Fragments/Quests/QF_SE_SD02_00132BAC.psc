;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_SD02_00132BAC Extends Quest Hidden Const

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
SpaceshipReference oTarg1 = Alias_HailingShip.GetRef() as SpaceshipReference
SpaceshipReference oTarg2 = Alias_MinerShip01.GetRef() as SpaceshipReference
SpaceshipReference oTarg3 = Alias_EscortShip01.GetRef() as SpaceshipReference

oTarg1.DisableWithGravJump()
oTarg2.DisableWithGravJump()
oTarg3.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_MinerShip Auto Const

ReferenceAlias Property Alias_EscortShip Auto Const

ReferenceAlias Property Alias_EscortShip01 Auto Const Mandatory

ReferenceAlias Property Alias_MinerShip01 Auto Const Mandatory

ActorValue Property DockingPermission Auto Const
