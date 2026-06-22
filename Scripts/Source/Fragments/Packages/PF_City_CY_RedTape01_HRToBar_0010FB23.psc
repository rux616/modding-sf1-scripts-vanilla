;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_City_CY_RedTape01_HRToBar_0010FB23 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
If Game.GetPlayer().GetDistance(akActor) <= 100
	Int iRandom = Utility.RandomInt(0, SceneToPlay.Length)
	SceneToPlay[iRandom].Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene[] Property sceneToPlay Auto Const Mandatory
