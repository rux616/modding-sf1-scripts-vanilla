Scriptname UC02_PlayerAliasScript extends ReferenceAlias

ReferenceAlias Property Terrormorph Mandatory Const Auto
{Ref alias for the Terrormorph}

int Property StageToSet = 550 Const Auto
{Stage to set when the player gains LOS with the Terrormorph}

Event OnAliasInit()
    RegisterForDirectLOSGain(GetRef(), Terrormorph.GetRef())
EndEvent

Event OnGainLOS(ObjectReference akViewer, ObjectReference akTarget)
    if akViewer == GetRef() && akTarget == Terrormorph.GetRef()
        UnregisterForLOS(GetRef(), Terrormorph.GetRef())
        GetOwningQuest().SetStage(StageToSet)
    EndIf
EndEvent