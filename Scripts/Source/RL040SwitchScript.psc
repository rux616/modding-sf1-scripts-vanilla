Scriptname RL040SwitchScript extends ReferenceAlias

ObjectReference Property myEnableMarker Mandatory Const Auto
ObjectReference Property PirateSceneTrigger Mandatory Const Auto

Event OnActivate(ObjectReference akActionRef)
    self.GetReference().BlockActivation(true, true)
    PirateSceneTrigger.Disable()
    myEnableMarker.Enable()
    GetOwningQuest().SetStage(30)
EndEvent