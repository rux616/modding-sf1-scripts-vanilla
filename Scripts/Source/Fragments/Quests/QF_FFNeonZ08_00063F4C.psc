;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNeonZ08_00063F4C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;close pointer 
FFNeonGuardPointer_Z08.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(14)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0018_Item_00
Function Fragment_Stage_0018_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(14)
SetObjectiveCompleted(14)
endif

if GetStageDone(13)
SetObjectiveDisplayed(14,0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

Alias_HeadlockMarker.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0028_Item_00
Function Fragment_Stage_0028_Item_00()
;BEGIN CODE
Game.GetPlayer().AddToFaction(HeadlockEnemyFaction)
Alias_Headlock.GetActorRef().setvalue(Game.GetAggressionAV(), 1)
Alias_Headlock.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Thug.GetActorRef().setvalue(Game.GetAggressionAV(), 1)
Alias_Thug.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Thugcopy001.GetActorRef().setvalue(Game.GetAggressionAV(), 1)
Alias_Thugcopy001.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Thugcopy002.GetActorRef().setvalue(Game.GetAggressionAV(), 1)
Alias_Thugcopy002.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
DialogueQuestNeon.SetStage(480)

;Set a global variable to be == DaysPassed + 1, so we can condition TLs with it
TLTimer.SetValue(DaysPassed.GetValue() + 1)

Alias_HeadlockMarker.GetRef().Disable()

CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DialogueQuestNeon Auto Const

ReferenceAlias Property Alias_HeadlockMarker Auto Const Mandatory

ReferenceAlias Property Alias_Headlock Auto Const Mandatory

Faction Property HeadlockEnemyFaction Auto Const

GlobalVariable Property TLTimer Auto Const

GlobalVariable Property DaysPassed Auto Const

RefCollectionAlias Property Alias_HeadlockGang Auto Const Mandatory

Quest Property FFNeonGuardPointer_Z08 Auto Const Mandatory

ReferenceAlias Property Alias_Thug Auto Const Mandatory

ReferenceAlias Property Alias_ThugCOPY001 Auto Const Mandatory

ReferenceAlias Property Alias_ThugCOPY002 Auto Const Mandatory
