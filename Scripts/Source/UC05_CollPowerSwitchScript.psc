Scriptname UC05_CollPowerSwitchScript extends RefCollectionAlias

int Property AllPowerBackOnStage = 600 Const Auto
{All power's back on. Set the player up to head downstairs}

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    RemoveRef(akSenderRef)

    if GetCount() == 0
        GetOwningQuest().SetStage(AllPowerBackOnStage)
    EndIf
EndEvent