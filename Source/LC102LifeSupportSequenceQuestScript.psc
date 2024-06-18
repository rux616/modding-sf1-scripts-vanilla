Scriptname LC102LifeSupportSequenceQuestScript extends Quest
{Quest for life support sequence in CF04. Controls FX for the LC102 life support machines, and the state change for the lockdown sequence.}

group AutofillProperties
    ReferenceAlias Property Alias_LifeSupportMachine01_FXEnableMarker Auto Const Mandatory
    ReferenceAlias Property Alias_LifeSupportMachine02_FXEnableMarker Auto Const Mandatory
    ReferenceAlias Property Alias_LifeSupportMachine03_FXEnableMarker Auto Const Mandatory
    ReferenceAlias Property Alias_LockdownEnableMarker Auto Const Mandatory
    ReferenceAlias Property Alias_LifeSupportMachine01Activator Auto Const Mandatory
    ReferenceAlias Property Alias_LifeSupportMachine02Activator Auto Const Mandatory
    ReferenceAlias Property Alias_LifeSupportMachine03Activator Auto Const Mandatory
endGroup

group TimingProperties
    float Property LockdownWaitSeconds = 2.0 auto const mandatory
endGroup

group QuestProperties
    Quest property CF04 auto const mandatory
    int property stageToSetOnMachine01Disabled = 121 auto const mandatory
    int property stageToSetOnMachine02Disabled = 122 auto const mandatory
    int property stageToSetOnMachine03Disabled = 123 auto const mandatory
    int property stageToSetOnInitiateLockdown = 130 auto const mandatory
endGroup

int lifeSupportMachineActivations = 0
int maxLifeSupportMachineActivations = 3

function IncrementLifeSupportMachineActivations()
    lifeSupportMachineActivations = lifeSupportMachineActivations + 1
endFunction

function RegisterForLifeSupportMachineActivations()
    ObjectReference lifeSupportMachine01Activator = Alias_LifeSupportMachine01Activator.GetRef()
    ObjectReference lifeSupportMachine02Activator = Alias_LifeSupportMachine02Activator.GetRef()
    ObjectReference lifeSupportMachine03Activator = Alias_LifeSupportMachine03Activator.GetRef()

    RegisterForRemoteEvent(lifeSupportMachine01Activator, "OnActivate")
    RegisterForRemoteEvent(lifeSupportMachine02Activator, "OnActivate")
    RegisterForRemoteEvent(lifeSupportMachine03Activator, "OnActivate")
EndFunction

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
    ObjectReference lifeSupportMachine01Activator = Alias_LifeSupportMachine01Activator.GetRef()
    ObjectReference lifeSupportMachine02Activator = Alias_LifeSupportMachine02Activator.GetRef()
    ObjectReference lifeSupportMachine03Activator = Alias_LifeSupportMachine03Activator.GetRef()

    if(akSender == lifeSupportMachine01Activator)
        DeactivateLifeSupportMachine(akSender, Alias_LifeSupportMachine01_FXEnableMarker.GetRef(), stageToSetOnMachine01Disabled)
    elseif(akSender == lifeSupportMachine02Activator)
        DeactivateLifeSupportMachine(akSender, Alias_LifeSupportMachine02_FXEnableMarker.GetRef(), stageToSetOnMachine02Disabled)
    elseif(akSender == lifeSupportMachine03Activator)
        DeactivateLifeSupportMachine(akSender, Alias_LifeSupportMachine03_FXEnableMarker.GetRef(), stageToSetOnMachine03Disabled)
    endIf
EndEvent

function DeactivateLifeSupportMachine(ObjectReference lifeSupportMachineActivator, ObjectReference lifeSupportMachine_FXEnableMarker, int stageToSet)
    UnregisterForRemoteEvent(lifeSupportMachineActivator, "OnActivate")
    
    lifeSupportMachine_FXEnableMarker.Disable()
    
    IncrementLifeSupportMachineActivations()

    CF04.SetStage(stageToSet)

    if(lifeSupportMachineActivations == maxLifeSupportMachineActivations)
        InitiateLockdown()
    endIf
endFunction

function InitiateLockdown()
    Utility.Wait(LockdownWaitSeconds)

    Alias_LockdownEnableMarker.GetRef().Enable()

    CF04.SetStage(stageToSetOnInitiateLockdown)
endFunction