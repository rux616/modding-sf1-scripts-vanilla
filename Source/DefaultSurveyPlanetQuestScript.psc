Scriptname DefaultSurveyPlanetQuestScript extends Quest Default
{script to set a stage when a specified planet has been surveyed}

ReferenceAlias Property PlayerShip Auto Const Mandatory
{ should point to SQ_PlayerShip, PlayerShip alias }

LocationAlias Property TargetSystemLocation Auto Const

LocationAlias Property TargetPlanetLocation Auto Const

Keyword property LocTypeMajorOrbital auto const Mandatory
{ used to check if something is a planet or moon }

int property SurveyCompleteStage = -1 auto Const Mandatory
{ stage to set when planet survey is complete }

Event OnQuestInit()
	; register for survey events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerPlanetSurveyComplete")
endEvent

Event Actor.OnPlayerPlanetSurveyComplete(Actor akSource, Planet akPlanet)
	; get player ship current location
	SpaceshipReference playershipRef = PlayerShip.GetShipRef()
    Location currentLocation = playershipRef.GetCurrentLocation()

	debug.trace(self + " OnPlayerPlanetSurveyComplete akPlanet=" + akPlanet + " currentLocation=" + currentLocation)

    if currentLocation.IsSameLocation(TargetPlanetLocation.GetLocation(), LocTypeMajorOrbital) && GetStageDone(SurveyCompleteStage) == false
		SetStage(SurveyCompleteStage)
        UnregisterForRemoteEvent(Game.GetPlayer(), "OnPlayerPlanetSurveyComplete")
	endif
EndEvent