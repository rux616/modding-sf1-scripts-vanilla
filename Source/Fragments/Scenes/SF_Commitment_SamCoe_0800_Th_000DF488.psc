;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Commitment_SamCoe_0800_Th_000DF488 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_13_End
Function Fragment_Phase_13_End()
;BEGIN AUTOCAST TYPE com_commitmentquestscript
com_commitmentquestscript kmyQuest = GetOwningQuest() as com_commitmentquestscript
;END AUTOCAST
;BEGIN CODE
kmyquest.GiveCommitmentGift()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
