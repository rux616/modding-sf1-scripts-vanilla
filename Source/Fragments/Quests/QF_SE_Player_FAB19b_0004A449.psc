;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB19b_0004A449 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
; Move the Juno to this space cell
ObjectReference oTarg = Alias_PatrolStartMarker03.GetRef()
SpaceshipReference oJuno = Alias_HailingShip.GetRef() as SpaceshipReference
oJuno.Enable()
oJuno.MoveTo(oTarg)
oJuno.SetValue(DockingPermission, 4)

; If this is the explorer case, then disable the destroyed ship
if ( MS03_Outcome.GetValue() == 3 )
  Alias_DestroyedShip.GetRef().Disable()
endif
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
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference 
oTarg.DisableWithGravJump()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ReferenceAlias Property Alias_PatrolStartMarker03 Auto Const Mandatory

GlobalVariable Property MS03_Outcome Auto Const Mandatory

ReferenceAlias Property Alias_DestroyedShip Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory
