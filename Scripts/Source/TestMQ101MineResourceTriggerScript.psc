Scriptname TestMQ101MineResourceTriggerScript extends ObjectReference

;temp script for mining resources in Vectera for the vertical slice
;eventually will be replaced with a permanent system

LeveledItem Property TestMQ101MineralDeposit Auto 
Actor PlayerREF

Function GainMinerals()
	PlayerREF.AddItem(TestMQ101MineralDeposit)
	Self.Disable()
EndFunction

Auto State waitingForPlayer

	Event OnInit()
		PlayerREF = Game.GetPlayer()
		RegisterForHitEvent(akTarget=Self, akAggressorFilter=PlayerREF)
	EndEvent

	Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
		If akAggressor == PlayerREF
			gotoState("hasbeentriggered")
			GainMinerals()
		EndIf
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		If akActionRef == PlayerREF
			gotoState("hasbeentriggered")
			GainMinerals()
		EndIf
	EndEvent

EndState

State hasbeentriggered
	;empty state
EndState