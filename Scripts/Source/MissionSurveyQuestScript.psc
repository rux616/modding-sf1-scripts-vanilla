Scriptname MissionSurveyQuestScript extends MissionQuestScript conditional

group MissionTypeData
	SQ_ParentScript property SQ_Parent auto const Mandatory

	ReferenceAlias property PlanetTarget auto const mandatory
	{ target ref in planet orbit - used to get target Planet }

	float property RewardPlanetTraitMult = 1000.0 auto const
	{ multiplier based on total trait value on planet for total reward }

	float property RewardPlanetAbundanceMult = 1000.0 auto const
	{ multiplier based on total abundance value on planet for total reward }

    int property SurveyObjective = 10 auto const
    { objective for surveying }

	int property MissionAcceptTutorialID = 0 auto const
	{ tutorial ID when accepting this mission - see SQ_Parent.TutorialMessages }

	int property MissionLandTutorialID = 1 auto const
	{ tutorial ID when landing on the target planet - see SQ_Parent.TutorialMessages }

	GlobalVariable Property RewardXPAmountGlobalActual Auto Const Mandatory
	{The actual amount of XP we're going to reward the player with - possibly adjusted by specific mission factors }
EndGroup

float lastSurveyPercentage = 0.0 ; used to know when to update the global for the objective
int iCheckSurveyProgressTimerID = 1 Const
float fScanObjectTimeSeconds = 1.0 Const
float fCheckSurveyPollingTimeSeconds = 15.0 const

Planet targetPlanet ; set on quest init

Event OnQuestStarted()
	debug.trace(self + " OnQuestStarted")
	targetPlanet = PlanetTarget.GetRef().GetCurrentPlanet()
	; reset survey progress global
	MissionIntValue01.SetValue(0.0)
	UpdateCurrentInstanceGlobal(MissionIntValue01)
	Parent.OnQuestStarted()
endEvent

Event Actor.OnPlayerScannedObject(Actor akSource, ObjectReference akScannedRef)
	debug.trace(self + " OnPlayerScannedObject - run timer")
	StartTimer(fScanObjectTimeSeconds, iCheckSurveyProgressTimerID)
EndEvent

Event OnTimer(int aiTimerID)
	if aiTimerID == iCheckSurveyProgressTimerID
		CheckSurveyProgress()
	endif
EndEvent

function CheckSurveyProgress(bool restartTimer = true)
	Planet currentPlayerPlanet = Game.GetPlayer().GetCurrentPlanet()

	SpaceshipReference playershipRef = PlayerShip.GetShipRef()
	Planet currentShipPlanet = playershipRef.GetCurrentPlanet()

	debug.trace(self + " CheckSurveyProgress currentPlayerPlanet=" + currentPlayerPlanet + " currentShipPlanet=" + currentShipPlanet)

    if currentShipPlanet == targetPlanet || currentPlayerPlanet == targetPlanet
		UpdateSurveyPercent()
		if restartTimer && PlayerCompletedQuest == false
			StartTimer(fCheckSurveyPollingTimeSeconds, iCheckSurveyProgressTimerID)
		endif
	endif
EndFunction

Event Actor.OnPlayerPlanetSurveyComplete(Actor akSource, Planet akPlanet)
	; get player ship current planet
	SpaceshipReference playershipRef = PlayerShip.GetShipRef()
	Planet currentShipPlanet = playershipRef.GetCurrentPlanet()

	debug.trace(self + " OnPlayerPlanetSurveyComplete akPlanet=" + akPlanet + " currentShipPlanet=" + currentShipPlanet)

    if currentShipPlanet == targetPlanet
		MissionComplete()
	endif
EndEvent

; override parent function
int Function GetActualReward()
	float reward = RewardAmountGlobal.GetValue()
	; increase reward for number of traits on target planet
	int planetTraitValue = SQ_Parent.GetPlanetTraitValue(targetPlanet)
	float planetAbundanceValue = SQ_Parent.GetPlanetAbundanceValue(targetPlanet)

	int planetRewardValue = planetTraitValue + (planetAbundanceValue as int)
	; get XP for normal survey award
	SQ_ParentScript:PlanetSurveySlateData theData = SQ_Parent.GetSurveySlateData(planetRewardValue)
	int XPReward = MissionParent.MissionBoardSurveyXPRewardBase.GetValueInt()
	if theData
		XPReward += theData.RewardXP.GetValueInt()
	endif
	RewardXPAmountGlobalActual.SetValueInt(XPReward)

	reward = reward + planetTraitValue*RewardPlanetTraitMult + planetAbundanceValue*RewardPlanetAbundanceMult
	debug.trace(self + "GetActualReward=" + reward + " RewardXPAmountGlobalActual=" + XPReward)
	return reward as int
endFunction

; override parent function
Function MissionAccepted(bool bAccepted)
	Parent.MissionAccepted(bAccepted)
	if bAccepted
		SQ_Parent.ShowTutorialMessage(MissionAcceptTutorialID)
		; register for survey events
		RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerPlanetSurveyComplete")
		RegisterForRemoteEvent(PlayerShip, "OnShipScan")
		; initialize survey %
		UpdateSurveyPercent()
	endif
endFunction

; override parent function
Function HandlePlayerShipLanding()
	if PlayerAcceptedQuest
		; get current ship planet
		Planet currentShipPlanet = PlayerShip.GetShipRef().GetCurrentPlanet()
		debug.trace(self + " HandlePlayerShipLanding currentShipPlanet=" + currentShipPlanet + " targetPlanet=" + targetPlanet)
		; if you land in the target location, pop tutorial message
		if currentShipPlanet == targetPlanet
			SQ_Parent.ShowTutorialMessage(MissionLandTutorialID)
			RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerScannedObject")
			; start timer polling for change in survey progress (since there's not always an event for everything that changes it)
			StartTimer(fCheckSurveyPollingTimeSeconds, iCheckSurveyProgressTimerID)
		endif
	endif
endFunction

; override parent function
Function HandlePlayerShipTakeOff()
	; no need for this when not on a planet
	UnregisterForRemoteEvent(Game.GetPlayer(), "OnPlayerScannedObject")
	CancelTimer(iCheckSurveyProgressTimerID)
endFunction

Event ReferenceAlias.OnShipScan(ReferenceAlias akSource, Location aPlanet, ObjectReference[] aMarkersArray)
	Planet currentShipPlanet = PlayerShip.GetShipRef().GetCurrentPlanet()

	debug.trace(self + " OnShipScan aPlanet=" + aPlanet + " currentShipPlanet=" + currentShipPlanet)

    if currentShipPlanet == targetPlanet
		CheckSurveyProgress(false)
	endif
endEvent

function UpdateSurveyPercent()
	float currentSurveyPercentage = targetPlanet.GetSurveyPercent()
	debug.trace(self + " UpdateSurveyPercent currentSurveyPercentage=" + currentSurveyPercentage + " lastSurveyPercentage=" + lastSurveyPercentage)
	if currentSurveyPercentage > lastSurveyPercentage
		float modValue = ((currentSurveyPercentage - lastSurveyPercentage) * 100)
		lastSurveyPercentage = currentSurveyPercentage
		; update global for survey percentage
		ModObjectiveGlobal(modValue, MissionIntValue01, SurveyObjective, 100)
	endif
endFunction