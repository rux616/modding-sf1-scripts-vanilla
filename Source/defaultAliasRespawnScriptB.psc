Scriptname defaultAliasRespawnScriptB extends ReferenceAlias Default
{Script for respawning this alias.  For use along with a quest that has the DefaultQuestRespawnScript attached to it.}

Group Optional_Properties
	bool Property RespawningOn = true Auto  
	{Set to false to stop this alias from auto-respawning when it dies
	defaults to TRUE}
EndGroup

function RespawnIfDead()
 	debug.trace(self + " RespawnIfDead")
	if GetActorRef().IsDead()
		defaultQuestRespawnScript myQuest = GetOwningQuest() as defaultQuestRespawnScriptB
		gotoState("respawning")
		myQuest.Respawn(self)
		gotoState("normal")
	else
 		;debug.trace(self + "RespawnIfDead: I'm not dead - " + GetActorRef() + ".IsDead()=" + GetActorRef().IsDead())
	endif
endFunction


auto state normal

Event OnDeath(ObjectReference akKiller)
	Debug.Trace("Respawning actor OnDeath")
	if RespawningOn
		defaultQuestRespawnScript myQuest = GetOwningQuest() as defaultQuestRespawnScriptB
		;Debug.Trace("Respawning On and Quest = " + myQuest)
		gotoState("respawning")
		;Debug.Trace("Making call : " + myQuest + ", " + self)
		myQuest.TryToRespawn(self)
		;Debug.Trace("Finished call : " + myQuest + ", " + self)
		gotoState("normal")
	endif
endEvent

endState

state respawning

Event OnDeath(ObjectReference akKiller)
	;Debug.Trace("Ignoring OnDeath for " + Self)
endEvent

endState