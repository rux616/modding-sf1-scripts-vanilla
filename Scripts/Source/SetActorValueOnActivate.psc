Scriptname SetActorValueOnActivate extends ObjectReference

ActorValue Property ActorValueToSet Auto Const Mandatory
Keyword Property TargetLinkKeyword Mandatory Const Auto

auto State Holding
    Event OnActivate(ObjectReference akActionRef)
    GotoState("Moving")
    ObjectReference[] linkedrefs = self.GetLinkedRefChain(TargetLinkKeyword)
    int index = 0
        While (index < linkedrefs.Length)
            ObjectReference target = linkedrefs[index]
            target.SetValue(ActorValueToSet, 1)
            (target as Actor).EvaluatePackage()
            index += 1
        EndWhile    
    EndEvent
EndState

State Moving
    Event OnActivate(ObjectReference akActionRef)
    GotoState("Holding")
    ObjectReference[] linkedrefs = self.GetLinkedRefChain(TargetLinkKeyword)
    int index = 0
        While (index < linkedrefs.Length)
            ObjectReference target = linkedrefs[index]
            target.SetValue(ActorValueToSet, 0)
            (target as Actor).EvaluatePackage()
            index += 1
        EndWhile    
    EndEvent
EndState