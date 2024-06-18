Scriptname CreateCrewOnDockQuestScript extends Quest

RefCollectionAlias property CrewCollection auto const
{ collection of crew actors }

ReferenceAlias[] property CrewMarkers auto const
{ array of marker aliases for all crew }

ReferenceAlias[] property CrewAliases auto const
{ array of ref aliases for individual crew actors }

ActorValue property SpaceshipCrew auto const
{ tracks number of crew on a ship }

ReferenceAlias property Ship auto const

ReferenceAlias property PilotChair auto const

Event OnQuestStarted()
	ObjectReference shipRef = Ship.GetRef()
	; register for undocking so we can shut down quest
	RegisterForRemoteEvent(shipRef as SpaceshipReference, "OnShipUndock")
    int crewValue = shipRef.GetValue(SpaceshipCrew) as int
    ; decrement - we always spawn pilot
    crewValue += -1
    debug.trace(self + "shipRef=" + shipRef + " crewValue=" + crewValue)
    int i = 0
    while i < crewValue && i < CrewCollection.GetCount()
	    debug.trace(self + " i=" + i)
    	; enable this crewman
    	Actor theCrew = CrewCollection.GetAt(i) as Actor
	    debug.trace(self + " i=" + i + ": enabling " + theCrew)
    	; move to marker
    	if i < CrewMarkers.Length
    		ObjectReference theMarker = CrewMarkers[i].GetRef()
    		if theMarker
    			theCrew.MoveTo(theMarker)
                CrewAliases[i].ForceRefTo(theCrew)
    		endif
    	endif
    	theCrew.Enable()
    	i += 1
    EndWhile

    ObjectReference pilotChairRef = PilotChair.GetRef()
    if pilotChairRef
        ; block activation - so terminal is needed to clear (very likely TEMP)
        pilotChairRef.BlockActivation(abBlocked = true, abHideActivateText = false)
    endif
EndEvent

Event SpaceshipReference.OnShipUndock(SpaceshipReference akSource, bool abComplete, SpaceshipReference akUndocking, SpaceshipReference akParent)
	debug.trace(self + " OnShipUndock akSource=" + akSource)
	Stop()
endEvent

function testShip()
    ObjectReference shipRef = Ship.GetRef()
    debug.trace(self + " shipRef=" + shipref)
endFunction

