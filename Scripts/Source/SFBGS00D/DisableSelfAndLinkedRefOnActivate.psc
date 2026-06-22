Scriptname SFBGS00D:DisableSelfAndLinkedRefOnActivate extends ObjectReference Const
{Mold blobs that explode when you get too close or shoot them}

Explosion Property pExplosion Auto Const Mandatory
MiscObject Property CraftingIngredient Auto Const Mandatory
Float Property floatdistance = 1.0 Auto Const
Float Property floatTimer = 0.4 Auto Const

Event OnLoad()
	ObjectReference PlayerRef = Game.GetPlayer()
	RegisterForHitEvent(Self, PlayerRef, abMatch = true)
	RegisterForDistanceLessThanEvent(Self, PlayerRef, floatdistance)
EndEvent

Event OnUnload()
	UnregisterAll()
EndEvent

Event OnActivate(ObjectReference akActionRef)
	ObjectReference PlayerRef = Game.GetPlayer()
	if akActionRef == PlayerRef
		Self.DisableNoWait()
		Self.GetLinkedRef().DisableNoWait()
		PlayerRef.AddItem(CraftingIngredient)
		UnregisterAll()
	endif
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	BlowUp()
EndEvent

Function BlowUp()
	Self.PlaceAtMe(pExplosion)
	Utility.Wait(floatTimer)
	Self.DisableNoWait()
	Self.GetLinkedRef().DisableNoWait()
	UnregisterAll()
EndFunction

Function UnregisterAll()
	UnregisterForDistanceEvents(Self, Game.GetPlayer())
	UnregisterForAllHitEvents()
EndFunction