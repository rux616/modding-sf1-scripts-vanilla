Scriptname ENV_Audio_SealedEnvEffectScript extends ActiveMagicEffect

Group Properties
string Property StateGroup = "State_PlayerInAtmosphere" Const Auto
string Property EffectStartState = "Yes" Const Auto
{this is sent when player enters a sealed environment}
string Property EffectEndState = "No" Const Auto 
{this is sent when player leaves a sealed environment}
EndGroup

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    Trace(self, "OnEffectStart() StateGroup: " + StateGroup + ",  EffectStartState: " +  EffectStartState)
    WwiseEvent.SetGlobalState(StateGroup, EffectStartState)
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    Trace(self, "OnEffectFinish() StateGroup: " + StateGroup + ",  EffectEndState: " +  EffectEndState)
    WwiseEvent.SetGlobalState(StateGroup, EffectEndState)
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "ENV_Audio_SealedEnvEffectScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "ENV_Audio_SealedEnvEffectScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
    return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction