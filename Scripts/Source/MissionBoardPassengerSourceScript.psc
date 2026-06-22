Scriptname MissionBoardPassengerSourceScript extends ObjectReference Const

ActorBase Property Passenger Auto Const Mandatory
{base actor to use to create passengers }

int property PassengerCountMin = 2 auto const
int property PassengerCountMax = 3 auto const

float property MissionTimeMult = 1.0 auto const
{ set to increase/decrease amount of time for this quest }

int property ExtraRewardPerPassenger = 20 auto const
{ how much award per passenger? }

; create <PassengerCount> passengers at <PassengerMarker>, put in <PassengerCollection>
Function CreatePassengers(RefCollectionAlias PassengerCollection, ObjectReference PassengerMarker, int PassengerCount)
	Trace(Self, " CreatePassengers: passengerCount=" + passengerCount + ", PassengerMarker=" + PassengerMarker)
	int i = 0
	while i < PassengerCount
		ObjectReference passengerRef = PassengerMarker.PlaceAtMe(Passenger)
		Trace(Self, "    created " + passengerRef)
		PassengerCollection.AddRef(passengerRef)
		i += 1
	EndWhile
endFunction

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "SQ_Missions",  string SubLogName = "Passengers", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "SQ_Missions",  string SubLogName = "Passengers", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction