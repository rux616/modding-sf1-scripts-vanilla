Scriptname UC07_BatteryContainerCollScript extends RefCollectionAlias

Keyword Property UC07_BatteryComponent Mandatory Const Auto
{Keyword used to designate this is one of the quest item battery components}

int Property PrereqStage = 105 Auto Const
{Prereq stage used to know it's okay to start tracking container changed events}

Event OnQuickContainerOpened(ObjectReference akSenderRef)
    trace(self, "Quick Container event received. Sending container: " + akSenderRef)
    if GetOwningQuest().GetStageDone(PrereqStage)
        if akSenderRef.GetItemCount(UC07_BatteryComponent) <= 0
            trace(self, "Quick Container opened. Old container: " + akSenderRef + " has no more quest items in it. Pull it from the list.")
            RemoveRef(akSenderRef)
        endif
    endif
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    if GetOwningQuest().GetStageDone(PrereqStage)
        if akSenderRef.GetItemCount(UC07_BatteryComponent) <= 0
            trace(self, "OnActivate: Old container: " + akSenderRef + " has no more quest items in it. Pull it from the list.")
            RemoveRef(akSenderRef)
        endif
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC07", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction