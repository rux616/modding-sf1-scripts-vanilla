Scriptname SQ_TreasureMap_CreateMapScript extends Quest
{script to place and clean up treasure map into a container}

ReferenceAlias Property MapContainer Mandatory Const Auto
{ put the treasure map in this }

LocationAlias property MapLocation auto const Mandatory
{ watch for player to leave this location - shut down quest and remove treasure map }

Form property TreasureMap auto const mandatory
{ treasure map to place - usually a leveled list }

Keyword property LocTypeSettlement auto const mandatory
{ used to get settlement parent location, if any }

; variables
ObjectReference treasureMapRef

Location locationToCheck ; when player leaves this location, shut down quest

Event OnQuestStarted()
    debug.trace(self + "OnQuestStarted")

    ObjectReference containerRef = MapContainer.GetRef()

    ; create treasure map
    treasureMapRef = containerRef.PlaceAtMe(TreasureMap)
    ; move into vendor container
    containerRef.AddItem(treasureMapRef)

    ; is this in a settlement?
    locationToCheck = MapLocation.GetLocation()

    Location[] settlementLocations = locationToCheck.GetParentLocations(LocTypeSettlement)
    if settlementLocations.Length > 0
        locationToCheck = settlementLocations[0]
    EndIf

    debug.trace(self + " locationToCheck=" + locationToCheck)

    ; register for events
    RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
    RegisterForRemoteEvent(treasureMapRef, "OnContainerChanged")
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	debug.trace(self + "OnLocationChange() akSender: " + akSender + ", akOldLoc: " + akOldLoc + ", akNewLoc: " + akNewLoc)
	if akSender == Game.GetPlayer() && akOldLoc == locationToCheck && (akNewLoc == NONE || akNewLoc.IsSameLocation(akOldLoc, LocTypeSettlement) == false)
        Stop()
	endif
EndEvent

Event ObjectReference.OnContainerChanged(ObjectReference akSource, ObjectReference akNewContainer, ObjectReference akOldContainer)
    debug.trace(self + " OnContainerChanged akSource=" + akSource + " akNewContainer=" + akNewContainer)
    if akSource == treasureMapRef
        ; treasure map moved out of container - shut down quest
        Stop()
    endif
endEvent

Event OnQuestShutdown()
    ; clean up treasure map
    ObjectReference containerRef = MapContainer.GetRef()
    if treasureMapRef && containerRef
        containerRef.RemoveItem(treasureMapRef)
    endif
EndEvent
