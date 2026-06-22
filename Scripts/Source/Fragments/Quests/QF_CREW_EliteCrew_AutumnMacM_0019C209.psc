;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_AutumnMacM_0019C209 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Autumn is not enabled by default and needs to be enabled
Autumn.GetActorRef().Enable()

;Set stage on FC08 and stop it just to be safe
FC08.SetStage(1000)
FC08.Stop()

;SetStage on this quest to make Autumn recruitable and already hired
SetStage(1)
SetStage(50)

;Move Autumn to the player, make her the active follower, and remind her about her AI package
(Autumn.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Autumn.GetActorRef().EvaluatePackage()
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
;phase to make Autumn recruitable as Crew
;set via fragment on FC09 stage 900

Autumn.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
Autumn.GetActorRef().AddPerk(Crew_PistolCertification)
Autumn.GetActorRef().AddPerk(Crew_PistolCertification)
Autumn.GetActorRef().AddPerk(Crew_Botany)
Autumn.GetActorRef().AddPerk(Crew_Sharpshooting)
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
;make sure the player can access the time-locked TL by setting stage 800
;when they make a decision about telling Autumn to report

SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0700_Item_00
Function Fragment_Stage_0700_Item_00()
;BEGIN CODE
;make sure the player can access the time-locked TL by setting stage 800
;when they make a decision about telling Autumn to report

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

;BEGIN FRAGMENT Fragment_Stage_0900_Item_00
Function Fragment_Stage_0900_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
SetStage(450)
kmyQuest.StartBackstoryTimer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Autumn Auto Const

Faction Property PotentialCrewFaction Auto Const

Quest Property FC08 Auto Const

Perk Property Crew_PistolCertification Auto Const

Perk Property Crew_Botany Auto Const

Perk Property Crew_Ship_Payloads Auto Const

Perk Property Crew_Sharpshooting Auto Const Mandatory
