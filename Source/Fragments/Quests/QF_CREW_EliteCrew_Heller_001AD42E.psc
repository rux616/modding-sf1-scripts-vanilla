;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_Heller_001AD42E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage on MQ104B and stop it just to be safe
MQ104B.SetStage(130)
MQ104B.Stop()

;SetStage on this quest to make Heller recruitable and already hired
SetStage(1)
SetStage(50)

;Move Heller to the player, make him the active follower, and remind him about his AI package
(Alias_Heller.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Alias_Heller.GetActorRef().EvaluatePackage()
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
;make Heller recruitable as Elite Crew
;set via fragment on MQ104B stage 130
Actor HellerRef = Alias_Heller.GetActorRef()
HellerRef.SetFactionRank(PotentialCrewFaction, 1)
HellerRef.AddPerk(Crew_Geology)
HellerRef.AddPerk(Crew_Outpost_Engineering)
HellerRef.AddPerk(Crew_Outpost_Engineering)
HellerRef.AddPerk(Crew_Outpost_Engineering)
kmyquest.SetCostMultAndUpdateCost(0.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
MQ104B.SetStage(125)
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

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
SetStage(200)
kmyQuest.StartBackstoryTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Heller Auto Const Mandatory

Faction Property PotentialCrewFaction Auto Const Mandatory

Quest Property MQ104B Auto Const Mandatory

Perk Property Crew_Geology Auto Const

Perk Property Crew_Outpost_Engineering Auto Const

Perk Property Crew_Outpost_Management Auto Const
