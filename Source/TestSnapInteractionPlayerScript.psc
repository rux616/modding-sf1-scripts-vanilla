Scriptname TestSnapInteractionPlayerScript extends ReferenceAlias

Event OnSit(ObjectReference akFurniture)
  GetOwningQuest().SetStage(10)
EndEvent