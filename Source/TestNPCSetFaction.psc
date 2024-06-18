Scriptname TestNPCSetFaction extends ObjectReference Const

ObjectReference Property SpawnController auto const Mandatory

FormList Property FactionClassesFormList auto const Mandatory

int Property TeamNumber auto const Mandatory
{1. Red Team, 2. Blue Team}

Event OnActivate(ObjectReference akActionRef)
	(SpawnController as TestNPCArenaScript).SetFactionToSpawn(FactionClassesFormList, TeamNumber)
EndEvent