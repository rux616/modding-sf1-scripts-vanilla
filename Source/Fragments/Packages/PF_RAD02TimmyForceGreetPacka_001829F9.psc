;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_RAD02TimmyForceGreetPacka_001829F9 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
;Re-evaluate conditions in case player is in dialogue
Utility.Wait(2)
akActor.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
