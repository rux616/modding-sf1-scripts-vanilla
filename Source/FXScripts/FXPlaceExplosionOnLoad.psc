Scriptname FXScripts:FXPlaceExplosionOnLoad extends ActiveMagicEffect Const
{Places a activator on death.}

Explosion Property PlacedExplosion Auto Const Mandatory

Event OnLoad()
	Actor targetActor = GetTargetActor()
	If targetActor
		targetActor.PlaceAtMe(PlacedExplosion)
	EndIf
EndEvent