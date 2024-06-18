Scriptname FXPlaceExplosionOnDeath extends ActiveMagicEffect Const
{Places a activator on death.}

Explosion Property PlacedActivator Auto Const Mandatory


Event OnDying(ObjectReference akKiller)
	Actor targetActor = GetTargetActor()
	If targetActor
		targetActor.PlaceAtMe(PlacedActivator)
	EndIf
EndEvent