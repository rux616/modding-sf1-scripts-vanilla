;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialogueEleosRetreat_TL_S_0027898D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Quest OQ = GetOwningQuest()
if !OQ.GetStageDone(910) && (OQ.GetStageDone(905) || OQ.GetStageDone(906))
  OQ.SetStage(910)  
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
