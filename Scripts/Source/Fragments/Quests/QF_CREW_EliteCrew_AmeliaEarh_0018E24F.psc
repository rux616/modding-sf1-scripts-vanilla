;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_AmeliaEarh_0018E24F Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage on MS02 and stop it just to be safe
MS02.SetStage(1950)
MS02.SetStage(2000)
MS02.Stop()

;SetStage on this quest to make Amelia recruitable and already hired
SetStage(1)
SetStage(50)

;Move Amelia to the player, make her the active follower, and remind her about her AI package
Amelia.GetActorRef().EnableNoWait()
Amelia.GetActorRef().MoveTo(Game.GetPlayer())
(Amelia.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Amelia.GetActorRef().EvaluatePackage()
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
;makes Amelia recruitable as Crew
;stage set via fragment on MS02 stage 2000

Actor AmeliaRef = Amelia.GetActorRef()

AmeliaRef.SetFactionRank(PotentialCrewFaction, 1)
AmeliaRef.AddPerk(Crew_Ship_Piloting)
AmeliaRef.AddPerk(Crew_Ship_Piloting)
AmeliaRef.AddPerk(Crew_RifleCertification)
AmeliaRef.AddPerk(Crew_RifleCertification)
Crew_Elite_CanHireAmelia.Mod(1)
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

;BEGIN FRAGMENT Fragment_Stage_0050_Item_01
Function Fragment_Stage_0050_Item_01()
;BEGIN CODE
FactionSharedCrimeList_AmeliaOnly.AddForm(CrimeFactionCrucible)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartBackstoryTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
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

ReferenceAlias Property Amelia Auto Const

Faction Property PotentialCrewFaction Auto Const

Quest Property MS02 Auto Const

Perk Property CREW_Ship_Piloting Auto Const

Perk Property Crew_RifleCertification Auto Const

GlobalVariable Property Crew_Elite_CanHireAmelia Auto Const

FormList Property FactionSharedCrimeList_AmeliaOnly Auto Const Mandatory

Faction Property CrimeFactionCrucible Auto Const Mandatory
