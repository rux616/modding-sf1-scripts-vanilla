Scriptname MissionSurveyTraitScript extends MissionQuestScript conditional

group MissionTypeData
	SQ_ParentScript property SQ_Parent auto const Mandatory

	keyword Property PlanetTrait Const Auto Mandatory
	{ planet trait this quest is looking for in target system }

	Keyword property MissionStoryKeywordGetAllPlanets auto const mandatory
	{ keyword to use to start this quest's "get all planets" quest }	

	ReferenceAlias property TraitCategory const auto mandatory
	{ holds trait category marker for text replacement }

	int property MissionAcceptTutorialID = 2 auto const
	{ tutorial ID when accepting this mission - see SQ_Parent.TutorialMessages }

	int property MissionLandTutorialID = 3 auto const
	{ tutorial ID when landing on the target planet - see SQ_Parent.TutorialMessages }

	GlobalVariable Property RewardXPAmountGlobalActual Auto Const Mandatory
	{The actual amount of XP we're going to reward the player with - possibly adjusted by specific mission factors }
EndGroup

Event OnQuestStarted()
	debug.trace(self + " OnQuestStarted")

	; register for trait event
	RegisterForCustomEvent(SQ_Parent, "SQ_PlanetTraitDiscovered")

	Parent.OnQuestStarted()
endEvent

Event SQ_ParentScript.SQ_PlanetTraitDiscovered(SQ_ParentScript akSender, Var[] akArgs)
	Planet traitPlanet = akArgs[0] as Planet
    Keyword discoveredTrait = akArgs[1] as Keyword
	debug.trace(self + " SQ_PlanetTraitDiscovered event received for " + traitPlanet + " keyword =" + discoveredTrait)

    ; is planet in target system?
    Location currentLocation = traitPlanet.GetLocation()
    if currentLocation.IsSameLocation(TargetSystemLocation.GetLocation(), MissionParent.LocTypeStarSystem)
        debug.trace(self + " planet is in target system, check for keyword " + PlanetTrait + ": " + (discoveredTrait == PlanetTrait))
		if discoveredTrait == PlanetTrait
            MissionComplete()
        endif
    endif

EndEvent

; override parent function
int Function GetActualReward()
	float reward = RewardAmountGlobal.GetValue()
	; increase reward for number of traits on target planet
	Planet targetPlanet = TargetPlanetLocation.GetLocation().GetCurrentPlanet()
	SQ_ParentScript:PlanetTraitData theTraitData = SQ_Parent.FindMatchingPlanetTraitForKeyword(PlanetTrait, targetPlanet)
	if theTraitData
		;reward = reward + theTraitData.discoverCountRequired*MissionParent.MissionBoardSurveyTraitRewardOverlayMult.GetValue()
		TraitCategory.ForceRefTo(theTraitData.TraitCategoryMarker)
	Else
		debug.trace(self + " GetActualReward: WARNING - no trait data found for keyword " + PlanetTrait + " on planet " + targetPlanet)
	endif
	; increase reward for number of planets with traits in target system
	MissionGetAllPlanetsScript getAllPlanetsQuest
	MissionGetAllPlanetsScript[] startedQuests = MissionStoryKeywordGetAllPlanets.SendStoryEventAndWait(akLoc = TargetPlanetLocation.GetLocation()) as MissionGetAllPlanetsScript[]
	debug.trace(self + " tried to start getAllPlanetsQuest - startedQuests=" + startedQuests)
	if startedQuests.Length > 0
		debug.trace(self + " getAllPlanetsQuest quest started...")
		getAllPlanetsQuest = startedQuests[0]
		int systemTraitValue = getAllPlanetsQuest.GetSystemTraitValue()
		float systemTraitReward = MissionParent.MissionBoardSurveyTraitSystemValueMult.GetValue()*systemTraitValue
		debug.trace(self + " systemTraitValue=" + systemTraitValue + " systemTraitReward=" + systemTraitReward)
		reward = reward + systemTraitReward
		getAllPlanetsQuest.Stop()

		; award XP based on systemTraitValue
		int i = 0
		GlobalVariable rewardXP = NONE
		while i < MissionParent.MissionBoardSurveyTraitXPRewards.Length && rewardXP == NONE
			MissionParentScript:MissionBoardSurveyTraitData theRewardData = MissionParent.MissionBoardSurveyTraitXPRewards[i]
			if systemTraitValue >= theRewardData.minTraitValue
				rewardXP = theRewardData.RewardXP
			endif
			i += 1
		endWhile
		debug.trace(self + " rewardXP=" + rewardXP)
		RewardXPAmountGlobalActual.SetValueInt(rewardXP.GetValueInt())
	endif

	debug.trace(self + "GetActualReward=" + reward)
	return reward as int
endFunction

; override parent function
Function MissionAccepted(bool bAccepted)
	Parent.MissionAccepted(bAccepted)
	if bAccepted
		SQ_Parent.ShowTutorialMessage(MissionAcceptTutorialID)
	endif
endFunction

; override parent function
Function HandlePlayerShipLanding()
	if PlayerAcceptedQuest
		Location targetSystem = TargetSystemLocation.GetLocation()
		Location currentLocation = PlayerShip.GetShipRef().GetCurrentLocation()
		debug.trace(self + " HandlePlayerShipLanding currentLocation=" + currentLocation + " targetSystem=" + targetSystem)
		if currentLocation.IsSameLocation(targetSystem, SQ_Parent.LocTypeStarSystem)
			; if you land in the target system, pop tutorial message
			SQ_Parent.ShowTutorialMessage(MissionLandTutorialID)
		endif
	endif
endFunction
