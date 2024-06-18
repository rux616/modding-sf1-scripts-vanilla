Scriptname DefaultCollectionAliasAddPerkOnLoad extends RefCollectionAlias Const Default

Perk property PerkToAdd auto const
{The perk that should be added to actors in the collection upon load.}

Event OnLoad(ObjectReference akSenderRef)
	if ((akSenderRef as Actor) != None)
		(akSenderRef as Actor).AddPerk(PerkToAdd)
	EndIf
EndEvent