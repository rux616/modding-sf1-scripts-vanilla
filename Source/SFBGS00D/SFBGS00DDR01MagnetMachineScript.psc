Scriptname SFBGS00D:SFBGS00DDR01MagnetMachineScript extends ObjectReference
{Controls movement and behavior of the magnet}

Int Property MachineResetSeconds = 60 auto const
{Machine will automatically turn off after this many seconds}
Keyword Property SFBGS00DDR001_LinkHelperKeyword auto const mandatory
Keyword Property LinkCustom01 auto const mandatory
{Links to Power Switch that turns on machine}
Keyword Property LinkCustom02 auto const mandatory
{Links to door to room containing machine}

Event OnCellLoad()
    RegisterForRemoteEvent(GetLinkedRef(LinkCustom01), "OnActivate")
EndEvent

Auto State Waiting

    Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
        GetLinkedRef(LinkCustom01).BlockActivation(true, true)
        GotoState("Busy")
    EndEvent
    
EndState

State Busy
EndState

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    ;do nothing
EndEvent

;Starts Magnet moving
Event OnPowerOn(ObjectReference akPowerGenerator)
    StartMovement()
EndEvent

;Stops Magnet moving
Event OnPowerOff()
    StopMovement()
EndEvent

Function StartMovement()
    ObjectReference MagnetMachineHelper = GetLinkedRef(SFBGS00DDR001_LinkHelperKeyword)
    MagnetMachineHelper.PlayAnimation("Play01")
    ;close door leading to room
    GetLinkedRef(LinkCustom02).SetOpen(false)
    StartTimer(MachineResetSeconds)
    GetLinkedRef(LinkCustom01).BlockActivation(false, false)
    GotoState("Waiting")
EndFunction

Function StopMovement()
    ObjectReference MagnetMachineHelper = GetLinkedRef(SFBGS00DDR001_LinkHelperKeyword)
    ;wait for magnet to be in a position that is valid for stopping movement with no anim snapping
    RegisterForAnimationEvent(MagnetMachineHelper, "Stage01_Off")
    CancelTimer()
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    ObjectReference MagnetMachineHelper = GetLinkedRef(SFBGS00DDR001_LinkHelperKeyword)
    if(akSource == MagnetMachineHelper)
        if(asEventName == "Stage01_Off")
            ;stop anim and stop audio
            akSource.PlayAnimation("Play02")
            akSource.PlayAnimation("Stage01_Stop")
            UnregisterForAnimationEvent(MagnetMachineHelper, "Stage01_Off")
            ;open door leading to room
            GetLinkedRef(LinkCustom02).SetOpen()
            ;unblock switch
            GetLinkedRef(LinkCustom01).BlockActivation(false, false)
            GotoState("Waiting")
        endif
    endif
EndEvent

;turn off machine after 60 seconds
Event OnTimer(int aiTimerID)
    GetLinkedRef(LinkCustom01).SetOpen()
EndEvent