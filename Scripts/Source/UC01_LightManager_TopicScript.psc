Scriptname UC01_LightManager_TopicScript extends TopicInfo

ReferenceAlias Property StarterLight Mandatory Const Auto
{Ref alias for the light that kicks off this show. }

bool Property TriggerLightOnBegin = true Const auto
{Do we trigger our light show when this topic begins or ends?}

bool Property ShutoffAllLights = false Const Auto
{If true, when this line completes, tell all the lights here to can it}

Event OnBegin(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    trace(self, "UC01: LightManager: On Begin.")
    if TriggerLightOnBegin
        trace(self, "UC01: Triggering timer for light: " + StarterLight.GetRef() as UC01_LightTimingRefScript)
        (StarterLight.GetRef() as UC01_LightTimingRefScript).TriggerLightUpdate()
    endif
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, bool abHasBeenSaid)
    trace(self, "UC01: LightManager: On End.")
    if ShutoffAllLights
        trace(self, "UC01: Triggering shutdown for light: " + StarterLight.GetRef() as UC01_LightTimingRefScript)
        (StarterLight.GetRef() as UC01_LightTimingRefScript).StartLightTimer(true)
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "UnitedColonies",  string SubLogName = "UC01", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction