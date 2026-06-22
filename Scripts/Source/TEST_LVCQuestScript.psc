Scriptname TEST_LVCQuestScript extends Quest

ReferenceAlias Property DistanceTestMarker Mandatory Const Auto
{Marker used for the multiple distance tests}

WwiseEvent Property WwiseEvent_AMBArtifactPuzzleRingA_Success Mandatory Const Auto
{Sounds used for the furthest distance event}

WwiseEvent Property WwiseEvent_AMBArtifactPuzzleRingB_Success Mandatory Const Auto
{Sounds used for the middle distance event}

WwiseEvent Property WwiseEvent_AMBArtifactPuzzleRingC_Success Mandatory Const Auto
{Sounds used for the closest distance event}

InputEnableLayer Property TestEnableLayer Auto
{Enable player used for testing}

Function RegisterForDistanceTestEvents()
    ObjectReference myRef = DistanceTestMarker.GetRef()
    ObjectReference PlayerRef = Game.GetPlayer()

    RegisterForDistanceLessThanEvent(PlayerRef, myRef, 20.0, 0)
    RegisterForDistanceLessThanEvent(PlayerRef, myRef, 15.0, 1)
    RegisterForDistanceLessThanEvent(PlayerRef, myRef, 10.0, 2)
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance, int aiEventID)
    ObjectReference myRef = DistanceTestMarker.GetRef()
    if akObj1 == myRef || akObj2 == myRef
        if aiEventID == 0
            WwiseEvent_AMBArtifactPuzzleRingA_Success.Play(myRef)
        elseif aiEventID == 1
            WwiseEvent_AMBArtifactPuzzleRingB_Success.Play(myRef)
        elseif aiEventID == 2
            WwiseEvent_AMBArtifactPuzzleRingC_Success.Play(myRef)
        endif
    endif
EndEvent

Function DEBUGPrintBiomeActorBase(Actor akTargetCreature)
    ActorBase TargetBase
    ;TargetBase = akTargetCreature.GetMatchingPlanetActorBase()
    trace(self, "Actor: " + akTargetCreature + " has a base of: " + TargetBase)
EndFunction   

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "TESTLVC",  string SubLogName = "ScanPercentages", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction