Scriptname COM_IncrementFlirtTopicScript extends TopicInfo
{Increments a companion's COM_FlirtCount actorvalu
***IMPORTANT!!!*** Attach to the line a companion responds with after the player choses an "Flirt" dialogue choice.
This only works on an info in which the SPEAKER is a companion}

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
	CompanionActorScript companionRef = akSpeakerRef as CompanionActorScript
	if companionRef
		Trace(self, "OnBegin() calling IncrementFlirtCount() companionRef: " + companionRef)
		companionRef.SQ_Companions.IncrementFlirtCount(companionRef)
	else
		Warning(self, "OnBegin() could NOT cast akSpeakerRef as a CompanionActorScript!!!! akSpeakerRef: " + akSpeakerRef)
	endIf
EndEvent


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "Companions",  string SubLogName = "IncrementFlirtTopic", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "Companions",  string SubLogName = "IncrementFlirtTopic", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction