;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ06_00082D5A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(0)

; Close the pointer
FFNeonGuardPointer_Z06.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, (FFNeonZ06_TevinPayment.GetValue() as int))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(13)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(13)
SetObjectiveCompleted(13)
endif

if GetStageDone(9)
SetObjectiveDisplayed(13,0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(0)
SetObjectiveDisplayed(30)

Alias_Rusty.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
Alias_Rusty.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
Self.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
Self.SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
Game.GetPlayer().AddItem(Credits, 200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Alias_Rusty.GetActorRef().Disable()
CompleteAllObjectives()
DialogueQuest.SetStage(300)

;set timer for post-quest top level
Timer.SetValue(DaysPassed.GetValue() + 1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
Alias_Rusty.GetActorRef().Disable()
CompleteAllObjectives()
DialogueQuest.SetStage(300)

;set timer for post-quest top level
Timer.SetValue(DaysPassed.GetValue() + 1)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Credits Auto Const

GlobalVariable Property FFNeonZ06_TevinPayment Auto Const

ReferenceAlias Property Alias_Rusty Auto Const Mandatory

Quest Property DialogueQuest Auto Const

GlobalVariable Property Timer Auto Const

GlobalVariable Property DaysPassed Auto Const

Quest Property FFNeonGuardPointer_Z06 Auto Const Mandatory
