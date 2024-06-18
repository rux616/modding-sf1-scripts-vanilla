Scriptname SQ_Airlock_DoorwayVolumeScript extends ObjectReference const
{script attached to trigger volume placed between airlock doors which it is linkedref to,
and watches for states of to add/remove actors to a refcollection managing their "inside" state}


Group Autofill 
    SQ_Airlock_QuestScript Property SQ_Airlock Mandatory Const Auto
    Keyword Property SQ_Airlock_Link_Door_Inside Mandatory Const Auto
    Keyword Property SQ_Airlock_Link_Door_Outside Mandatory Const Auto
EndGroup



Event OnLoad()
    ObjectReference InsideDoor = GetLinkedRef(SQ_Airlock_Link_Door_Inside)
    ObjectReference OutsideDoor = GetLinkedRef(SQ_Airlock_Link_Door_Outside)


    Trace(self, "OnLoad() Inside door:  InsideDoor: " + InsideDoor)
    Trace(self, "OnLoad() Outside door:  OutsideDoor: " + OutsideDoor)

    RegisterForRemoteEvent(InsideDoor, "OnClose")
    RegisterForRemoteEvent(OutsideDoor, "OnClose")

    ;make sure the outside door starts closed
    OutsideDoor.SetOpen(false)
EndEvent

Event OnUnload()
    Trace(self, "OnUnload() clearing variables and unregistering for events.")

    ;clear event reg so that refs aren't persisting unnecessarily
    UnregisterForAllEvents()
EndEvent

Event ObjectReference.OnClose(ObjectReference akSender, ObjectReference akActionRef)
    Trace(self, "OnClose() akSender: " + akSender + ", akActionRef: " + akActionRef)

    Actor[] actorsInTrigger = GetAllRefsInTrigger() as Actor[] ;none objects handled in other function


    ObjectReference InsideDoor = GetLinkedRef(SQ_Airlock_Link_Door_Inside)
    ObjectReference OutsideDoor = GetLinkedRef(SQ_Airlock_Link_Door_Outside)
    ;the doors are set up such that the inside door is not allowed to start opening until the outside door closes, and visa versa
    ;because i want to catch the moment that a door starts to open, since the player could zip through, I instead watch for the opposite door to close
    if akSender == OutsideDoor ;outside door has closed, inside door has started to open
        SQ_Airlock.SetActorsInside(actorsInTrigger, SetInside = true)
    elseif akSender == InsideDoor ;inside door has closed, outside door has started to open.
        SQ_Airlock.SetActorsInside(actorsInTrigger, SetInside = false)
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Airlock",  string SubLogName = "DoorwayVolumeScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Airlock",  string SubLogName = "DoorwayVolumeScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction