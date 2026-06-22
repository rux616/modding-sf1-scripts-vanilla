Scriptname City_AkilaLife01_ThiefScript extends ReferenceAlias

Quest Property City_AkilaLife01 Auto Const Mandatory


Event OnLoad()
	RegisterForHitEvent(aktarget=Self)
EndEvent



Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)

	if Self.GetActorRef().IsBleedingout()>0
		City_AkilaLife01.SetStage(160)
		Debug.Trace("Akila Thief hit while down, stage set")
		RegisterForHitEvent(aktarget=Self)
	else
		RegisterForHitEvent(aktarget=Self)
	endif

EndEvent