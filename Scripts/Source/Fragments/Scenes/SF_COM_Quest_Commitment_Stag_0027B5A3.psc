;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_COM_Quest_Commitment_Stag_0027B5A3 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_16_End
Function Fragment_Phase_16_End()
;BEGIN AUTOCAST TYPE COM_CommitmentQuestScript
COM_CommitmentQuestScript kmyQuest = GetOwningQuest() as COM_CommitmentQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.GiveCommitmentGift()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
