Scriptname Home_SetStageOnUnlock_CollScript extends RefCollectionAlias

int Property CompletionStage = 1000 Const Auto
{Stage to set when any door to this home has been unlocked}

bool Property WatchForLockStateChange = true Const Auto
{If TRUE, this quest will complete when any of the home's doors unlock.
If FALSE, this quest will complete when any of the doors are activated by the player}

Event OnLockStateChanged(ObjectReference akSenderRef)
    trace(self, "Unlock state changed from door: " + akSenderRef + ". CurrentLockState: " + akSenderRef.GetLockLevel())
    if WatchForLockStateChange
        if !akSenderRef.IsLocked()
            GetOwningQuest().SetStage(CompletionStage)
        endif
    endif
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    if !WatchForLockStateChange
        if akActionRef == Game.GetPlayer()
            GetOwningQuest().SetStage(CompletionStage)
        endif
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Home",  string SubLogName = "DoorCollection", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction