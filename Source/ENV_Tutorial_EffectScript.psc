Scriptname ENV_Tutorial_EffectScript extends ActiveMagicEffect

Group Autofill
    SQ_Env_TutorialQuestScript Property SQ_ENV_Tutorial Mandatory Const Auto
EndGroup

keyword Property TutorialEffectKeyword Mandatory Const Auto
{***IMPORTANT!!!***
This keyword must ALSO be in the effect's keyword list!
***

filter for: ENV_TutorialEffect_*}

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    Trace(self, "OnEffectStart() akBaseEffect: " + akBaseEffect)

    SQ_ENV_Tutorial.ShowEffectScriptHelpMessage(TutorialEffectKeyword)
EndEvent


;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "Tutorials", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "Tutorials", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction