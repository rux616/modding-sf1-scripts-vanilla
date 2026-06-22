;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueHopeTown_002A823E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
; Start the HopeTown quests
Hope01.Start()
Hope02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; Play the establishing scene
DialogueHopeTown_100_IntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
; This does not get set by design
; This stage prevents Bennu from offering a cut quest
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1110_Item_00
Function Fragment_Stage_1110_Item_00()
;BEGIN CODE
; Flag the quest to start
SY_HopeTech_TestPilot01.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DialogueHopeTown_100_IntroScene Auto Const Mandatory

Quest Property SY_HopeTech_TestPilot01 Auto Const Mandatory

Quest Property Hope01 Auto Const Mandatory

Quest Property Hope02 Auto Const Mandatory
