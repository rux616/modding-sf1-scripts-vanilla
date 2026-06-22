;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS003:Fragments:Quests:QF_SFBGS003_BountyScannerQ_FD0066B6_8 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_BountyTarget.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_BountyTarget.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
SetStage(240)
SetStage(600)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
SetStage(240)
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0240_Item_00
Function Fragment_Stage_0240_Item_00()
;BEGIN CODE
Alias_BountyTarget.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(100)

If Alias_BountyTarget.GetActorRef().HasKeyword(SFBGS003_Keyword_WantedAlive)
   SetObjectiveCompleted(200)
   If Alias_BountyTarget.GetActorRef().HasKeyword(SFBGS003_Keyword_WantedDead)
      SetObjectiveCompleted(250)
   EndIf 
Else 
   SetObjectiveCompleted(300)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0425_Item_00
Function Fragment_Stage_0425_Item_00()
;BEGIN AUTOCAST TYPE SFBGS003_SQ_Bounty_QuestScript
Quest __temp = self as Quest
SFBGS003_SQ_Bounty_QuestScript kmyQuest = __temp as SFBGS003_SQ_Bounty_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.NPCFlees()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0475_Item_00
Function Fragment_Stage_0475_Item_00()
;BEGIN AUTOCAST TYPE SFBGS003_SQ_Bounty_QuestScript
Quest __temp = self as Quest
SFBGS003_SQ_Bounty_QuestScript kmyQuest = __temp as SFBGS003_SQ_Bounty_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AttackPlayer()
Alias_BountyTarget.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE SFBGS003_SQ_Bounty_QuestScript
Quest __temp = self as Quest
SFBGS003_SQ_Bounty_QuestScript kmyQuest = __temp as SFBGS003_SQ_Bounty_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.NPCSurrendered()
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
If GetStageDone(30)
   SetStage(800)
Else 
   SetStage(900)
   SetObjectiveFailed(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
;BEGIN AUTOCAST TYPE SFBGS003_SQ_Bounty_QuestScript
Quest __temp = self as Quest
SFBGS003_SQ_Bounty_QuestScript kmyQuest = __temp as SFBGS003_SQ_Bounty_QuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RewardBountyCredits()
SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_00
Function Fragment_Stage_0850_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_01
Function Fragment_Stage_0850_Item_01()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_02
Function Fragment_Stage_0850_Item_02()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
int bounties = SFBGS003_Bounties_Total.GetValue() as int
bounties += 1

SFBGS003_Bounties_Total.SetValue(bounties)
CompleteAllObjectives()
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
FailAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0999_Item_00
Function Fragment_Stage_0999_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BountyAmount Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

ReferenceAlias Property Alias_BountyTarget Auto Const Mandatory

Keyword Property SFBGS003_Keyword_WantedAlive Auto Const Mandatory

Keyword Property SFBGS003_Keyword_WantedDead Auto Const Mandatory

GlobalVariable Property SFBGS003_Bounties_Total Auto Const Mandatory
