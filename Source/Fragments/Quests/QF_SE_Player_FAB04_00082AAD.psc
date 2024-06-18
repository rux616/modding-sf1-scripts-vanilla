;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_FAB04_00082AAD Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SpaceshipReference oTarg = Alias_HailingShip.GetRef() as SpaceshipReference
oTarg.SetValue(Aggression, 0)
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

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
PSE_Player_FAB04_RunOnce.Setvalue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0275_Item_00
Function Fragment_Stage_0275_Item_00()
;BEGIN AUTOCAST TYPE SE_FAB04_MathCount
Quest __temp = self as Quest
SE_FAB04_MathCount kmyQuest = __temp as SE_FAB04_MathCount
;END AUTOCAST
;BEGIN CODE
kmyQuest.RemoveShipParts()
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

MiscObject Property InorgCommonHelium3 Auto Const Mandatory

ReferenceAlias Property Alias_playerShip Auto Const Mandatory

Potion Property ShipRepairKit Auto Const Mandatory

GlobalVariable Property PSE_Player_FAB04_RunOnce Auto Const Mandatory

ActorValue Property Aggression Auto Const Mandatory
