Scriptname RL040TriggerScript extends ReferenceAlias

ObjectReference Property myEnableMarker Mandatory Const Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    myEnableMarker.Enable()
    utility.Wait(0.1)
    GetOwningQuest().SetStage(20)
EndEvent