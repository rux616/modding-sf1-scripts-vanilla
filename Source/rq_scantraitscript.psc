Scriptname rq_scantraitscript extends RQScript

Group Scan_Properties
	SQ_ParentScript property SQ_Parent auto const Mandatory

    int Property ObjectiveToDisplayForScanning = 500 Const Auto
    { Objective for scanning }
    
    int Property StageToSetOnCompletelyScanned = 600 Const Auto
    { Stage to set when scanning target base object's GetPercentageKnown() >= 1 }

    GlobalVariable Property PercentageScannedTextDisplay Mandatory Const Auto
    { Quest instance global to use to display percentage in quest objective }

    ReferenceAlias Property TargetMapMarker Mandatory Const Auto
    { target location map marker - use to get planet trait from location }

    ReferenceAlias Property Trait Mandatory Const Auto
    { used for text replacement for trait name }

    LocationAlias Property Alias_Planet Mandatory Const Auto
    { planet location }

    GlobalVariable property CreditsRewardRadiantQuestLarge const mandatory Auto
    { base value for quest reward }

    GlobalVariable property RQ_ScanQuestReward const mandatory Auto
    { actual value for quest reward - modified by number of trait overlays needed to discover trait }

	float property RewardTraitOverlayMult = 500.0 auto const
	{ multiplier based on total number of overlays needed to be explored for this trait }
endGroup

SQ_ParentScript:PlanetTraitData targetTraitData ; initialized to planet trait data for target trait keyword

Function QuestStartedSpecific()
    Trace(self, "QuestStartedSpecific()")

    if InitializeScanTarget()
        RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerScannedObject")
        ; register for trait event
        RegisterForCustomEvent(SQ_Parent, "SQ_PlanetTraitDiscovered")
        RegisterForCustomEvent(SQ_Parent, "SQ_PlanetTraitUpdated")
    Else
        Trace(self, "QuestStartedSpecific() - no scan target found, shutting down.")
        Shutdown()
    endif
EndFunction

; override on child script
bool Function InitializeScanTarget()
    Trace(self, "InitializeScanTarget() ")
    bool foundTrait = false
    ; find keyword from target location and use that as the trait target
    ObjectReference targetRef = TargetMapMarker.GetRef()
	; get planet trait data
	SQ_ParentScript:PlanetTraitData theData = SQ_Parent.GetPlanetTraitData(targetRef)
    if theData
        targetTraitData = theData
        if targetRef.GetCurrentPlanet().IsTraitKnown(targetTraitData.PlanetTrait) == false
            foundTrait = true
            ; fill Trait with ref
            Trait.ForceRefTo(targetTraitData.TraitNameMarker)
            ; get current status
			; surveying bonus
			int surveyingBonus = Game.GetPlayer().GetValueInt(SQ_Parent.SurveyingTraitBonus)
			; reduce required count by bonus, but never below 1
			int discoverCountRequiredActual = Math.Max(1, targetTraitData.discoverCountRequired - surveyingBonus) as int
            Location planetLocation = Alias_Planet.GetLocation()
			int discoverCountCurrent = (planetLocation.GetValue(targetTraitData.PlanetTraitAV) as int)

            UpdateScanPercentage(discoverCountCurrent, discoverCountRequiredActual)
            ; update reward
       		float reward = CreditsRewardRadiantQuestLarge.GetValue() + targetTraitData.discoverCountRequired*RewardTraitOverlayMult
            RQ_ScanQuestReward.SetValueInt(reward as int)
        endif
    endif
    return foundTrait
EndFunction

Event SQ_ParentScript.SQ_PlanetTraitDiscovered(SQ_ParentScript akSender, Var[] akArgs)
	Planet traitPlanet = akArgs[0] as Planet
    Keyword discoveredTrait = akArgs[1] as Keyword
	Trace(self, " SQ_PlanetTraitDiscovered event received for " + traitPlanet + " keyword =" + discoveredTrait)
    if IsMatchingDiscoveryEvent(discoveredTrait)
        ; target planet - quest complete
        SetStage(StageToSetOnCompletelyScanned)
    endif
EndEvent


Event SQ_ParentScript.SQ_PlanetTraitUpdated(SQ_ParentScript akSender, Var[] akArgs)
	Planet traitPlanet = akArgs[0] as Planet
    Keyword discoveredTrait = akArgs[1] as Keyword
    if IsMatchingDiscoveryEvent(discoveredTrait)
        int discoverCountCurrent = akArgs[2] as int
        int discoverCountRequired = akArgs[3] as int
    	Trace(self, " SQ_PlanetTraitUpdated event received for trait " + discoveredTrait + " discoverCountCurrent=" + discoverCountCurrent + ", discoverCountRequired=" + discoverCountRequired)
        UpdateScanPercentage(discoverCountCurrent, discoverCountRequired)
    endif
endEvent

bool function IsMatchingDiscoveryEvent(keyword discoveredTrait)
    bool isMatching = false
    if discoveredTrait == targetTraitData.PlanetTrait
        Trace(self, " IsMatchingDiscoveryEvent: matching trait keyword " + discoveredTrait)
        ObjectReference targetRef = TargetMapMarker.GetRef()
        Actor playerRef = Game.GetPlayer()
        Planet currentPlanet = playerRef.GetCurrentPlanet()
        Planet targetPlanet = targetRef.GetCurrentPlanet()
        Trace(self, " IsMatchingDiscoveryEvent: currentPlanet=" + currentPlanet + " targetPlanet=" + targetPlanet)
        isMatching = (currentPlanet == targetPlanet)
    endif
    return isMatching
endFunction

function UpdateScanPercentage(float discoverCountCurrent, float discoverCountRequired)
        float percentageKnown = discoverCountCurrent/discoverCountRequired
        Trace(self, "UpdateScanPercentage: percentageKnown=" + percentageKnown)

        ;update text display global
        int precentAsInt = (percentageKnown * 100) as int
        PercentageScannedTextDisplay.SetValue(precentAsInt)
        UpdateCurrentInstanceGlobal(PercentageScannedTextDisplay)

EndFunction


