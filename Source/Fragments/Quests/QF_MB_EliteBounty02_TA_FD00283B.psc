;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MB_EliteBounty02_TA_FD00283B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SFBGS003_MUSGenesisStingerTrackersAllianceBad.Add()

(SFBGS003_TrackersAllianceSupportQuest as SFBGS003TASupportQuestScript).SetBountiesDeadTotal()

SetStage(950)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
SFBGS003_MUSGenesisStingerTrackersAllianceGood.Add()

(SFBGS003_TrackersAllianceSupportQuest as SFBGS003TASupportQuestScript).SetBountiesAliveTotal()

SetStage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE MissionBountyQuestScript
Quest __temp = self as Quest
MissionBountyQuestScript kmyQuest = __temp as MissionBountyQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MissionComplete()
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0950_Item_00
Function Fragment_Stage_0950_Item_00()
;BEGIN AUTOCAST TYPE MissionBountyQuestScript
Quest __temp = self as Quest
MissionBountyQuestScript kmyQuest = __temp as MissionBountyQuestScript
;END AUTOCAST
;BEGIN CODE
FailAllObjectives()
kmyQuest.MissionFailed()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PrimaryRef Auto Const Mandatory

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory

MusicType Property SFBGS003_MUSGenesisStingerTrackersAllianceGood Auto Const Mandatory

GlobalVariable Property SFBGS003_Bounties_Total Auto Const Mandatory

MusicType Property SFBGS003_MUSGenesisStingerTrackersAllianceBad Auto Const Mandatory

Quest Property SFBGS003_TrackersAllianceSupportQuest Auto Const Mandatory
