;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BE_SC04_BargainingScene_01000801 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;If the player exits the dialogue
;without accepting the bargain,
;start combat as though 'No Deal'.
if (GetOwningQuest().GetStage() != 30)
     GetOwningQuest().SetStage(50)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
