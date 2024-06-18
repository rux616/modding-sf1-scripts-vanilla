Scriptname LC088_DefensiveBatteryAliasScript extends ReferenceAlias
{Script to toggle the Defensive Batteries' Laser Fire.}

Group AutofillProperties
	VisualEffect property FX_ShipExplosionHugeBattery Auto Const Mandatory
EndGroup

Event OnDying(ObjectReference akKiller)
	ObjectReference selfRef = GetReference()
	FX_ShipExplosionHugeBattery.Play(selfRef)
	Utility.Wait(5)
	selfRef.Disable()
EndEvent