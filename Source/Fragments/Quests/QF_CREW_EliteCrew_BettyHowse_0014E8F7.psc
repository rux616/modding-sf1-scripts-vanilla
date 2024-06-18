;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_BettyHowse_0014E8F7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;SetStage on this quest to make Betty recruitable and already hired
SetStage(1)
SetStage(50)

;Move Betty to the player, make her the active follower, and remind her about her AI package
(Betty.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Betty.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
;for non-quest reward ECs, this stage runs on start
Betty.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
kmyquest.SetCostMultAndUpdateCost(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
if !GetStageDone(50)
    kmyQuest.Recruited()
    SetStage(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RecruitedUnasssigned()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
;set the encounter quest finished and make Betty recruited

BettyEncounterQuest.SetStage(30)
if BettyEncounterQuest.GetStageDone(40)
    BettyEncounterQuest.SetStage(2000)
endif

;unlike other Elite Crew, Betty is recruited via an SE quest
;If you're looking for that dialogue, try SE_AC01_EliteCrewEncounter
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartBackstoryTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Betty Auto Const

Faction Property PotentialCrewFaction Auto Const

Quest Property BettyEncounterQuest Auto Const
