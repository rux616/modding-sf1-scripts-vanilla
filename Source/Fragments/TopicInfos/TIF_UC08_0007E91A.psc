;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_UC08_0007E91A Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if !UC08_532_KaiserHadrian_FinalSampleSecure.IsPlaying()
  UC08_532_KaiserHadrian_FinalSampleSecure.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property UC08_532_KaiserHadrian_FinalSampleSecure Auto Const Mandatory
