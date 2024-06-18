Scriptname MissionDestinationFinderScript extends Quest

MissionParentScript Property MissionParent Auto Const Mandatory
{ mission parent quest }

Keyword property LocTypeMajorOrbital auto const mandatory

Keyword property MissionBoardReserved auto const mandatory
{ used to tag "reserved" mission board refs }

LocationAlias Property SourcePlanet Auto Const Mandatory
{ source planet location }

LocationAlias[] Property DestinationLocations Auto Const Mandatory
{ array of destination locations }

RefCollectionAlias[] property DestinationRefCollections auto const Mandatory
{ array of collections holding destination ref }

; use SourceCollection to find matching destination ref and location (which will be filled into the passed in aliases)
bool function FindMatchingDestination(MissionParentScript:MissionLocRefType[] cargoTypes, RefCollectionAlias SourceCollection, ReferenceAlias SourceAlias, ReferenceAlias DestinationAlias, LocationAlias DestinationLocationAlias)
    bool foundValidDestination = false

	; create list of base objects from source collection
	Form[] sourceMarkers = new Form[0]
	int j = 0
	while j < SourceCollection.GetCount()
        ObjectReference sourceRef = SourceCollection.GetAt(j)
        if sourceRef.HasKeyword(MissionBoardReserved) == false
		    sourceMarkers.Add(sourceRef.GetBaseObject())
        Else
            debug.trace(self + " sourceMarker " + sourceRef + " is in use by another mission")
        endif
		j += 1
	EndWhile
	debug.trace(self + " sourceMarkers=" + sourceMarkers)

    int i = cargoTypes.Length - 1
    while i > -1
		; remove cargo types that don't match anything in source array
		if sourceMarkers.Find(cargoTypes[i].cargoSourceBase) < 0
           	debug.trace(self + " " + i + ": Removing invalid type " + cargoTypes[i])
    		cargoTypes.Remove(i)
		Else
		   	debug.trace(self + " valid type " + i)
    	endif
    	i -= 1
    EndWhile
   	debug.trace(self + " Valid types " + cargoTypes)

    if cargoTypes.Length > 0
        ; put all the destination refs into an array
        ObjectReference[] destinationRefs = new ObjectReference[0]
        Form[] destinationMarkers = new Form[0]
        Location sourcePlanetLocation = SourcePlanet.GetLocation()
       	debug.trace(self + " sourcePlanetLocation=" + sourcePlanetLocation)
        i = 0
        while i < DestinationLocations.Length
            Location theLocation = DestinationLocations[i].GetLocation()
           	debug.trace(self + " destination location " + i + ": " + theLocation)

            if theLocation && theLocation.IsSameLocation(sourcePlanetLocation, LocTypeMajorOrbital) == 0
                RefCollectionAlias theCollection = DestinationRefCollections[i]
                if theLocation && theCollection.GetCount() > 0
                    int k = 0
                    while k < theCollection.GetCount()
                        destinationRefs.Add(theCollection.GetAt(k))
                        k += 1
                    endWhile
                endif
            Else
                debug.trace(self + " skipping " + theLocation + " - same planet as " + sourcePlanetLocation)
            endif
            i += 1
        EndWhile
        debug.trace(self + " destinationRefs=" + destinationRefs)

        ; now create list of destination markers
        j = 0
        while j < destinationRefs.Length
            ObjectReference destinationRef = destinationRefs[j]
            if destinationRef.HasKeyword(MissionBoardReserved) == false
                destinationMarkers.Add(destinationRef.GetBaseObject())
            Else
                debug.trace(self + " destination marker " + destinationRef + " is in use by another mission")
            endif
            j += 1
        EndWhile
        debug.trace(self + " destinationMarkers=" + destinationMarkers)

        ; loop through destination markers and find any matches with valid cargo types
        i = destinationMarkers.Length - 1
        while i > -1
            ; if destinationMarker is not in cargoTypes, remove
            int cargoTypesIndex = cargoTypes.FindStruct("cargoDestinationBase", destinationMarkers[i])
            if cargoTypesIndex < 0
                debug.trace(self + " removing invalid destination marker " + destinationMarkers[i])
                ; invalid cargo type - remove from refs array
                destinationRefs.Remove(i)
                destinationMarkers.Remove(i)
            endif
            i -= 1
        endWhile
        ; anything left?
        if destinationMarkers.Length > 0
            debug.trace(self + " picking destination ref from " + destinationRefs.Length + " options: destinationMarkers=" + destinationMarkers)
            ; temp - list destination markers and locations
            DebugShowDestinationMarkers(destinationRefs)

            ; pick one at random
            int destinationRefIndex = Utility.RandomInt(0, destinationRefs.Length-1)
            debug.trace(self + "   destinationRefIndex=" + destinationRefIndex)
            ObjectReference destinationRef = destinationRefs[destinationRefIndex]
            debug.trace(self + " picked destinationRef=" + destinationRef)

            ; find which location collection it's in
            if destinationRef
                i = 0
                Location destinationLocation
                while i < DestinationRefCollections.Length && destinationLocation == NONE
                    if DestinationRefCollections[i].Find(destinationRef) > -1
                        destinationLocation = DestinationLocations[i].GetLocation()
                    endif
                    i += 1
                EndWhile
                if destinationRef && destinationLocation
                    foundValidDestination = true
                    ; put into alias
                    DestinationAlias.ForceRefTo(destinationRef)
                    DestinationLocationAlias.ForceLocationTo(destinationLocation)

                    ; now work backwards to find matching source
                    Form destinationMarker = destinationMarkers[destinationRefIndex]
                    int cargoTypeIndex = cargoTypes.FindStruct("cargoDestinationBase", destinationMarker)
                    int sourceIndex = sourceMarkers.Find(cargoTypes[cargoTypeIndex].cargoSourceBase)
                    debug.trace(self + " find matching source ref: ")
                    debug.trace(self + "     destinationMarker=" + destinationMarker)
                    debug.trace(self + "     cargoTypeIndex=" + cargoTypeIndex)
                    debug.trace(self + "     cargoTypes[cargoTypeIndex]=" + cargoTypes[cargoTypeIndex])
                    debug.trace(self + "     sourceIndex=" + sourceIndex)
                    debug.trace(self + "     SourceCollection.GetAt(sourceIndex)=" + SourceCollection.GetAt(sourceIndex))
                    debug.trace(self + "     sourceMarkers[sourceIndex]=" + sourceMarkers[sourceIndex])
                    ; need to find matching index in SourceCollection
                    Form sourceMarker = sourceMarkers[sourceIndex]
                    j = 0
                    ObjectReference sourceRef
                    while j < SourceCollection.GetCount() && sourceRef == NONE
                        ObjectReference collectionRef = SourceCollection.GetAt(j)
                        if collectionRef.GetBaseObject() == sourceMarker
                            sourceRef = collectionRef
                        endif
                        j += 1
                    EndWhile
                    debug.trace(self + " found sourceRef: " + sourceRef)
                    if sourceRef
                        SourceAlias.ForceRefTo(sourceRef)
                    endif
                Else
                    debug.trace(self + " no destinationLocation")
                endif
            Else
                debug.trace(self + " no destinationRef")
            endif
        Else
            debug.trace(self + " no valid destination markers")
        endif
    endif
    return foundValidDestination
endFunction

function DebugShowDestinationMarkers(ObjectReference[] destinationRefs)
    debug.trace(self + " DebugShowDestinationMarkers:")
    int i = 0
    while i < destinationRefs.Length
        ObjectReference theRef = destinationRefs[i]
        debug.trace(self + "   " + i + ": " + theRef + " in " + theRef.GetCurrentLocation() + " on " + theRef.GetCurrentPlanet())
        i += 1
    EndWhile
EndFunction