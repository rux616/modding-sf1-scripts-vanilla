Scriptname City_AkilaLife05Script extends Quest

ActorValue Property ProduceUses Auto Const Mandatory
Int Property RockCurrent Auto
Int Property RockTotal Auto
GlobalVariable Property AkilaLife05_RocksCurrent Auto Const Mandatory
RefCollectionAlias Property RocksCollection Auto Const

Function RegisterRocks()
    ; The rocks are flora - and the way to track to see if they've been disabled is via registering an actor value event
    Int i
    Int iCount = RocksCollection.GetCount()
    Debug.Trace("Starting registering rocks.")
    While i < iCount
        Debug.Trace("Rock added: " + RocksCollection.GetAt(i) )
        RegisterForActorValueLessThanEvent(RocksCollection.GetAt(i), ProduceUses, 1)
        i+=1
    EndWhile    
EndFunction

Event OnQuestStarted()

    RegisterRocks()

EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
    akObjRef.Disable()
    RockCurrent += 1
    ModObjectiveGlobal(1, AkilaLife05_RocksCurrent, 300)
    If RockCurrent >= RockTotal
        SetStage(300)
    EndIf
EndEvent