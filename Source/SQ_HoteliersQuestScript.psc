Scriptname SQ_HoteliersQuestScript extends Quest
ReferenceAlias Property PrimaryAliasHotelier Mandatory Const Auto
RefCollectionAlias Property RentedBeds Mandatory Const Auto
int Property VisitRoomObjective = 1  Const Auto

;Scene Phase Functions:
Function SetRoomPrices()
    Trace(self, "SetRoomPrices() PrimaryAliasHotelier.GetActorReference(): " + PrimaryAliasHotelier.GetActorReference())
    SQ_HoteliersActorScript hotelierActor = PrimaryAliasHotelier.GetActorReference() as SQ_HoteliersActorScript
    Trace(self, "SetRoomPrices() hotelierActor: " + hotelierActor)
    hotelierActor.SetPrices()
EndFunction

Function RentedRoomDaily()
    Trace(self, "RentedRoomDaily() ")
    SQ_HoteliersActorScript hotelierActor = PrimaryAliasHotelier.GetActorReference() as SQ_HoteliersActorScript
    Trace(self, "RentedRoomDaily() hotelierActor: " + hotelierActor)
    hotelierActor.RentRoomDaily()
EndFunction

Function RentedRoomWeekly()
    Trace(self, "RentedRoomWeekly()")
    SQ_HoteliersActorScript hotelierActor = PrimaryAliasHotelier.GetActorReference() as SQ_HoteliersActorScript
    Trace(self, "RentedRoomDaily() hotelierActor: " + hotelierActor)
    hotelierActor.RentRoomWeekly()
EndFunction

;called by SQ_HotelierTriggerScript extends ObjectReference Const
Function UpdateBedsAliasAndObjective(ObjectReference BedRef, SQ_HoteliersActorScript HotelierRef)
    if BedRef == None
        Warning(self, "UpdateBedsAliasAndObjective() BedRef is none! BAILING!")
        return
    endif

    if HotelierRef.IsRoomRented()
      Trace(self, "UpdateBedsAliasAndObjective() room is rented! BedRef: " + BedRef)
        RentedBeds.AddRef(BedRef)
        BedRef.SetActorOwner(Game.GetPlayer().GetBaseObject() as ActorBase)
        SetObjectiveDisplayed(VisitRoomObjective)
    else 
        Trace(self, "UpdateBedsAliasAndObjective() room NOT rented. BedRef: " + BedRef)
        BedRef.SetActorOwner(HotelierRef.GetBaseObject() as ActorBase)
        RentedBeds.RemoveRef(BedRef)
        if RentedBeds.GetCount() == 0 
            SetObjectiveDisplayed(VisitRoomObjective, false)
            Trace(self, "UpdateBedsAliasAndObjective() turning off objective")
        endif
    endif
EndFunction


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Hoteliers",  string SubLogName = "SQ_HotelierQuestScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Hoteliers",  string SubLogName = "SQ_HotelierQuestScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction