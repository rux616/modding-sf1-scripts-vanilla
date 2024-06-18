;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_SQ_Followers_CompanionAnd_003E94BB Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN AUTOCAST TYPE sq_followersscript
sq_followersscript kmyQuest = GetOwningQuest() as sq_followersscript
;END AUTOCAST
;BEGIN CODE
PrimaryActorAlias.GetActorReference().OpenInventory(true, Contraband, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PrimaryActorAlias Mandatory Const Auto

Keyword Property Contraband Auto Const Mandatory
