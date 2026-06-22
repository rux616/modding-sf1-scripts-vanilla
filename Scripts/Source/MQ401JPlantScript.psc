Scriptname MQ401JPlantScript extends ReferenceAlias

Message Property MQ401JPlantActivatePrompt Mandatory Const Auto

Auto State WaitingForPlayer
    Event OnLoad()
        GotoState("HasbeenTriggered")
        ObjectReference MyRef = Self.GetRef()
        MyRef.SetActivateTextOverride(MQ401JPlantActivatePrompt)
        MyRef.BlockActivation()
    EndEvent
EndState

State HasBeenTriggered
    Event OnLoad()
        ;do nothing
    EndEvent
EndState