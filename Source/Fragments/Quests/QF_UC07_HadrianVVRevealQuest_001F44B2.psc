;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC07_HadrianVVRevealQuest_001F44B2 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN CODE
UC07_HadrianKnowsVVLives.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0199_Item_00
Function Fragment_Stage_0199_Item_00()
;BEGIN CODE
SetStage(200)
UC07.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Close out the appropriate scene on UC07
if UC07.IsRunning() && !UC07.GetStageDone(200) && !UC07.GetStageDone(300)
  UC07.Setstage(200)
endif

;Player and Hadrian had the talk. You can shut this down.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UC07_HadrianKnowsVVLives Auto Const Mandatory

Quest Property UC07 Auto Const Mandatory
