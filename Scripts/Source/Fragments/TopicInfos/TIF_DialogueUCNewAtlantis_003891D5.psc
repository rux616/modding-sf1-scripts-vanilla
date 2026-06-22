;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueUCNewAtlantis_003891D5 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
UC_NA_SalinasVendorActive.SetValue(1)
UC_NA_VicenteSalinas.GetUniqueActor().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UC_NA_SalinasVendorActive Auto Const Mandatory

ActorBase Property UC_NA_VicenteSalinas Auto Const Mandatory
