;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_ErickvonPr_00196BAE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage on City_CY_Startup01 and stop it just to be safe
CityCY_Startup01.SetStage(410)
CityCY_Startup01.Stop()

;SetStage on this quest to make Erick recruitable and already hired
SetStage(1)
SetStage(50)

;Move Erick to the player, make him the active follower, and remind him about his AI package
(Erick.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Erick.GetActorRef().EvaluatePackage()
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
;this phase makes Erick recruitable as an Elite Crew
;Set via fragment on CityCY_Startup01 stage 1000
;and conditioned on stage 340 being complete

Actor ErickRef = Erick.GetActorRef()

ErickRef.SetFactionRank(PotentialCrewFaction, 1)
ErickRef.AddPerk(Crew_Ship_Payloads)
ErickRef.AddPerk(Crew_Ship_Astrodynamics)
ErickRef.AddPerk(Crew_Ship_Astrodynamics)
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
kmyQuest.RecruitedUnasssigned()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
Erick.GetActorRef().AddPerk(CREW_Ship_Piloting)
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

ReferenceAlias Property Erick Auto Const

Faction Property PotentialCrewFaction Auto Const

Perk Property CREW_Ship_Piloting Auto Const

Quest Property CityCY_Startup01 Auto Const

Perk Property CREW_Ship_Payloads Auto Const

Perk Property CREW_Ship_Astrodynamics Auto Const
