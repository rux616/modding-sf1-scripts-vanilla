Scriptname DefaultSurveyTraitQuestScript extends Quest Default
{default script to set a stage when planet traits are surveyed}

struct PlanetTraitData
	keyword PlanetTrait
    bool traitFound = false 
    int StageToSet = -1 ; (optional) stage to set when this planet trait is surveyed
    int ObjectiveToUpdate = -1 ; (optional) objective to update when trait events are received (using the GlobalVariables)
    GlobalVariable discoverCountCurrent ; (optional) global to update when the trait events are received
    GlobalVariable discoverCountRequired ; (optional) global to update when the trait events are received
endStruct

PlanetTraitData[] property PlanetTraits auto const
{ planet traits this quest is looking for in target system }

SQ_ParentScript property SQ_Parent auto const Mandatory
{ autofill }

LocationAlias Property TargetPlanetLocation Auto Const
{ autofill - optional - planet where player is surveying traits 
    If this is not filled in, surveying a trait on any planet in the target system will qualify }

LocationAlias Property TargetSystemLocation Auto Const
{ autofill - system location where player is looking for planet traits }

Keyword property LocTypeMajorOrbital auto const Mandatory
{ autofill - used to check if something is a planet or moon }

Keyword property LocTypeStarSystem auto const Mandatory

int property PlanetTraitsCompleteStage = -1 auto Const
{ optional - stage to set when all planet traits have been surveyed }

Event OnQuestInit()
	; register for trait events
	RegisterForCustomEvent(SQ_Parent, "SQ_PlanetTraitDiscovered")
	RegisterForCustomEvent(SQ_Parent, "SQ_PlanetTraitUpdated")
endEvent

Event SQ_ParentScript.SQ_PlanetTraitDiscovered(SQ_ParentScript akSender, Var[] akArgs)
    HandlePlanetTraitEvent(akArgs, true)
EndEvent

Event SQ_ParentScript.SQ_PlanetTraitUpdated(SQ_ParentScript akSender, Var[] akArgs)
    HandlePlanetTraitEvent(akArgs, false)
EndEvent

function HandlePlanetTraitEvent(Var[] akArgs, bool isDiscoveredEvent)
	Planet traitPlanet = akArgs[0] as Planet
    Keyword discoveredTrait = akArgs[1] as Keyword
    int discoverCountCurrent = akArgs[2] as int
    int discoverCountRequired = akArgs[3] as int
    if isDiscoveredEvent
	    debug.trace(self + " SQ_PlanetTraitDiscovered event received for " + traitPlanet + " keyword =" + discoveredTrait + " discoverCountCurrent=" + discoverCountCurrent + " discoverCountRequired="+ discoverCountRequired)
    Else
	    debug.trace(self + " SQ_PlanetTraitUpdated event received for " + traitPlanet + " keyword =" + discoveredTrait + " discoverCountCurrent=" + discoverCountCurrent + " discoverCountRequired="+ discoverCountRequired)
    EndIf


	Planet currentPlanet = Game.GetPlayer().GetCurrentPlanet()
	debug.trace(self + " HandlePlanetTraitEvent currentPlanet=" + currentPlanet)

    ; is current planet in target system (and target planet, if any)?
    Actor playerRef = Game.GetPlayer()
    Location currentLocation = playerRef.GetCurrentLocation()
    if currentLocation.IsSameLocation(TargetSystemLocation.GetLocation(), LocTypeStarSystem) && ( TargetPlanetLocation == NONE || currentLocation.IsSameLocation(TargetPlanetLocation.GetLocation(), LocTypeStarSystem))
        debug.trace(self + " planet is in target system and/or planet, check for traits")
        int i = 0
        int traitsFoundCount = 0
        while i < PlanetTraits.Length
            PlanetTraitData theTraitData = PlanetTraits[i]
            debug.trace(self + "   check for keyword " + theTraitData.PlanetTrait + ": " + currentPlanet.HasKeyword(theTraitData.PlanetTrait))
            if discoveredTrait == theTraitData.PlanetTrait && theTraitData.traitFound == false
                if theTraitData.ObjectiveToUpdate > -1
                    ; update globals
                    if theTraitData.discoverCountCurrent
                        theTraitData.discoverCountCurrent.SetValue(discoverCountCurrent)
                        UpdateCurrentInstanceGlobal(theTraitData.discoverCountCurrent)
                    EndIf
                    if theTraitData.discoverCountRequired
                        theTraitData.discoverCountRequired.SetValue(discoverCountRequired)
                        UpdateCurrentInstanceGlobal(theTraitData.discoverCountRequired)
                    EndIf
                    SetObjectiveDisplayed(theTraitData.ObjectiveToUpdate)
                EndIf

                if isDiscoveredEvent
                    theTraitData.traitFound = true
                    if theTraitData.StageToSet > -1
                        setStage(theTraitData.StageToSet)
                    endif
                endif
            endif
            if theTraitData.traitFound
                traitsFoundCount += 1
            endif
            i += 1
        EndWhile

        ; have all traits been found?
        if traitsFoundCount >= PlanetTraits.Length
            if GetStageDone(PlanetTraitsCompleteStage) == false
                SetStage(PlanetTraitsCompleteStage)
                UnregisterForCustomEvent(SQ_Parent, "SQ_PlanetTraitDiscovered")
                UnregisterForCustomEvent(SQ_Parent, "SQ_PlanetTraitUpdated")
            endif
        endif
    endif
EndFunction

