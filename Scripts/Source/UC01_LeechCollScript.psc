Scriptname UC01_LeechCollScript extends RefCollectionAlias

int Property StageToSet Mandatory Const Auto
{Stage to set once this collecting is cleared}

Event OnObjectDestroyed(ObjectReference akSenderRef, ObjectReference akReference)
    RemoveRef(akSenderRef)
    int iCount = GetCount()

    if iCount <= 0
        GetOwningQuest().SetStage(StageToSet)
    endif
EndEvent

