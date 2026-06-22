;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFDenR01_001E7942 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(15)
SetObjectiveCompleted(15)
endif
SetObjectiveDisplayed(20)
Alias_DenPosters.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
Game.GetPlayer().AddItem(Alias_Poster01Misc01.GetRef())
Game.GetPlayer().AddItem(Alias_Poster01Misc02.GetRef())
Game.GetPlayer().AddItem(Alias_Poster01Misc03.GetRef())
Alias_Poster01Activator.GetReference().Enable()
Alias_Poster02Activator.GetReference().Enable()
Alias_Poster03Activator.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Poster01Misc01.GetRef())
Alias_Poster01Activator.GetReference().GetLinkedRef().Enable()
if GetStageDone(42) && GetStageDone(43)
SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0042_Item_00
Function Fragment_Stage_0042_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Poster01Misc02.GetRef())
Alias_Poster02Activator.GetReference().GetLinkedRef().Enable()
if GetStageDone(41) && GetStageDone(43)
SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0043_Item_00
Function Fragment_Stage_0043_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Poster01Misc03.GetRef())
Alias_Poster03Activator.GetReference().GetLinkedRef().Enable()
if GetStageDone(41) && GetStageDone(42)
SetStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
;Disable the poster refs
Alias_Poster01Static.GetReference().Disable()
Alias_Poster02Static.GetReference().Disable()
Alias_Poster03Static.GetReference().Disable()

pFFDenR01_Completions.SetValue((pFFDenR01_Completions.GetValue() as int) + 1)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property FFDenR01_Poster Auto Const Mandatory

ReferenceAlias Property Alias_Poster01Activator Auto Const Mandatory

ReferenceAlias Property Alias_Poster02Activator Auto Const Mandatory

ReferenceAlias Property Alias_DenPosters Auto Const Mandatory

ReferenceAlias Property Alias_Poster03Activator Auto Const Mandatory

ReferenceAlias Property Alias_Poster01Static Auto Const Mandatory

ReferenceAlias Property Alias_Poster02Static Auto Const Mandatory

ReferenceAlias Property Alias_Poster03Static Auto Const Mandatory

LocationAlias Property Alias_NewAtlantisLocation Auto Const Mandatory

LocationAlias Property Alias_TargetLocation Auto Const Mandatory

GlobalVariable Property pFFDenR01_Completions Auto Const Mandatory

ReferenceAlias Property Alias_Poster01Misc03 Auto Const Mandatory

ReferenceAlias Property Alias_Poster01Misc01 Auto Const Mandatory

ReferenceAlias Property Alias_Poster01Misc02 Auto Const Mandatory
