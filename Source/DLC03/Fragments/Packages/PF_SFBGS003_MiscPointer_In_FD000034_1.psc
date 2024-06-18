;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Packages:PF_SFBGS003_MiscPointer_In_FD000034_1 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
Utility.Wait(2)
SFBGS003_MiscPointer_Inevitable_AttractScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SFBGS003_MiscPointer_Inevitable_AttractScene Auto Const Mandatory
