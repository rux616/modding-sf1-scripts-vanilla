Scriptname MissionBountySpaceScript extends MissionQuestScript

group BountySpace
    RefCollectionAlias property Escorts auto const
    { optional - holds escorts to randomly enable }

    RefCollectionAlias property SpawnMarkers auto const
    { optional - holds spawn markers for escorts }

    ReferenceAlias property SpaceMapMarker auto Const Mandatory

    int property ArriveInSystemStage = 20 auto Const
    { stage that's set when the player arrives in target system }
EndGroup


Function MissionAccepted(bool bAccepted)
	Trace(Self, " MissionAccepted")
    Parent.MissionAccepted(bAccepted)

    if bAccepted
        ; enable target ship
        SpaceshipReference targetShip = PrimaryRef.GetShipRef()
        targetShip.Enable()
        
        ; enable map marker
        SpaceMapMarker.TryToEnableNoWait()

        ; enable escorts randomly, if any
        if Escorts && Escorts.GetCount() > 0
            Trace(Self, " rolling for number of escorts: 1 to " + Escorts.GetCount())
            int numToEnable = Utility.RandomInt(1, Escorts.GetCount())
            Trace(Self, " enabling " + numToEnable + " escorts")
            if numToEnable > 0
                ; spawn markers
                ObjectReference[] spawnMarkerArray = new ObjectReference[0]
                if SpawnMarkers
                    spawnMarkerArray = SpawnMarkers.GetArray()
                endif

                int i = 0
                while i < numToEnable
                    SpaceshipReference escortRef = Escorts.GetShipAt(i)
                    if escortRef
                        if spawnMarkerArray.Length > 0
                            ObjectReference spawnMarkerRef = spawnMarkerArray[0]
                            Trace(Self, " moving escort to spawn marker " + spawnMarkerRef)
                            escortRef.MoveTo(spawnMarkerRef)
                            spawnMarkerArray.Remove(0)
                        endif
                        escortRef.Enable()
                    endif
                    i += 1
                EndWhile
            EndIf
        endif
    endif
endFunction

Event OnStageSet(int auiStageID, int auiItemID)
     Trace(Self, " OnStageSet " + auiStageID)
    if auiStageID == ArriveInSystemStage
        ObjectReference mapMarkerRef = SpaceMapMarker.GetRef()
        Trace(Self, " OnStageSet " + ArriveInSystemStage + ": map marker is now always visible " + mapmarkerref)
        mapMarkerRef.SetMarkerUndiscoveredVisibility(0) ; map marker is now always visible
    elseif auiStageID == CompleteStage
        ObjectReference mapMarkerRef = SpaceMapMarker.GetRef()
        Trace(Self, " OnStageSet " + CompleteStage + ": disable map marker " + mapmarkerref)
        mapMarkerRef.Disable() ; disable map marker after target ship is destroyed
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Missions",  string SubLogName = "BountySpace", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Missions",  string SubLogName = "BountySpace", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction