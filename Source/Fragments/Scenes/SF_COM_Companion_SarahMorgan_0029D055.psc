;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COM_Companion_SarahMorgan_0029D055 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN AUTOCAST TYPE COM_ConvoQuestScript
COM_ConvoQuestScript kmyQuest = GetOwningQuest() as COM_ConvoQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SceneCompleted()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
