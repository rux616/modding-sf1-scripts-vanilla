Scriptname TestNPCChangeType extends ObjectReference Const

ActorBase[] property NPCTypes auto Const Mandatory

ObjectReference Property SpawnController auto const Mandatory

Function CycleNPCType()

	int index = NPCTypes.Find((SpawnController as TestNPCSimpleSpawn).ActorToSpawn)

	if(index + 1 >= NPCTypes.Length-1)
		index = 0
	else
		index += 1
	EndIf
	(SpawnController as TestNPCSimpleSpawn).ActorToSpawn = NPCTypes[index]
EndFunction