Scriptname ForceLegendaryActorScript extends Actor Const

LegendaryAliasQuestScript Property LegendaryAliasQuest Mandatory Const Auto

Event OnLoad()
	if IsDead() == false
		LegendaryAliasQuest.MakeLegendary(self)
	endif
EndEvent

Event OnDeath(ObjectReference akKiller)
	LegendaryAliasQuest.RemoveLegendary(self)
EndEvent