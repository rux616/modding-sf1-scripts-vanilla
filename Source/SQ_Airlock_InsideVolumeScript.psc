Scriptname SQ_Airlock_InsideVolumeScript extends ObjectReference 
{script on trigger volumes that is placed inside exterior interiors
which puts calls a function that puts actors in an "inside" refcollection}

Group Autofill
    SQ_Airlock_QuestScript Property SQ_Airlock Mandatory Const Auto
EndGroup


Event OnLoad()
    Trace(self, "OnLoad() ")
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
    Trace(self, "OnTriggerEnter() akActionRef: " + akActionRef)
    ;if an actor finds their  way into this trigger volume, it means they are definitely inside.
    
    Actor triggeringActor = akActionRef as Actor

    if triggeringActor
        SQ_Airlock.SetActorInside(triggeringActor)
         ;NOTE: we are deliberately NOT considering them outside when they leave the trigger volume.
         ;That is handled specifically by trigger volume in the airlock doorway watching for them to leave the interior,
         ;and an alias script watching for their unloading. 
         ;By default NPCs are considered outside.
    else 
        Warning(self, "OnTriggerEnter() could not cast to an Actor: akActionRef: " + akActionRef)
    endif
   
EndEvent



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Airlock",  string SubLogName = "InsideVolumeScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Airlock",  string SubLogName = "InsideVolumeScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction