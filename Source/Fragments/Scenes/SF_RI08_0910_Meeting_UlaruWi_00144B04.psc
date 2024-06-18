;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_RI08_0910_Meeting_UlaruWi_00144B04 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE Ri08_QuestScript
Ri08_QuestScript kmyQuest = GetOwningQuest() as Ri08_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnfreezeControlsMeeting()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
