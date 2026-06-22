;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:TopicInfos:TIF_DialogueGagarin_UC_GG_0015D023 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if !UC_GG_Connect_Misc.GetStageDone(100) && !City_GG_Connections.GetStageDone(100)
  UC_GG_Connect_Misc.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UC_GG_Connect_Misc Auto Const Mandatory

Quest Property City_GG_Connections Auto Const Mandatory
