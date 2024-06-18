;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueNewHomestead_000212C3 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If !FFNewHomesteadR02.IsRunning() && !FFNewHomesteadR02Misc.IsRunning() && GameDaysPassed.GetValue() >= FFNewHomesteadR02_CooldownTime.GetValue()
	FFNewHomesteadR02Misc.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFNewHomesteadR02Misc Auto Const Mandatory

Quest Property FFNewHomesteadR02 Auto Const Mandatory

GlobalVariable Property GameDaysPassed Auto Const Mandatory

GlobalVariable Property FFNewHomesteadR02_CooldownTime Auto Const Mandatory
