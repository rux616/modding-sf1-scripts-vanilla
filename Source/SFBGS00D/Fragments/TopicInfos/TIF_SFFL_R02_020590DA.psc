;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:TopicInfos:TIF_SFFL_R02_020590DA Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;SFFL_R02_BribeAmount.SetValue(Utility.RandomInt(100,2500))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property SFFL_R02_RandomInt Auto Const Mandatory

GlobalVariable Property SFFL_R02_BribeAmount Auto Const Mandatory
