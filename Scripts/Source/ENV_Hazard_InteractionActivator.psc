Scriptname ENV_Hazard_InteractionActivator extends ObjectReference Const

Function PlaceObject(Form FormToSpawn, ObjectReference RefToSpawnNear = None)
		if RefToSpawnNear == None
			RefToSpawnNear = Game.GetPlayer()
		endif

		;get markers linked to it, then spawn the closest to the RefToSpawnNear

		ObjectReference[] childrenRefs = GetRefsLinkedToMe(None)

		ObjectReference closestRef = GetClosestFromRefArray(RefToSpawnNear, childrenRefs)

		closestRef.PlaceAtMe(FormToSpawn, abSnapOffsetToNavmesh=false)

		;turn off
		Disable()
EndFunction

ObjectReference Function GetClosestFromRefArray(ObjectReference SubjectRef, ObjectReference[] TargetsArray)
	
	ObjectReference closestRef

	float closestDistance = 0.0

	int i = 0
	While (i < TargetsArray.length)

		ObjectReference currentTargetRef = TargetsArray[i]

		if closestRef == None
			closestRef = currentTargetRef
			closestDistance = closestRef.GetDistance(SubjectRef)
		elseif currentTargetRef.GetDistance(SubjectRef) < closestDistance
			closestRef = currentTargetRef
			closestDistance = closestRef.GetDistance(SubjectRef)
		endif

		i += 1
	EndWhile

	return closestRef
EndFunction