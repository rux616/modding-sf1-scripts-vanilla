;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_SE_Player_ZW16b_0026D62D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;When the quest starts, assign an actor value to determine if the ship's
;pilot likes the player's ship design or not
SpaceshipReference myShip = Alias_HailingShip.GetRef() as SpaceshipReference

Int iDemeanor = Utility.RandomInt(0, 1)
myShip.SetValue(SE_Player_ZW16_Demeanor_AV, iDemeanor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the opening scene
SE_ZW16b_100a_OpeningScene.Start()
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
Utility.Wait(1.0)
Alias_HailingShip.GetShipRef().DisableWithGravJump()
Alias_MapMarker.GetRef().DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HailingShip Auto Const Mandatory

ActorValue Property SE_Player_ZW16_Demeanor_AV Auto Const Mandatory

Scene Property SE_ZW16b_100a_OpeningScene Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
