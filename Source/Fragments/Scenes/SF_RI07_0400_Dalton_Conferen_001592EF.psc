;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RI07_0400_Dalton_Conferen_001592EF Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE ri07_questscript
ri07_questscript kmyQuest = GetOwningQuest() as ri07_questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnfreezeControlsMeeting()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
