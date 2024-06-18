Scriptname DefaultActivateSelfOnHit extends Actor Default
{The ref activates itself on hit, typically to trigger an ambush from an ActivateParented actor.}

bool property DoOnce = True auto const

Event OnUnload()
	UnregisterForAllHitEvents()
EndEvent

Auto State Initial
	Event OnLoad()
		if Is3DLoaded()
			RegisterForHitEvent(self) ; listen for a single hit event, any source
		EndIf
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		Debug.Trace("DN070: OnHit event on " + akTarget + " from " + akAggressor)
		Self.Activate(Self)
		if (doOnce)
			GoToState("Done")
		else
			RegisterForHitEvent(self) ; listen for another hit event now
		EndIf
	EndEvent
EndState

State Done
	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
		;Do nothing.
	EndEvent
EndState
