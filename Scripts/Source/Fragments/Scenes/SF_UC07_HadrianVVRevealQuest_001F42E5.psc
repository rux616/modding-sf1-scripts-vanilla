;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_UC07_HadrianVVRevealQuest_001F42E5 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Quest myOQ = GetOwningQuest()

if myOQ.GetStageDone(140) && !myOQ.GetStageDone(145) && !UC08.GetStageDone(629)
  myOQ.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property UC08 Auto Const Mandatory
