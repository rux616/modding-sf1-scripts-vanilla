;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueCrimeGuardShips_C_002312D7 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
DialogueCrimeGuardsQuestScript kmyQuest = GetOwningQuest() as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerSmuggling()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
