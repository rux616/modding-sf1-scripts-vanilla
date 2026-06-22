Scriptname TestNPCPlayerSettings extends ObjectReference Const

bool Property PlayerIsEnemy = false auto const
{True = NPCs will be Hostile to Player}
bool Property isToggle = false auto const
{True = Each activation will toggle NPC relation to player}

Event OnLoad()
	;ObjectReference SpawnControllerFromLink = self.GetLinkedRef()
	;if(SpawnControllerFromLink)
	;	(SpawnControllerFromLink as TestNPCArenaScript).VersusPlayer = PlayerIsEnemy
	;endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
    ObjectReference SpawnControllerFromLink = self.GetLinkedRef()
	bool treatPlayerAsEnemy = PlayerIsEnemy
	if(SpawnControllerFromLink)
		if(isToggle)
			treatPlayerAsEnemy = !((SpawnControllerFromLink as TestNPCArenaScript).VersusPlayer)
		endif
        (SpawnControllerFromLink as TestNPCArenaScript).VersusPlayer = treatPlayerAsEnemy
    endif
EndEvent