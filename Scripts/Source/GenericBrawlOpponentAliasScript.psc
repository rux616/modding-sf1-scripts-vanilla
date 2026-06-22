Scriptname GenericBrawlOpponentAliasScript extends ReferenceAlias

int property BrawlUpdateTimerID = 1 auto const
float property BrawlUpdateTime = 2.0 auto const

Faction Property GenericBrawlFaction Auto

import game

GenericBrawlScript myQuest

Event OnAliasInit()
	debug.trace(self + " OnAliasInit")
	myQuest = GetOwningQuest() as GenericBrawlScript
	RegisterForHitEvent(self) ; let us know when anyone hits us
	RegisterForMagicEffectApplyEvent(self) ; let us know when anyone hits us with a spell
EndEvent

function StartUpdateTimer(bool bStartTimer = true)
	if bStartTimer
		StartTimer(BrawlUpdatetime, BrawlUpdateTimerID)
	else
		CancelTimer(BrawlUpdateTimerID)
	endif
endFunction

Event OnTimer(int aiTimerID)
	if aiTimerID == BrawlUpdateTimerID
		actor pActor = GetActorRef()
		if pActor.IsInCombat() == 0 && pActor.IsBleedingOut() == 0 && myQuest.GetStage() < 15
	 		debug.trace(self + " is no longer in combat, ending brawl, player loses")
			; end quest - player loses
			myQuest.SetStage(myQuest.PlayerDefeatedStage)
		else
			StartTimer(BrawlUpdatetime, BrawlUpdateTimerID)
		endif
	endif
endEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
 	debug.trace(self + " hit by " + akAggressor + " with weapon = " + akWeapon + ", Projectile = " + akProjectile)
	; if the player hits with any weapon other than hands
		Actor pActor = GetActorRef()
		Actor pPlayer = GetPlayer()
		if (akAggressor == pPlayer) || (myQuest.PlayerAllies.Find(akAggressor) > -1)
; 			debug.trace(self + " hit with weapon = " + akWeapon + ", Projectile = " + akProjectile)
			if akProjectile || (akWeapon && akWeapon != (myQuest as GenericBrawlScript).Unarmed)
 				debug.trace(self + " hit with weapon or projectile - end brawl")
				pPlayer.RemoveFromFaction(GenericBrawlFaction)
				pActor.RemoveFromFaction(GenericBrawlFaction)
				pActor.StopCombat()
				pActor.SendAssaultAlarm()
				pActor.StartCombat(Game.GetPlayer())
				myQuest.SetStage(myQuest.CheatingStage)
			else
				debug.trace(self + " fair hit - reregister for OnHit event")
				RegisterForHitEvent(self) ; go around for another try
			endif
		else
			; if hit by anybody else, end quest
 			debug.trace(self + " hit by " +akAggressor + " with weapon or projectile - end Intimidate")
			myQuest.SetStage(myQuest.CheatingStage)
		endif
endEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
	; if player hits with any magic effect
		if (akCaster == GetPlayer() || (myQuest.PlayerAllies.Find(akCaster) > -1))
			debug.trace(self + " hit with magic effect " + akEffect + " from " + akCaster + " - end brawl")
			myQuest.SetStage(myQuest.CheatingStage)
		endif 	
endEvent

Event OnEnterBleedout()
	debug.trace(self + "OnEnterBleedout")
	myQuest.SetStage(myQuest.PlayerWinsStage)
	GetActorReference().EvaluatePackage() ; to make sure the forcegreet happens
EndEvent
