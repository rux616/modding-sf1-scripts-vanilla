Scriptname UC07_NiiraScrapperSlateScript extends ObjectReference Const

ObjectReference[] Property MarkersToAdd Mandatory Const Auto
{Give the player all the map markers in and around 1-Of-A-Kind}

GlobalVariable Property UC07_PlayerKnowsAllMechyardMarkers Mandatory Const Auto
{Global used to shut down this loop so we're not processing it after the player
has all the markers}

Event OnRead()

    if UC07_PlayerKnowsAllMechyardMarkers.GetValue() < 1
        int i = 0
        int iLength = MarkersToAdd.Length

        while i < iLength
            ObjectReference currMarker = MarkersToAdd[i]

            if !currMarker.IsMapMarkerVisible()
                currMarker.AddToMapScanned()
            endif

            i += 1
        endwhile

        UC07_PlayerKnowsAllMechyardMarkers.SetValue(1)
    endif

EndEvent