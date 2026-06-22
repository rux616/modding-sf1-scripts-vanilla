Scriptname CompanionAffinityScript extends Actor

Struct AngerEvent
	AffinityEvent EventCausingAnger
	GlobalVariable AngerLevel
	{filter for: COM_AngerLevel}
	GlobalVariable AngerReason
	{filter for: COM_AngerReason}
EndStruct

Group Autofill
SQ_CompanionsScript Property SQ_Companions Mandatory Const Auto
EndGroup

Group Properties
	AngerEvent[] Property AngerEventData Mandatory Const Auto
EndGroup

COM_CompanionQuestScript COM_CompanionQuest ;pointer to main companion quest for this actor

Event OnInit()
	Trace(self, "OnInit()")

	COM_CompanionQuest = ((self as Actor) as CompanionActorScript).COM_CompanionQuest
EndEvent

Event OnAffinityEvent(AffinityEvent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
	Trace(self, "OnAffinityEvent() akAffinityEvent: " + akAffinityEvent + ", akActorValue: " + akActorValue + ", akReactionValue: " + akReactionValue)
	Trace(self, "OnAffinityEvent() GetValue(COM_Affinity):" + GetValue(SQ_Companions.COM_Affinity))

	;is it something that makes the companion angry?
	AngerEvent[] angerTriggeringEvents = AngerEventData.GetAllMatchingStructs("EventCausingAnger", akAffinityEvent)
	
	if angerTriggeringEvents.Length > 0
		AngerEvent angerTriggeringEvent = angerTriggeringEvents[0] ;there should only be one
		Trace(self, "OnAffinityEvent() angerTriggeringEvent: " + angerTriggeringEvent)
		COM_CompanionQuest.SetAngerLevel(angerTriggeringEvent.AngerLevel, angerTriggeringEvent.AngerReason)
	endif

	SQ_Companions.SQ_Traits.HandleAffinityEvent(self, akAffinityEvent = akAffinityEvent, akActorValue = akActorValue, akReactionValue = akReactionValue, akTarget = akTarget)

EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "CompanionAffinity", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "CompanionAffinity", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction