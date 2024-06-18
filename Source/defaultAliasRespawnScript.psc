Scriptname defaultAliasRespawnScript extends ReferenceAlias Default
{Script for respawning this alias.  For use along with a quest that has the DefaultQuestRespawnScript attached to it.}

Group Optional_Properties
	bool Property RespawningOn = true Auto  
	{Set to false to stop this alias from auto-respawning when it dies
	defaults to TRUE}
EndGroup

function RespawnIfDead()
 	debug.trace(self + " RespawnIfDead")
	if GetActorRef().IsDead()
		defaultQuestRespawnScript myQuest = GetOwningQuest() as defaultQuestRespawnScript
		gotoState("respawning")
		myQuest.Respawn(self)
		gotoState("normal")
	else
 		debug.trace(self + "RespawnIfDead: I'm not dead - " + GetActorRef() + ".IsDead()=" + GetActorRef().IsDead())
	endif
endFunction


auto state normal

Event OnDeath(ObjectReference akKiller)
	Debug.Trace("Respawning actor OnDeath")
	if RespawningOn
		defaultQuestRespawnScript myQuest = GetOwningQuest() as defaultQuestRespawnScript
		gotoState("respawning")
		myQuest.TryToRespawn(self)
		gotoState("normal")
	endif
endEvent

endState

state respawning

Event OnDeath(ObjectReference akKiller)
endEvent

endState

