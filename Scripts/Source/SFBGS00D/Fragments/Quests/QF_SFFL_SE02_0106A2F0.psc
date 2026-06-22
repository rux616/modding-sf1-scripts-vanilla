;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_SE02_0106A2F0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;the ship grav jumps away
SpaceshipReference oTarg = Alias_StrangeManShip.GetRef() as SpaceshipReference 
oTarg.SetGhost(true)
Utility.wait(3)
oTarg.DisableWithGravJump()
Alias_MapMarker.GetRef().DisableNoWait()
SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_StrangeManShip Auto Const Mandatory

ReferenceAlias Property Alias_MapMarker Auto Const Mandatory
