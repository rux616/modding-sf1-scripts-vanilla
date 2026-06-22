;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname SFBGS00D:Fragments:Quests:QF_SFBGS038_CREW_EliteCrew_M_01083A33 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;SetStage on this quest to put Andromeda in the hiring faction
SetStage(1)
SetStage(50)

;Move Andromeda to the player, make her the active follower, and remind her about her AI package
(Andromeda.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Andromeda.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;phase runs on start for ECs that aren't quest rewards
Actor MuriaRef = Andromeda.GetActorRef()
MuriaRef.SetFactionRank(PotentialCrewFaction, 1)
MuriaRef.SetNoBleedoutRecovery(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0002_Item_00
Function Fragment_Stage_0002_Item_00()
;BEGIN CODE
SetStage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0003_Item_00
Function Fragment_Stage_0003_Item_00()
;BEGIN CODE
SetStage(1)
Actor MuriaRef = Andromeda.GetActorRef()

MuriaRef.AddPerk(Crew_PainTolerance)
MuriaRef.AddPerk(Crew_Ship_Weapons_Energy)
MuriaRef.AddPerk(Crew_ParticleBeams)
MuriaRef.AddPerk(Crew_ParticleBeams)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0004_Item_00
Function Fragment_Stage_0004_Item_00()
;BEGIN AUTOCAST TYPE COM_Barrett_EpilogueTimerScript
Quest __temp = self as Quest
COM_Barrett_EpilogueTimerScript kmyQuest = __temp as COM_Barrett_EpilogueTimerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartCooldownTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
Andromeda.GetActorRef().Resurrect()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_01
Function Fragment_Stage_0005_Item_01()
;BEGIN CODE
SFBGS038_FactionSharedCrimeList_Muria.AddForm(CrimeFactionUC)

Actor MuriaRef = Andromeda.GetActorRef()
MuriaRef.RemoveFromFaction(CrimeFactionUC)
MuriaRef.RemoveFromFaction(NewAtlantisFaction)
MuriaRef.AddToFaction(SFBGS038_CrewElite_PersonalCrimeFaction_Muria)
MuriaRef.SetCrimeFaction(SFBGS038_CrewElite_PersonalCrimeFaction_Muria)
MuriaRef.AddToFaction(PotentialCrewFaction)
MuriaRef.SetFactionRank(PotentialCrewFaction, -1)
MuriaRef.AddToFaction(AvailableCrewFaction)
MuriaRef.SetFactionRank(AvailableCrewFaction, -1)
MuriaRef.AddToFaction(CurrentCrewFaction)
MuriaRef.SetFactionRank(CurrentCrewFaction, -1)
MuriaRef.SetLinkedRef(Alias_SandboxMarker.GetRef(), SQ_LinkCompanionEliteCrewHomeMarker)
MuriaRef.SetOutfit(SFBFS038_Outfit_Spacesuit_Elite_Muria, true)
MuriaRef.IgnoreFriendlyHits()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_02
Function Fragment_Stage_0005_Item_02()
;BEGIN CODE
Andromeda.GetActorRef().AddItem(Crew_Elite_Tombstone)
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
SFBGS038_FactionSharedCrimeList_Muria.RemoveAddedForm(CrimeFactionUC)
Andromeda.GetActorRef().SetNoBleedoutRecovery(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SetCostMultAndUpdateCost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_01
Function Fragment_Stage_0100_Item_01()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
;Taskmaster speech discount
kmyquest.SetCostMultAndUpdateCost(1)
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

ReferenceAlias Property Andromeda Auto Const

Faction Property PotentialCrewFaction Auto Const

Perk Property Crew_Botany Auto Const 

Perk Property Crew_PainTolerance Auto Const 

Perk Property Crew_Ship_Weapons_Energy Auto Const 

Perk Property Crew_ParticleBeams Auto Const 

Faction Property SFBGS038_CrewElite_PersonalCrimeFaction_Muria Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory

Faction Property NewAtlantisFaction Auto Const Mandatory

ReferenceAlias Property Alias_SandboxMarker Auto Const Mandatory

Keyword Property SQ_LinkCompanionEliteCrewHomeMarker Auto Const Mandatory

Outfit Property SFBFS038_Outfit_Spacesuit_Elite_Muria Auto Const Mandatory

Faction Property AvailableCrewFaction Auto Const Mandatory

Faction Property CurrentCrewFaction Auto Const Mandatory

Weapon Property Crew_Elite_Tombstone Auto Const Mandatory

FormList Property SFBGS038_FactionSharedCrimeList_Muria Auto Const Mandatory
