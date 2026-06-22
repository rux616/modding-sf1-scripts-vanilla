Scriptname SFBGS00D:SFBGS00DDR01GrindMachineScript extends ObjectReference
{Handles rotation helpers and functionality for the Grinding Machine}

Keyword Property LinkCustom01 auto const mandatory
{Links to sound marker}
Keyword Property SFBGS00DDR001_LinkHelperKeyword auto const mandatory
{Use a LinkedRefChain with this keyword for grinder AnimHelpers}
Keyword Property SFBGS00DDR001_LinkTriggerKeyword auto const mandatory
{Links to kill trigger}
Keyword Property SFBGS00DDR001_LinkSwitchKeyword auto const mandatory
{Links to switch that sets the power state of dummy}

Event OnCellLoad()
    if(IsPowered())
        StartGrindMachine()
    endif
    RegisterForRemoteEvent(GetLinkedRef(SFBGS00DDR001_LinkSwitchKeyword), "OnActivate")
EndEvent

Event OnUnload()
    StopGrindMachine()
EndEvent

Auto State Waiting

    Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
        GetLinkedRef(SFBGS00DDR001_LinkSwitchKeyword).BlockActivation(true, true)
        GotoState("Busy")
    EndEvent

EndState

State Busy
EndState

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    ;do nothing
EndEvent

Event OnPowerOff()
    StopGrindMachine()
EndEvent

Event OnPowerOn(ObjectReference akPowerGenerator)
    StartGrindMachine()
EndEvent

;Starts all rotation helpers, enable actor kill trigger
Function StartGrindMachine()
    ObjectReference[] GrindMachineRotationHelperArray = GetLinkedRefChain(SFBGS00DDR001_LinkHelperKeyword)
    GetLinkedRef(SFBGS00DDR001_LinkTriggerKeyword).EnableNoWait()
    ;audio on
    GetLinkedRef(LinkCustom01).Enable()
    int i = 0
    while(i < GrindMachineRotationHelperArray.Length)
        StartRotationHelper(GrindMachineRotationHelperArray[i])
        i+=1
    endwhile
    GetLinkedRef(SFBGS00DDR001_LinkSwitchKeyword).BlockActivation(false, false)
    GotoState("Waiting")
EndFunction

;Stops all rotation helpers, disable actor kill trigger
Function StopGrindMachine()
    ObjectReference[] GrindMachineRotationHelperArray = GetLinkedRefChain(SFBGS00DDR001_LinkHelperKeyword)
    GetLinkedRef(SFBGS00DDR001_LinkTriggerKeyword).DisableNoWait()
    ;audio off
    GetLinkedRef(LinkCustom01).Disable()
    int i = 0
    while(i < GrindMachineRotationHelperArray.Length)
        StopRotationHelper(GrindMachineRotationHelperArray[i])
        i+=1
    endwhile   
    GetLinkedRef(SFBGS00DDR001_LinkSwitchKeyword).BlockActivation(false, false)
    GotoState("Waiting")
EndFunction

Function StartRotationHelper(ObjectReference akHelper)
    akHelper.SetAnimationVariableFloat("Speed", 0.2)
    akHelper.PlayAnimation("RotateCW_Loop")
EndFunction

 Function StopRotationHelper(ObjectReference akHelper)
    akHelper.SetAnimationVariableFloat("Speed", 0.0)
    akHelper.PlayAnimation("RotateCW_Loop")
 EndFunction
