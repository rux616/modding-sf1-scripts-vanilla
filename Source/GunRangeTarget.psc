Scriptname GunRangeTarget extends ObjectReference
{Detects projectiles on hit and sends back score}

;******************************************************

Group Optional_Properties
	Int Property ScorePerHit = 1 Auto Const
		{Score earned per hit}
EndGroup

;******************************************************

ObjectReference Counter

;******************************************************

Event OnLoad()
    RegisterForHitEvent(Self, Game.GetPlayer())
	Counter = GetLinkedRef()
EndEvent

;******************************************************

Event OnUnload()
    UnregisterForAllHitEvents()
EndEvent

;******************************************************

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)

	Debug.Trace("Hit target")
	If ((Counter As GunRangeCounter).QuestToSet.GetCurrentStageID() == (Counter As GunRangeCounter).StageToStartCompetition)

		Debug.Trace("Hit registered")
		(Counter As GunRangeCounter).GunRangeCompetition(ScorePerHit)
	 	RegisterForHitEvent(Self, Game.GetPlayer())

	EndIf

EndEvent