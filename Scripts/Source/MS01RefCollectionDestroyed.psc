Scriptname MS01RefCollectionDestroyed extends RefCollectionAlias

Event OnDestroyed(ObjectReference akSenderRef, ObjectReference akDestroyer)
  Debug.Trace("OnDestroyed fired for MS01")
	if ((GetCount() <= 1) )
		GetOwningQuest().SetStage(StageToSet)
    Else   
        Self.RemoveRef(akSenderRef)
	EndIf

EndEvent

Int Property StageToSet Auto Const
