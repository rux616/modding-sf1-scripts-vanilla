Scriptname TestExplodingBarrelScript extends ObjectReference

;Keywords for LinkedRefs
Keyword Property LinkCustom01 Mandatory Const Auto
{keyword for linking the flame FX}

;Related Assets
Explosion Property Test_Fire_Sm_Explosion Mandatory Const Auto
Form Property TRP_Puddle_Flammable_01_Packin Mandatory Const Auto

;AV Health Values to Track
ActorValue Property Test_PiercingHealth Mandatory Const Auto
ActorValue Property Test_FireHealth Mandatory Const Auto
ActorValue Property Test_CryoHealth Mandatory Const Auto

;Tweakable Data
float Property DamageThreshold = 95.0 Const Auto
float Property MassiveDamageThreshold = 10.0 Const Auto
float Property FireDamagePerSecond = 20.0 Const Auto
float Property MassiveDamageTimeWindow = 1.0 Const Auto

;Track Active Effects
ObjectReference FireFX

;Change these to AVs?
bool barrelPunctured = false
bool onFire = false
bool isFrozen = false


;TIMER ID
; 10 - Massive Damage Timer
; 20 - Periodic Fire Damage

;ALL Resists should be set to 100, to avoid damaging the health of the barrel.

Event OnLoad()
    ObjectReference Barrel = GetLinkedRef()
    ; Register for different damage types that the barrel responds to at the start. (Add other damage types soon)
    ;All the health AVs have to be on the barrel itself, because of the Secondary Damage List.
    RegisterForActorValueLessThanEvent(Barrel, Test_PiercingHealth, DamageThreshold)
    RegisterForActorValueLessThanEvent(Barrel, Test_PiercingHealth, MassiveDamageThreshold)
    RegisterForActorValueLessThanEvent(GetLinkedRef(), Test_CryoHealth, MassiveDamageThreshold)
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
;This catches all the various damage types and their thresholds. Some of these events are only registered after certain requirements are met.

    ;Now Leaking, and vulnerable to fire/energy/electricity
    if(akActorValue == Test_PiercingHealth)
        ;Do not re-register
        if(!barrelPunctured)
            Puncture()
        EndIf
        ;Start  timer, check health for explosion, if no explosion, heal health.
        if(GetLinkedRef().GetValue(Test_PiercingHealth) <= MassiveDamageThreshold)
            Explode()
        Else
            StartTimer(massiveDamageTimeWindow, 10) ;This should restart the timer every time the barrel takes more damage.
            RegisterForActorValueLessThanEvent(GetLinkedRef(), Test_PiercingHealth, MassiveDamageThreshold)
        EndIf      
    EndIf
    if(akActorValue == Test_FireHealth)
        if((GetLinkedRef().GetValue(Test_FireHealth) <= MassiveDamageThreshold))
            Explode()
        ElseIf (!onFire)
            onFire = true
            CatchFire()
        EndIf
    EndIf
    if(akActorValue == Test_CryoHealth)
        Freeze()
    EndIf
EndEvent

Event OnTimer(int aiTimerID)
    if(aiTimerID == 10)
    ;This restores the value of piercing health, so that the barrel only explodes if it takes a lot of piercing damage over a short time.
        GetLinkedRef().RestoreValue(Test_PiercingHealth, 10) ;This could be set to regen in smaller amount, more slowly, so that continued fire with a pause can still cause explosion.
        StartTimer(massiveDamageTimeWindow, 10)
    EndIf
    if (aiTimerID == 20 && !isFrozen)
        GetLinkedRef().DamageValue(Test_FireHealth, (FireDamagePerSecond/2.0))
        if((GetLinkedRef().GetValue(Test_FireHealth) <= MassiveDamageThreshold))
            Explode()
        Else
            StartTimer(0.5, 20)
        EndIf
    EndIf
EndEvent

Function Explode()
    ;Eventually this should trigger a animated exploding thing on the barrel.EndFunction
    
    ;For now
    ;Make an Explosion
    GetLinkedRef().PlaceAtMe(Test_Fire_Sm_Explosion)
    ;Disable the barrel
    GetLinkedRef().GetLinkedRef(LinkCustom01).Disable()
    GetLinkedRef().Disable()
EndFunction

Function CatchFire()
    ;Damage over time.
    StartTimer(0.5, 20)
    GetLinkedRef().GetLinkedRef(LinkCustom01).Enable()
    ;Register for 0 fire health
    RegisterForActorValueLessThanEvent(GetLinkedRef(), Test_FireHealth, MassiveDamageThreshold) ;In case the barrel takes enough external damage to explode.
EndFunction

Function Puncture()
    barrelPunctured = true
    GetLinkedRef().RestoreValue(Test_FireHealth, 100 - (GetLinkedRef().GetValue(Test_FireHealth))) ; Get the diffrerence and add it back on.
    RegisterForActorValueLessThanEvent(GetLinkedRef(), Test_FireHealth, DamageThreshold)
    GetLinkedRef().PlaceAtMe(TRP_Puddle_Flammable_01_Packin)
EndFunction

Function Freeze()
    ;Do Frozen Barrel FX stuff here.
    isFrozen = true
    barrelPunctured = false
    UnregisterForActorValueLessThanEvent(GetLinkedRef(), Test_FireHealth, DamageThreshold)
    if(onFire)
        GetLinkedRef().GetLinkedRef(LinkCustom01).Disable()
    EndIf
EndFunction


;Resist all damage types at something like 50% except piercing. Once it has 90% piercing health remaining, then, lower resistances on some types. And, be vulnerable to catching on fire...