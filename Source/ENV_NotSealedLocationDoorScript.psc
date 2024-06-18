Scriptname ENV_NotSealedLocationDoorScript extends ObjectReference Const
{Script checks planet for oxygen atmosphere and if not found, applies the ENV_Loc_NotSealedEnvironment keyword to the location}

Group Autofill
    Keyword Property ENV_Loc_NotSealedEnvironment Mandatory Const Auto
    ConditionForm Property ENV_CND_NotSealedLocationDoorScript_BreathableAtmosphere Mandatory Const Auto
EndGroup

Event OnLoad()
    if ENV_CND_NotSealedLocationDoorScript_BreathableAtmosphere.IsTrue(self)
        Trace(self, "Onload() ENV_CND_NotSealedLocationDoorScript_BreathableAtmosphere is true, leaving location as sealed.")

    else
        location doorLocation = GetCurrentLocation()
        Trace(self, "OnLoad() ENV_CND_NotSealedLocationDoorScript_BreathableAtmosphere is false, adding ENV_Loc_NotSealedEnvironment keyword to doorLocation: " + doorLocation)

        doorLocation.AddKeyword(ENV_Loc_NotSealedEnvironment)
    endif
EndEvent


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "NotSealedLocationDoor", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "NotSealedLocationDoor", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction