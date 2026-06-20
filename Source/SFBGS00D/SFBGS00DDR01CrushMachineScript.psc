Scriptname SFBGS00D:SFBGS00DDR01CrushMachineScript extends ObjectReference
{Handles movement helpers and functionality for the Crushing Machine}

Keyword Property SFBGS00DDR001_LinkHelperKeyword auto const mandatory
{Use a LinkedRefChain with this keyword for crusher AnimHelpers}
Keyword Property SFBGS00DDR001_LinkTriggerKeyword auto const mandatory
{LinkedRef to the first kill trigger with this keyword, the rest are enable parented to it}
Keyword Property SFBGS00DDR001_HelperExclusionKeyword auto const mandatory
{Add this keyword to an AnimHelper ref to exclude it from randomized start - used to sync certain crushers}
Keyword Property SFBGS00DDR001_LinkSwitchKeyword auto const mandatory
{Links to switch that sets the power state of dummy}

Int CrusherCount = 0

Event OnCellLoad()
    if(IsPowered())
        StartCrushers()
    endif
    RegisterForRemoteEvent(GetLinkedRef(SFBGS00DDR001_LinkSwitchKeyword), "OnActivate")
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

Event OnPowerOn(ObjectReference akPowerGenerator)
    StartCrushers()
EndEvent

;Stops all crushers moving, disables actor kill triggers
Event OnPowerOff()
    ObjectReference[] CrushMachineHelperArray = GetLinkedRefChain(SFBGS00DDR001_LinkHelperKeyword)
    ;all kill triggers are enable parented to a single one
    GetLinkedRef(SFBGS00DDR001_LinkTriggerKeyword).DisableNoWait()
    ;stop all crushers
    int i = 0
    while(i < CrushMachineHelperArray.Length)
        StopMovement(CrushMachineHelperArray[i])
        i+=1
    endwhile
EndEvent

;Starts all crushers moving, enable actor kill triggers
Function StartCrushers()
    ObjectReference[] CrushMachineHelperArray = GetLinkedRefChain(SFBGS00DDR001_LinkHelperKeyword)
    ;all kill triggers are enable parented to a single one
    GetLinkedRef(SFBGS00DDR001_LinkTriggerKeyword).EnableNoWait()
    ;start crushers
    int i = 0
    while(i < CrushMachineHelperArray.Length)
        if(CrushMachineHelperArray[i].HasKeyword(SFBGS00DDR001_HelperExclusionKeyword))
            StartTimer(1, i)
        else
            StartTimer(Utility.RandomInt(0,4), i)
        endif
        i+=1
    endwhile
EndFunction

Function StartMovement(ObjectReference akHelper)
    akHelper.PlayAnimation("Play01")
EndFunction

Function StopMovement(ObjectReference akHelper)
    ;listen for event that indicates crusher is in a position to stop with no anim snapping
    RegisterForAnimationEvent(akHelper, "Loop01")
EndFunction

Function CheckCrusherCount()
    ObjectReference[] CrushMachineHelperArray = GetLinkedRefChain(SFBGS00DDR001_LinkHelperKeyword)
    CrusherCount+=1
    if(CrusherCount >= CrushMachineHelperArray.Length)
        GetLinkedRef(SFBGS00DDR001_LinkSwitchKeyword).BlockActivation(false, false)
        GotoState("Waiting")
        CrusherCount = 0
    endif
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    ;stops movement
    if(asEventName == "Loop01")
        akSource.PlayAnimation("StateA_Idle")
        UnregisterForAnimationEvent(akSource, "Loop01")
        CheckCrusherCount()
    endif
EndEvent

Event OnTimer(int aiTimerID)
    ObjectReference[] CrushMachineHelperArray = GetLinkedRefChain(SFBGS00DDR001_LinkHelperKeyword)
    StartMovement(CrushMachineHelperArray[aiTimerID])
    CheckCrusherCount()
EndEvent