;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_RafaelAgue_001933D5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Rafael is not enabled by default and needs to be enabled
Rafael.GetActorRef().Enable()

;Set stage on MQ207C and stop it just to be safe
MQ207C.SetStage(929)
MQ207C.Stop()

;SetStage on this quest to make Rafael recruitable and already hired
SetStage(1)
SetStage(50)

;Move Rafael to the player, make him the active follower, and remind him about his AI package
(Rafael.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Rafael.GetActorRef().EvaluatePackage()
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
;Make Rafael recruitable as Crew
;set via fragment on MQ207C_RafaelPostquest stage 210
Actor RafaelRef = Rafael.GetActorRef()

RafaelRef.SetFactionRank(PotentialCrewFaction, 1)
RafaelRef.Enable()
RafaelRef.AddPerk(Crew_Outpost_Engineering)
RafaelRef.AddPerk(CREW_Ship_StarshipEngineering)
RafaelRef.AddPerk(CREW_Ship_StarshipEngineering)
RafaelRef.AddPerk(Crew_Outpost_Management)
RafaelRef.SetEssential(true)
kmyquest.SetCostMultAndUpdateCost(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Set by: CREW_EliteCrew_RafaelAguerro_Recruit, scene begin.

;Complete and shut down MQ207C_RafaelPostquest.
MQ207C_RafaelPostquest.SetStage(220)
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
kmyQuest.RecruitedUnasssigned()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
SetStage(100)
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
SetStage(100)
SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
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

ReferenceAlias Property Rafael Auto Const

Faction Property PotentialCrewFaction Auto Const

Quest Property MQ207C Auto Const

Quest Property MQ207C_RafaelPostquest Auto Const Mandatory

Perk Property Crew_Outpost_Engineering Auto Const

Perk Property CREW_Ship_StarshipEngineering Auto Const

Perk Property Crew_Outpost_AneutronicFusion Auto Const

Perk Property Crew_Scavenging Auto Const

Perk Property Crew_Outpost_Management Auto Const Mandatory
