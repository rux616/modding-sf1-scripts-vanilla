Scriptname GenericBrawlPlayerScript extends ReferenceAlias

import game

GenericBrawlScript myQuest

Event OnAliasInit()
	myQuest = GetOwningQuest() as GenericBrawlScript

	RegisterForHitEvent(self, myQuest.Opponent, abMatch = false) ; anyone other then the opponent hits us
	RegisterForHitEvent(self, myQuest.OpponentFriend, abMatch = false) ; anyone other then the opponent's friend hits us
	RegisterForMagicEffectApplyEvent(self, GetPlayer(), abMatch = false) ; anyone other then the player uses magic
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	; if the player is hit by anyone but the brawlers
	if akAggressor != myQuest.Opponent.GetRef() && akAggressor != myQuest.OpponentFriend.GetRef()
		debug.trace(self + " player hit by someone not in the brawl - end Brawl")
		myQuest.SetStage(myQuest.EndBrawlStage)
	else
		; go around for another try
		RegisterForHitEvent(self, myQuest.Opponent, abMatch = false) ; anyone other then the opponent hits us
		RegisterForHitEvent(self, myQuest.OpponentFriend, abMatch = false) ; anyone other then the opponent's friend hits us
	endif

endEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
	; if player is hit with any magic effect (not by himself)
	if akCaster != GetPlayer()
		debug.trace(self + " hit with magic - end Brawl")
		myQuest.SetStage(myQuest.CheatingStage)
	endif
endEvent

Event OnEnterBleedout()
	Debug.Trace("player enters bleedout")
	myQuest.SetStage(myQuest.PlayerDefeatedStage)
EndEvent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if Game.GetPlayer().IsInLocation(myQuest.Opponent.GetActorRef().GetCurrentLocation()) == False
		Debug.Trace(self + "Player has left opponent's location, shutting down")
		myQuest.SetStage(myQuest.EndBrawlStage)
	endIf
endEvent
