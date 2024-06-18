;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_GuardShip_UnitedColonies0_0005BD6F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
Quest __temp = self as Quest
DialogueCrimeGuardsQuestScript kmyQuest = __temp as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PlayerTryToArrest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
Quest __temp = self as Quest
DialogueCrimeGuardsQuestScript kmyQuest = __temp as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerResistingArrest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
Quest __temp = self as Quest
DialogueCrimeGuardsQuestScript kmyQuest = __temp as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerGoToJail()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
Quest __temp = self as Quest
DialogueCrimeGuardsQuestScript kmyQuest = __temp as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerPayFine()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
Quest __temp = self as Quest
DialogueCrimeGuardsQuestScript kmyQuest = __temp as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerPayFine(true, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
Quest __temp = self as Quest
DialogueCrimeGuardsQuestScript kmyQuest = __temp as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerPayFine(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
Game.GetPlayer().StopCombatAlarm()
CF01.SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CF01 Auto Const Mandatory
