Scriptname TrapExplodingProximity extends TrapExplodingBase
{Adds the ability to trigger an explosion based on proximity}

group TrapExplodingProximityData
    Keyword Property LinkCustom01 Mandatory Const Auto
    {Link Keyword from pivot to living or dead actor trigger}
    Keyword Property LinkCustom02 Mandatory Const Auto
    {Link Keyword from pivot to projectile trigger}
    Float Property TimeToExplode = 0.0 Const Auto
    {Number of seconds until explosion}
    bool Property ProjectileProximityTrigger = true Const Auto
EndGroup

Function HandleOnLoad()
    RegisterForRemoteEvent(GetLinkedRef(), "OnActivate")
    if(GetLinkedRef(LinkCustom01))
        RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnTriggerEnter")
    EndIf
    if(GetLinkedRef(LinkCustom02))
        RegisterForRemoteEvent(GetLinkedRef(LinkCustom02), "OnTriggerEnter")
    EndIf
    ;Catch when the flora is harvested
    parent.HandleOnLoad()
EndFunction

Function HandleOnUnload()
    UnregisterForRemoteEvent(GetLinkedRef(), "OnActivate")
    UnregisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnTriggerEnter")
    UnregisterForRemoteEvent(GetLinkedRef(LinkCustom02), "OnTriggerEnter")
    parent.HandleOnUnload()
EndFunction

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    ;Plant is harvested, make trap inactive
    ;TODO End Danger State (SFX, FX)
    UnregisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnTriggerEnter")
    UnregisterForRemoteEvent(GetLinkedRef(LinkCustom02), "OnTriggerEnter")
    UnregisterForRemoteEvent(GetLinkedRef(), "OnActivate")
    Disarm() ; parent function
EndEvent

Event OnTimer(int aiTimerID)
    if (bDisarmed == false)
    ;TODO End Danger State (SFX, FX)
        Explode()
    EndIf
EndEvent

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
    debug.trace(self + " Exploding Flora Proximity Event" + akSender + "   " + akActionRef)
    if(TimeToExplode > 0)
        StartTimer(TimeToExplode)
        UnregisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnTriggerEnter")
        UnregisterForRemoteEvent(GetLinkedRef(LinkCustom02), "OnTriggerEnter")
        ;TODO Start Danger State (SFX, FX)
    Else
        Explode()
    EndIf
EndEvent


