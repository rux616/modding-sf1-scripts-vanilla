;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_CF05_000FB770 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Alias_CF05_AlertedGuard_ForceGreeter03.ForceRefTo(akspeaker)
CF05_SuspiciousMarineAttackScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_CF05_AlertedGuard_ForceGreeter03 Auto Const Mandatory

Scene Property CF05_SuspiciousMarineAttackScene Auto Const Mandatory
