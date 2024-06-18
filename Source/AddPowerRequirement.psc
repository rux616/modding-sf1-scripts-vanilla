Scriptname AddPowerRequirement extends ObjectReference Const
{Make this activator inaccessible if it does not have power.}

Keyword Property LinkToPowerSource Mandatory Const Auto
Message Property PowerRequiredMessage Mandatory Const Auto

Guard UpdatePowerGuard ProtectsFunctionLogic

Event OnCellLoad()
    ;Set self to the correct powered/unpowered state on start based on the linked power source.
    if(GetLinkedRef(LinkToPowerSource).IsPowered() == false)
        BlockActivation()
        SetActivateTextOverride(PowerRequiredMessage)
    endif
    RegisterForRemoteEvent(GetLinkedRef(LinkToPowerSource), "OnPowerOn")
    RegisterForRemoteEvent(GetLinkedRef(LinkToPowerSource), "OnPowerOff")
EndEvent

Event OnUnload()
    UnregisterForAllEvents()
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSender, ObjectReference akPowerGenerator)
    StartTimer(0.3)
EndEvent

Event ObjectReference.OnPowerOff(ObjectReference akSender)
    StartTimer(0.3)
EndEvent

Event OnTimer(int aiTimerID)
    UpdatePowerState()
EndEvent

Function UpdatePowerState()
    LockGuard UpdatePowerGuard
        if(GetLinkedRef(LinkToPowerSource).IsPowered())
            SetActivateTextOverride(None)
            BlockActivation(false)
        Else
            BlockActivation()
            SetActivateTextOverride(PowerRequiredMessage)
        EndIf
    EndLockGuard
EndFunction


