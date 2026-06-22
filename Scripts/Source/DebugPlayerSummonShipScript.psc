Scriptname DebugPlayerSummonShipScript extends Actor Const

ObjectReference Property Frontier_ModularREF Mandatory Const Auto
Keyword Property SpaceshipEnabledLandingLink Mandatory Const Auto
Furniture Property ShipLandingMarker Mandatory Const Auto
SQ_PlayerShipScript property SQ_PlayerShip Mandatory Const Auto

Function DebugSummonShip()
	ObjectReference markerRef = PlaceAtMe(ShipLandingMarker)
	Frontier_ModularREF.MoveTo(markerRef)
	Frontier_ModularREF.setlinkedref(markerRef, SpaceshipEnabledLandingLink)
	Frontier_ModularREF.Enable()
	SQ_PlayerShip.ResetHomeShip(Frontier_ModularREF as SpaceshipReference)
EndFunction

function testGetDayLength()
	GetDayLength()
EndFunction

Event OnPlayerPlanetSurveyComplete(Planet akPlanet)
	debug.trace(self + " OnPlayerPlanetSurveyComplete " + akPlanet)
EndEvent

Event OnPlayerScannedObject(ObjectReference akScannedRef)
	debug.trace(self + " OnPlayerScannedObject " + akScannedRef)
endEvent

Event OnHomeShipSet(SpaceshipReference akShip, SpaceshipReference akPrevious)
	debug.trace(self + " OnHomeShipSet akShip=" + akShip + " akprevious=" + akPrevious)
EndEvent

Event OnPlayerAssaultActor(ObjectReference akVictim, Location akLocation, bool aeCrime )
	debug.trace(self + "OnPlayerAssaultActor akvictim=" + akVictim + " akLocation=" + akLocation + " aeCrime=" + aeCrime)
endEvent

Event OnPlayerArrested(ObjectReference akGuard, Location akLocation, int aeCrimeType )
	debug.trace(self + "OnPlayerArrested akGuard=" + akGuard + " akLocation=" + akLocation + " aeCrimeType=" + aeCrimeType)
endEvent

Event OnPlayerJail(ObjectReference akGuard, Form akFaction,  Location akLocation, int aeCrimeGold)
	debug.trace(self + "OnPlayerJail akGuard=" + akGuard + " akFaction=" + akFaction + " akLocation=" + akLocation + " aeCrimeGold=" + aeCrimeGold)
endEvent

Event OnPlayerPayFine(ObjectReference akGuard, Form akFaction, int aeCrimeGold)
	debug.trace(self + "OnPlayerPayFine akGuard=" + akGuard + " akFaction=" + akFaction + " aeCrimeGold=" + aeCrimeGold)
endEvent

Event OnPlayerTrespass(ObjectReference akVictim, Location akLocation, bool aeCrime)
	debug.trace(self + "OnPlayerTrespass akVictim=" + akVictim + " akLocation=" + akLocation + " aeCrime=" + aeCrime)
endEvent

Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, ResearchProject akProject)
	debug.trace(self + " OnPlayerCompleteResearch akProject=" + akProject)
EndEvent

Event OnPlayerCrimeGold(ObjectReference akVictim, Form akFaction, int aeCrimeGold, int aeCrimeType )
	debug.trace(self + " OnPlayerCrimeGold akVictim=" + akVictim + " akFaction=" + akFaction + " aeCrimeGold=" + aeCrimeGold + " aeCrimeType=" + aeCrimeType)
endEvent