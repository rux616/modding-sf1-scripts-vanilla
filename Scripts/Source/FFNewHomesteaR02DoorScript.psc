Scriptname FFNewHomesteaR02DoorScript extends RefCollectionAlias

Int Property PreReqStage Auto Const Mandatory
ReferenceAlias Property Tourist01 Mandatory Const Auto
ReferenceAlias Property Tourist02 Mandatory Const Auto
ReferenceAlias Property Tourist03 Mandatory Const Auto

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
    If akActionRef == Tourist01.GetRef() || akActionRef == Tourist02.GetRef() || akActionRef == Tourist03.GetRef()
        Quest OwningQuest = GetOwningQuest()
        If OwningQuest.GetStageDone(PreReqStage)
            akActionRef.Disable()
        EndIf
    EndIf
EndEvent
