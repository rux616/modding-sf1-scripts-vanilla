;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueRedDevilsHQ_110_P_00182DC2 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Quest OQ = GetOwningQuest()
if OQ.GetStageDone(405) || OQ.GetStageDone(410) || OQ.GetStageDone(415)
  OQ.SetStage(400)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
