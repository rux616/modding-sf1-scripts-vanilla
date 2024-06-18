Scriptname Artifact01_ActivatorScript extends ObjectReference Const

Event OnLoad()
	RegisterForHitEvent(Self)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	;play animation every time it's hit
	Self.PlayAnimation("Play02")
	RegisterForHitEvent(Self)
EndEvent