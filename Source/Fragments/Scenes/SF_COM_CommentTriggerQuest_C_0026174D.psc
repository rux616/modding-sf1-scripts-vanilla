;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COM_CommentTriggerQuest_C_0026174D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE COM_CommentTriggerQuestScript
COM_CommentTriggerQuestScript kmyQuest = GetOwningQuest() as COM_CommentTriggerQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SendAffinityEvent()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
