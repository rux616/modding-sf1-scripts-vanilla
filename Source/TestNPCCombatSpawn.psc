Scriptname TestNPCCombatSpawn extends ObjectReference Const

Event OnActivate(ObjectReference akActionRef)
	ObjectReference SpawnControllerFromLink = self.GetLinkedRef()
	;utility.wait(3)
		if(SpawnControllerFromLink)
			(SpawnControllerFromLink as TestNPCArenaScript).SpawnTeams(self)
		endif
	
EndEvent