Scriptname SQ_HoteliersActorScript extends Actor Const

Group Autofill
    Quest Property SQ_Hoteliers Mandatory Const Auto
    {autofill}

    Keyword Property SQ_Hoteliers_Trigger_Link Mandatory Const Auto
    {autofill; keyword that links Hotlier NPC to the room trigger.}

    Keyword Property SQ_Hoteliers_Door_Link Mandatory Const Auto
    {autofill; keyword that links room trigger to the room door(s).}
    
    Keyword Property SQ_Hoteliers_Bed_Link Mandatory Const Auto
    {autofill; keyword that links the room trigger to the bed(s).}

    GlobalVariable Property SQ_Hoteliers_RoomCost_Daily_TextReplacementValue Mandatory Const Auto
    {autofill}

    GlobalVariable Property SQ_Hoteliers_RoomCost_Weekly_TextReplacementValue Mandatory Const Auto
    {autofill}

    ActorValue Property SQ_Hoteliers_RoomExpiry Mandatory Const Auto
    {autofill}
EndGroup

Group AutofillOrSetSpecifically
    GlobalVariable Property SQ_Hoteliers_RoomCost_Daily Mandatory Const Auto
    {autofill for default, otherwise you can replace with your own global if you want a different cost - this is for a single day rental}

    GlobalVariable Property SQ_Hoteliers_RoomCost_Weekly Mandatory Const Auto
    {autofill for default, otherwise you can replace with your own global if you want a different cost - this is for a weekly rental}
EndGroup

Function SetPrices()
    Trace(self, "SetPrices() ")

	SQ_Hoteliers_RoomCost_Daily_TextReplacementValue.SetValue(SQ_Hoteliers_RoomCost_Daily.GetValue())
	SQ_Hoteliers.UpdateCurrentInstanceGlobal(SQ_Hoteliers_RoomCost_Daily_TextReplacementValue)

	SQ_Hoteliers_RoomCost_Weekly_TextReplacementValue.SetValue(SQ_Hoteliers_RoomCost_Weekly.GetValue())
	SQ_Hoteliers.UpdateCurrentInstanceGlobal(SQ_Hoteliers_RoomCost_Weekly_TextReplacementValue)
EndFunction

Function RentRoomDaily()
    Trace(self, "RentRoomDaily()")
    RentRoom(SQ_Hoteliers_RoomCost_Daily, 1)
EndFunction

Function RentRoomWeekly()
    Trace(self, "RentRoomWeekly()")
    RentRoom(SQ_Hoteliers_RoomCost_Weekly, 7)
EndFunction

Function RentRoom(GlobalVariable Cost, int Days)
    SQ_HotelierTriggerScript triggerRef = GetLinkedRef(SQ_Hoteliers_Trigger_Link) as SQ_HotelierTriggerScript

    ;player pays for:
    Game.GetPlayer().RemoveItem(Game.GetCredits(), Cost.GetValueInt())

    ;update the expiry day
    float expiryDay = Utility.ExpiryDay(Days, FutureStartDay = GetValue(SQ_Hoteliers_RoomExpiry))

    SetValue(SQ_Hoteliers_RoomExpiry, expiryDay)

    Trace(self, "RentRoom() triggerRef: " + triggerRef + ", Cost: " + Cost + ", Days: " + Days + ", expiryDay: " + expiryDay + ", GetCurrentGameTime(): " + Utility.GetCurrentGameTime() + ", ")

    triggerRef.Update()

    ;Check to see if multiple hotel room doors are hooked up. If so, start a timer to determine the end of the room rental.
    ObjectReference[] myDoorRefs = GetLinkedRef(SQ_Hoteliers_Trigger_Link).GetLinkedRefChain(SQ_Hoteliers_Door_Link)
    If myDoorRefs.Length > 1
        CancelTimerGameTime()
        float CurrentTime = Utility.GetCurrentGameTime()
        float TimeRemaining = expiryDay - CurrentTime
        StartTimerGameTime(Math.DaysAsHours(TimeRemaining))
    EndIf
    
    ;Check if the trigger is in the same cell as the Hotelier Actor. if not, update the aliases and objectives.
    If triggerRef != None
    ObjectReference myHotelierRef = Self as ObjectReference
        If triggerRef.GetParentCell() != myHotelierRef.GetParentCell()
            ObjectReference[] BedRefs = triggerRef.GetLinkedRefChain(SQ_Hoteliers_Bed_Link)
            (SQ_Hoteliers as SQ_HoteliersQuestScript).UpdateBedsAliasAndObjective(BedRefs[0], myHotelierRef as SQ_HoteliersActorScript)         
        EndIf
    EndIf
EndFunction


bool Function IsRoomRented()
    float AV = GetValue(SQ_Hoteliers_RoomExpiry)

    return AV > 0 && Utility.HasExpiryDayPassed(AV) == false
EndFunction


;When the Expiry Timer ends, it will update the doors accordingly. This will only happen if a Hotel has multiple doors.
Event OnTimerGameTime(int aiTimerID)
    If IsRoomRented() == false
        SQ_HotelierTriggerScript triggerRef = GetLinkedRef(SQ_Hoteliers_Trigger_Link) as SQ_HotelierTriggerScript
        triggerRef.Update()
    EndIf
EndEvent




;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Hoteliers",  string SubLogName = "SQ_HoteliersActorScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Hoteliers",  string SubLogName = "SQ_HoteliersActorScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction