;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MB_Bounty06_TA_FD00004A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE MissionQuestScript
Quest __temp = self as Quest
MissionQuestScript kmyQuest = __temp as MissionQuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(100)
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
SFBGS003_MUSGenesisStingerTrackersAllianceBad.Add()

(SFBGS003_TrackersAllianceSupportQuest as SFBGS003TASupportQuestScript).SetBountiesDeadTotal()

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
kmyQuest.MissionFailed()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_PrimaryRef Auto Const Mandatory

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory

MusicType Property SFBGS003_MUSGenesisStingerTrackersAllianceGood Auto Const Mandatory

Quest Property SFBGS003_TrackersAllianceSupportQuest Auto Const Mandatory

MusicType Property SFBGS003_MUSGenesisStingerTrackersAllianceBad Auto Const Mandatory
