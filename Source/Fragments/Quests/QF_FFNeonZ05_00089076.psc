;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ05_00089076 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

; Close the pointer
FFNeonGuardPointer_Z05.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Abbie gives player the supplies
Alias_PlayerShip.GetRef().AddItem(Alias_Supplies.GetRef())
Alias_Supplies.GetRef().Enable()


;Set Objectives
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
;Abbie gives player the supplies
Alias_PlayerShip.GetRef().AddItem(Alias_Supplies.GetRef())
Alias_Supplies.GetRef().Enable()


;Set Objectives
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Abbie gives player the supplies
Alias_PlayerShip.GetRef().AddItem(Alias_Supplies.GetRef())
Alias_PlayerShip.GetRef().AddItem(Alias_Supplies01.GetRef())
Alias_Supplies.GetRef().Enable()
Alias_Supplies01.GetRef().Enable()

;Set Objectives
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;remove supplies from player, complete all objectives
Alias_PlayerShip.GetRef().RemoveItem(Alias_Supplies.GetRef())
CompleteAllObjectives()

;set stage on FFNeonDialogue to 280 - player gives supplies to Joseph
FFNeonDialogue.SetStage(280)

;Set up timer for post-quest hello on Joseph Manning
Timer.SetValue(DaysPassed.GetValue() + 2)

;stop quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;remove supplies from player, complete all objectives
Alias_PlayerShip.GetRef().RemoveItem(Alias_Supplies.GetRef())
Alias_PlayerShip.GetRef().RemoveItem(Alias_Supplies01.GetRef())
CompleteAllObjectives()

;set stage on FFNeonDialogue to 280 - player gives supplies to Joseph
FFNeonDialogue.SetStage(280)

;Set up timer for post-quest hello on Joseph Manning
Timer.SetValue(DaysPassed.GetValue() + 2)

;stop quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Abbie Auto Const Mandatory

ReferenceAlias Property Alias_Supplies Auto Const Mandatory

Quest Property FFNeonDialogue Auto Const

ReferenceAlias Property Alias_PlayerShip Auto Const Mandatory

MiscObject Property Supplies Auto Const

ReferenceAlias Property Alias_Supplies01 Auto Const Mandatory

GlobalVariable Property Timer Auto Const

GlobalVariable Property DaysPassed Auto Const

Quest Property FFNeonGuardPointer_Z05 Auto Const Mandatory
