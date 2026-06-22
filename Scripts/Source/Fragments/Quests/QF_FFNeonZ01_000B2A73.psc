;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ01_000B2A73 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, FFNeonZ01_BribeLarge.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, CreditAmount.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0008_Item_00
Function Fragment_Stage_0008_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Drug_Aurora)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_Stratos.GetRef().EnableNoWait()
FFNeonZ01_SpeechChallengeQuest.Start()

; Flag the pointer quest to end (or never play)
FFNeonGuardPointer_Z01.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
if !GetStageDone(30)
    SetObjectiveSkipped(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_Slate.GetRef())
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
if !GetStageDone(30)
    SetObjectiveSkipped(30)
endif
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(Alias_Slate.GetRef())
FFNeonZ01_SpeechChallengeQuest.Stop()
DialogueFCNeon.SetStage(120)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Stratos Auto Const Mandatory

Quest Property FFNeonZ01_SpeechChallengeQuest Auto Const Mandatory

Quest Property DialogueFCNeon Auto Const Mandatory

ReferenceAlias Property Alias_Slate Auto Const Mandatory

GlobalVariable Property CreditAmount Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property FFNeonZ01_BribeLarge Auto Const Mandatory

Potion Property Drug_Aurora Auto Const Mandatory

Quest Property FFNeonGuardPointer_Z01 Auto Const Mandatory
