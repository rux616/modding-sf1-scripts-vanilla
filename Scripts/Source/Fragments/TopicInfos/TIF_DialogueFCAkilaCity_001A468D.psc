;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueFCAkilaCity_001A468D Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ParadisoLocationMiscPointer.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property EleosLocationMiscPointer Auto Const Mandatory

Quest Property MS02 Auto Const Mandatory

Quest Property MS02_Intro Auto Const Mandatory

Quest Property ParadisoLocationMiscPointer Auto Const Mandatory
