Scriptname FXPlaceActivatorOnDeath extends ActiveMagicEffect Const
{Places a activator on death.}

Activator Property PlacedActivator Auto Const Mandatory


Event OnDeath(ObjectReference akKiller)
	Actor targetActor = GetTargetActor()
	If targetActor
		targetActor.PlaceAtMe(PlacedActivator)
	EndIf
EndEvent