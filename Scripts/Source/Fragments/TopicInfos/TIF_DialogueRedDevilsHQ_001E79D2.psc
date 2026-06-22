;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueRedDevilsHQ_001E79D2 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if UCR04.IsRunning() && !UCR04.GetStageDone(100)
  UCR04.SetStage(100)
elseif UCR04_Dupe00.IsRunning() && !UCR04_Dupe00.GetStageDone(100)
  UCR04_Dupe00.SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UCR04 Auto Const Mandatory

Quest Property UCR04_Dupe00 Auto Const Mandatory
