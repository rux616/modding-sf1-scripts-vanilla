;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueNewHomestead_0001AA0B Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If !FFNewHomesteadR05.IsRunning() && !FFNewHomesteadR05Misc.IsRunning()
	FFNewHomesteadR05Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFNewHomesteadR05Misc Auto Const Mandatory

Quest Property FFNewHomesteadR05 Auto Const Mandatory
