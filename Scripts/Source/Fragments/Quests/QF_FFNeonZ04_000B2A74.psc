;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ04_000B2A74 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
if !DialogueFCNeon.GetStageDone(445)
    SetObjectiveDisplayed(15)
endif

FFNeonZ04_SpeechChallengeQuest.Start()

; Close the pointer
FFNeonGuardPointer_Z04.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, FFNeonZ04_DietrichBribe.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
if !DialogueFCNeon.GetStageDone(445)
    SetObjectiveSkipped(15)
endif
SetObjectiveDisplayed(20)
DialogueFCNeon.SetStage(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
FFNeonZ04_SpeechChallengeQuest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DialogueFCNeon.SetStage(225)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FFNeonZ04_DietrichBribe Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Quest Property FFNeonZ04_SpeechChallengeQuest Auto Const Mandatory

Quest Property DialogueFCNeon Auto Const Mandatory

Quest Property FFNeonGuardPointer_Z04 Auto Const Mandatory
