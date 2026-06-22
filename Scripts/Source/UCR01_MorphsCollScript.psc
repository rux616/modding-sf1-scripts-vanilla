Scriptname UCR01_MorphsCollScript extends RefCollectionAlias

Event OnLoad(ObjectReference akSenderRef)
    Actor currACT = akSenderRef as Actor
    if currAct && !currACT.GetNoBleedoutRecovery()
        currACT.SetNoBleedoutRecovery(true)
    endif
EndEvent