Scriptname UC07_EclipticOnCombatChangedScript extends RefCollectionAlias

int Property PrereqStage = 300 Const Auto
{This stage must be set before we start caring about these events}

int Property StagetoSet = 610 Const Auto
{Stage to set when the player or Kaiser aggro's these NPCs}

ReferenceAlias Property Kaiser Mandatory Const Auto

Event OnCombatListAdded(ObjectReference akSenderRef, Actor akTarget)
    trace(self, "CombatListAdded: Sender: " + akSenderRef + ". Target: " + akTarget)
    Quest OQ = GetOwningQuest()

    if OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(StagetoSet) && (akTarget == Game.GetPlayer() || akTarget == Kaiser.GetActorRef())
        trace(self, "Player aggro'd these NPCs. Release the beast!")
        OQ.SetStage(StageToSet)
    endif   
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC07", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction