;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_Lin_001A8D9C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage on MQ104B and stop it just to be safe
MQ104B.SetStage(110)
MQ104B.Stop()

;SetStage on this quest to make Lin recruitable and already hired
SetStage(1)
SetStage(50)

;Move Lin to the player, make her the active follower, and remind her about her AI package
(Lin.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Lin.GetActorRef().EvaluatePackage()
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
;makes Lin recruitable as Elite Crew
;set via fragment on Mq104B stage 110
Lin.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
Lin.GetActorRef().AddPerk(Crew_Demolitions)
Lin.GetActorRef().AddPerk(Crew_Outpost_Management)
Lin.GetActorRef().AddPerk(Crew_Outpost_Management)
Lin.GetActorRef().AddPerk(Crew_Outpost_Management)
kmyquest.SetCostMultAndUpdateCost(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
MQ104B.SetStage(112)

Alias_LinNoSupervisor.ForceRefTo(Lin.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RecruitedUnasssigned()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
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

ReferenceAlias Property Lin Auto Const

Faction Property PotentialCrewFaction Auto Const

Quest Property MQ104B Auto Const Mandatory

Perk Property Crew_Outpost_Management Auto Const

Perk Property Crew_WeightLifting Auto Const

Perk Property Crew_Demolitions Auto Const

ReferenceAlias Property Alias_LinNoSupervisor Auto Const Mandatory
