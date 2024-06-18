;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ02_000A316E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
SetObjectiveCompleted(5)
if GetStageDone(10)
    SetObjectiveDisplayed(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
if GetStageDone(5)
    SetObjectiveDisplayed(30)
elseif GetStageDone(30)
    SetObjectiveDisplayed(5)
else
    SetObjectiveDisplayed(20)
endif
FFNeonZ02_SpeechChallengeQuest.Start()

; End the pointer
FFNeonGuardPointer_Z02.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
if !GetStageDone(5)
    SetObjectiveDisplayed(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_DataSlate.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(30)
SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveSkipped(5)
SetObjectiveSkipped(20)
SetObjectiveSkipped(30)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
FFNeonZ02_SpeechChallengeQuest.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DialogueFCNeon.SetStage(140)
Actor CloverRef = Alias_Clover.GetActorRef()
Alias_Clover.Clear()
CloverRef.SetEssential(False)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_DataSlate Auto Const Mandatory

Quest Property DialogueFCNeon Auto Const Mandatory

Quest Property FFNeonZ02_SpeechChallengeQuest Auto Const Mandatory

Quest Property FFNeonGuardPointer_Z02 Auto Const Mandatory

ReferenceAlias Property Alias_Clover Auto Const Mandatory
