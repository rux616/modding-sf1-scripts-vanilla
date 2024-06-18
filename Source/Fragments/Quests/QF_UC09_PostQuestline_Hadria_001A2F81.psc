;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_UC09_PostQuestline_Hadria_001A2F81 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
;set Hadrian's wrap up complete so she can be recruited as an EC
HadrianWrapUpComplete.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Setting this variable should make Hadrian's recruit scene available
;the player must talk to Percival and complete one wrap-up scene to recruit Hadrian
HadrianWrapUpComplete.SetValue(1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property HadrianWrapUpComplete Auto Const
