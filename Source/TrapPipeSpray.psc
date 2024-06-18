Scriptname TrapPipeSpray extends TrapBase

Group TrapPipeSprayData
    ActorValue Property Health Mandatory Const Auto
    ActorValue Property TRP_AV_Broken Mandatory Const Auto
    ActorValue Property TRP_AV_Pressurized Mandatory Const Auto
    Keyword Property TrapStartUnbrokenKeyword Mandatory Const Auto
    {Add this keyword to the reference if the pipe segment should start unbroken.}
    Keyword Property LinkCustom01 Mandatory Const Auto
    {Link to FX}
    Keyword Property LinkCustom02 Mandatory Const Auto
    {Link to Hazard}
    Keyword Property LinkCustom03 Mandatory Const Auto
    {Link to Weak PipeSegment}

    ;Tweakable Data
    float Property DamageThreshold = 99.0 Const Auto
    ; Add A Start Broken and Start Depressurized Options. Based on Keywords.
endGroup

; override parent function
function HandleOnLoad()
    ObjectReference PipeSegment = GetLinkedRef(LinkCustom03)
    GetLinkedRef(LinkCustom02).Disable()
    SetValue(TRP_AV_Pressurized, 1.00) ;Start Pressurized
        Debug.Trace(self + "Setting TRP_AV_Pressurized to: " + GetValue(TRP_AV_Pressurized))
    RegisterForActorValueLessThanEvent(PipeSegment, Health, DamageThreshold)
;Replace With Specific Damage Stim Responses? Energy, Ballistic.

    if HasKeyword(TrapStartUnbrokenKeyword) == false
        BreakPipe()
    EndIf
endFunction

; override parent function
function HandleOnUnload()
    StopSpray()
endFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    Debug.Trace(self + "OnActorValueLessThan")
    ;Disable the pipe segment
    BreakPipe()
EndEvent

; override parent function
Function BecomeActive()
    SetValue(TRP_AV_Pressurized, 1.00)
    if (GetValue(TRP_AV_Broken) == 1.00)
        StartSpray()
    EndIf
endFunction

; override parent function
Function BecomeInactive()
    SetValue(TRP_AV_Pressurized, 0.00)
    StopSpray()
endFunction

Function BreakPipe()
    ;Handles breaking the pipe.
    GetLinkedRef(LinkCustom03).Disable()
    SetValue(TRP_AV_Broken, 1.00)
    ; don't change state here - but if pressurized ("active"), start spray
    if(GetValue(TRP_AV_Pressurized) == 1.00)
        StartSpray()
    EndIf
EndFunction

Function StartSpray()
    Debug.Trace(self + "Start Spray")
    ;The emitter linked to the pivot.
    GetLinkedRef(LinkCustom01).PlayAnimation("Play01")
    ;Enable the Hazard through a link from the pivot.
    GetLinkedRef(LinkCustom02).Enable()
    ;Start the FX Sequence
EndFunction

Function StopSpray()
    Debug.Trace(self + "Stop Spray")
    ;Disable the Hazard
    GetLinkedRef(LinkCustom02).Disable()
    GetLinkedRef(LinkCustom01).PlayAnimation("StopEffect")
EndFunction

