Scriptname MQ101ArtifactMineralBedScript extends RefCollectionAlias

ReferenceAlias Property ArtifactDeposit Auto Const Mandatory

ObjectReference[] TriggeredRefArray
int TriggeredRefArrayIndex = -1

Event OnDestructionStageChanged(ObjectReference akSenderRef, int aiOldStage, int aiCurrentStage)
	;set a stage when all the minerals blocking access to the Artifact have been sufficiently damaged
	if aiCurrentStage >= 3
		; we're in a RefCollection, so do a collection check
		if TriggeredRefArray == NONE
			; not yet initialized, so do that first - initialize to size of ref collection
			TriggeredRefArray = new ObjectReference[GetCount()]
			TriggeredRefArrayIndex = 0
		endif
		if TriggeredRefArray.Find(akSenderRef) < 0
			; not already in triggered array, meaning this is new - so add to array
			TriggeredRefArray[TriggeredRefArrayIndex] = akSenderRef
			TriggeredRefArrayIndex += 1
		endIf
		; if we've filled the array - everything's been triggered - set the stage
		if TriggeredRefArrayIndex >= TriggeredRefArray.Length
			GetOwningQuest().SetStage(42)
			;allow the artifact to be picked up (triggering the vision)
			(ArtifactDeposit.GetRef() as BuriedArtifact).PickupEnabled = true
		endIf
  	endif
EndEvent