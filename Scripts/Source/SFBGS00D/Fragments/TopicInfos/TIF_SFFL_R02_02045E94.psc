;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:TopicInfos:TIF_SFFL_R02_02045E94 Extends TopicInfo Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;if RandomInt is >40%, stop scene
;and add NPC to player enemy faction
if SFFL_R02_RandomInt.GetValue() > 4
  GeneralNPC_Scene.Stop()
  SFFL_R02.SetStage(210)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property GeneralNPC_Scene Auto Const Mandatory

GlobalVariable Property SFFL_R02_RandomInt Auto Const Mandatory

Quest Property SFFL_R02 Auto Const Mandatory
