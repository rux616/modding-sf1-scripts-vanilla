Scriptname SQ_HotelierTriggerScript extends ObjectReference Const
SQ_HoteliersQuestScript Property SQ_Hoteliers Mandatory Const Auto
{autofill}

Keyword Property SQ_Hoteliers_Bed_Link Mandatory Const Auto
{autofill; linkref type that links this room trigger volume to the bed.}

Keyword Property SQ_Hoteliers_Door_Link Mandatory Const Auto
{autofill; linkref type that links this room trigger volume to the door.}

Keyword Property SQ_Hoteliers_Trigger_Link Mandatory Const Auto
{autofill; keyword that links Hotelier NPC to the room trigger.}

float TimerDur = 3.0 const

Event OnTimer(int aiTimerID)
    Trace(self, "OnTimer() calling _SetDoorState() ")
    _SetDoorState()
EndEvent

Event OnLoad()
    Trace(self, "OnLoad()")
    Update()
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
    Trace(self, "OnTriggerEnter()")
    Update()
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
    Trace(self, "OnTriggerLeave()")
    Update()
EndEvent

Function Update()
    Trace(self, "Update() calling StartTimer() ")
    StartTimer(TimerDur)
EndFunction

SQ_HoteliersActorScript Function GetHotelierNPC()
       return GetRefsLinkedToMe(SQ_Hoteliers_Trigger_Link)[0] as SQ_HoteliersActorScript ;there should only ever be one.
EndFunction

Function _SetDoorState() private
    SQ_HoteliersActorScript hotelierRef = GetHotelierNPC()
    
    ObjectReference[] doorRefs = GetLinkedRefChain(SQ_Hoteliers_Door_Link)

    if hotelierRef == None
        Warning(self, "_SetDoorState() hotelierRef is none! BAILING!")
        return
    endif

    if doorRefs == None
        Warning(self, "_SetDoorState() doorRef is none! BAILING!")
        return
    endif

    bool isRoomRented = hotelierRef.IsRoomRented()

    int countInTrigger = GetTriggerObjectCount()

    int i = 0
    int iLength = doorRefs.length
    if isRoomRented == true || countInTrigger > 0 ;we don't want to lock any actors in here accidentally
        Trace(self, "_SetDoorState() unlocking door. isRoomRented: " + isRoomRented + ", countInTrigger: " + countInTrigger)
        While i < iLength
            doorRefs[i].Unlock()
            i += 1
        EndWhile
    else
        Trace(self, "_SetDoorState() locking door. isRoomRented: " + isRoomRented + ", countInTrigger: " + countInTrigger)
        

        While i < iLength
            DoorRefs[i].SetOpen(False)
            DoorRefs[i].SetLockLevel(255)
            DoorRefs[i].Lock()
            i += 1
        EndWhile
    endif

    ObjectReference bedRef = GetLinkedRef(SQ_Hoteliers_Bed_Link)
    SQ_Hoteliers.UpdateBedsAliasAndObjective(BedRef, HotelierRef)

EndFunction



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Hoteliers",  string SubLogName = "SQ_HotelierTriggerScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Hoteliers",  string SubLogName = "SQ_HotelierTriggerScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction