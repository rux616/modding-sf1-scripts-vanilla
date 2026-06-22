Scriptname FFCydoniaZ07QuestScript extends Quest

ActorValue Property ProduceUses Mandatory Const Auto
ReferenceAlias Property HeartOfMars Mandatory Const Auto
Int Property ReturnStage = 300 Const Auto


Function RegisterOre()
    RegisterForActorValueLessThanEvent(HeartOfMars.GetRef(), ProduceUses, 1)
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    Debug.Trace("The actor value" + akActorValue + " on " + akObjRef + " has changed to " + akObjRef.GetValue(akActorValue))
    akObjRef.Disable()
    SetStage(ReturnStage)
EndEvent