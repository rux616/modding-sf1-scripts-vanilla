Scriptname UC07_HeatleechCollAliasScript extends RefCollectionAlias

Keyword Property DMP_AmbushMarker Mandatory Const Auto
{Keyword linking the leeches to their furnitures}

int Property ShutdownStage = 440 Const Auto
{Once this stage has been set, don't worry about this anymore}

Event OnLoad(ObjectReference akSenderRef)
    Actor currACT = akSenderRef as Actor
    trace(self, "OnLoad Actor: " + currAct)

    if !GetOwningQuest().GetStageDone(ShutdownStage) && currAct && currACT.IsEnabled() && !currACT.IsDead()
        ObjectReference currFurn = currAct.GetLinkedRef(DMP_AmbushMarker)
        currAct.SnapintoInteraction(currFurn)
        trace(self, "CurrAct: " + currAct + " snapping into furniture: " + currFurn)
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC07", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction