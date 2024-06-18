;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueUCTheDen_002A1049 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
if !UC06.IsRunning()
  pDialogueUCTheDen_IntroScene.Start()
else
  SetStage(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
FFDenR01.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property FFDenR01 Auto Const Mandatory

Scene Property pDialogueUCTheDen_IntroScene Auto Const Mandatory

Quest Property UC06 Auto Const Mandatory
