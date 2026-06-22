;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_FFNewHomesteadR04_0021B1FA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_Joyce.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
DialogueNewHomestead.SetStage(412)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
If FFNewHomesteadR04Misc.IsRunning()
	FFNewHomesteadR04Misc.SetStage(1000)
EndIf

If DialogueNewHomestead.GetStageDone(411) && !DialogueNewHomestead.GetStageDone(412) && !DialogueNewHomestead.GetStageDone(413)
	SetObjectiveDisplayed(100)
EndIf

SetObjectiveDisplayed(200)

Alias_Ice01.GetRef().SetLinkedRef(Alias_Turbine01.GetRef(), LinkCustom01)
Alias_Ice02.GetRef().SetLinkedRef(Alias_Turbine02.GetRef(), LinkCustom01)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Disable the light enablemarker so the lights stop flickering.
Alias_LightEnableMarkers.DisableAll()
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_10000_Item_00
Function Fragment_Stage_10000_Item_00()
;BEGIN CODE
FFNewHomesteadR04MiscQuestStartKeyword.SendStoryEvent()
If FFNewHomesteadR04_Repeated.GetValue() < 1
	FFNewHomesteadR04_Repeated.SetValue(1)
EndIf
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE FFNewHomesteadR04QuestScript
Quest __temp = self as Quest
FFNewHomesteadR04QuestScript kmyQuest = __temp as FFNewHomesteadR04QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetCooldown()

If FFNewHomesteadR04_NumTimesCompleted.GetValue() == 0
	Game.GetPlayer().SetValue(FFNewHomesteadR04_Foreknowledge_AV, 1)
EndIf

FFNewHomesteadR04_NumTimesCompleted.Mod(1)
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Joyce Auto Const Mandatory

GlobalVariable Property FFNewHomesteadR04_NumTimesCompleted Auto Const Mandatory

Quest Property FFNewHomesteadR04Misc Auto Const Mandatory

Quest Property DialogueNewHomestead Auto Const Mandatory

ActorValue Property FFNewHomesteadR04_Foreknowledge_AV Auto Const Mandatory

Keyword Property FFNewHomesteadR04MiscQuestStartKeyword Auto Const Mandatory

ReferenceAlias Property Alias_Ice01 Auto Const Mandatory

ReferenceAlias Property Alias_Ice02 Auto Const Mandatory

ReferenceAlias Property Alias_Turbine01 Auto Const Mandatory

ReferenceAlias Property Alias_Turbine02 Auto Const Mandatory

Keyword Property LinkCustom01 Auto Const Mandatory

RefCollectionAlias Property Alias_LightEnableMarkers Auto Const Mandatory

GlobalVariable Property FFNewHomesteadR04_Repeated Auto Const Mandatory
