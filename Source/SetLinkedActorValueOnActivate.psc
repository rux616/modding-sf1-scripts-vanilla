Scriptname SetLinkedActorValueOnActivate extends ObjectReference Const
{Sets a specific actor value on the linked reference chain to a specific value on activate.}

ActorValue Property ActorValueToSet Auto Const Mandatory
Keyword Property LinkCustom01 Const Auto
Float Property NewValue = 1.0 Const Auto

Event OnActivate(ObjectReference akActionRef)
    ObjectReference[] linkedrefs = self.GetLinkedRefChain(LinkCustom01)
    int index = 0
    While (index < linkedrefs.Length)
        ObjectReference target = linkedrefs[index]
        target.SetValue(ActorValueToSet, NewValue)
        (target as Actor).EvaluatePackage()
        index += 1
    EndWhile    
EndEvent
