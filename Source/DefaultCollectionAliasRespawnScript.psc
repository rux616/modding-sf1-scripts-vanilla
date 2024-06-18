Scriptname DefaultCollectionAliasRespawnScript extends RefCollectionAlias Default
{Script for respawning this collection alias.  For use along with a quest that has the DefaultQuestRespawnScript attached to it.}

Group Optional_Properties
	bool Property RespawningOn = true Auto  
	{Set to false to stop this alias from auto-respawning when it dies
	defaults to TRUE}
EndGroup

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
	Debug.Trace("Respawning actor OnDeath")
	if RespawningOn
		defaultQuestRespawnScript myQuest = GetOwningQuest() as defaultQuestRespawnScript
		if myQuest
			myQuest.TryToRespawnCollection(self, akSenderRef as Actor)
		else
			Game.Warning(self + " ERROR: quest is not a defaultQuestRespawnScript")
		endif
	endif
endEvent
