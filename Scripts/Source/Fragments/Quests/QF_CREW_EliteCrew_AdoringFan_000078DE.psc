;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_CREW_EliteCrew_AdoringFan_000078DE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;SetStage on this quest to make Adoring Fan recruitable and already hired
TraitUnwantedHero.SetStage(75)
TraitUnwantedHero.SetStage(80)
TraitUnwantedHero.SetStage(5)

SetStage(1)
SetStage(50)

Actor FanRef = AdoringFan.GetActorRef()
;Move Adoring Fanto the player, make him the active follower, and remind him about his AI package
(FanRef as EliteCrewDebugScript).DebugMakeActiveEliteCrew()
FanRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;this stage runs on start for non-quest reward ECs
AdoringFan.GetActorRef().SetFactionRank(PotentialCrewFaction, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.DismissSceneEnded()

Actor FanRef = AdoringFan.GetActorRef()
FanRef.SetEssential(false)
SQ_Crew.SetRoleUnavailable(FanRef)
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
Actor FanRef = AdoringFan.GetActorRef()

kmyquest.SetCostMultAndUpdateCost(0.0)
kmyQuest.Recruited()
FanRef.SetProtected(false)
FanRef.SetEssential(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()

PlayerRef.AddItem(ToiletPaperRoll01Empty)
PlayerRef.AddItem(Credits, Trait_UH_FanClubFee.GetValueInt())
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

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
SetStage(550)
kmyQuest.StartBackstoryTimer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0650_Item_00
Function Fragment_Stage_0650_Item_00()
;BEGIN CODE
CREW_EliteCrew_AdoringFan_Kill01.Stop()
CREW_EliteCrew_AdoringFan_Kill02.Stop()
CREW_EliteCrew_AdoringFan_Kill03.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0666_Item_00
Function Fragment_Stage_0666_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
Trait_UH_WarningMessageEssentialEnd.ShowAsHelpMessage("", afDuration = 5, afInterval=0, aiMaxTimes=1)

kmyquest.DismissSceneEnded()
Actor FanRef = AdoringFan.GetActorRef()
FanRef.SetEssential(false)
FanRef.SetProtected(true)
FanRef.RemoveFromFaction(AvailableCrewFaction)
FanRef.RemoveFromFaction(CurrentCrewFaction)
FanRef.RemoveFromFaction(PotentialCrewFaction)
SQ_Crew.SetRoleInactive(ActorToUpdate=FanREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
DisembarkingCrew.RemoveRef(FanRef)
CrewGoingToOutposts.RemoveRef(FanRef)
DismissedCrew.RemoveRef(FanRef)
FanRef.SetValue(CrewReassignDisabled, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0667_Item_00
Function Fragment_Stage_0667_Item_00()
;BEGIN CODE
SetStage(9999)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_9999_Item_00
Function Fragment_Stage_9999_Item_00()
;BEGIN AUTOCAST TYPE Crew_EliteCrewQuestScript
Quest __temp = self as Quest
Crew_EliteCrewQuestScript kmyQuest = __temp as Crew_EliteCrewQuestScript
;END AUTOCAST
;BEGIN CODE
Trait_UH_WarningMessageEssentialEnd.ShowAsHelpMessage("", afDuration = 5, afInterval=0, aiMaxTimes=1)

kmyquest.DismissSceneEnded()
Actor FanRef = AdoringFan.GetActorRef()
FanRef.SetEssential(false)
FanRef.SetProtected(true)
FanRef.RemoveFromFaction(AvailableCrewFaction)
FanRef.RemoveFromFaction(CurrentCrewFaction)
FanRef.RemoveFromFaction(PotentialCrewFaction)
SQ_Crew.SetRoleInactive(ActorToUpdate=FanREF, DisplayMessageIfChanged=False, AlsoSetUnavailable=True, AlsoDisplayUnavailableMessage=False)
DisembarkingCrew.RemoveRef(FanRef)
CrewGoingToOutposts.RemoveRef(FanRef)
DismissedCrew.RemoveRef(FanRef)
FanRef.SetValue(CrewReassignDisabled, 1)
FanRef.SetCrimeFaction(CrimeFactionUC)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property AdoringFan Auto Const

Faction Property PotentialCrewFaction Auto Const

Message Property Trait_UH_WarningMessageEssentialEnd Auto Const Mandatory

Scene Property CREW_EliteCrew_AdoringFan_AttackedByPlayer Auto Const Mandatory

sq_crewscript Property SQ_Crew Auto Const Mandatory

Quest Property TraitUnwantedHero Auto Const Mandatory

GlobalVariable Property Trait_UH_FanClubFee Auto Const Mandatory

MiscObject Property Credits Auto Const Mandatory

MiscObject Property ToiletPaperRoll01Empty Auto Const Mandatory

Scene Property CREW_EliteCrew_AdoringFan_Kill01 Auto Const Mandatory

Scene Property CREW_EliteCrew_AdoringFan_Kill02 Auto Const Mandatory

Scene Property CREW_EliteCrew_AdoringFan_Kill03 Auto Const Mandatory

Faction Property AvailableCrewFaction Auto Const Mandatory

Faction Property CurrentCrewFaction Auto Const Mandatory

RefCollectionAlias Property DisembarkingCrew Auto Const Mandatory

RefCollectionAlias Property DismissedCrew Auto Const Mandatory

RefCollectionAlias Property CrewGoingToOutposts Auto Const Mandatory

ActorValue Property CrewReassignDisabled Auto Const Mandatory

Faction Property CrimeFactionUC Auto Const Mandatory
