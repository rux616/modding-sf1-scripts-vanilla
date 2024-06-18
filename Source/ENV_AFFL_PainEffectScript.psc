Scriptname ENV_AFFL_PainEffectScript extends ActiveMagicEffect
;note: this is only ever on the player, and only ever running singly

Group Properties
    ActorValue Property Oxygen Mandatory Const Auto
    {autofill}

    GlobalVariable Property ENV_AFFL_Symp_Pain_MaxOxygenDamage Mandatory Const Auto
    {autofill; multiply damage by this amount to derive how much to damage O2}

    GlobalVariable Property ENV_AFFL_Symp_Pain_MinOxygenDamage Mandatory Const Auto
    {autofill; min amount of O2 damage allowed}

    GlobalVariable Property ENV_AFFL_Symp_Pain_HealthToOxygenMult Mandatory Const Auto
    {autofill; max amount of O2 damage allowed}

    GlobalVariable Property ENV_AFFL_Symp_Pain_TimerDuration Mandatory Const Auto
    {autofill; duration of timer in seconds for cooldown of damage from pain}

    Spell Property SpellToCast Mandatory Const Auto
    {spell to cast when damaging O2 - this is for the watch warning "reminder" spell}
EndGroup

float HealthCached
ActorValue HealthAV
bool coolingDown = false
int CooldownTimerID = 1 Const

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    HealthAV = Game.GetHealthAV()
    healthCached = akTarget.GetValue(healthAV)
    RegisterForDamage(akTarget)
EndEvent

Event OnTimer(int aiTimerID)
    if aiTimerID == CooldownTimerID
        coolingDown = false
    endif
EndEvent

Function RegisterForDamage(ObjectReference TargetRef)
    if IsBoundGameObjectAvailable() && TargetRef
        RegisterForActorValueChangedEvent(TargetRef, healthAV) ;registering for change because I need to update the cached value if increased/restored
    endif
EndFunction

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
    if akObjRef
       
        float currentHealth = akObjRef.GetValue(healthAV)
        float change = healthCached - currentHealth
        healthCached = currentHealth

        if change > 0 && coolingDown == false
            float O2Dmg = Math.Clamp(change * ENV_AFFL_Symp_Pain_HealthToOxygenMult.GetValue(), ENV_AFFL_Symp_Pain_MinOxygenDamage.GetValue(), ENV_AFFL_Symp_Pain_MaxOxygenDamage.GetValue())
            Trace(self, "OnActorValueChanged() change: " + change + ", O2Dmg: " + O2Dmg)
            akObjRef.DamageValue(Oxygen, O2Dmg)
            SpellToCast.Cast(akObjRef, akObjRef)
            coolingDown = true
            StartTimer(ENV_AFFL_Symp_Pain_TimerDuration.GetValue(), CooldownTimerID)
        endif
        RegisterForDamage(akObjRef)
    endif
EndEvent

;************************************************************************************
;****************************	   CUSTOM TRACE LOG	    *****************************
;************************************************************************************
bool Function Trace(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 0, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "ENV_AFFL_PainEffectScript", bool bShowNormalTrace = false, bool bShowWarning = false, bool bPrefixTraceWithLogNames = true) DebugOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
endFunction

bool Function Warning(ScriptObject CallingObject, string asTextToPrint, int aiSeverity = 2, string MainLogName = "EnvironmentalGameplay",  string SubLogName = "ENV_AFFL_PainEffectScript", bool bShowNormalTrace = false, bool bShowWarning = true, bool bPrefixTraceWithLogNames = true) BetaOnly
	return debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName,  aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames)
EndFunction