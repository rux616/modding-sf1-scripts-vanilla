Scriptname TrapBreakableStructure extends TrapBase
{Breakable Structure trap script, structure breaks when it is hit by dt_structural damage)}

Group TrapCatwalkScriptData
    Keyword Property LinkCustom01 Mandatory Const Auto
    {Link from pivot to the catwalk segment}
    Keyword Property LinkCustom02 Mandatory Const Auto
    {Link from pivot to the NAVCUT volume}

    ActorValue Property Stim_Health_Structural Mandatory Const Auto
    ;Using a special structure damage type to work around the scaling damage of weapons.
EndGroup


Function HandleOnLoad()
    ;Register for different damage types that the tank responds to at the start. (Add other damage types soon)
    ;All the health AVs have to be on the tank itself, because of the Secondary Damage List.
    if bDisarmed == false
        ObjectReference BreakableSegment = GetLinkedRef(LinkCustom01)
        GetLinkedRef(LinkCustom02).Disable()
        RegisterForActorValueLessThanEvent(BreakableSegment, Stim_Health_Structural, 100.0)
        ;Register for any change in value below the default value of the actorvalue.
    endif
EndFunction

Function HandleOnUnload()
    ObjectReference BreakableSegment = GetLinkedRef(LinkCustom01)

    UnregisterForActorValueLessThanEvent(BreakableSegment, Stim_Health_Structural, 100.0)
;Replace With Specific Damage Stim Responses? Energy, Ballistic.
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    debug.trace(self + "Actor Value Less Than Event")
        BreakStructure()
EndEvent

Function BreakStructure()
    ;Handles breaking the catwalk
    debug.trace(self + "Break Structure")
    Disarm()

    GetLinkedRef(LinkCustom01).Disable()
    GetLinkedRef(LinkCustom02).Enable()
EndFunction