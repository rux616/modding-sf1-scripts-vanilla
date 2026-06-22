Scriptname LC165ShiftingTriggerScript extends ObjectReference
{Script for the memory space shifting triggers in LC165, Buried Temple.}

Group ReferenceProperties
	String property ShiftName Auto Const
	{Name of the shift to trigger.}

	int property DisableStage Auto Const
	{When this stage is set, disable this trigger and its linked chain of distortion vfx.}

	int property DistortionID = -1 Auto Const
	{When the player enters this distortion, call LC165QuestScript's DistortionEntered function with this ID to update objectives.}

	ReferenceAlias property ActorToStopCombatWith01 Auto Const
	{Actor to stop combat with when the player enters this distortion.}

	ReferenceAlias property ActorToStopCombatWith02 Auto Const
	{Actor to stop combat with when the player enters this distortion.}

	RefCollectionAlias property ActorsToStopCombatWith Auto Const
	{Actors to stop combat with when the player enters this distortion.}
EndGroup

Group AutofillProperties CollapsedOnRef
	LC165ShiftingQuestScript property MQ302B Auto Const Mandatory
EndGroup

;Local variables
Actor[] stopCombatWith


Event OnLoad()
	RegisterForRemoteEvent(MQ302B, "OnStageSet")

	;Build our actor array.
	stopCombatWith = ActorsToStopCombatWith.GetArray() as Actor[]
	if (stopCombatWith == None)
		stopCombatWith = new Actor[0]
	EndIf
	if (ActorToStopCombatWith01 != None)
		stopCombatWith.Add(ActorToStopCombatWith01.GetActorRef())
	EndIf
	if (ActorToStopCombatWith02 != None)
		stopCombatWith.Add(ActorToStopCombatWith02.GetActorRef())
	EndIf	
EndEvent

Event OnUnload()
	stopCombatWith = None
EndEvent

Event OnTriggerEnter(ObjectReference akTriggerRef)
	;Find the closest linked distortion to the player and play the VFX with that as its source.
	;Also, stop combat with actors as needed.
	ObjectReference[] linkedDistortions = GetLinkedRefChain()
	if ((linkedDistortions == None) || (linkedDistortions.Length == 0))
		MQ302B.ShiftTo(ShiftName, distortionID=DistortionID, stopCombatWith=stopCombatWith)
	ElseIf (linkedDistortions.Length == 1)
		MQ302B.ShiftTo(ShiftName, distortion=linkedDistortions[0], distortionID=DistortionID, stopCombatWith=stopCombatWith)
	Else
		ObjectReference closestDistortion = linkedDistortions[0]
		float closestDistortionDistance = Game.GetPlayer().GetDistance(closestDistortion)
		int i = 1
		While (i < linkedDistortions.Length)
			ObjectReference currentDistortion = linkedDistortions[i]
			float currentDistortionDistance = Game.GetPlayer().GetDistance(currentDistortion)
			if (currentDistortionDistance < closestDistortionDistance)
				closestDistortion = currentDistortion
				closestDistortionDistance = currentDistortionDistance
			EndIf
			i = i + 1
		EndWhile
		MQ302B.ShiftTo(ShiftName, distortion=closestDistortion, distortionID=DistortionID, stopCombatWith=stopCombatWith)
	EndIf
EndEvent

Event Quest.OnStageSet(Quest akSource, int auiStageID, int auiItemID)
	if ((akSource == MQ302B) && (auiStageID == DisableStage))
		DisableNoWait()
		ObjectReference[] linkedDistortions = GetLinkedRefChain()
		int i = 0
		While (i < linkedDistortions.Length)
			linkedDistortions[i].DisableNoWait()
			i = i + 1
		EndWhile
	EndIf
EndEvent