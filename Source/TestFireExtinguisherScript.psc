Scriptname TestFireExtinguisherScript extends ObjectReference Const

;Related Assets
Explosion Property Test_Fire_Sm_CannisterExplosion Mandatory Const Auto

;AV Health Values to Track
ActorValue Property Test_PiercingHealth Mandatory Const Auto
ActorValue Property Test_FireHealth Mandatory Const Auto
ActorValue Property Test_CryoHealth Mandatory Const Auto

;Tweakable Data
float Property DamageThreshold = 99.0 Const Auto
float Property CryoDamageThreshold = 70.0 Const Auto

Event OnLoad()
    GetLinkedRef().SetValue(Test_PiercingHealth, 100)
    GetLinkedRef().SetValue(Test_FireHealth, 100)
    GetLinkedRef().SetValue(Test_CryoHealth, 100)
    ObjectReference tank = GetLinkedRef()

    ; Register for different damage types that the tank responds to at the start. (Add other damage types soon)
    ;All the health AVs have to be on the tank itself, because of the Secondary Damage List.
    RegisterForActorValueLessThanEvent(tank, Test_PiercingHealth, DamageThreshold)
    RegisterForActorValueLessThanEvent(tank, Test_FireHealth, DamageThreshold)
    RegisterForActorValueLessThanEvent(tank, Test_CryoHealth, CryoDamageThreshold)
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
            Explode()
        EndIf
    EndIf
    if(akActorValue == Test_FireHealth)
        if((GetLinkedRef().GetValue(Test_FireHealth) <= DamageThreshold))
            Explode()
        EndIf
    EndIf
EndEvent


Function Explode()
    ;Make an Explosion
    GetLinkedRef().PlaceAtMe(Test_Fire_Sm_CannisterExplosion)
EndFunction

Function Freeze()
    ObjectReference tank = GetLinkedRef()
    ;Set piercing and fire health to 150 due to tank being frozen.
    GetLinkedRef().SetValue(Test_PiercingHealth, 150)
    GetLinkedRef().SetValue(Test_FireHealth, 150)
    ;Re-register for AV less than event.
    RegisterForActorValueLessThanEvent(tank, Test_PiercingHealth, DamageThreshold)
    RegisterForActorValueLessThanEvent(tank, Test_FireHealth, DamageThreshold)
EndFunction