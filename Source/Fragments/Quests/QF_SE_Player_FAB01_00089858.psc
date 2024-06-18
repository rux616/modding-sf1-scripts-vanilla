;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB01_00089858 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the hailing scene
PHailTemplate_100a_Hailing.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN AUTOCAST TYPE SE_FAB04_MathCount
Quest __temp = self as Quest
SE_FAB04_MathCount kmyQuest = __temp as SE_FAB04_MathCount
;END AUTOCAST
;BEGIN CODE
; Remove the iron
kmyQuest.RemoveShipParts()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, SE_FAB01_PlayerReward.GetValueInt())

; And after 30s the ship's grav drive is fixed and it disappears forever
Utility.Wait(30.0)
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN AUTOCAST TYPE SE_FAB04_MathCount
Quest __temp = self as Quest
SE_FAB04_MathCount kmyQuest = __temp as SE_FAB04_MathCount
;END AUTOCAST
;BEGIN CODE
kmyQuest.CountShipParts()
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

Scene Property PHailTemplate_100a_Hailing Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

MiscObject Property InorgCommonIron Auto Const Mandatory

GlobalVariable Property SE_FAB01_PlayerReward Auto Const Mandatory
