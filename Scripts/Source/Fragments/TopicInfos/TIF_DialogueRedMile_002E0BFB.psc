;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueRedMile_002E0BFB Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If !FFRedMileR01.IsRunning() && !FFRedMileR01Misc.IsRunning()
	FFRedMileR01Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFRedMileR01Misc Auto Const Mandatory

Quest Property FFRedMileR01 Auto Const Mandatory
