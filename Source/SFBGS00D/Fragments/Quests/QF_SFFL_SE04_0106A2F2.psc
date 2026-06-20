;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE04_0106A2F2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
Utility.Wait(5.0)
PHailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetStage(300)
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
;BEGIN CODE
Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0)

;shut off ghost ship's engines
Alias_HailingShip.GetShipRef().SetPartPower(1, -1, 0)
Alias_HailingShip.GetShipRef().LockPowerAllocation(1,-1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE SEScript
Quest __temp = self as Quest
SEScript kmyQuest = __temp as SEScript
;END AUTOCAST
;BEGIN CODE
;set cooldown in case it wasn't set
kmyquest.SetCooldown()

;disable the ship if not already disabled
Alias_HailingShip.GetShipRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory

ActorValue Property DockingPermission Auto Const Mandatory
