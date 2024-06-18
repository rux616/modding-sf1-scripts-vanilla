;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFClinicR01_001C2C96 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE FFClinicR01QuestScript
Quest __temp = self as Quest
FFClinicR01QuestScript kmyQuest = __temp as FFClinicR01QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.Target_Var = Utility.RandomInt(1,3)

if kmyquest.Target_Var == 1
Alias_Target.ForceRefTo(Alias_AlexeiLebedev.GetReference())
elseif kmyquest.Target_Var == 2
Alias_Target.ForceRefTo(Alias_JosephManning.GetReference())
elseif kmyquest.Target_Var == 3
Alias_Target.ForceRefTo(Alias_CharlieFlynn.GetReference())
endif

Alias_TargetLocation.ForceLocationTo(Alias_Target.GetReference().GetEditorLocation())

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
Game.GetPlayer().AddItem(Alias_Slate.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.GetPlayer().RemoveItem(Alias_Slate.GetReference())
FFClinicR01Completions.SetValue(FFClinicR01Completions.GetValue() + 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Target Auto Const Mandatory

ReferenceAlias Property Alias_AlexeiLebedev Auto Const Mandatory

ReferenceAlias Property Alias_JosephManning Auto Const Mandatory

ReferenceAlias Property Alias_CharlieFlynn Auto Const Mandatory

LocationAlias Property Alias_TargetLocation Auto Const Mandatory

GlobalVariable Property FFClinicR01Completions Auto Const Mandatory

ReferenceAlias Property Alias_Slate Auto Const Mandatory
