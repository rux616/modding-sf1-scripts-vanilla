Scriptname TrapExplodingBase extends TrapBase
{base script for traps that explode when they take damage}

group TrapExplodingData
    Explosion Property TrapExplosion Mandatory Const Auto

    ;AV Health Values to Track
    ActorValue Property Stim_Health_Piercing Mandatory Const Auto
    ActorValue Property Stim_Health_Flame Mandatory Const Auto
    ActorValue Property Stim_Health_Freezing Mandatory Const Auto
    ActorValue Property Stim_Health_Energy Mandatory Const Auto

    ;Tweakable Data
    float Property DamageThresholdPiercing = 100.0 Auto
    float Property DamageThresholdFlame = 100.0 Auto
    float Property DamageThresholdCryo = 100.0 Auto
    float Property DamageThresholdEnergy = 100.0 Auto

    float Property FreezeHealthMult = 1.5 const Auto
    { health multiplier on flame and piercing damage when frozen }
EndGroup

Function HandleOnLoad()
    ;Register for different damage types that the tank responds to at the start. (Add other damage types soon)
    ;All the health AVs have to be on the tank itself, because of the Secondary Damage List.
    if bDisarmed == false
        ObjectReference tank = GetLinkedRef()
        RegisterForActorValueLessThanEvent(tank, Stim_Health_Piercing, DamageThresholdPiercing)
        RegisterForActorValueLessThanEvent(tank, Stim_Health_Flame, DamageThresholdFlame)
        RegisterForActorValueLessThanEvent(tank, Stim_Health_Freezing, DamageThresholdCryo)
        RegisterForActorValueLessThanEvent(tank, Stim_Health_Energy, DamageThresholdEnergy)
    endif
EndFunction

Function HandleOnUnload()
    ObjectReference tank = GetLinkedRef()
    UnregisterForAllEvents()
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    debug.trace(self + " OnActorValueLessThan " + akActorValue)
    ;This catches all the various damage types and their thresholds.
    if(akActorValue == Stim_Health_Freezing)
        if(GetLinkedRef().GetValue(Stim_Health_Freezing) <= DamageThresholdCryo)
            ExceedFreezeDamage()
        EndIf
    elseif(akActorValue == Stim_Health_Piercing)
        if(GetLinkedRef().GetValue(Stim_Health_Piercing) <= DamageThresholdPiercing)
            ExceedPiercingDamage()
        EndIf
    elseif(akActorValue == Stim_Health_Flame)
        if((GetLinkedRef().GetValue(Stim_Health_Flame) <= DamageThresholdFlame))
            ExceedFlameDamage()
        EndIf
    elseif(akActorValue == Stim_Health_Energy)
        if((GetLinkedRef().GetValue(Stim_Health_Energy) <= DamageThresholdEnergy))
            ExceedEnergyDamage()
        EndIf
    EndIf
EndEvent

Function ExceedPiercingDamage()
    debug.trace(self + " ExceedPiercingDamage")
    Explode()
EndFunction

Function ExceedFlameDamage()
    debug.trace(self + " ExceedFlameDamage")
    Explode()
EndFunction

Function ExceedEnergyDamage()
    debug.trace(self + " ExceedEnergyDamage")
    Explode()
EndFunction

Function ExceedFreezeDamage()
    debug.trace(self + " ExceedFreezeDamage")

    ;Set piercing and fire health to x FreezeHealthMult due to being frozen.
    ;Re-register for AV less than event.
    ObjectReference myLinkedRef = GetLinkedRef()
    if myLinkedRef
        myLinkedRef.SetValue(Stim_Health_Piercing, FreezeHealthMult*myLinkedRef.GetBaseValue(Stim_Health_Piercing))
        myLinkedRef.SetValue(Stim_Health_Flame, FreezeHealthMult*myLinkedRef.GetBaseValue(Stim_Health_Flame))
        RegisterForActorValueLessThanEvent(myLinkedRef, Stim_Health_Piercing, DamageThresholdPiercing)
        RegisterForActorValueLessThanEvent(myLinkedRef, Stim_Health_Flame, DamageThresholdFlame)
    endif
EndFunction

Function Explode()
    GotoState("Unloaded")
    Disarm() ; parent function
    debug.trace(self + " Explode")
    ObjectReference myLinkedRef = GetLinkedRef()
    if myLinkedRef
        ;Make an explosion and disable tank
        myLinkedRef.PlaceAtMe(TrapExplosion)
        myLinkedRef.DisableNoWait()
    endif
EndFunction

