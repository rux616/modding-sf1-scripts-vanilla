Scriptname FactionAttacksPCWithActorScript extends Actor conditional
{If the Actor enters a given location then the specified faction goes temporarily hostile to the player}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

	if ( akNewLoc == pLocation )
		pMessage.Show()
		pFactionToGoHostile.SetPlayerEnemy()
	endif

EndEvent

Location Property pLocation Auto
Faction Property pFactionToGoHostile Auto Conditional
Message Property pMessage Auto Conditional
