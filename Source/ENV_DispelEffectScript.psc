Scriptname ENV_DispelEffectScript extends ActiveMagicEffect

Spell[] Property SpellsToDispel Mandatory Const Auto

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
	Trace(self, "OnEffectStart() akTarget: " + akTarget)

	int i = 0
	While (i < SpellsToDispel.length)
		akTarget.DispelSpell(SpellsToDispel[i])
		i += 1
	EndWhile
EndEvent



;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "DispelEffectScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "DispelEffectScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction