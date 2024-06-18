;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_Vasco_00256F51 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage on MQ101 and stop it just to be safe
MQ101.SetStage(312)
MQ101.Stop()

;SetStage on this quest to make Vasco recruitable and already hired
SetStage(1)
SetStage(50)

;Move Vasco to the player, make him the active follower, and remind him about his AI package
(Vasco.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Vasco.GetActorRef().EvaluatePackage()
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
;add Vasco to the proper faction to make him recruitable as Elite Crew
;this is done with a fragment on MQ101 stage 312

Vasco.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
Vasco.GetActorRef().AddPerk(Crew_Ship_AneutronicFusion)
Vasco.GetActorRef().AddPerk(Crew_Ship_Shields)
Vasco.GetActorRef().AddPerk(Crew_Ship_Shields)
Vasco.GetActorRef().AddPerk(Crew_Ship_Weapons_EM)
kmyquest.SetCostMultAndUpdateCost(0.0)
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
kmyQuest.Recruited()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Vasco Auto Const

Faction Property PotentialCrewFaction Auto Const

Quest Property MQ101 Auto Const

Perk Property CREW_Ship_Shields Auto Const

Perk Property CREW_Ship_AneutronicFusion Auto Const

Perk Property Crew_Ship_Weapons_EM Auto Const
