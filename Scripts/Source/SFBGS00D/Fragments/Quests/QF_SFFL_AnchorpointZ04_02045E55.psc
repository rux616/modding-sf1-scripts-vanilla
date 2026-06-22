;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFFL_AnchorpointZ04_02045E55 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_AnchorpointZ04QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_AnchorpointZ04QuestScript kmyQuest = __temp as SFBGS00D:SFFL_AnchorpointZ04QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)

kmyquest.GenerateEscorts()

; Close out the misc objective to talk to Killian
SFFL_DialogueAnchorpoint.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE SFBGS00D:SFFL_AnchorpointZ04QuestScript
Quest __temp = self as Quest
SFBGS00D:SFFL_AnchorpointZ04QuestScript kmyQuest = __temp as SFBGS00D:SFFL_AnchorpointZ04QuestScript
;END AUTOCAST
;BEGIN CODE
CompleteAllObjectives()

;Check whether the player or ship has the item, and remove it
if Game.GetPlayer().GetItemCount(Alias_Contraband.GetRef()) == 1
  Game.GetPlayer().RemoveItem(Alias_Contraband.GetRef())
elseif Game.GetPlayerHomeSpaceShip().GetItemCount(Alias_Contraband.GetRef()) == 1
  Game.GetPlayerHomeSpaceship().RemoveItem(Alias_Contraband.GetRef())
endif

; Update the global that controls repeatability
SFFL_AnchorpointZ04_RepeatGlobal.SetValue(1)

; Start the reset timer for this quest
SFFL_AnchorpointQuestRepeatManager.SetStage(200)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Contraband Auto Const Mandatory

Quest Property SFFL_DialogueAnchorpoint Auto Const Mandatory

GlobalVariable Property SFFL_AnchorpointZ04_RepeatGlobal Auto Const Mandatory

Quest Property SFFL_AnchorpointQuestRepeatManager Auto Const Mandatory
