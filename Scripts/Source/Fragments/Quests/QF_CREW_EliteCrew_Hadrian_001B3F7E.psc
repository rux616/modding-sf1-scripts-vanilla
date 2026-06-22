;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_Hadrian_001B3F7E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Set stage on DialogueRedDevilsHQ and stop it just to be safe
DialogueRedDevilsHQ.SetStage(120)

;SetStage on this quest to make Hadrian recruitable and already hired
SetStage(1)
SetStage(50)

;Move Hadrian to the player, make her the active follower, and remind her about her AI package
(Alias_Hadrian.GetActorRef() as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
Alias_Hadrian.GetActorRef().EvaluatePackage()
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
;make Hadrian recruitable as Crew
;set via fragment on DialogueRedDevilsHQ stage 120
Alias_Hadrian.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)

;Add hadrian's Elite Crew perks
;"BurnTolerance" is the Grounded skill
Alias_Hadrian.GetActorRef().AddPerk(Crew_BurnTolerance)
Alias_Hadrian.GetActorRef().AddPerk(Crew_PainTolerance)
Alias_Hadrian.GetActorRef().AddPerk(Crew_PainTolerance)
Alias_Hadrian.GetActorRef().AddPerk(Crew_Xenosociology)
kmyquest.SetCostMultAndUpdateCost(0.0)

;Add the "Sandbox while loitering" keyword to her
Alias_Hadrian.GetRef().AddKeyword(SQ_Followers_SandboxWhilePlayerLoiters_Allowed)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Close out the misc pointer to Hadrian
UCR04_MiscPointer.SetStage(1000)

;Add the "Sandbox while loitering" keyword to her if she didn't get it earlier
ObjectReference HadREF = Alias_Hadrian.GetRef()
if !HadREF.HasKeyword(SQ_Followers_SandboxWhilePlayerLoiters_Allowed)
  HadREF.AddKeyword(SQ_Followers_SandboxWhilePlayerLoiters_Allowed)
endif
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

;BEGIN FRAGMENT Fragment_Stage_0450_Item_00
Function Fragment_Stage_0450_Item_00()
;BEGIN CODE
SetStage(410)
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

Faction Property PotentialCrewFaction Auto Const Mandatory

ReferenceAlias Property Alias_Hadrian Auto Const Mandatory

Quest Property UCR04_MiscPointer Auto Const Mandatory

Quest Property DialogueRedDevilsHQ Auto Const

Perk Property Crew_BurnTolerance Auto Const

Perk Property Crew_PainTolerance Auto Const

Perk Property Crew_Xenosociology Auto Const

Keyword Property SQ_Followers_SandboxWhilePlayerLoiters_Allowed Auto Const Mandatory
