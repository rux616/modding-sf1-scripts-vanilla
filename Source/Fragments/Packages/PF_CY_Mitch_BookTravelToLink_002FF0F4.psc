;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_CY_Mitch_BookTravelToLink_002FF0F4 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
DialogueCydoniaConvoBook01QuestStartKeyword.SendStoryEventAndWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property DialogueCydoniaConvoBook01QuestStartKeyword Auto Const Mandatory
