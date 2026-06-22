;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CF05_000B9741 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CF05_CommandBayGuardAccess.ForceRefTo(akspeaker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CF05_1026_EnsignAccessScene.Stop()
CF05_Guard_SpeechChallenge01.Start()
CF05_1026_EnsignAccessScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property CF05_CommandBayGuardAccess Auto Const Mandatory

Scene Property CF05_1026_EnsignAccessScene Auto Const Mandatory

Quest Property CF05_Guard_SpeechChallenge01 Auto Const Mandatory

Scene Property CF05_1025_EnsignAccessScene Auto Const Mandatory
