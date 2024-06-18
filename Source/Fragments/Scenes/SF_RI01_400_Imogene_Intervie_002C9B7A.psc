;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RI01_400_Imogene_Intervie_002C9B7A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE RI01_QuestScript
RI01_QuestScript kmyQuest = GetOwningQuest() as RI01_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnfreezeControls()
GetOwningQuest().SetStage(420)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
