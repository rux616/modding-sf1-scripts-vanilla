;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ302_Battle_02_Courtyard_00124A19 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE LC165QuestScript
LC165QuestScript kmyQuest = GetOwningQuest() as LC165QuestScript
;END AUTOCAST
;BEGIN CODE
kMyQuest.PerformCourtyardScriptedMassReanimate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
