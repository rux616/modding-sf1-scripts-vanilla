;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_MathisCast_001BF8A1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage on CF08_Fleet and stop it just to be safe
CF08_Fleet.SetStage(2000)
CF08_Fleet.Stop()

;SetStage on this quest to make Mathis recruitable and already hired
SetStage(1)
SetStage(50)

;Move Mathis to the player, make him the active follower, and remind him about his AI package
(Mathis.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Mathis.GetActorRef().EvaluatePackage()
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
;stage to make Mathis recruitable as an EC
;set via fragment on stage 1000 of CF08_Fleet
Actor MathisRef = Mathis.GetActorRef()

MathisRef.SetFactionRank(PotentialCrewFaction, 1)
MathisRef.AddPerk(Crew_Weightlifting)
MathisRef.AddPerk(Crew_Ballistics)
MathisRef.AddPerk(Crew_Incapacitation)
MathisRef.AddPerk(Crew_Incapacitation)
kmyQuest.SetCostMultAndUpdateCost(0.0)
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

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
Actor MathisRef = Mathis.GetActorRef()

MathisRef.AddtoFaction(CrewElite_PersonalCrimeFaction_MathisCastillo)
MathisRef.RemovefromFaction(CrimeFactionCrimsonFleet)
MathisRef.SetCrimeFaction(CrewElite_PersonalCrimeFaction_MathisCastillo)
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

ReferenceAlias Property Mathis Auto Const

Faction Property PotentialCrewFaction Auto Const

Quest Property CF08_Fleet Auto Const

Perk Property Crew_WeightLifting Auto Const

Perk Property Crew_Incapacitation Auto Const

Perk Property Crew_ParticleBeams Auto Const Mandatory

Faction Property CrewElite_PersonalCrimeFaction_MathisCastillo Auto Const Mandatory

Faction Property CrimeFactionCrimsonFleet Auto Const Mandatory

Perk Property Crew_Ballistics Auto Const Mandatory
