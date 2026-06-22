;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_MoaraOtero_001A430D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage on MQ102 and stop it just to be safe
MQ102.SetStage(2000)
MQ102.Stop()

;SetStage on this quest to make Moara recruitable and already hired
SetStage(1)
SetStage(50)

;Move Moara to the player, make him the active follower, and remind him about his AI package
(Moara.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Moara.GetActorRef().EvaluatePackage()
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
;make Moara recruitable as Elite Crew
;set via fragment on MQ102 stage 2000
Actor MoaraRef = Moara.GetActorRef()

MoaraRef.SetFactionRank(PotentialCrewFaction, 1)
MoaraRef.AddPerk(Crew_Ship_Weapons_EM)
MoaraRef.AddPerk(Crew_Marksmanship)
MoaraRef.AddPerk(Crew_Ship_Weapons_EM)
MoaraRef.AddPerk(Crew_Marksmanship)
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

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN CODE
;also make time-locked TL available
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
;also make time-locked TL available
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
;also make time-locked TL available
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0800_Item_00
Function Fragment_Stage_0800_Item_00()
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

ReferenceAlias Property Moara Auto Const

Faction Property PotentialCrewFaction Auto Const

Quest Property MQ102 Auto Const

Perk Property CREW_Ship_Weapons_EM Auto Const

Perk Property Crew_Marksmanship Auto Const

Perk Property CREW_Ship_Weapons_Missile Auto Const
