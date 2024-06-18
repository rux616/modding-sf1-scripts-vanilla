;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302_196_ShiftTriggerCom_0015578E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
;Lock player movement.
kMyQuest.SetPlayerControlsEnabled(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
;Unlock player movement.
kMyQuest.SetPlayerControlsEnabled(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
