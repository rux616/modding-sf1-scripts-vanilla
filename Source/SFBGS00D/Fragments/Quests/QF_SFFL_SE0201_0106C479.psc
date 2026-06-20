;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE0201_0106C479 Extends Quest Hidden Const

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

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE SEScript
Quest __temp = self as Quest
SEScript kmyQuest = __temp as SEScript
;END AUTOCAST
;BEGIN CODE
;set cooldown in case it did not set
kmyquest.SetCooldown()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory
