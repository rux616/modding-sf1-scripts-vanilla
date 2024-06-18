Scriptname UC03_AliasMoveRefOnUnload extends ReferenceAlias

int Property PrereqStage01 = 500 Const Auto
{Don't attempt to move the NPC until this stage has been set}

int Property ShutdownStage01 = 505 Const Auto
{Once this teleport has happened, set this stage so it doesn't happen again}

ObjectReference Property TeleportMarker01 Mandatory Const Auto
{The marker to which the ref should be teleported once she unloads}

int Property PrereqStage02 = 100 Const Auto
{Don't attempt to move the NPC until this stage has been set}

int Property ShutdownStage02 = 105 Const Auto
{Once this teleport has happened, set this stage so it doesn't happen again}

ObjectReference Property TeleportMarker02 Mandatory Const Auto
{The marker to which the ref should be teleported once she unloads}

int Property PrereqStage03 = 350 Const Auto
{Don't attempt to move the NPC until this stage has been set}

int Property ShutdownStage03 = 355 Const Auto
{Once this teleport has happened, set this stage so it doesn't happen again}

ObjectReference Property TeleportMarker03 Mandatory Const Auto
{The marker to which the ref should be teleported once she unloads}

Event OnUnload()
    trace(self, "Ref unloaded.")
    ObjectReference myRef = GetRef()
    Quest OQ = GetOwningQuest()
    if !OQ.GetStageDone(ShutdownStage01) && OQ.GetStageDone(PrereqStage01)
        trace(self, "Loading Hadrian from the Cabinet Chambers to the MAST station.")
        OQ.SetStage(ShutdownStage01)
        myRef.MoveTo(TeleportMarker01)
    elseif !OQ.GetStageDone(ShutdownStage02) && OQ.GetStageDone(PrereqStage02)
        trace(self, "Loading Hadrian from Mars to outside MAST.")
        OQ.SetStage(ShutdownStage02)
        myRef.MoveTo(TeleportMarker02)
    elseif !OQ.GetStageDone(ShutdownStage03) && OQ.GetStageDone(PrereqStage03)
        trace(self, "Loading Hadrian from outside MAST to the Cabinet Chambers.")
        OQ.SetStage(ShutdownStage03)
        myRef.MoveTo(TeleportMarker03)
    EndIf
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC04", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction