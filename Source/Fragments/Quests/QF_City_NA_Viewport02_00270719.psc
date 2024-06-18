;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_City_NA_Viewport02_00270719 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
MQ101Debug.SetValueInt(2)
MQ101.SetStage(1800)
MQ101.SetStage(1810)
MQ105.SetStage(2000)
City_NA_Viewport01.Stop()
Game.GetPlayer().MoveTo(Alias_Startmarker.GetReference())
Game.GetPlayer().AddItem(Credits, 10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
if GetStageDone(190)==0
SetObjectiveDisplayed(22)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
if GetStageDone(190)==0
SetObjectiveDisplayed(23)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0110_Item_00
Function Fragment_Stage_0110_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
SetObjectiveCompleted(110)

;Pop objective for player to invest (so there's at least one active objective if no one else is available)
SetObjectiveDisplayed(120)

;if Eleos quests are done, point to Reisha Lance
if City_ER_Peace.GetStageDone(1000)
SetObjectiveDisplayed(130)
endif

;if Drug quests in Neon are done, point to Bayu
if City_Neon_Drug03.GetStageDone(9000)
SetObjectiveDisplayed(140)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0130_Item_00
Function Fragment_Stage_0130_Item_00()
;BEGIN AUTOCAST TYPE City_NA_Viewport02QuestScript
Quest __temp = self as Quest
City_NA_Viewport02QuestScript kmyQuest = __temp as City_NA_Viewport02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(120)
;remove credits from player
Game.GetPlayer().RemoveItem(Credits, City_NA_Viewport02_InvestAmount.GetValueInt())
;close out other possible optional objectives
if IsObjectiveDisplayed(130) == 1
    SetObjectiveDisplayed(130, 0)
endif
if IsObjectiveDisplayed(140)
    SetObjectiveDisplayed(140, 0)
endif
;skip Stage 190 since we're already talking to Nyssa, go straight to 200
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0140_Item_00
Function Fragment_Stage_0140_Item_00()
;BEGIN AUTOCAST TYPE City_NA_Viewport02QuestScript
Quest __temp = self as Quest
City_NA_Viewport02QuestScript kmyQuest = __temp as City_NA_Viewport02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(130)
if IsObjectiveDisplayed(120)
    SetObjectiveDisplayed(120,0)
endif
if IsObjectiveDisplayed(140)
    SetObjectiveDisplayed(140,0)
endif
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN AUTOCAST TYPE City_NA_Viewport02QuestScript
Quest __temp = self as Quest
City_NA_Viewport02QuestScript kmyQuest = __temp as City_NA_Viewport02QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(140)
if IsObjectiveDisplayed(120)
    SetObjectiveDisplayed(120,0)
endif
if IsObjectiveDisplayed(130)
    SetObjectiveDisplayed(130,0)
endif
SetStage(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
City_NA_Viewport03.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ105 Auto Const Mandatory

ReferenceAlias Property Alias_StartMarker Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

Quest Property CF06 Auto Const Mandatory

Quest Property MQ101 Auto Const Mandatory

Quest Property City_ER_Peace Auto Const Mandatory

Quest Property City_Neon_Drug03 Auto Const Mandatory

Quest Property City_NA_Viewport03 Auto Const Mandatory

GlobalVariable Property MQ101Debug Auto Const Mandatory

Quest Property City_NA_Viewport01 Auto Const Mandatory

GlobalVariable Property City_NA_Viewport02_InvestAmount Auto Const Mandatory
