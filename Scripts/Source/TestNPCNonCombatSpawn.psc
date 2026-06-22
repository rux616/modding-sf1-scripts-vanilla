Scriptname TestNPCNonCombatSpawn extends ObjectReference Const

ObjectReference Property SpawnController auto const Mandatory

bool Property SpawnOnLoad = false auto const

int Property GroupSize = 1 auto const
{Number of NPCs to spawn per group}

ObjectReference Property LinkRefHub auto const Mandatory
{Contains the linked references chain to the spawners, which in turn has the references to the patrols}

Event OnLoad()
	if (SpawnOnLoad)
		Utility.Wait(1) ; Give an extra moment to process all the NPC spawns in each group.
		(SpawnController as TestNPCArenaScript).SpawnNonCombatActors(GroupSize, LinkRefHub)
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	(SpawnController as TestNPCArenaScript).SpawnNonCombatActors(GroupSize, LinkRefHub)
EndEvent