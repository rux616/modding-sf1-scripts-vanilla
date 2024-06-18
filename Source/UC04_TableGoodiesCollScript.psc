Scriptname UC04_TableGoodiesCollScript extends RefCollectionAlias

Event OnContainerChanged(ObjectReference akSenderRef, ObjectReference akNewContainer, ObjectReference akOldContainer)
    ;If anything on this table gets picked up, remove it from this collection (so it won't get disabled at the end of the quest)
    RemoveRef(akSenderRef)
EndEvent