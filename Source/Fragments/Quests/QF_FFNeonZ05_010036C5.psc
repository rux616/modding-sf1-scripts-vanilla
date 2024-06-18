;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ05_010036C5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Abbie gives player the supplies
Alias_Abbie.GetActorRef().RemoveItem(Alias_Supplies.GetRef())
Game.GetPlayer().AddItem(Alias_Supplies.GetRef())

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
Alias_Abbie.GetActorRef().RemoveItem(Alias_Supplies.GetRef())
Game.GetPlayer().AddItem(Alias_Supplies.GetRef())

;Set Objectives
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Abbie gives player the supplies
Alias_Abbie.GetActorRef().RemoveItem(Alias_Supplies.GetRef())
Game.GetPlayer().AddItem(Alias_Supplies.GetRef())

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
Game.GetPlayer().RemoveItem(Alias_Supplies.GetRef())
CompleteAllObjectives()

;set stage on FFNeonDialogue to 280 - player gives supplies to Joseph
FFNeonDialogue.SetStage(280)

;stop quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_2000_Item_00
Function Fragment_Stage_2000_Item_00()
;BEGIN CODE
;remove supplies from player, complete all objectives
Game.GetPlayer().RemoveItem(Alias_Supplies.GetRef())
CompleteAllObjectives()

;set stage on FFNeonDialogue to 280 - player gives supplies to Joseph
FFNeonDialogue.SetStage(280)

;stop quest
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Abbie Auto Const Mandatory

ReferenceAlias Property Alias_Supplies Auto Const Mandatory

Quest Property FFNeonDialogue Auto Const
