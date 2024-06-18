Scriptname ENV_AfflictionTreatmentEffectScript extends ActiveMagicEffect

SQ_ENV_AfflictionsScript Property SQ_ENV Mandatory Const Auto
{autofill}

Keyword Property TreatmentEffectKeyword Mandatory Const Auto
{filter for: ENV_EffectType_AFFL_Treatment_}

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    Trace(self, "OnEffectStart() TreatmentEffectKeyword: " + TreatmentEffectKeyword + ", afMagnitude: " + afMagnitude)
    
    int improvementLevels = Math.Max(afMagnitude, 1) as int ;improvement levels is 1 or the magnitude if greater than 1

    SQ_ENV.ImproveActiveAfflictions(TreatmentEffectKeyword, improvementLevels, true)
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "Afflictions", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "Afflictions", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction