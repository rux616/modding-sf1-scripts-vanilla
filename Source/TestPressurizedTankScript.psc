Scriptname TestPressurizedTankScript extends ObjectReference

;Related Assets
Explosion Property Test_Fire_Sm_CannisterExplosion Mandatory Const Auto

;AV Health Values to Track
ActorValue Property Test_PiercingHealth Mandatory Const Auto
ActorValue Property Test_FireHealth Mandatory Const Auto
ActorValue Property Test_CryoHealth Mandatory Const Auto

;Tweakable Data
float Property DamageThreshold = 99.0 Const Auto
float Property CryoDamageThreshold = 80.0 Const Auto

bool tankPunctured = false

Event OnLoad()
    ObjectReference Tank = GetLinkedRef()
    ; Register for different damage types that the tank responds to at the start. (Add other damage types soon)
    ;All the health AVs have to be on the tank itself, because of the Secondary Damage List.
    RegisterForActorValueLessThanEvent(Tank, Test_PiercingHealth, DamageThreshold)
    RegisterForActorValueLessThanEvent(Tank, Test_FireHealth, DamageThreshold)
    RegisterForActorValueLessThanEvent(Tank, Test_CryoHealth, CryoDamageThreshold)
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
;This catches all the various damage types and their thresholds.

    if(akActorValue == Test_CryoHealth)
        if(GetLinkedRef().GetValue(Test_CryoHealth) <= CryoDamageThreshold)
            Freeze()
        EndIf
    EndIf
    if(akActorValue == Test_PiercingHealth)
        if(GetLinkedRef().GetValue(Test_PiercingHealth) <= DamageThreshold)
            Puncture()
        EndIf
    EndIf
    if(akActorValue == Test_FireHealth)
        if((GetLinkedRef().GetValue(Test_FireHealth) <= DamageThreshold))
            Puncture()
        EndIf
    EndIf
EndEvent


Function Explode()
    ;Make an Explosion
    ;Eventually, swap tank model to destroyed version.
    GetLinkedRef().PlaceAtMe(Test_Fire_Sm_CannisterExplosion)
EndFunction

Function Puncture()
    ;Apply impulse over and over for a few seconds, then call Explode()
    tankPunctured = true
    int count = 0
    While (count < 30)
        GetLinkedRef().ApplyHavokImpulse(1.0, 0.0, 0.0, 10.0)
        Utility.Wait(0.1)
        count += 1
    EndWhile
    UnRegisterForActorValueLessThanEvent(GetLinkedRef(), Test_PiercingHealth, DamageThreshold)
    UnRegisterForActorValueLessThanEvent(GetLinkedRef(), Test_FireHealth, DamageThreshold)
    GetLinkedRef().ApplyHavokImpulse(1.0, 0.0, 0.0, 0.0)
    Explode()
EndFunction

Function Freeze()
    ;Set piercing and fire health to 10 due to tank being frozen.
    GetLinkedRef().SetValue(Test_PiercingHealth, 150)
    GetLinkedRef().SetValue(Test_FireHealth, 150)
    ;Re-register for AV less than event.
    RegisterForActorValueLessThanEvent(GetLinkedRef(), Test_PiercingHealth, DamageThreshold)
    RegisterForActorValueLessThanEvent(GetLinkedRef(), Test_FireHealth, DamageThreshold)
EndFunction