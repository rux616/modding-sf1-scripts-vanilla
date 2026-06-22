Scriptname MissionHuntQuestScript extends MissionQuestScript

group MissionTypeData
	ReferenceAlias Property MapMarker Auto Const Mandatory
	{ map marker of target location }
endGroup

; override parent function
Function MissionAccepted(bool bAccepted)
    if bAccepted
		; add map marker to map
        ObjectReference mapMarkerRef = MapMarker.GetRef()
        if mapMarkerRef
            mapMarkerRef.AddToMapScanned()
        endif
    endif
    Parent.MissionAccepted(bAccepted)
EndFunction



