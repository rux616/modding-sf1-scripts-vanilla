;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS003:Fragments:Quests:QF_SFBGS003_BountyScanner_FD0066B4_15 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
Game.GetPlayer().MoveTo(Alias_BountyTarget.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Actor PlayerREF = Alias_Player.GetActorRef()
int BribeChance = 1

If PlayerREF.HasPerk(Skill_Diplomacy) 
   BribeChance += 1
EndIf 

If PlayerREF.HasPerk(Skill_Manipulation) 
   BribeChance += 1
EndIf 

If PlayerREF.HasPerk(Skill_Negotiation)
   BribeChance += 2
EndIf 

If PlayerREF.HasPerk(Skill_Persuasion)
   BribeChance += 1
EndIf 

If PlayerREF.GetLevel() > 50 
   BribeChance += 2
ElseIf PlayerREF.GetLevel() > 25
   BribeChance += 1
EndIf 

If Utility.RandomInt(1,10) < BribeChance
   SetStage(30)
EndIf
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
SetObjectiveCompleted(100)
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

;BEGIN FRAGMENT Fragment_Stage_0430_Item_00
Function Fragment_Stage_0430_Item_00()
;BEGIN CODE
SetStage(950)
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

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
If !Alias_BountyTarget.GetActorRef().HasKeyword(SFBGS003_Keyword_WantedAlive)
   SetObjectiveSkipped(100)
   SetObjectiveSkipped(200)
   SetObjectiveSkipped(250)
   SetObjectiveDisplayed(300)
EndIf
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
If Alias_BountyTarget.GetActorRef().HasKeyword(SFBGS003_Keyword_WantedDead)
   SetStage(800)
Else 
   SetStage(900)
   SetObjectiveFailed(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
If Alias_BountyTarget.GetActorRef().HasKeyword(SFBGS003_Keyword_WantedAlive)
   SetStage(800)
Else
   SetObjectiveDisplayed(300)
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
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_01
Function Fragment_Stage_0850_Item_01()
;BEGIN CODE
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0850_Item_02
Function Fragment_Stage_0850_Item_02()
;BEGIN CODE
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN CODE
int bounties = SFBGS003_Bounties_Total.GetValue() as int
bounties += 1
SFBGS003_MUSGenesisStingerTrackersAllianceGood.Add()
SFBGS003_Bounties_Total.SetValue(bounties)
CompleteAllObjectives()
SetStage(999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN CODE
SFBGS003_MUSGenesisStingerTrackersAllianceGood.Add()

If Alias_GuardAlias.GetRef()
   Alias_BountyTarget.GetActorRef().SetCrimeFaction(Alias_GuardAlias.GetActorRef().GetCrimeFaction())
Else
   Alias_BountyTarget.GetActorRef().SetEssential(True)
EndIf

FailAllObjectives()
SetStage(999)
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

MusicType Property SFBGS003_MUSGenesisStingerTrackersAllianceBad Auto Const Mandatory

MusicType Property SFBGS003_MUSGenesisStingerTrackersAllianceGood Auto Const Mandatory

Perk Property Skill_Manipulation Auto Const Mandatory

Perk Property Skill_Negotiation Auto Const Mandatory

Perk Property Skill_Persuasion Auto Const Mandatory

Perk Property Skill_Diplomacy Auto Const Mandatory

ReferenceAlias Property Alias_Player Auto Const Mandatory

ReferenceAlias Property Alias_GuardAlias Auto Const Mandatory
