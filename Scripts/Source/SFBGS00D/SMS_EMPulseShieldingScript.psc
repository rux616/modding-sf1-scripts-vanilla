Scriptname SFBGS00D:SMS_EMPulseShieldingScript extends ActiveMagicEffect
{Script that manages the damage and effect for the EM Pulse Shielding equipment module.}

;Properties
Group AutofillProperties
    ActorValue Property ShieldHealth Mandatory Const Auto
    ActorValue Property ShieldMaxHealth Mandatory Const Auto
    Keyword Property IsEMPulseShielding Mandatory Const Auto
EndGroup

;Ungrouped Properties
ReferenceAlias Property PlayerShip Mandatory Const Auto
Activator Property PulseVFX Mandatory Const Auto

;Tuning Properties
Group TuningProperties
    float Property ShockwaveRange = 1500.0 Auto 
    float Property Damage = 10000.0 Auto
    float Property ShieldDamagePercent = 0.05 Auto
    float Property DelayTime = 5.0 Auto
    int Property RollChance = 10 Auto
EndGroup

;Non-Property Variables
SpaceshipReference ActiveShip
ObjectReference [] EMOD
bool IsInCombat = false
float CurrentShieldHealth 
float MaxShieldStrength
float DamageThreshold
int TimerID = 1

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, float afMagnitude, float afDuration)
    ;Fills non-property variables to be used later in the script
    ActiveShip = PlayerShip.GetShipRef()
    CurrentShieldHealth = ActiveShip.GetValue(ShieldHealth) as float
    MaxShieldStrength = ActiveShip.GetValue(ShieldMaxHealth) as float
    DamageThreshold = MaxShieldStrength * ShieldDamagePercent
    EMOD = ActiveShip.GetExteriorRefs(IsEMPulseShielding)
    Debug.Trace("EM Pulse EMOD Count: " + EMOD.Length)

    RegisterForRemoteEvent(ActiveShip, "OnCombatStateChanged")
EndEvent

Event SpaceshipReference.OnCombatStateChanged(SpaceshipReference akSender, ObjectReference akTarget, int aeCombatState)
    ;Sets the IsInCombat bool depending on if the playership is in combat
    
    If (aeCombatState == 1)
        IsInCombat = true
        Debug.Trace("Player Ship Is In Combat")

        RegisterForActorValueLessThanEvent(ActiveShip, ShieldHealth, DamageThreshold)
        Debug.Trace("Shield Health: " + CurrentShieldHealth + "Max Shield Health: " + MaxShieldStrength + "Damage Threshold: " + DamageThreshold)
    Else
        IsInCombat = false
        UnregisterForActorValueLessThanEvent(ActiveShip, ShieldHealth, DamageThreshold)
    EndIf
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    ;When the ShieldHealth value is less than the DamageThreshold value start timer
    If (IsInCombat == true)
        StartTimer(DelayTime, TimerID)
    EndIf    
EndEvent

Event OnTimer(int aiTimerID)
    
    If (IsInCombat == true && aiTimerID == TimerID)
        If (Game.GetDieRollSuccess(RollChance))
            Debug.Trace("EM Pulse Fired!")
            PlayPulseVFX()
            ApplyDamage()
        EndIf
        StartTimer(DelayTime, TimerID)
    EndIf
EndEvent

Function PlayPulseVFX()
    ;Plays VFX on each EMOD object in array
    int i = 0
    While (i < EMOD.Length)
        EMOD[i].PlaceAtMe(PulseVFX)
        debug.Trace("EMOD " + EMOD[i] + " has played VFX")
        i += 1
    EndWhile
EndFunction

Function ApplyDamage()
    ;Gets combat targets within the ShockwaveRange distance and applies damage to the enemy shields
    int i = 0
    SpaceshipReference [] EnemyTargets = ActiveShip.GetAllCombatTargets()

    While (i < EnemyTargets.Length)
        If (ActiveShip.GetDistance(EnemyTargets[i]) <= ShockwaveRange)
            EnemyTargets[i].DamageValue(ShieldHealth, Damage)
            Debug.Trace("EM Pulse - Damage Applied")
        EndIf
        i += 1
    EndWhile
EndFunction