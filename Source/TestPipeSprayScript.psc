Scriptname TestPipeSprayScript extends ObjectReference

Keyword Property LinkTraps Mandatory Const Auto
ActorValue Property Health Mandatory Const Auto
ActorValue Property HAZ_AV_Broken Mandatory Const Auto
ActorValue Property HAZ_AV_Pressurized Mandatory Const Auto

;Tweakable Data
float Property DamageThreshold = 90.0 Const Auto


Event OnLoad()
    ObjectReference PipeSegment = GetLinkedRef()
    RegisterForActorValueLessThanEvent(PipeSegment, Health, DamageThreshold)
    RegisterForRemoteEvent(GetLinkedRef(LinkTraps), "OnActivate")
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    ;Disable the pipe segment
    GetLinkedRef().Disable()
    SetValue(HAZ_AV_Broken, 1.00)
    if(GetValue(HAZ_AV_Pressurized) == 1.00)
        StartSpray()
    EndIf
    
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    ;toggle pressure
    if(GetValue(HAZ_AV_Pressurized) == 1.00)
        SetValue(HAZ_AV_Pressurized, 0.00)
        StopSpray()
    Else
        SetValue(HAZ_AV_Pressurized, 1.00)
        if (GetValue(HAZ_AV_Broken) == 1.00)
            StartSpray()
        EndIf
    EndIf
EndEvent

Function StartSpray()
    GetLinkedRef().GetLinkedRef().Enable()
EndFunction

Function StopSpray()
    GetLinkedRef().GetLinkedRef().Disable()
EndFunction

