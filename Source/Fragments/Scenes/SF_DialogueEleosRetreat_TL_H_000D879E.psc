;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueEleosRetreat_TL_H_000D879E Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Quest OQ = GetOwningQuest()

if OQ.GetStageDone(1350) || \
OQ.GetStageDone(1351) || \
OQ.GetStageDone(1352) || \
OQ.GetStageDone(1353) || \
OQ.GetStageDone(1354)
  OQ.SetStage(1355)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
