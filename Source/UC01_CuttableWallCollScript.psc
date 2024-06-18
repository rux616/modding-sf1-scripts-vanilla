Scriptname UC01_CuttableWallCollScript extends RefCollectionAlias

int Property TargetDestructionState = 1 Const Auto
{If the object has switched to this state, disable its linked ref}

int Property StageToSet = 345 Const Auto
{Once this collection has been emptied, set this stage}

Event OnDestructionStageChanged(ObjectReference akSenderRef, int aiOldStage, int aiCurrentStage)
trace(self, "Sender Ref: " + akSenderRef + " . Old Destruction Stage: " + aiOldStage + ". New Dest Stage: " + aiCurrentStage + ". Target Stage: " + TargetDestructionState)
    if aiCurrentStage == TargetDestructionState
        RemoveRef(akSenderRef)

        if GetCount() <= 0
            GetOwningQuest().SetStage(StageToSet)
        endif
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction