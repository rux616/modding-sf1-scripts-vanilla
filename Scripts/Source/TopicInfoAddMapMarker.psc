Scriptname TopicInfoAddMapMarker extends TopicInfo

Group Required_Properties
    ObjectReference Property MapMarkerToAdd Mandatory Const Auto
    {The map marker we want to add to the player's map}
EndGroup

Group Optional_Properties
    bool Property AddOnEnd = true Const Auto
    {If true, add the map marker to the player's map once the line completes (OnEnd). If FALSE, add the marker OnBegin}

    bool Property AllowFastTravel = false Const Auto
    {If true, the player can immediately fast travel to this map marker}
EndGroup

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    if !AddOnEnd
        MapMarkerToAdd.AddToMapScanned(AllowFastTravel)
    endif
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    if AddOnEnd
        MapMarkerToAdd.AddToMapScanned(AllowFastTravel)
    endif
EndEvent