;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_UC05_310_RadcliffMain_Red_0024F838 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Quest OQ = GetOwningQuest()

if OQ.GetStageDone(315) && !OQ.GetStageDone(349)
  OQ.SetStage(317)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
