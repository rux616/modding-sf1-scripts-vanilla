;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCrimeGuards_00269BC0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
Quest __temp = self as Quest
DialogueCrimeGuardsQuestScript kmyQuest = __temp as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerTryToArrest()
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

;BEGIN FRAGMENT Fragment_Stage_0310_Item_00
Function Fragment_Stage_0310_Item_00()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
Quest __temp = self as Quest
DialogueCrimeGuardsQuestScript kmyQuest = __temp as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
Game.GetPlayer().RemoveItem(Credits, CrimeBribeAmount.GetValueInt())
kmyquest.PlayerPayFine(abRemoveStolenItems=false, abGoToJail=true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
Quest __temp = self as Quest
DialogueCrimeGuardsQuestScript kmyQuest = __temp as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.PlayerPayFine(abRemoveStolenItems=false, abGoToJail=true)
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

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN AUTOCAST TYPE DialogueCrimeGuardsQuestScript
Quest __temp = self as Quest
DialogueCrimeGuardsQuestScript kmyQuest = __temp as DialogueCrimeGuardsQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerPayFine(false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0499_Item_00
Function Fragment_Stage_0499_Item_00()
;BEGIN CODE
if UC05_PlayerCaughtSnoopingFSE.GetValue() < 1
  UC05_PlayerCaughtSnoopingFSE.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN AUTOCAST TYPE cf01dialoguecrimeguardsscript
Quest __temp = self as Quest
cf01dialoguecrimeguardsscript kmyQuest = __temp as cf01dialoguecrimeguardsscript
;END AUTOCAST
;BEGIN CODE
kMyQuest.DisablePlayerControlsForCF01Arrest()
CF01.SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0705_Item_00
Function Fragment_Stage_0705_Item_00()
;BEGIN CODE
Game.GetPlayer().StopCombatAlarm()
Alias_Guard.GetActorRef().EvaluatePackage(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE LC044DialogueCrimeGuardsScript
Quest __temp = self as Quest
LC044DialogueCrimeGuardsScript kmyQuest = __temp as LC044DialogueCrimeGuardsScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PlayerWinSpeechChallenge()
RI04.SetStage(470)
LC044.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0810_Item_00
Function Fragment_Stage_0810_Item_00()
;BEGIN AUTOCAST TYPE LC044DialogueCrimeGuardsScript
Quest __temp = self as Quest
LC044DialogueCrimeGuardsScript kmyQuest = __temp as LC044DialogueCrimeGuardsScript
;END AUTOCAST
;BEGIN CODE
LC044.SetStage(13)
kmyQuest.PlayerGoToDetention()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property UC05_PlayerCaughtSnoopingFSE Auto Const Mandatory

Quest Property RI04 Auto Const Mandatory

Quest Property LC044 Auto Const

Quest Property CF01 Auto Const Mandatory

GlobalVariable Property CrimeBribeAmount Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

GlobalVariable Property CrimeAllowBribePlayerCreditsRequired Auto Const Mandatory

ReferenceAlias Property Alias_Guard Auto Const Mandatory

GlobalVariable Property CrimeBountyAmount Auto Const Mandatory
