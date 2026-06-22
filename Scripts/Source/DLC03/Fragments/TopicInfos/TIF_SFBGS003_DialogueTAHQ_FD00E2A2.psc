;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:TopicInfos:TIF_SFBGS003_DialogueTAHQ_FD00E2A2 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN AUTOCAST TYPE dlc03:sfbgs003questastraexchangescript
dlc03:sfbgs003questastraexchangescript kmyQuest = GetOwningQuest() as dlc03:sfbgs003questastraexchangescript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AstraExchange(SFBGS003_Astras_LargeAmount.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property SFBGS003_Astras_LargeAmount Auto Const Mandatory
