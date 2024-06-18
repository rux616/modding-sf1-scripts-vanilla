Scriptname TestFossilHuntQuestScript extends Quest

Keyword Property LocTypeFossilTarget auto const mandatory
{ keyword on location we're looking for }

LocationAlias property FossilPlanetLocation auto const mandatory
{ planet we're looking for fossil on }

LocationAlias property FossilOverlayLocation auto const mandatory
{ overlay the player needs to enter to complete objective }

ReferenceAlias property PlayerShip auto const mandatory

int property FossilScanStage = 50 auto const

int property FossilCollectStage = 100 auto const

Event OnQuestInit()
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
    RegisterForRemoteEvent(PlayerShip, "OnShipScan")
endEvent

Event ReferenceAlias.OnShipScan(ReferenceAlias akSource, Location aPlanet, ObjectReference[] aMarkersArray)
    if aPlanet == FossilPlanetLocation.GetLocation()
        SetStage(FossilScanStage)
        UnregisterForRemoteEvent(PlayerShip, "OnShipScan")
    endif
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
    debug.trace(self + " OnLocationChange " + akSender)
	; watch for player to change location
	if akSender == Game.GetPlayer() || akSender == PlayerShip.GetRef()
        ; check location for keyword we're looking for
        if akNewLoc.HasKeyword(LocTypeFossilTarget) && FossilPlanetLocation.GetLocation().IsChild(akNewLoc) && akNewLoc == FossilOverlayLocation.GetLocation()
            SetStage(FossilCollectStage)
            UnregisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
        endif
	endif
EndEvent