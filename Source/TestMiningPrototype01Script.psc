Scriptname TestMiningPrototype01Script extends ObjectReference
{Spawn ore that the player has to pickup}

Faction Property CurrentCompanionFaction Auto Const Mandatory
Int MineralAmount
MiscObject Property MineralType Auto Const Mandatory

Function myRegisterForHit()
	;we want to know if the player or the player's companion ever hits the Mineral Deposit
	RegisterForHitEvent(self, Game.GetPlayer())
	RegisterForHitEvent(self, CurrentCompanionFaction)
EndFunction

Event OnInit()
	myRegisterForHit()

	;create a random amount of minerals in this deposit
	MineralAmount = Utility.RandomInt(1, 3)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string apMaterial)
	;pop all the ore at the linked xmarker and disable
	Self.GetLinkedRef().PlaceAtMe(MineralType, MineralAmount)
	Self.Disable()
EndEvent