Scriptname LegendaryAliasQuestScript extends Quest

ReferenceAlias Property ForceLegendaryAlias Mandatory Auto Const

Keyword Property LegendaryActorAliasApplied auto const mandatory

Function MakeLegendary(actor ActorToMakeLegendary)
	if ActorToMakeLegendary.HasKeyword(LegendaryActorAliasApplied) == false
		debug.trace(self + " MakeLegendary " + ActorToMakeLegendary)
		ForceLegendaryAlias.ApplyToRef(ActorToMakeLegendary)
	endif
EndFunction

Function RemoveLegendary(actor ActorToRemoveLegendary)
	ForceLegendaryAlias.RemoveFromRef(ActorToRemoveLegendary)
EndFunction